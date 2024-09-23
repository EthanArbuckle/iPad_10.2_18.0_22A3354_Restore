@implementation PKPaymentCheckMerchantResponse

- (PKPaymentCheckMerchantResponse)initWithData:(id)a3
{
  PKPaymentCheckMerchantResponse *v3;
  PKPaymentCheckMerchantResponse *v4;
  void *v5;
  PKPaymentCheckMerchantResponse *v6;
  PKPaymentCheckMerchantResponse *v7;
  NSObject *v8;
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
  v15.super_class = (Class)PKPaymentCheckMerchantResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v15, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("registered"));
      v6 = (PKPaymentCheckMerchantResponse *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v4->_isRegistered = -[PKPaymentCheckMerchantResponse BOOLValue](v6, "BOOLValue");
      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Malformed PKPaymentCheckMerchantResponse: expected registered element, none found", buf, 2u);
        }

      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
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
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v7 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)isRegistered
{
  return self->_isRegistered;
}

@end
