@implementation SBFWallpaperConfiguration

- (SBFWallpaperOptions)wallpaperOptions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFWallpaperConfiguration;
  -[PBUIWallpaperConfiguration wallpaperOptions](&v3, sel_wallpaperOptions);
  return (SBFWallpaperOptions *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBFWallpaperImage)wallpaperImage
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFWallpaperConfiguration;
  -[PBUIWallpaperConfiguration wallpaperImage](&v3, sel_wallpaperImage);
  return (SBFWallpaperImage *)(id)objc_claimAutoreleasedReturnValue();
}

@end
