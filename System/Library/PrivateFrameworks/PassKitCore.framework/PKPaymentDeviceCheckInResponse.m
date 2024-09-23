@implementation PKPaymentDeviceCheckInResponse

- (PKPaymentDeviceCheckInResponse)initWithData:(id)a3
{
  PKPaymentDeviceCheckInResponse *v3;
  PKPaymentDeviceCheckInResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  PKPaymentDeviceCheckInResponse *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentDeviceCheckInResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_21;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKStringForKey:", CFSTR("deviceAction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("updateConfig")) & 1) != 0)
      {
        v8 = 1;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("updateRegistration")) & 1) != 0)
      {
        v8 = 2;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("reRegister")) & 1) != 0)
      {
        v8 = 3;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("checkInRequiresAuth")) & 1) != 0)
      {
        v8 = 4;
      }
      else
      {
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("reRegisterPeerPayment")) & 1) == 0)
        {
LABEL_20:

LABEL_21:
          v14 = v4;
          goto LABEL_22;
        }
        v8 = 5;
      }
      v4->_action = v8;
      goto LABEL_20;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error: Device check in did not return an action", buf, 2u);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v13 = v12;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

    }
  }

  v14 = 0;
LABEL_22:

  return v14;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

@end
