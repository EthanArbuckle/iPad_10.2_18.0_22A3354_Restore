@implementation PKPaymentOfferWebServiceRewardsBalancesResponse

- (PKPaymentOfferWebServiceRewardsBalancesResponse)initWithData:(id)a3
{
  PKPaymentOfferWebServiceRewardsBalancesResponse *v3;
  id *p_isa;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  PKPaymentRewardsBalance *v14;
  PKPaymentRewardsBalance *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  PKPaymentOfferWebServiceRewardsBalancesResponse *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentOfferWebServiceRewardsBalancesResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v29, sel_initWithData_, a3);
  p_isa = (id *)&v3->super.super.super.super.isa;
  if (!v3)
  {
LABEL_19:
    v23 = p_isa;
    goto LABEL_20;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("rewardsBalances"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v14 = [PKPaymentRewardsBalance alloc];
          v15 = -[PKPaymentRewardsBalance initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v25);
          objc_msgSend(v7, "safelyAddObject:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v10);
    }

    v16 = objc_msgSend(v7, "count");
    if (v16)
      v17 = (void *)objc_msgSend(v7, "copy");
    else
      v17 = 0;
    objc_storeStrong(p_isa + 4, v17);
    if (v16)

    goto LABEL_19;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v20;
    v33 = 2114;
    v34 = v22;
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v23 = 0;
LABEL_20:

  return v23;
}

- (NSArray)rewardsBalances
{
  return self->_rewardsBalances;
}

- (void)setRewardsBalances:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsBalances, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsBalances, 0);
}

@end
