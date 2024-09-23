@implementation PBUIWallpaperView

- (void)layoutSubviews
{
  -[PBUIWallpaperView bounds](self, "bounds");
  -[UIView setFrame:](self->_parallaxView, "setFrame:");
  UIRectGetCenter();
  -[UIView setCenter:](self->_contentView, "setCenter:");
  -[PBUIWallpaperView _updateScaleFactor](self, "_updateScaleFactor");
}

- (void)_updateScaleFactor
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  -[UIView bounds](self->_contentView, "bounds");
  v5 = v4;
  v6 = fabs(v4);
  v7 = fabs(v3);
  if (self->_contentView)
    v8 = v6 < 2.22044605e-16;
  else
    v8 = 1;
  if (!v8 && v7 >= 2.22044605e-16)
  {
    v10 = v3;
    v11 = 0.0;
    if (-[PBUIWallpaperView _isParallaxEnabled](self, "_isParallaxEnabled", 2.22044605e-16, v7))
    {
      v12 = 0.0;
      if (objc_msgSend((id)objc_opt_class(), "_shouldScaleForParallax"))
      {
        -[PBUIWallpaperParallaxSettings overhangX](self->_parallaxSettings, "overhangX");
        v12 = (v13 + v13) * self->_parallaxFactor;
        -[PBUIWallpaperParallaxSettings overhangY](self->_parallaxSettings, "overhangY");
        v11 = (v14 + v14) * self->_parallaxFactor;
      }
    }
    else
    {
      v12 = 0.0;
    }
    -[PBUIWallpaperView bounds](self, "bounds");
    v16 = v12 + v15;
    v18 = v11 + v17;
    v19 = 1.0;
    if (v16 > v5 || v18 > v10)
    {
      v19 = v16 / v5;
      if (v16 / v5 < v18 / v10)
        v19 = v18 / v10;
    }
    if (vabdd_f64(self->_contentScaleFactor, v19) >= 2.22044605e-16)
    {
      self->_contentScaleFactor = v19;
      -[PBUIWallpaperView _updateContentViewScale](self, "_updateContentViewScale");
    }
  }
}

- (BOOL)_isParallaxEnabled
{
  int v3;

  v3 = objc_msgSend((id)objc_opt_class(), "allowsParallax");
  if (v3)
    LOBYTE(v3) = self->_parallaxEnabled && self->_parallaxSettings != 0;
  return v3;
}

+ (BOOL)allowsParallax
{
  return 1;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperView;
  -[PBUIWallpaperView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PBUIWallpaperView _handleVisibilityChange](self, "_handleVisibilityChange");
  -[PBUIWallpaperView _updateParallax](self, "_updateParallax");
}

- (void)_updateParallax
{
  -[PBUIWallpaperView _updateRasterizationState](self, "_updateRasterizationState");
  -[PBUIWallpaperView _applyParallaxSettings](self, "_applyParallaxSettings");
}

- (void)_removeParallax
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEABB0];
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PBUIWallpaperView__removeParallax__block_invoke;
  v6[3] = &unk_1E6B95B70;
  objc_copyWeak(&v7, &location);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __36__PBUIWallpaperView__removeParallax__block_invoke_2;
  v4[3] = &unk_1E6B95A80;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "animateWithDuration:delay:options:animations:completion:", 251658240, v6, v4, 0.3, 0.0);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_updateGeneratingBlurs
{
  if (self->_shouldGenerateBlurredImagesWhenVisible && -[PBUIWallpaperView _isVisible](self, "_isVisible"))
  {
    if (!self->_generatingBlurredImages)
    {
      -[PBUIWallpaperView _startGeneratingBlurredImages](self, "_startGeneratingBlurredImages");
      self->_generatingBlurredImages = 1;
    }
  }
  else if (self->_generatingBlurredImages)
  {
    -[PBUIWallpaperView _stopGeneratingBlurredImages](self, "_stopGeneratingBlurredImages");
    self->_generatingBlurredImages = 0;
  }
}

void __36__PBUIWallpaperView__removeParallax__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  char v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "_isParallaxActive");
    v2 = v5;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v5[53], "removeFromSuperview");
      v4 = v5[53];
      v5[53] = 0;

      objc_msgSend(v5, "insertSubview:atIndex:", v5[68], 0);
      objc_msgSend(v5, "_updateScaleFactor");
      v2 = v5;
    }
  }

}

- (void)_applyParallaxSettings
{
  if (-[PBUIWallpaperView _isParallaxActive](self, "_isParallaxActive"))
    -[PBUIWallpaperView _addParallax](self, "_addParallax");
  else
    -[PBUIWallpaperView _removeParallax](self, "_removeParallax");
}

- (void)_updateRasterizationState
{
  int wantsRasterization;
  int v4;
  id WeakRetained;

  wantsRasterization = self->_wantsRasterization;
  v4 = !-[PBUIWallpaperView _isParallaxActive](self, "_isParallaxActive")
    && objc_msgSend((id)objc_opt_class(), "_allowsRasterization")
    && !self->_disallowRasterizationBlockCount;
  self->_wantsRasterization = v4;
  if (v4 != wantsRasterization)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_internalObserver);
    objc_msgSend(WeakRetained, "wallpaperViewDidChangeWantsRasterization:", self);

  }
}

- (BOOL)_isParallaxActive
{
  int v3;

  v3 = -[PBUIWallpaperView _isParallaxEnabled](self, "_isParallaxEnabled");
  if (v3)
  {
    v3 = objc_msgSend(MEMORY[0x1E0CEABB0], "_motionEffectsEnabled");
    if (v3)
      LOBYTE(v3) = self->_wallpaperAnimationEnabled;
  }
  return v3;
}

+ (BOOL)_allowsRasterization
{
  return 0;
}

- (void)setZoomFactor:(double)a3 withAnimationFactory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  id location;

  v6 = a4;
  v7 = v6;
  if (self->_zoomFactor != a3)
  {
    self->_zoomFactor = a3;
    if (v6)
    {
      objc_initWeak(&location, self);
      v8 = (void *)MEMORY[0x1E0D01908];
      v9 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __56__PBUIWallpaperView_setZoomFactor_withAnimationFactory___block_invoke;
      v12[3] = &unk_1E6B95B70;
      objc_copyWeak(&v13, &location);
      v11[0] = v9;
      v11[1] = 3221225472;
      v11[2] = __56__PBUIWallpaperView_setZoomFactor_withAnimationFactory___block_invoke_2;
      v11[3] = &unk_1E6B949E0;
      v11[4] = self;
      objc_msgSend(v8, "animateWithFactory:actions:completion:", v7, v12, v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PBUIWallpaperView _updateContentViewScale](self, "_updateContentViewScale");
      WeakRetained = objc_loadWeakRetained((id *)&self->_internalObserver);
      objc_msgSend(WeakRetained, "wallpaperView:didChangeZoomFactor:", self, self->_zoomFactor);

    }
  }

}

