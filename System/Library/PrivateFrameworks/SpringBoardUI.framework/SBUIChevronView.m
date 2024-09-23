@implementation SBUIChevronView

- (SBUIChevronView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SBUIChevronView *v7;
  SBUIChevronView *v8;
  void *v9;
  uint64_t v10;
  UIView *alphaContainerView;
  uint64_t v12;
  UIView *leftGrabberView;
  uint64_t v14;
  UIView *rightGrabberView;
  void *v16;
  _QWORD v18[4];
  SBUIChevronView *v19;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)SBUIChevronView;
  v7 = -[SBUIChevronView initWithFrame:](&v20, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[SBUIChevronView setOpaque:](v7, "setOpaque:", 0);
    -[SBUIChevronView layer](v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 1);

    v8->_animationDuration = 0.25;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", x, y, width, height);
    alphaContainerView = v8->_alphaContainerView;
    v8->_alphaContainerView = (UIView *)v10;

    -[SBUIChevronView addSubview:](v8, "addSubview:", v8->_alphaContainerView);
    _NewChevronPiece();
    v12 = objc_claimAutoreleasedReturnValue();
    leftGrabberView = v8->_leftGrabberView;
    v8->_leftGrabberView = (UIView *)v12;

    -[UIView addSubview:](v8->_alphaContainerView, "addSubview:", v8->_leftGrabberView);
    _NewChevronPiece();
    v14 = objc_claimAutoreleasedReturnValue();
    rightGrabberView = v8->_rightGrabberView;
    v8->_rightGrabberView = (UIView *)v14;

    -[UIView addSubview:](v8->_alphaContainerView, "addSubview:", v8->_rightGrabberView);
    v16 = (void *)MEMORY[0x24BDF6F90];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __33__SBUIChevronView_initWithFrame___block_invoke;
    v18[3] = &unk_24D4CFFF8;
    v19 = v8;
    objc_msgSend(v16, "performWithoutAnimation:", v18);

  }
  return v8;
}

