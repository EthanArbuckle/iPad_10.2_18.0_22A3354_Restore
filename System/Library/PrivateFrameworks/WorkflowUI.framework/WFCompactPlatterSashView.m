@implementation WFCompactPlatterSashView

- (WFCompactPlatterSashView)initWithFrame:(CGRect)a3
{
  WFCompactPlatterSashView *v3;
  WFCompactPlatterSashView *v4;
  void *v5;
  id v6;
  UILabel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *label;
  UILabel *v13;
  void *v14;
  void *v15;
  UIVisualEffectView *v16;
  void *v17;
  UIVisualEffectView *visualEffectView;
  UIVisualEffectView *v19;
  WFCompactPlatterSashView *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WFCompactPlatterSashView;
  v3 = -[WFCompactPlatterSashView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFCompactPlatterSashView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    v6 = objc_alloc(MEMORY[0x24BEBD708]);
    v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v9);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v7, "setBackgroundColor:", v10);

    objc_msgSend((id)objc_opt_class(), "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v11);

    label = v4->_label;
    v4->_label = v7;
    v13 = v7;

    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBDAF0], "effectForBlurEffect:style:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v15);
    -[UIVisualEffectView contentView](v16, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v13);

    visualEffectView = v4->_visualEffectView;
    v4->_visualEffectView = v16;
    v19 = v16;

    -[WFCompactPlatterSashView addSubview:](v4, "addSubview:", v19);
    v20 = v4;

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double Width;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double MaxX;
  CGFloat v21;
  double v22;
  double v23;
  UILabel *label;
  CGFloat rect;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v26.receiver = self;
  v26.super_class = (Class)WFCompactPlatterSashView;
  -[WFCompactPlatterSashView layoutSubviews](&v26, sel_layoutSubviews);
  -[WFCompactPlatterSashView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WFIconHostingView iconSize](self->_iconView, "iconSize");
  rect = v11;
  -[WFIconHostingView iconSize](self->_iconView, "iconSize");
  v13 = v12;
  v14 = 22.0;
  if (-[WFCompactPlatterSashView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    Width = CGRectGetWidth(v27);
    -[WFIconHostingView iconSize](self->_iconView, "iconSize");
    v14 = Width - v16 + -18.0;
  }
  v17 = v8;
  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  v19 = v18;
  v28.origin.y = 18.0;
  v28.origin.x = v14;
  v28.size.width = rect;
  v28.size.height = v13;
  MaxX = CGRectGetMaxX(v28);
  if (-[WFCompactPlatterSashView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v17;
    v29.size.height = v10;
    v21 = CGRectGetWidth(v29) - v19;
    -[WFIconHostingView iconSize](self->_iconView, "iconSize");
    v23 = v21 - v22 + -18.0 + -8.0;
  }
  else
  {
    v23 = MaxX + 8.0;
  }
  -[WFIconHostingView setFrame:](self->_iconView, "setFrame:", v14);
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", v23, (24.0 - v13) * -0.5 + 18.0, v19, 24.0);
  label = self->_label;
  -[UIVisualEffectView bounds](self->_visualEffectView, "bounds");
  -[UILabel setFrame:](label, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  -[WFIconHostingView iconSize](self->_iconView, "iconSize", a3.width, a3.height);
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width - (v5 + 18.0), 1.79769313e308);
  v7 = v6;
  -[WFIconHostingView iconSize](self->_iconView, "iconSize");
  if (v8 + 18.0 >= v7)
    v9 = v8 + 18.0;
  else
    v9 = v7;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (double)contentBaseline
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;

  -[WFIconHostingView iconSize](self->_iconView, "iconSize");
  v3 = v2 + 10.0;
  objc_msgSend((id)objc_opt_class(), "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", 15.0);
  v6 = v5 + 10.0;

  if (v3 >= v6)
    return v3;
  else
    return v6;
}

- (void)setAppearanceProvider:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_appearanceProvider, a3);
  v5 = a3;
  -[WFCompactPlatterSashView label](self, "label");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterSashView iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurePlatterSashView:iconView:", v7, v6);

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  title = self->_title;
  self->_title = v4;

  -[UILabel setText:](self->_label, "setText:", v6);
}

- (void)setIcon:(id)a3
{
  WFIconHostingView *iconView;
  WFIconHostingView *v6;
  WFIconHostingView *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_icon, a3);
  iconView = self->_iconView;
  if (!iconView)
  {
    v6 = (WFIconHostingView *)objc_msgSend(objc_alloc(MEMORY[0x24BEC5168]), "initWithIcon:size:", v8, 20.0, 20.0);
    v7 = self->_iconView;
    self->_iconView = v6;

    -[WFCompactPlatterSashView addSubview:](self, "addSubview:", self->_iconView);
    -[WFCompactPlatterSashView setNeedsLayout](self, "setNeedsLayout");
    iconView = self->_iconView;
  }
  -[WFIconHostingView setIcon:](iconView, "setIcon:", v8);

}

- (NSString)title
{
  return self->_title;
}

- (WFIcon)icon
{
  return self->_icon;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (WFIconHostingView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)font
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15 = *MEMORY[0x24BEBB620];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB610]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x24BEBE220];
  v5 = *MEMORY[0x24BEBB590];
  v13[0] = *MEMORY[0x24BEBB588];
  v13[1] = v5;
  v14[0] = v4;
  v14[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB528]), "initWithFontAttributes:", v6);
  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scaledValueForValue:", 15.0);
  v10 = round(v9);

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v7, fmin(fmax(v10, 15.0), 22.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
