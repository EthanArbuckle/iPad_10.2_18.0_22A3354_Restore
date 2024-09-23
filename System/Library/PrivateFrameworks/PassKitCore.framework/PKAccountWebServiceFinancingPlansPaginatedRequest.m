@implementation PKAccountWebServiceFinancingPlansPaginatedRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *accountIdentifier;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  _QWORD v20[3];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2082;
      v24 = "_baseURL";
LABEL_12:
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    }
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  if (!self->_accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2082;
      v24 = "_accountIdentifier";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPaymentWebServicePaginatedRequest lastUpdated](self, "lastUpdated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServicePaginatedRequest limit](self, "limit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v5, "setObject:forKey:", v10, CFSTR("lastUpdated"));

  }
  if (v7)
  {
    objc_msgSend(v7, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v5, "setObject:forKey:", v11, CFSTR("limit"));

  }
  accountIdentifier = self->_accountIdentifier;
  v20[0] = CFSTR("accounts");
  v20[1] = accountIdentifier;
  v20[2] = CFSTR("financingPlans");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServicePaginatedRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v13, v5, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v15 = (void *)objc_msgSend(v14, "copy");

LABEL_14:
  return v15;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
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
