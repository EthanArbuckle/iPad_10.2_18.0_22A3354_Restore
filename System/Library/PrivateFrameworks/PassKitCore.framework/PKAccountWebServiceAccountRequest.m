@implementation PKAccountWebServiceAccountRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSString *accountIdentifier;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (PKRunningInPassd())
  {
    if (self->_baseURL)
    {
      if (v4)
      {
        accountIdentifier = self->_accountIdentifier;
        if (accountIdentifier)
        {
          if (self->_extended)
          {
            v18[0] = CFSTR("accounts");
            v18[1] = accountIdentifier;
            v18[2] = CFSTR("extended");
            v6 = (void *)MEMORY[0x1E0C99D20];
            v7 = v18;
            v8 = 3;
          }
          else
          {
            v17[0] = CFSTR("accounts");
            v17[1] = accountIdentifier;
            v6 = (void *)MEMORY[0x1E0C99D20];
            v7 = v17;
            v8 = 2;
          }
          objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
          v10 = objc_claimAutoreleasedReturnValue();
          -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v10, 0, v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setHTTPMethod:", CFSTR("GET"));
          objc_msgSend(v15, "setCachePolicy:", 1);
          v9 = (void *)objc_msgSend(v15, "copy");

          goto LABEL_18;
        }
        PKLogFacilityTypeGetObject(0xEuLL);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v20 = v12;
          v21 = 2082;
          v22 = "_accountIdentifier";
          goto LABEL_14;
        }
LABEL_15:
        v9 = 0;
LABEL_18:

        goto LABEL_19;
      }
      PKLogFacilityTypeGetObject(0xEuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2082;
      v22 = "appleAccountInformation";
    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2082;
      v22 = "_baseURL";
    }
LABEL_14:
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  v9 = 0;
LABEL_19:

  return v9;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (BOOL)extended
{
  return self->_extended;
}

- (void)setExtended:(BOOL)a3
{
  self->_extended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
