@implementation PKPaymentAccountAttesationResponse

- (PKPaymentAccountAttesationResponse)initWithData:(id)a3
{
  PKPaymentAccountAttesationResponse *v3;
  PKPaymentAccountAttesationResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *p_super;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentAccountAttesationResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v14, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("attestation"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pk_decodeHexadecimal");
      v7 = objc_claimAutoreleasedReturnValue();
      p_super = &v4->_attestation->super;
      v4->_attestation = (NSData *)v7;
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
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v12 = v11;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v6 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSData)attestation
{
  return self->_attestation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestation, 0);
}

@end
