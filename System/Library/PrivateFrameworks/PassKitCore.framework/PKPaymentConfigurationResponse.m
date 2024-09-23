@implementation PKPaymentConfigurationResponse

- (PKPaymentConfigurationResponse)initWithData:(id)a3
{
  PKPaymentConfigurationResponse *v3;
  PKPaymentConfigurationResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSData *data;
  NSObject *v9;
  uint64_t v10;
  NSData *signature;
  uint64_t v12;
  NSString *version;
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
  v19.super_class = (Class)PKPaymentConfigurationResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v19, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("data"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
        data = v4->_data;
        v4->_data = (NSData *)v7;

      }
      objc_msgSend(v5, "objectForKey:", CFSTR("signature"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
        signature = v4->_signature;
        v4->_signature = (NSData *)v10;

      }
      objc_msgSend(v5, "objectForKey:", CFSTR("version"));
      v12 = objc_claimAutoreleasedReturnValue();
      version = v4->_version;
      v4->_version = (NSString *)v12;

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
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
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v6 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)version
{
  return self->_version;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
