@implementation PKAccountWebServiceApplePayTrustRequest

- (PKAccountWebServiceApplePayTrustRequest)initWithApplePayTrustProtocol:(id)a3
{
  id v5;
  PKAccountWebServiceApplePayTrustRequest *v6;
  PKAccountWebServiceApplePayTrustRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountWebServiceApplePayTrustRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_protocol, a3);

  return v7;
}

- (Class)responseClass
{
  return (Class)-[PKAccountWebServiceApplePayTrustProtocol signatureResponseClass](self->_protocol, "signatureResponseClass");
}

- (id)endpointComponents
{
  void *v2;
  void *v3;

  -[PKAccountWebServiceApplePayTrustProtocol endpointComponents](self->_protocol, "endpointComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", CFSTR("signature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  objc_class *v23;
  int v25;
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKAccountWebServiceApplePayTrustProtocol baseURL](self->_protocol, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceApplePayTrustRequest endpointComponents](self, "endpointComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceApplePayTrustProtocol hashResponse](self->_protocol, "hashResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "referenceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v20;
    v27 = 2082;
    v28 = "baseURL";
LABEL_18:
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v25, 0x16u);

    goto LABEL_19;
  }
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v20;
    v27 = 2082;
    v28 = "endpointComponents";
    goto LABEL_18;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v20;
    v27 = 2082;
    v28 = "appleAccountInformation";
    goto LABEL_18;
  }
  if (!v8)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v20;
      v27 = 2082;
      v28 = "referenceIdentifier";
      goto LABEL_18;
    }
LABEL_19:

    v17 = 0;
    goto LABEL_20;
  }
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v5, v6, 0, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("referenceIdentifier"));
  -[PKApplePayTrustSignature signatureData](self->_signature, "signatureData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hexEncoding");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("signatureData"));

  -[PKApplePayTrustSignature paymentData](self->_signature, "paymentData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("paymentData"));

  }
  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHTTPBody:", v16);

  }
  v17 = (void *)objc_msgSend(v9, "copy");

LABEL_20:
  return v17;
}

- (PKApplePayTrustSignature)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end
