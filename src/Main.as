package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Main extends Sprite 
	{
		private var myTank:Tank;
		public static var input:Point = new Point();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			trace("kijk de beste game ooit!");
			
			myTank = new Tank();
			addChild(myTank);
			myTank.x = stage.stageWidth * 0.5;
			myTank.y = stage.stageHeight * 0.5;
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			addEventListener(Event.ENTER_FRAME, loop);
		}		
		
		private function loop(e:Event):void
		{			
			myTank.update();
			
		}
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.D || e.keyCode == Keyboard.A )
			{
				input.x = 0;
			}
			if ( e.keyCode == Keyboard.S || e.keyCode == Keyboard.W)
			{
				input.y = 0;
			}
			
		}
		private function onKeyDown(e:KeyboardEvent):void
		{
			
			if (e.keyCode == Keyboard.D)
			{
				input.x = 1;
			}
			if (e.keyCode == Keyboard.A)
			{
				input.x = -1;
			}
			if (e.keyCode == Keyboard.S)
			{
				input.y = -1;
			}
			if (e.keyCode == Keyboard.W)
			{
				input.y = 1;
			}
		}
		
	}
	
}