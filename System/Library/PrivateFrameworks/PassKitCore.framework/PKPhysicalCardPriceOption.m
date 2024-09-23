@implementation PKPhysicalCardPriceOption

- (PKPhysicalCardPriceOption)initWithDictionary:(id)a3
{
  id v4;
  PKPhysicalCardPriceOption *v5;
  void *v6;
  void *v7;
  void *v8;
  PKCurrencyAmount *v9;
  PKCurrencyAmount *amount;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPhysicalCardPriceOption;
  v5 = -[PKPhysicalCardPriceOption init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reason = PKPhysicalCardOrderReasonFromString(v6);

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("priceAmount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v7, v8, 0);
    amount = v5->_amount;
    v5->_amount = v9;

  }
  return v5;
}

- (id)jsonDictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKStringFromPhysicalCardOrderReason(self->_reason);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("reason"));

  -[PKCurrencyAmount amount](self->_amount, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("priceAmount"));

  -[PKCurrencyAmount currency](self->_amount, "currency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("currencyCode"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicalCardPriceOption)initWithCoder:(id)a3
{
  id v4;
  PKPhysicalCardPriceOption *v5;
  uint64_t v6;
  PKCurrencyAmount *amount;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPhysicalCardPriceOption;
  v5 = -[PKPhysicalCardPriceOption init](&v9, sel_init);
  if (v5)
  {
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t reason;
  id v5;

  reason = self->_reason;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKCurrencyAmount *amount;
  PKCurrencyAmount *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  amount = self->_amount;
  v6 = (PKCurrencyAmount *)v4[2];
  if (!amount || !v6)
  {
    if (amount == v6)
      goto LABEL_5;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!-[PKCurrencyAmount isEqual:](amount, "isEqual:"))
    goto LABEL_7;
LABEL_5:
  v7 = self->_reason == v4[1];
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_reason - v4 + 32 * v4;

  return v5;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
