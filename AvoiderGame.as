package {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.ui.Mouse;

	public class AvoiderGame extends MovieClip {
			
		public var army:Array;
		public var avatar:Avatar;
		public var enemy:Enemy;
		public var gameTimer:Timer;
		public var scoreTimer:Timer;
		public var yy:Number = 5.5;
		public var xx:Number = 0;
		public var deaths:Number = 0;
		public function AvoiderGame () {
			trace ("123123123123");
			army = new Array();
			var newEnemy = new Enemy (100, -15);
			army.push(newEnemy);
			addChild (newEnemy)
			enemy = new Enemy(100, -15);
			addChild(enemy);
			avatar = new Avatar
			avatar.x = 20
			avatar.y = 200
			addChild(avatar);
			avatar.x = mouseX;
			avatar.y = mouseY;
			//Game Timer
			gameTimer = new Timer (25);
			gameTimer.addEventListener(TimerEvent.TIMER, onTick);
			gameTimer.start();
			scoreTimer = new Timer (100000);
			scoreTimer.addEventListener(TimerEvent.TIMER, everyTenSec);
			scoreTimer.start();
		}
		public function onTick (timerEvent:TimerEvent):void {
			Mouse.hide();
			if (Math.random() < 0.15) {
			var randomX:Number = Math.random() *400;
			var newEnemy = new Enemy (randomX, -30);
			army.push(newEnemy);
			addChild (newEnemy);
			}
			avatar.x = mouseX;
			avatar.y = mouseY;
			var avatarHasBeenHit:Boolean = false;
			for each (var enemy:Enemy in army) {
				enemy.moveDownABit(yy,xx);
				
				if (avatar.hitTestObject(enemy)) {
					gameTimer.stop();
					avatarHasBeenHit = true;
					
				}
				if (avatarHasBeenHit) {
					dispatchEvent(new AvatarEvent(AvatarEvent.DEAD));
				}
				if (enemy.y > 290) {
					if (enemy.y < 300 + yy) {
					gameScore.addToValue (10);
					deaths ++;
					trace(deaths);
					}
				}
				if (deaths > 100*yy) {
					trace(deaths);
					yy++;
				}
			}
			gameTime.addToValue (1/40);
		}
		public function getFinalScore ():Number {
			return gameScore.currentValue;
		}
		public function getFinalTime ():Number {
			return gameTime.currentValue;
		}
		public function everyTenSec (timerEvent:TimerEvent):void {
			gameScore.addToValue (500);
			
			trace(yy);
		}
	}
}