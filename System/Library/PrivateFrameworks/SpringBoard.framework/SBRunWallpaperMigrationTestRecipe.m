@implementation SBRunWallpaperMigrationTestRecipe

- (id)title
{
  return CFSTR("Run Wallpaper Migration");
}

- (void)handleVolumeIncrease
{
  void *v2;
  void *v3;
  id v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperConfigurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performMigrationWithFailureHandler:", &__block_literal_global_179);

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateWallpaperForLocations:options:withCompletion:", 3, 0, 0);

}

void __57__SBRunWallpaperMigrationTestRecipe_handleVolumeIncrease__block_invoke()
{
  NSLog(CFSTR("Failed!"));
}

@end