- (void)setZoomFactor:(double)a3
{
  -[PBUIWallpaperView setZoomFactor:withAnimationFactory:](self, "setZoomFactor:withAnimationFactory:", 0, a3);
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  double v3;

  if (self->_parallaxEnabled != a3)
  {
    -[PBUIWallpaperView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("parallaxEnabled"));
    self->_parallaxEnabled = a3;
    -[PBUIWallpaperView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("parallaxEnabled"));
    if (self->_parallaxEnabled)
    {
      v3 = 1.0;
      if (fabs(self->_parallaxFactor) >= 2.22044605e-16)
        goto LABEL_7;
    }
    else
    {
      v3 = 0.0;
    }
    self->_parallaxFactor = v3;
  }
LABEL_7:
  -[PBUIWallpaperView _updateParallax](self, "_updateParallax", v3);
}

- (void)setContentView:(id)a3
{
  PBUIWallpaperView *v5;
  UIView **p_contentView;
  UIView *contentView;
  PBUIWallpaperView *v8;
  PBUIWallpaperView *v9;
  UIView *parallaxView;
  UIView *v12;
  void *v13;
  UIView *v14;

  v14 = (UIView *)a3;
  -[UIView superview](v14, "superview");
  v5 = (PBUIWallpaperView *)objc_claimAutoreleasedReturnValue();
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v14 || v5 != self && v5 != (PBUIWallpaperView *)self->_parallaxView)
  {
    PBUIApplyParallaxSettingsToView(0, contentView);
    -[UIView superview](*p_contentView, "superview");
    v8 = (PBUIWallpaperView *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 == self || v8 == (PBUIWallpaperView *)self->_parallaxView)
      -[UIView removeFromSuperview](*p_contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    parallaxView = self->_parallaxView;
    v12 = *p_contentView;
    if (parallaxView)
    {
      -[UIView addSubview:](parallaxView, "addSubview:", v12);
      -[PBUIWallpaperView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[PBUIWallpaperView addSubview:](self, "addSubview:", v12);
    }
    -[PBUIWallpaperView _updateScaleFactor](self, "_updateScaleFactor");
    if (*p_contentView)
    {
      -[PBUIWallpaperView _computeAverageColor](self, "_computeAverageColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    -[_UILegibilitySettingsProvider clearContentColorAccumulator](self->_legibilitySettingsProvider, "clearContentColorAccumulator");
    -[PBUIWallpaperView _updateLegibilitySettingsForAverageColor:force:notify:](self, "_updateLegibilitySettingsForAverageColor:force:notify:", v13, 1, 1);

  }
}

void __36__PBUIWallpaperView__removeParallax__block_invoke(uint64_t a1)
{
  void **WeakRetained;
  void **v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[8];

  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[53], "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v8[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v8[5] = v4;
    v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v8[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v8[7] = v5;
    v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v8[0] = *MEMORY[0x1E0CD2610];
    v8[1] = v6;
    v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v8[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v8[3] = v7;
    objc_msgSend(v3, "setTransform:", v8);

    PBUIApplyParallaxSettingsToView(0, v2[53]);
    PBUIApplyParallaxSettingsToView(0, v2[68]);
  }

}

- (PBUIWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  char v8;
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  PBUIWallpaperView *v20;
  PBUIWallpaperView *v21;
  uint64_t v22;
  NSString *cacheGroup;
  void *v24;
  uint64_t v25;
  NSString *wallpaperName;
  double v27;
  char v28;
  uint64_t v29;
  PBUIWallpaperPrototypeSettings *wallpaperSettings;
  uint64_t v31;
  PBUIWallpaperParallaxSettings *parallaxSettings;
  _UILegibilitySettingsProvider *v33;
  _UILegibilitySettingsProvider *legibilitySettingsProvider;
  void *v35;
  void *v36;
  void *v37;
  objc_super v39;

  v8 = a8;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v39.receiver = self;
  v39.super_class = (Class)PBUIWallpaperView;
  v20 = -[PBUIWallpaperView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v21 = v20;
  if (v20)
  {
    v20->_zoomFactor = 1.0;
    v20->_contentScaleFactor = 1.0;
    v20->_variant = a5;
    v20->_sharesContentsAcrossVariants = v8 & 1;
    v22 = objc_msgSend(v18, "copy");
    cacheGroup = v21->_cacheGroup;
    v21->_cacheGroup = (NSString *)v22;

    objc_storeWeak((id *)&v21->_wallpaperDelegate, v19);
    objc_msgSend(v17, "wallpaperOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "name");
    v25 = objc_claimAutoreleasedReturnValue();
    wallpaperName = v21->_wallpaperName;
    v21->_wallpaperName = (NSString *)v25;

    if (v24)
    {
      objc_msgSend(v24, "parallaxFactor");
      v21->_parallaxFactor = v27;
      v28 = objc_msgSend(v24, "parallaxEnabled");
    }
    else
    {
      v21->_parallaxFactor = 1.0;
      v28 = 1;
    }
    v21->_parallaxEnabled = v28;
    v21->_wallpaperMode = objc_msgSend(v24, "wallpaperMode");
    v21->_hasVideo = objc_msgSend(v24, "hasVideo");
    v21->_needsWallpaperDimmingTreatment = objc_msgSend(v17, "needsWallpaperDimmingTreatment");
    +[PBUIWallpaperDomain rootSettings](PBUIWallpaperDomain, "rootSettings");
    v29 = objc_claimAutoreleasedReturnValue();
    wallpaperSettings = v21->_wallpaperSettings;
    v21->_wallpaperSettings = (PBUIWallpaperPrototypeSettings *)v29;

    -[PTSettings addKeyObserver:](v21->_wallpaperSettings, "addKeyObserver:", v21);
    v21->_wallpaperAnimationEnabled = 1;
    -[PBUIWallpaperPrototypeSettings parallaxSettingsForVariant:](v21->_wallpaperSettings, "parallaxSettingsForVariant:", -[PBUIWallpaperView variant](v21, "variant"));
    v31 = objc_claimAutoreleasedReturnValue();
    parallaxSettings = v21->_parallaxSettings;
    v21->_parallaxSettings = (PBUIWallpaperParallaxSettings *)v31;

    -[PTSettings addKeyObserver:](v21->_parallaxSettings, "addKeyObserver:", v21);
    v33 = (_UILegibilitySettingsProvider *)objc_alloc_init(MEMORY[0x1E0CEADF0]);
    legibilitySettingsProvider = v21->_legibilitySettingsProvider;
    v21->_legibilitySettingsProvider = v33;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v21, sel__updateParallax, *MEMORY[0x1E0CEC0F0], 0);

    -[PBUIWallpaperView layer](v21, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setOpaque:", 1);

    -[PBUIWallpaperView layer](v21, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSortsSublayers:", 0);

    -[PBUIWallpaperView _updateRasterizationState](v21, "_updateRasterizationState");
  }

  return v21;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)_updateLegibilitySettingsForAverageColor:(id)a3 force:(BOOL)a4 notify:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  double v13;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  v10 = v9;
  if (self->_legibilitySettings)
    v11 = !v6;
  else
    v11 = 0;
  if (!v11 || v9 && (-[UIColor isEqual:](self->_lastAverageColor, "isEqual:", v9) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastAverageColor, a3);
    v13 = 0.0;
    -[PBUIWallpaperView bounds](self, "bounds");
    -[PBUIWallpaperView contrastInRect:contrastWithinBoxes:contrastBetweenBoxes:](self, "contrastInRect:contrastWithinBoxes:contrastBetweenBoxes:", 0, &v13);
    -[_UILegibilitySettingsProvider accumulateChangesToContentColor:contrast:](self->_legibilitySettingsProvider, "accumulateChangesToContentColor:contrast:", v10, v13);
    -[_UILegibilitySettingsProvider settings](self->_legibilitySettingsProvider, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperView _setLegibilitySettings:notify:](self, "_setLegibilitySettings:notify:", v12, v5);

  }
}

- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  UIView *contentView;
  double result;

  contentView = self->_contentView;
  if (contentView)
  {
    -[UIView convertRect:fromView:](contentView, "convertRect:fromView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[PBUIWallpaperView _contrastInContentViewRect:contrastWithinBoxes:contrastBetweenBoxes:](self, "_contrastInContentViewRect:contrastWithinBoxes:contrastBetweenBoxes:", a4, a5);
  }
  else
  {
    if (a4)
      *(_QWORD *)a4 = PBUIWallpaperViewUnknownContrast;
    if (a5)
      *(_QWORD *)a5 = PBUIWallpaperViewUnknownContrast;
    return *(double *)&PBUIWallpaperViewUnknownContrast;
  }
  return result;
}

- (void)_setLegibilitySettings:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  _UILegibilitySettings *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a4;
  v6 = a3;
  -[PBUIWallpaperView _primaryColorOverride](self, "_primaryColorOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PBUIWallpaperView _dontUseShadow](self, "_dontUseShadow");
  v9 = v6;
  v18 = v9;
  if (v7 || (v10 = (_UILegibilitySettings *)v9, v8))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v11)
      v12 = 2;
    else
      v12 = 1;
    v13 = objc_alloc(MEMORY[0x1E0CEADE8]);
    if (v7)
    {
      v14 = v7;
    }
    else
    {
      v12 = objc_msgSend(v18, "style");
      objc_msgSend(v18, "primaryColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "secondaryColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    else
      objc_msgSend(v18, "shadowColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (_UILegibilitySettings *)objc_msgSend(v13, "initWithStyle:primaryColor:secondaryColor:shadowColor:", v12, v14, v15, v16);

    if (!v7)
    {

      if (v8)
        goto LABEL_15;
      goto LABEL_14;
    }
    if (!v8)
    {
LABEL_14:
      objc_msgSend(v18, "contentColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILegibilitySettings setContentColor:](v10, "setContentColor:", v17);

    }
  }
LABEL_15:
  if (v10 != self->_legibilitySettings)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, v10);
    if (v4)
      -[PBUIWallpaperView legibilitySettingsDidChange](self, "legibilitySettingsDidChange");
  }

}

- (void)legibilitySettingsDidChange
{
  id v3;

  -[PBUIWallpaperView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "providerLegibilitySettingsChanged:", self);

}

- (PBUILegibilitySettingsProviderDelegate)delegate
{
  return (PBUILegibilitySettingsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_dontUseShadow
{
  void *v2;
  char v3;

  -[PBUIWallpaperView wallpaperName](self, "wallpaperName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("1331")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("1336")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("1316"));
  }

  return v3;
}

- (id)_primaryColorOverride
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[PBUIWallpaperView wallpaperName](self, "wallpaperName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasSuffix:", CFSTR(".Purple_Dahlia"))
    || objc_msgSend(v2, "hasSuffix:", CFSTR(".RedSpider"))
    || objc_msgSend(v2, "hasSuffix:", CFSTR(".Leaf")))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v2, "hasPrefix:", CFSTR("1336"))
      && !objc_msgSend(v2, "hasPrefix:", CFSTR("1337")))
    {
      v4 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
LABEL_6:

  return v4;
}

- (NSString)wallpaperName
{
  return self->_wallpaperName;
}

- (double)_contrastInContentViewRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  if (a4)
    *(_QWORD *)a4 = PBUIWallpaperViewUnknownContrast;
  if (a5)
    *(_QWORD *)a5 = PBUIWallpaperViewUnknownContrast;
  return *(double *)&PBUIWallpaperViewUnknownContrast;
}

- (id)_computeAverageColor
{
  return 0;
}

- (void)setTransformOptions:(unint64_t)a3
{
  if (self->_transformOptions != a3)
  {
    self->_transformOptions = a3;
    -[PBUIWallpaperView _updateContentViewScale](self, "_updateContentViewScale");
  }
}

- (void)_updateContentViewScale
{
  char ShouldIgnoreZoom;
  double contentScaleFactor;
  UIView *contentView;
  CGAffineTransform v6;

  ShouldIgnoreZoom = PBUIWallpaperTransformOptionsShouldIgnoreZoom(self->_transformOptions);
  contentScaleFactor = self->_contentScaleFactor;
  if ((ShouldIgnoreZoom & 1) == 0)
    contentScaleFactor = contentScaleFactor * self->_zoomFactor;
  contentView = self->_contentView;
  CGAffineTransformMakeScale(&v6, contentScaleFactor, contentScaleFactor);
  -[UIView setTransform:](contentView, "setTransform:", &v6);
}

- (double)contentScaleFactor
{
  return self->_contentScaleFactor;
}

+ (Class)wallpaperViewClassForConfiguration:(id)a3
{
  return (Class)objc_msgSend(a1, "wallpaperViewClassForWallpaperType:", objc_msgSend(a3, "wallpaperType"));
}

+ (Class)wallpaperViewClassForWallpaperType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return (Class)0;
  else
    return (Class)(id)objc_opt_self();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEC0F0], 0);

  -[PTSettings removeKeyObserver:](self->_wallpaperSettings, "removeKeyObserver:", self);
  -[PTSettings removeKeyObserver:](self->_parallaxSettings, "removeKeyObserver:", self);
  -[NSTimer invalidate](self->_colorSampleTimer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PBUIWallpaperView;
  -[PBUIWallpaperView dealloc](&v4, sel_dealloc);
}

- (int64_t)wallpaperType
{
  return 0;
}

- (CGRect)cropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)supportsCropping
{
  return 0;
}

- (BOOL)isContentStatic
{
  return 1;
}

- (BOOL)handlesInactiveAppearanceTreatment
{
  return 0;
}

- (double)cropZoomScale
{
  return 1.0;
}

- (_UILegibilitySettings)legibilitySettings
{
  _UILegibilitySettings *legibilitySettings;
  void *v4;

  legibilitySettings = self->_legibilitySettings;
  if (!legibilitySettings)
  {
    -[PBUIWallpaperView _computeAverageColor](self, "_computeAverageColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperView _updateLegibilitySettingsForAverageColor:force:notify:](self, "_updateLegibilitySettingsForAverageColor:force:notify:", v4, 0, 0);

    legibilitySettings = self->_legibilitySettings;
  }
  return legibilitySettings;
}

void __56__PBUIWallpaperView_setZoomFactor_withAnimationFactory___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_beginDisallowRasterizationBlock");
    objc_msgSend(v3, "_updateContentViewScale");
    v2 = objc_loadWeakRetained(v3 + 75);
    objc_msgSend(v2, "wallpaperView:didChangeZoomFactor:", v3, *((double *)v3 + 54));

    WeakRetained = v3;
  }

}

