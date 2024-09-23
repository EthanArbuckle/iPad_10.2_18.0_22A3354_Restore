@implementation PKAccountWebServiceVirtualCardSecurityCodeActivityRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSString *accountIdentifier;
  NSString *virtualCardIdentifier;
  void *v8;
  void *v9;
  NSObject *v10;
  NSURL *baseURL;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t action;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  objc_class *v26;
  objc_class *v27;
  objc_class *v28;
  _QWORD v30[5];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    v33 = 2082;
    v34 = "_baseURL";
LABEL_29:
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_30;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    v33 = 2082;
    v34 = "appleAccountInformation";
    goto LABEL_29;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    v33 = 2082;
    v34 = "_accountIdentifier";
    goto LABEL_29;
  }
  virtualCardIdentifier = self->_virtualCardIdentifier;
  if (!virtualCardIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    v33 = 2082;
    v34 = "_virtualCardIdentifier";
    goto LABEL_29;
  }
  if (!self->_action)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    v33 = 2082;
    v34 = "_action";
    goto LABEL_29;
  }
  if (!self->_timestamp)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2082;
      v34 = "_timestamp";
      goto LABEL_29;
    }
LABEL_30:
    v21 = 0;
    goto LABEL_31;
  }
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v30[0] = CFSTR("accounts");
  v30[1] = accountIdentifier;
  v30[2] = CFSTR("virtualCards");
  v30[3] = virtualCardIdentifier;
  v30[4] = CFSTR("securityCodeActivity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (-[NSString length](self->_securityCodeIdentifier, "length"))
    -[NSObject addObject:](v10, "addObject:", self->_securityCodeIdentifier);
  baseURL = self->_baseURL;
  v12 = -[NSObject copy](v10, "copy");
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v12, 0, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  action = self->_action;
  v17 = CFSTR("unknown");
  if (action == 1)
    v17 = CFSTR("viewed");
  if (action == 2)
    v18 = CFSTR("autofilled");
  else
    v18 = v17;
  objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("action"));
  PKISO8601DateStringFromDate(self->_timestamp);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("timestamp"));

  if (v15)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHTTPBody:", v20);

  }
  v21 = (void *)objc_msgSend(v13, "copy");

LABEL_31:
  return v21;
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

- (NSString)virtualCardIdentifier
{
  return self->_virtualCardIdentifier;
}

- (void)setVirtualCardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)securityCodeIdentifier
{
  return self->_securityCodeIdentifier;
}

- (void)setSecurityCodeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_securityCodeIdentifier, 0);
  objc_storeStrong((id *)&self->_virtualCardIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
