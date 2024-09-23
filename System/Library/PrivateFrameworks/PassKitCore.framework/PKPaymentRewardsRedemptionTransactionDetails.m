@implementation PKPaymentRewardsRedemptionTransactionDetails

- (PKPaymentRewardsRedemptionTransactionDetails)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentRewardsRedemptionTransactionDetails *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *timestamp;
  uint64_t v10;
  NSString *descriptionText;
  uint64_t v12;
  PKCurrencyAmount *monetaryValue;
  uint64_t v14;
  NSNumber *merchantCategoryCode;
  uint64_t v16;
  NSString *merchantRawName;
  PKPaymentRewardsRedemptionTransactionDetails *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentRewardsRedemptionTransactionDetails;
  v5 = -[PKPaymentRewardsRedemptionTransactionDetails init](&v20, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  objc_msgSend(v4, "PKDateForKey:", CFSTR("timestamp"));
  v8 = objc_claimAutoreleasedReturnValue();
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v8;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("description"));
  v10 = objc_claimAutoreleasedReturnValue();
  descriptionText = v5->_descriptionText;
  v5->_descriptionText = (NSString *)v10;

  objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("monetaryValue"));
  v12 = objc_claimAutoreleasedReturnValue();
  monetaryValue = v5->_monetaryValue;
  v5->_monetaryValue = (PKCurrencyAmount *)v12;

  objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("merchantCategoryCode"));
  v14 = objc_claimAutoreleasedReturnValue();
  merchantCategoryCode = v5->_merchantCategoryCode;
  v5->_merchantCategoryCode = (NSNumber *)v14;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantRawName"));
  v16 = objc_claimAutoreleasedReturnValue();
  merchantRawName = v5->_merchantRawName;
  v5->_merchantRawName = (NSString *)v16;

  if (!v5->_identifier)
    goto LABEL_6;
  if (v5->_merchantRawName && v5->_monetaryValue)
LABEL_5:
    v18 = v5;
  else
LABEL_6:
    v18 = 0;

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  PKW3CDateStringFromDate(self->_timestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("timestamp"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_descriptionText, CFSTR("description"));
  -[PKCurrencyAmount dictionaryRepresentation](self->_monetaryValue, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("monetaryValue"));

  -[NSNumber stringValue](self->_merchantCategoryCode, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("merchantCategoryCode"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_merchantRawName, CFSTR("merchantRawName"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentRewardsRedemptionTransactionDetails *v4;
  PKPaymentRewardsRedemptionTransactionDetails *v5;
  PKPaymentRewardsRedemptionTransactionDetails *v6;
  NSString *identifier;
  NSString *v8;
  char v9;
  NSDate *timestamp;
  NSDate *v11;
  NSString *descriptionText;
  NSString *v13;
  PKCurrencyAmount *monetaryValue;
  PKCurrencyAmount *v15;
  NSNumber *merchantCategoryCode;
  NSNumber *v17;
  NSString *merchantRawName;
  NSString *v19;

  v4 = (PKPaymentRewardsRedemptionTransactionDetails *)a3;
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
        identifier = self->_identifier;
        v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
            goto LABEL_33;
        }
        else if (identifier != v8)
        {
          goto LABEL_33;
        }
        timestamp = self->_timestamp;
        v11 = v6->_timestamp;
        if (timestamp && v11)
        {
          if ((-[NSDate isEqual:](timestamp, "isEqual:") & 1) == 0)
            goto LABEL_33;
        }
        else if (timestamp != v11)
        {
          goto LABEL_33;
        }
        descriptionText = self->_descriptionText;
        v13 = v6->_descriptionText;
        if (descriptionText && v13)
        {
          if ((-[NSString isEqual:](descriptionText, "isEqual:") & 1) == 0)
            goto LABEL_33;
        }
        else if (descriptionText != v13)
        {
          goto LABEL_33;
        }
        monetaryValue = self->_monetaryValue;
        v15 = v6->_monetaryValue;
        if (monetaryValue && v15)
        {
          if (!-[PKCurrencyAmount isEqual:](monetaryValue, "isEqual:"))
            goto LABEL_33;
        }
        else if (monetaryValue != v15)
        {
          goto LABEL_33;
        }
        merchantCategoryCode = self->_merchantCategoryCode;
        v17 = v6->_merchantCategoryCode;
        if (merchantCategoryCode && v17)
        {
          if ((-[NSNumber isEqual:](merchantCategoryCode, "isEqual:") & 1) != 0)
          {
LABEL_29:
            merchantRawName = self->_merchantRawName;
            v19 = v6->_merchantRawName;
            if (merchantRawName && v19)
              v9 = -[NSString isEqual:](merchantRawName, "isEqual:");
            else
              v9 = merchantRawName == v19;
            goto LABEL_34;
          }
        }
        else if (merchantCategoryCode == v17)
        {
          goto LABEL_29;
        }
LABEL_33:
        v9 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v9 = 0;
  }
LABEL_35:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_timestamp);
  objc_msgSend(v3, "safelyAddObject:", self->_descriptionText);
  objc_msgSend(v3, "safelyAddObject:", self->_monetaryValue);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantCategoryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantRawName);
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentRewardsRedemptionTransactionDetails;
  v4 = -[PKPaymentRewardsRedemptionTransactionDetails hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("timestamp: '%@'; "), self->_timestamp);
  objc_msgSend(v3, "appendFormat:", CFSTR("description: '%@'; "), self->_descriptionText);
  objc_msgSend(v3, "appendFormat:", CFSTR("monetaryValue: '%@'; "), self->_monetaryValue);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCategoryCode: '%@'; "), self->_merchantCategoryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantRawName: '%@'; "), self->_merchantRawName);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRewardsRedemptionTransactionDetails)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRewardsRedemptionTransactionDetails *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *timestamp;
  uint64_t v10;
  NSString *descriptionText;
  uint64_t v12;
  PKCurrencyAmount *monetaryValue;
  uint64_t v14;
  NSNumber *merchantCategoryCode;
  uint64_t v16;
  NSString *merchantRawName;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRewardsRedemptionTransactionDetails;
  v5 = -[PKPaymentRewardsRedemptionTransactionDetails init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
    v10 = objc_claimAutoreleasedReturnValue();
    descriptionText = v5->_descriptionText;
    v5->_descriptionText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("monetaryValue"));
    v12 = objc_claimAutoreleasedReturnValue();
    monetaryValue = v5->_monetaryValue;
    v5->_monetaryValue = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantCategoryCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    merchantCategoryCode = v5->_merchantCategoryCode;
    v5->_merchantCategoryCode = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantRawName"));
    v16 = objc_claimAutoreleasedReturnValue();
    merchantRawName = v5->_merchantRawName;
    v5->_merchantRawName = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptionText, CFSTR("description"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_monetaryValue, CFSTR("monetaryValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantCategoryCode, CFSTR("merchantCategoryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantRawName, CFSTR("merchantRawName"));

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
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDate copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_descriptionText, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[PKCurrencyAmount copyWithZone:](self->_monetaryValue, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSNumber copyWithZone:](self->_merchantCategoryCode, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSString copyWithZone:](self->_merchantRawName, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
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

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void)setMerchantCategoryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)merchantRawName
{
  return self->_merchantRawName;
}

- (void)setMerchantRawName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantRawName, 0);
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_monetaryValue, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
