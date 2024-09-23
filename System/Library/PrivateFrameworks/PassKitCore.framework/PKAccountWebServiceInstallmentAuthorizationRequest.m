@implementation PKAccountWebServiceInstallmentAuthorizationRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  CNPostalAddress *shippingAddress;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  objc_class *v26;
  int v28;
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v17;
      v30 = 2082;
      v31 = "appleAccountInformation";
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v28, 0x16u);

    }
    goto LABEL_25;
  }
  -[PKAccountWebServiceInstallmentAuthorizationRequest baseURL](self, "baseURL");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v20;
      v30 = 2082;
      v31 = "baseURL";
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v28, 0x16u);

    }
    v6 = 0;
    goto LABEL_25;
  }
  v6 = v5;
  if (!self->_accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v23;
    v30 = 2082;
    v31 = "_accountIdentifier";
LABEL_23:
    _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v28, 0x16u);

    goto LABEL_24;
  }
  if (!self->_bindToken)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v23;
    v30 = 2082;
    v31 = "_bindToken";
    goto LABEL_23;
  }
  if (!self->_authorizationAmount)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v23;
    v30 = 2082;
    v31 = "_authorizationAmount";
    goto LABEL_23;
  }
  if (!self->_installmentGroupIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v23;
      v30 = 2082;
      v31 = "_installmentGroupIdentifier";
      goto LABEL_23;
    }
LABEL_24:

LABEL_25:
    v15 = 0;
    goto LABEL_26;
  }
  -[PKAccountWebServiceInstallmentAuthorizationRequest endpointComponents](self, "endpointComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, v7, 0, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_bindToken, CFSTR("bindToken"));
  -[NSDecimalNumber stringValue](self->_authorizationAmount, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("authorizationAmount"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_installmentGroupIdentifier, CFSTR("installmentGroupIdentifier"));
  shippingAddress = self->_shippingAddress;
  if (shippingAddress)
  {
    -[CNPostalAddress webServiceDictionaryRepresentation](shippingAddress, "webServiceDictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("shippingAddress"));

  }
  -[NSData hexEncoding](self->_publicKeyHash, "hexEncoding");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("publicKeyHash"));

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHTTPBody:", v14);

  v15 = (void *)objc_msgSend(v8, "copy");
LABEL_26:

  return v15;
}

- (id)endpointComponents
{
  NSString *accountIdentifier;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  accountIdentifier = self->_accountIdentifier;
  v4[0] = CFSTR("accounts");
  v4[1] = accountIdentifier;
  v4[2] = CFSTR("installments");
  v4[3] = CFSTR("authorize");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)signatureResponseClass
{
  return (Class)objc_opt_class();
}

- (id)manifestHashWithReferenceIdentifier:(id)a3
{
  id v4;
  id v5;
  NSDecimalNumber *authorizationAmount;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[NSString length](self->_bindToken, "length"))
    objc_msgSend(v5, "appendString:", self->_bindToken);
  authorizationAmount = self->_authorizationAmount;
  if (authorizationAmount)
  {
    -[NSDecimalNumber stringValue](authorizationAmount, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v7);

  }
  if (-[NSString length](self->_installmentGroupIdentifier, "length"))
    objc_msgSend(v5, "appendString:", self->_installmentGroupIdentifier);
  if (objc_msgSend(v4, "length"))
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

- (PKAccountWebServiceInstallmentAuthorizationRequest)initWithCoder:(id)a3
{
  id v4;
  PKAccountWebServiceInstallmentAuthorizationRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSString *bindToken;
  uint64_t v12;
  NSDecimalNumber *authorizationAmount;
  uint64_t v14;
  NSString *installmentGroupIdentifier;
  uint64_t v16;
  CNPostalAddress *shippingAddress;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountWebServiceInstallmentAuthorizationRequest;
  v5 = -[PKOverlayableWebServiceRequest initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceInstallmentAuthorizationRequest setBaseURL:](v5, "setBaseURL:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceInstallmentAuthorizationRequest setHashResponse:](v5, "setHashResponse:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bindToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    bindToken = v5->_bindToken;
    v5->_bindToken = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    authorizationAmount = v5->_authorizationAmount;
    v5->_authorizationAmount = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentGroupIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    installmentGroupIdentifier = v5->_installmentGroupIdentifier;
    v5->_installmentGroupIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingAddress"));
    v16 = objc_claimAutoreleasedReturnValue();
    shippingAddress = v5->_shippingAddress;
    v5->_shippingAddress = (CNPostalAddress *)v16;

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
  v7.super_class = (Class)PKAccountWebServiceInstallmentAuthorizationRequest;
  v4 = a3;
  -[PKOverlayableWebServiceRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[PKAccountWebServiceInstallmentAuthorizationRequest baseURL](self, "baseURL", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("baseURL"));

  -[PKAccountWebServiceInstallmentAuthorizationRequest hashResponse](self, "hashResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("hashResponse"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bindToken, CFSTR("bindToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_authorizationAmount, CFSTR("authorizationAmount"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentGroupIdentifier, CFSTR("installmentGroupIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shippingAddress, CFSTR("shippingAddress"));

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

- (NSString)bindToken
{
  return self->_bindToken;
}

- (void)setBindToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDecimalNumber)authorizationAmount
{
  return self->_authorizationAmount;
}

- (void)setAuthorizationAmount:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationAmount, a3);
}

- (NSString)installmentGroupIdentifier
{
  return self->_installmentGroupIdentifier;
}

- (void)setInstallmentGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CNPostalAddress)shippingAddress
{
  return self->_shippingAddress;
}

- (void)setShippingAddress:(id)a3
{
  objc_storeStrong((id *)&self->_shippingAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shippingAddress, 0);
  objc_storeStrong((id *)&self->_installmentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationAmount, 0);
  objc_storeStrong((id *)&self->_bindToken, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->hashResponse, 0);
  objc_storeStrong((id *)&self->baseURL, 0);
}

@end
