@implementation PKPaymentSetupFieldBuiltInSSNSuffix

- (PKPaymentSetupFieldBuiltInSSNSuffix)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInSSNSuffix *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldBuiltInSSNSuffix;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v8, sel_initWithIdentifier_type_, CFSTR("ssnSuffix"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("SSN_SUFFIX"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    PKLocalizedPaymentString(CFSTR("SSN_SUFFIX_PLACEHOLDER"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField setLocalizedPlaceholder:](v4, "setLocalizedPlaceholder:", v6);

    -[PKPaymentSetupField setRequiresSecureSubmission:](v4, "setRequiresSecureSubmission:", 1);
    -[PKPaymentSetupFieldText setMinLength:](v4, "setMinLength:", 4);
    -[PKPaymentSetupFieldText setMaxLength:](v4, "setMaxLength:", 4);
    -[PKPaymentSetupFieldText setSecureText:](v4, "setSecureText:", 1);
    -[PKPaymentSetupFieldText setSecureVisibleText:](v4, "setSecureVisibleText:", 1);
    -[PKPaymentSetupFieldText setNumeric:](v4, "setNumeric:", 1);
    -[PKPaymentSetupFieldText setLuhnCheck:](v4, "setLuhnCheck:", 0);
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end
