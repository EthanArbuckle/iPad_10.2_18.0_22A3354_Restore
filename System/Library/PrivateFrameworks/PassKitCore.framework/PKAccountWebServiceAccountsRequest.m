@implementation PKAccountWebServiceAccountsRequest

- (id)_urlRequestWithServiceURL:(id)a3 AppleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  const __CFString *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2082;
      v20 = "url";
LABEL_8:
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    }
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2082;
      v20 = "appleAccountInformation";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v16 = CFSTR("accounts");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, v9, 0, v8);
  v10 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v10, "setHTTPMethod:", CFSTR("GET"));
  -[NSObject setCachePolicy:](v10, "setCachePolicy:", 1);
  v11 = -[NSObject copy](v10, "copy");
LABEL_10:

  return v11;
}

- (NSURL)accountServicesURL
{
  return self->_accountServicesURL;
}

- (void)setAccountServicesURL:(id)a3
{
  objc_storeStrong((id *)&self->_accountServicesURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountServicesURL, 0);
}

@end
