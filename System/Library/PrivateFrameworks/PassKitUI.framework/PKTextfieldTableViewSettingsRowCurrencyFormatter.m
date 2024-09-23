@implementation PKTextfieldTableViewSettingsRowCurrencyFormatter

- (PKTextfieldTableViewSettingsRowCurrencyFormatter)initWithCurrencyCode:(id)a3
{
  id v4;
  PKTextfieldTableViewSettingsRowCurrencyFormatter *v5;
  uint64_t v6;
  NSString *currencyCode;
  void *v8;
  NSNumberFormatter *v9;
  NSNumberFormatter *currencyFormatter;
  NSNumberFormatter *v11;
  NSNumberFormatter *amountFormatter;
  NSNumberFormatter *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKTextfieldTableViewSettingsRowCurrencyFormatter;
  v5 = -[PKTextfieldTableViewSettingsRowCurrencyFormatter init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    currencyFormatter = v5->_currencyFormatter;
    v5->_currencyFormatter = v9;

    -[NSNumberFormatter setCurrencyCode:](v5->_currencyFormatter, "setCurrencyCode:", v5->_currencyCode);
    -[NSNumberFormatter setNumberStyle:](v5->_currencyFormatter, "setNumberStyle:", 2);
    -[NSNumberFormatter setMinimumFractionDigits:](v5->_currencyFormatter, "setMinimumFractionDigits:", 0);
    -[NSNumberFormatter setLocale:](v5->_currencyFormatter, "setLocale:", v8);
    v11 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    amountFormatter = v5->_amountFormatter;
    v5->_amountFormatter = v11;

    v13 = v5->_amountFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setMinimum:](v13, "setMinimum:", v14);

    -[NSNumberFormatter setLocale:](v5->_amountFormatter, "setLocale:", v8);
    v15 = (void *)MEMORY[0x1E0C99E60];
    -[NSNumberFormatter groupingSeparator](v5->_currencyFormatter, "groupingSeparator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter currencySymbol](v5->_currencyFormatter, "currencySymbol");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithObjects:", v16, v17, CFSTR(" "), CFSTR(" "), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTextFieldTableViewSettingsRowFormatter setFormatPaddingCharacters:](v5, "setFormatPaddingCharacters:", v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKTextfieldTableViewSettingsRowCurrencyFormatter *v4;
  PKTextfieldTableViewSettingsRowCurrencyFormatter *v5;
  PKTextfieldTableViewSettingsRowCurrencyFormatter *v6;
  BOOL v7;
  objc_super v9;

  v4 = (PKTextfieldTableViewSettingsRowCurrencyFormatter *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects())
    {
      v9.receiver = self;
      v9.super_class = (Class)PKTextfieldTableViewSettingsRowCurrencyFormatter;
      v7 = -[PKTextFieldTableViewSettingsRowFormatter isEqual:](&v9, sel_isEqual_, v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)formattedValueFromInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[PKTextfieldTableViewSettingsRowCurrencyFormatter numberFromInput:](self, "numberFromInput:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](self->_currencyFormatter, "stringFromNumber:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)numberFromInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSNumberFormatter groupingSeparator](self->_currencyFormatter, "groupingSeparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_1E3E7D690);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSNumberFormatter currencySymbol](self->_currencyFormatter, "currencySymbol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1E3E7D690);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[NSNumberFormatter numberFromString:](self->_amountFormatter, "numberFromString:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)submissionValueFromFormattedInput:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTextfieldTableViewSettingsRowCurrencyFormatter;
  -[PKTextFieldTableViewSettingsRowFormatter submissionValueFromFormattedInput:](&v8, sel_submissionValueFromFormattedInput_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_currencyFormatter)
  {
    objc_msgSend(v4, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99888], 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end
