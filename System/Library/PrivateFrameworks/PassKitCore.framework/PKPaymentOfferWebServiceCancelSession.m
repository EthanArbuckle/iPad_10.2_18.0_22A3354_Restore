@implementation PKPaymentOfferWebServiceCancelSession

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSURL *baseURL;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSError *error;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  const __CFString *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2082;
      v24 = "_baseURL";
LABEL_12:
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    }
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  if (!self->_sessionIdentifiers)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2082;
      v24 = "_sessionIdentifiers";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v20 = CFSTR("cancelSession");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentOfferWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v6, 0, v4);
  v7 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v7, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v7, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSSet allObjects](self->_sessionIdentifiers, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("sessionIdentifiers"));

  error = self->_error;
  if (error)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSError code](error, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("errorCode"));

    -[NSError domain](self->_error, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("errorDomain"));

    -[NSError description](self->_error, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("errorDescription"));

  }
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v7, "setHTTPBody:", v14);

  }
  v15 = -[NSObject copy](v7, "copy");

LABEL_14:
  return v15;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSSet)sessionIdentifiers
{
  return self->_sessionIdentifiers;
}

- (void)setSessionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
