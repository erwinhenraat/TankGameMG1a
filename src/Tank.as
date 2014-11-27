package  
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Tank extends MovieClip
	{
		private var myTankBody:TankBodyArt;
		private var myTankTurret:TankTurretArt;
		public var turretRotation:Number;
		
		public function Tank() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			
			myTankBody = new TankBodyArt();			//instantieren van de class
			this.addChild(myTankBody);
			
			myTankTurret = new TankTurretArt();
			this.addChild(myTankTurret);	
			
		}		
		private function init(e:Event):void
		{
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		private function onClick(e:MouseEvent):void
		{
			trace("ik schiet omdat ik click!");
			dispatchEvent(new Event("SHOOT"));
			
		}
		public function update():void
		{
			rotateBody();
			moveTank();
			rotateTurret();
			
		}
		private function rotateTurret():void
		{
			var dx:Number = mouseX;
			var dy:Number = mouseY;
			var r:Number = Math.atan2(dy, dx);
			var degrees:Number = r * 180 / Math.PI;
			myTankTurret.rotation = degrees;
			turretRotation = degrees;
		}
		private function rotateBody():void
		{
			this.rotation += Main.input.x * 5;
		}
		private function moveTank():void
		{
			//sinus gebruik je voor de y as 
			//cosinus voor de x as
			//om wiskundige berekeningen te maken gebruik je alleen een radian
			//radian = degrees * PI / 180
			//degrees = radian * 180 / PI
			var r:Number = this.rotation * Math.PI / 180;
			var xMove:Number = Math.cos(r);
			var yMove:Number = Math.sin(r);
			
			this.x += Main.input.y * xMove * 5;
			this.y += Main.input.y * yMove * 5;
		}
		
	}

}