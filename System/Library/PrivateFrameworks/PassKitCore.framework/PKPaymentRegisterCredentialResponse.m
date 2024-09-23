@implementation PKPaymentRegisterCredentialResponse

- (PKPaymentRegisterCredentialResponse)initWithData:(id)a3
{
  PKPaymentRegisterCredentialResponse *v3;
  PKPaymentRegisterCredentialResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *passURL;
  void *v10;
  uint64_t v11;
  NSData *credentialAttestation;
  void *v13;
  void *v14;
  PKPaymentRegisterCredentialResponse *v15;
  NSObject *p_super;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  PKPaymentRegisterCredentialResponse *v21;
  PKSubcredentialEncryptedContainer *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentRegisterCredentialResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v24, sel_initWithData_, a3);
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
      passURL = v4->_passURL;
      v4->_passURL = (NSURL *)v8;

      if (v4->_passURL)
      {
        objc_msgSend(v5, "PKStringForKey:", CFSTR("ktsSignature"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pk_decodeHexadecimal");
        v11 = objc_claimAutoreleasedReturnValue();
        credentialAttestation = v4->_credentialAttestation;
        v4->_credentialAttestation = (NSData *)v11;

        objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("vehicleMobilizationData"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("keyData"));
          v15 = (PKPaymentRegisterCredentialResponse *)objc_claimAutoreleasedReturnValue();
        }
        v21 = v15;

        v22 = -[PKSubcredentialEncryptedContainer initWithDictionary:]([PKSubcredentialEncryptedContainer alloc], "initWithDictionary:", v21);
        p_super = &v4->_vehicleMobilizationEncryptedContainer->super;
        v4->_vehicleMobilizationEncryptedContainer = v22;
        goto LABEL_13;
      }
      PKLogFacilityTypeGetObject(6uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: Response missing pass url", buf, 2u);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v26 = v18;
        v27 = 2112;
        v28 = v19;
        v20 = v19;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
    }
    v21 = v4;
    v4 = 0;
LABEL_13:

  }
  return v4;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (NSData)credentialAttestation
{
  return self->_credentialAttestation;
}

- (PKSubcredentialEncryptedContainer)vehicleMobilizationEncryptedContainer
{
  return self->_vehicleMobilizationEncryptedContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleMobilizationEncryptedContainer, 0);
  objc_storeStrong((id *)&self->_credentialAttestation, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
}

@end
