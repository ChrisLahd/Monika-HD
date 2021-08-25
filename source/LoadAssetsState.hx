package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxCamera;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;
import openfl.Assets;

#if windows
import Discord.DiscordClient;
#end

#if cpp
import sys.thread.Thread;
#end

using StringTools;



class LoadAssetsState extends MusicBeatState
{
	var loadedAssets:Int = 0;
	var camOverlay:FlxCamera;
	var camLoad:FlxCamera;
	var assetsXML:Array<String> = ["monattack", "bgthirdglitch"];
	var daAnimations:Array<String> = ["BigmonAttack", "BGThird"];

	function loadAsset(){
		var loadDaAsset:FlxSprite = new FlxSprite(0, 0);
		loadDaAsset.frames = Paths.getSparrowAtlas('' + assetsXML[loadedAssets]);
		loadDaAsset.animation.addByPrefix('whatthe', '' + daAnimations[loadedAssets], 24, false);
		loadDaAsset.setGraphicSize(Std.int(loadDaAsset.width / 7));
		add(loadDaAsset);
		remove(loadDaAsset);
		trace('loaded' + assetsXML[loadedAssets]);
		loadedAssets += 1;
	}


	override public function create():Void
	{
		super.create();

		// var gameCam:FlxCamera = FlxG.camera;
		camLoad = new FlxCamera();
		camOverlay = new FlxCamera();
		camOverlay.bgColor.alpha = 0;

		FlxG.cameras.reset(camLoad);
		FlxG.cameras.add(camOverlay);

		FlxCamera.defaultCameras = [camLoad];

	}

	override function update(elapsed:Float)
	{

		if (loadedAssets == 1){
			FlxG.switchState(new TitleState());
		}
		else{
			loadAsset();
		}
		super.update(elapsed);
	}

}