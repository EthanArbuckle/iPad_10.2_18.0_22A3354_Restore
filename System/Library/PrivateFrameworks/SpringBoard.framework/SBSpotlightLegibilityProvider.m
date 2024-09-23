@implementation SBSpotlightLegibilityProvider

- (SBSpotlightLegibilityProvider)initWithVariant:(int64_t)a3
{
  void *v5;
  SBSpotlightLegibilityProvider *v6;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBSpotlightLegibilityProvider initWithVariant:wallpaperController:](self, "initWithVariant:wallpaperController:", a3, v5);

  return v6;
}

- (SBSpotlightLegibilityProvider)initWithVariant:(int64_t)a3 wallpaperController:(id)a4
{
  id v7;
  SBSpotlightLegibilityProvider *v8;
  SBSpotlightLegibilityProvider *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSpotlightLegibilityProvider;
  v8 = -[SBSpotlightLegibilityProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, 0);
    v9->_variant = a3;
    objc_storeStrong((id *)&v9->_wallpaperController, a4);
    -[SBWallpaperController addObserver:forVariant:](v9->_wallpaperController, "addObserver:forVariant:", v9, a3);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SBWallpaperController removeObserver:forVariant:](self->_wallpaperController, "removeObserver:forVariant:", self, self->_variant);
  v3.receiver = self;
  v3.super_class = (Class)SBSpotlightLegibilityProvider;
  -[SBSpotlightLegibilityProvider dealloc](&v3, sel_dealloc);
}

- (_UILegibilitySettings)legibilitySettings
{
  _UILegibilitySettings *currentLegibilitySettings;

  currentLegibilitySettings = self->_currentLegibilitySettings;
  if (!currentLegibilitySettings)
  {
    -[SBSpotlightLegibilityProvider _calculateLegibilitySettings](self, "_calculateLegibilitySettings");
    currentLegibilitySettings = self->_currentLegibilitySettings;
  }
  return currentLegibilitySettings;
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  id WeakRetained;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_variant == a3 && WeakRetained != 0)
  {
    v7 = WeakRetained;
    -[SBSpotlightLegibilityProvider _calculateLegibilitySettings](self, "_calculateLegibilitySettings");
    objc_msgSend(v7, "providerLegibilitySettingsChanged:", self);
    WeakRetained = v7;
  }

}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  id WeakRetained;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_variant == a4 && WeakRetained != 0)
  {
    v8 = WeakRetained;
    -[SBSpotlightLegibilityProvider _calculateLegibilitySettings](self, "_calculateLegibilitySettings");
    objc_msgSend(v8, "providerLegibilitySettingsChanged:", self);
    WeakRetained = v8;
  }

}

- (void)wallpaperGeometryDidChangeForVariant:(int64_t)a3
{
  id WeakRetained;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_variant == a3 && WeakRetained != 0)
  {
    v7 = WeakRetained;
    -[SBSpotlightLegibilityProvider _calculateLegibilitySettings](self, "_calculateLegibilitySettings");
    objc_msgSend(v7, "providerLegibilitySettingsChanged:", self);
    WeakRetained = v7;
  }

}

- (void)_calculateLegibilitySettings
{
  SBWallpaperController *wallpaperController;
  _UILegibilitySettings *v4;
  _UILegibilitySettings *currentLegibilitySettings;
  id v6;

  wallpaperController = self->_wallpaperController;
  -[SBSpotlightLegibilityProvider _rectForSpotlightHeader](self, "_rectForSpotlightHeader");
  -[SBWallpaperController averageColorInRect:forVariant:](wallpaperController, "averageColorInRect:forVariant:", self->_variant);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (_UILegibilitySettings *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithContentColor:", v6);
  currentLegibilitySettings = self->_currentLegibilitySettings;
  self->_currentLegibilitySettings = v4;

}

- (CGRect)_rectForSpotlightHeader
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  if (self->_variant == 1)
    objc_msgSend(MEMORY[0x1E0DA9D20], "todayViewSearchBar");
  else
    objc_msgSend(MEMORY[0x1E0DA9D20], "notificationCenterSearchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBWallpaperController windowScene](self->_wallpaperController, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "screen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:toCoordinateSpace:", v15, v6, v8, v10, v12);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (SBFLegibilitySettingsProviderDelegate)delegate
{
  return (SBFLegibilitySettingsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
}

@end
