@implementation PKPaymentPushProvisioningSharingIdentifiersResponse

- (PKPaymentPushProvisioningSharingIdentifiersResponse)initWithData:(id)a3
{
  PKPaymentPushProvisioningSharingIdentifiersResponse *v3;
  PKPaymentPushProvisioningSharingIdentifiersResponse *v4;
  void *v5;
  PKPaymentPushProvisioningSharingIdentifiersResponse *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PKPaymentPushProvisioningCredential *v12;
  uint64_t v13;
  NSArray *sharedCredentials;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentPushProvisioningSharingIdentifiersResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v24, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (PKPaymentPushProvisioningSharingIdentifiersResponse *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v5, "PKArrayForKey:", CFSTR("availableSharedCredentials"));
      v7 = objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            v12 = -[PKPaymentPushProvisioningCredential initWithDict:]([PKPaymentPushProvisioningCredential alloc], "initWithDict:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11));
            -[PKPaymentPushProvisioningSharingIdentifiersResponse safelyAddObject:](v6, "safelyAddObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        }
        while (v9);
      }
      v13 = -[PKPaymentPushProvisioningSharingIdentifiersResponse copy](v6, "copy");
      sharedCredentials = v4->_sharedCredentials;
      v4->_sharedCredentials = (NSArray *)v13;

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        v27 = 2112;
        v28 = v17;
        v18 = v17;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v6 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSArray)sharedCredentials
{
  return self->_sharedCredentials;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedCredentials, 0);
}

@end
