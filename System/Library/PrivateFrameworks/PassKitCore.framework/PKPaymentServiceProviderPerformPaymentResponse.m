@implementation PKPaymentServiceProviderPerformPaymentResponse

- (PKPaymentServiceProviderPerformPaymentResponse)initWithData:(id)a3
{
  PKPaymentServiceProviderPerformPaymentResponse *v3;
  PKPaymentServiceProviderPerformPaymentResponse *v4;
  void *v5;
  void *v6;
  PKServiceProviderPurchase *v7;
  NSObject *p_super;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentServiceProviderPerformPaymentResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v15, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("purchase"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = -[PKServiceProviderPurchase initWithDictionary:]([PKServiceProviderPurchase alloc], "initWithDictionary:", v6);
        p_super = &v4->_purchase->super;
        v4->_purchase = v7;
LABEL_12:

        return v4;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Malformed PKPaymentServiceProviderPerformPaymentResponse: expected \"purchase\" dictionary, however we received %@", buf, 0xCu);
      }

      p_super = &v4->super.super.super;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v17 = v10;
        v18 = 2112;
        v19 = v11;
        v12 = v11;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v6 = v4;
    }
    v4 = 0;
    goto LABEL_12;
  }
  return v4;
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchase, 0);
}

@end
