@implementation PBUIPortalReplicaEffectView

- (PBUIPortalReplicaEffectView)initWithFrame:(CGRect)a3
{
  PBUIPortalReplicaEffectView *v3;
  uint64_t v4;
  _UIBackdropView *effectView;
  _UIBackdropView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PBUIPortalReplicaEffectView;
  v3 = -[PBUIPortalReplicaView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", -2);
    effectView = v3->_effectView;
    v3->_effectView = (_UIBackdropView *)v4;

    v6 = v3->_effectView;
    -[PBUIPortalReplicaEffectView bounds](v3, "bounds");
    -[_UIBackdropView setFrame:](v6, "setFrame:");
    -[_UIBackdropView setAutoresizingMask:](v3->_effectView, "setAutoresizingMask:", 18);
    -[_UIBackdropView setHidden:](v3->_effectView, "setHidden:", 1);
    -[PBUIPortalReplicaEffectView addSubview:](v3, "addSubview:", v3->_effectView);
    -[PBUIPortalReplicaEffectView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[PBUIPortalReplicaEffectView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[PBUIPortalReplicaView debugView](v3, "debugView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PBUIPortalReplicaView debugView](v3, "debugView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "colorWithAlphaComponent:", 0.4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setColor:", v10);

      -[PBUIPortalReplicaView debugView](v3, "debugView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIPortalReplicaEffectView bringSubviewToFront:](v3, "bringSubviewToFront:", v11);

    }
  }
  return v3;
}

- (void)setNeedsSourceUpdate
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id MTMaterialViewClass;
  MTMaterialView *v10;
  MTMaterialView *materialView;
  MTMaterialView *v12;
  void *v13;
  void *v14;
  _OWORD v15[4];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PBUIPortalReplicaEffectView;
  -[PBUIPortalReplicaView setNeedsSourceUpdate](&v20, sel_setNeedsSourceUpdate);
  if (self->_style)
    v3 = -[PBUIPortalReplicaView shouldMatchWallpaperPosition](self, "shouldMatchWallpaperPosition");
  else
    v3 = 0;
  -[PBUIPortalReplicaView setShouldMatchWallpaperPosition:](self, "setShouldMatchWallpaperPosition:", v3);
  -[PBUIPortalReplicaView source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  _WallpaperBackdropParametersForStyleAndAverageColor(self->_style, v6, (uint64_t)&v16);
  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  v15[3] = v19;
  PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MTMaterialView setHidden:](self->_materialView, "setHidden:", 1);
    -[_UIBackdropView setHidden:](self->_effectView, "setHidden:", 0);
    -[_UIBackdropView transitionToSettings:](self->_effectView, "transitionToSettings:", v7);
  }
  else
  {
    -[_UIBackdropView setHidden:](self->_effectView, "setHidden:", 1);
    -[MTMaterialView setHidden:](self->_materialView, "setHidden:", 0);
    if (!self->_materialView)
    {
      v8 = *((_QWORD *)&v19 + 1);
      MTMaterialViewClass = getMTMaterialViewClass();
      if (v8 == 3)
        objc_msgSend(MTMaterialViewClass, "pui_homeScreenLegibilityMaterialView");
      else
        objc_msgSend(MTMaterialViewClass, "materialViewWithRecipe:", 19);
      v10 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
      materialView = self->_materialView;
      self->_materialView = v10;

      v12 = self->_materialView;
      -[PBUIPortalReplicaEffectView bounds](self, "bounds");
      -[MTMaterialView setFrame:](v12, "setFrame:");
      -[MTMaterialView setAutoresizingMask:](self->_materialView, "setAutoresizingMask:", 18);
      -[PBUIPortalReplicaEffectView addSubview:](self, "addSubview:", self->_materialView);
      -[PBUIPortalReplicaView debugView](self, "debugView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[PBUIPortalReplicaView debugView](self, "debugView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBUIPortalReplicaEffectView bringSubviewToFront:](self, "bringSubviewToFront:", v14);

      }
    }
  }

}

- (double)effectWeight
{
  MTMaterialView *materialView;
  double result;

  materialView = self->_materialView;
  if (!materialView)
    return 1.0;
  -[MTMaterialView weighting](materialView, "weighting");
  return result;
}

- (void)setEffectWeight:(double)a3
{
  -[MTMaterialView setWeighting:](self->_materialView, "setWeighting:", a3);
}

- (int64_t)effectiveStyle
{
  return self->_style;
}

- (void)requestStyle:(int64_t)a3
{
  int64_t v3;

  if (a3 == -1)
    v3 = 0;
  else
    v3 = a3;
  if (self->_style != v3)
  {
    self->_style = v3;
    -[PBUIPortalReplicaEffectView setNeedsSourceUpdate](self, "setNeedsSourceUpdate");
  }
}

- (void)setFullscreen:(BOOL)a3
{
  -[PBUIPortalReplicaView setShouldMatchWallpaperPosition:](self, "setShouldMatchWallpaperPosition:", !a3);
}

- (BOOL)isFullscreen
{
  return !-[PBUIPortalReplicaView shouldMatchWallpaperPosition](self, "shouldMatchWallpaperPosition");
}

- (BOOL)isEffectView
{
  return 1;
}

- (PBUIFakeBlurObserver)observer
{
  return (PBUIFakeBlurObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
