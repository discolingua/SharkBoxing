package
{
	import net.flashpunk.*;
	
	[SWF(width="800",height="600")]
	
	public class Main extends Engine
	{
		public function Main():void
		{
			super(800,600,60,false);
			FP.screen.scale = 1;
			FP.world = new GameWorld();
		}
	}
}