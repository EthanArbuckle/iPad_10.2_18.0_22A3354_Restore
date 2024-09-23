@implementation PKPeerPaymentStatementRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *accountIdentifier;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *emailAddress;
  void *v20;
  const __CFString *v22;
  NSString *v23;
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
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v12;
    v26 = 2082;
    v27 = "url";
LABEL_12:
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v12;
    v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_12;
  }
  if (!self->_emailAddress)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      v26 = 2082;
      v27 = "_emailAddress";
      goto LABEL_12;
    }
LABEL_13:
    v15 = 0;
    goto LABEL_18;
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    v22 = CFSTR("accountIdentifier");
    v23 = accountIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1E2C3E740, v10, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  emailAddress = self->_emailAddress;
  if (emailAddress)
    objc_msgSend(v17, "setObject:forKey:", emailAddress, CFSTR("emailAddress"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHTTPBody:", v20);

  v15 = (void *)objc_msgSend(v16, "copy");
LABEL_18:

  return v15;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

@end
