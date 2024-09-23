@implementation PKAccountWebServicePhysicalCardActionRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  int v21;
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKAccountWebServicePhysicalCardActionRequest baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v16;
    v23 = 2082;
    v24 = "baseURL";
LABEL_16:
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v21, 0x16u);

    goto LABEL_17;
  }
  if (!self->_action)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v16;
    v23 = 2082;
    v24 = "_action";
    goto LABEL_16;
  }
  if (!self->_accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v16;
    v23 = 2082;
    v24 = "_accountIdentifier";
    goto LABEL_16;
  }
  if (!self->_physicalCardIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v16;
      v23 = 2082;
      v24 = "_physicalCardIdentifier";
      goto LABEL_16;
    }
LABEL_17:

    v13 = 0;
    goto LABEL_18;
  }
  -[PKAccountWebServicePhysicalCardActionRequest endpointComponents](self, "endpointComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v5, v6, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPhysicalCardAction jsonRepresentation](self->_action, "jsonRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v9);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_accountUserAltDSID, CFSTR("accountUserAltDSID"));
  -[PKPaymentDeviceMetadata dictionaryRepresentation](self->_deviceMetadata, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("deviceMetadata"));
  -[NSData hexEncoding](self->_publicKeyHash, "hexEncoding");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("publicKeyHash"));

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHTTPBody:", v12);

  v13 = (void *)objc_msgSend(v7, "copy");
LABEL_18:

  return v13;
}

- (id)endpointComponents
{
  void *v3;
  NSString *accountIdentifier;
  NSString *physicalCardIdentifier;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self->_accountIdentifier, "length");
  if (v3)
  {
    v3 = -[NSString length](self->_physicalCardIdentifier, "length");
    if (v3)
    {
      accountIdentifier = self->_accountIdentifier;
      v7[0] = CFSTR("accounts");
      v7[1] = accountIdentifier;
      physicalCardIdentifier = self->_physicalCardIdentifier;
      v7[2] = CFSTR("physicalCard");
      v7[3] = physicalCardIdentifier;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (Class)signatureResponseClass
{
  return (Class)objc_opt_class();
}

- (id)manifestHashWithReferenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_accountIdentifier, "length"))
    objc_msgSend(v5, "appendString:", self->_accountIdentifier);
  if (-[NSString length](self->_physicalCardIdentifier, "length"))
    objc_msgSend(v5, "appendString:", self->_physicalCardIdentifier);
  v6 = -[PKPhysicalCardAction actionType](self->_action, "actionType");
  PKStringFromPhysicalCardActionType(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v5, "appendString:", v7);
  if (v6 == 5)
  {
    PKStringFromPhysicalCardOrderReason(-[PKPhysicalCardAction reason](self->_action, "reason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v5, "appendString:", v8);
    -[PKPhysicalCardAction priceOption](self->_action, "priceOption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      PKStringFromPhysicalCardOrderReason(objc_msgSend(v9, "reason"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "amount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "amount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "amount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currency");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "length"))
        objc_msgSend(v5, "appendString:", v11);
      if (objc_msgSend(v14, "length"))
        objc_msgSend(v5, "appendString:", v14);
      if (objc_msgSend(v16, "length"))
        objc_msgSend(v5, "appendString:", v16);

    }
  }
  if (v4)
    objc_msgSend(v5, "appendString:", v4);
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "SHA256Hash");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountWebServicePhysicalCardActionRequest)initWithCoder:(id)a3
{
  id v4;
  PKAccountWebServicePhysicalCardActionRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSString *accountUserAltDSID;
  uint64_t v12;
  NSString *physicalCardIdentifier;
  uint64_t v14;
  PKPhysicalCardAction *action;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAccountWebServicePhysicalCardActionRequest;
  v5 = -[PKOverlayableWebServiceRequest initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServicePhysicalCardActionRequest setBaseURL:](v5, "setBaseURL:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServicePhysicalCardActionRequest setHashResponse:](v5, "setHashResponse:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountUserAltDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicalCardIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    physicalCardIdentifier = v5->_physicalCardIdentifier;
    v5->_physicalCardIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v14 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (PKPhysicalCardAction *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAccountWebServicePhysicalCardActionRequest;
  v4 = a3;
  -[PKOverlayableWebServiceRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[PKAccountWebServicePhysicalCardActionRequest baseURL](self, "baseURL", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("baseURL"));

  -[PKAccountWebServicePhysicalCardActionRequest hashResponse](self, "hashResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("hashResponse"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountUserAltDSID, CFSTR("accountUserAltDSID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_physicalCardIdentifier, CFSTR("physicalCardIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_action, CFSTR("action"));

}

- (NSURL)baseURL
{
  return self->baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->baseURL, a3);
}

- (PKApplePayTrustHashResponse)hashResponse
{
  return self->hashResponse;
}

- (void)setHashResponse:(id)a3
{
  objc_storeStrong((id *)&self->hashResponse, a3);
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)physicalCardIdentifier
{
  return self->_physicalCardIdentifier;
}

- (void)setPhysicalCardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (PKPhysicalCardAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_physicalCardIdentifier, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->hashResponse, 0);
  objc_storeStrong((id *)&self->baseURL, 0);
}

@end
