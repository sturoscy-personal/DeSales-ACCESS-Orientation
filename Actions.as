stop();
/********************

General settings

********************/
Stage.showMenu = false;
Stage.scaleMode = "noScale";
this._lockroot = true;
//

import mx.transitions.Tween;
import mx.transitions.easing.*;
//
var stagew:Number = 608;
var stageh:Number = 200;
var nrFrames:Number = 30;
/********************

VARIABLES

********************/
var masterArray:Array = new Array();
var numePoze:Array = new Array();
var descriptionArray:Array = new Array();
var linkArray:Array = new Array();
var titleArray:Array = new Array();
var nrPoze:Number;
var firstTime:Number = -1;
//
_root.loadingTxt.embedFonts = true;
_root.loadingTxt.autoSize = true;
//
var totalTime:Number = 5;
var rolledOver:String = "";
var rolledOut:String = "";
var culoareSchimbare:String = "";
var culoareNormala:String = "";
var culoareOver:String = "";
var contPoze:Number = 1;
var k:Number = 0;
var prevValue:Number = 0;
var rand:Boolean = false;
var slideShow:Boolean = true;
var showPos:Number = 260;
var hidePos:Number = 305;
//
var moveProjectButs:Boolean = true;
var firstPrj:Number = 1;
var lastPrj:Number;
var rememberLast:Number;
var nrDist:Number;
var availableWidth:Number = _root.projectsMc.mcWidthProject._width;
//
_root.projectsMc._visible = false;
_root.cpanel._visible = false;
_root.popUpMc._visible = false;
_root.mcLoader._visible = false;
_root.mcSee._visible = false;
_root.mcShape._visible = false;
_root.firstLoaded = true;
_root.mcBack.mcText.txt.embedFonts = true;
_root.mcBack._y = _root.hidePos;
/**
Movieclip loader

*/
var listnerGallery:Object = new Object();
listnerGallery.onLoadProgress = function(target:MovieClip, bytesLoaded:Number, bytesTotal:Number):Void  {
	var pct:Number = bytesLoaded/bytesTotal*100;
	if (pct>5) {
		mcLoader._visible = true;
		mcLoader.mcBar._xscale = pct;
	}
};
listnerGallery.onLoadInit = function(mc:MovieClip) {
	if (_root.firstTime != 1) {
		mcSee._visible = true;
	}
	mcLoader.mcBar._xscale = 100;
	mcLoader._visible = false;
	if (_root.firstTime != 1) {
		if (masterArray[1][2] == "true") {
			_root.cpanel._visible = true;
		} else {
			_root.projectsMc._x = 40;
		}
		if (masterArray[1][3] == "true") {
			_root.projectsMc._visible = true;
		}
		_root.mcShape._visible = true;
	}
	_root.firstTime = 1;
	_root.captionTxt.text = _root.captionTextArray[_root.k];
	_root.nowLoading = false;
	
	
	var alphaTween:Tween = new Tween(mc, "_alpha", None.easeNone, mc._alpha, 100, 1, true);
	
	alphaTween.onMotionFinished = function() 
	{
		_root.displayBackText();
	};
	
};
var objGallery:MovieClipLoader = new MovieClipLoader();
objGallery.addListener(listnerGallery);
_root.createEmptyMovieClip("imageControl_copy", -1);
_root.imageControl_copy._x = _root.imageControl._x;
_root.imageControl_copy._y = _root.imageControl._y;
//
function displayBackText():Void {
	_root.mcBack.mcText.txt.htmlText = _root.descriptionArray[_root.k];
	if (_root.descriptionArray[_root.k] != undefined && _root.descriptionArray[_root.k] != "") {
		
		var xScaleT:Tween = new Tween(_root.mcBack, "_y", Regular.easeInOut, _root.mcBack._y, _root.showPos, 0.5, true);

		xScaleT.onMotionFinished = function() {
			_root.countTime();
		};
	
	} else {
		_root.countTime(true);
	}
}

function removeText():Void {
	var alphaTween:Tween = new Tween(_root.mcBack.mcText, "_alpha", None.easeNone, _root.mcBack.mcText._alpha, 0, 0.2, true);
	
	alphaTween.onMotionFinished = function() 
	{
		_root.hideBack();
	};
}

function hideBack():Void {
	var xScaleT:Tween = new Tween(_root.mcBack, "_y", Regular.easeOut, _root.mcBack._y, _root.hidePos, 0.5, true);

	xScaleT.onMotionFinished = function() {
		_root.loadImage();
	};
}

