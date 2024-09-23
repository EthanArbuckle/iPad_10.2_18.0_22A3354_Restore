@implementation PKAccountWebServiceFundingSourcesResponse

- (PKAccountWebServiceFundingSourcesResponse)initWithData:(id)a3
{
  PKAccountWebServiceFundingSourcesResponse *v3;
  PKAccountWebServiceFundingSourcesResponse *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  PKAccountPaymentFundingSource *v14;
  PKAccountPaymentFundingSource *v15;
  NSArray *fundingSources;
  PKAccountWebServiceFundingSourcesResponse *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)PKAccountWebServiceFundingSourcesResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v28, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_11:
    v17 = v4;
    goto LABEL_15;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKArrayForKey:", CFSTR("fundingSources"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v12);
          v14 = [PKAccountPaymentFundingSource alloc];
          v15 = -[PKAccountPaymentFundingSource initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v24);
          -[NSArray safelyAddObject:](v7, "safelyAddObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

    fundingSources = v4->_fundingSources;
    v4->_fundingSources = v7;

    goto LABEL_11;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
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
    v31 = v20;
    v32 = 2114;
    v33 = v22;
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (NSArray)fundingSources
{
  return self->_fundingSources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSources, 0);
}

@end
