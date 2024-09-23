@implementation PKAccountWebServiceCreateVirtualCardRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSString *accountIdentifier;
  NSObject *v7;
  void *v8;
  void *v9;
  int64_t type;
  void *v11;
  PKVirtualCardEncryptionFields *encryptionFields;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  _QWORD v23[4];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    v26 = 2082;
    v27 = "_baseURL";
LABEL_23:
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_24;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_23;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    v26 = 2082;
    v27 = "_accountIdentifier";
    goto LABEL_23;
  }
  if (!self->_type)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    v26 = 2082;
    v27 = "_type";
    goto LABEL_23;
  }
  if (!self->_encryptionFields)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v17;
      v26 = 2082;
      v27 = "_encryptionFields";
      goto LABEL_23;
    }
LABEL_24:
    v15 = 0;
    goto LABEL_25;
  }
  v23[0] = CFSTR("accounts");
  v23[1] = accountIdentifier;
  v23[2] = CFSTR("virtualCards");
  v23[3] = CFSTR("create");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v7 = objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v7, 0, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type)
  {
    PKAccountVirtualCardTypeToString(type);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("type"));

  }
  encryptionFields = self->_encryptionFields;
  if (encryptionFields)
  {
    -[PKVirtualCardEncryptionFields dictionaryRepresentation](encryptionFields, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("encryptionFields"));

  }
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHTTPBody:", v14);

  }
  v15 = (void *)objc_msgSend(v8, "copy");

LABEL_25:
  return v15;
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

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
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
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
