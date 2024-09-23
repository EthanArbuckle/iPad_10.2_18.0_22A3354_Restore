@implementation PKPeerPaymentBankLookupResponse

- (PKPeerPaymentBankLookupResponse)initWithData:(id)a3
{
  PKPeerPaymentBankLookupResponse *v3;
  PKPeerPaymentBankLookupResponse *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *displayName;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentBankLookupResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v14, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v4->_success = objc_msgSend(v6, "PKBoolForKey:", CFSTR("success"));
      objc_msgSend(v6, "PKStringForKey:", CFSTR("displayName"));
      v7 = objc_claimAutoreleasedReturnValue();

      displayName = v4->_displayName;
      v4->_displayName = (NSString *)v7;
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      displayName = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(displayName, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v10;
        v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_18FC92000, displayName, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (BOOL)success
{
  return self->_success;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
