@implementation PKPaymentSetupFieldBuiltInCountryCode

- (PKPaymentSetupFieldBuiltInCountryCode)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInCountryCode *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInCountryCode;
  v4 = -[PKPaymentSetupField initWithIdentifier:type:](&v7, sel_initWithIdentifier_type_, CFSTR("countryCode"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("COUNTRY_CODE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end
