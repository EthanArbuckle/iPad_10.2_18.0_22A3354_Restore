@implementation PKPaymentTapToProvisionConfigurationResponse

- (PKPaymentTapToProvisionConfigurationResponse)initWithData:(id)a3
{
  PKPaymentTapToProvisionConfigurationResponse *v3;
  PKPaymentTapToProvisionConfigurationResponse *v4;
  void *v5;
  PKPaymentTapToProvisionConfigurationResponse *v6;
  void *v7;
  uint64_t v8;
  NSData *nonce;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *p_super;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentTapToProvisionConfigurationResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v21, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[PKPaymentTapToProvisionConfigurationResponse PKStringForKey:](v6, "PKStringForKey:", CFSTR("nonce"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pk_decodeHexadecimal");
      v8 = objc_claimAutoreleasedReturnValue();
      nonce = v4->_nonce;
      v4->_nonce = (NSData *)v8;

      -[PKPaymentTapToProvisionConfigurationResponse PKNumberForKey:](v6, "PKNumberForKey:", CFSTR("countryCode"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_countryCode = objc_msgSend(v10, "integerValue");

      -[PKPaymentTapToProvisionConfigurationResponse PKNumberForKey:](v6, "PKNumberForKey:", CFSTR("currencyCode"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_currencyCode = objc_msgSend(v11, "integerValue");

      if (v4->_nonce && v4->_countryCode && v4->_currencyCode)
        goto LABEL_13;
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v23 = v13;
        v14 = v13;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Malformed response: missing required fields inside %@", buf, 0xCu);

      }
      p_super = &v4->super.super.super;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v23 = v17;
        v24 = 2112;
        v25 = v18;
        v19 = v18;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v6 = v4;
    }

    v4 = 0;
LABEL_13:

  }
  return v4;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (int64_t)countryCode
{
  return self->_countryCode;
}

- (int64_t)currencyCode
{
  return self->_currencyCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end
