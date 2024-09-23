@implementation PKPaymentSetupFieldBuiltInOTPCode

- (PKPaymentSetupFieldBuiltInOTPCode)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInOTPCode *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldBuiltInOTPCode;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v8, sel_initWithIdentifier_type_, CFSTR("otpCode"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("VERIFICATION_CODE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    PKLocalizedPaymentString(CFSTR("ENTER_CODE_BUTTON"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField setLocalizedPlaceholder:](v4, "setLocalizedPlaceholder:", v6);

    -[PKPaymentSetupFieldText setMinLength:](v4, "setMinLength:", 4);
    -[PKPaymentSetupFieldText setSecureText:](v4, "setSecureText:", 1);
    -[PKPaymentSetupFieldText setSecureVisibleText:](v4, "setSecureVisibleText:", 1);
    -[PKPaymentSetupFieldText setNumeric:](v4, "setNumeric:", 1);
    -[PKPaymentSetupFieldText setLuhnCheck:](v4, "setLuhnCheck:", 0);
    -[PKPaymentSetupField setDisplayFormat:](v4, "setDisplayFormat:", &stru_1E2ADF4C0);
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end
