@implementation PKAccountWebServiceAccountResponse

- (PKAccountWebServiceAccountResponse)initWithData:(id)a3
{
  PKAccountWebServiceAccountResponse *v3;
  PKAccountWebServiceAccountResponse *v4;
  void *v5;
  PKAccount *v6;
  PKAccount *account;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSArray *physicalCards;
  PKAccountWebServiceAccountResponse *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKAccountWebServiceAccountResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v18, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

    }
    goto LABEL_9;
  }
  v6 = -[PKAccount initWithDictionary:]([PKAccount alloc], "initWithDictionary:", v5);
  account = v4->_account;
  v4->_account = v6;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extendedAccountDetails"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
  }
  -[NSObject PKArrayContaining:forKey:](v8, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("physicalCards"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pk_arrayByApplyingBlock:", &__block_literal_global_102);
  v10 = objc_claimAutoreleasedReturnValue();
  physicalCards = v4->_physicalCards;
  v4->_physicalCards = (NSArray *)v10;

LABEL_6:
  v12 = v4;
LABEL_10:

  return v12;
}

PKPhysicalCard *__51__PKAccountWebServiceAccountResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPhysicalCard *v3;

  v2 = a2;
  v3 = -[PKPhysicalCard initWithDictionary:]([PKPhysicalCard alloc], "initWithDictionary:", v2);

  return v3;
}

- (PKAccount)account
{
  return self->_account;
}

- (NSArray)physicalCards
{
  return self->_physicalCards;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
