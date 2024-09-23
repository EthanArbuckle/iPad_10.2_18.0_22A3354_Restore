@implementation _UIReflectingView

- (id)_gradientLayer
{
  return -[UIView layer](self->_gradientView, "layer");
}

- (_UIReflectingView)initWithFrame:(CGRect)a3
{
  _UIReflectingView *v3;
  _UIReflectingView *v4;
  _UIReflectingContainerView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIView *containerView;
  void *v12;
  _UIReflectingGradientView *v13;
  UIView *gradientView;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UIReflectingView;
  v3 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    v5 = [_UIReflectingContainerView alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    containerView = v4->_containerView;
    v4->_containerView = (UIView *)v10;

    -[UIView setClipsToBounds:](v4->_containerView, "setClipsToBounds:", 0);
    -[UIView layer](v4->_containerView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInstanceCount:", 2);

    v13 = -[UIView initWithFrame:]([_UIReflectingGradientView alloc], "initWithFrame:", v6, v7, v8, v9);
    gradientView = v4->_gradientView;
    v4->_gradientView = &v13->super;

    -[_UIReflectingView _gradientLayer](v4, "_gradientLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEndPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    -[UIView setUserInteractionEnabled:](v4->_gradientView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](v4, "addSubview:", v4->_containerView);
    -[UIView addSubview:](v4, "addSubview:", v4->_gradientView);
    -[_UIReflectingView setReflectionAlpha:](v4, "setReflectionAlpha:", 0.5);
    -[_UIReflectingView setReflectionFraction:](v4, "setReflectionFraction:", 0.5);
    -[_UIReflectingView setBackgroundColor:](v4, "setBackgroundColor:", 0);
    -[UIView setNeedsLayout](v4, "setNeedsLayout");
    -[UIView layoutIfNeeded](v4, "layoutIfNeeded");
  }
  return v4;
}

- (void)_updateGradientColors
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  -[UIView backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIView backgroundColor](self, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView backgroundColor](self, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIReflectingView reflectionAlpha](self, "reflectionAlpha");
    objc_msgSend(v5, "colorWithAlphaComponent:", 1.0 - v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIReflectingView reflectionAlpha](self, "reflectionAlpha");
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_UIReflectingView _gradientLayer](self, "_gradientLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99D20];
  v14 = objc_retainAutorelease(v4);
  v11 = objc_msgSend(v14, "CGColor");
  v12 = objc_retainAutorelease(v7);
  objc_msgSend(v10, "arrayWithObjects:", v11, objc_msgSend(v12, "CGColor"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColors:", v13);

}

- (double)reflectionAlpha
{
  return self->_reflectionAlpha;
}

- (void)setReflectionAlpha:(double)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  if (a3 > 1.0 || a3 < 0.0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@'s reflectionAlpha value must be between 0 and 1"), v8);

  }
  self->_reflectionAlpha = a3;
  -[_UIReflectingView _updateGradientColors](self, "_updateGradientColors");
}

- (double)reflectionFraction
{
  void *v2;
  double v3;
  double v4;

  -[_UIReflectingView _gradientLayer](self, "_gradientLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startPoint");
  v4 = v3;

  return v4;
}

- (void)setReflectionFraction:(double)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;

  if (a3 > 1.0 || a3 < 0.0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@'s reflectionFraction value must be between 0 and 1"), v8);

  }
  -[_UIReflectingView _gradientLayer](self, "_gradientLayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStartPoint:", 0.0, a3);

}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIReflectingView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
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
  void *v10;
  CATransform3D v11;
  CATransform3D v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIReflectingView;
  -[UIView layoutSubviews](&v13, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_containerView, "setFrame:");
  -[UIView bounds](self, "bounds");
  v8 = v7;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_gradientView, "setFrame:", v8, v6 + v9, v4, v6);
  -[UIView layer](self->_containerView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeTranslation(&v11, 0.0, v6, 0.0);
  CATransform3DScale(&v12, &v11, 1.0, -1.0, 1.0);
  objc_msgSend(v10, "setInstanceTransform:", &v12);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "alphaComponent");
    if (v6 < 1.0)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99778];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", v8, CFSTR("%@ doesn't support non-opaque background colors."), v10);

    }
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIReflectingView;
  -[UIView setBackgroundColor:](&v13, sel_setBackgroundColor_, v5);
  if (v5)
    v11 = 0;
  else
    v11 = *MEMORY[0x1E0CD2C50];
  -[UIView setOpaque:](self, "setOpaque:", v5 != 0);
  -[UIView setOpaque:](self->_containerView, "setOpaque:", v5 != 0);
  -[UIView setOpaque:](self->_gradientView, "setOpaque:", 0);
  -[_UIReflectingView _gradientLayer](self, "_gradientLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCompositingFilter:", v11);

  -[_UIReflectingView _updateGradientColors](self, "_updateGradientColors");
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
