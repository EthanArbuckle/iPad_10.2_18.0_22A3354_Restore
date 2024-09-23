@implementation PKPaymentRemoteCredentialsResponse

- (PKPaymentRemoteCredentialsResponse)initWithData:(id)a3
{
  PKPaymentRemoteCredentialsResponse *v3;
  PKPaymentRemoteCredentialsResponse *v4;
  void *v5;
  PKPaymentRemoteCredentialsResponse *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PKPaymentRemoteCredential *v13;
  PKPaymentRemoteCredential *v14;
  uint64_t v15;
  NSObject *p_super;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentRemoteCredentialsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v26, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (PKPaymentRemoteCredentialsResponse *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
            v13 = [PKPaymentRemoteCredential alloc];
            v14 = -[PKPaymentRemoteCredential initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v22);
            if (v14)
              -[PKPaymentRemoteCredentialsResponse addObject:](v6, "addObject:", v14);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        }
        while (v9);
      }

      v15 = -[PKPaymentRemoteCredentialsResponse copy](v6, "copy");
      p_super = &v4->_credentials->super;
      v4->_credentials = (NSArray *)v15;
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
        v28 = v18;
        v29 = 2112;
        v30 = v19;
        v20 = v19;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v6 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSArray)credentials
{
  return self->_credentials;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
