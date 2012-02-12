package
{
	import net.flashpunk.*;
	import net.flashpunk.utils.*;
	
	public class GameWorld extends World
	{
		
		public static var boxer:Boxer;
		public static var level:Level;
		
		public function GameWorld()
		{
			
		}
		
		override public function begin():void 
		{
			switch (Globals.gameState) 
			{
				case "title":
//					musicPlay(Assets.MUS_TITLE);
//					FP.world.add(new TitleScreen);
					break;
				case "help":
//					FP.world.add(new HelpScreen);
					break;
				case "settings":
//					FP.world.add(new SettingScreen);
					break;
				case "game":
//					musicPlay(Assets.MUS_GROOVE);
					startLevel();
					break;
			}
		}

		private function startLevel():void
		{
			// clean up some vars for game restart
			//hasPlayedOnce = false;
			//Globals.playerScore = 0;
			
			level = new Level();
			add(level);
			
//			boxer = new Boxer;
//			add(boxer);
//			
//			FP.world.add(new HUD);
		}

		
		override public function update():void
		{
			move();
		}
		
		private function move():void
		{

		}
	}
}