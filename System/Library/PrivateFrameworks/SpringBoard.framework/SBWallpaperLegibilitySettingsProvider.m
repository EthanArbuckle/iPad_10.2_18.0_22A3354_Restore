@implementation SBWallpaperLegibilitySettingsProvider

- (SBWallpaperLegibilitySettingsProvider)initWithVariant:(int64_t)a3
{
  SBWallpaperLegibilitySettingsProvider *v4;
  SBWallpaperLegibilitySettingsProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBWallpaperLegibilitySettingsProvider;
  v4 = -[SBWallpaperLegibilitySettingsProvider init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_delegate, 0);
    v5->_variant = a3;
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forVariant:", self, self->_variant);

  v4.receiver = self;
  v4.super_class = (Class)SBWallpaperLegibilitySettingsProvider;
  -[SBWallpaperLegibilitySettingsProvider dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  int64_t variant;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    variant = self->_variant;
    if (obj)
      objc_msgSend(v6, "addObserver:forVariant:", self, variant);
    else
      objc_msgSend(v6, "removeObserver:forVariant:", self, variant);

    v5 = obj;
  }

}

- (_UILegibilitySettings)legibilitySettings
{
  void *v3;
  void *v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legibilitySettingsForVariant:", self->_variant);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UILegibilitySettings *)v4;
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  id WeakRetained;

  if (self->_variant == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "providerLegibilitySettingsChanged:", self);

  }
}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  id WeakRetained;

  if (self->_variant == a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "providerLegibilitySettingsChanged:", self);

  }
}

- (SBFLegibilitySettingsProviderDelegate)delegate
{
  return (SBFLegibilitySettingsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
