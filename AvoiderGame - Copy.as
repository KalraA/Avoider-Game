package {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class AvoiderGame extends MovieClip {
		public var army:Array;
		public var avatar:Avatar;
		public var enemy:Enemy;
		public var gameTimer:Timer;
		public function AvoiderGame () {
			army = new Array();
			var newEnemy = new Enemy (100, -15);
			army.push(newEnemy);
			addChild (newEnemy)
			enemy = new Enemy(100, -15);
			addChild(enemy);
			avatar = new Avatar
			addChild(avatar);
			avatar.x = mouseX;
			avatar.y = mouseY;
			//Game Timer
			gameTimer = new Timer (25);
			gameTimer.addEventListener(TimerEvent.TIMER, onTick);
			gameTimer.start();
		}
		public function onTick (timerEvent:TimerEvent):void {
			
			if (Math.random() < .1) {
			var randomX:Number = Math.random() *400;
			var newEnemy = new Enemy (randomX, -15);
			army.push(newEnemy);
			addChild (newEnemy)
			}
			
			avatar.x = mouseX;
			avatar.y = mouseY;
			for each (var enemy:Enemy in army) {
				enemy.moveDownABit();
				if (avatar.hitTestObject(enemy)) {
					gameTimer.stop();
					dispatchEvent(new AvatarEvent(AvatarEvent.DEAD));
				}
			}
		}
	}
}