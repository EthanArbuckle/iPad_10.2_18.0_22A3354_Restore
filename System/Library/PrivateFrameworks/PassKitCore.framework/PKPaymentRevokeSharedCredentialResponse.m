@implementation PKPaymentRevokeSharedCredentialResponse

- (PKPaymentRevokeSharedCredentialResponse)initWithData:(id)a3
{
  PKPaymentRevokeSharedCredentialResponse *v3;
  PKPaymentRevokeSharedCredentialResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *p_super;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentRevokeSharedCredentialResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v15, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v5, "PKStringForKey:", CFSTR("passURL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLWithString:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      p_super = &v4->_passURL->super;
      v4->_passURL = (NSURL *)v8;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        v13 = v12;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v7 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passURL, 0);
}

@end
