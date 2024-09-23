@implementation PKPayLaterFinancingOptionFundingSource

- (PKPayLaterFinancingOptionFundingSource)initWithPaymentPass:(id)a3 paymentApplication:(id)a4
{
  id v6;
  id v7;
  PKPayLaterFinancingOptionFundingSource *v8;
  PKPayLaterFinancingOptionFundingSource *v9;
  PKPayLaterFundingSourcePaymentPassDetails *v10;
  PKPayLaterFundingSourceDetails *details;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFinancingOptionFundingSource;
  v8 = -[PKPayLaterFinancingOptionFundingSource init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    v10 = -[PKPayLaterFundingSourcePaymentPassDetails initWithPaymentPass:paymentApplication:]([PKPayLaterFundingSourcePaymentPassDetails alloc], "initWithPaymentPass:paymentApplication:", v6, v7);
    details = v9->_details;
    v9->_details = (PKPayLaterFundingSourceDetails *)v10;

  }
  return v9;
}

- (PKPayLaterFinancingOptionFundingSource)initWithAccountFundingSource:(id)a3
{
  id v4;
  PKPayLaterFinancingOptionFundingSource *v5;
  PKPayLaterFinancingOptionFundingSource *v6;
  PKPayLaterFundingSourceBankDetails *v7;
  PKPayLaterFundingSourceDetails *details;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPayLaterFinancingOptionFundingSource;
  v5 = -[PKPayLaterFinancingOptionFundingSource init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 2;
    v7 = -[PKPayLaterFundingSourceBankDetails initWithAccountFundingSource:]([PKPayLaterFundingSourceBankDetails alloc], "initWithAccountFundingSource:", v4);
    details = v6->_details;
    v6->_details = (PKPayLaterFundingSourceDetails *)v7;

  }
  return v6;
}

- (PKPayLaterFinancingOptionFundingSource)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterFinancingOptionFundingSource *v5;
  void *v6;
  void *v7;
  unint64_t *p_type;
  void *v9;
  void *v10;
  unint64_t v11;
  __objc2_class *v12;
  uint64_t v13;
  PKPayLaterFundingSourceDetails *details;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingOptionFundingSource;
  v5 = -[PKPayLaterFinancingOptionFundingSource init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5->_type = PKPayLaterFundingSourceTypeFromString(v6);
      p_type = &v5->_type;
    }
    else
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("sourceType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_type = PKPayLaterFundingSourceTypeFromString(v9);
      p_type = &v5->_type;

    }
    v5->_autoPayment = objc_msgSend(v4, "PKBoolForKey:", CFSTR("autoPayment"));
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("sourceDetails"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
      goto LABEL_12;
    v11 = *p_type;
    if (*p_type != 3)
    {
      if (v11 == 2)
      {
        v12 = PKPayLaterFundingSourceBankDetails;
        goto LABEL_11;
      }
      if (v11 != 1)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    v12 = PKPayLaterFundingSourcePaymentPassDetails;
LABEL_11:
    v13 = objc_msgSend([v12 alloc], "initWithDictionary:type:", v10, v5->_type);
    details = v5->_details;
    v5->_details = (PKPayLaterFundingSourceDetails *)v13;

    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  PKPayLaterFundingSourceDetails *details;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKPayLaterFundingSourceTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoPayment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("autoPayment"));

  details = self->_details;
  if (details)
  {
    -[PKPayLaterFundingSourceDetails dictionaryRepresentation](details, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sourceDetails"));

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
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
  PKPayLaterFinancingOptionFundingSource *v4;
  PKPayLaterFinancingOptionFundingSource *v5;
  PKPayLaterFinancingOptionFundingSource *v6;
  PKPayLaterFundingSourceDetails *details;
  PKPayLaterFundingSourceDetails *v8;
  BOOL v9;

  v4 = (PKPayLaterFinancingOptionFundingSource *)a3;
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
            goto LABEL_13;
        }
        else if (details != v8)
        {
          goto LABEL_13;
        }
        if (self->_autoPayment == v6->_autoPayment)
        {
          v9 = self->_type == v6->_type;
LABEL_14:

          goto LABEL_15;
        }
LABEL_13:
        v9 = 0;
        goto LABEL_14;
      }
    }
    v9 = 0;
  }
LABEL_15:

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
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingOptionFundingSource;
  v4 = -[PKPayLaterFinancingOptionFundingSource hash](&v9, sel_hash);
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

- (PKPayLaterFinancingOptionFundingSource)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingOptionFundingSource *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  PKPayLaterFundingSourceDetails *details;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFinancingOptionFundingSource;
  v5 = -[PKPayLaterFinancingOptionFundingSource init](&v13, sel_init);
  if (v5)
  {
    v5->_autoPayment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoPayment"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("sourceDetails"));
    v10 = objc_claimAutoreleasedReturnValue();
    details = v5->_details;
    v5->_details = (PKPayLaterFundingSourceDetails *)v10;

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

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterFinancingOptionFundingSource *v5;
  uint64_t v6;
  PKPayLaterFundingSourceDetails *details;

  v5 = -[PKPayLaterFinancingOptionFundingSource init](+[PKPayLaterFinancingOptionFundingSource allocWithZone:](PKPayLaterFinancingOptionFundingSource, "allocWithZone:"), "init");
  v5->_autoPayment = self->_autoPayment;
  v6 = -[PKPayLaterFundingSourceDetails copyWithZone:](self->_details, "copyWithZone:", a3);
  details = v5->_details;
  v5->_details = (PKPayLaterFundingSourceDetails *)v6;

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
  objc_storeStrong((id *)&self->_details, 0);
}

@end
