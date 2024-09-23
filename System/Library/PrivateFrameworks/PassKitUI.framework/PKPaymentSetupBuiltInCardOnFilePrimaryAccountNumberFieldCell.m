@implementation PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell

- (void)pk_applyAppearance:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell;
  v4 = a3;
  -[PKPaymentSetupFieldCell pk_applyAppearance:](&v6, sel_pk_applyAppearance_, v4);
  v5 = objc_msgSend(v4, "hasDarkAppearance", v6.receiver, v6.super_class);

  -[PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell setHasDarkAppearance:](self, "setHasDarkAppearance:", v5);
}

- (PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell;
  return -[PKPaymentSetupFieldCell init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell;
  -[PKPaymentSetupFieldCell dealloc](&v2, sel_dealloc);
}

- (BOOL)isEnabled
{
  return 0;
}

- (void)setPaymentSetupField:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell;
  -[PKPaymentSetupFieldCell setPaymentSetupField:](&v3, sel_setPaymentSetupField_, a3);
}

- (void)setHasDarkAppearance:(BOOL)a3
{
  if (self->_hasDarkAppearance != a3)
  {
    self->_hasDarkAppearance = a3;
    -[PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell _updateNetworkImage](self, "_updateNetworkImage");
  }
}

- (void)setAccessoryView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell;
  -[PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell setAccessoryView:](&v4, sel_setAccessoryView_, a3);
  -[PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPaymentCredentialType:(int64_t)a3
{
  if (self->_paymentCredentialType != a3)
  {
    self->_paymentCredentialType = a3;
    -[PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell _updateNetworkImage](self, "_updateNetworkImage");
  }
}

- (void)_updateNetworkImage
{
  uint64_t v3;
  UIImageView *accessoryImageView;
  UIImageView *v5;
  UIImageView *v6;
  id v7;

  -[PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell _networkImage](self, "_networkImage");
  v3 = objc_claimAutoreleasedReturnValue();
  accessoryImageView = self->_accessoryImageView;
  v7 = (id)v3;
  if (v3)
  {
    if (accessoryImageView)
    {
      -[UIImageView setImage:](accessoryImageView, "setImage:", v3);
      -[UIImageView sizeToFit](self->_accessoryImageView, "sizeToFit");
    }
    else
    {
      v5 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v3);
      v6 = self->_accessoryImageView;
      self->_accessoryImageView = v5;

      -[UIImageView setAccessibilityIgnoresInvertColors:](self->_accessoryImageView, "setAccessibilityIgnoresInvertColors:", 1);
    }
  }
  else
  {
    self->_accessoryImageView = 0;

  }
  -[PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell setAccessoryView:](self, "setAccessoryView:", self->_accessoryImageView);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return 0;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 0;
}

- (id)_networkImage
{
  return PKUINetworkImageForCredentialType(self->_paymentCredentialType);
}

- (int64_t)paymentCredentialType
{
  return self->_paymentCredentialType;
}

- (BOOL)hasDarkAppearance
{
  return self->_hasDarkAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
}

@end
