@implementation PKPaymentSetupFieldBuiltInBalance

- (PKPaymentSetupFieldBuiltInBalance)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInBalance *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInBalance;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v7, sel_initWithIdentifier_type_, CFSTR("balance"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("BALANCE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupField setReadonly:](v4, "setReadonly:", 1);
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end
