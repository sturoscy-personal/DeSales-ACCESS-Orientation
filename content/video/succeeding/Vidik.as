class Vidik extends MovieClip {
	//
	var back:MovieClip;
	var cap:TextField;
	var cap1:TextField;
	var capColor:Color;
	var capColor1:Color;
	var captionText:String;
	var captionText1:String;
	var captionColor:Number;
	var captionColor1:Number;
	var descriptionText:String;
	//
	private var controlBar:MovieClip;
	//
	var videoFile:String;
	var previewFile:String;
	var videoDuration:Number;
	//
	var videoMc:Video;
	var preview:MovieClip;
	var myNc:NetConnection;
	var myNs:NetStream;
	var firstPlay:Boolean;
	var interval:Number;
	//
	var pointer:Object;
	var initWidth:Number;
	var initHeight:Number;
	var initX:Number;
	var initY:Number;
	var initBarX:Number;
	var initBarY:Number;
	//
	function Vidik() {
		//
		myNc = new NetConnection();
		myNc.connect(null);
		myNs = new NetStream(myNc);
		videoMc.smoothing = true;
		videoMc.attachVideo(myNs);
		firstPlay = true;
		//
     	initWidth = videoMc._width;
		initHeight = videoMc._height;
		initX = videoMc._x;
		initY = videoMc._y;
		initBarX = controlBar._x;
		initBarY = controlBar._y;
		//
	}
	
	function init(vf:String, pf:String, dt:String, ct:String, ct1:String, cc:Number, cc1:Number):Void {
		videoFile = vf;
		previewFile = pf;
		descriptionText = dt;
		captionText = ct;
		captionText1 = ct1;
		captionColor = cc;
		captionColor1 = cc1;
		//
		preview.loadMovie(previewFile);
		this.controlBar.description.txt.autoSize = true;
		this.controlBar.description.txt.text = descriptionText;
		this.controlBar.description.back._height = this.controlBar.description.txt._height+4;
		//
		//trace(this);
		cap1.text = captionText1;
	    cap.text = captionText;
		/*capColor = new Color(this.cap);
		if (captionText) {
			cap.text = captionText;
			if (captionColor) {
				capColor.setRGB(captionColor);
			}
		} else {
			cap._visible = false;
			back._height -= 14;
		}*/
		/*capColor1 = new Color(this.cap1);
		if (captionText1) {
			cap1.text = captionText1;
			if (captionColor1) {
				capColor1.setRGB(captionColor1);
			}
		} else {
			cap1._visible = false;
			back._height -= 14;
		}*/
	}
	function seekVideo(t:Number):Void{
		t = t<0?1:t;
		t = t>videoDuration?videoDuration-4:t;
		//trace(videoDuration);
		myNs.seek(t);
	}
	function pauseVideo():Void {
		if (firstPlay) {
			firstPlay = false;
			//preview._visible = false;
			myNs.play(videoFile);
			this.onEnterFrame = function():Void  {
				this.controlBar.bar.process(myNs.bytesLoaded/myNs.bytesTotal);
				if (myNs.bytesLoaded/myNs.bytesTotal == 1) {
					this.onEnterFrame = null;
				}
			};
			myNs.mc = this;
			myNs.onMetaData = function(infoObject:Object) {
				this.mc.videoDuration = infoObject.duration;
				this.mc.controlBar.bar.durationTime = infoObject.duration;
				this.mc.controlBar.bar.setBar();
			};
			interval = setInterval(this, "checkTime", 500);
		} else {
			myNs.pause();
		}
	}
	function checkTime():Void{
		this.controlBar.bar.player(myNs.time);
	}
	private function fullScreen(flag:Boolean):Void {
		if (flag) {
			//videoMc._xscale = 100;
            //videoMc._yscale = 100;
			pointer = new Object();
			pointer.x = videoMc._x;
			pointer.y = videoMc._y;
			pointer = {x:0, y:0};
			Stage.align = "TL";
			this.globalToLocal(pointer);
			preview._x = videoMc._x=pointer.x;
			preview._y = videoMc._y=pointer.y;
			preview._width = videoMc._width=Stage.width;
			preview._height = videoMc._height=Stage.height;
			//videoMc._alpha = 20;
			trace(this);
			controlBar._x = pointer.x;
			controlBar._y = pointer.y+Stage.height-47;
			controlBar.resizeBar(true);
		} else {
			Stage.align = "TL";
			preview._width = videoMc._width=initWidth;
			preview._height = videoMc._height=initHeight;
			preview._x = videoMc._x=initX;
			preview._y = videoMc._y=initY;
			controlBar._x = initBarX;
			controlBar._y = initBarY;
			controlBar.resizeBar(false);
		}
	}
}
