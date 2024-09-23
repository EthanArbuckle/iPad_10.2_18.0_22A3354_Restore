@implementation PKPeerPaymentPerformActionResponse

- (PKPeerPaymentPerformActionResponse)initWithData:(id)a3
{
  PKPeerPaymentPerformActionResponse *v3;
  PKPeerPaymentPerformActionResponse *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentPerformActionResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v15, sel_initWithData_, a3);
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
      objc_msgSend(v6, "PKStringForKey:", CFSTR("status"));
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = PKPaymentTransactionStatusFromString(v7);
      if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2)
        v9 = -1;
      else
        v9 = v8;
      v4->_status = v9;
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        v18 = 2114;
        v19 = v13;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (BOOL)success
{
  return self->_success;
}

- (int64_t)status
{
  return self->_status;
}

@end
