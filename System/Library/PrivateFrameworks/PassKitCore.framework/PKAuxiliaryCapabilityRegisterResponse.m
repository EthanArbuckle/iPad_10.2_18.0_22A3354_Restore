@implementation PKAuxiliaryCapabilityRegisterResponse

- (PKAuxiliaryCapabilityRegisterResponse)initWithData:(id)a3
{
  PKAuxiliaryCapabilityRegisterResponse *v3;
  PKAuxiliaryCapabilityRegisterResponse *v4;
  void *v5;
  uint64_t v6;
  NSArray *deviceSignatureCertificateChain;
  uint64_t v8;
  NSArray *deviceDecryptionCertificateChain;
  uint64_t v10;
  NSArray *serverDecryptionCertificateChain;
  uint64_t v12;
  void *serverSignatureCertificateChain;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PKAuxiliaryCapabilityRegisterResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v20, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PKAuxiliaryCapabilityRegisterResponse _retrieveCertificateChainFromJSONObject:withParameterName:](v4, "_retrieveCertificateChainFromJSONObject:withParameterName:", v5, CFSTR("deviceSignatureCertificateChain"));
        v6 = objc_claimAutoreleasedReturnValue();
        deviceSignatureCertificateChain = v4->_deviceSignatureCertificateChain;
        v4->_deviceSignatureCertificateChain = (NSArray *)v6;

        -[PKAuxiliaryCapabilityRegisterResponse _retrieveCertificateChainFromJSONObject:withParameterName:](v4, "_retrieveCertificateChainFromJSONObject:withParameterName:", v5, CFSTR("deviceDecryptionCertificateChain"));
        v8 = objc_claimAutoreleasedReturnValue();
        deviceDecryptionCertificateChain = v4->_deviceDecryptionCertificateChain;
        v4->_deviceDecryptionCertificateChain = (NSArray *)v8;

        -[PKAuxiliaryCapabilityRegisterResponse _retrieveCertificateChainFromJSONObject:withParameterName:](v4, "_retrieveCertificateChainFromJSONObject:withParameterName:", v5, CFSTR("serverDecryptionCertificateChain"));
        v10 = objc_claimAutoreleasedReturnValue();
        serverDecryptionCertificateChain = v4->_serverDecryptionCertificateChain;
        v4->_serverDecryptionCertificateChain = (NSArray *)v10;

        -[PKAuxiliaryCapabilityRegisterResponse _retrieveCertificateChainFromJSONObject:withParameterName:](v4, "_retrieveCertificateChainFromJSONObject:withParameterName:", v5, CFSTR("serverSignatureCertificateChain"));
        v12 = objc_claimAutoreleasedReturnValue();
        serverSignatureCertificateChain = v4->_serverSignatureCertificateChain;
        v4->_serverSignatureCertificateChain = (NSArray *)v12;
      }
      else
      {
        PKLogFacilityTypeGetObject(0x1CuLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v22 = v16;
          v23 = 2114;
          v24 = v18;
          _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

        }
        serverSignatureCertificateChain = v4;
        v4 = 0;
      }

    }
  }
  return v4;
}

- (id)_retrieveCertificateChainFromJSONObject:(id)a3 withParameterName:(id)a4
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (v12 = objc_alloc(MEMORY[0x1E0C99D50]),
                (v13 = objc_msgSend(v12, "initWithBase64EncodedString:options:", v11, 0, (_QWORD)v17)) == 0))
          {

            v15 = 0;
            goto LABEL_14;
          }
          v14 = (void *)v13;
          objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }

    v15 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v15 = 0;
    v5 = 0;
  }
LABEL_14:

  return v15;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

- (NSArray)deviceSignatureCertificateChain
{
  return self->_deviceSignatureCertificateChain;
}

- (void)setDeviceSignatureCertificateChain:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSignatureCertificateChain, a3);
}

- (NSArray)deviceDecryptionCertificateChain
{
  return self->_deviceDecryptionCertificateChain;
}

- (void)setDeviceDecryptionCertificateChain:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDecryptionCertificateChain, a3);
}

- (NSArray)serverDecryptionCertificateChain
{
  return self->_serverDecryptionCertificateChain;
}

- (void)setServerDecryptionCertificateChain:(id)a3
{
  objc_storeStrong((id *)&self->_serverDecryptionCertificateChain, a3);
}

- (NSArray)serverSignatureCertificateChain
{
  return self->_serverSignatureCertificateChain;
}

- (void)setServerSignatureCertificateChain:(id)a3
{
  objc_storeStrong((id *)&self->_serverSignatureCertificateChain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSignatureCertificateChain, 0);
  objc_storeStrong((id *)&self->_serverDecryptionCertificateChain, 0);
  objc_storeStrong((id *)&self->_deviceDecryptionCertificateChain, 0);
  objc_storeStrong((id *)&self->_deviceSignatureCertificateChain, 0);
}

@end
