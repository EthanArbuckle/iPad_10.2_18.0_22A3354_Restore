@implementation PKPaymentNotificationActionResponse

- (PKPaymentNotificationActionResponse)initWithData:(id)a3
{
  PKPaymentNotificationActionResponse *v3;
  PKPaymentNotificationActionResponse *v4;
  void *v5;
  uint64_t v6;
  NSString *requestID;
  uint64_t v8;
  NSDictionary *aps;
  uint64_t v10;
  PKPaymentNotificationActionResponse *action;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentNotificationActionResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v18, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("requestId"));
      v6 = objc_claimAutoreleasedReturnValue();
      requestID = v4->_requestID;
      v4->_requestID = (NSString *)v6;

      objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("aps"));
      v8 = objc_claimAutoreleasedReturnValue();
      aps = v4->_aps;
      v4->_aps = (NSDictionary *)v8;

      objc_msgSend(v5, "PKStringForKey:", CFSTR("action"));
      v10 = objc_claimAutoreleasedReturnValue();
      action = (PKPaymentNotificationActionResponse *)v4->_action;
      v4->_action = (NSString *)v10;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        v21 = 2112;
        v22 = v15;
        v16 = v15;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      action = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSDictionary)aps
{
  return self->_aps;
}

- (NSString)action
{
  return self->_action;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_aps, 0);
}

@end
