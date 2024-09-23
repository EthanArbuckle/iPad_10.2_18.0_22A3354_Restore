@implementation PKTransitAppletAmount

- (PKTransitAppletAmount)initWithDictionary:(id)a3
{
  id v4;
  PKTransitAppletAmount *v5;
  PKTransitAppletAmount *v6;
  void *v7;
  uint64_t v8;
  NSString *balanceIdentifier;
  void *v10;
  uint64_t v11;
  NSDecimalNumber *amount;
  void *v13;
  uint64_t v14;
  NSString *currency;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKTransitAppletAmount;
  v5 = -[PKTransitAppletAmount init](&v18, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AmountIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    balanceIdentifier = v6->_balanceIdentifier;
    v6->_balanceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Amount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    amount = v6->_amount;
    v6->_amount = (NSDecimalNumber *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AmountCurrency"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    currency = v6->_currency;
    v6->_currency = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AmountCurrencyExponent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_exponent = objc_msgSend(v16, "integerValue");

  }
  return v6;
}

- (PKTransitAppletAmount)initWithAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKTransitAppletAmount *v13;
  uint64_t v14;
  NSDecimalNumber *amount;
  uint64_t v16;
  NSString *currency;
  uint64_t v18;
  NSString *balanceIdentifier;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKTransitAppletAmount;
  v13 = -[PKTransitAppletAmount init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    amount = v13->_amount;
    v13->_amount = (NSDecimalNumber *)v14;

    v16 = objc_msgSend(v11, "copy");
    currency = v13->_currency;
    v13->_currency = (NSString *)v16;

    v13->_exponent = a5;
    v18 = objc_msgSend(v12, "copy");
    balanceIdentifier = v13->_balanceIdentifier;
    v13->_balanceIdentifier = (NSString *)v18;

  }
  return v13;
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_balanceIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v5[3] = self->_exponent;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *balanceIdentifier;
  id v5;

  balanceIdentifier = self->_balanceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", balanceIdentifier, CFSTR("balanceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amountKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_exponent, CFSTR("currencyExponent"));

}

- (PKTransitAppletAmount)initWithCoder:(id)a3
{
  id v4;
  PKTransitAppletAmount *v5;
  uint64_t v6;
  NSString *balanceIdentifier;
  uint64_t v8;
  NSDecimalNumber *amount;
  uint64_t v10;
  NSString *currency;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransitAppletAmount;
  v5 = -[PKTransitAppletAmount init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balanceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    balanceIdentifier = v5->_balanceIdentifier;
    v5->_balanceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v10 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v10;

    v5->_exponent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("currencyExponent"));
  }

  return v5;
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (void)setBalanceIdentifier:(id)a3
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

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_balanceIdentifier, 0);
}

@end