uint64_t __33__SBUIChevronView_initWithFrame___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setUnified:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) == 0);
  objc_msgSend(*(id *)(a1 + 32), "_layoutGrabberView:forState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
  return objc_msgSend(*(id *)(a1 + 32), "_layoutGrabberView:forState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
}

- (SBUIChevronView)initWithColor:(id)a3
{
  id v4;
  SBUIChevronView *v5;
  SBUIChevronView *v6;

  v4 = a3;
  v5 = -[SBUIChevronView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
    -[SBUIChevronView setColor:](v5, "setColor:", v4);

  return v6;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  if (a3 == 0.0)
    a3 = 0.25;
  self->_animationDuration = a3;
}

- (void)setColor:(id)a3
{
  id v4;
  double alphaComponent;
  UIColor *v6;
  UIColor *color;
  double v8;
  double v9;
  double v10;

  if (self->_color != a3)
  {
    v4 = a3;
    alphaComponent = 1.0;
    objc_msgSend(v4, "colorWithAlphaComponent:", 1.0);
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    color = self->_color;
    self->_color = v6;

    -[UIView setBackgroundColor:](self->_leftGrabberView, "setBackgroundColor:", self->_color);
    -[UIView setBackgroundColor:](self->_rightGrabberView, "setBackgroundColor:", self->_color);
    objc_msgSend(v4, "alphaComponent");
    v9 = v8;

    self->_alphaComponent = v9;
    if (self->_unified)
      v10 = 1.0;
    else
      v10 = v9;
    -[UIView setAlpha:](self->_alphaContainerView, "setAlpha:", v10);
    if (self->_unified)
      alphaComponent = self->_alphaComponent;
    -[UIView setAlpha:](self->_leftGrabberView, "setAlpha:", alphaComponent);
  }
}

- (void)configureForLightStyle
{
  _BOOL4 IsReduceTransparencyEnabled;
  double v4;

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  v4 = 0.65;
  if (IsReduceTransparencyEnabled)
    v4 = 1.0;
  -[SBUIChevronView setAlpha:](self, "setAlpha:", v4);
  -[SBUIChevronView _setDrawsAsBackdropOverlayWithBlendMode:](self, "_setDrawsAsBackdropOverlayWithBlendMode:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 36.0;
  v4 = 14.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGAffineTransform)_transformForGrabberView:(SEL)a3 forState:(id)a4
{
  UIView *v8;
  uint64_t v9;
  __int128 v10;
  double v11;
  BOOL v12;
  double v13;
  CGAffineTransform *result;
  UIView *v15;

  v8 = (UIView *)a4;
  v9 = MEMORY[0x24BDBD8B8];
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v9 + 32);
  if (a5 == 1)
  {
    v12 = self->_rightGrabberView == v8;
    v11 = 20.0;
    v13 = -20.0;
    goto LABEL_6;
  }
  if (a5)
  {
    v11 = 0.0;
    if (a5 != -1)
    {
LABEL_8:
      v15 = v8;
      CGAffineTransformMakeRotation(retstr, v11 * 0.0174532925);
      v8 = v15;
      goto LABEL_9;
    }
    v12 = self->_rightGrabberView == v8;
    v11 = -20.0;
    v13 = 20.0;
LABEL_6:
    if (v12)
      v11 = v13;
    goto LABEL_8;
  }
LABEL_9:

  return result;
}

- (CGRect)_frameForGrabberView:(id)a3 forState:(int64_t)a4 unified:(BOOL)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  UIRectIntegralWithScale();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_layoutGrabberView:(id)a3 forState:(int64_t)a4
{
  __int128 v6;
  id v7;
  uint64_t v8;
  _OWORD v9[3];

  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v9[0] = *MEMORY[0x24BDBD8B8];
  v9[1] = v6;
  v9[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v7 = a3;
  objc_msgSend(v7, "setTransform:", v9);
  -[SBUIChevronView _frameForGrabberView:forState:unified:](self, "_frameForGrabberView:forState:unified:", v7, a4, self->_unified);
  objc_msgSend(v7, "setFrame:");
  -[SBUIChevronView _transformForGrabberView:forState:](self, "_transformForGrabberView:forState:", v7, a4);
  objc_msgSend(v7, "setTransform:", &v8);

}

- (void)layoutSubviews
{
  UIView *alphaContainerView;

  alphaContainerView = self->_alphaContainerView;
  -[SBUIChevronView bounds](self, "bounds");
  -[UIView setFrame:](alphaContainerView, "setFrame:");
  if ((unint64_t)(self->_state + 1) <= 2)
  {
    -[SBUIChevronView _layoutGrabberView:forState:](self, "_layoutGrabberView:forState:", self->_leftGrabberView);
    -[SBUIChevronView _layoutGrabberView:forState:](self, "_layoutGrabberView:forState:", self->_rightGrabberView, self->_state);
  }
}

- (BOOL)_setState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 + 1) > 2)
    return 0;
  if (self->_state == a3)
    return 0;
  self->_state = a3;
  -[SBUIChevronView setNeedsLayout](self, "setNeedsLayout", v3, v4);
  return 1;
}

- (BOOL)_setUnified:(BOOL)a3
{
  int v3;
  int unified;
  void *v6;
  double v7;
  double alphaComponent;

  v3 = a3;
  unified = self->_unified;
  if (unified != a3)
  {
    self->_unified = a3;
    -[UIView setHidden:](self->_rightGrabberView, "setHidden:", a3);
    -[UIView layer](self->_alphaContainerView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", !self->_unified);

    v7 = 1.0;
    alphaComponent = 1.0;
    if (!self->_unified)
      alphaComponent = self->_alphaComponent;
    -[UIView setAlpha:](self->_alphaContainerView, "setAlpha:", alphaComponent);
    if (self->_unified)
      v7 = self->_alphaComponent;
    -[UIView setAlpha:](self->_leftGrabberView, "setAlpha:", v7);
  }
  return unified != v3;
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a4;
  if (-[SBUIChevronView _setState:](self, "_setState:", a3))
  {
    if (!self->_vibrantSettings)
    {
      -[SBUIChevronView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setShouldRasterize:", 0);

    }
    v7 = -[SBUIChevronView _setUnified:](self, "_setUnified:", 0);
    v8 = MEMORY[0x24BDAC760];
    if (v7)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __37__SBUIChevronView_setState_animated___block_invoke;
      v14[3] = &unk_24D4CFFF8;
      v14[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v14);
    }
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __37__SBUIChevronView_setState_animated___block_invoke_2;
    v13[3] = &unk_24D4CFFF8;
    v13[4] = self;
    v9 = (void (**)(_QWORD))MEMORY[0x2199F42EC](v13);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __37__SBUIChevronView_setState_animated___block_invoke_3;
    v12[3] = &unk_24D4D0660;
    v12[4] = self;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199F42EC](v12);
    if (v4)
    {
      v11 = (void *)MEMORY[0x24BDF6F90];
      -[SBUIChevronView animationDuration](self, "animationDuration");
      objc_msgSend(v11, "animateWithDuration:animations:completion:", v9, v10);
    }
    else
    {
      v9[2](v9);
      if (v10)
        v10[2](v10, 1);
    }

  }
}

