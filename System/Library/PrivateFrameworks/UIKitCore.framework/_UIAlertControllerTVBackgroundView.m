@implementation _UIAlertControllerTVBackgroundView

+ (CGSize)backgroundInsetAmount
{
  double v2;
  double v3;
  CGSize result;

  v2 = 30.0;
  v3 = 7.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_UIAlertControllerTVBackgroundView)initWithFrame:(CGRect)a3
{
  _UIAlertControllerTVBackgroundView *v3;
  _UIAlertControllerTVBackgroundView *v4;
  UIView *v5;
  uint64_t v6;
  UIView *backgroundView;
  _UIFloatingShadowView *v8;
  uint64_t v9;
  _UIFloatingShadowView *shadowView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIAlertControllerTVBackgroundView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_isHighlighted = 0;
    v3->_isPressed = 0;
    v5 = [UIView alloc];
    -[UIView bounds](v4, "bounds");
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIView *)v6;

    -[UIView addSubview:](v4, "addSubview:", v4->_backgroundView);
    v8 = [_UIFloatingShadowView alloc];
    -[UIView bounds](v4, "bounds");
    v9 = -[_UIFloatingShadowView initWithFrame:](v8, "initWithFrame:");
    shadowView = v4->_shadowView;
    v4->_shadowView = (_UIFloatingShadowView *)v9;

    -[_UIFloatingShadowView setShadowExpansion:](v4->_shadowView, "setShadowExpansion:", 5.0);
    -[UIView insertSubview:atIndex:](v4, "insertSubview:atIndex:", v4->_shadowView, 0);
    -[_UIAlertControllerTVBackgroundView setAlpha:forState:](v4, "setAlpha:forState:", 0, 0.1);
    -[_UIAlertControllerTVBackgroundView setAlpha:forState:](v4, "setAlpha:forState:", 4, 0.8);
    -[_UIAlertControllerTVBackgroundView setAlpha:forState:](v4, "setAlpha:forState:", 1, 0.8);
  }
  return v4;
}

- (void)layoutSubviews
{
  UIView *backgroundView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  UIView *v16;
  _UIFloatingShadowView *shadowView;
  CGRect v18;
  CGRect v19;

  backgroundView = self->_backgroundView;
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend((id)objc_opt_class(), "backgroundInsetAmount");
  v13 = v12;
  objc_msgSend((id)objc_opt_class(), "backgroundInsetAmount");
  v15 = v14;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v19 = CGRectInset(v18, v13, v15);
  -[UIView setFrame:](backgroundView, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  v16 = self->_backgroundView;
  -[_UIAlertControllerTVBackgroundView _alphaForHighlighted:pressed:](self, "_alphaForHighlighted:pressed:", self->_isHighlighted, self->_isPressed);
  -[UIView setAlpha:](v16, "setAlpha:");
  shadowView = self->_shadowView;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](shadowView, "setFrame:");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerTVBackgroundView;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  if (self->_shouldUseTintColorAsBackgroundColor)
    -[_UIAlertControllerTVBackgroundView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)_updateBackgroundColor
{
  UIView *backgroundView;
  id v3;

  backgroundView = self->_backgroundView;
  -[UIView tintColor](self, "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](backgroundView, "setBackgroundColor:", v3);

}

- (void)setShouldUseTintColorAsBackgroundColor:(BOOL)a3
{
  if (self->_shouldUseTintColorAsBackgroundColor != a3)
  {
    if (a3)
      -[_UIAlertControllerTVBackgroundView _updateBackgroundColor](self, "_updateBackgroundColor");
    else
      -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", 0);
    self->_shouldUseTintColorAsBackgroundColor = a3;
  }
}

- (void)setAlpha:(double)a3 forState:(unint64_t)a4
{
  double v5;
  NSMutableDictionary *alphas;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v5 = a3;
  alphas = self->_alphas;
  if (!alphas)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_alphas;
    self->_alphas = v8;

    alphas = self->_alphas;
  }
  *(float *)&a3 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](alphas, "setObject:forKey:", v11, v10);

}

- (double)alphaForState:(unint64_t)a3
{
  NSMutableDictionary *alphas;
  void *v4;
  void *v5;
  float v6;
  double v7;

  alphas = self->_alphas;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](alphas, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (void)setCornerRadius:(double)a3
{
  void *v5;

  -[UIView layer](self->_backgroundView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", a3);

  -[_UIFloatingShadowView setCornerRadius:](self->_shadowView, "setCornerRadius:", a3);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->_shadowView, "_setContinuousCornerRadius:", a3);
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  void *v5;
  id v6;

  -[UIView layer](self->_backgroundView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", a3);

  -[UIView layer](self->_shadowView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskedCorners:", a3);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 isHighlighted;
  _BOOL8 v4;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  double v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD aBlock[6];
  BOOL v15;

  isHighlighted = self->_isHighlighted;
  if (isHighlighted != a3)
  {
    v4 = a3;
    -[_UIAlertControllerTVBackgroundView _alphaForHighlighted:pressed:](self, "_alphaForHighlighted:pressed:", isHighlighted, self->_isPressed);
    v7 = v6;
    -[_UIAlertControllerTVBackgroundView _alphaForHighlighted:pressed:](self, "_alphaForHighlighted:pressed:", v4, self->_isPressed);
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53___UIAlertControllerTVBackgroundView_setHighlighted___block_invoke;
    aBlock[3] = &unk_1E16BFE60;
    aBlock[4] = self;
    aBlock[5] = v9;
    v15 = v4;
    v10 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      if (v4)
        v11 = 0.1;
      else
        v11 = 0.2;
      -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v7);
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __53___UIAlertControllerTVBackgroundView_setHighlighted___block_invoke_2;
      v12[3] = &unk_1E16B1BF8;
      v13 = v10;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v12, v11);

    }
    else
    {
      v10[2](v10);
    }
    self->_isHighlighted = v4;

  }
}

