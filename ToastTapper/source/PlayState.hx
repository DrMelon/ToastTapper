package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.input.touch.FlxTouch;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	// Toast Tapped and Slices per Second
	private var ToastSlices:Float;
	private var SlicesPerSecond:Float;
	
	// Multipliers
	private var SlicesPerSecondMultiplier:Float;
	
	
	// Rudimentary Toast Display
	private var HowMuchToast:FlxText;
	
	// Rudimentary Toast Sprite
	private var TheBigToastSlice:FlxSprite;
	
	// Background Sprite
	private var Background:FlxSprite;
	

	
	
	/// Touch Controls
	private var touch:FlxTouch;
	
	
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		
		// Set up values
		ToastSlices = 0;
		SlicesPerSecond = 0;
		SlicesPerSecondMultiplier = 1;
		
		
		// Set up background
		Background = new FlxSprite(0, 0, "assets/images/BG.png");
	
		
		
		// Set up toast slice
		TheBigToastSlice = new FlxSprite(720 / 2, 1280 / 3, "assets/images/Toast.png");
		TheBigToastSlice.scale = new FlxPoint(3, 3);
		TheBigToastSlice.setOriginToCenter();
		
		// Set up text display for toast.
		HowMuchToast = new FlxText(10, 10, 1000, "Toast: ", 32);
		
		add(Background);
		add(TheBigToastSlice);
		add(HowMuchToast);
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		// Set the score text up!
		HowMuchToast.text = ToastSlices + " slices of Toast.";
		
		
		
		// When the toast is tapped, increase toast. Duh.
		touch = FlxG.touches.getFirst();
		if (touch != null)
		{
			if (touch.overlaps(TheBigToastSlice) && touch.justPressed)
			{
				ToastSlices++;
				// [TODO] Add a floating +1 number. 
				var plusOne:FloatText = new FloatText(touch.x, touch.y-32, 68, "+1", 32);
				add(plusOne);
			}
		}
		
		
		super.update();
	}	
}