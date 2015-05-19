package {
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Enemy extends MovieClip {
		public function Enemy(startX:Number, startY:Number) {
			x = startX;
			y = startY;
		}
		public function moveDownABit (ySpeed:Number, xSpeed:Number):void {
			y = y + ySpeed;
			x = x + xSpeed;
		}
	}
}