@implementation PKPaymentOfferInstallmentFeeDetailItem

- (PKPaymentOfferInstallmentFeeDetailItem)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentFeeDetailItem *v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  uint64_t v13;
  PKCurrencyAmount *feeAmount;
  uint64_t v15;
  PKCurrencyAmount *totalFees;
  void *v17;
  uint64_t v18;
  NSDate *feeDate;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentOfferInstallmentFeeDetailItem;
  v5 = -[PKPaymentOfferInstallmentFeeDetailItem init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 != CFSTR("recurring"))
    {
      if (v6)
      {
        v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("recurring"));

        if ((v8 & 1) != 0)
          goto LABEL_5;
        v10 = v7;
        if (v10 == CFSTR("oneTime")
          || (v11 = v10,
              v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("oneTime")),
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
    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("feeAmount"));
    v13 = objc_claimAutoreleasedReturnValue();
    feeAmount = v5->_feeAmount;
    v5->_feeAmount = (PKCurrencyAmount *)v13;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalFees"));
    v15 = objc_claimAutoreleasedReturnValue();
    totalFees = v5->_totalFees;
    v5->_totalFees = (PKCurrencyAmount *)v15;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("feesPeriod"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_feesPeriod = PKPaymentOfferPeriodFromString(v17);

    v5->_feesInterval = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("feesInterval"));
    objc_msgSend(v4, "PKDateForKey:", CFSTR("feeDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    feeDate = v5->_feeDate;
    v5->_feeDate = (NSDate *)v18;

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
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  type = self->_type;
  v6 = CFSTR("unknown");
  if (type == 1)
    v6 = CFSTR("recurring");
  if (type == 2)
    v7 = CFSTR("oneTime");
  else
    v7 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("type"));
  -[PKCurrencyAmount dictionaryRepresentation](self->_feeAmount, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("feeAmount"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_totalFees, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("totalFees"));

  PKPaymentOfferPeriodToString(self->_feesPeriod);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("feesPeriod"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_feesInterval);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("feesInterval"));

  PKISO8601DateStringFromDate(self->_feeDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, self->_feeDate);

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferInstallmentFeeDetailItem *v4;
  PKPaymentOfferInstallmentFeeDetailItem *v5;
  PKPaymentOfferInstallmentFeeDetailItem *v6;
  PKCurrencyAmount *feeAmount;
  PKCurrencyAmount *v8;
  BOOL v9;
  PKCurrencyAmount *totalFees;
  PKCurrencyAmount *v11;
  NSDate *feeDate;
  NSDate *v13;

  v4 = (PKPaymentOfferInstallmentFeeDetailItem *)a3;
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
        feeAmount = self->_feeAmount;
        v8 = v6->_feeAmount;
        if (feeAmount && v8)
        {
          if (!-[PKCurrencyAmount isEqual:](feeAmount, "isEqual:"))
            goto LABEL_24;
        }
        else if (feeAmount != v8)
        {
          goto LABEL_24;
        }
        totalFees = self->_totalFees;
        v11 = v6->_totalFees;
        if (totalFees && v11)
        {
          if (!-[PKCurrencyAmount isEqual:](totalFees, "isEqual:"))
            goto LABEL_24;
        }
        else if (totalFees != v11)
        {
          goto LABEL_24;
        }
        feeDate = self->_feeDate;
        v13 = v6->_feeDate;
        if (feeDate && v13)
        {
          if ((-[NSDate isEqual:](feeDate, "isEqual:") & 1) == 0)
            goto LABEL_24;
        }
        else if (feeDate != v13)
        {
          goto LABEL_24;
        }
        if (self->_type == v6->_type && self->_feesPeriod == v6->_feesPeriod)
        {
          v9 = self->_feesInterval == v6->_feesInterval;
LABEL_25:

          goto LABEL_26;
        }
LABEL_24:
        v9 = 0;
        goto LABEL_25;
      }
    }
    v9 = 0;
  }
LABEL_26:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_feeAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_totalFees);
  objc_msgSend(v3, "safelyAddObject:", self->_feeDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_feesInterval - v5 + 32 * v5;
  v7 = self->_feesPeriod - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3;
  unint64_t type;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  type = self->_type;
  v5 = CFSTR("unknown");
  if (type == 1)
    v5 = CFSTR("recurring");
  if (type == 2)
    v6 = CFSTR("oneTime");
  else
    v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("feeAmount: '%@'; "), self->_feeAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalFees: '%@'; "), self->_totalFees);
  PKPaymentOfferPeriodToString(self->_feesPeriod);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("feesPeriod: '%@'; "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("feesInterval: %ld; "), self->_feesInterval);
  objc_msgSend(v3, "appendFormat:", CFSTR("feeDate: '%@'; "), self->_feeDate);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentFeeDetailItem)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentFeeDetailItem *v5;
  uint64_t v6;
  PKCurrencyAmount *feeAmount;
  uint64_t v8;
  PKCurrencyAmount *totalFees;
  uint64_t v10;
  NSDate *feeDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferInstallmentFeeDetailItem;
  v5 = -[PKPaymentOfferInstallmentFeeDetailItem init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feeAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    feeAmount = v5->_feeAmount;
    v5->_feeAmount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalFees"));
    v8 = objc_claimAutoreleasedReturnValue();
    totalFees = v5->_totalFees;
    v5->_totalFees = (PKCurrencyAmount *)v8;

    v5->_feesPeriod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feesPeriod"));
    v5->_feesInterval = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feesInterval"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feeDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    feeDate = v5->_feeDate;
    v5->_feeDate = (NSDate *)v10;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKCurrencyAmount *feeAmount;
  id v5;

  feeAmount = self->_feeAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", feeAmount, CFSTR("feeAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalFees, CFSTR("totalFees"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_feeDate, CFSTR("feeDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_feesPeriod, CFSTR("feesPeriod"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_feesInterval, CFSTR("feesInterval"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferInstallmentFeeDetailItem *v5;
  PKCurrencyAmount *v6;
  PKCurrencyAmount *feeAmount;
  PKCurrencyAmount *v8;
  PKCurrencyAmount *totalFees;
  uint64_t v10;
  NSDate *feeDate;

  v5 = -[PKPaymentOfferInstallmentFeeDetailItem init](+[PKPaymentOfferInstallmentFeeDetailItem allocWithZone:](PKPaymentOfferInstallmentFeeDetailItem, "allocWithZone:"), "init");
  v6 = -[PKCurrencyAmount copyWithZone:](self->_feeAmount, "copyWithZone:", a3);
  feeAmount = v5->_feeAmount;
  v5->_feeAmount = v6;

  v8 = -[PKCurrencyAmount copyWithZone:](self->_totalFees, "copyWithZone:", a3);
  totalFees = v5->_totalFees;
  v5->_totalFees = v8;

  v10 = -[NSDate copyWithZone:](self->_feeDate, "copyWithZone:", a3);
  feeDate = v5->_feeDate;
  v5->_feeDate = (NSDate *)v10;

  v5->_feesPeriod = self->_feesPeriod;
  v5->_feesInterval = self->_feesInterval;
  v5->_type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKCurrencyAmount)feeAmount
{
  return self->_feeAmount;
}

- (PKCurrencyAmount)totalFees
{
  return self->_totalFees;
}

- (unint64_t)feesPeriod
{
  return self->_feesPeriod;
}

- (int64_t)feesInterval
{
  return self->_feesInterval;
}

- (NSDate)feeDate
{
  return self->_feeDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feeDate, 0);
  objc_storeStrong((id *)&self->_totalFees, 0);
  objc_storeStrong((id *)&self->_feeAmount, 0);
}

@end
