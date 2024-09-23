@implementation PKPaymentIssuerProvisioningCertificatesResponse

- (PKPaymentIssuerProvisioningCertificatesResponse)initWithData:(id)a3
{
  PKPaymentIssuerProvisioningCertificatesResponse *v3;
  PKPaymentIssuerProvisioningCertificatesResponse *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *certificates;
  void *v17;
  uint64_t v18;
  NSData *nonce;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentIssuerProvisioningCertificatesResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v29, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("certificates"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nonce"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || !v7)
        {
          v24 = v7;
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v6 = v6;
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v26;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v26 != v11)
                  objc_enumerationMutation(v6);
                v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v13, 0);
                  if (v14)
                    objc_msgSend(v8, "addObject:", v14);

                }
                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
            }
            while (v10);
          }

          if (objc_msgSend(v8, "count"))
          {
            v15 = objc_msgSend(v8, "copy");
            certificates = v4->_certificates;
            v4->_certificates = (NSArray *)v15;

          }
          v7 = v24;
          objc_msgSend(v24, "pk_decodeHexadecimal");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "copy");
          nonce = v4->_nonce;
          v4->_nonce = (NSData *)v18;

        }
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
      v6 = 0;
    }
    if (!v4->_certificates || !v4->_nonce)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v22;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@.", buf, 0xCu);

      }
      v4 = 0;
    }

  }
  return v4;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)nonceSignature
{
  return self->_nonceSignature;
}

- (void)setNonceSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonceSignature, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end
