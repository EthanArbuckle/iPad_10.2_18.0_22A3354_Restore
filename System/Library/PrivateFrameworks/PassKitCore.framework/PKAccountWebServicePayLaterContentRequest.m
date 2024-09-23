@implementation PKAccountWebServicePayLaterContentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSURL *baseURL;
  NSString *accountIdentifier;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  _QWORD v16[3];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2082;
      v20 = "_baseURL";
LABEL_10:
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2082;
      v20 = "_accountIdentifier";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v16[0] = CFSTR("accounts");
  v16[1] = accountIdentifier;
  v16[2] = CFSTR("content");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v7, 0, v4);
  v8 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[PKAccountWebServicePayLaterContentRequest bodyDictionary](self, "bodyDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v8, "setHTTPBody:", v10);

  }
  v11 = -[NSObject copy](v8, "copy");

LABEL_12:
  return v11;
}

- (id)contextString
{
  return (id)PKAccountWebServicePayLaterContentRequestTypeToString(self->_type);
}

- (id)bodyDictionary
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKAccountWebServicePayLaterContentRequest contextString](self, "contextString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("context"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
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

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
