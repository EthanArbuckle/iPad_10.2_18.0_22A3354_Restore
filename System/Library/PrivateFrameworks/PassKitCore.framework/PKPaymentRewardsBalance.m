@implementation PKPaymentRewardsBalance

- (PKPaymentRewardsBalance)initWithIdentifier:(id)a3 type:(unint64_t)a4 value:(id)a5 monetaryValue:(id)a6 conversionRate:(id)a7 roundingStrategy:(unint64_t)a8 eligibility:(unint64_t)a9 programName:(id)a10 programURL:(id)a11 lastFetchedAt:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PKPaymentRewardsBalance *v24;
  uint64_t v25;
  NSString *identifier;
  uint64_t v27;
  NSDecimalNumber *value;
  uint64_t v29;
  PKCurrencyAmount *monetaryValue;
  uint64_t v31;
  NSDecimalNumber *conversionRate;
  uint64_t v33;
  NSString *programName;
  uint64_t v35;
  NSURL *programURL;
  uint64_t v37;
  NSDate *lastFetchedAt;
  uint64_t v39;
  NSDate *v40;
  NSString *v41;
  PKPaymentRewardsBalance *v42;
  NSObject *v43;
  NSString *v44;
  id v46;
  objc_super v47;
  uint8_t buf[4];
  NSString *v49;
  __int16 v50;
  NSString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v47.receiver = self;
  v47.super_class = (Class)PKPaymentRewardsBalance;
  v24 = -[PKPaymentRewardsBalance init](&v47, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v46, "copy");
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    v24->_type = a4;
    v27 = objc_msgSend(v18, "copy");
    value = v24->_value;
    v24->_value = (NSDecimalNumber *)v27;

    v29 = objc_msgSend(v19, "copy");
    monetaryValue = v24->_monetaryValue;
    v24->_monetaryValue = (PKCurrencyAmount *)v29;

    v31 = objc_msgSend(v20, "copy");
    conversionRate = v24->_conversionRate;
    v24->_conversionRate = (NSDecimalNumber *)v31;

    v24->_roundingStrategy = a8;
    v24->_eligibility = a9;
    v33 = objc_msgSend(v21, "copy");
    programName = v24->_programName;
    v24->_programName = (NSString *)v33;

    v35 = objc_msgSend(v22, "copy");
    programURL = v24->_programURL;
    v24->_programURL = (NSURL *)v35;

    v37 = objc_msgSend(v23, "copy");
    lastFetchedAt = v24->_lastFetchedAt;
    v24->_lastFetchedAt = (NSDate *)v37;

    if (!v24->_lastFetchedAt)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v24->_lastFetchedAt;
      v24->_lastFetchedAt = (NSDate *)v39;

    }
  }
  v41 = v24->_identifier;
  if (v41 && v24->_monetaryValue && v24->_programName)
  {
    v42 = v24;
  }
  else
  {
    PKLogFacilityTypeGetObject(0x2FuLL);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = v24->_programName;
      *(_DWORD *)buf = 138412546;
      v49 = v41;
      v50 = 2112;
      v51 = v44;
      _os_log_impl(&dword_18FC92000, v43, OS_LOG_TYPE_DEFAULT, "Got Invalid Payment Rewards Balance, with identifier: %@, programName: %@", buf, 0x16u);
    }

    v42 = 0;
  }

  return v42;
}

+ (id)cashbackRewardsBalanceWithIdentifier:(id)a3 monetaryValue:(id)a4 eligibility:(unint64_t)a5 programName:(id)a6 programURL:(id)a7 lastFetchedAt:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:type:value:monetaryValue:conversionRate:roundingStrategy:eligibility:programName:programURL:lastFetchedAt:", v18, 3, 0, v17, 0, 0, a5, v16, v15, v14);

  return v19;
}

