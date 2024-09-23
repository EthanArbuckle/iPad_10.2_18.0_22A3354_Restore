@implementation PKPaymentAugmentBaseResponse

- (PKPaymentAugmentBaseResponse)initWithData:(id)a3
{
  PKPaymentAugmentBaseResponse *v3;
  PKPaymentAugmentBaseResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSData *networkMerchantIdentifier;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentAugmentBaseResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("networkMerchantIdentifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pk_decodeHexadecimal");
      v7 = objc_claimAutoreleasedReturnValue();
      networkMerchantIdentifier = v4->_networkMerchantIdentifier;
      v4->_networkMerchantIdentifier = (NSData *)v7;

      objc_msgSend(v5, "objectForKey:", CFSTR("cryptogramType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_cryptogramType = PKPaymentCryptogramTypeFromString(v9);
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        v14 = v13;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v9 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSData)networkMerchantIdentifier
{
  return self->_networkMerchantIdentifier;
}

- (int64_t)cryptogramType
{
  return self->_cryptogramType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMerchantIdentifier, 0);
}

@end
