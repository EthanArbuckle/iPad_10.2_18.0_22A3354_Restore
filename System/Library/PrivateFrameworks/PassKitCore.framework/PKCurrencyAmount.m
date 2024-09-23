@implementation PKCurrencyAmount

- (int64_t)compareToCurrencyCode:(id)a3 amount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[PKCurrencyAmount currency](self, "currency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "caseInsensitiveCompare:", v7);

  if (v9)
  {
    v10 = -1;
  }
  else
  {
    -[PKCurrencyAmount amount](self, "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "compare:", v6);

  }
  return v10;
}

- (PKCurrencyAmount)initWithAmount:(id)a3 currency:(id)a4
{
  return -[PKCurrencyAmount initWithAmount:currency:exponent:](self, "initWithAmount:currency:exponent:", a3, a4, 0);
}

- (PKCurrencyAmount)initWithAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  PKCurrencyAmount *v11;
  PKCurrencyAmount *v12;
  uint64_t v13;
  NSDecimalNumber *amount;
  uint64_t v15;
  NSString *currency;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKCurrencyAmount;
    v12 = -[PKCurrencyAmount init](&v18, sel_init);
    if (v12)
    {
      v13 = objc_msgSend(v8, "copy");
      amount = v12->_amount;
      v12->_amount = (NSDecimalNumber *)v13;

      v15 = objc_msgSend(v10, "copy");
      currency = v12->_currency;
      v12->_currency = (NSString *)v15;

      v12->_exponent = a5;
    }
    self = v12;
    v11 = self;
  }

  return v11;
}

- (PKCurrencyAmount)initWithAmount:(id)a3 exponent:(int64_t)a4 preformattedString:(id)a5
{
  id v8;
  void *v9;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *v11;
  uint64_t v12;
  NSString *preformattedString;

  v8 = a5;
  v9 = v8;
  v10 = 0;
  if (a3 && v8)
  {
    v11 = -[PKCurrencyAmount initWithAmount:currency:exponent:](self, "initWithAmount:currency:exponent:", a3, CFSTR("XXX"), a4);
    if (v11)
    {
      v12 = objc_msgSend(v9, "copy");
      preformattedString = v11->_preformattedString;
      v11->_preformattedString = (NSString *)v12;

    }
    self = v11;
    v10 = self;
  }

  return v10;
}

