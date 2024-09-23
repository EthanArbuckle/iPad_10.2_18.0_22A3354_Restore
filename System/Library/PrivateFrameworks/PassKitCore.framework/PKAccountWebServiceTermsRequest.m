@implementation PKAccountWebServiceTermsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSURL *baseURL;
  NSString *accountIdentifier;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  _QWORD v19[3];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
          if (self->_termsIdentifier)
          {
            v19[0] = CFSTR("accounts");
            v19[1] = accountIdentifier;
            v19[2] = CFSTR("terms");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v7, 0, v4);
            v8 = objc_claimAutoreleasedReturnValue();

            -[NSObject setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("POST"));
            -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", self->_termsIdentifier, CFSTR("termsIdentifier"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_termsAccepted);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("termsAccepted"));

            objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setHTTPBody:](v8, "setHTTPBody:", v11);

            v12 = -[NSObject copy](v8, "copy");
LABEL_18:

            goto LABEL_19;
          }
          PKLogFacilityTypeGetObject(0xEuLL);
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v21 = v14;
            v22 = 2082;
            v23 = "_termsIdentifier";
            goto LABEL_16;
          }
LABEL_17:
          v12 = 0;
          goto LABEL_18;
        }
        PKLogFacilityTypeGetObject(0xEuLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        v22 = 2082;
        v23 = "_accountIdentifier";
      }
      else
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v14;
        v22 = 2082;
        v23 = "appleAccountInformation";
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      v22 = 2082;
      v23 = "_baseURL";
    }
LABEL_16:
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_17;
  }
  v12 = 0;
LABEL_19:

  return v12;
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

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)termsAccepted
{
  return self->_termsAccepted;
}

- (void)setTermsAccepted:(BOOL)a3
{
  self->_termsAccepted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
