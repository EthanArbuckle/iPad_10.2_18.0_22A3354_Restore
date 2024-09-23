@implementation PKAccountWebServiceSharedAccountCloudStoreRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSURL *baseURL;
  NSString *accountIdentifier;
  void *v7;
  NSObject *v8;
  id v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  objc_class *v13;
  _QWORD v15[3];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (PKRunningInPassd())
  {
    baseURL = self->_baseURL;
    if (baseURL)
    {
      if (v4)
      {
        accountIdentifier = self->_accountIdentifier;
        if (accountIdentifier)
        {
          v15[0] = CFSTR("accounts");
          v15[1] = accountIdentifier;
          v15[2] = CFSTR("sharedAccountCloudStore");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v7, 0, v4);
          v8 = objc_claimAutoreleasedReturnValue();

          -[NSObject setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("GET"));
          v9 = -[NSObject copy](v8, "copy");
LABEL_15:

          goto LABEL_16;
        }
        PKLogFacilityTypeGetObject(0xEuLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v17 = v11;
          v18 = 2082;
          v19 = "_accountIdentifier";
          goto LABEL_13;
        }
LABEL_14:
        v9 = 0;
        goto LABEL_15;
      }
      PKLogFacilityTypeGetObject(0xEuLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2082;
      v19 = "appleAccountInformation";
    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2082;
      v19 = "_baseURL";
    }
LABEL_13:
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_14;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
