package
{
	
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.*;
	
	public class Boxer extends Entity
	{
		//velocity
		private var stepVel:Number = 10;  // velocity per step left/right
		private var maxVel:Number = 50;  // max horizontal velocity
		private var xVel:Number = 0;     // current X velocity
		private var yVel:Number = 0;     // current Y velocity
		
		private var boxerSprite:Image = new Image(Assets.SPR_BOXER);
		
		public function Boxer():void
		{
			layer = 50;
			graphic = boxerSprite;
			x = 60;
			y = 250;
			type = "boxer";
		}
		
		override public function update():void
		{
			move();
		}
		
		private function move():void
		{
			var newX:Number;
			var newY:Number;
			var mySpeed:Number = maxVel * FP.elapsed;

			if (Input.check(Key.RIGHT))
			{
				if (xVel < maxVel)
				{
					xVel += stepVel;
				}
			}
			else if (Input.check(Key.LEFT))
			{
				if ((x > 0) && (abs(xVel) < maxVel))
				{
					xVel -= stepVel;
				}
			}
			
			x += xVel * FP.elapsed;
			xVel /= 1.1;

		}
		
		private function abs( value:Number ):Number
		{
			return value < 0 ? -value : value;
		}
	}
}