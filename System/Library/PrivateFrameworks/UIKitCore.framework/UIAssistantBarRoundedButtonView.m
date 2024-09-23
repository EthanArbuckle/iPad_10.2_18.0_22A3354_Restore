@implementation UIAssistantBarRoundedButtonView

- (UIAssistantBarRoundedButtonView)initWithFrame:(CGRect)a3
{
  UIAssistantBarRoundedButtonView *v3;
  uint64_t v4;
  UIAssistantBarRoundedButtonViewButton *button;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIAssistantBarRoundedButtonView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIButton buttonWithType:](UIAssistantBarRoundedButtonViewButton, "buttonWithType:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIAssistantBarRoundedButtonViewButton *)v4;

    -[UIView _setContinuousCornerRadius:](v3->_button, "_setContinuousCornerRadius:", 6.0);
    -[UIView setClipsToBounds:](v3->_button, "setClipsToBounds:", 1);
    -[UIButton setContentHorizontalAlignment:](v3->_button, "setContentHorizontalAlignment:", 5);
    -[UIButton setContentVerticalAlignment:](v3->_button, "setContentVerticalAlignment:", 2);
    -[UIButton setContentEdgeInsets:](v3->_button, "setContentEdgeInsets:", 7.0, 13.0, 7.0, 13.0);
    -[UIView addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIAssistantBarRoundedButtonView button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7 + 33.0;
  -[UIView bounds](self, "bounds");
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setDropShadow:(BOOL)a3
{
  _BOOL4 v3;
  UIView *shadowView;
  UIView *v6;
  UIView *v7;
  void *v8;
  UIView *v9;
  void *v10;

  if (self->_dropShadow != a3)
  {
    v3 = a3;
    self->_dropShadow = a3;
    -[UIView removeFromSuperview](self->_shadowView, "removeFromSuperview");
    shadowView = self->_shadowView;
    self->_shadowView = 0;

    if (v3)
    {
      v6 = objc_alloc_init(UIView);
      v7 = self->_shadowView;
      self->_shadowView = v6;

      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.486, 0.49, 0.506, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_shadowView, "setBackgroundColor:", v8);

      -[UIView _setContinuousCornerRadius:](self->_shadowView, "_setContinuousCornerRadius:", 6.0);
      -[UIView setClipsToBounds:](self->_shadowView, "setClipsToBounds:", 1);
      v9 = self->_shadowView;
      -[UIAssistantBarRoundedButtonView button](self, "button");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView insertSubview:below:](self, "insertSubview:below:", v9, v10);

      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIAssistantBarRoundedButtonView;
  -[UIView layoutSubviews](&v16, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UIAssistantBarRoundedButtonView button](self, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v6, v8);
  v11 = v10;

  v12 = v11 + 33.0;
  v13 = v6 - v12;
  v14 = round(v4 + (v8 + -39.0) * 0.5);
  -[UIAssistantBarRoundedButtonView button](self, "button");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v13, v14, v12, 39.0);

  if (-[UIAssistantBarRoundedButtonView dropShadow](self, "dropShadow"))
    -[UIView setFrame:](self->_shadowView, "setFrame:", v13, v14 + 1.0, v12, 39.0);
}

- (BOOL)dropShadow
{
  return self->_dropShadow;
}

- (UIAssistantBarRoundedButtonViewButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end
