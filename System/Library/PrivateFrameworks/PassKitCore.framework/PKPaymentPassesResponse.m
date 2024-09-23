@implementation PKPaymentPassesResponse

- (PKPaymentPassesResponse)initWithData:(id)a3
{
  PKPaymentPassesResponse *v3;
  PKPaymentPassesResponse *v4;
  void *v5;
  uint64_t v6;
  NSString *lastUpdatedTag;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSArray *passURLs;
  NSObject *v16;
  uint64_t v17;
  NSArray *devicePassSerialNumbers;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentPassesResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v28, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("lastUpdated"));
      v6 = objc_claimAutoreleasedReturnValue();
      lastUpdatedTag = v4->_lastUpdatedTag;
      v4->_lastUpdatedTag = (NSString *)v6;

      v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v5, "objectForKey:", CFSTR("passURLs"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              -[NSArray addObject:](v8, "addObject:", v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v11);
      }
      passURLs = v4->_passURLs;
      v4->_passURLs = v8;
      v16 = v8;

      objc_msgSend(v5, "objectForKey:", CFSTR("devicePassSerialNumbers"));
      v17 = objc_claimAutoreleasedReturnValue();
      devicePassSerialNumbers = v4->_devicePassSerialNumbers;
      v4->_devicePassSerialNumbers = (NSArray *)v17;

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v30 = v20;
        v31 = 2112;
        v32 = v21;
        v22 = v21;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v9 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSArray)passURLs
{
  return self->_passURLs;
}

- (void)setPassURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)devicePassSerialNumbers
{
  return self->_devicePassSerialNumbers;
}

- (void)setDevicePassSerialNumbers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePassSerialNumbers, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
  objc_storeStrong((id *)&self->_passURLs, 0);
}

@end
