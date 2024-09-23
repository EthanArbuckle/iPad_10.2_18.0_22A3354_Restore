@implementation SBSwitcherWallpaperPageContentView

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[SBSwitcherWallpaperPageContentView _updateWallpaperOrientation](self, "_updateWallpaperOrientation");
  }
}

- (void)_updateWallpaperOrientation
{
  int64_t desiredWallpaperOrientation;
  int64_t orientation;

  if (self->_desiredWallpaperOrientation)
    desiredWallpaperOrientation = self->_desiredWallpaperOrientation;
  else
    desiredWallpaperOrientation = self->_orientation;
  if ((unint64_t)(desiredWallpaperOrientation - 3) < 2 != (unint64_t)(self->_orientation - 3) < 2)
    desiredWallpaperOrientation = XBOppositeInterfaceOrientation();
  if (objc_msgSend((id)SBApp, "homeScreenRotationStyle"))
    orientation = 1;
  else
    orientation = self->_orientation;
  -[BSUIOrientationTransformWrapperView setContentOrientation:](self->_wallpaperWrapperView, "setContentOrientation:", orientation);
  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_wallpaperWrapperView, "setContainerOrientation:", desiredWallpaperOrientation);
}

- (void)layoutSubviews
{
  BSUIOrientationTransformWrapperView *wallpaperWrapperView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherWallpaperPageContentView;
  -[SBSwitcherWallpaperPageContentView layoutSubviews](&v4, sel_layoutSubviews);
  wallpaperWrapperView = self->_wallpaperWrapperView;
  -[SBSwitcherWallpaperPageContentView _wallpaperFrame](self, "_wallpaperFrame");
  -[BSUIOrientationTransformWrapperView setFrame:](wallpaperWrapperView, "setFrame:");
  -[SBSwitcherWallpaperPageContentView sendSubviewToBack:](self, "sendSubviewToBack:", self->_wallpaperWrapperView);
  -[SBSwitcherWallpaperPageContentView _updateCornerRadius](self, "_updateCornerRadius");
}

- (CGRect)_wallpaperFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[SBSwitcherWallpaperPageContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->_wallpaperStyle != 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");

    UIRectInset();
    v4 = v12;
    v6 = v13;
    v8 = v14;
    v10 = v15;
  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (int64_t)wallpaperStyle
{
  return self->_wallpaperStyle;
}

- (void)setWallpaperStyle:(int64_t)a3
{
  SBWallpaperEffectView *wallpaperEffectView;
  BSUIOrientationTransformWrapperView *wallpaperWrapperView;
  BSUIOrientationTransformWrapperView *v6;
  SBWallpaperEffectView *v7;
  SBWallpaperEffectView *v8;
  id v9;
  BSUIOrientationTransformWrapperView *v10;
  BSUIOrientationTransformWrapperView *v11;
  void *v12;

  if (self->_wallpaperStyle != a3)
  {
    self->_wallpaperStyle = a3;
    wallpaperEffectView = self->_wallpaperEffectView;
    if (a3 == 1)
    {
      if (wallpaperEffectView)
      {
        self->_wallpaperEffectView = 0;

      }
      wallpaperWrapperView = self->_wallpaperWrapperView;
      if (wallpaperWrapperView)
      {
        -[BSUIOrientationTransformWrapperView removeFromSuperview](wallpaperWrapperView, "removeFromSuperview");
        v6 = self->_wallpaperWrapperView;
        self->_wallpaperWrapperView = 0;

      }
    }
    else
    {
      if (!wallpaperEffectView)
      {
        v7 = -[SBWallpaperEffectView initWithWallpaperVariant:transformOptions:]([SBWallpaperEffectView alloc], "initWithWallpaperVariant:transformOptions:", 1, 8);
        v8 = self->_wallpaperEffectView;
        self->_wallpaperEffectView = v7;

        -[SBWallpaperEffectView setClipsToBounds:](self->_wallpaperEffectView, "setClipsToBounds:", 1);
        -[SBSwitcherWallpaperPageContentView setNeedsLayout](self, "setNeedsLayout");
      }
      if (!self->_wallpaperWrapperView)
      {
        v9 = objc_alloc(MEMORY[0x1E0D01940]);
        -[SBSwitcherWallpaperPageContentView _wallpaperFrame](self, "_wallpaperFrame");
        v10 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v9, "initWithFrame:");
        v11 = self->_wallpaperWrapperView;
        self->_wallpaperWrapperView = v10;

        -[BSUIOrientationTransformWrapperView addContentView:](self->_wallpaperWrapperView, "addContentView:", self->_wallpaperEffectView);
        -[SBSwitcherWallpaperPageContentView _viewForWallpaperWrapper](self, "_viewForWallpaperWrapper");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "insertSubview:atIndex:", self->_wallpaperWrapperView, 0);

      }
      -[SBSwitcherWallpaperPageContentView _updateWallpaperOrientation](self, "_updateWallpaperOrientation");
      -[PBUIWallpaperEffectViewBase setStyle:](self->_wallpaperEffectView, "setStyle:", self->_wallpaperStyle);
      -[PBUIWallpaperEffectViewBase setForcesOpaque:](self->_wallpaperEffectView, "setForcesOpaque:", 1);
    }
  }
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_updateCornerRadius
{
  id v3;

  -[SBWallpaperEffectView _setContinuousCornerRadius:](self->_wallpaperEffectView, "_setContinuousCornerRadius:", self->_cornerRadius);
  -[SBWallpaperEffectView layer](self->_wallpaperEffectView, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskedCorners:", self->_maskedCorners);

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[SBSwitcherWallpaperPageContentView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    -[SBSwitcherWallpaperPageContentView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (SBSwitcherWallpaperPageContentView)initWithFrame:(CGRect)a3
{
  SBSwitcherWallpaperPageContentView *v3;
  SBSwitcherWallpaperPageContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSwitcherWallpaperPageContentView;
  v3 = -[SBSwitcherWallpaperPageContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_orientation = 0;
    v3->_desiredWallpaperOrientation = 0;
    v3->_wallpaperStyle = 1;
    -[SBSwitcherWallpaperPageContentView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  }
  return v4;
}

- (void)setDesiredWallpaperOrientation:(int64_t)a3
{
  if (self->_desiredWallpaperOrientation != a3)
  {
    self->_desiredWallpaperOrientation = a3;
    -[SBSwitcherWallpaperPageContentView _updateWallpaperOrientation](self, "_updateWallpaperOrientation");
  }
}

- (BOOL)contentRequiresGroupOpacity
{
  return 0;
}

- (int64_t)desiredWallpaperOrientation
{
  return self->_desiredWallpaperOrientation;
}

- (SBWallpaperEffectView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperWrapperView, 0);
}

@end
