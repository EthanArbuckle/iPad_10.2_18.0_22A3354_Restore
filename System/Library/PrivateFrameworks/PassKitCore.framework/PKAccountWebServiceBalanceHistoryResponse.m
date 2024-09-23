@implementation PKAccountWebServiceBalanceHistoryResponse

- (PKAccountWebServiceBalanceHistoryResponse)initWithData:(id)a3
{
  PKAccountWebServiceBalanceHistoryResponse *v3;
  PKAccountWebServiceBalanceHistoryResponse *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  PKAccountHistoricalBalance *v16;
  uint64_t v17;
  NSArray *balances;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PKAccountWebServiceBalanceHistoryResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v26, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20 = v5;
      v6 = v5;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "PKDecimalNumberFromStringForKey:", CFSTR("balance"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "PKDateForKey:", CFSTR("date"));
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = (void *)v13;
              if (v12)
                v15 = v13 == 0;
              else
                v15 = 1;
              if (!v15)
              {
                v16 = -[PKAccountHistoricalBalance initWithBalance:date:]([PKAccountHistoricalBalance alloc], "initWithBalance:date:", v12, v13);
                objc_msgSend(v21, "addObject:", v16);

              }
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v8);
      }
      v17 = objc_msgSend(v21, "copy");
      balances = v4->_balances;
      v4->_balances = (NSArray *)v17;

      v5 = v20;
    }

  }
  return v4;
}

- (NSArray)balances
{
  return self->_balances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balances, 0);
}

@end
