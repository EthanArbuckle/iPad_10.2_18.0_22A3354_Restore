@implementation PKPeerPaymentPassDetailsResponse

- (PKPeerPaymentPassDetailsResponse)initWithData:(id)a3
{
  PKPeerPaymentPassDetailsResponse *v3;
  PKPeerPaymentPassDetailsResponse *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSString *provisioningIdentifier;
  uint64_t v9;
  NSURL *passURL;
  uint64_t v11;
  NSString *passTypeIdentifier;
  uint64_t v13;
  NSString *passSerialNumber;
  uint64_t v15;
  NSString *ownershipTokenIdentifier;
  PKPaymentRemoteCredential *v17;
  NSObject *p_super;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PKPeerPaymentPassDetailsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v24, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v6, "PKStringForKey:", CFSTR("provisioningIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      provisioningIdentifier = v4->_provisioningIdentifier;
      v4->_provisioningIdentifier = (NSString *)v7;

      v4->_cardType = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("cardType"));
      v4->_status = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("status"));
      objc_msgSend(v6, "PKURLForKey:", CFSTR("passURL"));
      v9 = objc_claimAutoreleasedReturnValue();
      passURL = v4->_passURL;
      v4->_passURL = (NSURL *)v9;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("passTypeIdentifier"));
      v11 = objc_claimAutoreleasedReturnValue();
      passTypeIdentifier = v4->_passTypeIdentifier;
      v4->_passTypeIdentifier = (NSString *)v11;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("passSerialNumber"));
      v13 = objc_claimAutoreleasedReturnValue();
      passSerialNumber = v4->_passSerialNumber;
      v4->_passSerialNumber = (NSString *)v13;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("ownershipTokenIdentifier"));
      v15 = objc_claimAutoreleasedReturnValue();

      ownershipTokenIdentifier = v4->_ownershipTokenIdentifier;
      v4->_ownershipTokenIdentifier = (NSString *)v15;

      v17 = -[PKPaymentRemoteCredential initWithIdentifier:status:credentialType:passURL:]([PKPaymentRemoteCredential alloc], "initWithIdentifier:status:credentialType:passURL:", v4->_provisioningIdentifier, v4->_status, v4->_cardType, v4->_passURL);
      p_super = &v4->_remoteCredential->super.super;
      v4->_remoteCredential = v17;
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v20;
        v27 = 2114;
        v28 = v22;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (NSString)provisioningIdentifier
{
  return self->_provisioningIdentifier;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (int64_t)status
{
  return self->_status;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (NSString)ownershipTokenIdentifier
{
  return self->_ownershipTokenIdentifier;
}

- (PKPaymentRemoteCredential)remoteCredential
{
  return self->_remoteCredential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredential, 0);
  objc_storeStrong((id *)&self->_ownershipTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_provisioningIdentifier, 0);
}

@end
