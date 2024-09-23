@implementation SBWallpaperEffectView

- (SBWallpaperEffectView)initWithWallpaperVariant:(int64_t)a3 transformOptions:(unint64_t)a4
{
  void *v7;
  SBWallpaperEffectView *v8;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PBUIWallpaperEffectViewBase initWithWallpaperPresenter:variant:transformOptions:](self, "initWithWallpaperPresenter:variant:transformOptions:", v7, a3, a4);

  return v8;
}

- (SBWallpaperEffectView)initWithFrame:(CGRect)a3
{
  return -[SBWallpaperEffectView initWithWallpaperVariant:](self, "initWithWallpaperVariant:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBWallpaperEffectView)initWithWallpaperVariant:(int64_t)a3
{
  return -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:](self, "initWithWallpaperVariant:transformOptions:", a3, 0);
}

- (PBUIWallpaperController)wallpaperController
{
  void *v2;
  id v3;

  -[PBUIWallpaperEffectViewBase wallpaperPresenter](self, "wallpaperPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (PBUIWallpaperController *)v3;
}

@end
