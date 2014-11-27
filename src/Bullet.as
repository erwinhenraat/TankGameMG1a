package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Bullet extends MovieClip
	{
		private var xMove:Number;
		private var yMove:Number;
		public function Bullet(xpos:Number, ypos:Number, rot:Number) 
		{
			
			this.rotation = rot;
			addChild(new BulletArt());
			
			
			var r:Number = this.rotation * Math.PI / 180;
			xMove = Math.cos(r);
			yMove = Math.sin(r);
			
			this.x = xpos + xMove * 350;
			this.y = ypos + yMove * 350;
			
			
		}
		public function update():void
		{
			this.x += xMove * 9;
			this.y += yMove * 9;
		}
		
	}

}