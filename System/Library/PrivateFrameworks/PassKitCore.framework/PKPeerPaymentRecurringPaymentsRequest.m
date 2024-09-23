@implementation PKPeerPaymentRecurringPaymentsRequest

- (PKPeerPaymentRecurringPaymentsRequest)initWithAccountIdentifier:(id)a3
{
  id v5;
  PKPeerPaymentRecurringPaymentsRequest *v6;
  PKPeerPaymentRecurringPaymentsRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentRecurringPaymentsRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountIdentifier, a3);

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *accountIdentifier;
  void *v10;
  NSObject *v11;
  id v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  objc_class *v16;
  _QWORD v18[3];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2082;
    v22 = "url";
LABEL_11:
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_12;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2082;
    v22 = "appleAccountInformation";
    goto LABEL_11;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2082;
      v22 = "_accountIdentifier";
      goto LABEL_11;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v18[0] = CFSTR("account");
  v18[1] = accountIdentifier;
  v18[2] = CFSTR("recurringPayments");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, v10, 0, v8);
  v11 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v11, "setHTTPMethod:", CFSTR("GET"));
  -[NSObject setCachePolicy:](v11, "setCachePolicy:", 1);
  v12 = -[NSObject copy](v11, "copy");
LABEL_13:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
