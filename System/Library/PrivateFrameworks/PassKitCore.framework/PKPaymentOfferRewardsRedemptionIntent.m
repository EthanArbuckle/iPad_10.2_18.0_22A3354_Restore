@implementation PKPaymentOfferRewardsRedemptionIntent

- (PKPaymentOfferRewardsRedemptionIntent)initWithRewardsBalance:(id)a3 amount:(id)a4 value:(id)a5
{
  id v8;
  NSDecimalNumber *v9;
  id v10;
  void *v11;
  PKPaymentOfferRewardsRedemptionIntent *v12;
  uint64_t v13;
  PKPaymentRewardsBalance *rewardsBalance;
  uint64_t v15;
  NSDecimalNumber *value;
  NSString *v17;
  uint64_t v18;
  PKCurrencyAmount *monetaryValue;
  objc_super v21;

  v8 = a3;
  v9 = (NSDecimalNumber *)a4;
  v10 = a5;
  objc_msgSend(v8, "monetaryValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentOfferRewardsRedemptionIntent;
  v12 = -[PKPaymentOfferRewardsRedemptionIntent init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    rewardsBalance = v12->_rewardsBalance;
    v12->_rewardsBalance = (PKPaymentRewardsBalance *)v13;

    if (v10)
    {
      v15 = objc_msgSend(v10, "copy");
    }
    else
    {
      objc_msgSend(v8, "convertValueFromAmount:", v9);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    value = v12->_value;
    v12->_value = (NSDecimalNumber *)v15;

    objc_msgSend(v11, "currency");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v9, v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    monetaryValue = v12->_monetaryValue;
    v12->_monetaryValue = (PKCurrencyAmount *)v18;

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferRewardsRedemptionIntent *v4;
  PKPaymentOfferRewardsRedemptionIntent *v5;
  PKPaymentOfferRewardsRedemptionIntent *v6;
  PKPaymentRewardsBalance *rewardsBalance;
  PKPaymentRewardsBalance *v8;
  char v9;
  PKCurrencyAmount *monetaryValue;
  PKCurrencyAmount *v11;
  NSDecimalNumber *value;
  NSDecimalNumber *v13;

  v4 = (PKPaymentOfferRewardsRedemptionIntent *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        rewardsBalance = self->_rewardsBalance;
        v8 = v6->_rewardsBalance;
        if (rewardsBalance && v8)
        {
          if (!-[PKPaymentRewardsBalance isEqual:](rewardsBalance, "isEqual:"))
            goto LABEL_18;
        }
        else if (rewardsBalance != v8)
        {
          goto LABEL_18;
        }
        monetaryValue = self->_monetaryValue;
        v11 = v6->_monetaryValue;
        if (monetaryValue && v11)
        {
          if (-[PKCurrencyAmount isEqual:](monetaryValue, "isEqual:"))
          {
LABEL_14:
            value = self->_value;
            v13 = v6->_value;
            if (value && v13)
              v9 = -[NSDecimalNumber isEqual:](value, "isEqual:");
            else
              v9 = value == v13;
            goto LABEL_19;
          }
        }
        else if (monetaryValue == v11)
        {
          goto LABEL_14;
        }
LABEL_18:
        v9 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v9 = 0;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_monetaryValue);
  objc_msgSend(v3, "safelyAddObject:", self->_value);
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentOfferRewardsRedemptionIntent;
  v4 = -[PKPaymentOfferRewardsRedemptionIntent hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  -[PKPaymentOfferRewardsRedemptionIntent balanceIdentifier](self, "balanceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("balanceIdentifier: '%@'; "), v4);

  -[PKPaymentOfferRewardsRedemptionIntent programName](self, "programName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("programName: '%@'; "), v5);

  PKPaymentRewardsBalanceTypeToString(-[PKPaymentOfferRewardsRedemptionIntent rewardsType](self, "rewardsType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsType: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("monetaryValue: '%@'; "), self->_monetaryValue);
  objc_msgSend(v3, "appendFormat:", CFSTR("value: '%@'; "), self->_value);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)balanceIdentifier
{
  return -[PKPaymentRewardsBalance identifier](self->_rewardsBalance, "identifier");
}

- (NSString)programName
{
  return -[PKPaymentRewardsBalance programName](self->_rewardsBalance, "programName");
}

- (unint64_t)rewardsType
{
  return -[PKPaymentRewardsBalance type](self->_rewardsBalance, "type");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferRewardsRedemptionIntent)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferRewardsRedemptionIntent *v5;
  uint64_t v6;
  PKPaymentRewardsBalance *rewardsBalance;
  uint64_t v8;
  PKCurrencyAmount *monetaryValue;
  uint64_t v10;
  NSDecimalNumber *value;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferRewardsRedemptionIntent;
  v5 = -[PKPaymentOfferRewardsRedemptionIntent init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsBalance"));
    v6 = objc_claimAutoreleasedReturnValue();
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (PKPaymentRewardsBalance *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("monetaryValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    monetaryValue = v5->_monetaryValue;
    v5->_monetaryValue = (PKCurrencyAmount *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v10 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSDecimalNumber *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPaymentRewardsBalance *rewardsBalance;
  id v5;

  rewardsBalance = self->_rewardsBalance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rewardsBalance, CFSTR("rewardsBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_monetaryValue, CFSTR("monetaryValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PKPaymentRewardsBalance copyWithZone:](self->_rewardsBalance, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PKCurrencyAmount copyWithZone:](self->_monetaryValue, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_value, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDecimalNumber *value;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPaymentRewardsBalance identifier](self->_rewardsBalance, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("balanceIdentifier"));

  PKPaymentRewardsBalanceTypeToString(-[PKPaymentRewardsBalance type](self->_rewardsBalance, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("rewardsType"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_monetaryValue, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("monetaryValue"));

  -[PKPaymentRewardsBalance monetaryValue](self->_rewardsBalance, "monetaryValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("displayedBalanceAmount"));

  if (-[PKPaymentRewardsBalance isQuantitative](self->_rewardsBalance, "isQuantitative"))
  {
    value = self->_value;
    if (value)
    {
      -[NSDecimalNumber stringValue](value, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("value"));

      -[PKPaymentRewardsBalance value](self->_rewardsBalance, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("displayedBalanceValue"));

    }
  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (BOOL)isEmptyValued
{
  return !self->_monetaryValue && self->_value == 0;
}

- (BOOL)hasFullBalanceSelected
{
  void *v3;
  PKCurrencyAmount *monetaryValue;
  BOOL v5;
  BOOL v6;

  -[PKPaymentRewardsBalance monetaryValue](self->_rewardsBalance, "monetaryValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  monetaryValue = self->_monetaryValue;
  if (monetaryValue)
    v5 = v3 == 0;
  else
    v5 = 1;
  v6 = !v5 && -[PKCurrencyAmount isEqual:](monetaryValue, "isEqual:", v3);

  return v6;
}

- (PKPaymentRewardsBalance)rewardsBalance
{
  return self->_rewardsBalance;
}

- (PKCurrencyAmount)monetaryValue
{
  return self->_monetaryValue;
}

- (NSDecimalNumber)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_monetaryValue, 0);
  objc_storeStrong((id *)&self->_rewardsBalance, 0);
}

@end
