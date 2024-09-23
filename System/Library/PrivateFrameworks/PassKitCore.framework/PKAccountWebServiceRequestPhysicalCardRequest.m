@implementation PKAccountWebServiceRequestPhysicalCardRequest

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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  objc_class *v22;
  int v24;
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKAccountWebServiceRequestPhysicalCardRequest baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v20;
    v26 = 2082;
    v27 = "baseURL";
LABEL_17:
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v24, 0x16u);

    goto LABEL_18;
  }
  if (!self->_accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v20;
    v26 = 2082;
    v27 = "_accountIdentifier";
    goto LABEL_17;
  }
  if (!self->_order)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v20;
      v26 = 2082;
      v27 = "_order";
      goto LABEL_17;
    }
LABEL_18:

    v17 = 0;
    goto LABEL_19;
  }
  -[PKAccountWebServiceRequestPhysicalCardRequest endpointComponents](self, "endpointComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v5, v6, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPhysicalCardOrder artworkIdentifier](self->_order, "artworkIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PKPhysicalCardOrder artworkIdentifier](self->_order, "artworkIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("artworkIdentifier"));

  }
  -[PKPhysicalCardOrder nameOnCard](self->_order, "nameOnCard");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PKPhysicalCardOrder nameOnCard](self->_order, "nameOnCard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("name"));

  }
  PKStringFromPhysicalCardOrderReason(-[PKPhysicalCardOrder reason](self->_order, "reason"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("reason"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_accountUserAltDSID, CFSTR("accountUserAltDSID"));
  -[PKPaymentDeviceMetadata dictionaryRepresentation](self->_deviceMetadata, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("deviceMetadata"));
  -[NSData hexEncoding](self->_publicKeyHash, "hexEncoding");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("publicKeyHash"));

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHTTPBody:", v16);

  v17 = (void *)objc_msgSend(v7, "copy");
LABEL_19:

  return v17;
}

- (id)endpointComponents
{
  void *v3;
  NSString *accountIdentifier;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self->_accountIdentifier, "length");
  if (v3)
  {
    accountIdentifier = self->_accountIdentifier;
    v6[0] = CFSTR("accounts");
    v6[1] = accountIdentifier;
    v6[2] = CFSTR("physicalCard");
    v6[3] = CFSTR("request");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_accountIdentifier, "length"))
    objc_msgSend(v5, "appendString:", self->_accountIdentifier);
  -[PKPhysicalCardOrder artworkIdentifier](self->_order, "artworkIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v5, "appendString:", v6);
  PKStringFromPhysicalCardOrderReason(-[PKPhysicalCardOrder reason](self->_order, "reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v5, "appendString:", v7);
  if (v4)
    objc_msgSend(v5, "appendString:", v4);
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "SHA256Hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountWebServiceRequestPhysicalCardRequest)initWithCoder:(id)a3
{
  id v4;
  PKAccountWebServiceRequestPhysicalCardRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSString *accountUserAltDSID;
  uint64_t v12;
  PKPhysicalCardOrder *order;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountWebServiceRequestPhysicalCardRequest;
  v5 = -[PKOverlayableWebServiceRequest initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceRequestPhysicalCardRequest setBaseURL:](v5, "setBaseURL:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceRequestPhysicalCardRequest setHashResponse:](v5, "setHashResponse:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountUserAltDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("order"));
    v12 = objc_claimAutoreleasedReturnValue();
    order = v5->_order;
    v5->_order = (PKPhysicalCardOrder *)v12;

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
  v7.super_class = (Class)PKAccountWebServiceRequestPhysicalCardRequest;
  v4 = a3;
  -[PKOverlayableWebServiceRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[PKAccountWebServiceRequestPhysicalCardRequest baseURL](self, "baseURL", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("baseURL"));

  -[PKAccountWebServiceRequestPhysicalCardRequest hashResponse](self, "hashResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("hashResponse"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountUserAltDSID, CFSTR("accountUserAltDSID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_order, CFSTR("order"));

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

- (PKPhysicalCardOrder)order
{
  return self->_order;
}

- (void)setOrder:(id)a3
{
  objc_storeStrong((id *)&self->_order, a3);
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
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->hashResponse, 0);
  objc_storeStrong((id *)&self->baseURL, 0);
}

@end
