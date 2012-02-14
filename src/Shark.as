package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;

	public class Shark extends Entity {
		
		private var sharkSprite:Image = new Image(Assets.SPR_TIGERSHARK);		
		
		public function Shark():void {
			layer = 60;			
			graphic = sharkSprite;
			x = 500;
			y = 120;
			type = "shark";
			
		}
	}
}