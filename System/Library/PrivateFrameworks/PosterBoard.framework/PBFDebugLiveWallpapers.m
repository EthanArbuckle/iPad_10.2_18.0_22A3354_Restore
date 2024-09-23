@implementation PBFDebugLiveWallpapers

void __PBFDebugLiveWallpapers_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  PBFDebugLiveWallpapers___isEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("DEBUG_LIVE_WALLPAPERS"));

}

@end
