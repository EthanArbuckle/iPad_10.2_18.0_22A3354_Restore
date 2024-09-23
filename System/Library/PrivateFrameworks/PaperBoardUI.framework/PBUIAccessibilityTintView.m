@implementation PBUIAccessibilityTintView

- (PBUIAccessibilityTintView)initWithVariant:(int64_t)a3 wallpaperViewController:(id)a4
{
  return -[PBUIAccessibilityTintView initWithVariant:wallpaperPresenter:wallpaperLegibilityProvider:](self, "initWithVariant:wallpaperPresenter:wallpaperLegibilityProvider:", a3, a4, a4);
}

- (PBUIAccessibilityTintView)initWithVariant:(int64_t)a3 wallpaperPresenter:(id)a4 wallpaperLegibilityProvider:(id)a5
{
  id v8;
  id v9;
  PBUIAccessibilityTintView *v10;
  PBUIAccessibilityTintView *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PBUIAccessibilityTintView;
  v10 = -[PBUIAccessibilityTintView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    -[PBUIAccessibilityTintView setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
    v11->_variant = a3;
    objc_storeWeak((id *)&v11->_wallpaperPresenter, v8);
    objc_storeWeak((id *)&v11->_wallpaperLegibilityProvider, v9);
    v11->_shouldMatchWallpaperPosition = 1;
    objc_msgSend(v8, "addObserver:forVariant:", v11, v11->_variant);
    -[PBUIAccessibilityTintView _updateBackgroundColor](v11, "_updateBackgroundColor");
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PBUIAccessibilityTintView wallpaperPresenter](self, "wallpaperPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forVariant:", self, self->_variant);

  v4.receiver = self;
  v4.super_class = (Class)PBUIAccessibilityTintView;
  -[PBUIAccessibilityTintView dealloc](&v4, sel_dealloc);
}

- (int64_t)effectiveStyle
{
  return 3;
}

- (double)zoomScale
{
  return 1.0;
}

- (void)didMoveToWindow
{
  id v3;

  -[PBUIAccessibilityTintView superview](self, "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PBUIAccessibilityTintView setFrame:](self, "setFrame:");

}

- (void)didMoveToSuperview
{
  id v3;

  -[PBUIAccessibilityTintView superview](self, "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PBUIAccessibilityTintView setFrame:](self, "setFrame:");

}

- (void)setFullscreen:(BOOL)a3
{
  -[PBUIAccessibilityTintView setShouldMatchWallpaperPosition:](self, "setShouldMatchWallpaperPosition:", !a3);
}

- (BOOL)isFullscreen
{
  return !-[PBUIAccessibilityTintView shouldMatchWallpaperPosition](self, "shouldMatchWallpaperPosition");
}

- (void)_updateBackgroundColor
{
  void *v3;
  id v4;

  -[PBUIAccessibilityTintView wallpaperLegibilityProvider](self, "wallpaperLegibilityProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "averageColorForVariant:", self->_variant);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIAccessibilityTintView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (BOOL)shouldMatchWallpaperPosition
{
  return self->_shouldMatchWallpaperPosition;
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  self->_shouldMatchWallpaperPosition = a3;
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (void)setTransformOptions:(unint64_t)a3
{
  self->_transformOptions = a3;
}

- (PBUIFakeBlurObserver)observer
{
  return (PBUIFakeBlurObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (PBUILegacyWallpaperPresenting)wallpaperPresenter
{
  return (PBUILegacyWallpaperPresenting *)objc_loadWeakRetained((id *)&self->_wallpaperPresenter);
}

- (PBUIWallpaperLegibilityProviding)wallpaperLegibilityProvider
{
  return (PBUIWallpaperLegibilityProviding *)objc_loadWeakRetained((id *)&self->_wallpaperLegibilityProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wallpaperLegibilityProvider);
  objc_destroyWeak((id *)&self->_wallpaperPresenter);
  objc_destroyWeak((id *)&self->_observer);
}

@end
