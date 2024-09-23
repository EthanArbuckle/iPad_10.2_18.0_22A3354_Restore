@implementation _UIParallaxDimmingView

- (_UIParallaxDimmingView)initWithFrame:(CGRect)a3
{
  return -[_UIParallaxDimmingView initWithFrame:overrideDimmingColor:](self, "initWithFrame:overrideDimmingColor:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIParallaxDimmingView)initWithFrame:(CGRect)a3 overrideDimmingColor:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIParallaxDimmingView *v10;
  _UIParallaxDimmingView *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIParallaxDimmingView;
  v10 = -[UIView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    if (v9)
    {
      -[_UIParallaxDimmingView setDimmingColor:](v10, "setDimmingColor:", v9);
    }
    else
    {
      +[UIColor blackColor](UIColor, "blackColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "colorWithAlphaComponent:", 0.1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIParallaxDimmingView setDimmingColor:](v11, "setDimmingColor:", v13);

    }
    -[_UIParallaxDimmingView dimmingColor](v11, "dimmingColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v14);

    -[UIView setOpaque:](v11, "setOpaque:", 0);
    v11->_backgroundDimmingAmount = 1.0;
  }

  return v11;
}

- (id)defaultBorderColor
{
  void *v2;
  void *v3;
  double v5;
  uint64_t v6;

  v5 = 0.0;
  v6 = 0;
  -[_UIParallaxDimmingView dimmingColor](self, "dimmingColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getWhite:alpha:", &v6, &v5);
  objc_msgSend(v2, "colorWithAlphaComponent:", v5 * 1.05);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)initViewWrappingView:(id)a3 withLeftBorder:(double)a4 shouldReverseLayoutDirection:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  _UIParallaxDimmingView *v8;
  _UIParallaxDimmingView *v9;
  _UIVerticalEdgeShadowView *v10;
  UIImageView *leftEdgeFade;

  v5 = a5;
  v7 = a3;
  objc_msgSend(v7, "frame");
  v8 = -[_UIParallaxDimmingView initWithFrame:](self, "initWithFrame:");
  v9 = v8;
  if (v8)
  {
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", 0);
    -[UIView bounds](v9, "bounds");
    objc_msgSend(v7, "setFrame:");
    -[_UIParallaxDimmingView setAddingSubview:](v9, "setAddingSubview:", v7);
    v10 = -[_UIVerticalEdgeShadowView initWithWidth:edge:]([_UIVerticalEdgeShadowView alloc], "initWithWidth:edge:", 2, 9.0);
    leftEdgeFade = v9->leftEdgeFade;
    v9->leftEdgeFade = &v10->super.super;

    -[_UIParallaxDimmingView _updateLeftEdgeFade:](v9, "_updateLeftEdgeFade:", v5);
    -[UIView addSubview:](v9, "addSubview:", v9->leftEdgeFade);
  }

  return v9;
}

- (void)_updateLeftEdgeFade:(BOOL)a3
{
  double v5;
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
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;

  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView frame](self->leftEdgeFade, "frame");
  v15 = v14;
  if (a3)
  {
    v16 = 4;
    v8 = v13;
  }
  else
  {
    -[UIView frame](self->leftEdgeFade, "frame");
    v10 = v6 - v17;
    v16 = 3;
  }
  -[UIImageView setFrame:](self->leftEdgeFade, "setFrame:", v10, v8, v15, v12);
  -[UIView bounds](self->leftEdgeFade, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[UIView maskView](self->leftEdgeFade, "maskView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  -[UIView setSemanticContentAttribute:](self, "setSemanticContentAttribute:", v16);
  -[UIImageView setSemanticContentAttribute:](self->leftEdgeFade, "setSemanticContentAttribute:", v16);
}

- (void)didMoveToWindow
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIParallaxDimmingView;
  -[UIView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_UIParallaxDimmingView addingSubview](self, "addingSubview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UIParallaxDimmingView addingSubview](self, "addingSubview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self, "addSubview:", v6);

      -[_UIParallaxDimmingView setAddingSubview:](self, "setAddingSubview:", 0);
    }
  }
}

- (id)_basicAnimationWithKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a3);
}

- (void)setBackgroundDimmingAmount:(double)a3
{
  if (self->_backgroundDimmingAmount != a3)
  {
    self->_backgroundDimmingAmount = a3;
    if (self->leftEdgeFade)
      self = (_UIParallaxDimmingView *)self->leftEdgeFade;
    -[UIView setAlpha:](self, "setAlpha:");
  }
}

- (double)presentationDimmingAmount
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  if (self->leftEdgeFade)
    self = (_UIParallaxDimmingView *)self->leftEdgeFade;
  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "opacity");
  v5 = v4;

  return v5;
}

- (void)crossFade
{
  double v3;
  BOOL v4;
  double v5;

  -[_UIParallaxDimmingView backgroundDimmingAmount](self, "backgroundDimmingAmount");
  v4 = v3 == 1.0;
  v5 = 0.0;
  if (!v4)
    v5 = 1.0;
  -[_UIParallaxDimmingView setBackgroundDimmingAmount:](self, "setBackgroundDimmingAmount:", v5);
}

- (double)backgroundDimmingAmount
{
  return self->_backgroundDimmingAmount;
}

- (UIColor)dimmingColor
{
  return self->_dimmingColor;
}

- (void)setDimmingColor:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingColor, a3);
}

- (UIView)addingSubview
{
  return self->_addingSubview;
}

- (void)setAddingSubview:(id)a3
{
  objc_storeStrong((id *)&self->_addingSubview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addingSubview, 0);
  objc_storeStrong((id *)&self->_dimmingColor, 0);
  objc_storeStrong((id *)&self->leftEdgeFade, 0);
}

@end
