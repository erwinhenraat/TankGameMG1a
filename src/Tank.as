package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Tank extends MovieClip
	{
		private var myTankBody:TankBodyArt;
		private var myTankTurret:TankTurretArt;
		
		public function Tank() 
		{
			
			myTankBody = new TankBodyArt();			//instantieren van de class
			addChild(myTankBody);
			
			myTankTurret = new TankTurretArt();
			addChild(myTankTurret);
			
		}
		
	}

}