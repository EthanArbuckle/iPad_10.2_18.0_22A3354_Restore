@implementation PKPayLaterFinancingPlanFundingSource

- (PKPayLaterFinancingPlanFundingSource)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanFundingSource *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  unint64_t type;
  __objc2_class *v11;
  uint64_t v12;
  PKPayLaterFundingSourceDetails *details;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFinancingPlanFundingSource;
  v5 = -[PKPayLaterFinancingPlanFundingSource init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPayLaterFundingSourceTypeFromString(v6);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v5->_autoPayment = objc_msgSend(v4, "PKBoolForKey:", CFSTR("autoPayment"));
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("sourceDetails"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      type = v5->_type;
      switch(type)
      {
        case 3uLL:
          goto LABEL_6;
        case 2uLL:
          v11 = PKPayLaterFundingSourceBankDetails;
          goto LABEL_8;
        case 1uLL:
LABEL_6:
          v11 = PKPayLaterFundingSourcePaymentPassDetails;
LABEL_8:
          v12 = objc_msgSend([v11 alloc], "initWithDictionary:type:", v9, v5->_type);
          details = v5->_details;
          v5->_details = (PKPayLaterFundingSourceDetails *)v12;

          break;
      }
    }

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKPayLaterFundingSourceTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoPayment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("autoPayment"));

  -[PKPayLaterFundingSourceDetails dictionaryRepresentation](self->_details, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sourceDetails"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (id)paymentPassDetails
{
  if ((self->_type | 2) == 3)
    return self->_details;
  else
    return 0;
}

- (id)bankDetails
{
  if (self->_type == 2)
    return self->_details;
  else
    return 0;
}

- (id)displayName
{
  unint64_t type;
  void *v3;

  type = self->_type;
  if (type != 3)
  {
    if (type == 2)
    {
      -[PKPayLaterFundingSourceDetails bankName](self->_details, "bankName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    if (type != 1)
    {
      v3 = 0;
      return v3;
    }
  }
  -[PKPayLaterFundingSourceDetails cardName](self->_details, "cardName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)panSuffix
{
  unint64_t type;
  uint64_t v3;
  void *v4;
  void *v5;

  type = self->_type;
  if (type != 3)
  {
    if (type == 2)
    {
      -[PKPayLaterFundingSourceDetails accountNumberSuffix](self->_details, "accountNumberSuffix");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v3;
LABEL_7:
      PKMaskedPaymentPAN(v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (type != 1)
      return 0;
  }
  -[PKPayLaterFundingSourceDetails cardSuffix](self->_details, "cardSuffix");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    goto LABEL_7;
  v5 = 0;
LABEL_10:

  return v5;
}

- (id)unmaskedPanSuffix
{
  unint64_t type;
  void *v3;

  type = self->_type;
  if (type != 3)
  {
    if (type == 2)
    {
      -[PKPayLaterFundingSourceDetails accountNumberSuffix](self->_details, "accountNumberSuffix");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    if (type != 1)
    {
      v3 = 0;
      return v3;
    }
  }
  -[PKPayLaterFundingSourceDetails cardSuffix](self->_details, "cardSuffix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingPlanFundingSource *v4;
  PKPayLaterFinancingPlanFundingSource *v5;
  PKPayLaterFinancingPlanFundingSource *v6;
  PKPayLaterFundingSourceDetails *details;
  PKPayLaterFundingSourceDetails *v8;
  BOOL v9;
  NSString *identifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  _BOOL4 v14;

  v4 = (PKPayLaterFinancingPlanFundingSource *)a3;
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
        details = self->_details;
        v8 = v6->_details;
        if (details && v8)
        {
          if ((-[PKPayLaterFundingSourceDetails isEqual:](details, "isEqual:") & 1) == 0)
            goto LABEL_20;
        }
        else if (details != v8)
        {
          goto LABEL_20;
        }
        identifier = v6->_identifier;
        v11 = self->_identifier;
        v12 = identifier;
        if (v11 == v12)
        {

        }
        else
        {
          v13 = v12;
          if (!v11 || !v12)
          {

            goto LABEL_20;
          }
          v14 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

          if (!v14)
            goto LABEL_20;
        }
        if (self->_autoPayment == v6->_autoPayment)
        {
          v9 = self->_type == v6->_type;
LABEL_21:

          goto LABEL_22;
        }
LABEL_20:
        v9 = 0;
        goto LABEL_21;
      }
    }
    v9 = 0;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_details);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingPlanFundingSource;
  v4 = -[PKPayLaterFinancingPlanFundingSource hash](&v9, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);
  v6 = self->_autoPayment - v5 + 32 * v5;
  v7 = self->_type - v6 + 32 * v6;

  return v7;
}

- (NSString)description
{
  id v3;
  void *v4;
  const __CFString *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  PKPayLaterFundingSourceTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  if (self->_autoPayment)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("autoPayment: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("details: '%@'; "), self->_details);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlanFundingSource)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanFundingSource *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  PKPayLaterFundingSourceDetails *details;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFinancingPlanFundingSource;
  v5 = -[PKPayLaterFinancingPlanFundingSource init](&v15, sel_init);
  if (v5)
  {
    v5->_autoPayment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoPayment"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("sourceDetails"));
    v12 = objc_claimAutoreleasedReturnValue();
    details = v5->_details;
    v5->_details = (PKPayLaterFundingSourceDetails *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 autoPayment;
  id v5;

  autoPayment = self->_autoPayment;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", autoPayment, CFSTR("autoPayment"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_details, CFSTR("sourceDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterFinancingPlanFundingSource *v5;
  uint64_t v6;
  PKPayLaterFundingSourceDetails *details;
  uint64_t v8;
  NSString *identifier;

  v5 = -[PKPayLaterFinancingPlanFundingSource init](+[PKPayLaterFinancingPlanFundingSource allocWithZone:](PKPayLaterFinancingPlanFundingSource, "allocWithZone:"), "init");
  v5->_autoPayment = self->_autoPayment;
  v6 = -[PKPayLaterFundingSourceDetails copyWithZone:](self->_details, "copyWithZone:", a3);
  details = v5->_details;
  v5->_details = (PKPayLaterFundingSourceDetails *)v6;

  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v8;

  v5->_type = self->_type;
  return v5;
}

- (PKPayLaterFundingSourceDetails)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)autoPayment
{
  return self->_autoPayment;
}

- (void)setAutoPayment:(BOOL)a3
{
  self->_autoPayment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_details, 0);
}

@end
