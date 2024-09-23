@implementation PKVPANPaymentCredentialResponse

- (PKVPANPaymentCredentialResponse)initWithData:(id)a3
{
  PKVPANPaymentCredentialResponse *v3;
  PKVPANPaymentCredentialResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *vpanIdentifier;
  uint64_t v9;
  NSString *expiration;
  NSObject *v11;
  PKEncryptedVPANPaymentCredentials *v12;
  PKEncryptedVPANPaymentCredentials *credentials;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PKVPANPaymentCredentialResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v19, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("virtualCard"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      vpanIdentifier = v4->_vpanIdentifier;
      v4->_vpanIdentifier = (NSString *)v7;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("expiration"));
      v9 = objc_claimAutoreleasedReturnValue();
      expiration = v4->_expiration;
      v4->_expiration = (NSString *)v9;

      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("credentials"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = -[PKEncryptedVPANPaymentCredentials initWithDictionary:]([PKEncryptedVPANPaymentCredentials alloc], "initWithDictionary:", v11);
      credentials = v4->_credentials;
      v4->_credentials = v12;

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        v17 = v16;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v6 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSString)vpanIdentifier
{
  return self->_vpanIdentifier;
}

- (NSString)expiration
{
  return self->_expiration;
}

- (PKEncryptedVPANPaymentCredentials)credentials
{
  return self->_credentials;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_vpanIdentifier, 0);
}

@end
