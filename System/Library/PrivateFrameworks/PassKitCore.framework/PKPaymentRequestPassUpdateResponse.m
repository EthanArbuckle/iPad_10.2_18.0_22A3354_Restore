@implementation PKPaymentRequestPassUpdateResponse

- (PKPaymentRequestPassUpdateResponse)initWithData:(id)a3
{
  PKPaymentRequestPassUpdateResponse *v3;
  PKPaymentRequestPassUpdateResponse *v4;
  void *v5;
  uint64_t v6;
  NSString *passURL;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentRequestPassUpdateResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v17, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("passURL"));
      v6 = objc_claimAutoreleasedReturnValue();
      passURL = v4->_passURL;
      v4->_passURL = (NSString *)v6;

      objc_msgSend(v5, "PKStringForKey:", CFSTR("appletState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("upgradePending")) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        v15 = objc_msgSend(v8, "isEqualToString:", CFSTR("upgradeCompleted"));
        v9 = 2;
        if (!v15)
          v9 = 0;
      }
      v4->_appletState = v9;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v19 = v12;
        v20 = 2112;
        v21 = v13;
        v14 = v13;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v8 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSString)passURL
{
  return self->_passURL;
}

- (unint64_t)appletState
{
  return self->_appletState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passURL, 0);
}

@end
