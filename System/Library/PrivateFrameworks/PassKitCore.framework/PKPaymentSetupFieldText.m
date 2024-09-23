@implementation PKPaymentSetupFieldText

- (PKPaymentSetupFieldText)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  PKPaymentSetupFieldText *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupFieldText;
  result = -[PKPaymentSetupField initWithIdentifier:type:](&v5, sel_initWithIdentifier_type_, a3, a4);
  if (result)
  {
    result->_minLength = 0;
    result->_maxLength = 0;
    result->_secureText = 1;
    result->_secureVisibleText = 1;
    result->_numeric = 0;
    result->_numericFractional = 0;
    result->_luhnCheck = 0;
    result->_keepPaddingCharactersForSubmission = 0;
    result->_alignment = 0;
    result->_codeOnError = 0;
  }
  return result;
}

+ (id)readOnlyPaymentSetupFieldWithDisplayName:(id)a3 value:(id)a4
{
  NSObject *v5;
  id v6;
  PKPaymentSetupFieldText *v7;
  NSObject *currentValue;

  v5 = a4;
  v6 = a3;
  v7 = -[PKPaymentSetupFieldText initWithIdentifier:type:]([PKPaymentSetupFieldText alloc], "initWithIdentifier:type:", v6, 1);
  -[PKPaymentSetupField setLocalizedDisplayName:](v7, "setLocalizedDisplayName:", v6);

  currentValue = v7->super._currentValue;
  v7->super._currentValue = v5;

  -[PKPaymentSetupField setReadonly:](v7, "setReadonly:", 1);
  return v7;
}

