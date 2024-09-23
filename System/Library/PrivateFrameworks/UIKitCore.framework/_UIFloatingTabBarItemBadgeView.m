@implementation _UIFloatingTabBarItemBadgeView

- (_UIFloatingTabBarItemBadgeView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _UIFloatingTabBarItemBadgeView *v7;
  UILabel *v8;
  UILabel *textLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)_UIFloatingTabBarItemBadgeView;
  v7 = -[UIView initWithFrame:](&v16, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", x, y, width, height);
    textLabel = v7->_textLabel;
    v7->_textLabel = v8;

    -[UILabel setTextAlignment:](v7->_textLabel, "setTextAlignment:", 1);
    -[_UIFloatingTabBarItemBadgeView _currentPlatformMetrics](v7, "_currentPlatformMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "badgeFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_textLabel, "setFont:", v11);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_textLabel, "setTextColor:", v12);

    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v13);

    -[UIView layer](v7, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsEdgeAntialiasing:", 1);

    -[UIView _setOverrideVibrancyTrait:](v7, "_setOverrideVibrancyTrait:", 0);
    -[UIView _setOverrideUserInterfaceRenderingMode:](v7, "_setOverrideUserInterfaceRenderingMode:", 1);
    -[UIView addSubview:](v7, "addSubview:", v7->_textLabel);
  }
  return v7;
}

- (NSString)text
{
  return -[UILabel text](self->_textLabel, "text");
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_textLabel, "setText:", a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UIFloatingTabBarItemBadgeView _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "badgeInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", width, height);
  v16 = v10 + v14 + v15;
  v18 = v8 + v12 + v17;
  objc_msgSend(v6, "maximumBadgeWidth");
  v20 = fmax(v18, fmin(v16, v19));

  v21 = v20;
  v22 = v18;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
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
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double Width;
  double v22;
  void *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  v24.receiver = self;
  v24.super_class = (Class)_UIFloatingTabBarItemBadgeView;
  -[UIView layoutSubviews](&v24, sel_layoutSubviews);
  -[_UIFloatingTabBarItemBadgeView _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView bounds](self, "bounds");
  v13 = v7 + v12;
  v15 = v5 + v14;
  v17 = v16 - (v7 + v11);
  v19 = v18 - (v5 + v9);
  -[_UIFloatingTabBarItemBadgeView textLabel](self, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v25);
  -[UIView bounds](self, "bounds");
  v22 = fmin(Width, CGRectGetHeight(v26)) * 0.5;
  -[UIView layer](self, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCornerRadius:", v22);

}

- (id)_currentPlatformMetrics
{
  void *v2;
  void *v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