- (void)setPressed:(BOOL)a3
{
  _BOOL4 isPressed;
  _BOOL8 v4;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void (**v23)(_QWORD);
  _QWORD v24[4];
  void (**v25)(_QWORD);
  _QWORD aBlock[10];

  isPressed = self->_isPressed;
  if (isPressed != a3)
  {
    v4 = a3;
    -[_UIAlertControllerTVBackgroundView _alphaForHighlighted:pressed:](self, "_alphaForHighlighted:pressed:", self->_isHighlighted, isPressed);
    v7 = v6;
    -[_UIAlertControllerTVBackgroundView _alphaForHighlighted:pressed:](self, "_alphaForHighlighted:pressed:", self->_isHighlighted, v4);
    v9 = v8;
    -[_UIAlertControllerTVBackgroundView _shadowOpacity](self, "_shadowOpacity");
    v11 = v10;
    -[_UIAlertControllerTVBackgroundView _shadowOffset](self, "_shadowOffset");
    v13 = v12;
    v15 = v14;
    -[_UIAlertControllerTVBackgroundView _shadowRadius](self, "_shadowRadius");
    if (v4)
      v17 = v15;
    else
      v17 = 5.0;
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    v19 = 0.0;
    if (!v4)
      v19 = v13;
    aBlock[1] = 3221225472;
    aBlock[2] = __49___UIAlertControllerTVBackgroundView_setPressed___block_invoke;
    aBlock[3] = &unk_1E16E0798;
    if (v4)
      v20 = 5.0;
    else
      v20 = v15;
    if (v4)
      v21 = v16;
    else
      v21 = 5.0;
    if (v4)
      v16 = 5.0;
    aBlock[4] = self;
    if (v4)
      v22 = 0.1;
    else
      v22 = v11;
    aBlock[5] = v9;
    *(double *)&aBlock[6] = v22;
    *(double *)&aBlock[7] = v19;
    *(double *)&aBlock[8] = v20;
    *(double *)&aBlock[9] = v16;
    v23 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      if (!v4)
        v11 = 0.1;
      -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v7);
      -[UIView setAlpha:](self->_shadowView, "setAlpha:", v11);
      if (self->_shouldShowShadow)
      {
        -[_UIFloatingShadowView setShadowVerticalOffset:](self->_shadowView, "setShadowVerticalOffset:", v17);
        -[_UIFloatingShadowView setShadowRadius:](self->_shadowView, "setShadowRadius:", v21);
      }
      v24[0] = v18;
      v24[1] = 3221225472;
      v24[2] = __49___UIAlertControllerTVBackgroundView_setPressed___block_invoke_2;
      v24[3] = &unk_1E16B1BF8;
      v25 = v23;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v24, 0.1);

    }
    else
    {
      v23[2](v23);
    }
    self->_isPressed = v4;

  }
}

- (void)setShouldShowShadow:(BOOL)a3
{
  _UIFloatingShadowView *shadowView;
  double v6;

  if (self->_shouldShowShadow != a3)
  {
    shadowView = self->_shadowView;
    v6 = 0.0;
    if (a3)
      -[_UIAlertControllerTVBackgroundView _shadowOpacity](self, "_shadowOpacity", 0.0);
    -[_UIFloatingShadowView setShadowOpacity:](shadowView, "setShadowOpacity:", v6);
    self->_shouldShowShadow = a3;
  }
}

- (double)_alphaForHighlighted:(BOOL)a3 pressed:(BOOL)a4
{
  double result;

  if (a4)
    *(_QWORD *)&a3 = 4;
  else
    *(_QWORD *)&a3 = a3;
  -[_UIAlertControllerTVBackgroundView alphaForState:](self, "alphaForState:", a3);
  return result;
}

- (id)_displayedBackgroundColor
{
  return -[UIView backgroundColor](self->_backgroundView, "backgroundColor");
}

- (CGSize)_shadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.3;
}

- (double)_shadowRadius
{
  return 15.0;
}

- (BOOL)shouldUseTintColorAsBackgroundColor
{
  return self->_shouldUseTintColorAsBackgroundColor;
}

- (_UIFloatingShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void)setIsHighlighted:(BOOL)a3
{
  self->_isHighlighted = a3;
}

- (BOOL)isPressed
{
  return self->_isPressed;
}

- (void)setIsPressed:(BOOL)a3
{
  self->_isPressed = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (BOOL)shouldShowShadow
{
  return self->_shouldShowShadow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_alphas, 0);
}

@end
