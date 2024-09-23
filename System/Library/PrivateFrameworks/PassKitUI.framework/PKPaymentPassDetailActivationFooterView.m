@implementation PKPaymentPassDetailActivationFooterView

- (PKPaymentPassDetailActivationFooterView)initWithFrame:(CGRect)a3 activationAction:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PKPaymentPassDetailActivationFooterView *v10;
  PKPaymentPassDetailActivationFooterView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentPassDetailActivationFooterView;
  v10 = -[PKPaymentPassDetailActivationFooterView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[PKPaymentPassDetailActivationFooterView setupActivationButtonWithAction:](v10, "setupActivationButtonWithAction:", v9);
    -[PKPaymentPassDetailActivationFooterView setupFooter](v11, "setupFooter");
  }

  return v11;
}

- (void)setupActivationButtonWithAction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  UIButton *v9;
  UIButton *activationButton;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0DC3520];
  v5 = (void *)MEMORY[0x1E0DC1350];
  v6 = *MEMORY[0x1E0DC4A98];
  v7 = a3;
  objc_msgSend(v5, "preferredFontForTextStyle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pkui_plainConfigurationWithTitle:font:", 0, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setButtonSize:", 2);
  objc_msgSend(v12, "setContentInsets:", 5.0, 0.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v12, v7);
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();

  activationButton = self->_activationButton;
  self->_activationButton = v9;

  -[PKPaymentPassDetailActivationFooterView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_activationButton);

}

- (void)setupFooter
{
  id v3;
  UILabel *v4;
  UILabel *footerTextLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  footerTextLabel = self->_footerTextLabel;
  self->_footerTextLabel = v4;

  -[UILabel setLineBreakMode:](self->_footerTextLabel, "setLineBreakMode:", 0);
  -[UILabel setTextAlignment:](self->_footerTextLabel, "setTextAlignment:", 4);
  -[UILabel setNumberOfLines:](self->_footerTextLabel, "setNumberOfLines:", 0);
  v6 = self->_footerTextLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v6, "setFont:", v7);

  v8 = self->_footerTextLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v8, "setTextColor:", v9);

  -[PKPaymentPassDetailActivationFooterView contentView](self, "contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_footerTextLabel);

}

- (void)setFooterText:(id)a3
{
  -[UILabel setText:](self->_footerTextLabel, "setText:", a3);
  -[PKPaymentPassDetailActivationFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setActivationButtonText:(id)a3
{
  void *v5;

  -[UIButton pkui_updateConfigurationWithTitle:](self->_activationButton, "pkui_updateConfigurationWithTitle:");
  if (a3)
  {
    -[PKPaymentPassDetailActivationFooterView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_activationButton);

  }
  else
  {
    -[UIButton removeFromSuperview](self->_activationButton, "removeFromSuperview");
  }
  -[PKPaymentPassDetailActivationFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  UILabel *footerTextLabel;
  UIButton *activationButton;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double MaxX;
  UIButton *v24;
  objc_super v25;
  CGRect v26;

  v25.receiver = self;
  v25.super_class = (Class)PKPaymentPassDetailActivationFooterView;
  -[PKPaymentPassDetailActivationFooterView layoutSubviews](&v25, sel_layoutSubviews);
  v3 = -[PKPaymentPassDetailActivationFooterView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKPaymentPassDetailActivationFooterView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "directionalLayoutMargins");
  UIRectInset();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UILabel sizeThatFits:](self->_footerTextLabel, "sizeThatFits:", v9, v11);
  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  if (v3)
    CGRectGetMaxX(*(CGRect *)&v13);
  else
    CGRectGetMinX(*(CGRect *)&v13);
  footerTextLabel = self->_footerTextLabel;
  PKRectRoundToPixel();
  -[UILabel setFrame:](footerTextLabel, "setFrame:");
  activationButton = self->_activationButton;
  if (activationButton)
  {
    -[UIButton sizeThatFits:](activationButton, "sizeThatFits:", v10, v12);
    v19 = v6;
    v20 = v8;
    v21 = v10;
    v22 = v12;
    if (v3)
      MaxX = CGRectGetMaxX(*(CGRect *)&v19);
    else
      MaxX = CGRectGetMinX(*(CGRect *)&v19);
    -[UILabel frame](self->_footerTextLabel, "frame", MaxX);
    CGRectGetMaxY(v26);
    v24 = self->_activationButton;
    PKRectRoundToPixel();
    -[UIButton setFrame:](v24, "setFrame:");
  }

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
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKPaymentPassDetailActivationFooterView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "directionalLayoutMargins");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[PKPaymentPassDetailActivationFooterView directionalLayoutMargins](self, "directionalLayoutMargins");
  v17 = fmax(width - v10 - v14 - v15 - v16, 0.0);
  -[UILabel sizeThatFits:](self->_footerTextLabel, "sizeThatFits:", v17, height);
  v19 = v18;
  -[UIButton superview](self->_activationButton, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[UIButton sizeThatFits:](self->_activationButton, "sizeThatFits:", v17, height);
    v22 = v21;
  }
  else
  {
    v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v23 = v8 + v12 + v22;
  -[UILabel text](self->_footerTextLabel, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  v26 = -0.0;
  if (v25)
    v26 = v19;
  v27 = v23 + v26;
  v28 = width;
  result.height = v27;
  result.width = v28;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationButton, 0);
  objc_storeStrong((id *)&self->_footerTextLabel, 0);
}

@end
