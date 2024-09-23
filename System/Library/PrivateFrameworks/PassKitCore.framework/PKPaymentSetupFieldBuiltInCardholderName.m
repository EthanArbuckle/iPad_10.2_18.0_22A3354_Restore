@implementation PKPaymentSetupFieldBuiltInCardholderName

- (PKPaymentSetupFieldBuiltInCardholderName)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInCardholderName *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInCardholderName;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v7, sel_initWithIdentifier_type_, CFSTR("cardholderName"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("NAME"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupField setSubmissionKey:](v4, "setSubmissionKey:", CFSTR("name"));
    -[PKPaymentSetupField setSubmissionDestination:](v4, "setSubmissionDestination:", CFSTR("eligibility"));
    -[PKPaymentSetupField setRequiresSecureSubmission:](v4, "setRequiresSecureSubmission:", 1);
    -[PKPaymentSetupFieldText setMinLength:](v4, "setMinLength:", 1);
    -[PKPaymentSetupFieldText setMaxLength:](v4, "setMaxLength:", 64);
    -[PKPaymentSetupFieldText setSecureText:](v4, "setSecureText:", 0);
    -[PKPaymentSetupFieldText setSecureVisibleText:](v4, "setSecureVisibleText:", 0);
    -[PKPaymentSetupFieldText setNumeric:](v4, "setNumeric:", 0);
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
