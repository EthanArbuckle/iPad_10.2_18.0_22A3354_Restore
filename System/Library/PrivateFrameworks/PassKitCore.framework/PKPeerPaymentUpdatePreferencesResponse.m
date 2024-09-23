@implementation PKPeerPaymentUpdatePreferencesResponse

- (PKPeerPaymentUpdatePreferencesResponse)initWithData:(id)a3
{
  PKPeerPaymentUpdatePreferencesResponse *v3;
  PKPeerPaymentUpdatePreferencesResponse *v4;
  void *v5;
  id v6;
  PKPeerPaymentPreferences *v7;
  NSObject *v8;
  uint64_t v9;
  PKPeerPaymentPreferences *peerPaymentPreferences;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentUpdatePreferencesResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = [PKPeerPaymentPreferences alloc];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = -[PKPeerPaymentPreferences initWithDictionary:lastUpdated:](v7, "initWithDictionary:lastUpdated:", v6, v8);

      peerPaymentPreferences = v4->_peerPaymentPreferences;
      v4->_peerPaymentPreferences = (PKPeerPaymentPreferences *)v9;

    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2114;
        v20 = v14;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (PKPeerPaymentPreferences)peerPaymentPreferences
{
  return self->_peerPaymentPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentPreferences, 0);
}

@end
