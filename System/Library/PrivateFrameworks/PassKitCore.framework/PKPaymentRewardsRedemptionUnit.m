@implementation PKPaymentRewardsRedemptionUnit

- (PKPaymentRewardsRedemptionUnit)initWithType:(unint64_t)a3 monetaryValue:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  PKPaymentRewardsRedemptionUnit *v10;
  PKPaymentRewardsRedemptionUnit *v11;
  uint64_t v12;
  NSDecimalNumber *value;
  uint64_t v14;
  PKCurrencyAmount *monetaryValue;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentRewardsRedemptionUnit;
  v10 = -[PKPaymentRewardsRedemptionUnit init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v9, "copy");
    value = v11->_value;
    v11->_value = (NSDecimalNumber *)v12;

    v14 = objc_msgSend(v8, "copy");
    monetaryValue = v11->_monetaryValue;
    v11->_monetaryValue = (PKCurrencyAmount *)v14;

  }
  return v11;
}

- (PKPaymentRewardsRedemptionUnit)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentRewardsRedemptionUnit *v5;
  uint64_t v6;
  NSDecimalNumber *value;
  void *v8;
  uint64_t v9;
  PKCurrencyAmount *monetaryValue;
  PKPaymentRewardsRedemptionUnit *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentRewardsRedemptionUnit;
  v5 = -[PKPaymentRewardsRedemptionUnit init](&v13, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("value"));
  v6 = objc_claimAutoreleasedReturnValue();
  value = v5->_value;
  v5->_value = (NSDecimalNumber *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_type = PKPaymentRewardsBalanceTypeFromString(v8);

  objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("monetaryValue"));
  v9 = objc_claimAutoreleasedReturnValue();
  monetaryValue = v5->_monetaryValue;
  v5->_monetaryValue = (PKCurrencyAmount *)v9;

  if (!v5->_monetaryValue)
    goto LABEL_5;
  if (v5->_type)
LABEL_4:
    v11 = v5;
  else
LABEL_5:
    v11 = 0;

  return v11;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKPaymentRewardsBalanceTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  -[NSDecimalNumber stringValue](self->_value, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("value"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_monetaryValue, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("monetaryValue"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentRewardsRedemptionUnit *v4;
  PKPaymentRewardsRedemptionUnit *v5;
  PKPaymentRewardsRedemptionUnit *v6;
  NSDecimalNumber *value;
  NSDecimalNumber *v8;
  BOOL v9;
  PKCurrencyAmount *monetaryValue;
  PKCurrencyAmount *v11;

  v4 = (PKPaymentRewardsRedemptionUnit *)a3;
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
        value = self->_value;
        v8 = v6->_value;
        if (value && v8)
        {
          if ((-[NSDecimalNumber isEqual:](value, "isEqual:") & 1) == 0)
            goto LABEL_16;
        }
        else if (value != v8)
        {
          goto LABEL_16;
        }
        monetaryValue = self->_monetaryValue;
        v11 = v6->_monetaryValue;
        if (monetaryValue && v11)
        {
          if (-[PKCurrencyAmount isEqual:](monetaryValue, "isEqual:"))
          {
LABEL_14:
            v9 = self->_type == v6->_type;
LABEL_17:

            goto LABEL_18;
          }
        }
        else if (monetaryValue == v11)
        {
          goto LABEL_14;
        }
LABEL_16:
        v9 = 0;
        goto LABEL_17;
      }
    }
    v9 = 0;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_value);
  objc_msgSend(v3, "safelyAddObject:", self->_monetaryValue);
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRewardsRedemptionUnit;
  v4 = -[PKPaymentRewardsRedemptionUnit hash](&v8, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);
  v6 = self->_type - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  PKPaymentRewardsBalanceTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);

  -[NSDecimalNumber stringValue](self->_value, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("value: '%@'; "), v5);

  -[PKCurrencyAmount formattedStringValue](self->_monetaryValue, "formattedStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("monetaryValue: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRewardsRedemptionUnit)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRewardsRedemptionUnit *v5;
  uint64_t v6;
  NSDecimalNumber *value;
  uint64_t v8;
  PKCurrencyAmount *monetaryValue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRewardsRedemptionUnit;
  v5 = -[PKPaymentRewardsRedemptionUnit init](&v11, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v6 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("monetaryValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    monetaryValue = v5->_monetaryValue;
    v5->_monetaryValue = (PKCurrencyAmount *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_monetaryValue, CFSTR("monetaryValue"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_type;
  v6 = -[NSDecimalNumber copyWithZone:](self->_value, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[PKCurrencyAmount copyWithZone:](self->_monetaryValue, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDecimalNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKCurrencyAmount)monetaryValue
{
  return self->_monetaryValue;
}

- (void)setMonetaryValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monetaryValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
