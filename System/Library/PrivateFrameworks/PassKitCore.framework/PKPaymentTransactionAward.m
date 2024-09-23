@implementation PKPaymentTransactionAward

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentTransactionAward *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *typeString;
  uint64_t v10;
  NSString *subtype;
  uint64_t v12;
  NSString *awardDescription;
  PKTransactionAmount *v14;
  PKTransactionAmount *amount;
  uint64_t v16;
  NSString *localizedAmount;
  uint64_t v18;
  NSString *relevantAccountName;
  uint64_t v20;
  NSDate *claimExpiryDate;
  uint64_t v22;
  NSDate *redeemExpiryDate;

  v5 = -[PKPaymentTransactionAward init](+[PKPaymentTransactionAward allocWithZone:](PKPaymentTransactionAward, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_typeString, "copyWithZone:", a3);
  typeString = v5->_typeString;
  v5->_typeString = (NSString *)v8;

  v5->_type = self->_type;
  v10 = -[NSString copyWithZone:](self->_subtype, "copyWithZone:", a3);
  subtype = v5->_subtype;
  v5->_subtype = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_awardDescription, "copyWithZone:", a3);
  awardDescription = v5->_awardDescription;
  v5->_awardDescription = (NSString *)v12;

  v5->_order = self->_order;
  v14 = -[PKTransactionAmount copyWithZone:](self->_amount, "copyWithZone:", a3);
  amount = v5->_amount;
  v5->_amount = v14;

  v16 = -[NSString copyWithZone:](self->_localizedAmount, "copyWithZone:", a3);
  localizedAmount = v5->_localizedAmount;
  v5->_localizedAmount = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_relevantAccountName, "copyWithZone:", a3);
  relevantAccountName = v5->_relevantAccountName;
  v5->_relevantAccountName = (NSString *)v18;

  v5->_hasDeepLink = self->_hasDeepLink;
  v20 = -[NSDate copyWithZone:](self->_claimExpiryDate, "copyWithZone:", a3);
  claimExpiryDate = v5->_claimExpiryDate;
  v5->_claimExpiryDate = (NSDate *)v20;

  v5->_claimExpired = self->_claimExpired;
  v22 = -[NSDate copyWithZone:](self->_redeemExpiryDate, "copyWithZone:", a3);
  redeemExpiryDate = v5->_redeemExpiryDate;
  v5->_redeemExpiryDate = (NSDate *)v22;

  v5->_redeemExpired = self->_redeemExpired;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("awardIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typeString, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtype, CFSTR("subtype"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_awardDescription, CFSTR("description"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_order, CFSTR("order"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedAmount, CFSTR("localizedAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevantAccountName, CFSTR("relevantAccountName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasDeepLink, CFSTR("hasDeepLink"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_claimExpiryDate, CFSTR("claimExpiryDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_claimExpired, CFSTR("claimExpired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_redeemExpiryDate, CFSTR("redeemExpiryDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_redeemExpired, CFSTR("redeemExpired"));

}

- (PKPaymentTransactionAward)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionAward *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *typeString;
  uint64_t v10;
  NSString *subtype;
  uint64_t v12;
  NSString *awardDescription;
  uint64_t v14;
  PKTransactionAmount *amount;
  uint64_t v16;
  NSString *localizedAmount;
  uint64_t v18;
  NSString *relevantAccountName;
  uint64_t v20;
  NSDate *claimExpiryDate;
  uint64_t v22;
  NSDate *redeemExpiryDate;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentTransactionAward;
  v5 = -[PKPaymentTransactionAward init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("awardIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    typeString = v5->_typeString;
    v5->_typeString = (NSString *)v8;

    v5->_type = PKPaymentTransactionAwardTypeFromString(v5->_typeString);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtype"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtype = v5->_subtype;
    v5->_subtype = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
    v12 = objc_claimAutoreleasedReturnValue();
    awardDescription = v5->_awardDescription;
    v5->_awardDescription = (NSString *)v12;

    v5->_order = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("order"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v14 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKTransactionAmount *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedAmount"));
    v16 = objc_claimAutoreleasedReturnValue();
    localizedAmount = v5->_localizedAmount;
    v5->_localizedAmount = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevantAccountName"));
    v18 = objc_claimAutoreleasedReturnValue();
    relevantAccountName = v5->_relevantAccountName;
    v5->_relevantAccountName = (NSString *)v18;

    v5->_hasDeepLink = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasDeepLink"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("claimExpiryDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    claimExpiryDate = v5->_claimExpiryDate;
    v5->_claimExpiryDate = (NSDate *)v20;

    v5->_claimExpired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("claimExpired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redeemExpiryDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    redeemExpiryDate = v5->_redeemExpiryDate;
    v5->_redeemExpiryDate = (NSDate *)v22;

    v5->_redeemExpired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("redeemExpired"));
  }

  return v5;
}

- (PKPaymentTransactionAward)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentTransactionAward *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *typeString;
  uint64_t v10;
  NSString *subtype;
  uint64_t v12;
  NSString *awardDescription;
  void *v14;
  PKTransactionAmount *v15;
  PKTransactionAmount *amount;
  uint64_t v17;
  NSString *localizedAmount;
  uint64_t v19;
  NSString *relevantAccountName;
  uint64_t v21;
  NSDate *claimExpiryDate;
  uint64_t v23;
  NSDate *redeemExpiryDate;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentTransactionAward;
  v5 = -[PKPaymentTransactionAward init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("awardIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    typeString = v5->_typeString;
    v5->_typeString = (NSString *)v8;

    v5->_type = PKPaymentTransactionAwardTypeFromString(v5->_typeString);
    objc_msgSend(v4, "PKStringForKey:", CFSTR("subtype"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtype = v5->_subtype;
    v5->_subtype = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("description"));
    v12 = objc_claimAutoreleasedReturnValue();
    awardDescription = v5->_awardDescription;
    v5->_awardDescription = (NSString *)v12;

    v5->_order = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("amount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKTransactionAmount initWithDictionary:]([PKTransactionAmount alloc], "initWithDictionary:", v14);
    amount = v5->_amount;
    v5->_amount = v15;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedAmount"));
    v17 = objc_claimAutoreleasedReturnValue();
    localizedAmount = v5->_localizedAmount;
    v5->_localizedAmount = (NSString *)v17;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("relevantAccountName"));
    v19 = objc_claimAutoreleasedReturnValue();
    relevantAccountName = v5->_relevantAccountName;
    v5->_relevantAccountName = (NSString *)v19;

    v5->_hasDeepLink = objc_msgSend(v4, "PKBoolForKey:", CFSTR("hasDeepLink"));
    objc_msgSend(v4, "PKDateForKey:", CFSTR("claimExpiryDate"));
    v21 = objc_claimAutoreleasedReturnValue();
    claimExpiryDate = v5->_claimExpiryDate;
    v5->_claimExpiryDate = (NSDate *)v21;

    v5->_claimExpired = objc_msgSend(v4, "PKBoolForKey:", CFSTR("claimExpired"));
    objc_msgSend(v4, "PKDateForKey:", CFSTR("redeemExpiryDate"));
    v23 = objc_claimAutoreleasedReturnValue();
    redeemExpiryDate = v5->_redeemExpiryDate;
    v5->_redeemExpiryDate = (NSDate *)v23;

    v5->_redeemExpired = objc_msgSend(v4, "PKBoolForKey:", CFSTR("redeemExpired"));
  }

  return v5;
}

- (id)formattedStringValue
{
  NSString *v3;
  PKTransactionAmount *amount;
  NSString *awardDescription;
  void *v6;
  void *v7;
  void *v8;

  if (self->_type != 1 && -[NSString length](self->_localizedAmount, "length"))
  {
    PKLocalizedAquamanString(CFSTR("TRANSACTION_DETAIL_AWARD_DESCRIPTION_FORMAT"), CFSTR("%1$@%2$@"), self->_awardDescription, self->_localizedAmount);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v8 = v3;
    return v8;
  }
  amount = self->_amount;
  awardDescription = self->_awardDescription;
  if (!amount)
  {
    v3 = awardDescription;
    goto LABEL_7;
  }
  -[PKTransactionAmount amount](amount, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formattedStringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedAquamanString(CFSTR("TRANSACTION_DETAIL_AWARD_DESCRIPTION_FORMAT"), CFSTR("%1$@%2$@"), awardDescription, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setTypeString:(id)a3
{
  id v5;
  int64_t v6;

  objc_storeStrong((id *)&self->_typeString, a3);
  v5 = a3;
  v6 = PKPaymentTransactionAwardTypeFromString(self->_typeString);

  self->_type = v6;
}

- (void)setType:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("unknown");
  if (a3 == 2)
    v3 = CFSTR("nonMonetary");
  if (a3 == 1)
    v4 = CFSTR("monetary");
  else
    v4 = v3;
  -[PKPaymentTransactionAward setTypeString:](self, "setTypeString:", v4);
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
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("awardIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_typeString, CFSTR("type"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_subtype, CFSTR("subtype"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_awardDescription, CFSTR("description"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_order);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("order"));

  -[PKTransactionAmount dictionaryRepresentation](self->_amount, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("amount"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localizedAmount, CFSTR("localizedAmount"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_relevantAccountName, CFSTR("relevantAccountName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasDeepLink);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hasDeepLink"));

  PKW3CDateStringFromDate(self->_claimExpiryDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("claimExpiryDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_claimExpired);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("claimExpired"));

  PKW3CDateStringFromDate(self->_redeemExpiryDate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("redeemExpiryDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_redeemExpired);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("redeemExpired"));

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_typeString);
  objc_msgSend(v3, "safelyAddObject:", self->_subtype);
  objc_msgSend(v3, "safelyAddObject:", self->_awardDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_relevantAccountName);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_claimExpiryDate);
  objc_msgSend(v3, "safelyAddObject:", self->_redeemExpiryDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_order - v4 + 32 * v4;
  v6 = self->_type - v5 + 32 * v5;
  v7 = self->_hasDeepLink - v6 + 32 * v6;
  v8 = self->_claimExpired - v7 + 32 * v7;
  v9 = self->_redeemExpired - v8 + 32 * v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionAward *v4;
  PKPaymentTransactionAward *v5;
  BOOL v6;

  v4 = (PKPaymentTransactionAward *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransactionAward isEqualToPaymentTransactionAward:](self, "isEqualToPaymentTransactionAward:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentTransactionAward:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  PKTransactionAmount *amount;
  PKTransactionAmount *v21;
  void *v22;
  NSString *v23;
  _BOOL4 v24;
  void *v25;
  NSString *v26;
  _BOOL4 v27;
  BOOL v28;
  NSDate *claimExpiryDate;
  NSDate *v31;
  NSDate *redeemExpiryDate;
  NSDate *v33;

  v4 = a3;
  v5 = (void *)v4[12];
  v6 = self->_typeString;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_45;
    v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v10)
      goto LABEL_46;
  }
  v11 = (void *)v4[2];
  v6 = self->_identifier;
  v12 = v11;
  if (v6 == v12)
  {

  }
  else
  {
    v8 = v12;
    if (!v6 || !v12)
      goto LABEL_45;
    v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_46;
  }
  v14 = (void *)v4[8];
  v6 = self->_awardDescription;
  v15 = v14;
  if (v6 == v15)
  {

  }
  else
  {
    v8 = v15;
    if (!v6 || !v15)
      goto LABEL_45;
    v16 = -[NSString isEqualToString:](v6, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_46;
  }
  if (self->_order != v4[5] || self->_type != v4[3])
    goto LABEL_46;
  v17 = (void *)v4[4];
  v6 = self->_subtype;
  v18 = v17;
  if (v6 == v18)
  {

  }
  else
  {
    v8 = v18;
    if (!v6 || !v18)
      goto LABEL_45;
    v19 = -[NSString isEqualToString:](v6, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_46;
  }
  amount = self->_amount;
  v21 = (PKTransactionAmount *)v4[6];
  if (amount && v21)
  {
    if (!-[PKTransactionAmount isEqual:](amount, "isEqual:"))
      goto LABEL_46;
  }
  else if (amount != v21)
  {
    goto LABEL_46;
  }
  v22 = (void *)v4[7];
  v6 = self->_localizedAmount;
  v23 = v22;
  if (v6 == v23)
  {

  }
  else
  {
    v8 = v23;
    if (!v6 || !v23)
      goto LABEL_45;
    v24 = -[NSString isEqualToString:](v6, "isEqualToString:", v23);

    if (!v24)
      goto LABEL_46;
  }
  v25 = (void *)v4[9];
  v6 = self->_relevantAccountName;
  v26 = v25;
  if (v6 != v26)
  {
    v8 = v26;
    if (v6 && v26)
    {
      v27 = -[NSString isEqualToString:](v6, "isEqualToString:", v26);

      if (!v27)
        goto LABEL_46;
      goto LABEL_49;
    }
LABEL_45:

    goto LABEL_46;
  }

LABEL_49:
  if (self->_hasDeepLink == *((unsigned __int8 *)v4 + 8))
  {
    claimExpiryDate = self->_claimExpiryDate;
    v31 = (NSDate *)v4[10];
    if (claimExpiryDate && v31)
    {
      if ((-[NSDate isEqual:](claimExpiryDate, "isEqual:") & 1) == 0)
        goto LABEL_46;
    }
    else if (claimExpiryDate != v31)
    {
      goto LABEL_46;
    }
    if (self->_claimExpired == *((unsigned __int8 *)v4 + 9))
    {
      redeemExpiryDate = self->_redeemExpiryDate;
      v33 = (NSDate *)v4[11];
      if (redeemExpiryDate && v33)
      {
        if ((-[NSDate isEqual:](redeemExpiryDate, "isEqual:") & 1) != 0)
          goto LABEL_61;
      }
      else if (redeemExpiryDate == v33)
      {
LABEL_61:
        v28 = self->_redeemExpired == *((unsigned __int8 *)v4 + 10);
        goto LABEL_47;
      }
    }
  }
LABEL_46:
  v28 = 0;
LABEL_47:

  return v28;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)order
{
  return self->_order;
}

- (void)setOrder:(int64_t)a3
{
  self->_order = a3;
}

- (PKTransactionAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)localizedAmount
{
  return self->_localizedAmount;
}

- (void)setLocalizedAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)awardDescription
{
  return self->_awardDescription;
}

- (void)setAwardDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)relevantAccountName
{
  return self->_relevantAccountName;
}

- (void)setRelevantAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)hasDeepLink
{
  return self->_hasDeepLink;
}

- (void)setHasDeepLink:(BOOL)a3
{
  self->_hasDeepLink = a3;
}

- (NSDate)claimExpiryDate
{
  return self->_claimExpiryDate;
}

- (void)setClaimExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)claimExpired
{
  return self->_claimExpired;
}

- (void)setClaimExpired:(BOOL)a3
{
  self->_claimExpired = a3;
}

- (NSDate)redeemExpiryDate
{
  return self->_redeemExpiryDate;
}

- (void)setRedeemExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)redeemExpired
{
  return self->_redeemExpired;
}

- (void)setRedeemExpired:(BOOL)a3
{
  self->_redeemExpired = a3;
}

- (NSString)typeString
{
  return self->_typeString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_redeemExpiryDate, 0);
  objc_storeStrong((id *)&self->_claimExpiryDate, 0);
  objc_storeStrong((id *)&self->_relevantAccountName, 0);
  objc_storeStrong((id *)&self->_awardDescription, 0);
  objc_storeStrong((id *)&self->_localizedAmount, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
