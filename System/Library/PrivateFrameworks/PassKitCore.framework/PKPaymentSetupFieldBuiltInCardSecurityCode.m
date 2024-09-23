@implementation PKPaymentSetupFieldBuiltInCardSecurityCode

- (PKPaymentSetupFieldBuiltInCardSecurityCode)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInCardSecurityCode *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInCardSecurityCode;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v7, sel_initWithIdentifier_type_, CFSTR("cardSecurityCode"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("SECURITY_CODE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupField setSubmissionKey:](v4, "setSubmissionKey:", CFSTR("cardSecurityCode"));
    -[PKPaymentSetupField setSubmissionDestination:](v4, "setSubmissionDestination:", CFSTR("enable"));
    -[PKPaymentSetupField setRequiresSecureSubmission:](v4, "setRequiresSecureSubmission:", 1);
    -[PKPaymentSetupFieldText setMinLength:](v4, "setMinLength:", 3);
    -[PKPaymentSetupFieldText setMaxLength:](v4, "setMaxLength:", 4);
    -[PKPaymentSetupFieldText setSecureText:](v4, "setSecureText:", 1);
    -[PKPaymentSetupFieldText setSecureVisibleText:](v4, "setSecureVisibleText:", 1);
    -[PKPaymentSetupFieldText setNumeric:](v4, "setNumeric:", 1);
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
