@implementation PKAccountWebServiceVirtualCardResponse

- (PKAccountWebServiceVirtualCardResponse)initWithData:(id)a3
{
  PKAccountWebServiceVirtualCardResponse *v3;
  PKAccountWebServiceVirtualCardResponse *v4;
  void *v5;
  id v6;
  PKVirtualCard *v7;
  NSObject *v8;
  uint64_t v9;
  PKVirtualCard *virtualCard;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKAccountWebServiceVirtualCardResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = [PKVirtualCard alloc];
      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("virtualCard"));
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = -[PKVirtualCard initWithDictionary:](v7, "initWithDictionary:", v8);
      virtualCard = v4->_virtualCard;
      v4->_virtualCard = (PKVirtualCard *)v9;

    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2114;
        v20 = v14;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (PKVirtualCard)virtualCard
{
  return self->_virtualCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualCard, 0);
}

@end