- (PKCurrencyAmount)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  PKCurrencyAmount *v6;
  NSDecimalNumber *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = v4;
  if (v4 && (unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v5, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
    v7 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "PKStringForKey:", CFSTR("currencyCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("currency"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    v6 = 0;
    if (v7 && v11)
    {
      PKCurrencyAmountCreate(v7, v11, 0);
      v6 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKCurrencyAmount *v4;
  PKCurrencyAmount *v5;
  BOOL v6;

  v4 = (PKCurrencyAmount *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCurrencyAmount isEqualToCurrencyAmount:](self, "isEqualToCurrencyAmount:", v5);

  return v6;
}

- (BOOL)isEqualToCurrencyAmount:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *amount;
  NSDecimalNumber *v6;
  BOOL v7;
  char v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  _BOOL4 v13;
  NSString *currency;
  NSString *v15;
  char v16;

  v4 = a3;
  amount = self->_amount;
  v6 = (NSDecimalNumber *)v4[1];
  if (amount)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (amount != v6)
    {
LABEL_20:
      v16 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    v8 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_20;
  }
  if (self->_exponent != v4[3])
    goto LABEL_20;
  v9 = (void *)v4[4];
  v10 = self->_preformattedString;
  v11 = v9;
  if (v10 == v11)
  {

    goto LABEL_16;
  }
  v12 = v11;
  if (!v10 || !v11)
  {

    goto LABEL_20;
  }
  v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

  if (!v13)
    goto LABEL_20;
LABEL_16:
  currency = self->_currency;
  v15 = (NSString *)v4[2];
  if (currency && v15)
    v16 = -[NSString isEqual:](currency, "isEqual:");
  else
    v16 = currency == v15;
LABEL_21:

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_currency);
  objc_msgSend(v3, "safelyAddObject:", self->_preformattedString);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_exponent - v4 + 32 * v4;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_exponent, CFSTR("exponent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preformattedString, CFSTR("preformattedString"));

}

- (PKCurrencyAmount)initWithCoder:(id)a3
{
  id v4;
  PKCurrencyAmount *v5;
  uint64_t v6;
  NSDecimalNumber *amount;
  uint64_t v8;
  NSString *currency;
  uint64_t v10;
  NSString *preformattedString;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCurrencyAmount;
  v5 = -[PKCurrencyAmount init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v8 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    v5->_exponent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("exponent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preformattedString"));
    v10 = objc_claimAutoreleasedReturnValue();
    preformattedString = v5->_preformattedString;
    v5->_preformattedString = (NSString *)v10;

    if (!v5->_amount || !v5->_currency && !v5->_preformattedString)
    {

      v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currency: %@; "), self->_currency);
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: %@; "), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR("exponent: %ld; "), self->_exponent);
  objc_msgSend(v3, "appendFormat:", CFSTR("preformatted string: %@; "), self->_preformattedString);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)formattedStringValue
{
  NSString *preformattedString;
  NSString *v3;
  _BOOL4 v5;
  NSDecimalNumber *amount;

  preformattedString = self->_preformattedString;
  if (preformattedString)
  {
    v3 = preformattedString;
  }
  else if (self->_currency && self->_amount)
  {
    v5 = -[PKCurrencyAmount isCurrency](self, "isCurrency");
    amount = self->_amount;
    if (v5)
      PKFormattedCurrencyStringFromNumber(amount, self->_currency);
    else
      PKFormattedStringMinimalFractionDigitsFromNumber(amount, self->_exponent);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)minimalFormattedStringValue
{
  return -[PKCurrencyAmount minimalFormattedStringValueInLocale:](self, "minimalFormattedStringValueInLocale:", 0);
}

- (BOOL)isCurrency
{
  NSString *currency;

  currency = self->_currency;
  if (currency)
    LOBYTE(currency) = !-[NSString isEqualToString:](currency, "isEqualToString:", CFSTR("XXX"));
  return (char)currency;
}

- (id)minimalFormattedStringValueInLocale:(id)a3
{
  id v4;
  NSString *preformattedString;
  NSString *v6;
  void *v7;
  NSDecimalNumber *amount;
  int v9;
  NSString *currency;
  void *v11;

  v4 = a3;
  preformattedString = self->_preformattedString;
  if (preformattedString)
  {
    v6 = preformattedString;
LABEL_3:
    v7 = v6;
    goto LABEL_15;
  }
  if (!self->_currency || (amount = self->_amount) == 0)
  {
    v7 = 0;
    goto LABEL_15;
  }
  v9 = -[NSDecimalNumber pk_isIntegralNumber](amount, "pk_isIntegralNumber");
  if (!v4)
  {
    currency = self->_currency;
    if (v9)
      PKFormattedCurrencyStringWithMinimalFractionDigitsFromNumber(self->_amount, currency);
    else
      PKFormattedCurrencyStringFromNumber(self->_amount, currency);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (v9)
    PKMutableNumberFormatterWithMinimalFractionDigitsForCurrencyCode(self->_currency);
  else
    PKMutableNumberFormatterForCurrencyCode(self->_currency);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocale:", v4);
  objc_msgSend(v11, "stringFromNumber:", self->_amount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("amount");
  -[NSDecimalNumber stringValue](self->_amount, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("currency");
  v7[0] = v3;
  v7[1] = self->_currency;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)absoluteValue
{
  void *v3;
  NSString *preformattedString;
  PKCurrencyAmount *v5;
  uint64_t v6;
  void *v7;

  -[NSDecimalNumber pk_absoluteValue](self->_amount, "pk_absoluteValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  preformattedString = self->_preformattedString;
  v5 = [PKCurrencyAmount alloc];
  if (preformattedString)
    v6 = -[PKCurrencyAmount initWithAmount:exponent:preformattedString:](v5, "initWithAmount:exponent:preformattedString:", v3, self->_exponent, self->_preformattedString);
  else
    v6 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v5, "initWithAmount:currency:exponent:", v3, self->_currency, self->_exponent);
  v7 = (void *)v6;

  return v7;
}

- (id)negativeValue
{
  void *v3;
  NSString *preformattedString;
  PKCurrencyAmount *v5;
  uint64_t v6;
  void *v7;

  -[NSDecimalNumber pk_negativeValue](self->_amount, "pk_negativeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  preformattedString = self->_preformattedString;
  v5 = [PKCurrencyAmount alloc];
  if (preformattedString)
    v6 = -[PKCurrencyAmount initWithAmount:exponent:preformattedString:](v5, "initWithAmount:exponent:preformattedString:", v3, self->_exponent, self->_preformattedString);
  else
    v6 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v5, "initWithAmount:currency:exponent:", v3, self->_currency, self->_exponent);
  v7 = (void *)v6;

  return v7;
}

- (id)currencyAmountByAddingCurrencyAmount:(id)a3
{
  id v4;
  NSString *currency;
  void *v6;
  NSDecimalNumber *v7;
  NSDecimalNumber *v8;
  NSDecimalNumber *v9;
  BOOL v10;
  void *v11;
  int v12;
  NSDecimalNumber *amount;
  void *v14;

  v4 = a3;
  currency = self->_currency;
  objc_msgSend(v4, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = currency;
  v8 = v6;
  if (v7 == v8)
  {

LABEL_10:
    amount = self->_amount;
    objc_msgSend(v4, "amount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDecimalNumber decimalNumberByAdding:](amount, "decimalNumberByAdding:", v14);
    v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

    PKCurrencyAmountCreate(v9, self->_currency, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v12 = -[NSDecimalNumber isEqualToString:](v7, "isEqualToString:", v8);

    if (!v12)
    {
      v11 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

- (id)currencyAmountBySubtractingCurrencyAmount:(id)a3
{
  id v4;
  NSString *currency;
  void *v6;
  NSDecimalNumber *v7;
  NSDecimalNumber *v8;
  NSDecimalNumber *v9;
  BOOL v10;
  void *v11;
  int v12;
  NSDecimalNumber *amount;
  void *v14;

  v4 = a3;
  currency = self->_currency;
  objc_msgSend(v4, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = currency;
  v8 = v6;
  if (v7 == v8)
  {

LABEL_10:
    amount = self->_amount;
    objc_msgSend(v4, "amount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDecimalNumber decimalNumberBySubtracting:](amount, "decimalNumberBySubtracting:", v14);
    v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

    PKCurrencyAmountCreate(v9, self->_currency, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v12 = -[NSDecimalNumber isEqualToString:](v7, "isEqualToString:", v8);

    if (!v12)
    {
      v11 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

+ (id)minimumCurrencyAmount:(id)a3 otherCurrencyAmount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "currency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

LABEL_10:
      v17 = 0;
      goto LABEL_13;
    }
    v12 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_10;
  }
  objc_msgSend(v5, "amount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "amount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  if (v15 == -1)
    v16 = v5;
  else
    v16 = v6;
  v17 = v16;
LABEL_13:

  return v17;
}

+ (id)maximumCurrencyAmount:(id)a3 otherCurrencyAmount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "currency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

LABEL_10:
      v17 = 0;
      goto LABEL_13;
    }
    v12 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_10;
  }
  objc_msgSend(v5, "amount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "amount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  if (v15 == 1)
    v16 = v5;
  else
    v16 = v6;
  v17 = v16;
LABEL_13:

  return v17;
}

- (id)amountByConvertingToSmallestCommonCurrencyUnit
{
  __int16 v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[PKCurrencyAmount isCurrency](self, "isCurrency"))
  {
    v3 = PKDefaultFractionDigitsForCurrencyCode(self->_currency);
    objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 0, 0, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:withBehavior:](self->_amount, "decimalNumberByMultiplyingByPowerOf10:withBehavior:", (__int16)(LOWORD(self->_exponent) + v3), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)currencyAmountLessThanCurrencyAmount:(id)a3
{
  id v4;
  NSString *currency;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  _BOOL4 v12;
  NSDecimalNumber *amount;

  v4 = a3;
  currency = self->_currency;
  objc_msgSend(v4, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = currency;
  v8 = v6;
  if (v7 == v8)
  {

LABEL_10:
    amount = self->_amount;
    objc_msgSend(v4, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDecimalNumber compare:](amount, "compare:", v9) == NSOrderedAscending;
    goto LABEL_11;
  }
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v12 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v12)
    {
      v11 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

- (BOOL)currencyAmountGreaterThanCurrencyAmount:(id)a3
{
  id v4;
  NSString *currency;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  _BOOL4 v12;
  NSDecimalNumber *amount;

  v4 = a3;
  currency = self->_currency;
  objc_msgSend(v4, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = currency;
  v8 = v6;
  if (v7 == v8)
  {

LABEL_10:
    amount = self->_amount;
    objc_msgSend(v4, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDecimalNumber compare:](amount, "compare:", v9) == NSOrderedDescending;
    goto LABEL_11;
  }
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v12 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v12)
    {
      v11 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

- (BOOL)currencyAmountEqualToCurrencyAmount:(id)a3
{
  id v4;
  NSString *currency;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  _BOOL4 v12;
  NSDecimalNumber *amount;

  v4 = a3;
  currency = self->_currency;
  objc_msgSend(v4, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = currency;
  v8 = v6;
  if (v7 == v8)
  {

LABEL_10:
    amount = self->_amount;
    objc_msgSend(v4, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDecimalNumber compare:](amount, "compare:", v9) == NSOrderedSame;
    goto LABEL_11;
  }
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v12 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v12)
    {
      v11 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  v11 = 0;
LABEL_11:

LABEL_12:
  return v11;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)exponent
{
  return self->_exponent;
}

- (void)setExponent:(int64_t)a3
{
  self->_exponent = a3;
}

- (NSString)preformattedString
{
  return self->_preformattedString;
}

- (void)setPreformattedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preformattedString, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