uint64_t __56__PBUIWallpaperView_setZoomFactor_withAnimationFactory___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endDisallowRasterizationBlock");
}

- (void)setVariant:(int64_t)a3
{
  -[PBUIWallpaperView setVariant:withAnimationFactory:](self, "setVariant:withAnimationFactory:", a3, 0);
}

- (void)setVariant:(int64_t)a3 withAnimationFactory:(id)a4
{
  id v6;
  PBUIWallpaperParallaxSettings *v7;
  PBUIWallpaperParallaxSettings *parallaxSettings;
  _QWORD v9[5];
  _QWORD v10[5];

  v6 = a4;
  if (self->_variant != a3)
  {
    self->_variant = a3;
    -[PBUIWallpaperPrototypeSettings parallaxSettingsForVariant:](self->_wallpaperSettings, "parallaxSettingsForVariant:", -[PBUIWallpaperView variant](self, "variant"));
    v7 = (PBUIWallpaperParallaxSettings *)objc_claimAutoreleasedReturnValue();
    parallaxSettings = self->_parallaxSettings;
    if (parallaxSettings != v7)
    {
      -[PTSettings removeKeyObserver:](parallaxSettings, "removeKeyObserver:", self);
      objc_storeStrong((id *)&self->_parallaxSettings, v7);
      -[PTSettings addKeyObserver:](self->_parallaxSettings, "addKeyObserver:", self);
      -[PBUIWallpaperView _beginDisallowRasterizationBlock](self, "_beginDisallowRasterizationBlock");
      v9[4] = self;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __53__PBUIWallpaperView_setVariant_withAnimationFactory___block_invoke;
      v10[3] = &unk_1E6B94728;
      v10[4] = self;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__PBUIWallpaperView_setVariant_withAnimationFactory___block_invoke_2;
      v9[3] = &unk_1E6B949E0;
      objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:actions:completion:", v6, v10, v9);
    }

  }
}

