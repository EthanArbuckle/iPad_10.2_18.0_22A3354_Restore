@implementation PKPaymentPreferenceTextInputCell

- (PKPaymentPreferenceTextInputCell)initWithReuseIdentifier:(id)a3
{
  PKPaymentPreferenceTextInputCell *v3;
  PKPaymentPreferenceTextInputCell *v4;
  UITextField *v5;
  UITextField *textField;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPreferenceTextInputCell;
  v3 = -[PKPaymentPreferenceTextInputCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, 0, a3);
  v4 = v3;
  if (v3)
  {
    -[PKPaymentPreferenceTextInputCell setSelectionStyle:](v3, "setSelectionStyle:", 0);
    v5 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    textField = v4->_textField;
    v4->_textField = v5;

    -[PKPaymentPreferenceTextInputCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_textField);

    -[UITextField setAutocapitalizationType:](v4->_textField, "setAutocapitalizationType:", 1);
    -[UITextField setAutocorrectionType:](v4->_textField, "setAutocorrectionType:", 2);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UITextField *textField;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPreferenceTextInputCell;
  -[PKPaymentPreferenceTextInputCell layoutSubviews](&v10, sel_layoutSubviews);
  -[PKPaymentPreferenceTextInputCell layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  -[PKPaymentPreferenceTextInputCell bounds](self, "bounds");
  v8 = v7 - v4 - v6;
  textField = self->_textField;
  -[PKPaymentPreferenceTextInputCell bounds](self, "bounds");
  -[UITextField setFrame:](textField, "setFrame:", v4, 0.0, v8);
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
}

@end
