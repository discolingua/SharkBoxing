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
		private var blockDuration:Number = 20;
		private var crouchDuration:Number = 10;
		private var punchCooldown:Number = 0;
		private var blockCooldown:Number = 0;
		private var crouchCooldown:Number = 0;
		
		private var boxerSprite:Spritemap = new Spritemap(Assets.SPR_BOXER, 150, 300);
		
		public function Boxer() {
			layer = 50;
			graphic = boxerSprite;
			x = 60;
			y = 250;
			type = "boxer";
		}
		
		override public function update():void{
			move();
		}
		
		private function move():void {
			
			punchCooldown > 0 ? punchCooldown-- : 0;
			blockCooldown > 0 ? blockCooldown-- : 0;
			crouchCooldown > 0 ? crouchCooldown-- : 0;
			
			if (punchCooldown + blockCooldown == 0){
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
				
				if (Input.pressed(Key.D)) {
					punch();
				}
				
				if (Input.pressed(Key.A)) {
					block();
				}
				
				if (Input.check(Key.DOWN)){
					if (y == floorY) { crouch(); }
				}
			} 
			
			// position = position + ( verticalVelocity + initialVerticalVelocity ) * 0.5 * dt;
			x += xVel * FP.elapsed;
			y += yVel * FP.elapsed;
			
			if (xVel < 0) { xVel += 1; } else if (xVel > 0) { xVel -= 1; } // decelerate xVel
			if (y < floorY) { 
				yVel += gravityConstant; 
			} else if (y > floorY) {
				y = floorY;
				yVel = 0;
			}
			
			// scroll camera
			if ( (abs(xVel) > 0) && x > 100 ) {
				FP.camera.x = x - 100;
			}
			
		}
		
		private function abs( value:Number ):Number	{
			return value < 0 ? -value : value;
		}
		
		private function setAnimation():void
		{
			// function to set animation frame for walking, punch/block recovery, etc.
			
			if((!Input.check(Key.DOWN)) && crouchCooldown == 0) {    //crouch check
				boxerSprite.setFrame(0);
			}
		}
		
		private function punch():void {
			punchCooldown = punchDuration;
			boxerSprite.setFrame(1);
			xVel /= 2;
			
		}
		
		private function block():void {
			blockCooldown = blockDuration;
			boxerSprite.setFrame(2);
			if (y == floorY) { xVel = 0; }
		}
		
		private function crouch():void {
			crouchCooldown = crouchDuration;
			boxerSprite.setFrame(3);
			xVel = 0;
		}
	}
}