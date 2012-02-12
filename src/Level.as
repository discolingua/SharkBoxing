package
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	
	public class Level extends Entity
	{

		public function Level():void
		{
			var levelBackground:Image = new Image(Assets.IMG_LEVELBG);
			
			layer = 100;
			this.graphic = levelBackground;
			x = 0;
			y = 0;
			type = "background";
			
		}
	}
}