- (PKPaymentRewardsBalance)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentRewardsBalance *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSDecimalNumber *value;
  uint64_t v11;
  PKCurrencyAmount *monetaryValue;
  uint64_t v13;
  NSDecimalNumber *conversionRate;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *programName;
  uint64_t v19;
  NSURL *programURL;
  uint64_t v21;
  NSDate *lastFetchedAt;
  NSString *v23;
  PKPaymentRewardsBalance *v24;
  NSObject *v25;
  NSString *v26;
  objc_super v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  NSString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentRewardsBalance;
  v5 = -[PKPaymentRewardsBalance init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("balanceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("rewardsType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPaymentRewardsBalanceTypeFromString(v8);

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("value"));
    v9 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSDecimalNumber *)v9;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("monetaryValue"));
    v11 = objc_claimAutoreleasedReturnValue();
    monetaryValue = v5->_monetaryValue;
    v5->_monetaryValue = (PKCurrencyAmount *)v11;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("conversionRate"));
    v13 = objc_claimAutoreleasedReturnValue();
    conversionRate = v5->_conversionRate;
    v5->_conversionRate = (NSDecimalNumber *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("roundingStrategy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_roundingStrategy = PKPaymentRewardsBalanceRoundingStrategyFromString(v15);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("eligibility"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eligibility = PKPaymentRewardsBalanceEligibilityFromString(v16);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("programName"));
    v17 = objc_claimAutoreleasedReturnValue();
    programName = v5->_programName;
    v5->_programName = (NSString *)v17;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("programURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    programURL = v5->_programURL;
    v5->_programURL = (NSURL *)v19;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v21 = objc_claimAutoreleasedReturnValue();
    lastFetchedAt = v5->_lastFetchedAt;
    v5->_lastFetchedAt = (NSDate *)v21;

  }
  v23 = v5->_identifier;
  if (v23 && v5->_monetaryValue && v5->_programName)
  {
    v24 = v5;
  }
  else
  {
    PKLogFacilityTypeGetObject(0x2FuLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v5->_programName;
      *(_DWORD *)buf = 138412546;
      v30 = v23;
      v31 = 2112;
      v32 = v26;
      _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Got Invalid Payment Rewards Balance, with identifier: %@, programName: %@", buf, 0x16u);
    }

    v24 = 0;
  }

  return v24;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t eligibility;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("balanceIdentifier"));
  PKPaymentRewardsBalanceTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("rewardsType"));

  -[NSDecimalNumber stringValue](self->_value, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("value"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_monetaryValue, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("monetaryValue"));

  -[NSDecimalNumber stringValue](self->_conversionRate, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("conversionRate"));

  PKPaymentRewardsBalanceRoundingStrategyToString(self->_roundingStrategy);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("roundingStrategy"));

  eligibility = self->_eligibility;
  v10 = CFSTR("unknown");
  if (eligibility == 2)
    v10 = CFSTR("ineligible");
  if (eligibility == 1)
    v11 = CFSTR("redeemable");
  else
    v11 = v10;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("eligibility"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_programName, CFSTR("programName"));
  -[NSURL absoluteString](self->_programURL, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("programURL"));

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentRewardsBalance *v4;
  PKPaymentRewardsBalance *v5;
  PKPaymentRewardsBalance *v6;
  NSString *identifier;
  NSString *v8;
  BOOL v9;
  NSDecimalNumber *value;
  NSDecimalNumber *v11;
  PKCurrencyAmount *monetaryValue;
  PKCurrencyAmount *v13;
  NSDecimalNumber *conversionRate;
  NSDecimalNumber *v15;
  NSDate *lastFetchedAt;
  NSDate *v17;
  NSString *programName;
  NSString *v19;
  NSURL *programURL;
  NSURL *v21;

  v4 = (PKPaymentRewardsBalance *)a3;
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
            goto LABEL_44;
        }
        else if (identifier != v8)
        {
          goto LABEL_44;
        }
        value = self->_value;
        v11 = v6->_value;
        if (value && v11)
        {
          if ((-[NSDecimalNumber isEqual:](value, "isEqual:") & 1) == 0)
            goto LABEL_44;
        }
        else if (value != v11)
        {
          goto LABEL_44;
        }
        monetaryValue = self->_monetaryValue;
        v13 = v6->_monetaryValue;
        if (monetaryValue && v13)
        {
          if (!-[PKCurrencyAmount isEqual:](monetaryValue, "isEqual:"))
            goto LABEL_44;
        }
        else if (monetaryValue != v13)
        {
          goto LABEL_44;
        }
        conversionRate = self->_conversionRate;
        v15 = v6->_conversionRate;
        if (conversionRate && v15)
        {
          if ((-[NSDecimalNumber isEqual:](conversionRate, "isEqual:") & 1) == 0)
            goto LABEL_44;
        }
        else if (conversionRate != v15)
        {
          goto LABEL_44;
        }
        lastFetchedAt = self->_lastFetchedAt;
        v17 = v6->_lastFetchedAt;
        if (lastFetchedAt && v17)
        {
          if ((-[NSDate isEqual:](lastFetchedAt, "isEqual:") & 1) == 0)
            goto LABEL_44;
        }
        else if (lastFetchedAt != v17)
        {
          goto LABEL_44;
        }
        programName = self->_programName;
        v19 = v6->_programName;
        if (programName && v19)
        {
          if ((-[NSString isEqual:](programName, "isEqual:") & 1) == 0)
            goto LABEL_44;
        }
        else if (programName != v19)
        {
          goto LABEL_44;
        }
        programURL = self->_programURL;
        v21 = v6->_programURL;
        if (programURL && v21)
        {
          if ((-[NSURL isEqual:](programURL, "isEqual:") & 1) == 0)
            goto LABEL_44;
        }
        else if (programURL != v21)
        {
          goto LABEL_44;
        }
        if (self->_type == v6->_type && self->_roundingStrategy == v6->_roundingStrategy)
        {
          v9 = self->_eligibility == v6->_eligibility;
LABEL_45:

          goto LABEL_46;
        }