uint64_t __53__PBUIWallpaperView_setVariant_withAnimationFactory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateParallax");
}

uint64_t __53__PBUIWallpaperView_setVariant_withAnimationFactory___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endDisallowRasterizationBlock");
}

- (void)setLegibilitySettings:(id)a3
{
  -[PBUIWallpaperView _setLegibilitySettings:notify:](self, "_setLegibilitySettings:notify:", a3, 1);
}

- (void)updateLegibilitySettingsForAverageColor:(id)a3
{
  -[PBUIWallpaperView _updateLegibilitySettingsForAverageColor:force:notify:](self, "_updateLegibilitySettingsForAverageColor:force:notify:", a3, 0, 1);
}

- (void)resetLegibilitySettingsForAverageColor:(id)a3
{
  _UILegibilitySettingsProvider *legibilitySettingsProvider;
  id v5;

  legibilitySettingsProvider = self->_legibilitySettingsProvider;
  v5 = a3;
  -[_UILegibilitySettingsProvider clearContentColorAccumulator](legibilitySettingsProvider, "clearContentColorAccumulator");
  -[PBUIWallpaperView _updateLegibilitySettingsForAverageColor:force:notify:](self, "_updateLegibilitySettingsForAverageColor:force:notify:", v5, 1, 1);

}

