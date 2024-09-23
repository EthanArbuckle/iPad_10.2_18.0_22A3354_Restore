@implementation SBXXClearWallpaperAsset

void ___SBXXClearWallpaperAsset_block_invoke()
{
  void *v0;
  id v1;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "wallpaperConfigurationManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeVideoForVariants:", 3);

}

@end
