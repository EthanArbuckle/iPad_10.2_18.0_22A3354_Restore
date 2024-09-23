@implementation SKUIGiftTextFieldTableViewCell

- (SKUIGiftTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUIGiftTextFieldTableViewCell *v7;
  SKUIGiftTextFieldTableViewCell *v8;
  void *v9;
  UITextField *v10;
  UITextField *textField;
  UITextField *v12;
  void *v13;
  UITextField *v14;
  void *v15;
  UITextField *v16;
  void *v17;
  UIView *v18;
  UIView *topBorderView;
  UIView *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftTextFieldTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIGiftTextFieldTableViewCell;
  v7 = -[SKUIGiftTextFieldTableViewCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[SKUIGiftTextFieldTableViewCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    textField = v8->_textField;
    v8->_textField = v10;

    v12 = v8->_textField;
    objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setBackgroundColor:](v12, "setBackgroundColor:", v13);

    v14 = v8->_textField;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v14, "setFont:", v15);

    v16 = v8->_textField;
    objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](v16, "setTextColor:", v17);

    -[UITextField sizeToFit](v8->_textField, "sizeToFit");
    objc_msgSend(v9, "addSubview:", v8->_textField);
    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topBorderView = v8->_topBorderView;
    v8->_topBorderView = v18;

    v20 = v8->_topBorderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    objc_msgSend(v9, "addSubview:", v8->_topBorderView);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_leftToRight = objc_msgSend(v22, "userInterfaceLayoutDirection") == 0;

  }
  return v8;
}

- (NSAttributedString)attributedPlaceholder
{
  return -[UITextField attributedPlaceholder](self->_textField, "attributedPlaceholder");
}

- (BOOL)isEnabled
{
  return -[UITextField isEnabled](self->_textField, "isEnabled");
}

- (int64_t)keyboardType
{
  return -[UITextField keyboardType](self->_textField, "keyboardType");
}

- (NSString)label
{
  return -[UILabel text](self->_label, "text");
}

- (void)setAttributedPlaceholder:(id)a3
{
  -[UITextField setAttributedPlaceholder:](self->_textField, "setAttributedPlaceholder:", a3);
}

- (void)setEnabled:(BOOL)a3
{
  UITextField *textField;
  void *v6;
  void *v7;
  id v8;

  -[UITextField setEnabled:](self->_textField, "setEnabled:");
  textField = self->_textField;
  objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (a3)
  {
    -[UITextField setTextColor:](textField, "setTextColor:", v6);
  }
  else
  {
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](textField, "setTextColor:", v7);

  }
}

- (void)setKeyboardType:(int64_t)a3
{
  -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:", a3 != 7);
  -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:", a3);
}

- (void)setLabel:(id)a3
{
  id v4;
  UILabel *label;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  id v16;

  v16 = a3;
  -[SKUIGiftTextFieldTableViewCell label](self, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v16, "isEqualToString:", v4) & 1) == 0)
  {
    label = self->_label;
    if (v16)
    {
      if (!label)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_label;
        self->_label = v6;

        v8 = self->_label;
        objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_label;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_label;
        objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SKUIGiftTextFieldTableViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_label);

        label = self->_label;
      }
      -[UILabel setText:](label, "setText:");
      -[UILabel sizeToFit](self->_label, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](label, "removeFromSuperview");
      v15 = self->_label;
      self->_label = 0;

    }
    -[SKUIGiftTextFieldTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTextFieldDelegate:(id)a3
{
  -[UITextField setDelegate:](self->_textField, "setDelegate:", a3);
}

- (void)setValue:(id)a3
{
  -[UITextField setText:](self->_textField, "setText:", a3);
}

- (UITextFieldDelegate)textFieldDelegate
{
  return (UITextFieldDelegate *)-[UITextField delegate](self->_textField, "delegate");
}

- (NSString)value
{
  return -[UITextField text](self->_textField, "text");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  UITextField *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIGiftTextFieldTableViewCell;
  -[SKUIGiftTextFieldTableViewCell hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDescendantOfView:", self))
  {
    v6 = self->_textField;

    v5 = v6;
  }
  return v5;
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
  UILabel *label;
  double width;
  double height;
  double v14;
  double MaxX;
  float v16;
  double v17;
  BOOL v18;
  UILabel *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  BOOL v30;
  UITextField *textField;
  double v32;
  double v33;
  double v34;
  double v35;
  UIView *topBorderView;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  objc_super v43;
  CGRect v44;

  v43.receiver = self;
  v43.super_class = (Class)SKUIGiftTextFieldTableViewCell;
  -[SKUIGiftTextFieldTableViewCell layoutSubviews](&v43, sel_layoutSubviews);
  -[SKUIGiftTextFieldTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v39 = v5;
  v41 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v7 + -15.0;
  label = self->_label;
  if (label)
  {
    -[UILabel frame](label, "frame");
    width = v44.size.width;
    height = v44.size.height;
    v14 = 15.0;
    v44.origin.x = 15.0;
    MaxX = CGRectGetMaxX(v44);
    v16 = (v9 - height) * 0.5;
    v17 = floorf(v16);
    -[UILabel setFrame:](self->_label, "setFrame:", 15.0, v17, width, height);
    v18 = -[SKUIGiftTextFieldTableViewCell leftToRight](self, "leftToRight");
    v19 = self->_label;
    if (!v18)
    {
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v17, width, height, v41, v39, v7, v9);
      v14 = v20;
      v17 = v21;
      width = v22;
      height = v23;
    }
    v24 = MaxX + 5.0;
    -[UILabel setFrame:](v19, "setFrame:", v14, v17, width, height, *(_QWORD *)&v39, *(_QWORD *)&v41);
  }
  else
  {
    v24 = 15.0;
  }
  -[UITextField frame](self->_textField, "frame", *(_QWORD *)&v39, *(_QWORD *)&v41);
  v26 = v25;
  v27 = v10 - v24;
  v28 = (v9 - v25) * 0.5;
  v29 = floorf(v28);
  v30 = -[SKUIGiftTextFieldTableViewCell leftToRight](self, "leftToRight");
  textField = self->_textField;
  if (!v30)
  {
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v24, v29, v10 - v24, v26, v42, v40, v7, v9);
    v24 = v32;
    v29 = v33;
    v27 = v34;
    v26 = v35;
  }
  -[UITextField setFrame:](textField, "setFrame:", v24, v29, v27, v26);
  topBorderView = self->_topBorderView;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "scale");
  -[UIView setFrame:](topBorderView, "setFrame:", 15.0, 0.0, v7 + -15.0, 1.0 / v38);

}

- (UIControl)textField
{
  return &self->_textField->super;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftTextFieldTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
