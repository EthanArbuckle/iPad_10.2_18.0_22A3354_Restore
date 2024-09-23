@implementation PKPaymentSetupFieldBuiltInTotalIncome

- (PKPaymentSetupFieldBuiltInTotalIncome)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PKPaymentSetupFieldBuiltInTotalIncome *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupFieldBuiltInTotalIncome;
  v9 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v12, sel_initWithIdentifier_type_, CFSTR("totalIncome"), a4);
  if (v9)
  {
    PKLocalizedFeatureString(CFSTR("TOTAL_INCOME"), 2, 0, v4, v5, v6, v7, v8, (uint64_t)v12.receiver);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v9, "_setLocalizedDisplayName:", v10);

    -[PKPaymentSetupField setRequiresSecureSubmission:](v9, "setRequiresSecureSubmission:", 0);
    -[PKPaymentSetupFieldText setMinLength:](v9, "setMinLength:", 1);
    -[PKPaymentSetupFieldText setMaxLength:](v9, "setMaxLength:", 15);
    -[PKPaymentSetupFieldText setSecureText:](v9, "setSecureText:", 0);
    -[PKPaymentSetupFieldText setSecureVisibleText:](v9, "setSecureVisibleText:", 0);
    -[PKPaymentSetupFieldText setNumeric:](v9, "setNumeric:", 1);
    -[PKPaymentSetupFieldText setLuhnCheck:](v9, "setLuhnCheck:", 0);
    -[PKPaymentSetupFieldText setCurrencyCode:](v9, "setCurrencyCode:", CFSTR("USD"));
  }
  return v9;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end
