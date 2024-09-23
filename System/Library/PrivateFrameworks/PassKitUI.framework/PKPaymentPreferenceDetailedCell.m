@implementation PKPaymentPreferenceDetailedCell

- (PKPaymentPreferenceDetailedCell)initWithReuseIdentifier:(id)a3
{
  PKPaymentPreferenceDetailedCell *v3;
  PKPaymentPreferenceDetailedCell *v4;
  void *v5;
  void *v6;
  PKPaymentPreferenceDetailedCellTextField *v7;
  PKPaymentPreferenceDetailedCellTextField *textField;
  void *v9;
  PKPaymentPreferenceDetailedCellTextField *v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPaymentPreferenceDetailedCell;
  v3 = -[PKPaymentPreferenceDetailedCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, 3, a3);
  v4 = v3;
  if (v3)
  {
    v14.receiver = v3;
    v14.super_class = (Class)PKPaymentPreferenceDetailedCell;
    -[PKPaymentPreferenceDetailedCell detailTextLabel](&v14, sel_detailTextLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

    objc_msgSend(v5, "setNumberOfLines:", 2);
    v4->_leadingOffset = 0.0;
    v4->_minimumCellHeight = 56.0;
    v7 = objc_alloc_init(PKPaymentPreferenceDetailedCellTextField);
    textField = v4->_textField;
    v4->_textField = v7;

    -[PKPaymentPreferenceDetailedCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_textField);

    v10 = v4->_textField;
    -[PKPaymentPreferenceDetailedCell textLabel](v4, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPreferenceDetailedCellTextField setFont:](v10, "setFont:", v12);

    -[PKPaymentPreferenceDetailedCellTextField setAutocapitalizationType:](v4->_textField, "setAutocapitalizationType:", 1);
    -[PKPaymentPreferenceDetailedCellTextField setAutocorrectionType:](v4->_textField, "setAutocorrectionType:", 2);
    -[PKPaymentPreferenceDetailedCellTextField setEnabled:](v4->_textField, "setEnabled:", 0);
    -[PKPaymentPreferenceDetailedCellTextField setHidden:](v4->_textField, "setHidden:", 1);
    v4->_isLeftToRight = -[PKPaymentPreferenceDetailedCell _shouldReverseLayoutDirection](v4, "_shouldReverseLayoutDirection") ^ 1;

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPreferenceDetailedCell;
  -[PKTableViewCell sizeThatFits:](&v10, sel_sizeThatFits_, a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  PKFloatCeilToPixel();
  v8 = fmax(v6, v7);
  v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceDetailedCell;
  -[PKPaymentPreferenceCell prepareForReuse](&v6, sel_prepareForReuse);
  -[PKPaymentPreferenceDetailedCellTextField setEnabled:](self->_textField, "setEnabled:", 0);
  -[PKPaymentPreferenceDetailedCellTextField setHidden:](self->_textField, "setHidden:", 1);
  -[PKPaymentPreferenceDetailedCellTextField setIsInvalid:](self->_textField, "setIsInvalid:", 0);
  -[PKPaymentPreferenceDetailedCell detailTextLabel](self, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[PKPaymentPreferenceDetailedCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

  self->_minimumCellHeight = 56.0;
  self->_leadingOffset = 0.0;

}

- (void)showTextField:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a3 && self->_inlineEditingEnabled)
  {
    -[PKPaymentPreferenceDetailedCellTextField setEnabled:](self->_textField, "setEnabled:", 1);
    -[PKPaymentPreferenceDetailedCellTextField setHidden:](self->_textField, "setHidden:", 0);
    -[PKPaymentPreferenceDetailedCellTextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
    -[PKPaymentPreferenceDetailedCell detailTextLabel](self, "detailTextLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    -[PKPaymentPreferenceDetailedCell textLabel](self, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v6 = 1;
  }
  else
  {
    -[PKPaymentPreferenceDetailedCellTextField setEnabled:](self->_textField, "setEnabled:", 0);
    -[PKPaymentPreferenceDetailedCellTextField setHidden:](self->_textField, "setHidden:", 1);
    -[PKPaymentPreferenceDetailedCellTextField resignFirstResponder](self->_textField, "resignFirstResponder");
    -[PKPaymentPreferenceDetailedCell detailTextLabel](self, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    -[PKPaymentPreferenceDetailedCell textLabel](self, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v6 = 0;
  }
  objc_msgSend(v5, "setHidden:", v6);

}

- (void)layoutSubviews
{
  void *v3;
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
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double leadingOffset;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PKPaymentPreferenceDetailedCell;
  -[PKPaymentPreferenceDetailedCell layoutSubviews](&v27, sel_layoutSubviews);
  -[PKPaymentPreferenceDetailedCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v26 = v8;

  -[PKPaymentPreferenceDetailedCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PKPaymentPreferenceDetailedCell detailTextLabel](self, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  leadingOffset = self->_leadingOffset;
  if (leadingOffset > 0.0)
  {
    v22 = v19;
    v23 = v20;
    v15 = v7 - leadingOffset;
    if (self->_isLeftToRight)
      v11 = self->_leadingOffset;
    else
      v11 = v5;
    objc_msgSend(v9, "setFrame:", v11, v13, v15, v17);
    objc_msgSend(v18, "setFrame:", v11, v22, v15, v23);
  }
  v24 = v15 + v11;
  v25 = 0.0;
  if (self->_isLeftToRight)
  {
    v25 = v11;
    v24 = v7 - v11;
  }
  -[PKPaymentPreferenceDetailedCellTextField setFrame:](self->_textField, "setFrame:", v25, 0.0, v24, v26);

}

- (BOOL)inlineEditingEnabled
{
  return self->_inlineEditingEnabled;
}

- (void)setInlineEditingEnabled:(BOOL)a3
{
  self->_inlineEditingEnabled = a3;
}

- (PKPaymentPreferenceDetailedCellTextField)textField
{
  return self->_textField;
}

- (double)leadingOffset
{
  return self->_leadingOffset;
}

- (void)setLeadingOffset:(double)a3
{
  self->_leadingOffset = a3;
}

- (double)minimumCellHeight
{
  return self->_minimumCellHeight;
}

- (void)setMinimumCellHeight:(double)a3
{
  self->_minimumCellHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

- (id)pk_childrenForAppearance
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentPreferenceDetailedCell textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)pk_applyAppearance:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceDetailedCell;
  v4 = a3;
  -[PKTableViewCell pk_applyAppearance:](&v6, sel_pk_applyAppearance_, v4);
  objc_msgSend(v4, "tintColor", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentPreferenceDetailedCell setTintColor:](self, "setTintColor:", v5);
}

@end
