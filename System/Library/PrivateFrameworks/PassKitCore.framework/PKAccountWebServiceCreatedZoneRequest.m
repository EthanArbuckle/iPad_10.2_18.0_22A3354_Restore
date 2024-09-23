@implementation PKAccountWebServiceCreatedZoneRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSURL *baseURL;
  NSString *accountIdentifier;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  _QWORD v20[3];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v14;
    v23 = 2082;
    v24 = "_baseURL";
LABEL_17:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_18;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v14;
    v23 = 2082;
    v24 = "_accountIdentifier";
    goto LABEL_17;
  }
  if (!self->_containerName)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v14;
    v23 = 2082;
    v24 = "_containerName";
    goto LABEL_17;
  }
  if (!self->_zoneName)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v14;
    v23 = 2082;
    v24 = "_zoneName";
    goto LABEL_17;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2082;
      v24 = "appleAccountInformation";
      goto LABEL_17;
    }
LABEL_18:
    v12 = 0;
    goto LABEL_19;
  }
  v20[0] = CFSTR("accounts");
  v20[1] = accountIdentifier;
  v20[2] = CFSTR("createdZone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v5);
  v9 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_containerName, CFSTR("containerName"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_zoneName, CFSTR("zoneName"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v9, "setHTTPBody:", v11);

  v12 = -[NSObject copy](v9, "copy");
LABEL_19:

  return v12;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
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
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
