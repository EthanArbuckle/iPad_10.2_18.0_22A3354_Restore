@implementation SBInCallBannerSceneBackgroundView

- (SBInCallBannerSceneBackgroundView)initWithFrame:(CGRect)a3
{
  return -[SBInCallBannerSceneBackgroundView initWithFrame:wallpaperVariant:transformOptions:](self, "initWithFrame:wallpaperVariant:transformOptions:", 1, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBInCallBannerSceneBackgroundView)initWithFrame:(CGRect)a3 wallpaperVariant:(int64_t)a4 transformOptions:(unint64_t)a5
{
  SBInCallBannerSceneBackgroundView *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBInCallBannerSceneBackgroundView;
  result = -[SBInCallBannerSceneBackgroundView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_wallpaperStyle = 1;
    result->_wallpaperVariant = a4;
    result->_transformOptions = a5;
  }
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBInCallBannerSceneBackgroundView;
  -[SBInCallBannerSceneBackgroundView layoutSubviews](&v11, sel_layoutSubviews);
  -[SBInCallBannerSceneBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  -[SBWallpaperEffectView setFrame:](self->_wallpaperEffectView, "setFrame:", v4, v6, v8, v10);
}

- (void)setFullscreen:(BOOL)a3
{
  self->_fullscreen = a3;
  -[PBUIWallpaperEffectViewBase setFullscreen:](self->_wallpaperEffectView, "setFullscreen:");
}

- (void)setWallpaperAlpha:(double)a3
{
  void (**v5)(_QWORD);
  _QWORD v6[5];

  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_wallpaperAlpha = a3;
    if (BSFloatGreaterThanFloat() && !self->_wallpaperEffectView)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __55__SBInCallBannerSceneBackgroundView_setWallpaperAlpha___block_invoke;
      v6[3] = &unk_1E8E9DED8;
      v6[4] = self;
      v5 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v6);
      if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInRetargetableAnimationBlock"))
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v5);
      }
      else if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlockWithAnimationsEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v5);
      }
      else
      {
        v5[2](v5);
      }

    }
    -[SBWallpaperEffectView setAlpha:](self->_wallpaperEffectView, "setAlpha:", self->_wallpaperAlpha);
  }
}

uint64_t __55__SBInCallBannerSceneBackgroundView_setWallpaperAlpha___block_invoke(uint64_t a1)
{
  SBWallpaperEffectView *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;

  v2 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 432);
  *(_QWORD *)(v3 + 432) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[54];
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setFullscreen:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 448));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setForcesOpaque:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
}

- (void)setWallpaperStyle:(int64_t)a3
{
  if (self->_wallpaperStyle != a3)
  {
    self->_wallpaperStyle = a3;
    -[SBInCallBannerSceneBackgroundView _updateBackdropView](self, "_updateBackdropView");
    -[PBUIWallpaperEffectViewBase setStyle:](self->_wallpaperEffectView, "setStyle:", self->_wallpaperStyle);
  }
}

- (void)_updateBackdropView
{
  _UIBackdropView *backdropView;

  _WallpaperBackdropParametersForStyleAndAverageColor();
  -[_UIBackdropView removeFromSuperview](self->_backdropView, "removeFromSuperview");
  backdropView = self->_backdropView;
  self->_backdropView = 0;

}

- (BOOL)isFullscreen
{
  return self->_fullscreen;
}

- (double)wallpaperAlpha
{
  return self->_wallpaperAlpha;
}

- (int64_t)wallpaperStyle
{
  return self->_wallpaperStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
