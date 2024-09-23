@implementation PKPayLaterPaymentFundingSource

- (PKPayLaterPaymentFundingSource)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterPaymentFundingSource *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  void *v9;
  unint64_t *p_type;
  void *v11;
  uint64_t v12;
  PKCurrencyAmount *refundAmount;
  void *v14;
  unint64_t v15;
  __objc2_class *v16;
  uint64_t v17;
  PKPayLaterFundingSourceDetails *details;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterPaymentFundingSource;
  v5 = -[PKPayLaterPaymentFundingSource init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("sourceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v5->_type = PKPayLaterFundingSourceTypeFromString(v8);
      p_type = &v5->_type;
    }
    else
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_type = PKPayLaterFundingSourceTypeFromString(v11);
      p_type = &v5->_type;

    }
    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("refundAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    refundAmount = v5->_refundAmount;
    v5->_refundAmount = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("sourceDetails"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "count"))
      goto LABEL_12;
    v15 = *p_type;
    if (*p_type != 3)
    {
      if (v15 == 2)
      {
        v16 = PKPayLaterFundingSourceBankDetails;
        goto LABEL_11;
      }
      if (v15 != 1)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    v16 = PKPayLaterFundingSourcePaymentPassDetails;
LABEL_11:
    v17 = objc_msgSend([v16 alloc], "initWithDictionary:type:", v14, v5->_type);
    details = v5->_details;
    v5->_details = (PKPayLaterFundingSourceDetails *)v17;

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
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  PKPayLaterFundingSourceTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sourceType"));

  -[PKPayLaterFundingSourceDetails dictionaryRepresentation](self->_details, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sourceDetails"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_refundAmount, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("refundAmount"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
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

- (BOOL)isEqual:(id)a3
{
  PKPayLaterPaymentFundingSource *v4;
  PKPayLaterPaymentFundingSource *v5;
  BOOL v6;

  v4 = (PKPayLaterPaymentFundingSource *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterPaymentFundingSource isEqualToFundingSource:](self, "isEqualToFundingSource:", v5);

  return v6;
}

- (BOOL)isEqualToFundingSource:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  PKPayLaterFundingSourceDetails *details;
  PKPayLaterFundingSourceDetails *v12;
  BOOL v13;
  PKCurrencyAmount *refundAmount;
  PKCurrencyAmount *v16;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_15;
  v6 = (void *)v4[4];
  v7 = self->_identifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_15;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_15;
  }
  if (self->_type != v5[1])
  {
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  details = self->_details;
  v12 = (PKPayLaterFundingSourceDetails *)v5[2];
  if (details && v12)
  {
    if ((-[PKPayLaterFundingSourceDetails isEqual:](details, "isEqual:") & 1) != 0)
      goto LABEL_17;
    goto LABEL_15;
  }
  if (details != v12)
    goto LABEL_15;
LABEL_17:
  refundAmount = self->_refundAmount;
  v16 = (PKCurrencyAmount *)v5[3];
  if (refundAmount && v16)
    v13 = -[PKCurrencyAmount isEqual:](refundAmount, "isEqual:");
  else
    v13 = refundAmount == v16;
LABEL_16:

  return v13;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_details);
  objc_msgSend(v3, "safelyAddObject:", self->_refundAmount);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (NSString)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  PKPayLaterFundingSourceTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);

  if (self->_identifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("details: '%@'; "), self->_details);
  if (self->_refundAmount)
    objc_msgSend(v3, "appendFormat:", CFSTR("refundAmount: '%@'; "), self->_refundAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPaymentFundingSource)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterPaymentFundingSource *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  PKPayLaterFundingSourceDetails *details;
  uint64_t v14;
  PKCurrencyAmount *refundAmount;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterPaymentFundingSource;
  v5 = -[PKPayLaterPaymentFundingSource init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceType"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("sourceDetails"));
    v12 = objc_claimAutoreleasedReturnValue();
    details = v5->_details;
    v5->_details = (PKPayLaterFundingSourceDetails *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("refundAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    refundAmount = v5->_refundAmount;
    v5->_refundAmount = (PKCurrencyAmount *)v14;

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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("sourceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_details, CFSTR("sourceDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_refundAmount, CFSTR("refundAmount"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterPaymentFundingSource *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  PKPayLaterFundingSourceDetails *details;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *refundAmount;

  v5 = -[PKPayLaterPaymentFundingSource init](+[PKPayLaterPaymentFundingSource allocWithZone:](PKPayLaterPaymentFundingSource, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[PKPayLaterFundingSourceDetails copyWithZone:](self->_details, "copyWithZone:", a3);
  details = v5->_details;
  v5->_details = (PKPayLaterFundingSourceDetails *)v8;

  v5->_type = self->_type;
  v10 = -[PKCurrencyAmount copyWithZone:](self->_refundAmount, "copyWithZone:", a3);
  refundAmount = v5->_refundAmount;
  v5->_refundAmount = v10;

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

- (PKCurrencyAmount)refundAmount
{
  return self->_refundAmount;
}

- (void)setRefundAmount:(id)a3
{
  objc_storeStrong((id *)&self->_refundAmount, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_refundAmount, 0);
  objc_storeStrong((id *)&self->_details, 0);
}

@end
