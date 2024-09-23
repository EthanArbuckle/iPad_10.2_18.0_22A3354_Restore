@implementation PKPaymentSetupFieldBuiltInCity

- (PKPaymentSetupFieldBuiltInCity)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInCity *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInCity;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v7, sel_initWithIdentifier_type_, CFSTR("city"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("CITY"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

- (BOOL)supportsAddressAutofill
{
  return 1;
}

@end
