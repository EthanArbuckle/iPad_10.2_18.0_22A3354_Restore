@implementation PKPaymentOfferInstallmentFeeDetails

- (PKPaymentOfferInstallmentFeeDetails)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentFeeDetails *v5;
  uint64_t v6;
  PKCurrencyAmount *totalFeeAmount;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PKPaymentOfferInstallmentFeeDetailItem *v16;
  PKPaymentOfferInstallmentFeeDetailItem *v17;
  uint64_t v18;
  NSArray *feeItems;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentOfferInstallmentFeeDetails;
  v5 = -[PKPaymentOfferInstallmentFeeDetails init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalFeeAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    totalFeeAmount = v5->_totalFeeAmount;
    v5->_totalFeeAmount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("fees"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
          v16 = [PKPaymentOfferInstallmentFeeDetailItem alloc];
          v17 = -[PKPaymentOfferInstallmentFeeDetailItem initWithDictionary:](v16, "initWithDictionary:", v15, (_QWORD)v21);
          objc_msgSend(v9, "safelyAddObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v9, "count"))
    {
      v18 = objc_msgSend(v9, "copy");
      feeItems = v5->_feeItems;
      v5->_feeItems = (NSArray *)v18;
    }
    else
    {
      feeItems = v5->_feeItems;
      v5->_feeItems = 0;
    }

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKCurrencyAmount dictionaryRepresentation](self->_totalFeeAmount, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("totalFeeAmount"));

  v5 = -[NSArray pk_createArrayBySafelyApplyingBlock:](self->_feeItems, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_63);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fees"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

uint64_t __63__PKPaymentOfferInstallmentFeeDetails_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferInstallmentFeeDetails *v4;
  PKPaymentOfferInstallmentFeeDetails *v5;
  PKPaymentOfferInstallmentFeeDetails *v6;
  PKCurrencyAmount *totalFeeAmount;
  PKCurrencyAmount *v8;
  NSArray *feeItems;
  NSArray *v10;
  char v11;

  v4 = (PKPaymentOfferInstallmentFeeDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        totalFeeAmount = self->_totalFeeAmount;
        v8 = v6->_totalFeeAmount;
        if (totalFeeAmount && v8)
        {
          if (-[PKCurrencyAmount isEqual:](totalFeeAmount, "isEqual:"))
          {
LABEL_7:
            feeItems = self->_feeItems;
            v10 = v6->_feeItems;
            if (feeItems && v10)
              v11 = -[NSArray isEqual:](feeItems, "isEqual:");
            else
              v11 = feeItems == v10;
            goto LABEL_15;
          }
        }
        else if (totalFeeAmount == v8)
        {
          goto LABEL_7;
        }
        v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_totalFeeAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_feeItems);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalFeeAmount: '%@'; "), self->_totalFeeAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("feeItems: '%@'; "), self->_feeItems);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentFeeDetails)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentFeeDetails *v5;
  uint64_t v6;
  PKCurrencyAmount *totalFeeAmount;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *feeItems;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentOfferInstallmentFeeDetails;
  v5 = -[PKPaymentOfferInstallmentFeeDetails init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalFeeAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    totalFeeAmount = v5->_totalFeeAmount;
    v5->_totalFeeAmount = (PKCurrencyAmount *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("fees"));
    v11 = objc_claimAutoreleasedReturnValue();
    feeItems = v5->_feeItems;
    v5->_feeItems = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKCurrencyAmount *totalFeeAmount;
  id v5;

  totalFeeAmount = self->_totalFeeAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", totalFeeAmount, CFSTR("totalFeeAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_feeItems, CFSTR("fees"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferInstallmentFeeDetails *v5;
  PKCurrencyAmount *v6;
  PKCurrencyAmount *totalFeeAmount;
  uint64_t v8;
  NSArray *feeItems;

  v5 = -[PKPaymentOfferInstallmentFeeDetails init](+[PKPaymentOfferInstallmentFeeDetails allocWithZone:](PKPaymentOfferInstallmentFeeDetails, "allocWithZone:"), "init");
  v6 = -[PKCurrencyAmount copyWithZone:](self->_totalFeeAmount, "copyWithZone:", a3);
  totalFeeAmount = v5->_totalFeeAmount;
  v5->_totalFeeAmount = v6;

  v8 = -[NSArray copyWithZone:](self->_feeItems, "copyWithZone:", a3);
  feeItems = v5->_feeItems;
  v5->_feeItems = (NSArray *)v8;

  return v5;
}

- (PKCurrencyAmount)totalFeeAmount
{
  return self->_totalFeeAmount;
}

- (NSArray)feeItems
{
  return self->_feeItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feeItems, 0);
  objc_storeStrong((id *)&self->_totalFeeAmount, 0);
}

@end
