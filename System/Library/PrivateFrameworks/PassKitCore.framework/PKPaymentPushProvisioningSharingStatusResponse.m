@implementation PKPaymentPushProvisioningSharingStatusResponse

- (PKPaymentPushProvisioningSharingStatusResponse)initWithData:(id)a3
{
  PKPaymentPushProvisioningSharingStatusResponse *v3;
  PKPaymentPushProvisioningSharingStatusResponse *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentPushProvisioningSharingStatusResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v13, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("status"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4->_sharingStatus = PKPushProvisioningSharingStatusFromString(v6);
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        v11 = v10;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v6 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (unint64_t)sharingStatus
{
  return self->_sharingStatus;
}

@end
