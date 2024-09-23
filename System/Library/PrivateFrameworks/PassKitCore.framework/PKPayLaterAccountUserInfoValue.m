@implementation PKPayLaterAccountUserInfoValue

- (PKPayLaterAccountUserInfoValue)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterAccountUserInfoValue *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PKCurrencyAmount *currencyAmount;
  uint64_t v10;
  NSString *odiAttribute;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterAccountUserInfoValue;
  v5 = -[PKPayLaterAccountUserInfoValue init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&v5->_date, v6);
    objc_msgSend(v4, "PKStringForKey:", CFSTR("text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_storeStrong((id *)&v5->_text, v7);
    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("currencyAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("odiAttribute"));
    v10 = objc_claimAutoreleasedReturnValue();
    odiAttribute = v5->_odiAttribute;
    v5->_odiAttribute = (NSString *)v10;

    v5->_hasHiddenValue = objc_msgSend(v4, "PKBoolForKey:", CFSTR("hasHiddenValue"));
  }

  return v5;
}

- (NSString)text
{
  NSString *text;
  NSString *v3;
  PKCurrencyAmount *currencyAmount;
  void *v6;
  id v8;
  void *v9;

  text = self->_text;
  if (text)
  {
    v3 = text;
LABEL_5:
    v6 = v3;
    return (NSString *)v6;
  }
  currencyAmount = self->_currencyAmount;
  if (currencyAmount)
  {
    -[PKCurrencyAmount formattedStringValue](currencyAmount, "formattedStringValue");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (self->_date)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCalendar:", v9);

    objc_msgSend(v8, "setDateStyle:", 1);
    objc_msgSend(v8, "stringFromDate:", self->_date);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountUserInfoValue)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterAccountUserInfoValue *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSDate *date;
  uint64_t v10;
  PKCurrencyAmount *currencyAmount;
  uint64_t v12;
  NSString *odiAttribute;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterAccountUserInfoValue;
  v5 = -[PKPayLaterAccountUserInfoValue init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v8 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v10 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("odiAttribute"));
    v12 = objc_claimAutoreleasedReturnValue();
    odiAttribute = v5->_odiAttribute;
    v5->_odiAttribute = (NSString *)v12;

    v5->_hasHiddenValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasHiddenValue"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyAmount, CFSTR("currencyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_odiAttribute, CFSTR("odiAttribute"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasHiddenValue, CFSTR("hasHiddenValue"));

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  BOOL v11;
  NSDate *date;
  NSDate *v13;
  PKCurrencyAmount *currencyAmount;
  PKCurrencyAmount *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  _BOOL4 v20;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKPayLaterAccountUserInfoValue text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {

    }
    else
    {
      if (!v7 || !v8)
      {

        goto LABEL_28;
      }
      v10 = objc_msgSend(v7, "isEqualToString:", v8);

      if (!v10)
        goto LABEL_28;
    }
    date = self->_date;
    v13 = (NSDate *)*((_QWORD *)v4 + 3);
    if (date && v13)
    {
      if ((-[NSDate isEqual:](date, "isEqual:") & 1) == 0)
        goto LABEL_28;
    }
    else if (date != v13)
    {
      goto LABEL_28;
    }
    currencyAmount = self->_currencyAmount;
    v15 = (PKCurrencyAmount *)*((_QWORD *)v4 + 4);
    if (currencyAmount && v15)
    {
      if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
        goto LABEL_28;
    }
    else if (currencyAmount != v15)
    {
      goto LABEL_28;
    }
    v16 = (void *)*((_QWORD *)v4 + 5);
    v17 = self->_odiAttribute;
    v18 = v16;
    if (v17 == v18)
    {

      goto LABEL_26;
    }
    v19 = v18;
    if (v17 && v18)
    {
      v20 = -[NSString isEqualToString:](v17, "isEqualToString:", v18);

      if (!v20)
        goto LABEL_28;
LABEL_26:
      v11 = self->_hasHiddenValue == v4[8];
LABEL_29:

      goto LABEL_30;
    }

LABEL_28:
    v11 = 0;
    goto LABEL_29;
  }
  v11 = 0;
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_text);
  objc_msgSend(v3, "safelyAddObject:", self->_date);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_odiAttribute);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_hasHiddenValue - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("text: '%@'; "), self->_text);
  -[NSDate description](self->_date, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("date: '%@'; "), v4);

  -[PKCurrencyAmount formattedStringValue](self->_currencyAmount, "formattedStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyAmount: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("odiAttribute: '%@'; "), self->_odiAttribute);
  if (self->_hasHiddenValue)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasHiddenValue: '%@'; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterAccountUserInfoValue *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSDate *date;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *currencyAmount;
  uint64_t v12;
  NSString *odiAttribute;

  v5 = -[PKPayLaterAccountUserInfoValue init](+[PKPayLaterAccountUserInfoValue allocWithZone:](PKPayLaterAccountUserInfoValue, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  text = v5->_text;
  v5->_text = (NSString *)v6;

  v8 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
  date = v5->_date;
  v5->_date = (NSDate *)v8;

  v10 = -[PKCurrencyAmount copyWithZone:](self->_currencyAmount, "copyWithZone:", a3);
  currencyAmount = v5->_currencyAmount;
  v5->_currencyAmount = v10;

  v12 = -[NSString copyWithZone:](self->_odiAttribute, "copyWithZone:", a3);
  odiAttribute = v5->_odiAttribute;
  v5->_odiAttribute = (NSString *)v12;

  v5->_hasHiddenValue = self->_hasHiddenValue;
  return v5;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (NSString)odiAttribute
{
  return self->_odiAttribute;
}

- (void)setOdiAttribute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)hasHiddenValue
{
  return self->_hasHiddenValue;
}

- (void)setHasHiddenValue:(BOOL)a3
{
  self->_hasHiddenValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAttribute, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
