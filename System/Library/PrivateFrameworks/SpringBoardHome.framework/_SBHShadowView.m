@implementation _SBHShadowView

+ (BOOL)supportsMaterialsBasedShadow
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (_SBHShadowView)initWithFrame:(CGRect)a3
{
  _SBHShadowView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SBHShadowView;
  result = -[_SBHShadowView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_useMaterialBasedShadow = 1;
  return result;
}

- (void)layoutSubviews
{
  CALayer *shadowLayer;
  void *v4;
  MTShadowView *shadowView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SBHShadowView;
  -[_SBHShadowView layoutSubviews](&v6, sel_layoutSubviews);
  shadowLayer = self->_shadowLayer;
  if (!shadowLayer)
  {
    if (self->_shadowView)
    {
      shadowLayer = 0;
    }
    else
    {
      -[_SBHShadowView _updateShadow](self, "_updateShadow");
      shadowLayer = self->_shadowLayer;
    }
  }
  -[_SBHShadowView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[CALayer setFrame:](shadowLayer, "setFrame:");

  shadowView = self->_shadowView;
  -[_SBHShadowView bounds](self, "bounds");
  -[MTShadowView setFrame:](shadowView, "setFrame:");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  -[_SBHShadowView _continuousCornerRadius](self, "_continuousCornerRadius");
  v5.receiver = self;
  v5.super_class = (Class)_SBHShadowView;
  -[_SBHShadowView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_, a3);
  -[_SBHShadowView _continuousCornerRadius](self, "_continuousCornerRadius");
  if ((BSFloatEqualToFloat() & 1) == 0)
    -[_SBHShadowView _updateShadow](self, "_updateShadow");
}

- (void)setUseMaterialBasedShadow:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  v3 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "supportsMaterialsBasedShadow");
  if (self->_useMaterialBasedShadow != (v5 & v3))
  {
    self->_useMaterialBasedShadow = v5 & v3;
    -[_SBHShadowView _updateShadow](self, "_updateShadow");
    -[_SBHShadowView setNeedsLayout](self, "setNeedsLayout");
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled"))
      -[_SBHShadowView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)_updateShadow
{
  double v3;
  double v4;
  CALayer *v5;
  MTShadowView *v6;
  double v7;
  MTShadowView *v8;
  MTShadowView *v9;
  CALayer *shadowLayer;
  MTShadowView *shadowView;
  MTShadowView *v12;
  CALayer *v13;
  CALayer *v14;
  CALayer *v15;
  CALayer *v16;
  id v17;
  double v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  -[_SBHShadowView _continuousCornerRadius](self, "_continuousCornerRadius");
  v4 = v3;
  if (self->_useMaterialBasedShadow)
  {
    if (!objc_msgSend((id)objc_opt_class(), "supportsMaterialsBasedShadow")
      || !self->_useMaterialBasedShadow)
    {
      -[CALayer removeFromSuperlayer](self->_shadowLayer, "removeFromSuperlayer");
      shadowLayer = self->_shadowLayer;
      self->_shadowLayer = 0;

      -[MTShadowView removeFromSuperview](self->_shadowView, "removeFromSuperview");
      shadowView = self->_shadowView;
      self->_shadowView = 0;

      return;
    }
    -[CALayer removeFromSuperlayer](self->_shadowLayer, "removeFromSuperlayer");
    v5 = self->_shadowLayer;
    self->_shadowLayer = 0;

    if (v4 > 0.0)
    {
      v6 = self->_shadowView;
      if (v6)
      {
        -[MTShadowView maskCornerRadius](v6, "maskCornerRadius");
        if (v7 == v4)
          return;
        v6 = self->_shadowView;
      }
      -[MTShadowView removeFromSuperview](v6, "removeFromSuperview");
      v20 = 1065353216;
      v21 = xmmword_1D0190CF0;
      v22 = 0x4032000000000000;
      v8 = (MTShadowView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D474A0]), "initWithShadowAttributes:maskCornerRadius:", &v20, v4);
      v9 = self->_shadowView;
      self->_shadowView = v8;

      -[_SBHShadowView addSubview:](self, "addSubview:", self->_shadowView);
    }
  }
  else
  {
    -[MTShadowView removeFromSuperview](self->_shadowView, "removeFromSuperview");
    v12 = self->_shadowView;
    self->_shadowView = 0;

    v13 = self->_shadowLayer;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v14 = (CALayer *)objc_claimAutoreleasedReturnValue();
      v15 = self->_shadowLayer;
      self->_shadowLayer = v14;

      -[CALayer setShadowPathIsBounds:](self->_shadowLayer, "setShadowPathIsBounds:", 1);
      v16 = self->_shadowLayer;
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setShadowColor:](v16, "setShadowColor:", objc_msgSend(v17, "CGColor"));

      -[CALayer setShadowOffset:](self->_shadowLayer, "setShadowOffset:", 0.0, 18.0);
      -[CALayer setShadowRadius:](self->_shadowLayer, "setShadowRadius:", 18.0);
      LODWORD(v18) = 0.25;
      -[CALayer setShadowOpacity:](self->_shadowLayer, "setShadowOpacity:", v18);
      -[CALayer setCornerCurve:](self->_shadowLayer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
      -[_SBHShadowView layer](self, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSublayer:", self->_shadowLayer);

      v13 = self->_shadowLayer;
    }
    -[CALayer setCornerRadius:](v13, "setCornerRadius:", v4);
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zPosition")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SBHShadowView;
    v5 = -[_SBHShadowView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (CGRect)frameWithContentWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MTShadowView *shadowView;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_useMaterialBasedShadow)
  {
    shadowView = self->_shadowView;
    if (!shadowView)
    {
      -[_SBHShadowView _updateShadow](self, "_updateShadow");
      -[_SBHShadowView setNeedsLayout](self, "setNeedsLayout");
      shadowView = self->_shadowView;
    }
    -[MTShadowView frameWithContentWithFrame:](shadowView, "frameWithContentWithFrame:", x, y, width, height);
    x = v9;
    y = v10;
    width = v11;
    height = v12;
    -[MTShadowView setFrame:](self->_shadowView, "setFrame:");
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)useMaterialBasedShadow
{
  return self->_useMaterialBasedShadow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end
