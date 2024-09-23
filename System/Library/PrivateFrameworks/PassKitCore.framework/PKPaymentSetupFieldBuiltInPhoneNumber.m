@implementation PKPaymentSetupFieldBuiltInPhoneNumber

- (PKPaymentSetupFieldBuiltInPhoneNumber)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldBuiltInPhoneNumber *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupFieldBuiltInPhoneNumber;
  v4 = -[PKPaymentSetupFieldText initWithIdentifier:type:](&v11, sel_initWithIdentifier_type_, CFSTR("phoneNumber"), a4);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("PHONE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField _setLocalizedDisplayName:](v4, "_setLocalizedDisplayName:", v5);

    -[PKPaymentSetupField setRequiresSecureSubmission:](v4, "setRequiresSecureSubmission:", 0);
    -[PKPaymentSetupFieldText setMinLength:](v4, "setMinLength:", 1);
    -[PKPaymentSetupFieldText setMaxLength:](v4, "setMaxLength:", 20);
    -[PKPaymentSetupFieldText setSecureText:](v4, "setSecureText:", 0);
    -[PKPaymentSetupFieldText setSecureVisibleText:](v4, "setSecureVisibleText:", 0);
    -[PKPaymentSetupFieldText setNumeric:](v4, "setNumeric:", 1);
    -[PKPaymentSetupFieldText setLuhnCheck:](v4, "setLuhnCheck:", 0);
    -[PKPaymentSetupFieldText setPaddingCharacters:](v4, "setPaddingCharacters:", &unk_1E2C3DDC8);
    v6 = (void *)MEMORY[0x1E0CB3780];
    objc_msgSend(&unk_1E2C3DDC8, "componentsJoinedByString:", &stru_1E2ADF4C0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characterSetWithCharactersInString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formUnionWithCharacterSet:", v9);

    objc_msgSend(v8, "addCharactersInString:", CFSTR("+"));
    -[PKPaymentSetupFieldText setAllowedCharacters:](v4, "setAllowedCharacters:", v8);

  }
  return v4;
}

- (BOOL)isBuiltIn
{
  return 1;
}

- (id)_submissionStringForValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentSetupFieldBuiltInPhoneNumber;
  -[PKPaymentSetupFieldText _submissionStringForValue:](&v17, sel__submissionStringForValue_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKBestGuessNormalizedPhoneNumber(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKPaymentSetupFieldText paddingCharacters](self, "paddingCharacters", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), &stru_1E2ADF4C0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)hasDisplayFormat
{
  return 1;
}

@end
