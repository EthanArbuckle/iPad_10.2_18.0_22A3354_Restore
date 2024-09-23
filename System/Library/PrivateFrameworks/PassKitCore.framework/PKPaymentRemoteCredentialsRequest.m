@implementation PKPaymentRemoteCredentialsRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSString *productIdentifier;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (self->_includeMetadata)
    objc_msgSend(v12, "setObject:forKey:", CFSTR("true"), CFSTR("includeMetadata"));
  if (self->_excludeDeviceInfo)
    objc_msgSend(v13, "setObject:forKey:", CFSTR("true"), CFSTR("excludeDeviceInfo"));
  productIdentifier = self->_productIdentifier;
  if (productIdentifier)
    objc_msgSend(v13, "setObject:forKey:", productIdentifier, CFSTR("productIdentifier"));
  if (self->_credentialType)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), self->_credentialType);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("cardType"));

  }
  v20[0] = CFSTR("devices");
  v20[1] = v8;
  v20[2] = CFSTR("cards");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v16, v13, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setHTTPMethod:", CFSTR("GET"));
  v18 = (void *)objc_msgSend(v17, "copy");

  return v18;
}

- (BOOL)includeMetadata
{
  return self->_includeMetadata;
}

- (void)setIncludeMetadata:(BOOL)a3
{
  self->_includeMetadata = a3;
}

- (BOOL)excludeDeviceInfo
{
  return self->_excludeDeviceInfo;
}

- (void)setExcludeDeviceInfo:(BOOL)a3
{
  self->_excludeDeviceInfo = a3;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifier, 0);
}

@end
