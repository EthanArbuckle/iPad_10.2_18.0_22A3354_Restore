@implementation PKAccountWebServiceEnhancedMerchantsResponse

- (PKAccountWebServiceEnhancedMerchantsResponse)initWithData:(id)a3
{
  PKAccountWebServiceEnhancedMerchantsResponse *v3;
  PKAccountWebServiceEnhancedMerchantsResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *merchants;
  void *v9;
  uint64_t v10;
  NSArray *orderings;
  uint64_t v12;
  NSDate *lastAddedDate;
  uint64_t v14;
  NSNumber *minRefreshPeriod;
  PKAccountWebServiceEnhancedMerchantsResponse *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)PKAccountWebServiceEnhancedMerchantsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v23, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("merchants"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_635);
    v7 = objc_claimAutoreleasedReturnValue();
    merchants = v4->_merchants;
    v4->_merchants = (NSArray *)v7;

    objc_msgSend(v5, "objectForKey:", CFSTR("orderings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_637_0);
    v10 = objc_claimAutoreleasedReturnValue();
    orderings = v4->_orderings;
    v4->_orderings = (NSArray *)v10;

    objc_msgSend(v5, "PKDateForKey:", CFSTR("lastAddedDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastAddedDate = v4->_lastAddedDate;
    v4->_lastAddedDate = (NSDate *)v12;

    objc_msgSend(v5, "PKNumberForKey:", CFSTR("minRefreshPeriod"));
    v14 = objc_claimAutoreleasedReturnValue();
    minRefreshPeriod = v4->_minRefreshPeriod;
    v4->_minRefreshPeriod = (NSNumber *)v14;

LABEL_4:
    v16 = v4;
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2114;
    v27 = v21;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v16 = 0;
LABEL_8:

  return v16;
}

PKAccountEnhancedMerchant *__61__PKAccountWebServiceEnhancedMerchantsResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKAccountEnhancedMerchant *v3;

  v2 = a2;
  v3 = -[PKAccountEnhancedMerchant initWithDictionary:]([PKAccountEnhancedMerchant alloc], "initWithDictionary:", v2);

  return v3;
}

PKAccountEntityOrdering *__61__PKAccountWebServiceEnhancedMerchantsResponse_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKAccountEntityOrdering *v3;

  v2 = a2;
  v3 = -[PKAccountEntityOrdering initWithType:dictionary:]([PKAccountEntityOrdering alloc], "initWithType:dictionary:", 1, v2);

  return v3;
}

- (NSArray)merchants
{
  return self->_merchants;
}

- (NSArray)orderings
{
  return self->_orderings;
}

- (NSDate)lastAddedDate
{
  return self->_lastAddedDate;
}

- (NSNumber)minRefreshPeriod
{
  return self->_minRefreshPeriod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minRefreshPeriod, 0);
  objc_storeStrong((id *)&self->_lastAddedDate, 0);
  objc_storeStrong((id *)&self->_orderings, 0);
  objc_storeStrong((id *)&self->_merchants, 0);
}

@end
