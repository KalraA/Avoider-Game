package  {
	
	import flash.display.MovieClip;
	
	
	
	public class DocClass extends MovieClip {
		public var playScreen:AvoiderGame;
		public var gameOver:gameOverText;
		
		public function DocClass() {
			playScreen = new AvoiderGame;
			playScreen.addEventListener(AvatarEvent.DEAD, onAvatarDeath);
			addChild(playScreen);
		}
		public function onAvatarDeath (avatarEvent:AvatarEvent):void {
					gameOver = new gameOverText();
					gameOver.x = 200;
					gameOver.y = 150;
					gameOver.addEventListener(NavigationEvent.RESTART, requestRestart);
					addChild (gameOver);
					playScreen = null;
					
		}
	public function requestRestart(navigationEvent:NavigationEvent):void {
		restartGame();
	}
		public function restartGame ():void {
			playScreen = new AvoiderGame;
			playScreen.addEventListener(AvatarEvent.DEAD, onAvatarDeath);
			addChild (playScreen);
			
			
		}
	}
}
