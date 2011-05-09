MovieClip.prototype.elastic = function(prop:Array, speed:Number, f):Void  {
	delete this.onEnterFrame;
	this.onEnterFrame = function():Void  {
		for (i in prop) {
			if (this[i] != prop[i]) {
				if (speed == 0) {
					this[i] = prop[i];
				} else {
					this[i] += (prop[i]-this[i])/speed;
				}
				if (Math.abs(this[i]-prop[i])<0.1) {
					delete this.onEnterFrame;
					if (_root.effect == "scroll") {
						_root.maskDone = true;
					}
					for (i in prop) {
						this[i] = prop[i];
					}
					f();
				}
			}
		}
	};
};

MovieClip.prototype.fade = function(dir:String, addInteger:Number, f):Void  {
	delete this.onEnterFrame;
	//this.step = (dir == "in") ? 0 : 100;
	this.step = this._alpha;
	this.onEnterFrame = function():Void  {
		this.step = (dir == "in") ? this.step+addInteger : this.step-addInteger;
		this._alpha = this.step;
		if (((dir == "in") && this._alpha>=100) || ((dir == "out") && this._alpha<=0)) {
			delete this.onEnterFrame;
			f();
		}
	};
};

function applyBlur(mc:MovieClip, val:Number) {
	blur.blurX = val;
	blur.blurY = val;
	mc.filters = [blur];
}
//
//
import flash.filters.BlurFilter;
// the quality must remain the same
var quality:Number = 3;
var bInit:Number = 2;
//
_root.imageControl.addProperty("_blur");
_root.imageControl_copy.addProperty("_blur");
_root.imageControl._blur = bInit;
_root.imageControl_copy._blur = bInit;
//
var blur:BlurFilter = new BlurFilter(bInit, bInit, quality);
//
//************************************************************//
//  STRETCH CODE
//************************************************************//
MovieClip.prototype.imageStretcher = function(path, velocity, stretch, stretched, f) {
	this.depthRemember = Math.round(Math.random()*1000000);
	this.scaleFactor = stretch == undefined ? 40 : stretch;
	this.stretchScroller = 0;
	//
	path[stretched]._xscale = 100*this.scaleFactor;
	var masker = "masker"+this.depthRemember;
	this.createEmptyMovieClip(masker, this.depthRemember++);
	with (this[masker]) {
		lineStyle(0, 0xababab);
		moveTo(path[this]._x, path[this]._y);
		beginFill(0xababab, 100);
		lineTo(this._width, path[this]._y);
		lineTo(this._width, path[this]._height);
		lineTo(path[this]._x, path[this]._height);
		lineTo(path[this]._x, path[this]._y);
		endfill();
	}
	path[stretched].setMask(this[masker]);
	var oldwidth = this[masker]._width;
	if (velocity == undefined) {
		velocity = 1.2;
	}
	_root.imageControl_copy.filters = [blur];
	this.onEnterFrame = function() {
		_root.imageControl._alpha += 10;
		if (this.stretchScroller<this._width) {
			this[masker]._x = this.stretchScroller;
			this[masker]._width = oldwidth-this.stretchScroller;
			path[stretched]._x = this._x+this.stretchScroller-(this.stretchScroller*this.scaleFactor);
			this.stretchScroller += velocity;
		} else {
			_root.imageControl._alpha = 100;
			_root.imageControl_copy._x = 480;
			delete this.onEnterFrame;
			path[stretched].removeMovieClip();
			f();
		}
	};
};
//************************************************************//
//  A NICE TYPEWRITER TEXT EFFECT
//************************************************************//
MovieClip.prototype.typewriter = function(newtext:String, oldtext:String, lspeed:Number, blinkdelay:Number, f, v):Void  {
	this.charToUse = " ";
	//
	if (oldtext == null) {
		oldtext = "";
	}
	this.temptext = oldtext;
	this.counter = 0;
	this.i = oldtext.length;
	if (lspeed == null) {
		lspeed = 1;
	}
	if (blinkdelay == null) {
		blinkdelay = 31;
	}
	this.onEnterFrame = function():Void  {
		for (mylspeed=0; mylspeed<lspeed; mylspeed++) {
			this.temptext = this.temptext+newtext.charAt(this.i);
			if (newtext.charAt(this.i) == "<") {
				htmlend = newtext.indexOf(">", this.i);
				htmladd = htmlend-this.i;
				this.i = this.i+htmladd;
				this.temptext = newtext.substr(0, this.i);
				continue;
			}
			this.i++;
		}
		this.txt.htmlText = this.temptext+this.charToUse;
		if (this.i>=newtext.length) {
			this.mybool = 1;
			this.onEnterFrame = function():Void  {
				this.counter++;
				this.mybool = !this.mybool;
				if (this.mybool == true) {
					this.txt.htmlText = this.temptext+this.charToUse;
				} else {
					this.txt.htmlText = this.temptext;
				}
				if (this.counter>=blinkdelay) {
					this.txt.htmlText = this.temptext;
					this.counter = 0;
					this.blinkremove();
					delete this["onEnterFrame"];
					f(v);
				}
			};
		}
	};
};
//
//************************************************************//
// REMOVE THE MOVIECLIP USED FOR THE TYPEWRITER EFFECT
//************************************************************//
MovieClip.prototype.blinkremove = function():Void  {
	this.onEnterFrame = function():Void  {
		this._alpha = this._alpha-10;
		this._visible = !this._visible;
		if (this._alpha<=0) {
			this.removeMovieClip();
		}
	};
};
