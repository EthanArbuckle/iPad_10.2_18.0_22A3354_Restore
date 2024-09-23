@implementation CarFocusableBlurControl

- (CarFocusableBlurControl)init
{
  CarFocusableBlurControl *v2;
  CarFocusableBlurControl *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarFocusableBlurControl;
  v2 = -[CarFocusableBlurControl init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CarFocusableBlurControl _commonInit](v2, "_commonInit");
  return v3;
}

- (CarFocusableBlurControl)initWithFrame:(CGRect)a3
{
  CarFocusableBlurControl *v3;
  CarFocusableBlurControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarFocusableBlurControl;
  v3 = -[CarFocusableControl initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CarFocusableBlurControl _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  CarDynamicBlurView *v3;
  CarDynamicBlurView *blurView;
  void *v5;
  void *v6;

  self->_castsShadow = 1;
  v3 = (CarDynamicBlurView *)objc_claimAutoreleasedReturnValue(-[CarFocusableBlurControl _mapsCar_injectBlurView](self, "_mapsCar_injectBlurView"));
  blurView = self->_blurView;
  self->_blurView = v3;

  -[CarFocusableBlurControl setClipsToBounds:](self, "setClipsToBounds:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableBlurControl layer](self, "layer"));
  objc_msgSend(v5, "setMasksToBounds:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableBlurControl layer](self, "layer"));
  objc_msgSend(v6, "setShadowPathIsBounds:", 1);

  -[CarFocusableBlurControl setRoundedCorners:](self, "setRoundedCorners:", -1);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarFocusableBlurControl;
  -[CarFocusableBlurControl didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableBlurControl window](self, "window"));

  if (v3)
    -[CarFocusableBlurControl _updateShadow](self, "_updateShadow");
}

- (void)layoutSubviews
{
  unint64_t v3;
  _BOOL8 v4;
  double roundedCornerRadius;
  void *v6;
  const CALayerCornerCurve *v7;
  CALayerCornerCurve v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)CarFocusableBlurControl;
  -[CarFocusableControl layoutSubviews](&v15, "layoutSubviews");
  -[CarFocusableBlurControl bounds](self, "bounds");
  if (!CGRectEqualToRect(v16, self->_lastBounds)
    || self->_roundedCorners != self->_lastRoundedCorners
    || self->_roundedCornerRadius != self->_lastRoundedCornerRadius)
  {
    v3 = self->_roundedCorners & 0xF;
    v4 = -[CarFocusableBlurControl needsContinuousRoundedCorners](self, "needsContinuousRoundedCorners");
    -[CarDynamicBlurView _setCornerRadius:continuous:maskedCorners:](self->_blurView, "_setCornerRadius:continuous:maskedCorners:", v4, v3, self->_roundedCornerRadius);
    roundedCornerRadius = self->_roundedCornerRadius;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableBlurControl layer](self, "layer"));
    objc_msgSend(v6, "setCornerRadius:", roundedCornerRadius);

    v7 = &kCACornerCurveContinuous;
    if (!v4)
      v7 = &kCACornerCurveCircular;
    v8 = *v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableBlurControl layer](self, "layer"));
    objc_msgSend(v9, "setCornerCurve:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableBlurControl layer](self, "layer"));
    objc_msgSend(v10, "setMaskedCorners:", v3);

    -[CarFocusableBlurControl bounds](self, "bounds");
    self->_lastBounds.origin.x = v11;
    self->_lastBounds.origin.y = v12;
    self->_lastBounds.size.width = v13;
    self->_lastBounds.size.height = v14;
    self->_lastRoundedCorners = self->_roundedCorners;
    self->_lastRoundedCornerRadius = self->_roundedCornerRadius;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarFocusableBlurControl;
  v4 = a3;
  -[CarFocusableControl traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableBlurControl traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[CarFocusableBlurControl _updateShadow](self, "_updateShadow");
}

- (BOOL)needsContinuousRoundedCorners
{
  return 1;
}

- (id)backgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView contentView](self->_blurView, "contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backgroundColor"));

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  CarDynamicBlurView *blurView;
  id v4;
  id v5;

  blurView = self->_blurView;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarDynamicBlurView contentView](blurView, "contentView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setRoundedCorners:(unint64_t)a3
{
  if (self->_roundedCorners != a3)
  {
    self->_roundedCorners = a3;
    -[CarFocusableBlurControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRoundedCornerRadius:(double)a3
{
  if (self->_roundedCornerRadius != a3)
  {
    self->_roundedCornerRadius = a3;
    -[CarFocusableBlurControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHidesBlur:(BOOL)a3
{
  if (self->_hidesBlur != a3)
  {
    self->_hidesBlur = a3;
    -[CarDynamicBlurView setAlpha:](self->_blurView, "setAlpha:", (double)!a3);
  }
}

- (void)setCastsShadow:(BOOL)a3
{
  if (self->_castsShadow != a3)
  {
    self->_castsShadow = a3;
    -[CarFocusableBlurControl _updateShadow](self, "_updateShadow");
  }
}

- (void)_updateShadow
{
  void *v3;
  double v4;
  id v5;

  if (self->_castsShadow)
  {
    -[CarFocusableBlurControl _mapsCar_updateShadow](self, "_mapsCar_updateShadow");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableBlurControl layer](self, "layer"));
    objc_msgSend(v3, "setShadowRadius:", 0.0);

    v5 = (id)objc_claimAutoreleasedReturnValue(-[CarFocusableBlurControl layer](self, "layer"));
    LODWORD(v4) = 0;
    objc_msgSend(v5, "setShadowOpacity:", v4);

  }
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (double)roundedCornerRadius
{
  return self->_roundedCornerRadius;
}

- (BOOL)castsShadow
{
  return self->_castsShadow;
}

- (BOOL)hidesBlur
{
  return self->_hidesBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
