package  {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	public class MainMenu extends MovieClip {
		
		
		public function MainMenu() {
			startButton.addEventListener(MouseEvent.CLICK, onStartClick);
			Mouse.show();
		}
		public function onStartClick (mouseEvent:MouseEvent):void {
			dispatchEvent(new NavigationEvent (NavigationEvent.START));
		}
	}
}
