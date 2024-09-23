@implementation PKAccountWebServiceDocumentActionRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSURL *baseURL;
  NSString *accountIdentifier;
  NSString *documentIdentifier;
  int64_t action;
  __CFString *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  id v17;
  const __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    v26 = 2082;
    v27 = "_baseURL";
LABEL_15:
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_16;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_15;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    v26 = 2082;
    v27 = "_accountIdentifier";
    goto LABEL_15;
  }
  documentIdentifier = self->_documentIdentifier;
  if (!documentIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      v26 = 2082;
      v27 = "_documentIdentifier";
      goto LABEL_15;
    }
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  action = self->_action;
  if ((unint64_t)(action - 1) > 2)
    v10 = 0;
  else
    v10 = off_1E2AC3418[action - 1];
  if (action == 3)
    v19 = CFSTR("taxForms");
  else
    v19 = CFSTR("statements");
  v23[0] = CFSTR("accounts");
  v23[1] = accountIdentifier;
  v23[2] = v19;
  v23[3] = documentIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v20, 0, v5);
  v11 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v11, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v11, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v10, CFSTR("action"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v11, "setHTTPBody:", v22);

  v17 = -[NSObject copy](v11, "copy");
LABEL_17:

  return v17;
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

- (NSString)documentIdentifier
{
  return self->_documentIdentifier;
}

- (void)setDocumentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
