@implementation PKPeerPaymentAcceptTermsRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  int v23;
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v18;
    v25 = 2082;
    v26 = "url";
LABEL_14:
    _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v23, 0x16u);

    goto LABEL_15;
  }
  if (!v9)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v18;
    v25 = 2082;
    v26 = "appleAccountInformation";
    goto LABEL_14;
  }
  if (!v10)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v18;
    v25 = 2082;
    v26 = "deviceIdentifier";
    goto LABEL_14;
  }
  if (!self->_termsIdentifier)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v18;
      v25 = 2082;
      v26 = "_termsIdentifier";
      goto LABEL_14;
    }
LABEL_15:

    v15 = 0;
    goto LABEL_16;
  }
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v8, &unk_1E2C3E5F0, 0, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", self->_termsIdentifier, CFSTR("termsIdentifier"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPBody:", v14);

  v15 = (void *)objc_msgSend(v12, "copy");
LABEL_16:

  return v15;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
}

@end
