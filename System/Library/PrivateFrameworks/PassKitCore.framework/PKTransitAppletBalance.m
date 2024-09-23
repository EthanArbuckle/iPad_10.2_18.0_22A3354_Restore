@implementation PKTransitAppletBalance

- (PKTransitAppletBalance)initWithDictionary:(id)a3
{
  id v4;
  PKTransitAppletBalance *v5;
  PKTransitAppletBalance *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDecimalNumber *balance;
  id v11;
  NSDecimalNumber *v12;
  uint64_t v13;
  NSDecimalNumber *v14;
  void *v15;
  uint64_t v16;
  NSString *currency;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDate *expirationDate;
  NSDecimalNumber *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSDate *v30;
  _QWORD v32[2];
  int v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKTransitAppletBalance;
  v5 = -[PKTransitAppletBalance init](&v34, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BalanceIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransitAppletBalance _setIdentifierFromObject:](v6, "_setIdentifierFromObject:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Balance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    balance = v6->_balance;
    v6->_balance = (NSDecimalNumber *)v9;

    if (v6->_balance)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = objc_alloc(MEMORY[0x1E0CB3598]);
        v12 = v6->_balance;
        if (v12)
        {
          -[NSDecimalNumber decimalValue](v12, "decimalValue");
        }
        else
        {
          v32[0] = 0;
          v32[1] = 0;
          v33 = 0;
        }
        v13 = objc_msgSend(v11, "initWithDecimal:", v32);
        v14 = v6->_balance;
        v6->_balance = (NSDecimalNumber *)v13;

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BalanceCurrency"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    currency = v6->_currency;
    v6->_currency = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BalanceCurrencyExponent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_exponent = objc_msgSend(v18, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BalanceExpirationDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isValidDate") & 1) == 0)
    {
      objc_msgSend(v19, "calendar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setCalendar:", v21);

      }
      objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTimeZone:", v22);

    }
    objc_msgSend(v19, "date");
    v23 = objc_claimAutoreleasedReturnValue();
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v23;

    if (!v19 && !-[PKTransitAppletBalance isCurrency](v6, "isCurrency"))
    {
      v25 = v6->_balance;
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NSDecimalNumber compare:](v25, "compare:", v26);

      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "dateByAddingTimeInterval:", 86400.0);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v6->_expirationDate;
        v6->_expirationDate = (NSDate *)v29;

      }
    }

  }
  return v6;
}

- (PKTransitAppletBalance)initWithIdentifier:(id)a3 balance:(id)a4 currency:(id)a5 exponent:(int64_t)a6 expirationDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKTransitAppletBalance *v17;
  PKTransitAppletBalance *v18;
  uint64_t v19;
  NSDecimalNumber *balance;
  uint64_t v21;
  NSString *currency;
  void *v23;
  uint64_t v24;
  NSDate *expirationDate;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PKTransitAppletBalance;
  v17 = -[PKTransitAppletBalance init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    v19 = objc_msgSend(v14, "copy");
    balance = v18->_balance;
    v18->_balance = (NSDecimalNumber *)v19;

    v21 = objc_msgSend(v15, "copy");
    currency = v18->_currency;
    v18->_currency = (NSString *)v21;

    v18->_exponent = a6;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dateFromComponents:", v16);
    v24 = objc_claimAutoreleasedReturnValue();
    expirationDate = v18->_expirationDate;
    v18->_expirationDate = (NSDate *)v24;

  }
  return v18;
}

- (void)_setIdentifierFromObject:(id)a3
{
  NSString *v4;
  NSString *identifier;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "hexEncoding");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    identifier = self->_identifier;
    self->_identifier = v4;

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (NSString *)v6;
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)isCurrency
{
  NSString *currency;

  currency = self->_currency;
  if (currency)
    LOBYTE(currency) = !-[NSString isEqualToString:](currency, "isEqualToString:", CFSTR("XXX"));
  return (char)currency;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_balance, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v5[4] = self->_exponent;
  v12 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKTransitAppletBalance *v4;
  PKTransitAppletBalance *v5;
  BOOL v6;

  v4 = (PKTransitAppletBalance *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransitAppletBalance isEqualToBalance:](self, "isEqualToBalance:", v5);

  return v6;
}

- (BOOL)isEqualToBalance:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  NSDecimalNumber *balance;
  NSDecimalNumber *v9;
  NSString *currency;
  NSString *v11;
  NSDate *expirationDate;
  NSDate *v13;
  char v14;

  v4 = a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_22;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_22;
  }
  balance = self->_balance;
  v9 = (NSDecimalNumber *)v4[2];
  if (balance && v9)
  {
    if ((-[NSDecimalNumber isEqual:](balance, "isEqual:") & 1) == 0)
      goto LABEL_22;
  }
  else if (balance != v9)
  {
    goto LABEL_22;
  }
  if (self->_exponent != v4[4])
    goto LABEL_22;
  currency = self->_currency;
  v11 = (NSString *)v4[3];
  if (!currency || !v11)
  {
    if (currency == v11)
      goto LABEL_18;
LABEL_22:
    v14 = 0;
    goto LABEL_23;
  }
  if ((-[NSString isEqual:](currency, "isEqual:") & 1) == 0)
    goto LABEL_22;
LABEL_18:
  expirationDate = self->_expirationDate;
  v13 = (NSDate *)v4[5];
  if (expirationDate && v13)
    v14 = -[NSDate isEqual:](expirationDate, "isEqual:");
  else
    v14 = expirationDate == v13;
LABEL_23:

  return v14;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_balance);
  objc_msgSend(v3, "safelyAddObject:", self->_currency);
  objc_msgSend(v3, "safelyAddObject:", self->_expirationDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_exponent - v4 + 32 * v4;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balance, CFSTR("finalBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_exponent, CFSTR("currencyExponent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDateAndTime"));

}

- (PKTransitAppletBalance)initWithCoder:(id)a3
{
  id v4;
  PKTransitAppletBalance *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDecimalNumber *balance;
  uint64_t v10;
  NSString *currency;
  uint64_t v12;
  NSDate *expirationDate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTransitAppletBalance;
  v5 = -[PKTransitAppletBalance init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("finalBalance"));
    v8 = objc_claimAutoreleasedReturnValue();
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v10 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v10;

    v5->_exponent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("currencyExponent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDateAndTime"));
    v12 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v12;

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = v3;
  if (self->_balance)
    objc_msgSend(v3, "appendFormat:", CFSTR("balance:%@ "), self->_balance);
  if (self->_exponent)
    objc_msgSend(v4, "appendFormat:", CFSTR("exponent:%ld "), self->_exponent);
  if (self->_currency)
    objc_msgSend(v4, "appendFormat:", CFSTR("currency:%@ "), self->_currency);
  if (self->_expirationDate)
    objc_msgSend(v4, "appendFormat:", CFSTR("expirationDate:%@ "), self->_expirationDate);
  if (self->_identifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("identifier:%@ "), self->_identifier);
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  if (v5)
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p> {%@}"), v7, self, v4);
  else
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v7, self, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)exponent
{
  return self->_exponent;
}

- (void)setExponent:(int64_t)a3
{
  self->_exponent = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
