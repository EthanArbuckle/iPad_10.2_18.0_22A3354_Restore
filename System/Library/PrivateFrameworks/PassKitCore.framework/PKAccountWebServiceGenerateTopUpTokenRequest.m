@implementation PKAccountWebServiceGenerateTopUpTokenRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSString *accountIdentifier;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  objc_class *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKAccountWebServiceGenerateTopUpTokenRequest baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    v22 = 2082;
    v23 = "baseURL";
LABEL_12:
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    v22 = 2082;
    v23 = "appleAccountInformation";
    goto LABEL_12;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2082;
      v23 = "_accountIdentifier";
      goto LABEL_12;
    }
LABEL_13:
    v7 = 0;
LABEL_14:

    goto LABEL_15;
  }
  if (self->_tokenType != 1)
  {
    v19[0] = CFSTR("accounts");
    v19[1] = accountIdentifier;
    v19[2] = CFSTR("generateTopUpToken");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v5, v14, 0, v4);
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("POST"));
    -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    PKUniqueDeviceIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", v15, CFSTR("X-Apple-Device-GUID"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppleBalanceInStoreTopUpTokenTypeToString(self->_tokenType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("tokenType"));

    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v8, "setHTTPBody:", v18);

    v7 = -[NSObject copy](v8, "copy");
    goto LABEL_14;
  }
  v7 = 0;
LABEL_15:

  return v7;
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

- (int64_t)tokenType
{
  return self->_tokenType;
}

- (void)setTokenType:(int64_t)a3
{
  self->_tokenType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
