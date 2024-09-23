@implementation PKPaymentTransactionRewardsItem

- (PKPaymentTransactionRewardsItem)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentTransactionRewardsItem *v5;
  PKPaymentTransactionRewardsItem *v6;
  PKPaymentTransactionRewardsItem *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKPaymentTransactionRewardsItem;
    v5 = -[PKPaymentTransactionRewardsItem init](&v9, sel_init);
    v6 = v5;
    if (v5)
      -[PKPaymentTransactionRewardsItem _initWithRewardsDictionary:](v5, "_initWithRewardsDictionary:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_initWithRewardsDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *identifier;
  void *v7;
  void *v8;
  void *v9;
  NSDecimalNumber *v10;
  NSDecimalNumber *eligibleValue;
  NSString *v12;
  NSString *promotionName;
  NSString *v14;
  NSString *promotionIdentifier;
  NSString *v16;
  NSString *programIdentifier;
  void *v18;
  void *v19;
  char v20;
  PKCurrencyAmount *v21;
  PKCurrencyAmount *currencyAmount;
  id v23;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "objectForKey:", CFSTR("category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_type = PKPaymentTransactionRewardsItemTypeFromString(v7);

  objc_msgSend(v4, "objectForKey:", CFSTR("state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_state = PKPaymentTransactionRewardsItemStateFromString(v8);

  objc_msgSend(v4, "objectForKey:", CFSTR("eligibleValueUnit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_eligibleValueUnit = PKPaymentTransactionRewardsItemValueUnitFromString(v9);

  objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("eligibleValue"));
  v10 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  eligibleValue = self->_eligibleValue;
  self->_eligibleValue = v10;

  objc_msgSend(v4, "objectForKey:", CFSTR("promotionName"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  promotionName = self->_promotionName;
  self->_promotionName = v12;

  objc_msgSend(v4, "objectForKey:", CFSTR("promotionIdentifier"));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  promotionIdentifier = self->_promotionIdentifier;
  self->_promotionIdentifier = v14;

  objc_msgSend(v4, "objectForKey:", CFSTR("programId"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  programIdentifier = self->_programIdentifier;
  self->_programIdentifier = v16;

  objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("currencyCode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v23, "isEqualToNumber:", v19);

    if ((v20 & 1) == 0)
    {
      if (v18)
      {
        v21 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v23, v18, 0);
        currencyAmount = self->_currencyAmount;
        self->_currencyAmount = v21;

      }
    }
  }

}

- (id)jsonDictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  PKCurrencyAmount *currencyAmount;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  const __CFString *v13;
  NSDecimalNumber *eligibleValue;
  void *v15;
  unint64_t eligibleValueUnit;
  const __CFString *v17;
  const __CFString *v18;
  NSString *promotionName;
  NSString *promotionIdentifier;
  NSString *programIdentifier;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  currencyAmount = self->_currencyAmount;
  if (currencyAmount)
  {
    -[PKCurrencyAmount currency](currencyAmount, "currency");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("currencyCode"));
    if (v8)
    {
      objc_msgSend(v8, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("amount"));

    }
  }
  v10 = self->_type - 1;
  if (v10 > 5)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E2AC3850[v10];
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("category"));
  v12 = self->_state - 1;
  v13 = CFSTR("unknown");
  if (v12 <= 3)
    v13 = off_1E2AC3880[v12];
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("state"));
  eligibleValue = self->_eligibleValue;
  if (eligibleValue)
  {
    -[NSDecimalNumber stringValue](eligibleValue, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("eligibleValue"));

  }
  eligibleValueUnit = self->_eligibleValueUnit;
  v17 = CFSTR("cash");
  if (eligibleValueUnit != 2)
    v17 = CFSTR("unknown");
  if (eligibleValueUnit == 1)
    v18 = CFSTR("percent");
  else
    v18 = v17;
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("eligibleValueUnit"));
  promotionName = self->_promotionName;
  if (promotionName)
    objc_msgSend(v4, "setObject:forKey:", promotionName, CFSTR("promotionName"));
  promotionIdentifier = self->_promotionIdentifier;
  if (promotionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", promotionIdentifier, CFSTR("promotionIdentifier"));
  programIdentifier = self->_programIdentifier;
  if (programIdentifier)
    objc_msgSend(v4, "setObject:forKey:", programIdentifier, CFSTR("programId"));
  v22 = (void *)objc_msgSend(v4, "copy");

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionRewardsItem)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionRewardsItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  PKCurrencyAmount *currencyAmount;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDecimalNumber *eligibleValue;
  uint64_t v15;
  NSString *promotionName;
  uint64_t v17;
  NSString *promotionIdentifier;
  uint64_t v19;
  NSString *programIdentifier;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentTransactionRewardsItem;
  v5 = -[PKPaymentTransactionRewardsItem init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPaymentTransactionRewardsItemTypeFromString(v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = PKPaymentTransactionRewardsItemStateFromString(v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eligibleValueUnit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eligibleValueUnit = PKPaymentTransactionRewardsItemValueUnitFromString(v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eligibleValue"));
    v13 = objc_claimAutoreleasedReturnValue();
    eligibleValue = v5->_eligibleValue;
    v5->_eligibleValue = (NSDecimalNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promotionName"));
    v15 = objc_claimAutoreleasedReturnValue();
    promotionName = v5->_promotionName;
    v5->_promotionName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promotionIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    promotionIdentifier = v5->_promotionIdentifier;
    v5->_promotionIdentifier = (NSString *)v17;

    v5->_hasEnhancedMerchantProgramIdentifier = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasEnhancedMerchantProgramIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("programId"));
    v19 = objc_claimAutoreleasedReturnValue();
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t eligibleValueUnit;
  const __CFString *v9;
  const __CFString *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_currencyAmount, CFSTR("currencyAmount"));
  v4 = self->_type - 1;
  if (v4 > 5)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AC3850[v4];
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("category"));
  v6 = self->_state - 1;
  v7 = CFSTR("unknown");
  if (v6 <= 3)
    v7 = off_1E2AC3880[v6];
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("state"));
  eligibleValueUnit = self->_eligibleValueUnit;
  v9 = CFSTR("cash");
  if (eligibleValueUnit != 2)
    v9 = CFSTR("unknown");
  if (eligibleValueUnit == 1)
    v10 = CFSTR("percent");
  else
    v10 = v9;
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("eligibleValueUnit"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_eligibleValue, CFSTR("eligibleValue"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_promotionName, CFSTR("promotionName"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_promotionIdentifier, CFSTR("promotionIdentifier"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_hasEnhancedMerchantProgramIdentifier, CFSTR("hasEnhancedMerchantProgramIdentifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_programIdentifier, CFSTR("programId"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[PKCurrencyAmount copyWithZone:](self->_currencyAmount, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  *(_QWORD *)(v5 + 24) = self->_type;
  *(_QWORD *)(v5 + 32) = self->_state;
  *(_QWORD *)(v5 + 56) = self->_eligibleValueUnit;
  v10 = -[NSDecimalNumber copyWithZone:](self->_eligibleValue, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_promotionName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[NSString copyWithZone:](self->_promotionIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  *(_BYTE *)(v5 + 8) = self->_hasEnhancedMerchantProgramIdentifier;
  v16 = -[NSString copyWithZone:](self->_programIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v16;

  return (id)v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_eligibleValue);
  objc_msgSend(v3, "safelyAddObject:", self->_promotionName);
  objc_msgSend(v3, "safelyAddObject:", self->_promotionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_programIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_state - v5 + 32 * v5;
  v7 = self->_eligibleValueUnit - v6 + 32 * v6;
  v8 = self->_hasEnhancedMerchantProgramIdentifier - v7 + 32 * v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionRewardsItem *v4;
  PKPaymentTransactionRewardsItem *v5;
  BOOL v6;

  v4 = (PKPaymentTransactionRewardsItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransactionRewardsItem isEqualToRewardsItem:](self, "isEqualToRewardsItem:", v5);

  return v6;
}

- (BOOL)isEqualToRewardsItem:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  char v8;
  PKCurrencyAmount *currencyAmount;
  PKCurrencyAmount *v10;
  NSDecimalNumber *eligibleValue;
  NSDecimalNumber *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  _BOOL4 v17;
  void *v18;
  NSString *v19;
  _BOOL4 v20;
  void *v21;
  NSString *v22;
  _BOOL4 v23;
  BOOL v24;

  v4 = a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_38;
  }
  else
  {
    v8 = -[NSString isEqual:](identifier, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_38;
  }
  currencyAmount = self->_currencyAmount;
  v10 = (PKCurrencyAmount *)v4[5];
  if (currencyAmount && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
      goto LABEL_38;
  }
  else if (currencyAmount != v10)
  {
    goto LABEL_38;
  }
  eligibleValue = self->_eligibleValue;
  v12 = (NSDecimalNumber *)v4[6];
  if (eligibleValue && v12)
  {
    if ((-[NSDecimalNumber isEqual:](eligibleValue, "isEqual:") & 1) == 0)
      goto LABEL_38;
  }
  else if (eligibleValue != v12)
  {
    goto LABEL_38;
  }
  v13 = (void *)v4[8];
  v14 = self->_promotionName;
  v15 = v13;
  if (v14 == v15)
  {

  }
  else
  {
    v16 = v15;
    if (!v14 || !v15)
      goto LABEL_37;
    v17 = -[NSString isEqualToString:](v14, "isEqualToString:", v15);

    if (!v17)
      goto LABEL_38;
  }
  v18 = (void *)v4[9];
  v14 = self->_promotionIdentifier;
  v19 = v18;
  if (v14 == v19)
  {

  }
  else
  {
    v16 = v19;
    if (!v14 || !v19)
      goto LABEL_37;
    v20 = -[NSString isEqualToString:](v14, "isEqualToString:", v19);

    if (!v20)
      goto LABEL_38;
  }
  if (self->_hasEnhancedMerchantProgramIdentifier != *((unsigned __int8 *)v4 + 8))
    goto LABEL_38;
  v21 = (void *)v4[10];
  v14 = self->_programIdentifier;
  v22 = v21;
  if (v14 != v22)
  {
    v16 = v22;
    if (v14 && v22)
    {
      v23 = -[NSString isEqualToString:](v14, "isEqualToString:", v22);

      if (!v23)
        goto LABEL_38;
      goto LABEL_41;
    }
LABEL_37:

    goto LABEL_38;
  }

LABEL_41:
  if (self->_type == v4[3] && self->_state == v4[4])
  {
    v24 = self->_eligibleValueUnit == v4[7];
    goto LABEL_39;
  }
LABEL_38:
  v24 = 0;
LABEL_39:

  return v24;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t eligibleValueUnit;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  v4 = self->_type - 1;
  if (v4 > 5)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AC3850[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);
  v6 = self->_state - 1;
  v7 = CFSTR("unknown");
  if (v6 <= 3)
    v7 = off_1E2AC3880[v6];
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyAmount: '%@'; "), self->_currencyAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("eligible value: '%@'; "), self->_eligibleValue);
  eligibleValueUnit = self->_eligibleValueUnit;
  v9 = CFSTR("cash");
  if (eligibleValueUnit != 2)
    v9 = CFSTR("unknown");
  if (eligibleValueUnit == 1)
    v10 = CFSTR("percent");
  else
    v10 = v9;
  objc_msgSend(v3, "appendFormat:", CFSTR("eligible value unit: '%@'; "), v10);
  objc_msgSend(v3, "appendFormat:", CFSTR("promotion name: '%@'; "), self->_promotionName);
  objc_msgSend(v3, "appendFormat:", CFSTR("promotion identifier: '%@'; "), self->_promotionIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("program identifier: '%@'; "), self->_programIdentifier);
  if (self->_hasEnhancedMerchantProgramIdentifier)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("has enhanced merchant program id: '%@'; "), v11);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (NSDecimalNumber)eligibleValue
{
  return self->_eligibleValue;
}

- (void)setEligibleValue:(id)a3
{
  objc_storeStrong((id *)&self->_eligibleValue, a3);
}

- (unint64_t)eligibleValueUnit
{
  return self->_eligibleValueUnit;
}

- (void)setEligibleValueUnit:(unint64_t)a3
{
  self->_eligibleValueUnit = a3;
}

- (NSString)promotionName
{
  return self->_promotionName;
}

- (void)setPromotionName:(id)a3
{
  objc_storeStrong((id *)&self->_promotionName, a3);
}

- (NSString)promotionIdentifier
{
  return self->_promotionIdentifier;
}

- (void)setPromotionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_promotionIdentifier, a3);
}

- (NSString)programIdentifier
{
  return self->_programIdentifier;
}

- (void)setProgramIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_programIdentifier, a3);
}

- (BOOL)hasEnhancedMerchantProgramIdentifier
{
  return self->_hasEnhancedMerchantProgramIdentifier;
}

- (void)setHasEnhancedMerchantProgramIdentifier:(BOOL)a3
{
  self->_hasEnhancedMerchantProgramIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programIdentifier, 0);
  objc_storeStrong((id *)&self->_promotionIdentifier, 0);
  objc_storeStrong((id *)&self->_promotionName, 0);
  objc_storeStrong((id *)&self->_eligibleValue, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
