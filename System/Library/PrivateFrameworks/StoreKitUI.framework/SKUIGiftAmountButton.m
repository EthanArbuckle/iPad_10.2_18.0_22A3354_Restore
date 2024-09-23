@implementation SKUIGiftAmountButton

- (SKUIGiftAmountButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIGiftAmountButton *v8;
  UIView *v9;
  UIView *borderView;
  UIView *v11;
  void *v12;
  UIView *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftAmountButton initWithFrame:].cold.1();
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUIGiftAmountButton;
  v8 = -[SKUIGiftAmountButton initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    borderView = v8->_borderView;
    v8->_borderView = v9;

    -[UIView setAutoresizingMask:](v8->_borderView, "setAutoresizingMask:", 18);
    v11 = v8->_borderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v13 = v8->_borderView;
    -[SKUIGiftAmountButton bounds](v8, "bounds");
    -[UIView setFrame:](v13, "setFrame:");
    -[UIView setUserInteractionEnabled:](v8->_borderView, "setUserInteractionEnabled:", 0);
    -[SKUIGiftAmountButton addSubview:](v8, "addSubview:", v8->_borderView);
    -[UIView layer](v8->_borderView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    objc_msgSend(v14, "setBorderWidth:", 1.0 / v17);

    objc_msgSend(v14, "setCornerRadius:", 7.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftAmountButton setTitleColor:forState:](v8, "setTitleColor:forState:", v18, 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftAmountButton setTitleColor:forState:](v8, "setTitleColor:forState:", v19, 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftAmountButton setTitleColor:forState:](v8, "setTitleColor:forState:", v20, 4);

    -[SKUIGiftAmountButton titleLabel](v8, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v22);

    -[SKUIGiftAmountButton titleLabel](v8, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMinimumScaleFactor:", 0.5);

    -[SKUIGiftAmountButton titleLabel](v8, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);

    -[SKUIGiftAmountButton titleLabel](v8, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNumberOfLines:", 1);

    -[SKUIGiftAmountButton titleLabel](v8, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLineBreakMode:", 2);

    -[SKUIGiftAmountButton setTitleEdgeInsets:](v8, "setTitleEdgeInsets:", 0.0, 5.0, 0.0, 5.0);
  }
  return v8;
}

- (void)drawRect:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftAmountButton;
  -[SKUIGiftAmountButton drawRect:](&v4, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SKUIGiftAmountButton _reloadBorderView](self, "_reloadBorderView");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftAmountButton;
  -[SKUIGiftAmountButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SKUIGiftAmountButton _reloadBorderView](self, "_reloadBorderView");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftAmountButton;
  -[SKUIGiftAmountButton setSelected:](&v4, sel_setSelected_, a3);
  -[SKUIGiftAmountButton _reloadBorderView](self, "_reloadBorderView");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)SKUIGiftAmountButton;
  -[SKUIGiftAmountButton sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  v4 = 44.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_reloadBorderView
{
  void *v3;
  void *v4;
  void *v5;
  UIView *borderView;
  void *v7;
  id v8;

  if ((-[SKUIGiftAmountButton isHighlighted](self, "isHighlighted") & 1) != 0
    || -[SKUIGiftAmountButton isSelected](self, "isSelected"))
  {
    -[SKUIGiftAmountButton tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_borderView, "setBackgroundColor:", v3);
    -[UIView layer](self->_borderView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v8 = v3;
  }
  else
  {
    borderView = self->_borderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](borderView, "setBackgroundColor:", v7);

    -[UIView layer](self->_borderView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4;
    v8 = v5;
  }
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(objc_retainAutorelease(v3), "CGColor"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftAmountButton initWithFrame:]";
}

@end
