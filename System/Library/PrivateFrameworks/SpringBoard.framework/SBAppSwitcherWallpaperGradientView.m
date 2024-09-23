@implementation SBAppSwitcherWallpaperGradientView

- (SBAppSwitcherWallpaperGradientView)initWithPrivateStyle:(int64_t)a3
{
  SBAppSwitcherWallpaperGradientView *v3;
  SBAppSwitcherWallpaperGradientView *v4;
  double v5;
  CAGradientLayer *v6;
  CAGradientLayer *gradientLayer;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBAppSwitcherWallpaperGradientView;
  v3 = -[_UIBackdropView initWithPrivateStyle:](&v11, sel_initWithPrivateStyle_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_attributes.leadingAlpha = SBSwitcherWallpaperGradientAttributesMakeEmpty();
    v4->_attributes.trailingAlpha = v5;
    v6 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = v6;

    -[CAGradientLayer setType:](v4->_gradientLayer, "setType:", *MEMORY[0x1E0CD2F48]);
    -[CAGradientLayer setLocations:](v4->_gradientLayer, "setLocations:", &unk_1E91CF598);
    -[CAGradientLayer setStartPoint:](v4->_gradientLayer, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v4->_gradientLayer, "setEndPoint:", 1.0, 0.5);
    -[CAGradientLayer setCompositingFilter:](v4->_gradientLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);
    -[SBAppSwitcherWallpaperGradientView _updateGradientColors](v4, "_updateGradientColors");
    -[_UIBackdropView effectView](v4, "effectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v4->_gradientLayer);

  }
  return v4;
}

- (void)setAttributes:(SBSwitcherWallpaperGradientAttributes)a3
{
  double trailingAlpha;
  double leadingAlpha;
  SBSwitcherWallpaperGradientAttributes *p_attributes;

  trailingAlpha = a3.trailingAlpha;
  leadingAlpha = a3.leadingAlpha;
  p_attributes = &self->_attributes;
  if ((SBSwitcherWallpaperGradientAttributesEqual() & 1) == 0)
  {
    p_attributes->leadingAlpha = leadingAlpha;
    p_attributes->trailingAlpha = trailingAlpha;
    -[SBAppSwitcherWallpaperGradientView _updateGradientColors](self, "_updateGradientColors");
  }
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherWallpaperGradientView;
  -[SBAppSwitcherWallpaperGradientView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBAppSwitcherWallpaperGradientView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  CAGradientLayer *gradientLayer;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherWallpaperGradientView;
  -[_UIBackdropView layoutSubviews](&v4, sel_layoutSubviews);
  -[SBAppSwitcherWallpaperGradientView bounds](self, "bounds");
  -[CAGradientLayer setBounds:](self->_gradientLayer, "setBounds:");
  gradientLayer = self->_gradientLayer;
  UIRectGetCenter();
  -[CAGradientLayer setPosition:](gradientLayer, "setPosition:");
}

- (void)_updateGradientColors
{
  CAGradientLayer *gradientLayer;
  SBSwitcherWallpaperGradientAttributes *p_attributes;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  gradientLayer = self->_gradientLayer;
  p_attributes = &self->_attributes;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 1.0 - self->_attributes.trailingAlpha);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7[0] = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 1.0 - p_attributes->leadingAlpha);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7[1] = objc_msgSend(v5, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](gradientLayer, "setColors:", v6);

}

- (SBSwitcherWallpaperGradientAttributes)attributes
{
  double leadingAlpha;
  double trailingAlpha;
  SBSwitcherWallpaperGradientAttributes result;

  leadingAlpha = self->_attributes.leadingAlpha;
  trailingAlpha = self->_attributes.trailingAlpha;
  result.trailingAlpha = trailingAlpha;
  result.leadingAlpha = leadingAlpha;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
