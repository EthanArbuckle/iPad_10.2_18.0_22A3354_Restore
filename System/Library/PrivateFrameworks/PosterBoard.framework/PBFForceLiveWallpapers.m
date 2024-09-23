@implementation PBFForceLiveWallpapers

void __PBFForceLiveWallpapers_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  PBFForceLiveWallpapers___isEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("MAKE_ALL_POSTERS_LIVE_IN_GALLERY"));

}

@end
