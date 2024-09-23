@implementation PKAccountWebServicePromotionsResponse

- (PKAccountWebServicePromotionsResponse)initWithData:(id)a3
{
  PKAccountWebServicePromotionsResponse *v3;
  PKAccountWebServicePromotionsResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *promotions;
  void *v9;
  uint64_t v10;
  NSArray *orderings;
  uint64_t v12;
  NSDate *lastAddedDate;
  uint64_t v14;
  NSNumber *minRefreshPeriod;
  uint64_t v16;
  NSNumber *maxImpressionCount;
  uint64_t v18;
  NSNumber *timeVisibleAfterCompleted;
  PKAccountWebServicePromotionsResponse *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)PKAccountWebServicePromotionsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v27, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("promotions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_591);
    v7 = objc_claimAutoreleasedReturnValue();
    promotions = v4->_promotions;
    v4->_promotions = (NSArray *)v7;

    objc_msgSend(v5, "objectForKey:", CFSTR("orderings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_595);
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

    objc_msgSend(v5, "PKNumberForKey:", CFSTR("maxImpressionCount"));
    v16 = objc_claimAutoreleasedReturnValue();
    maxImpressionCount = v4->_maxImpressionCount;
    v4->_maxImpressionCount = (NSNumber *)v16;

    objc_msgSend(v5, "PKNumberForKey:", CFSTR("timeVisibleAfterCompleted"));
    v18 = objc_claimAutoreleasedReturnValue();
    timeVisibleAfterCompleted = v4->_timeVisibleAfterCompleted;
    v4->_timeVisibleAfterCompleted = (NSNumber *)v18;

LABEL_4:
    v20 = v4;
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    v30 = 2114;
    v31 = v25;
    _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v20 = 0;
LABEL_8:

  return v20;
}

PKAccountPromotion *__54__PKAccountWebServicePromotionsResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKAccountPromotion *v3;

  v2 = a2;
  v3 = -[PKAccountPromotion initWithDictionary:]([PKAccountPromotion alloc], "initWithDictionary:", v2);

  return v3;
}

PKAccountEntityOrdering *__54__PKAccountWebServicePromotionsResponse_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKAccountEntityOrdering *v3;

  v2 = a2;
  v3 = -[PKAccountEntityOrdering initWithType:dictionary:]([PKAccountEntityOrdering alloc], "initWithType:dictionary:", 2, v2);

  return v3;
}

- (NSArray)promotions
{
  return self->_promotions;
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

- (NSNumber)maxImpressionCount
{
  return self->_maxImpressionCount;
}

- (NSNumber)timeVisibleAfterCompleted
{
  return self->_timeVisibleAfterCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeVisibleAfterCompleted, 0);
  objc_storeStrong((id *)&self->_maxImpressionCount, 0);
  objc_storeStrong((id *)&self->_minRefreshPeriod, 0);
  objc_storeStrong((id *)&self->_lastAddedDate, 0);
  objc_storeStrong((id *)&self->_orderings, 0);
  objc_storeStrong((id *)&self->_promotions, 0);
}

@end
