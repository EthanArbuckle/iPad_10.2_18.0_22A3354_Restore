@implementation SKUIRedeemIdTableViewCell

- (SKUIRedeemIdTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUIRedeemIdTableViewCell *v7;
  SKUIRedeemIdTableViewCell *v8;
  objc_super v10;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemIdTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIRedeemIdTableViewCell;
  v7 = -[SKUIRedeemIdTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[SKUIRedeemIdTableViewCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
    -[SKUIRedeemIdTableViewCell _initializeTextField](v8, "_initializeTextField");
  }

  return v8;
}

- (void)layoutSubviews
{
  void *v3;
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
  double x;
  double y;
  double width;
  double height;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  -[SKUIRedeemIdTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SKUIRedeemIdTableViewCell separatorInset](self, "separatorInset");
  v13 = v12;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  v21 = CGRectInset(v20, v13, 0.0);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", x, y, width, height);

  v19.receiver = self;
  v19.super_class = (Class)SKUIRedeemIdTableViewCell;
  -[SKUIRedeemIdTableViewCell layoutSubviews](&v19, sel_layoutSubviews);
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

  return 1;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  void *v4;

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  return 1;
}

- (void)setPlaceholderText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholder:", v4);

}

- (void)setKeyboardType:(int64_t)a3
{
  id v4;

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardType:", a3);

}

- (void)setReturnKeyType:(int64_t)a3
{
  id v4;

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnKeyType:", a3);

}

- (void)setAutoCapitalizationType:(int64_t)a3
{
  id v4;

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocapitalizationType:", a3);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SKUIRedeemIdTableViewCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "redeemIdCell:didReturnWithText:", self, v6);
  return 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 1;
}

- (void)textFieldDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SKUIRedeemIdTableViewCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "redeemIdCell:didChangeToText:", self, v5);
}

- (void)_initializeTextField
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc(MEMORY[0x1E0DC3DB8]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SKUIRedeemIdTableViewCell setTextField:](self, "setTextField:", v4);

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClearButtonMode:", 1);

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_textFieldDidChange_, 0x20000);

  -[SKUIRedeemIdTableViewCell contentView](self, "contentView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemIdTableViewCell textField](self, "textField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

}

- (SKUIRedeemIdTableViewCellDelegate)delegate
{
  return (SKUIRedeemIdTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemIdTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
