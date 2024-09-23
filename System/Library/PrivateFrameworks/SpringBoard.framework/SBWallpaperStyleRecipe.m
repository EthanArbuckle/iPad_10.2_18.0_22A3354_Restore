@implementation SBWallpaperStyleRecipe

- (id)title
{
  return CFSTR("Homescreen Wallpaper Style Changer");
}

- (void)handleVolumeIncrease
{
  uint64_t v2;
  void *v3;
  id v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "activeVariant");
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWallpaperStyle:forPriority:forVariant:withAnimationFactory:", 23, 4, v2, v3);

}

- (void)handleVolumeDecrease
{
  uint64_t v2;
  void *v3;
  id v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "activeVariant");
  objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeWallpaperStyleForPriority:forVariant:withAnimationFactory:", 4, v2, v3);

}

@end
