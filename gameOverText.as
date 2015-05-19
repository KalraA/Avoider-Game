package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Mouse;
	
	public class gameOverText extends MovieClip {
		
		
		public function gameOverText() {
			restartButton.addEventListener(MouseEvent.CLICK, onRestartClick);
		}
		public function onRestartClick (mouseEvent:MouseEvent):void {
			dispatchEvent(new NavigationEvent (NavigationEvent.RESTART));
			Mouse.hide();
		}
		public function setFinalScore (scoreValue:Number):void {
			FinalScore.text = scoreValue.toString();
		}
		public function setFinalTime (timeValue:Number):void {
			FinalTime.text = timeValue.toString();
		}
	}
}
