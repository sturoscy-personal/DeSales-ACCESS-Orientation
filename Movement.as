this.butMc.but0._visible = false;
function initBut():Void {
	_root.firstPrj = 1;
	var maxWidth:Number = 0;
	for (i=1; i<=_root.nrPoze; i++) {
		var mc:MovieClip = this.butMc.but0.duplicateMovieClip("but"+i, i);
		mc._visible = false;
		mc.mcTxt.txt.htmlText = i;
		if (mc.mcTxt.txt.textWidth>maxWidth) {
			maxWidth = mc.mcTxt.txt.textWidth;
		}
		mc.mcTxt.setColor(_root.culoareNormala);
		mc.nr = i;
		mc.mcRound.but.onRelease = function() {
			if (_root.k != this._parent._parent.nr && _root.moveProjectButs == true) {
				this.enabled = false;
				_root.loadImage(this._parent._parent.nr);
				moveForward();
				_root.pauseSlideControlled();
			}
		};
		mc.mcRound.but.onRollOver = function() {
			if (_root.k != this._parent._parent.nr && _root.moveProjectButs == true) {
				this._parent._parent.mcTxt.setColor(_root.culoareOver);
			}
		};
		mc.mcRound.but.onRollOut = function() {
			if (_root.k != this._parent._parent.nr && _root.moveProjectButs == true) {
				this._parent._parent.mcTxt.setColor(_root.culoareNormala);
			}
		};
		mc.mcRound.but.onReleaseOutside = mc.mcRound.but.onRollOut;
	}
	//
	_root.nrDist = maxWidth+15;
	_root.lastPrj = Math.round(_root.availableWidth/_root.nrDist);
	_root.rememberLast = _root.lastPrj;
	for (i=1; i<=_root.nrPoze; i++) {
		var mc:MovieClip = this.butMc["but"+i];
		mc.mcRound._width = _root.nrDist-4;
		mc.mcTxt._x = Math.round((_root.nrDist-mc.mcTxt.txt.textWidth)/2)-3;
		mc._x = Math.round((i-1)*(_root.nrDist));
		mc._visible = true;
	}
	//
	//_root.projectsMc.butMc.but1.mcTxt.setColor(_root.culoareSchimbare);
	//_root.projectsMc.butMc.but1.mcRound.gotoAndStop(2);
	//_root.projectsMc.butMc.but1.mcRound.but.enabled = false;
}
//
function moveForward():Void {
	// last shown project is pressed
	if (_root.k == _root.lastPrj && _root.lastPrj != _root.nrPoze && _root.moveProjectButs == true) {
		i = _root.k-_root.lastPrj;
		_root.moveProjectButs = false;
		_root.projectsMc.butMc.onEnterFrame = function() {
			if (i<=_root.k+1) {
				xt = _root.nrDist*(i-_root.firstPrj-1);
				this["but"+i].elastic({_x:xt}, 2);
				i++;
			} else {
				delete this.onEnterFrame;
				_root.lastPrj = _root.k+1;
				_root.firstPrj++;
				_root.moveProjectButs = true;
			}
		};
	}
	// first shown project is pressed                                                                                                                                                           
	if (_root.k == _root.firstPrj && _root.firstPrj != 1 && _root.moveProjectButs == true) {
		i = _root.k+_root.lastPrj;
		_root.moveProjectButs = false;
		_root.projectsMc.butMc.onEnterFrame = function() {
			if (i>=_root.k-1) {
				xt = _root.nrDist*(i-_root.firstPrj+1);
				this["but"+i].elastic({_x:xt}, 2);
				i--;
			} else {
				delete this.onEnterFrame;
				_root.lastPrj--;
				_root.firstPrj = _root.k-1;
				_root.moveProjectButs = true;
			}
		};
	}
}
// WHEN THE SLIDE GETS TO THE LAST IMAGE
function repositionImages():Void {
	i = _root.nrPoze;
	_root.moveProjectButs = false;
	_root.projectsMc.butMc.onEnterFrame = function() {
		if (i>=1) {
			xt = _root.nrDist*(i-1);
			this["but"+i].elastic({_x:xt}, 2);
			i--;
		} else {
			delete this.onEnterFrame;
			_root.moveProjectButs = true;
			_root.lastPrj = _root.rememberLast;
			_root.firstPrj = 1;
		}
	};
}
