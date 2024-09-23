@implementation PKPaymentSetupFieldBuiltInPrimaryAccountNumber

- (PKPaymentSetupFieldBuiltInPrimaryAccountNumber)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInPrimaryAccountNumber *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldBuiltInPrimaryAccountNumber;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v7, sel_initWithIdentifier_type_, CFSTR("primaryAccountNumber"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("CARD_NUMBER"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupField setSubmissionKey:](v4, "setSubmissionKey:", CFSTR("primaryAccountNumber"));
    -[PKPaymentSetupField setSubmissionDestination:](v4, "setSubmissionDestination:", CFSTR("eligibility"));
    -[PKPaymentSetupField setRequiresSecureSubmission:](v4, "setRequiresSecureSubmission:", 1);
    -[PKPaymentSetupFieldText setMinLength:](v4, "setMinLength:", 1);
    -[PKPaymentSetupFieldText setMaxLength:](v4, "setMaxLength:", 64);
    -[PKPaymentSetupFieldText setSecureText:](v4, "setSecureText:", 1);
    -[PKPaymentSetupFieldText setSecureVisibleText:](v4, "setSecureVisibleText:", 1);
    -[PKPaymentSetupFieldText setNumeric:](v4, "setNumeric:", 1);
    -[PKPaymentSetupFieldText setLuhnCheck:](v4, "setLuhnCheck:", 0);
    -[PKPaymentSetupFieldText setKeyboardAccessories:](v4, "setKeyboardAccessories:", &unk_1E2C3DDB0);
  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

- (id)compactLocalizedDisplayName
{
  void *v3;
  void *v4;

  -[PKPaymentSetupField rawConfigurationDictionary](self, "rawConfigurationDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("localizedDisplayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PKPaymentSetupField localizedDisplayName](self, "localizedDisplayName");
  else
    PKLocalizedPaymentString(CFSTR("COMPACT_CARD_NUMBER"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasDisplayFormat
{
  return 1;
}

- (id)stringByApplyingDisplayFormat:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[PKPaymentSetupField displayFormat](self, "displayFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v4 || v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentSetupFieldBuiltInPrimaryAccountNumber;
    -[PKPaymentSetupFieldText stringByApplyingDisplayFormat:](&v10, sel_stringByApplyingDisplayFormat_, v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKFormattedStringForPAN(v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)displayFormatPaddingCharacters
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR(" "));
}

@end
