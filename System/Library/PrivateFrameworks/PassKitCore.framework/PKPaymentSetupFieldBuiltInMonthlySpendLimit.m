@implementation PKPaymentSetupFieldBuiltInMonthlySpendLimit

- (PKPaymentSetupFieldBuiltInMonthlySpendLimit)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInMonthlySpendLimit *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldBuiltInMonthlySpendLimit;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v8, sel_initWithIdentifier_type_, CFSTR("monthlySpendLimit"), a4);
  if (v4)
  {
    PKLocalizedMadisonString(CFSTR("MONTHLY_SPEND_LIMIT_AMOUNT"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupField setRequiresSecureSubmission:](v4, "setRequiresSecureSubmission:", 0);
    -[PKPaymentSetupFieldText setMinLength:](v4, "setMinLength:", 1);
    -[PKPaymentSetupFieldText setMaxLength:](v4, "setMaxLength:", 15);
    -[PKPaymentSetupFieldText setSecureText:](v4, "setSecureText:", 0);
    -[PKPaymentSetupFieldText setSecureVisibleText:](v4, "setSecureVisibleText:", 0);
    -[PKPaymentSetupFieldText setNumeric:](v4, "setNumeric:", 1);
    -[PKPaymentSetupFieldText setLuhnCheck:](v4, "setLuhnCheck:", 0);
    -[PKPaymentSetupFieldText setCurrencyCode:](v4, "setCurrencyCode:", CFSTR("USD"));
    -[PKPaymentSetupField setOptional:](v4, "setOptional:", 1);
    PKLocalizedMadisonString(CFSTR("TRANSACTION_LIMIT_NO_LIMIT"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField setLocalizedPlaceholder:](v4, "setLocalizedPlaceholder:", v6);

  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end
