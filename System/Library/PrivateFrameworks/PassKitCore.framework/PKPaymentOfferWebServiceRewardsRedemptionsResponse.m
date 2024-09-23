@implementation PKPaymentOfferWebServiceRewardsRedemptionsResponse

- (PKPaymentOfferWebServiceRewardsRedemptionsResponse)initWithData:(id)a3
{
  PKPaymentOfferWebServiceRewardsRedemptionsResponse *v3;
  PKPaymentOfferWebServiceRewardsRedemptionsResponse *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  PKPaymentRewardsRedemption *v14;
  PKPaymentRewardsRedemption *v15;
  uint64_t v16;
  NSDate *lastUpdated;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  PKPaymentOfferWebServiceRewardsRedemptionsResponse *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)PKPaymentOfferWebServiceRewardsRedemptionsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v31, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_19:
    v25 = v4;
    goto LABEL_20;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("rewardsRedemptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v14 = [PKPaymentRewardsRedemption alloc];
          v15 = -[PKPaymentRewardsRedemption initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v27);
          objc_msgSend(v7, "safelyAddObject:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }

    v4->_moreComing = objc_msgSend(v5, "PKBoolForKey:", CFSTR("moreComing"));
    objc_msgSend(v5, "PKDateForKey:", CFSTR("lastUpdated"));
    v16 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v4->_lastUpdated;
    v4->_lastUpdated = (NSDate *)v16;

    v18 = objc_msgSend(v7, "count");
    if (v18)
      v19 = (void *)objc_msgSend(v7, "copy");
    else
      v19 = 0;
    objc_storeStrong((id *)&v4->_rewardsRedemptions, v19);
    if (v18)

    goto LABEL_19;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v22;
    v35 = 2114;
    v36 = v24;
    _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v25 = 0;
LABEL_20:

  return v25;
}

- (NSArray)rewardsRedemptions
{
  return self->_rewardsRedemptions;
}

- (void)setRewardsRedemptions:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsRedemptions, a3);
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_rewardsRedemptions, 0);
}

@end
