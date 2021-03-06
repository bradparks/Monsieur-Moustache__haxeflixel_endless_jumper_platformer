package ui;

import flixel.FlxSubState;
import flixel.FlxG;
import score.Score;
import social.Facebook;
import social.Twitter;
#if (android && ADS)
import admob.AD;
#end

/**
 * ...
 * @author Ohmnivore
 */
class GameOverMenu extends FlxSubState
{
	override public function create():Void 
	{
		super.create();
		
		if (Score.s > Score.sBest)
		{
			var score:UIText = new UIText(0, 1, "New highscore of " + Score.s + "m!");
			Tween.tweenToLeft(score);
			add(score);
		}
		else
		{
			var score:UIText = new UIText(0, 6, "Score: " + Score.s + "m");
			Tween.tweenToLeft(score);
			add(score);
			var highScore:UIText = new UIText(0, 16, "Highscore: " + Score.sBest + "m");
			Tween.tweenToLeft(highScore);
			add(highScore);
		}
		Score.saveScore();
		
		var play:BtnPlay = new BtnPlay(FlxG.height / 6.0, launch);
		var tweet:BtnTweet = new BtnTweet(FlxG.height / 6.0 + 42.0, shareTweet);
		var fb:BtnFacebook = new BtnFacebook(FlxG.height / 6.0 + 68.0, shareFacebook);
		var back:BtnBack = new BtnBack(FlxG.height / 6.0 + 94.0, backToMenu);
		#if android
		var scores:BtnScores = new BtnScores(FlxG.height / 6.0 + 42.0, showScores);
		add(scores);
		tweet.y += 26;
		fb.y += 26;
		back.y += 26;
		#end
		
		add(play);
		add(tweet);
		add(fb);
		add(back);
		
		#if android
		Tween.tweenToRight(scores);
		Tween.tweenToLeft(play);
		Tween.tweenToRight(tweet);
		Tween.tweenToLeft(fb);
		Tween.tweenToRight(back);
		#else
		Tween.tweenToRight(play);
		Tween.tweenToLeft(tweet);
		Tween.tweenToRight(fb);
		Tween.tweenToLeft(back);
		#end
		
		#if (android && ADS)
		AD.init("ca-app-pub-3957994598949973/3248342041", AD.LEFT, AD.BOTTOM, AD.BANNER_PORTRAIT, false); //false
		AD.show();
		#end
	}
	
	override public function update():Void 
	{
		#if !mobile
		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE)
			launch();
		#end
		
		super.update();
	}
	
	private function launch():Void
	{
		FlxG.switchState(new PlayState());
	}
	private function showScores():Void
	{
		#if android
		Reg.board.viewScores();
		#end
	}
	private function shareTweet():Void
	{
		Util.blip();
		
		Twitter.tweetScore(Score.s);
	}
	private function shareFacebook():Void
	{
		Util.blip();
		
		Facebook.shareScore(Score.s);
	}
	private function backToMenu():Void
	{
		Util.blip();
		
		FlxG.switchState(new MenuState());
	}
}