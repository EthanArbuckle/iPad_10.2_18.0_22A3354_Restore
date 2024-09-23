@implementation PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber

- (PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v7, sel_initWithIdentifier_type_, CFSTR("cardOnFilePrimaryAccountNumber"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("CARD_ON_FILE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupField setSubmissionKey:](v4, "setSubmissionKey:", 0);
    -[PKPaymentSetupField setSubmissionDestination:](v4, "setSubmissionDestination:", 0);
    -[PKPaymentSetupField setRequiresSecureSubmission:](v4, "setRequiresSecureSubmission:", 0);
    -[PKPaymentSetupFieldText setMinLength:](v4, "setMinLength:", 0);
    -[PKPaymentSetupFieldText setMaxLength:](v4, "setMaxLength:", 0);
    -[PKPaymentSetupFieldText setSecureText:](v4, "setSecureText:", 0);
    -[PKPaymentSetupFieldText setSecureVisibleText:](v4, "setSecureVisibleText:", 0);
    -[PKPaymentSetupFieldText setNumeric:](v4, "setNumeric:", 0);
    -[PKPaymentSetupFieldText setLuhnCheck:](v4, "setLuhnCheck:", 0);
    -[PKPaymentSetupField setDisplayFormat:](v4, "setDisplayFormat:", CFSTR("XXXX XXXXX"));
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

- (BOOL)hasDisplayFormat
{
  return 1;
}

- (id)stringByApplyingDisplayFormat:(id)a3
{
  return a3;
}

- (id)displayFormatPaddingCharacters
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR(" "));
}

@end
