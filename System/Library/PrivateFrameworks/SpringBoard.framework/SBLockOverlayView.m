@implementation SBLockOverlayView

- (id)_legibilitySettingsForStyle:(unint64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  objc_super v8;

  if (a3 > 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLockOverlayView;
    -[SBUILockOverlayView _legibilitySettingsForStyle:](&v8, sel__legibilitySettingsForStyle_);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "legibilitySettingsForVariant:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "style") == 2)
    {
      objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v4;
    }
    v7 = v5;

    return v7;
  }
}

@end
