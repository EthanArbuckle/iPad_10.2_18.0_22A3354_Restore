@implementation PKPaymentSetupFieldBuiltInPostalCode

- (PKPaymentSetupFieldBuiltInPostalCode)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInPostalCode *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldBuiltInPostalCode;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v8, sel_initWithIdentifier_type_, CFSTR("postalCode"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("POSTAL_CODE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupFieldText setMinLength:](v4, "setMinLength:", 5);
    -[PKPaymentSetupFieldText setMaxLength:](v4, "setMaxLength:", 10);
    -[PKPaymentSetupField setDisplayFormat:](v4, "setDisplayFormat:", CFSTR("XXXXX-XXXX"));
    -[PKPaymentSetupFieldText setNumeric:](v4, "setNumeric:", 1);
    objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addCharactersInString:", CFSTR("-"));
    -[PKPaymentSetupFieldText setAllowedCharacters:](v4, "setAllowedCharacters:", v6);
    -[PKPaymentSetupFieldText setKeepPaddingCharactersForSubmission:](v4, "setKeepPaddingCharactersForSubmission:", 1);

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
