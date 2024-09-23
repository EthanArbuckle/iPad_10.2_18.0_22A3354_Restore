@implementation PKPaymentSetupFieldBuiltInAddressLine1

- (PKPaymentSetupFieldBuiltInAddressLine1)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  __CFString *v6;
  const __CFString *v7;
  PKPaymentSetupFieldBuiltInAddressLine1 *v8;
  void *v9;
  objc_super v11;

  v6 = (__CFString *)a3;
  if (-[__CFString length](v6, "length"))
    v7 = v6;
  else
    v7 = CFSTR("addressLine1");
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupFieldBuiltInAddressLine1;
  v8 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v11, sel_initWithIdentifier_type_, v7, a4);
  if (v8)
  {
    PKLocalizedPaymentString(CFSTR("STREET_1"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v8, "_setLocalizedDisplayName:", v9);

    -[PKPaymentSetupFieldText setMinLength:](v8, "setMinLength:", 1);
    -[PKPaymentSetupFieldText setMaxLength:](v8, "setMaxLength:", 50);
  }

  return v8;
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
