@implementation SBReloadWallpaperTestRecipe

- (id)title
{
  return CFSTR("Reload Wallpaper");
}

- (void)handleVolumeIncrease
{
  id v2;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_reloadWallpaperAndFlushCaches:completionHandler:", 1, 0);

}

- (void)handleVolumeDecrease
{
  id v2;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_reloadWallpaperAndFlushCaches:completionHandler:", 0, 0);

}

@end
