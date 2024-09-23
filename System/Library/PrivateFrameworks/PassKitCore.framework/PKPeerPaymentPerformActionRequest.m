@implementation PKPeerPaymentPerformActionRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *paymentIdentifier;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSString *action;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  _QWORD v23[3];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    v26 = 2082;
    v27 = "url";
LABEL_16:
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_17;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_16;
  }
  paymentIdentifier = self->_paymentIdentifier;
  if (!paymentIdentifier)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    v26 = 2082;
    v27 = "_paymentIdentifier";
    goto LABEL_16;
  }
  if (!self->_action)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2082;
      v27 = "_action";
      goto LABEL_16;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  v23[0] = CFSTR("payment");
  v23[1] = paymentIdentifier;
  v23[2] = CFSTR("performAction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, v10, 0, v8);
  v11 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v11, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v11, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  action = self->_action;
  if (action)
    objc_msgSend(v12, "setObject:forKey:", action, CFSTR("action"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v11, "setHTTPBody:", v15);

  v16 = -[NSObject copy](v11, "copy");
LABEL_18:

  return v16;
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (void)setPaymentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
}

@end