/********************

Parse XML

********************/
var trackXML:XML = new XML();
trackXML.ignoreWhite = true;
_root.trackXML.load("content/img/service/3.xml");
//************************************************************//
// INITIALIZATION
//************************************************************//
trackXML.onLoad = function():Void  {
	var currentNode:XMLNode = this.firstChild.firstChild;
	//
	_root.rolledOver = this.firstChild.firstChild.attributes.rolledOver;
	_root.rolledOut = this.firstChild.firstChild.attributes.rolledOut;
	_root.culoareSchimbare = "0x"+this.firstChild.firstChild.attributes.selectedColor;
	_root.culoareNormala = "0x"+rolledOut;
	_root.culoareOver = "0x"+rolledOver;
	//
	//_root.cpanel.prevBut.sign.setColor(_root.culoareNormala);
	//_root.cpanel.nextBut.sign.setColor(_root.culoareNormala);
	//_root.cpanel.pBut.sign.setColor(_root.culoareNormala);
	//
	var i:Number = 0;
	for (var childNode = currentNode; childNode != null; childNode=childNode.nextSibling, i++) {
		var j:Number = 0;
		masterArray[i] = new Array();
		j++;
		for (var stringNode = childNode.firstChild; stringNode != null; stringNode=stringNode.nextSibling, j++) {
			_root.masterArray[i][j] = stringNode.firstChild.nodeValue;
			//("masterArray["+i+"]["+j+"]"+masterArray[i][j]);
			if (i == 0) {
				_root.numePoze[j] = stringNode.attributes.content;
				_root.linkArray[j] = stringNode.attributes.link;
				_root.titleArray[j] = stringNode.attributes.title;
				_root.descriptionArray[j] = masterArray[i][j];
			}
		}
	}
	_root.nrPoze = numePoze.length-1;
	_root.totalTime = int(masterArray[1][1]);
	_root.speed = 5;
	//                                                                                                                                                                                                                                                                                                                                                                                                
	_root.loadImage(1);
	_root.projectsMc.initBut();
};
//************************************************************//
//  RANDOM BETWEEN TWO VALUES
//************************************************************//
function randomBetween(min:Number, max:Number):Number {
	var randomNum:Number = Math.round(Math.random()*(max-min)+min);
	return randomNum;
}
//************************************************************//
// LOAD IMAGES
//************************************************************//
function loadImage(val):Void {
	if (val) {
		_root.k = val;
	} else {
			_root.k++;
			if (_root.k>_root.nrPoze) {
				_root.k = 1;
				_root.projectsMc.repositionImages();
			}
	}
	//
	if (_root.linkArray[_root.k] != "" && _root.linkArray[_root.k] != undefined) {
		_root.mcSee.but.enabled = true;
		_root.mcSee.but.onRelease = function():Void  {
			getURL(_root.linkArray[_root.k], "_blank");
		};
	} else {
		_root.mcSee.but.enabled = false;
	}
	// 
	if (_root.k != _root.projectsMc.butMc["but"+val].nr && _root.moveProjectButs == true) {
		_root.projectsMc.butMc["but"+val].mcRound.but.enabled = false;
		_root.projectsMc.moveForward();
	} else {
		if (_root.k == _root.lastPrj) {
			_root.projectsMc.butMc["but"+val].mcRound.but.enabled = false;
			_root.projectsMc.moveForward();
		} else if (_root.k == 1) {
			_root.projectsMc.repositionImages();
		}
	}
	//                      
	_root.projectsMc.butMc["but"+_root.prevValue].mcRound.but.enabled = true;
	//_root.projectsMc.butMc["but"+_root.prevValue].mcTxt.setColor(_root.culoareNormala);
	_root.projectsMc.butMc["but"+_root.prevValue].mcRound.gotoAndStop(1);
	_root.prevValue = _root.k;
	//	
	_root.projectsMc.butMc["but"+_root.k].mcRound.but.enabled = false;
	//_root.projectsMc.butMc["but"+_root.k].mcTxt.setColor(_root.culoareSchimbare);
	_root.projectsMc.butMc["but"+_root.k].mcRound.gotoAndStop(2);
	//
	_root.par = _root.contPoze%2;
	_root.contPoze++;
	if (_root.par == 0) {
		_root.par = 2;
	}
	
	if (_root.numePoze[_root.k].slice(-3) == "swf") {
		_root.pauseSlideControlled();
	}
	
	_root.imageControl._alpha = 0;
	_root.mcBack._y = 305;
	_root.mcBack.mcText.txt.htmlText = "";
	delete _root.mcBack.mcText.onEnterFrame;
	delete _root.mcBack.onEnterFrame;
	_root.mcBack.mcText._alpha = 100;
	_root.objGallery.loadClip(_root.numePoze[_root.k], _root.imageControl);
	_root.nowLoading = true;
}
//************************************************************//
//  contor
//************************************************************//
function countTime(b:Boolean):Void {
	_root.contor = 0;
	_root.onEnterFrame = function() {
		if (_root.slideShow == true) {
			_root.contor++;
			if (_root.contor/_root.nrFrames == _root.totalTime) {
				if (b == true) {
					_root.loadImage();
				} else {
					_root.removeText();
				}
				delete this.onEnterFrame;
			}
		}
	};
}
//
//************************************************************//
//  CONTROL PANEL
//************************************************************//
function pauseSlide(v:Boolean):Void {
	_root.frameNumber = _root.cpanel.pBut.sign._currentframe%2+1;
	_root.cpanel.pBut.sign.gotoAndStop(_root.frameNumber);
	//
	_root.slideShow = !_root.slideShow;
	if (_root.slideShow == true) {
		var val = _root.k+1;
		if (val>_root.nrPoze) {
			val = 1;
		}
		_root.loadImage(val);
	}
}
function pauseSlideControlled():Void {
	_root.frameNumber = 2;
	_root.cpanel.pBut.sign.gotoAndStop(2);
	_root.slideShow = false;
}
//************************************************************//
// PREVIOUS BUTTON
//************************************************************//
_root.cpanel.prevBut.but.onRelease = function():Void  {
	if (_root.nowLoading == false) {
		//delete _root.imageControl.onEnterFrame;
		_root.contor = 0;
		//
		_root.k--;
		if (_root.k<1) {
			_root.k = _root.nrPoze;
		}
		//                                                                                                                                                     
		_root.loadImage(_root.k);
		_root.pauseSlideControlled();
	}
};
_root.cpanel.nextBut.but.onRelease = function():Void  {
	if (_root.nowLoading == false) {
		//delete _root.imageControl.onEnterFrame;
		_root.contor = 0;
		_root.pauseSlideControlled();
		_root.loadImage();
	}
};
_root.cpanel.pBut.but.onRelease = function():Void  {
	_root.pauseSlide();
};