- (id)averageColorInRect:(CGRect)a3 withSmudgeRadius:(double)a4
{
  void *contentView;

  contentView = self->_contentView;
  if (contentView)
  {
    objc_msgSend(contentView, "convertRect:fromView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[PBUIWallpaperView _averageColorInContentViewRect:smudgeRadius:](self, "_averageColorInContentViewRect:smudgeRadius:");
    contentView = (void *)objc_claimAutoreleasedReturnValue();
  }
  return contentView;
}

- (double)contrast
{
  double result;

  -[PBUIWallpaperView contrastInRect:](self, "contrastInRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  return result;
}

- (double)contrastInRect:(CGRect)a3
{
  double result;

  -[PBUIWallpaperView contrastInRect:contrastWithinBoxes:contrastBetweenBoxes:](self, "contrastInRect:contrastWithinBoxes:contrastBetweenBoxes:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void)setWallpaperAnimationEnabled:(BOOL)a3
{
  self->_wallpaperAnimationEnabled = a3;
  -[PBUIWallpaperView _updateParallax](self, "_updateParallax");
}

- (void)setGeneratesBlurredImages:(BOOL)a3
{
  if (self->_shouldGenerateBlurredImagesWhenVisible != a3)
  {
    self->_shouldGenerateBlurredImagesWhenVisible = a3;
    -[PBUIWallpaperView _updateGeneratingBlurs](self, "_updateGeneratingBlurs");
  }
}

- (id)snapshotImage
{
  -[PBUIWallpaperView bounds](self, "bounds");
  return (id)-[PBUIWallpaperView _imageFromRect:](self, "_imageFromRect:");
}

- (id)imageForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5
{
  __int128 v5;
  __int128 v6;
  _OWORD v8[4];

  v5 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v5;
  v6 = *(_OWORD *)&a3->var6;
  v8[2] = *(_OWORD *)&a3->var4;
  v8[3] = v6;
  -[PBUIWallpaperView _imageForBackdropParameters:includeTint:overrideTraitCollection:](self, "_imageForBackdropParameters:includeTint:overrideTraitCollection:", v8, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)snapshotImageURL
{
  return 0;
}

- (id)imageURLForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5
{
  __int128 v5;
  __int128 v6;
  _OWORD v8[4];

  v5 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v5;
  v6 = *(_OWORD *)&a3->var6;
  v8[2] = *(_OWORD *)&a3->var4;
  v8[3] = v6;
  -[PBUIWallpaperView _imageURLForBackdropParameters:includeTint:overrideTraitCollection:](self, "_imageURLForBackdropParameters:includeTint:overrideTraitCollection:", v8, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIWallpaperView;
  -[PBUIWallpaperView setHidden:](&v4, sel_setHidden_, a3);
  -[PBUIWallpaperView _handleVisibilityChange](self, "_handleVisibilityChange");
}

- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4
{
  return 0;
}

+ (BOOL)_shouldScaleForParallax
{
  return 1;
}

- (id)_averageColorInContentViewRect:(CGRect)a3 smudgeRadius:(double)a4
{
  return 0;
}

- (id)_blurredImage
{
  _OWORD v4[4];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  PBUIWallpaperBackdropParametersMake(2020, 0, 0, (uint64_t)&v5);
  v4[0] = v5;
  v4[1] = v6;
  v4[2] = v7;
  v4[3] = v8;
  -[PBUIWallpaperView _imageForBackdropParameters:includeTint:overrideTraitCollection:](self, "_imageForBackdropParameters:includeTint:overrideTraitCollection:", v4, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_blurredImageURL
{
  _OWORD v4[4];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  PBUIWallpaperBackdropParametersMake(2020, 0, 0, (uint64_t)&v5);
  v4[0] = v5;
  v4[1] = v6;
  v4[2] = v7;
  v4[3] = v8;
  -[PBUIWallpaperView _imageURLForBackdropParameters:includeTint:overrideTraitCollection:](self, "_imageURLForBackdropParameters:includeTint:overrideTraitCollection:", v4, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_imageURLForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v18[4];

  v5 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[PBUIWallpaperView traitCollection](self, "traitCollection");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v12 = *(_OWORD *)&a3->var2;
  v18[0] = *(_OWORD *)&a3->var0;
  v18[1] = v12;
  v13 = *(_OWORD *)&a3->var6;
  v18[2] = *(_OWORD *)&a3->var4;
  v18[3] = v13;
  -[PBUIWallpaperView _cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:](self, "_cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:", v18, v5, v10, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBUIWallpaperCache wallpaperCache](PBUIWallpaperCache, "wallpaperCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageURLForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_imageForBackdropParameters:(id *)a3 includeTint:(BOOL)a4 overrideTraitCollection:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  id v14;
  void (**v15)(_QWORD);
  __int128 v16;
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  _QWORD v35[4];
  void (**v36)(_QWORD);
  _OWORD v37[4];
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  BOOL v44;

  v5 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[PBUIWallpaperView traitCollection](self, "traitCollection");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __85__PBUIWallpaperView__imageForBackdropParameters_includeTint_overrideTraitCollection___block_invoke;
  v38[3] = &unk_1E6B95B98;
  v38[4] = self;
  v12 = *(_OWORD *)&a3->var2;
  v40 = *(_OWORD *)&a3->var0;
  v41 = v12;
  v13 = *(_OWORD *)&a3->var6;
  v42 = *(_OWORD *)&a3->var4;
  v43 = v13;
  v44 = v5;
  v14 = v10;
  v39 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x1BCCA5978](v38);
  v16 = *(_OWORD *)&a3->var2;
  v37[0] = *(_OWORD *)&a3->var0;
  v37[1] = v16;
  v17 = *(_OWORD *)&a3->var6;
  v37[2] = *(_OWORD *)&a3->var4;
  v37[3] = v17;
  -[PBUIWallpaperView _cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:](self, "_cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:", v37, v5, v14, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    +[PBUIWallpaperCache wallpaperCache](PBUIWallpaperCache, "wallpaperCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v11;
    v35[1] = 3221225472;
    v35[2] = __85__PBUIWallpaperView__imageForBackdropParameters_includeTint_overrideTraitCollection___block_invoke_2;
    v35[3] = &unk_1E6B95BC0;
    v36 = v15;
    objc_msgSend(v19, "imageForKey:generatingIfNecessaryWithBlock:", v18, v35);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_16;
  }
  else
  {
    v15[2](v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_16;
  }
  -[PBUIWallpaperView snapshotImage](self, "snapshotImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "size");
  v23 = v22;

  objc_msgSend(v20, "size");
  v25 = v24;
  v26 = fabs(v23);
  if (vabdd_f64(v23, v24) >= 2.22044605e-16 && v26 >= 2.22044605e-16)
  {
    objc_msgSend(v20, "scale", 2.22044605e-16, v26);
    v29 = v25 / v23 * v28;
    v30 = objc_msgSend(v20, "ioSurface");
    v31 = (void *)MEMORY[0x1E0CEA638];
    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "pui_imageWithIOSurface:scale:orientation:", v30, objc_msgSend(v20, "imageOrientation"), v29);
    }
    else
    {
      v32 = objc_retainAutorelease(v20);
      objc_msgSend(v31, "imageWithCGImage:scale:orientation:", objc_msgSend(v32, "CGImage"), objc_msgSend(v32, "imageOrientation"), v29);
    }
    v33 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v33;
  }
LABEL_16:

  return v20;
}

id __85__PBUIWallpaperView__imageForBackdropParameters_includeTint_overrideTraitCollection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  _OWORD v10[4];

  objc_msgSend(*(id *)(a1 + 32), "snapshotImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 112);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 64);
  v10[0] = *(_OWORD *)(a1 + 48);
  v10[1] = v6;
  v7 = *(_OWORD *)(a1 + 96);
  v10[2] = *(_OWORD *)(a1 + 80);
  v10[3] = v7;
  objc_msgSend(v4, "_generateImageFromImage:forBackdropParameters:includeTint:traitCollection:", v2, v10, v3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __85__PBUIWallpaperView__imageForBackdropParameters_includeTint_overrideTraitCollection___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  int v4;
  uint64_t v5;

  v4 = MGGetBoolAnswer();
  v5 = 4;
  if (!v4)
    v5 = 0;
  *a2 |= v5;
  if (MGGetBoolAnswer())
    *a2 |= 2uLL;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 includeTint:(BOOL)a5 traitCollection:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  int64_t var7;
  void *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  id result;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v7 = a5;
  v11 = a3;
  v12 = a6;
  var7 = a4->var7;
  if ((unint64_t)(var7 - 1) < 2)
  {
    v15 = *(_OWORD *)&a4->var2;
    v21 = *(_OWORD *)&a4->var0;
    v22 = v15;
    v16 = *(_OWORD *)&a4->var6;
    v23 = *(_OWORD *)&a4->var4;
    v24 = v16;
    -[PBUIWallpaperView _material_generateImageFromImage:forBackdropParameters:traitCollection:](self, "_material_generateImageFromImage:forBackdropParameters:traitCollection:", v11, &v21, v12);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = (void *)v17;
    goto LABEL_8;
  }
  if (!var7)
  {
    v18 = *(_OWORD *)&a4->var2;
    v21 = *(_OWORD *)&a4->var0;
    v22 = v18;
    v19 = *(_OWORD *)&a4->var6;
    v23 = *(_OWORD *)&a4->var4;
    v24 = v19;
    -[PBUIWallpaperView _backdrop_generateImageFromImage:forBackdropParameters:includeTint:traitCollection:](self, "_backdrop_generateImageFromImage:forBackdropParameters:includeTint:traitCollection:", v11, &v21, v7, v12);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (var7 != 3)
  {
    v14 = 0;
LABEL_8:

    return v14;
  }
  result = (id)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
    -[PBUIWallpaperView _generateImageFromImage:forBackdropParameters:includeTint:traitCollection:].cold.1(a2);
  __break(0);
  return result;
}

- (id)_backdrop_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 includeTint:(BOOL)a5 traitCollection:(id)a6
{
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v29;
  __int128 v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  BOOL v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  BOOL v41;
  _BYTE buf[32];
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v6 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  PBUILogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v29 = *(_OWORD *)&a4->var2;
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(_OWORD *)&buf[16] = v29;
    v30 = *(_OWORD *)&a4->var6;
    v43 = *(_OWORD *)&a4->var4;
    v44 = v30;
    PBUIStringForWallpaperBackdropParameters((double *)buf);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v6;
    _os_log_debug_impl(&dword_1B71C0000, v10, OS_LOG_TYPE_DEBUG, "Generating new image via backdrop view for view: %{public}@, backdrop parameters: %{public}@, tint: %{BOOL}u", buf, 0x1Cu);

  }
  objc_msgSend(v9, "pui_CGImageBackedImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = objc_msgSend(v12, "CGImage");
  v14 = *(_OWORD *)&a4->var2;
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  *(_OWORD *)&buf[16] = v14;
  v15 = *(_OWORD *)&a4->var6;
  v43 = *(_OWORD *)&a4->var4;
  v44 = v15;
  PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)buf);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13)
  {
    v35[1] = 3221225472;
    v18 = *(_OWORD *)&a4->var2;
    v37 = *(_OWORD *)&a4->var0;
    v38 = v18;
    v19 = *(_OWORD *)&a4->var6;
    v39 = *(_OWORD *)&a4->var4;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[2] = __104__PBUIWallpaperView__backdrop_generateImageFromImage_forBackdropParameters_includeTint_traitCollection___block_invoke;
    v35[3] = &unk_1E6B95BE8;
    v41 = v6;
    v40 = v19;
    v36 = v16;
    objc_msgSend(v12, "pui_imageByManipulatingInDeviceColorSpaceWithBlock:", v35);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!-[PBUIWallpaperView _needsFallbackImageForBackdropGeneratedImage:](self, "_needsFallbackImageForBackdropGeneratedImage:", v20))goto LABEL_13;
    if (v20)
    {
      objc_msgSend(v20, "size");
      v22 = v21;
      v24 = v23;

      goto LABEL_9;
    }
  }
  else
  {
    v20 = 0;
    if (!-[PBUIWallpaperView _needsFallbackImageForBackdropGeneratedImage:](self, "_needsFallbackImageForBackdropGeneratedImage:", 0))goto LABEL_13;
  }
  v22 = *MEMORY[0x1E0C9D820];
  v24 = *(double *)(MEMORY[0x1E0C9D820] + 8);
LABEL_9:
  -[PBUIWallpaperView _fallbackImageWithOriginalSize:](self, "_fallbackImageWithOriginalSize:", v22, v24);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (objc_msgSend(v20, "CGImage"))
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __104__PBUIWallpaperView__backdrop_generateImageFromImage_forBackdropParameters_includeTint_traitCollection___block_invoke_2;
    v32[3] = &unk_1E6B95C10;
    v33 = v17;
    v34 = v6;
    objc_msgSend(v20, "pui_imageByManipulatingInDeviceColorSpaceWithBlock:", v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;

      v20 = v27;
    }

  }
LABEL_13:

  return v20;
}

id __104__PBUIWallpaperView__backdrop_generateImageFromImage_forBackdropParameters_includeTint_traitCollection___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  __int128 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  if (*(_BYTE *)(a1 + 104))
  {
    v3 = *(_OWORD *)(a1 + 56);
    v13 = *(_OWORD *)(a1 + 40);
    v14 = v3;
    v4 = *(_OWORD *)(a1 + 88);
    v15 = *(_OWORD *)(a1 + 72);
    v16 = v4;
    v5 = a2;
    PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)&v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:", v6, 0, 1, 1, v13, v14, v15, v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_applyBackdropViewSettings:includeTints:includeBlur:", *(_QWORD *)(a1 + 32), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = a2;
    objc_msgSend(v11, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:", v10, 0, 1, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
}

uint64_t __104__PBUIWallpaperView__backdrop_generateImageFromImage_forBackdropParameters_includeTint_traitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0, 0);
}

- (id)_material_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 traitCollection:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  int64_t var7;
  double v13;
  void *v14;
  uint64_t v15;
  PBUIMaterialTreatment *v16;
  PBUICodableImage *v17;
  PBUITreatImageRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id result;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[32];
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  PBUILogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v26 = *(_OWORD *)&a4->var2;
    *(_OWORD *)v29 = *(_OWORD *)&a4->var0;
    *(_OWORD *)&v29[16] = v26;
    v27 = *(_OWORD *)&a4->var6;
    v30 = *(_OWORD *)&a4->var4;
    v31 = v27;
    PBUIStringForWallpaperBackdropParameters((double *)v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v29 = 138543618;
    *(_QWORD *)&v29[4] = self;
    *(_WORD *)&v29[12] = 2114;
    *(_QWORD *)&v29[14] = v28;
    _os_log_debug_impl(&dword_1B71C0000, v11, OS_LOG_TYPE_DEBUG, "Generating new image via material view for view: %{public}@, backdrop parameters: %{public}@", v29, 0x16u);

  }
  var7 = a4->var7;
  if ((unint64_t)(var7 - 1) < 2)
  {
    v15 = objc_msgSend(v10, "userInterfaceStyle");
    v13 = 8.0;
LABEL_9:
    soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle_0(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v13 = 1.0;
  if (!var7)
  {
    v15 = 1;
    goto LABEL_9;
  }
  if (var7 != 3)
  {
    v14 = 0;
LABEL_10:
    v16 = -[PBUIMaterialTreatment initWithRecipeName:fromBundle:]([PBUIMaterialTreatment alloc], "initWithRecipeName:fromBundle:", v14, 0);
    v17 = -[PBUICodableImage initWithUIImage:error:]([PBUICodableImage alloc], "initWithUIImage:error:", v9, 0);
    v18 = -[PBUITreatImageRequest initWithImage:downscaleFactor:treatment:]([PBUITreatImageRequest alloc], "initWithImage:downscaleFactor:treatment:", v17, v16, v13);
    +[PBUICARemoteRenderer remoteRendererIfPossible](PBUICARemoteRenderer, "remoteRendererIfPossible");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "renderRequest:error:", v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v9, "scale");
    objc_msgSend(v21, "pui_imageWithIOSurface:scale:orientation:", v20, objc_msgSend(v9, "imageOrientation"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pui_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", 8, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    return v24;
  }
  result = (id)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
    -[PBUIWallpaperView _material_generateImageFromImage:forBackdropParameters:traitCollection:].cold.1(a2);
  __break(0);
  return result;
}

- (id)_cacheKeyForParameters:(id *)a3 includingTint:(BOOL)a4 downsampleFactor:(double)a5 traitCollection:(id)a6
{
  _BOOL4 v7;
  id v11;
  void *v12;
  __CFString *v13;
  double var3;
  double var4;
  double var5;
  double var6;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  unint64_t wallpaperMode;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 md[20];
  uint64_t v43;

  v7 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  -[PBUIWallpaperView cacheGroup](self, "cacheGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperView cacheUniqueIdentifier](self, "cacheUniqueIdentifier");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    switch(a3->var7)
    {
      case 0:
        if (!v7)
        {
          a3->var1 = 0;
          a3->var2 = 0;
        }
        var3 = a3->var3;
        if (var3 == 1.79769313e308)
        {
          a3->var3 = 0.0;
          var3 = 0.0;
        }
        var4 = a3->var4;
        if (var4 == 1.79769313e308)
        {
          a3->var4 = 0.0;
          var4 = 0.0;
        }
        var5 = a3->var5;
        if (var5 == 1.79769313e308)
        {
          a3->var5 = 0.0;
          var5 = 0.0;
        }
        var6 = a3->var6;
        if (var6 == 1.79769313e308)
        {
          a3->var6 = 0.0;
          var6 = 0.0;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d:%d:%d:%1.1f:%d:%1.1f:%1.1f"), a3->var0, a3->var1, a3->var2, *(_QWORD *)&var4, (int)var3, *(_QWORD *)&var5, *(_QWORD *)&var6);
        goto LABEL_22;
      case 1:
        v20 = objc_msgSend(v11, "userInterfaceStyle");
        v21 = CFSTR("light");
        if (v20 == 2)
          v21 = CFSTR("dark");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("material_dock_%@"), v21, v36, v37, v38, v39, v40, v41);
        goto LABEL_22;
      case 2:
        v22 = objc_msgSend(v11, "userInterfaceStyle");
        v23 = CFSTR("light");
        if (v22 == 2)
          v23 = CFSTR("dark");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("icon_component_%@"), v23, v36, v37, v38, v39, v40, v41);
LABEL_22:
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[PBUIWallpaperView _cacheKeyForParameters:includingTint:downsampleFactor:traitCollection:].cold.1(a2);
        __break(0);
        JUMPOUT(0x1B71FD028);
      default:
        v19 = 0;
        break;
    }
    if (self->_wallpaperMode <= 1uLL)
      wallpaperMode = 1;
    else
      wallpaperMode = self->_wallpaperMode;
    PBUIStringForWallpaperMode(wallpaperMode);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CC_SHA1("Aug 13 2024 20:25:11", 0x14u, md);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", md, 20, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pf_hexadecimalEncodedString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v27, "length") >= 9)
    {
      objc_msgSend(v27, "substringToIndex:", 8);
      v28 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v28;
    }
    v29 = (void *)MEMORY[0x1E0CB3940];
    -[PBUIWallpaperView variantCacheIdentifier](self, "variantCacheIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v32 = CFSTR("untinted");
    if (v7)
      v32 = CFSTR("tinted");
    v33 = CFSTR("#");
    if (v13)
      v33 = v13;
    if (self->_needsWallpaperDimmingTreatment)
      v34 = CFSTR("dimmed");
    else
      v34 = CFSTR("undimmed");
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@-%@-(%@)-%@-%.0f-%@-%@-%@-%@"), v30, v12, v19, v32, *(_QWORD *)&a5, v33, v25, v34, v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSString)variantCacheIdentifier
{
  __CFString *v3;

  if (-[PBUIWallpaperView sharesContentsAcrossVariants](self, "sharesContentsAcrossVariants"))
  {
    v3 = CFSTR("shared");
  }
  else
  {
    PBUIStringForWallpaperVariant(-[PBUIWallpaperView variant](self, "variant"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)cacheUniqueIdentifier
{
  return (NSString *)CFSTR("#");
}

- (BOOL)_needsFallbackImageForBackdropGeneratedImage:(id)a3
{
  double v3;
  double v4;

  if (!a3)
    return 1;
  objc_msgSend(a3, "size");
  return v4 < 40.0 || v3 < 40.0;
}

- (id)_fallbackImageWithOriginalSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  double v16;
  uint64_t v17;

  height = a3.height;
  width = a3.width;
  -[PBUIWallpaperView legibilitySettings](self, "legibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = height / width;
  if (width == 0.0)
    v7 = 1.0;
  if (v7 <= 0.0)
    v8 = 40.0;
  else
    v8 = v7 * 40.0;
  objc_msgSend(MEMORY[0x1E0CEA618], "defaultFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOpaque:", 1);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v9, v8, 40.0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__PBUIWallpaperView__fallbackImageWithOriginalSize___block_invoke;
  v14[3] = &unk_1E6B95C38;
  v15 = v6;
  v16 = v8;
  v17 = 0x4044000000000000;
  v11 = v6;
  objc_msgSend(v10, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __52__PBUIWallpaperView__fallbackImageWithOriginalSize___block_invoke(uint64_t a1)
{
  CGRect v2;

  objc_msgSend(*(id *)(a1 + 32), "set");
  v2.size.width = *(CGFloat *)(a1 + 40);
  v2.size.height = *(CGFloat *)(a1 + 48);
  v2.origin.x = 0.0;
  v2.origin.y = 0.0;
  UIRectFill(v2);
}

- (id)_displayedImage
{
  return 0;
}

- (UIImage)wallpaperImage
{
  return 0;
}

- (BOOL)wantsRasterization
{
  return self->_wantsRasterization;
}

- (BOOL)needsImmediateLayoutBeforeRotation
{
  return 1;
}

- (BOOL)hasContentOutsideVisibleBounds
{
  return 0;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  PBUIWallpaperPrototypeSettings *v7;

  v7 = (PBUIWallpaperPrototypeSettings *)a3;
  v6 = a4;
  if ((PBUIWallpaperPrototypeSettings *)self->_parallaxSettings == v7)
  {
    -[PBUIWallpaperView _applyParallaxSettings](self, "_applyParallaxSettings");
  }
  else if (self->_wallpaperSettings == v7
         && ((objc_msgSend(v6, "isEqualToString:", CFSTR("replaceBlurs")) & 1) != 0
          || objc_msgSend(v6, "isEqualToString:", CFSTR("blurReplacementMode"))))
  {
    -[PBUIWallpaperView _notifyBlursInvalidated](self, "_notifyBlursInvalidated");
  }

}

- (BOOL)_isVisible
{
  BOOL v3;
  void *v4;

  if ((-[PBUIWallpaperView isHidden](self, "isHidden") & 1) != 0)
    return 0;
  -[PBUIWallpaperView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)_notifyBlursInvalidated
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_internalObserver);
  objc_msgSend(WeakRetained, "wallpaperViewDidInvalidateBlurs:", self);

}

- (void)_beginDisallowRasterizationBlock
{
  int64_t disallowRasterizationBlockCount;

  disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  self->_disallowRasterizationBlockCount = disallowRasterizationBlockCount + 1;
  if (!disallowRasterizationBlockCount)
    -[PBUIWallpaperView _updateRasterizationState](self, "_updateRasterizationState");
}

- (void)_endDisallowRasterizationBlock
{
  int64_t disallowRasterizationBlockCount;
  int64_t v4;
  void *v6;

  disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  if (disallowRasterizationBlockCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperView.m"), 893, CFSTR("unpaired disallowRastrizationBlock decrement"));

    disallowRasterizationBlockCount = self->_disallowRasterizationBlockCount;
  }
  v4 = disallowRasterizationBlockCount - 1;
  self->_disallowRasterizationBlockCount = v4;
  if (!v4)
    -[PBUIWallpaperView _updateRasterizationState](self, "_updateRasterizationState");
}

- (BOOL)_isParallaxMotionEnabled
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceClass") == 2;

  return v3;
}

- (void)_addParallax
{
  UIView *v3;
  UIView *parallaxView;
  UIView *v5;
  UIView *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  double v22;
  __int128 v23;
  __int128 v24;

  if (!self->_parallaxView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    parallaxView = self->_parallaxView;
    self->_parallaxView = v3;

    -[PBUIWallpaperView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_parallaxView, 0);
  }
  -[UIView superview](self->_contentView, "superview");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  v6 = self->_parallaxView;

  if (v5 != v6)
    -[UIView insertSubview:atIndex:](self->_parallaxView, "insertSubview:atIndex:", self->_contentView, 0);
  if (-[PBUIWallpaperView _isParallaxMotionEnabled](self, "_isParallaxMotionEnabled"))
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v19 = v7;
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v21 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
    v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)location = *MEMORY[0x1E0CD2610];
    v17 = v8;
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v24 = v9;
    -[PBUIWallpaperParallaxSettings perspectiveTransform](self->_parallaxSettings, "perspectiveTransform");
    v11 = v10 * -0.01;
    -[UIView layer](self->_parallaxView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v11;
    objc_msgSend(v12, "setTransform:", location);

    objc_initWeak(location, self);
    v13 = (void *)MEMORY[0x1E0CEABB0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __33__PBUIWallpaperView__addParallax__block_invoke;
    v14[3] = &unk_1E6B95B70;
    objc_copyWeak(&v15, location);
    objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 251658240, v14, 0, 0.3, 0.0);
    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  -[PBUIWallpaperView _updateScaleFactor](self, "_updateScaleFactor");
}

void __33__PBUIWallpaperView__addParallax__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    PBUIApplyParallaxSettingsToViewWithFactor(*((void **)WeakRetained + 63), *((void **)WeakRetained + 53), *((double *)WeakRetained + 72));
    v2 = v3;
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)wallpaperMode
{
  return self->_wallpaperMode;
}

- (BOOL)needsWallpaperDimmingTreatment
{
  return self->_needsWallpaperDimmingTreatment;
}

- (PBUIWallpaperViewDelegate)wallpaperDelegate
{
  return (PBUIWallpaperViewDelegate *)objc_loadWeakRetained((id *)&self->_wallpaperDelegate);
}

- (void)setWallpaperDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wallpaperDelegate, a3);
}

- (UIImage)untreatedWallpaperImage
{
  return self->_untreatedWallpaperImage;
}

- (void)setUntreatedWallpaperImage:(id)a3
{
  objc_storeStrong((id *)&self->_untreatedWallpaperImage, a3);
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (BOOL)parallaxEnabled
{
  return self->_parallaxEnabled;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (BOOL)continuousColorSamplingEnabled
{
  return self->_continuousColorSamplingEnabled;
}

- (void)setContinuousColorSamplingEnabled:(BOOL)a3
{
  self->_continuousColorSamplingEnabled = a3;
}

- (BOOL)wallpaperAnimationEnabled
{
  return self->_wallpaperAnimationEnabled;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (BOOL)sharesContentsAcrossVariants
{
  return self->_sharesContentsAcrossVariants;
}

- (void)setSharesContentsAcrossVariants:(BOOL)a3
{
  self->_sharesContentsAcrossVariants = a3;
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (NSString)cacheGroup
{
  return self->_cacheGroup;
}

- (PBUIWallpaperViewInternalObserver)internalObserver
{
  return (PBUIWallpaperViewInternalObserver *)objc_loadWeakRetained((id *)&self->_internalObserver);
}

- (void)setInternalObserver:(id)a3
{
  objc_storeWeak((id *)&self->_internalObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalObserver);
  objc_storeStrong((id *)&self->_cacheGroup, 0);
  objc_storeStrong((id *)&self->_wallpaperName, 0);
  objc_storeStrong((id *)&self->_untreatedWallpaperImage, 0);
  objc_destroyWeak((id *)&self->_wallpaperDelegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parallaxSettings, 0);
  objc_storeStrong((id *)&self->_colorSampleTimer, 0);
  objc_storeStrong((id *)&self->_lastAverageColor, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_legibilitySettingsProvider, 0);
  objc_storeStrong((id *)&self->_parallaxView, 0);
  objc_storeStrong((id *)&self->_wallpaperSettings, 0);
}

- (void)_generateImageFromImage:(const char *)a1 forBackdropParameters:includeTint:traitCollection:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %@ of <%@:%p> (%@:%i)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_3();
}

- (void)_material_generateImageFromImage:(const char *)a1 forBackdropParameters:traitCollection:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %@ of <%@:%p> (%@:%i)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_3();
}

- (void)_cacheKeyForParameters:(const char *)a1 includingTint:downsampleFactor:traitCollection:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(&dword_1B71C0000, MEMORY[0x1E0C81028], v4, "failure in %@ of <%@:%p> (%@:%i)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_3();
}

@end