uint64_t __37__SBUIChevronView_setState_animated___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[52];
  objc_msgSend(v1, "_frameForGrabberView:forState:unified:", v2, 0, 0);
  return objc_msgSend(v2, "setFrame:");
}

uint64_t __37__SBUIChevronView_setState_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __37__SBUIChevronView_setState_animated___block_invoke_3(uint64_t a1, int a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  id v8;

  if (a2)
  {
    v3 = *(_QWORD **)(a1 + 32);
    if (v3[55])
    {
      if (v3[58])
      {
        objc_msgSend(v3, "layer");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "scale");
        objc_msgSend(v4, "setRasterizationScale:");

        objc_msgSend(*(id *)(a1 + 32), "layer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setShouldRasterize:", 1);

      }
    }
    else
    {
      objc_msgSend(v3, "_setUnified:", 1);
      v6 = *(_QWORD **)(a1 + 32);
      v7 = (void *)v6[52];
      objc_msgSend(v6, "_frameForGrabberView:forState:unified:", v7, 0, 1);
      objc_msgSend(v7, "setFrame:");
    }
  }
}

- (void)setState:(int64_t)a3
{
  -[SBUIChevronView setState:animated:](self, "setState:animated:", a3, 0);
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIChevronView;
  -[SBUIChevronView description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
  v4 = self->_state + 1;
  if (v4 > 2)
    v5 = CFSTR("[Invalid]");
  else
    v5 = off_24D4D0680[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("; state: %@>"), v5);
  return (NSString *)v3;
}

- (void)setVibrantSettings:(id)a3
{
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *tintView;
  void *v14;
  UIView *v15;
  id v16;

  v16 = a3;
  v5 = -[_SBFVibrantSettings isEqual:](self->_vibrantSettings, "isEqual:", v16);
  v6 = v16;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrantSettings, a3);
    if (self->_vibrantSettings)
    {
      -[SBUIChevronView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[SBUIChevronView layer](self, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setShouldRasterize:", 0);

        -[UIView removeFromSuperview](self->_alphaContainerView, "removeFromSuperview");
        -[SBUIChevronView layer](self, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView layer](self->_alphaContainerView, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setMask:", v11);

      }
      -[UIView removeFromSuperview](self->_tintView, "removeFromSuperview");
      -[SBUIChevronView bounds](self, "bounds");
      objc_msgSend(v16, "tintViewWithFrame:");
      v12 = (UIView *)objc_claimAutoreleasedReturnValue();
      tintView = self->_tintView;
      self->_tintView = v12;

      -[SBUIChevronView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_tintView, self->_alphaContainerView);
    }
    else
    {
      -[UIView superview](self->_alphaContainerView, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v16;
      if (v14)
        goto LABEL_8;
      -[SBUIChevronView addSubview:](self, "addSubview:", self->_alphaContainerView);
      -[UIView removeFromSuperview](self->_tintView, "removeFromSuperview");
      v15 = self->_tintView;
      self->_tintView = 0;

    }
    v6 = v16;
  }
LABEL_8:

}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_backgroundView;
  UIView *backgroundView;
  UIView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    v8 = *p_backgroundView;
    -[SBUIChevronView bounds](self, "bounds");
    -[UIView setFrame:](v8, "setFrame:");
    -[SBUIChevronView addSubview:](self, "addSubview:", *p_backgroundView);
    -[SBUIChevronView sendSubviewToBack:](self, "sendSubviewToBack:", *p_backgroundView);
    v5 = v9;
  }

}

- (UIColor)color
{
  return self->_color;
}

- (_SBFVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_rightGrabberView, 0);
  objc_storeStrong((id *)&self->_leftGrabberView, 0);
}

@end
