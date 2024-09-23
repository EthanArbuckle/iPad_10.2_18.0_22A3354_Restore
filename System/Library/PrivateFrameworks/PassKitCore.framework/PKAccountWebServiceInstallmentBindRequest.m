@implementation PKAccountWebServiceInstallmentBindRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  void *v16;
  void *v18;
  _QWORD v19[3];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    v22 = 2082;
    v23 = "_baseURL";
LABEL_19:
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_20;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    v22 = 2082;
    v23 = "appleAccountInformation";
    goto LABEL_19;
  }
  if (!self->_accountIdentifier && !self->_applicationIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2082;
      v23 = "(_accountIdentifier || _applicationIdentifier)";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (!self->_bindingAmount)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    v22 = 2082;
    v23 = "_bindingAmount";
    goto LABEL_19;
  }
  if (!self->_merchantIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2082;
      v23 = "_merchantIdentifier";
      goto LABEL_19;
    }
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  v19[0] = CFSTR("accounts");
  v19[1] = CFSTR("installments");
  v19[2] = CFSTR("bind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v6 = objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v6, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSDecimalNumber stringValue](self->_bindingAmount, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("bindingAmount"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_merchantIdentifier, CFSTR("merchantIdentifier"));
  if (self->_accountIdentifier || self->_applicationIdentifier)
    objc_msgSend(v8, "setObject:forKeyedSubscript:");
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHTTPBody:", v18);

  v16 = (void *)objc_msgSend(v7, "copy");
LABEL_21:

  return v16;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDecimalNumber)bindingAmount
{
  return self->_bindingAmount;
}

- (void)setBindingAmount:(id)a3
{
  objc_storeStrong((id *)&self->_bindingAmount, a3);
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_bindingAmount, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
