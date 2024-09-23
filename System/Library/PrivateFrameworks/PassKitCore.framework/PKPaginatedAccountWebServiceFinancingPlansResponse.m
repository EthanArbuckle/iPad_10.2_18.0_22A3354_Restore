@implementation PKPaginatedAccountWebServiceFinancingPlansResponse

- (PKPaginatedAccountWebServiceFinancingPlansResponse)initWithData:(id)a3
{
  PKPaginatedAccountWebServiceFinancingPlansResponse *v3;
  PKPaginatedAccountWebServiceFinancingPlansResponse *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKPayLaterFinancingPlan *v14;
  PKPayLaterFinancingPlan *v15;
  uint64_t v16;
  NSArray *financingPlans;
  void *v18;
  PKAccount *v19;
  PKAccount *account;
  PKPaginatedAccountWebServiceFinancingPlansResponse *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)PKPaginatedAccountWebServiceFinancingPlansResponse;
  v3 = -[PKPaginatedWebServiceResponse initWithData:](&v32, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_15:
    v21 = v4;
    goto LABEL_19;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKPaginatedWebServiceResponse rawDataList](v4, "rawDataList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v29;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v29 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v12);
            v14 = [PKPayLaterFinancingPlan alloc];
            v15 = -[PKPayLaterFinancingPlan initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v28);
            objc_msgSend(v7, "safelyAddObject:", v15);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v10);
      }

      v16 = objc_msgSend(v7, "copy");
      financingPlans = v4->_financingPlans;
      v4->_financingPlans = (NSArray *)v16;

    }
    objc_msgSend(v5, "objectForKey:", CFSTR("account"), (_QWORD)v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v19 = -[PKAccount initWithDictionary:]([PKAccount alloc], "initWithDictionary:", v18);
      account = v4->_account;
      v4->_account = v19;

    }
    goto LABEL_15;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    v36 = 2114;
    v37 = v26;
    _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v21 = 0;
LABEL_19:

  return v21;
}

- (NSArray)financingPlans
{
  return self->_financingPlans;
}

- (PKAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_financingPlans, 0);
}

@end
