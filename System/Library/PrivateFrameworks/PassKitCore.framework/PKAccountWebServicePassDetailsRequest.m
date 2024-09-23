@implementation PKAccountWebServicePassDetailsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3 deviceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSURL *baseURL;
  NSString *accountIdentifier;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    v26 = 2082;
    v27 = "_baseURL";
LABEL_16:
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_17;
  }
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_16;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    v26 = 2082;
    v27 = "_accountIdentifier";
    goto LABEL_16;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2082;
      v27 = "deviceIdentifier";
      goto LABEL_16;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  v23[0] = CFSTR("accounts");
  v23[1] = accountIdentifier;
  v23[2] = CFSTR("devices");
  v23[3] = v7;
  v23[4] = CFSTR("pass");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v11, 0, v6);
  v12 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v12, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDeviceMetadata dictionaryRepresentation](self->_deviceMetadata, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("deviceMetadata"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifier"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v12, "setHTTPBody:", v15);

  v16 = -[NSObject copy](v12, "copy");
LABEL_18:

  return v16;
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

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