- (void)setCurrentValue:(id)a3
{
  id v4;
  NSCharacterSet *allowedCharacters;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  allowedCharacters = self->_allowedCharacters;
  v6 = v4;
  if (allowedCharacters)
  {
    -[NSCharacterSet invertedSet](allowedCharacters, "invertedSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:", v7, 0);

    v6 = v4;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {

      v6 = 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupFieldText;
  -[PKPaymentSetupField setCurrentValue:](&v9, sel_setCurrentValue_, v6);

}

- (void)setDefaultValue:(id)a3
{
  id v4;
  NSCharacterSet *allowedCharacters;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  allowedCharacters = self->_allowedCharacters;
  if (allowedCharacters)
  {
    -[NSCharacterSet invertedSet](allowedCharacters, "invertedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:", v6, 0);

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {

      v4 = 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldText;
  -[PKPaymentSetupField setDefaultValue:](&v8, sel_setDefaultValue_, v4);

}

- (void)setCurrencyCode:(id)a3
{
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *paddingCharacters;
  NSCharacterSet *v18;
  NSCharacterSet *allowedCharacters;
  id v20;

  v20 = a3;
  v5 = objc_msgSend(v20, "length");
  v6 = v20;
  if (v5)
  {
    v7 = self->_currencyCode;
    v8 = (NSString *)v20;
    v9 = v8;
    if (v7 == v8)
    {
      v11 = v8;
    }
    else
    {
      if (v8 && v7)
      {
        v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

        v6 = v20;
        if (v10)
          goto LABEL_11;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_currencyCode, a3);
      -[PKPaymentSetupFieldText _currencyFormatter](self, "_currencyFormatter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCurrencyCode:", self->_currencyCode);
      v12 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v11, "groupingSeparator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currencySymbol");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithObjects:", v13, v14, CFSTR(" "), CFSTR(" "), 0);
      objc_msgSend(v15, "allObjects");
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
      paddingCharacters = self->_paddingCharacters;
      self->_paddingCharacters = v16;

      -[PKPaymentSetupFieldText _allowedCharacters](self, "_allowedCharacters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (NSCharacterSet *)objc_msgSend(v9, "copy");
      allowedCharacters = self->_allowedCharacters;
      self->_allowedCharacters = v18;

    }
    v6 = v20;
  }
LABEL_11:

}

- (void)setNumericFractional:(BOOL)a3
{
  NSNumberFormatter *currencyFormatter;
  NSNumberFormatter *amountFormatter;

  if (self->_numericFractional != a3)
  {
    self->_numericFractional = a3;
    currencyFormatter = self->_currencyFormatter;
    self->_currencyFormatter = 0;

    amountFormatter = self->_amountFormatter;
    self->_amountFormatter = 0;

  }
}

- (id)displayString
{
  void *v3;
  uint64_t v4;

  -[PKPaymentSetupField currentValue](self, "currentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PKPaymentSetupField defaultValue](self, "defaultValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[PKPaymentSetupFieldText hasDisplayFormat](self, "hasDisplayFormat"))
  {
    -[PKPaymentSetupFieldText stringByApplyingDisplayFormat:](self, "stringByApplyingDisplayFormat:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)_submissionStringForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!objc_msgSend(v4, "length"))
  {
    -[PKPaymentSetupField defaultValue](self, "defaultValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PKPaymentSetupFieldText decimalSeparator](self, "decimalSeparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentSetupFieldText hasDisplayFormat](self, "hasDisplayFormat")
    && !self->_keepPaddingCharactersForSubmission)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PKPaymentSetupFieldText displayFormatPaddingCharacters](self, "displayFormatPaddingCharacters", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (!-[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional")
            || (objc_msgSend(v12, "isEqualToString:", v6) & 1) == 0)
          {
            objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v12, &stru_1E2ADF4C0);
            v13 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

  }
  if (-[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional"))
  {
    v14 = objc_msgSend(v5, "rangeOfString:options:", v6, 4);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_1E2ADF4C0, 0, 0, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v15;
    }
  }
  -[PKPaymentSetupFieldText _currencyFormatter](self, "_currencyFormatter");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    if (-[PKPaymentSetupFieldText isNumeric](self, "isNumeric"))
    {

LABEL_23:
      objc_msgSend(v5, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99888], 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v19;
      goto LABEL_24;
    }
    v18 = -[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional");

    if (v18)
      goto LABEL_23;
  }
LABEL_24:
  objc_msgSend(v5, "pk_zString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)decimalSeparator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentSetupFieldText _currencyFormatter](self, "_currencyFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "currencyDecimalSeparator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentSetupFieldText _amountFormatter](self, "_amountFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decimalSeparator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)submissionStringMeetsAllRequirements
{
  void *v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  -[PKPaymentSetupField submissionString](self, "submissionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentSetupFieldText minLength](self, "minLength"))
  {
    v4 = objc_msgSend(v3, "length");
    v5 = v4 >= -[PKPaymentSetupFieldText minLength](self, "minLength");
  }
  else
  {
    v5 = 1;
  }
  if (-[PKPaymentSetupFieldText maxLength](self, "maxLength"))
  {
    v6 = objc_msgSend(v3, "length");
    if (v6 > -[PKPaymentSetupFieldText maxLength](self, "maxLength"))
      v5 = 0;
  }
  if (-[PKPaymentSetupFieldText useLuhnCheck](self, "useLuhnCheck") && !PKLuhnCheck(v3))
    v5 = 0;
  if (-[PKPaymentSetupFieldText isNumeric](self, "isNumeric")
    || -[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v7);

    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0;
  }
  v9 = -[PKPaymentSetupFieldText submissionStringMeetsValidationRegex](self, "submissionStringMeetsValidationRegex")
    && v5;

  return v9;
}

- (BOOL)submissionStringMeetsValidationRegex
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PKPaymentSetupField submissionString](self, "submissionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldText validationRegex](self, "validationRegex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  if (v4 && v3)
    v5 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v5;
}

- (id)_currencyFormatter
{
  NSNumberFormatter *currencyFormatter;
  void *v4;
  NSNumberFormatter *v5;
  NSNumberFormatter *v6;
  NSNumberFormatter *amountFormatter;
  NSNumberFormatter *v8;

  if (self->_currencyCode)
  {
    currencyFormatter = self->_currencyFormatter;
    if (!currencyFormatter)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
      v6 = self->_currencyFormatter;
      self->_currencyFormatter = v5;

      -[NSNumberFormatter setLocale:](self->_currencyFormatter, "setLocale:", v4);
      -[NSNumberFormatter setCurrencyCode:](self->_currencyFormatter, "setCurrencyCode:", self->_currencyCode);
      -[NSNumberFormatter setNumberStyle:](self->_currencyFormatter, "setNumberStyle:", 2);
      if (!-[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional"))
        -[NSNumberFormatter setMinimumFractionDigits:](self->_currencyFormatter, "setMinimumFractionDigits:", 0);
      amountFormatter = self->_amountFormatter;
      self->_amountFormatter = 0;

      currencyFormatter = self->_currencyFormatter;
    }
    v8 = currencyFormatter;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_amountFormatter
{
  NSNumberFormatter *amountFormatter;
  void *v4;
  NSNumberFormatter *v5;
  NSNumberFormatter *v6;
  void *v7;
  void *v8;

  amountFormatter = self->_amountFormatter;
  if (!amountFormatter)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v6 = self->_amountFormatter;
    self->_amountFormatter = v5;

    -[NSNumberFormatter setLocale:](self->_amountFormatter, "setLocale:", v4);
    -[PKPaymentSetupFieldText _currencyFormatter](self, "_currencyFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      -[NSNumberFormatter setMinimumFractionDigits:](self->_amountFormatter, "setMinimumFractionDigits:", objc_msgSend(v7, "minimumFractionDigits"));
      -[NSNumberFormatter setMaximumFractionDigits:](self->_amountFormatter, "setMaximumFractionDigits:", objc_msgSend(v8, "maximumFractionDigits"));
      -[NSNumberFormatter setMinimumIntegerDigits:](self->_amountFormatter, "setMinimumIntegerDigits:", objc_msgSend(v8, "minimumIntegerDigits"));
      -[NSNumberFormatter setMaximumIntegerDigits:](self->_amountFormatter, "setMaximumIntegerDigits:", objc_msgSend(v8, "maximumIntegerDigits"));
    }
    else if (-[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional"))
    {
      -[NSNumberFormatter setMinimumFractionDigits:](self->_amountFormatter, "setMinimumFractionDigits:", 100);
    }

    amountFormatter = self->_amountFormatter;
  }
  return amountFormatter;
}

- (id)_allowedCharacters
{
  void *v3;
  NSArray *paddingCharacters;
  void *v5;
  void *v6;
  NSCharacterSet *v7;
  NSCharacterSet *allowedCharacters;

  objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  paddingCharacters = self->_paddingCharacters;
  if (paddingCharacters)
  {
    -[NSArray componentsJoinedByString:](paddingCharacters, "componentsJoinedByString:", &stru_1E2ADF4C0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addCharactersInString:", v5);

  }
  if (-[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional"))
  {
    -[PKPaymentSetupFieldText decimalSeparator](self, "decimalSeparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addCharactersInString:", v6);

  }
  v7 = (NSCharacterSet *)objc_msgSend(v3, "copy");
  allowedCharacters = self->_allowedCharacters;
  self->_allowedCharacters = v7;

  return v3;
}

- (BOOL)hasDisplayFormat
{
  BOOL v2;
  void *v3;

  if (self->_currencyCode)
    return 1;
  -[PKPaymentSetupField displayFormat](self, "displayFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "length") != 0;

  return v2;
}

- (id)_stringByApplyingCurrencyFormatter:(id)a3 allowPartialFractional:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  BOOL v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[PKPaymentSetupFieldText _amountFormatter](self, "_amountFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldText _currencyFormatter](self, "_currencyFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupingSeparator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1E2ADF4C0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "currencySymbol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v11, &stru_1E2ADF4C0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional"))
    {
      objc_msgSend(v7, "numberFromString:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromNumber:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

      v6 = v24;
      v23 = v6;
      goto LABEL_26;
    }
    -[PKPaymentSetupFieldText decimalSeparator](self, "decimalSeparator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "rangeOfString:options:", v13, 4);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:options:range:", v13, &stru_1E2ADF4C0, 0, 0, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }
    v16 = v12;
    objc_msgSend(v7, "numberFromString:", v12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v13;
    v19 = v18;
    v20 = v17 != v18;
    if (v17 == v18)
    {

      v25 = v12;
      v12 = &unk_1E2C3E848;
    }
    else
    {
      if (v18 && v17)
      {
        v21 = objc_msgSend(v17, "isEqualToString:", v18);

        if ((v21 & 1) == 0)
        {
          v20 = 1;
          goto LABEL_16;
        }
        v20 = 0;
        v22 = &unk_1E2C3E848;
LABEL_15:

        v12 = v22;
LABEL_16:
        objc_msgSend(v7, "stringFromNumber:", v12);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringFromNumber:", v12);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v20 || !v4)
        {
          if (!v4 || (v32 = objc_msgSend(v17, "length"), v32 >= objc_msgSend(v26, "length")))
          {
            v35 = v28;
            goto LABEL_24;
          }
          v33 = objc_msgSend(v17, "length");
          v34 = objc_msgSend(v28, "length");
          v31 = v34 + v33 - objc_msgSend(v26, "length");
        }
        else
        {
          v29 = objc_msgSend(v27, "rangeOfString:options:", v19, 4);
          v31 = v29 + v30;
        }
        objc_msgSend(v28, "substringToIndex:", v31);
        v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
        v24 = v35;

        goto LABEL_25;
      }
      v25 = v17;
    }
    v22 = v12;

    v12 = v25;
    goto LABEL_15;
  }
  v23 = 0;
LABEL_26:

  return v23;
}

- (id)_stringByApplyingNumericFractionalFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  PKPaymentSetupFieldText *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional") || !objc_msgSend(v4, "length"))
  {
    v23 = 0;
    goto LABEL_26;
  }
  -[PKPaymentSetupFieldText decimalSeparator](self, "decimalSeparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = self;
  -[PKPaymentSetupFieldText displayFormatPaddingCharacters](self, "displayFormatPaddingCharacters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v7)
    goto LABEL_19;
  v8 = v7;
  v9 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v28 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      v12 = v5;
      v13 = v11;
      if (v12 == v13)
      {

        goto LABEL_16;
      }
      v14 = v13;
      if (!v5 || !v13)
      {

LABEL_15:
        objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v14, &stru_1E2ADF4C0);
        v12 = v4;
        v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

        continue;
      }
      v15 = objc_msgSend(v12, "isEqualToString:", v13);

      if ((v15 & 1) == 0)
        goto LABEL_15;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v8);
LABEL_19:

  v16 = objc_msgSend(v4, "rangeOfString:options:", v5, 4);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:options:range:", v5, &stru_1E2ADF4C0, 0, 0, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v17;
  }
  -[PKPaymentSetupFieldText _amountFormatter](v26, "_amountFormatter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberFromString:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFromNumber:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v4, "length");
  if (v21 >= objc_msgSend(v20, "length"))
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(v20, "substringToIndex:", objc_msgSend(v4, "length"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v22;

  v4 = v24;
  v23 = v4;
LABEL_26:

  return v23;
}

- (id)stringByApplyingDisplayFormat:(id)a3
{
  return -[PKPaymentSetupFieldText stringByApplyingDisplayFormat:allowPartialFractional:](self, "stringByApplyingDisplayFormat:allowPartialFractional:", a3, 1);
}

- (id)stringByApplyingDisplayFormat:(id)a3 allowPartialFractional:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  -[PKPaymentSetupFieldText _currencyFormatter](self, "_currencyFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKPaymentSetupFieldText _stringByApplyingCurrencyFormatter:allowPartialFractional:](self, "_stringByApplyingCurrencyFormatter:allowPartialFractional:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional")
      && -[PKPaymentSetupFieldText hasDisplayFormat](self, "hasDisplayFormat"))
    {
      -[PKPaymentSetupFieldText _stringByApplyingNumericFractionalFormat:](self, "_stringByApplyingNumericFractionalFormat:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v9;
    }
    -[PKPaymentSetupField displayFormat](self, "displayFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldText displayFormatPaddingCharacters](self, "displayFormatPaddingCharacters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKApplyFormatToString(v6, v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)displayFormatPaddingCharacters
{
  NSArray *paddingCharacters;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  paddingCharacters = self->_paddingCharacters;
  if (paddingCharacters)
    return paddingCharacters;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldText displayFormatPlaceholder](self, "displayFormatPlaceholder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7 == 1)
  {
    -[PKPaymentSetupField displayFormat](self, "displayFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      do
      {
        objc_msgSend(v8, "substringToIndex:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldText displayFormatPlaceholder](self, "displayFormatPlaceholder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0)
        {

        }
        else
        {
          v11 = objc_msgSend(v5, "containsObject:", v9);

          if ((v11 & 1) == 0)
            objc_msgSend(v5, "addObject:", v9);
        }
        objc_msgSend(v8, "substringFromIndex:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v12;
      }
      while (objc_msgSend(v12, "length"));
    }
    else
    {
      v12 = v8;
    }

  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = objc_msgSend(&unk_1E2C3DD98, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(&unk_1E2C3DD98);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[PKPaymentSetupField displayFormat](self, "displayFormat");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "containsString:", v17);

          if (v19)
            objc_msgSend(v5, "addObject:", v17);
        }
        v14 = objc_msgSend(&unk_1E2C3DD98, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)updateDisplayFormat:(id)a3
{
  if (a3)
  {
    -[PKPaymentSetupField setDisplayFormat:](self, "setDisplayFormat:");
    -[PKPaymentSetupField noteCurrentValueChanged](self, "noteCurrentValueChanged");
  }
}

- (void)setAllowedCharacters:(id)a3
{
  id v5;
  id *p_allowedCharacters;
  id v7;
  id v8;

  v5 = a3;
  p_allowedCharacters = (id *)&self->_allowedCharacters;
  v7 = *p_allowedCharacters;
  v8 = v5;
  if (v5 && v7)
  {
    if ((objc_msgSend(v5, "isEqual:") & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v7 != v5)
LABEL_6:
    objc_storeStrong(p_allowedCharacters, a3);
LABEL_7:

}

- (NSCharacterSet)allowedCharacters
{
  NSCharacterSet *allowedCharacters;
  NSCharacterSet *v3;
  void *v5;
  void *v7;

  allowedCharacters = self->_allowedCharacters;
  if (allowedCharacters)
  {
    v3 = allowedCharacters;
LABEL_5:
    v5 = v3;
    return (NSCharacterSet *)v5;
  }
  if (-[PKPaymentSetupFieldText isNumeric](self, "isNumeric"))
  {
    objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
    v3 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[PKPaymentSetupFieldText isNumericFractional](self, "isNumericFractional"))
  {
    objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldText decimalSeparator](self, "decimalSeparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addCharactersInString:", v7);

  }
  else
  {
    v5 = 0;
  }
  return (NSCharacterSet *)v5;
}

- (void)updateWithAttribute:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupFieldText;
  -[PKPaymentSetupField updateWithAttribute:](&v10, sel_updateWithAttribute_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PKPaymentSetupFieldText setMinLength:](self, "setMinLength:", objc_msgSend(v5, "minLength"));
    -[PKPaymentSetupFieldText setMaxLength:](self, "setMaxLength:", objc_msgSend(v5, "maxLength"));
    -[PKPaymentSetupFieldText setSecureText:](self, "setSecureText:", objc_msgSend(v5, "isSecureText"));
    -[PKPaymentSetupFieldText setSecureVisibleText:](self, "setSecureVisibleText:", objc_msgSend(v5, "isSecureVisibleText"));
    -[PKPaymentSetupFieldText setNumeric:](self, "setNumeric:", objc_msgSend(v5, "isNumeric"));
    -[PKPaymentSetupFieldText setLuhnCheck:](self, "setLuhnCheck:", objc_msgSend(v5, "useLuhnCheck"));
    objc_msgSend(v5, "defaultValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      -[PKPaymentSetupFieldText setDefaultValue:](self, "setDefaultValue:", v6);
    -[PKPaymentSetupField defaultValue](self, "defaultValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99880], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v5, "setCurrentValue:", v8);
    objc_msgSend(v5, "displayFormatPlaceholder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length") == 1)
      -[PKPaymentSetupFieldText setDisplayFormatPlaceholder:](self, "setDisplayFormatPlaceholder:", v9);

  }
}

- (void)updateWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKPaymentSetupFieldText;
  -[PKPaymentSetupField updateWithConfiguration:](&v31, sel_updateWithConfiguration_, v4);
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("minLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    -[PKPaymentSetupFieldText setMinLength:](self, "setMinLength:", objc_msgSend(v5, "unsignedIntegerValue"));
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("maxLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    -[PKPaymentSetupFieldText setMaxLength:](self, "setMaxLength:", objc_msgSend(v7, "unsignedIntegerValue"));
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("secureText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    -[PKPaymentSetupFieldText setSecureText:](self, "setSecureText:", objc_msgSend(v9, "BOOLValue"));
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("secureVisibleText"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    -[PKPaymentSetupFieldText setSecureVisibleText:](self, "setSecureVisibleText:", objc_msgSend(v11, "BOOLValue"));
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("numeric"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    -[PKPaymentSetupFieldText setNumeric:](self, "setNumeric:", objc_msgSend(v13, "BOOLValue"));
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("numericFractional"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    -[PKPaymentSetupFieldText setNumericFractional:](self, "setNumericFractional:", objc_msgSend(v15, "BOOLValue"));
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("useLuhnCheck"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    -[PKPaymentSetupFieldText setLuhnCheck:](self, "setLuhnCheck:", objc_msgSend(v17, "BOOLValue"));
  v30 = v6;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("displayFormatPlaceholder"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length") == 1)
    -[PKPaymentSetupFieldText setDisplayFormatPlaceholder:](self, "setDisplayFormatPlaceholder:", v19);
  v29 = v8;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    -[PKPaymentSetupFieldText setCurrencyCode:](self, "setCurrencyCode:", v20);
  v28 = v10;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("alignment"), v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    -[PKPaymentSetupFieldText setAlignment:](self, "setAlignment:", PKPaymentSetupFieldTextAlignmentFromString(v21));
  objc_msgSend(v4, "PKStringForKey:", CFSTR("validationRegex"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v23, 0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldText setValidationRegex:](self, "setValidationRegex:", v24);

  }
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("codeOnError"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
    -[PKPaymentSetupFieldText setCodeOnError:](self, "setCodeOnError:", objc_msgSend(v25, "integerValue"));

}

- (unint64_t)fieldType
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupFieldText;
  v5 = -[PKPaymentSetupField copyWithZone:](&v15, sel_copyWithZone_);
  *((_QWORD *)v5 + 21) = self->_minLength;
  *((_QWORD *)v5 + 22) = self->_maxLength;
  *((_BYTE *)v5 + 160) = self->_secureText;
  *((_BYTE *)v5 + 161) = self->_secureVisibleText;
  *((_BYTE *)v5 + 162) = self->_numeric;
  *((_BYTE *)v5 + 163) = self->_numericFractional;
  *((_BYTE *)v5 + 164) = self->_luhnCheck;
  v6 = -[NSString copyWithZone:](self->_displayFormatPlaceholder, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 28);
  *((_QWORD *)v5 + 28) = v6;

  v8 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 23);
  *((_QWORD *)v5 + 23) = v8;

  *((_BYTE *)v5 + 165) = self->_keepPaddingCharactersForSubmission;
  v10 = -[NSArray copyWithZone:](self->_paddingCharacters, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v5 + 29);
  *((_QWORD *)v5 + 29) = v10;

  objc_storeStrong((id *)v5 + 17, self->_currencyFormatter);
  objc_storeStrong((id *)v5 + 18, self->_amountFormatter);
  objc_storeStrong((id *)v5 + 19, self->_allowedCharacters);
  *((_QWORD *)v5 + 24) = self->_alignment;
  v12 = -[NSArray copy](self->_keyboardAccessories, "copy");
  v13 = (void *)*((_QWORD *)v5 + 27);
  *((_QWORD *)v5 + 27) = v12;

  return v5;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (BOOL)isSecureText
{
  return self->_secureText;
}

- (void)setSecureText:(BOOL)a3
{
  self->_secureText = a3;
}

- (BOOL)isSecureVisibleText
{
  return self->_secureVisibleText;
}

- (void)setSecureVisibleText:(BOOL)a3
{
  self->_secureVisibleText = a3;
}

- (BOOL)isNumeric
{
  return self->_numeric;
}

- (void)setNumeric:(BOOL)a3
{
  self->_numeric = a3;
}

- (BOOL)isNumericFractional
{
  return self->_numericFractional;
}

- (BOOL)useLuhnCheck
{
  return self->_luhnCheck;
}

- (void)setLuhnCheck:(BOOL)a3
{
  self->_luhnCheck = a3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (BOOL)keepPaddingCharactersForSubmission
{
  return self->_keepPaddingCharactersForSubmission;
}

- (void)setKeepPaddingCharactersForSubmission:(BOOL)a3
{
  self->_keepPaddingCharactersForSubmission = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (NSRegularExpression)validationRegex
{
  return self->_validationRegex;
}

- (void)setValidationRegex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (int64_t)codeOnError
{
  return self->_codeOnError;
}

- (void)setCodeOnError:(int64_t)a3
{
  self->_codeOnError = a3;
}

- (NSArray)keyboardAccessories
{
  return self->_keyboardAccessories;
}

- (void)setKeyboardAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardAccessories, a3);
}

- (NSString)displayFormatPlaceholder
{
  return self->_displayFormatPlaceholder;
}

- (void)setDisplayFormatPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)paddingCharacters
{
  return self->_paddingCharacters;
}

- (void)setPaddingCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_paddingCharacters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingCharacters, 0);
  objc_storeStrong((id *)&self->_displayFormatPlaceholder, 0);
  objc_storeStrong((id *)&self->_keyboardAccessories, 0);
  objc_storeStrong((id *)&self->_validationRegex, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_allowedCharacters, 0);
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
}

@end