LABEL_44:
        v9 = 0;
        goto LABEL_45;
      }
    }
    v9 = 0;
  }
LABEL_46:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  objc_super v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_value);
  objc_msgSend(v3, "safelyAddObject:", self->_monetaryValue);
  objc_msgSend(v3, "safelyAddObject:", self->_conversionRate);
  objc_msgSend(v3, "safelyAddObject:", self->_lastFetchedAt);
  objc_msgSend(v3, "safelyAddObject:", self->_programName);
  objc_msgSend(v3, "safelyAddObject:", self->_programURL);
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentRewardsBalance;
  v4 = -[PKPaymentRewardsBalance hash](&v10, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);
  v6 = self->_type - v5 + 32 * v5;
  v7 = self->_roundingStrategy - v6 + 32 * v6;
  v8 = self->_eligibility - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t eligibility;
  const __CFString *v10;
  const __CFString *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  PKPaymentRewardsBalanceTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);

  -[NSDecimalNumber stringValue](self->_value, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("value: '%@'; "), v5);

  -[PKCurrencyAmount formattedStringValue](self->_monetaryValue, "formattedStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("monetaryValue: '%@'; "), v6);

  -[NSDecimalNumber stringValue](self->_conversionRate, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("conversionRate: '%@'; "), v7);

  PKPaymentRewardsBalanceRoundingStrategyToString(self->_roundingStrategy);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("roundingStrategy: '%@'; "), v8);

  eligibility = self->_eligibility;
  v10 = CFSTR("unknown");
  if (eligibility == 2)
    v10 = CFSTR("ineligible");
  if (eligibility == 1)
    v11 = CFSTR("redeemable");
  else
    v11 = v10;
  objc_msgSend(v3, "appendFormat:", CFSTR("eligibility: '%@'; "), v11);
  objc_msgSend(v3, "appendFormat:", CFSTR("programName: '%@'; "), self->_programName);
  objc_msgSend(v3, "appendFormat:", CFSTR("programUrl: '%@'; "), self->_programURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastFetchedAt: '%@'; "), self->_lastFetchedAt);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRewardsBalance)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRewardsBalance *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDecimalNumber *value;
  uint64_t v10;
  PKCurrencyAmount *monetaryValue;
  uint64_t v12;
  NSDecimalNumber *conversionRate;
  uint64_t v14;
  NSDate *lastFetchedAt;
  uint64_t v16;
  NSString *programName;
  uint64_t v18;
  NSURL *programURL;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentRewardsBalance;
  v5 = -[PKPaymentRewardsBalance init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balanceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rewardsType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("monetaryValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    monetaryValue = v5->_monetaryValue;
    v5->_monetaryValue = (PKCurrencyAmount *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversionRate"));
    v12 = objc_claimAutoreleasedReturnValue();
    conversionRate = v5->_conversionRate;
    v5->_conversionRate = (NSDecimalNumber *)v12;

    v5->_roundingStrategy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("roundingStrategy"));
    v5->_eligibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eligibility"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFetchedAt"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastFetchedAt = v5->_lastFetchedAt;
    v5->_lastFetchedAt = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("programName"));
    v16 = objc_claimAutoreleasedReturnValue();
    programName = v5->_programName;
    v5->_programName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("programURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    programURL = v5->_programURL;
    v5->_programURL = (NSURL *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("balanceIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("rewardsType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_monetaryValue, CFSTR("monetaryValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conversionRate, CFSTR("conversionRate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_roundingStrategy, CFSTR("roundingStrategy"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eligibility, CFSTR("eligibility"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastFetchedAt, CFSTR("lastFetchedAt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_programName, CFSTR("programName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_programURL, CFSTR("programURL"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_type;
  v8 = -[NSDecimalNumber copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[PKCurrencyAmount copyWithZone:](self->_monetaryValue, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_conversionRate, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v5[6] = self->_roundingStrategy;
  v5[7] = self->_eligibility;
  v14 = -[NSDate copyWithZone:](self->_lastFetchedAt, "copyWithZone:", a3);
  v15 = (void *)v5[10];
  v5[10] = v14;

  v16 = -[NSString copyWithZone:](self->_programName, "copyWithZone:", a3);
  v17 = (void *)v5[8];
  v5[8] = v16;

  v18 = -[NSURL copyWithZone:](self->_programURL, "copyWithZone:", a3);
  v19 = (void *)v5[9];
  v5[9] = v18;

  return v5;
}

- (BOOL)isValid
{
  unint64_t type;

  if (!self->_identifier || !self->_programName)
    return 0;
  type = self->_type;
  if (type != 3)
    return type - 1 > 1 || self->_value && self->_monetaryValue && self->_conversionRate;
  return self->_monetaryValue != 0;
}

- (BOOL)isQuantitative
{
  return self->_type - 1 < 2;
}

- (BOOL)isFresh
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PKPaymentRewardsBalance isFreshForNow:](self, "isFreshForNow:", v3);

  return (char)self;
}

- (BOOL)isFreshForNow:(id)a3
{
  NSDate *lastFetchedAt;

  lastFetchedAt = self->_lastFetchedAt;
  if (lastFetchedAt)
    LOBYTE(lastFetchedAt) = (unint64_t)PKDateRangeNumberOfIntervalsForUnit(lastFetchedAt, a3, 64) < 6;
  return (char)lastFetchedAt;
}

- (BOOL)isRedeemable
{
  return self->_eligibility == 1;
}

- (id)formattedQuantityValue
{
  id v3;
  void *v4;

  if (self->_value && self->_type - 1 <= 1)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v3, "setNumberStyle:", 1);
    objc_msgSend(v3, "setUsesGroupingSeparator:", 1);
    objc_msgSend(v3, "stringFromNumber:", self->_value);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)formattedMonetaryValue
{
  return -[PKCurrencyAmount formattedStringValue](self->_monetaryValue, "formattedStringValue");
}

- (id)convertValueFromAmount:(id)a3
{
  id v4;
  NSDecimalNumber *v5;
  int v6;
  id v7;
  NSDecimalNumber *conversionRate;
  void *v9;
  void *v10;

  v4 = a3;
  if (self->_type == 3 || (v5 = self->_conversionRate) == 0)
  {
    v7 = 0;
  }
  else
  {
    v6 = -[NSDecimalNumber pk_isPositiveNumber](v5, "pk_isPositiveNumber");
    v7 = 0;
    if (v4 && v6)
    {
      conversionRate = self->_conversionRate;
      -[PKPaymentRewardsBalance _nsDecimalRoundingBehavior](self, "_nsDecimalRoundingBehavior");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decimalNumberByDividingBy:withBehavior:", conversionRate, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && (objc_msgSend(v10, "pk_isNotANumber") & 1) == 0)
        v7 = v10;
      else
        v7 = 0;

    }
  }

  return v7;
}

- (id)convertAmountFromValue:(id)a3
{
  id v4;
  NSDecimalNumber *conversionRate;
  int v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (self->_type == 3 || (conversionRate = self->_conversionRate) == 0)
  {
    v7 = 0;
  }
  else
  {
    v6 = -[NSDecimalNumber pk_isPositiveNumber](conversionRate, "pk_isPositiveNumber");
    v7 = 0;
    if (v4 && v6)
    {
      objc_msgSend(v4, "decimalNumberByMultiplyingBy:", self->_conversionRate);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && (objc_msgSend(v8, "pk_isNotANumber") & 1) == 0)
        v7 = v9;
      else
        v7 = 0;

    }
  }

  return v7;
}

- (id)convertValueFromMonetaryValue:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKPaymentRewardsBalance convertValueFromAmount:](self, "convertValueFromAmount:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)convertMonetaryValueFromValue:(id)a3
{
  id v4;
  NSString *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber *v7;
  void *v8;

  v4 = a3;
  -[PKCurrencyAmount currency](self->_monetaryValue, "currency");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PKPaymentRewardsBalance convertAmountFromValue:](self, "convertAmountFromValue:", v4);
    v6 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      PKCurrencyAmountCreate(v6, v5, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_nsDecimalRoundingBehavior
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", -[PKPaymentRewardsBalance _nsDecimalRoundingMode](self, "_nsDecimalRoundingMode"), 0, 0, 0, 0, 0);
}

- (unint64_t)_nsDecimalRoundingMode
{
  if (self->_roundingStrategy - 1 >= 3)
    return 0;
  else
    return self->_roundingStrategy;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKCurrencyAmount)monetaryValue
{
  return self->_monetaryValue;
}

- (void)setMonetaryValue:(id)a3
{
  objc_storeStrong((id *)&self->_monetaryValue, a3);
}

- (NSDecimalNumber)conversionRate
{
  return self->_conversionRate;
}

- (void)setConversionRate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)roundingStrategy
{
  return self->_roundingStrategy;
}

- (void)setRoundingStrategy:(unint64_t)a3
{
  self->_roundingStrategy = a3;
}

- (unint64_t)eligibility
{
  return self->_eligibility;
}

- (void)setEligibility:(unint64_t)a3
{
  self->_eligibility = a3;
}

- (NSString)programName
{
  return self->_programName;
}

- (void)setProgramName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)programURL
{
  return self->_programURL;
}

- (void)setProgramURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)lastFetchedAt
{
  return self->_lastFetchedAt;
}

- (void)setLastFetchedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchedAt, 0);
  objc_storeStrong((id *)&self->_programURL, 0);
  objc_storeStrong((id *)&self->_programName, 0);
  objc_storeStrong((id *)&self->_conversionRate, 0);
  objc_storeStrong((id *)&self->_monetaryValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
