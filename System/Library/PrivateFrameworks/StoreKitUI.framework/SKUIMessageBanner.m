@implementation SKUIMessageBanner

- (SKUIMessageBanner)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIMessageBanner *v16;
  UILabel *v17;
  UILabel *label;
  uint64_t v19;
  UIButton *button;
  UIView *v21;
  UIView *borderView;
  UIView *v23;
  void *v24;
  void *v25;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIMessageBanner initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUIMessageBanner;
  v16 = -[SKUIMessageBanner initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v16->_label;
    v16->_label = v17;

    -[UILabel setNumberOfLines:](v16->_label, "setNumberOfLines:", 0);
    -[SKUIMessageBanner addSubview:](v16, "addSubview:", v16->_label);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v19 = objc_claimAutoreleasedReturnValue();
    button = v16->_button;
    v16->_button = (UIButton *)v19;

    -[UIButton addTarget:action:forControlEvents:](v16->_button, "addTarget:action:forControlEvents:", v16, sel__buttonAction_, 64);
    -[SKUIMessageBanner addSubview:](v16, "addSubview:", v16->_button);
    v21 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    borderView = v16->_borderView;
    v16->_borderView = v21;

    v23 = v16->_borderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    -[SKUIMessageBanner addSubview:](v16, "addSubview:", v16->_borderView);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMessageBanner setBackgroundColor:](v16, "setBackgroundColor:", v25);

  }
  return v16;
}

- (BOOL)showsClearButton
{
  return self->_clearButton != 0;
}

- (void)setShowsClearButton:(BOOL)a3
{
  SKUIMessageBannerCloseButton *v5;
  UIButton *clearButton;
  UIButton *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  UIButton *v12;

  if (-[SKUIMessageBanner showsClearButton](self, "showsClearButton") != a3)
  {
    if (a3)
    {
      v5 = objc_alloc_init(SKUIMessageBannerCloseButton);
      clearButton = self->_clearButton;
      self->_clearButton = &v5->super;

      -[UIButton addTarget:action:forControlEvents:](self->_clearButton, "addTarget:action:forControlEvents:", self, sel__clearButtonAction_, 64);
      -[UIButton setAdjustsImageWhenHighlighted:](self->_clearButton, "setAdjustsImageWhenHighlighted:", 0);
      v7 = self->_clearButton;
      v8 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageNamed:inBundle:", CFSTR("BannerCloseButton"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setImage:forState:](v7, "setImage:forState:", v10, 0);

      LODWORD(v11) = -1.0;
      -[UIButton setCharge:](self->_clearButton, "setCharge:", v11);
      -[SKUIMessageBanner addSubview:](self, "addSubview:", self->_clearButton);
      -[SKUIMessageBanner setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UIButton removeFromSuperview](self->_clearButton, "removeFromSuperview");
      v12 = self->_clearButton;
      self->_clearButton = 0;

    }
  }
}

- (void)setMessage:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *label;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC1288];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setAlignment:", 1);
  objc_msgSend(v6, "setLineBreakMode:", 4);
  v12[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = *MEMORY[0x1E0DC1178];
  v13[1] = v8;
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  label = self->_label;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v9);

  -[UILabel setAttributedText:](label, "setAttributedText:", v11);
}

- (NSString)message
{
  return -[UILabel text](self->_label, "text");
}

- (void)setAttributedMessage:(id)a3
{
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", a3);
}

- (id)value
{
  return -[UILabel attributedText](self->_label, "attributedText");
}

- (void)layoutSubviews
{
  double v3;
  double MaxX;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *borderView;
  double MaxY;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  UIButton *clearButton;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  CGFloat v26;
  float v27;
  CGFloat v28;
  UILabel *label;
  void *v30;
  uint64_t v31;
  double v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v33.receiver = self;
  v33.super_class = (Class)SKUIMessageBanner;
  -[SKUIMessageBanner layoutSubviews](&v33, sel_layoutSubviews);
  -[SKUIMessageBanner bounds](self, "bounds");
  MaxX = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIButton setFrame:](self->_button, "setFrame:");
  borderView = self->_borderView;
  v34.origin.x = MaxX;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  MaxY = CGRectGetMaxY(v34);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = MaxY - 1.0 / v14;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  -[UIView setFrame:](borderView, "setFrame:", v6, v15, v8, 1.0 / v17);

  clearButton = self->_clearButton;
  if (clearButton)
  {
    -[UIButton sizeToFit](clearButton, "sizeToFit");
    -[SKUIMessageBanner bringSubviewToFront:](self, "bringSubviewToFront:", self->_clearButton);
    -[UIButton frame](self->_clearButton, "frame");
    v20 = v19;
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "userInterfaceIdiom");

    v25 = 10.0;
    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v25 = 20.0;
    v26 = MaxX + v25;
    v27 = (v10 - v22) * 0.5;
    v28 = floorf(v27);
    -[UIButton setFrame:](self->_clearButton, "setFrame:", v26, v28, v20, v22);
    v35.origin.x = v26;
    v35.origin.y = v28;
    v35.size.width = v20;
    v35.size.height = v22;
    MaxX = CGRectGetMaxX(v35);
    -[SKUIMessageBanner bounds](self, "bounds");
    v8 = CGRectGetMaxX(v36) - MaxX;
  }
  label = self->_label;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "userInterfaceIdiom");

  if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v32 = 20.0;
  else
    v32 = 10.0;
  v37.origin.x = MaxX;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  v38 = CGRectInset(v37, v32, 15.0);
  -[UILabel setFrame:](label, "setFrame:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  UILabel *label;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  label = self->_label;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 40.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v7 = 20.0;
  -[UILabel sizeThatFits:](label, "sizeThatFits:", width - v7, 1.79769313e308);
  v9 = v8 + 30.0;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)_buttonAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "askPermissionBannerDidSelect:", self);

}

- (void)_clearButtonAction:(id)a3
{
  SKUIMessageBannerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "askPermissionBannerDidClear:", self);

  }
}

- (SKUIMessageBannerDelegate)delegate
{
  return (SKUIMessageBannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
