package  {
	
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	
	
	public class DocClass extends MovieClip {
		
		
		public var playScreen:AvoiderGame;
		public var gameOver:gameOverText;
		public var mainMenu:MainMenu;
		
		public function DocClass() {
			mainMenu = new MainMenu;
			mainMenu.addEventListener(NavigationEvent.START, onRequestStart);
			mainMenu.x = 200
			mainMenu.y = 150
			addChild(mainMenu);
		}
		public function onAvatarDeath (avatarEvent:AvatarEvent):void {
			var finalScore:Number = playScreen.getFinalScore();
			var finalTime:Number = playScreen.getFinalTime();
					gameOver = new gameOverText();
					gameOver.x = 200;
					gameOver.y = 150;
					gameOver.addEventListener(NavigationEvent.RESTART, requestRestart);
					gameOver.setFinalScore(finalScore);
					gameOver.setFinalTime(finalTime);
					addChild (gameOver);
					playScreen = null;
					Mouse.show();
		}
	public function requestRestart(navigationEvent:NavigationEvent):void {
		restartGame();
	}
		public function restartGame ():void {
			playScreen = new AvoiderGame;
			playScreen.addEventListener(AvatarEvent.DEAD, onAvatarDeath);
			addChild (playScreen);
			
			
		}
		public function onRequestStart(navigationEvent:NavigationEvent):void {
			playScreen = new AvoiderGame;
			playScreen.addEventListener(AvatarEvent.DEAD, onAvatarDeath);
			playScreen.x = 0
			playScreen.y = 0
			addChild(playScreen);
		}
	}
}
