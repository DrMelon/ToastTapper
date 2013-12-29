package ;

import flixel.text.FlxText;

// Float text will move upwards and fade out as it goes.

/**
 * ...
 * @author Dr. Melon / Jordan Brown
 */
class FloatText extends FlxText
{

	private var FadeValue:Float;
	private var LifeTime:Float;
	private var CurrentLife:Float;
	
	public function new(X:Float, Y:Float, Width:Int, ?Text:String, size:Int=8, EmbeddedFont:Bool=true, Life:Float=1) 
	{
		super(X, Y, Width, Text, size, EmbeddedFont);
		
		LifeTime = Life;
		CurrentLife = 0.01;
		
		maxVelocity.y = 60;
		velocity.y = -60;
		moves = true;
		allowCollisions = 0;
		solid = false;
		
	}
	
	public override function  update()
	{
		super.update();
		
		
		
		//FadeValue = LifeTime - (CurrentLife / LifeTime);
		
		//set_alpha(FadeValue);
		
		CurrentLife += 1 / 60; // Life is in seconds.
	
		
		if (CurrentLife >= LifeTime)
		{
			// Die!
			kill();
		}
	}
	
}