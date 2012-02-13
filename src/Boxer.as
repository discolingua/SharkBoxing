package
{
	
	import net.flashpunk.*;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.*;
	
	public class Boxer extends Entity {
		
		//velocity
		private var stepVel:Number = 10;  // velocity per step left/right
		private var maxVel:Number = 50;  // max horizontal velocity
		private var xVel:Number = 0;     // current X velocity
		private var yVel:Number = 0;     // current Y velocity
		private var gravityConstant:Number = 1.7; 
		
		private var floorY:Number = 250;        // y value of floor coord
		
		private var punchDuration:Number = 10;
		private var blockDuration:Number = 60;
		private var punchCooldown:Number = 0;
		private var blockCooldown:Number = 0;
		
		private var boxerSprite:Spritemap = new Spritemap(Assets.SPR_BOXER, 150, 300);
		
		public function Boxer():void {
			layer = 50;
			graphic = boxerSprite;
			x = 60;
			y = 250;
			type = "boxer";
		}
		
		override public function update():void {
			move();
		}
		
		private function move():void {
			var newX:Number;
			var newY:Number;
			var mySpeed:Number = maxVel * FP.elapsed;

			punchCooldown > 0 ? punchCooldown-- : 0;
			
			if (punchCooldown == 0){
				setAnimation();
				if (Input.check(Key.RIGHT))	{
					if (xVel < maxVel) {
						xVel += stepVel;
					}
				}
				else if (Input.check(Key.LEFT)) {
					if ((x > 0) && (abs(xVel) < maxVel)) {
						xVel -= stepVel;
					}
				}
				if (Input.pressed(Key.UP)) {
					if (y == floorY) { yVel -= 180; }
				}
				
				if (Input.pressed(Key.D) && punchCooldown == 0) {
					punch();
				}
			} 
				
			// position = position + ( verticalVelocity + initialVerticalVelocity ) * 0.5 * dt;
			x += xVel * FP.elapsed;
			y += yVel * FP.elapsed;
			if (xVel < 0) { xVel += 1; } else if (xVel > 0) { xVel -= 1; } // decelerate xVel
			if (y < floorY) { 
				yVel += gravityConstant; 
			} else if (y > floorY) {
				y = 250;
				yVel = 0;
			}

		}
		
		private function abs( value:Number ):Number	{
			return value < 0 ? -value : value;
		}
		
		private function setAnimation():void
		{
			// function to set animation frame for walking, punch/block recovery, etc.
			
			boxerSprite.setFrame(0);
		}
		
		private function punch():void {
			punchCooldown = punchDuration;
			boxerSprite.setFrame(1);
			
		}
	}
}