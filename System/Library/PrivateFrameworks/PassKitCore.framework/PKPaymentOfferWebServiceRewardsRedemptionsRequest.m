@implementation PKPaymentOfferWebServiceRewardsRedemptionsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSDate *lastUpdated;
  void *v8;
  void *v9;
  void *v10;
  NSNumber *limit;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentOfferWebServiceRewardsRedemptionsRequest baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v20;
    v28 = 2082;
    v29 = "baseURL";
LABEL_18:
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_19;
  }
  if (!self->_fpanIdentifier)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v20;
    v28 = 2082;
    v29 = "_fpanIdentifier";
    goto LABEL_18;
  }
  if (!self->_criteriaIdentifier)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v20;
    v28 = 2082;
    v29 = "_criteriaIdentifier";
    goto LABEL_18;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      v28 = 2082;
      v29 = "appleAccountInformation";
      goto LABEL_18;
    }
LABEL_19:
    v18 = 0;
    goto LABEL_20;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  lastUpdated = self->_lastUpdated;
  if (lastUpdated)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](lastUpdated, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v6, "setObject:forKey:", v10, CFSTR("lastUpdated"));

  }
  limit = self->_limit;
  if (limit)
  {
    -[NSNumber stringValue](limit, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v6, "setObject:forKey:", v12, CFSTR("limit"));

  }
  v25[0] = CFSTR("rewards");
  v25[1] = CFSTR("redemptions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NSObject copy](v6, "copy");
  -[PKPaymentOfferWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v5, v13, v14, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", self->_fpanIdentifier, CFSTR("fpanIdentifier"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", self->_criteriaIdentifier, CFSTR("criteriaIdentifier"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHTTPBody:", v17);

  v18 = (void *)objc_msgSend(v15, "copy");
LABEL_20:

  return v18;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (void)setCriteriaIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void)setLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
