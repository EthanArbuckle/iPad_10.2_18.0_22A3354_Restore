@implementation PKPaymentOfferInstallmentInterestDetailItem

- (PKPaymentOfferInstallmentInterestDetailItem)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentInterestDetailItem *v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  uint64_t v13;
  NSDecimalNumber *interestPercentage;
  uint64_t v15;
  PKCurrencyAmount *totalInterest;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentOfferInstallmentInterestDetailItem;
  v5 = -[PKPaymentOfferInstallmentInterestDetailItem init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 != CFSTR("apr"))
    {
      if (v6)
      {
        v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("apr"));

        if ((v8 & 1) != 0)
          goto LABEL_5;
        v10 = v7;
        if (v10 == CFSTR("pa")
          || (v11 = v10,
              v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("pa")),
              v11,
              v12))
        {
          v9 = 2;
          goto LABEL_10;
        }
      }
      v9 = 0;
      goto LABEL_10;
    }
LABEL_5:
    v9 = 1;
LABEL_10:

    v5->_type = v9;
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("interestPercentage"));
    v13 = objc_claimAutoreleasedReturnValue();
    interestPercentage = v5->_interestPercentage;
    v5->_interestPercentage = (NSDecimalNumber *)v13;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalInterest"));
    v15 = objc_claimAutoreleasedReturnValue();
    totalInterest = v5->_totalInterest;
    v5->_totalInterest = (PKCurrencyAmount *)v15;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  type = self->_type;
  v6 = CFSTR("unknown");
  if (type == 1)
    v6 = CFSTR("apr");
  if (type == 2)
    v7 = CFSTR("pa");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("type"));
  -[NSDecimalNumber stringValue](self->_interestPercentage, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("interestPercentage"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_totalInterest, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("totalInterest"));

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferInstallmentInterestDetailItem *v4;
  PKPaymentOfferInstallmentInterestDetailItem *v5;
  PKPaymentOfferInstallmentInterestDetailItem *v6;
  NSDecimalNumber *interestPercentage;
  NSDecimalNumber *v8;
  BOOL v9;
  PKCurrencyAmount *totalInterest;
  PKCurrencyAmount *v11;

  v4 = (PKPaymentOfferInstallmentInterestDetailItem *)a3;
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
        interestPercentage = self->_interestPercentage;
        v8 = v6->_interestPercentage;
        if (interestPercentage && v8)
        {
          if ((-[NSDecimalNumber isEqual:](interestPercentage, "isEqual:") & 1) == 0)
            goto LABEL_16;
        }
        else if (interestPercentage != v8)
        {
          goto LABEL_16;
        }
        totalInterest = self->_totalInterest;
        v11 = v6->_totalInterest;
        if (totalInterest && v11)
        {
          if (-[PKCurrencyAmount isEqual:](totalInterest, "isEqual:"))
          {
LABEL_14:
            v9 = self->_type == v6->_type;
LABEL_17:

            goto LABEL_18;
          }
        }
        else if (totalInterest == v11)
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
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_interestPercentage);
  objc_msgSend(v3, "safelyAddObject:", self->_totalInterest);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3;
  unint64_t type;
  const __CFString *v5;
  const __CFString *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  type = self->_type;
  v5 = CFSTR("unknown");
  if (type == 1)
    v5 = CFSTR("apr");
  if (type == 2)
    v6 = CFSTR("pa");
  else
    v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("interestPercentage: '%@'; "), self->_interestPercentage);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalInterest: '%@'; "), self->_totalInterest);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentInterestDetailItem)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentInterestDetailItem *v5;
  uint64_t v6;
  NSDecimalNumber *interestPercentage;
  uint64_t v8;
  PKCurrencyAmount *totalInterest;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferInstallmentInterestDetailItem;
  v5 = -[PKPaymentOfferInstallmentInterestDetailItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestPercentage"));
    v6 = objc_claimAutoreleasedReturnValue();
    interestPercentage = v5->_interestPercentage;
    v5->_interestPercentage = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalInterest"));
    v8 = objc_claimAutoreleasedReturnValue();
    totalInterest = v5->_totalInterest;
    v5->_totalInterest = (PKCurrencyAmount *)v8;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *interestPercentage;
  id v5;

  interestPercentage = self->_interestPercentage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interestPercentage, CFSTR("interestPercentage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalInterest, CFSTR("totalInterest"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferInstallmentInterestDetailItem *v5;
  PKCurrencyAmount *v6;
  PKCurrencyAmount *totalInterest;
  uint64_t v8;
  NSDecimalNumber *interestPercentage;

  v5 = -[PKPaymentOfferInstallmentInterestDetailItem init](+[PKPaymentOfferInstallmentInterestDetailItem allocWithZone:](PKPaymentOfferInstallmentInterestDetailItem, "allocWithZone:"), "init");
  v6 = -[PKCurrencyAmount copyWithZone:](self->_totalInterest, "copyWithZone:", a3);
  totalInterest = v5->_totalInterest;
  v5->_totalInterest = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_interestPercentage, "copyWithZone:", a3);
  interestPercentage = v5->_interestPercentage;
  v5->_interestPercentage = (NSDecimalNumber *)v8;

  v5->_type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDecimalNumber)interestPercentage
{
  return self->_interestPercentage;
}

- (PKCurrencyAmount)totalInterest
{
  return self->_totalInterest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalInterest, 0);
  objc_storeStrong((id *)&self->_interestPercentage, 0);
}

@end
