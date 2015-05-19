package  {
	
	import flash.text.TextField;
	
	
	public class Time extends Counter{
		
		
		public function Time() {
			super();
		}
		override public function updateDisplay():void {
			super.updateDisplay();
			timeDisplay.text = currentValue.toString();
		}
	}
	
}
