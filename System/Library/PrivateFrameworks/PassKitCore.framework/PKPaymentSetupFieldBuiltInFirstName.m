@implementation PKPaymentSetupFieldBuiltInFirstName

- (PKPaymentSetupFieldBuiltInFirstName)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInFirstName *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInFirstName;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v7, sel_initWithIdentifier_type_, CFSTR("firstName"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("FIRST_NAME"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupFieldText setMinLength:](v4, "setMinLength:", 1);
    -[PKPaymentSetupFieldText setMaxLength:](v4, "setMaxLength:", 64);
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end
