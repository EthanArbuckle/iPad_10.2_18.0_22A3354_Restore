@implementation PKAccountWebServiceVirtualCardLegacyCredentialsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSString *accountIdentifier;
  NSString *virtualCardIdentifier;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "_baseURL";
LABEL_19:
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_20;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "appleAccountInformation";
    goto LABEL_19;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "_accountIdentifier";
    goto LABEL_19;
  }
  virtualCardIdentifier = self->_virtualCardIdentifier;
  if (!virtualCardIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "_virtualCardIdentifier";
    goto LABEL_19;
  }
  if (!self->_encryptionFields)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 2082;
      v25 = "_encryptionFields";
      goto LABEL_19;
    }
LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
  v21[0] = CFSTR("accounts");
  v21[1] = accountIdentifier;
  v21[2] = CFSTR("virtualCards");
  v21[3] = virtualCardIdentifier;
  v21[4] = CFSTR("legacyDeviceCredentials");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v8 = objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v8, 0, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKVirtualCardEncryptionFields dictionaryRepresentation](self->_encryptionFields, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("encryptionFields"));

  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHTTPBody:", v12);

  }
  v13 = (void *)objc_msgSend(v9, "copy");

LABEL_21:
  return v13;
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

- (PKVirtualCardEncryptionFields)encryptionFields
{
  return self->_encryptionFields;
}

- (void)setEncryptionFields:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionFields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionFields, 0);
  objc_storeStrong((id *)&self->_virtualCardIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
