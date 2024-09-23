@implementation PKPaymentOfferInstallmentInterestDetails

- (PKPaymentOfferInstallmentInterestDetails)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentInterestDetails *v5;
  uint64_t v6;
  PKCurrencyAmount *totalInterestAmount;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PKPaymentOfferInstallmentInterestDetailItem *v16;
  PKPaymentOfferInstallmentInterestDetailItem *v17;
  uint64_t v18;
  NSArray *interestItems;
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
  v25.super_class = (Class)PKPaymentOfferInstallmentInterestDetails;
  v5 = -[PKPaymentOfferInstallmentInterestDetails init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalInterestAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    totalInterestAmount = v5->_totalInterestAmount;
    v5->_totalInterestAmount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("interest"));
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
          v16 = [PKPaymentOfferInstallmentInterestDetailItem alloc];
          v17 = -[PKPaymentOfferInstallmentInterestDetailItem initWithDictionary:](v16, "initWithDictionary:", v15, (_QWORD)v21);
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
      interestItems = v5->_interestItems;
      v5->_interestItems = (NSArray *)v18;
    }
    else
    {
      interestItems = v5->_interestItems;
      v5->_interestItems = 0;
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
  -[PKCurrencyAmount dictionaryRepresentation](self->_totalInterestAmount, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("totalInterestAmount"));

  v5 = -[NSArray pk_createArrayBySafelyApplyingBlock:](self->_interestItems, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_26);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("interest"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

uint64_t __68__PKPaymentOfferInstallmentInterestDetails_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferInstallmentInterestDetails *v4;
  PKPaymentOfferInstallmentInterestDetails *v5;
  PKPaymentOfferInstallmentInterestDetails *v6;
  PKCurrencyAmount *totalInterestAmount;
  PKCurrencyAmount *v8;
  NSArray *interestItems;
  NSArray *v10;
  char v11;

  v4 = (PKPaymentOfferInstallmentInterestDetails *)a3;
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
        totalInterestAmount = self->_totalInterestAmount;
        v8 = v6->_totalInterestAmount;
        if (totalInterestAmount && v8)
        {
          if (-[PKCurrencyAmount isEqual:](totalInterestAmount, "isEqual:"))
          {
LABEL_7:
            interestItems = self->_interestItems;
            v10 = v6->_interestItems;
            if (interestItems && v10)
              v11 = -[NSArray isEqual:](interestItems, "isEqual:");
            else
              v11 = interestItems == v10;
            goto LABEL_15;
          }
        }
        else if (totalInterestAmount == v8)
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
  objc_msgSend(v3, "safelyAddObject:", self->_totalInterestAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_interestItems);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalInterestAmount: '%@'; "), self->_totalInterestAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("interestItems: '%@'; "), self->_interestItems);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentInterestDetails)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentInterestDetails *v5;
  uint64_t v6;
  PKCurrencyAmount *totalInterestAmount;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *interestItems;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentOfferInstallmentInterestDetails;
  v5 = -[PKPaymentOfferInstallmentInterestDetails init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalInterestAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    totalInterestAmount = v5->_totalInterestAmount;
    v5->_totalInterestAmount = (PKCurrencyAmount *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("interest"));
    v11 = objc_claimAutoreleasedReturnValue();
    interestItems = v5->_interestItems;
    v5->_interestItems = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKCurrencyAmount *totalInterestAmount;
  id v5;

  totalInterestAmount = self->_totalInterestAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", totalInterestAmount, CFSTR("totalInterestAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interestItems, CFSTR("interest"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferInstallmentInterestDetails *v5;
  PKCurrencyAmount *v6;
  PKCurrencyAmount *totalInterestAmount;
  uint64_t v8;
  NSArray *interestItems;

  v5 = -[PKPaymentOfferInstallmentInterestDetails init](+[PKPaymentOfferInstallmentInterestDetails allocWithZone:](PKPaymentOfferInstallmentInterestDetails, "allocWithZone:"), "init");
  v6 = -[PKCurrencyAmount copyWithZone:](self->_totalInterestAmount, "copyWithZone:", a3);
  totalInterestAmount = v5->_totalInterestAmount;
  v5->_totalInterestAmount = v6;

  v8 = -[NSArray copyWithZone:](self->_interestItems, "copyWithZone:", a3);
  interestItems = v5->_interestItems;
  v5->_interestItems = (NSArray *)v8;

  return v5;
}

- (PKCurrencyAmount)totalInterestAmount
{
  return self->_totalInterestAmount;
}

- (NSArray)interestItems
{
  return self->_interestItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestItems, 0);
  objc_storeStrong((id *)&self->_totalInterestAmount, 0);
}

@end
