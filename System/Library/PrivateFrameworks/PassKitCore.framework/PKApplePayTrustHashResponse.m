@implementation PKApplePayTrustHashResponse

- (PKApplePayTrustHashResponse)initWithData:(id)a3
{
  PKApplePayTrustHashResponse *v3;
  PKApplePayTrustHashResponse *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSString *referenceIdentifier;
  NSObject *v9;
  uint64_t v10;
  NSData *nonce;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PKApplePayTrustHashResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v17, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v6, "PKStringForKey:", CFSTR("referenceIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      referenceIdentifier = v4->_referenceIdentifier;
      v4->_referenceIdentifier = (NSString *)v7;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("nonce"));
      v9 = objc_claimAutoreleasedReturnValue();

      -[NSObject pk_decodeHexadecimal](v9, "pk_decodeHexadecimal");
      v10 = objc_claimAutoreleasedReturnValue();
      nonce = v4->_nonce;
      v4->_nonce = (NSData *)v10;

    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        v20 = 2114;
        v21 = v15;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplePayTrustHashResponse)initWithCoder:(id)a3
{
  id v4;
  PKApplePayTrustHashResponse *v5;
  uint64_t v6;
  NSString *referenceIdentifier;
  uint64_t v8;
  NSData *nonce;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplePayTrustHashResponse;
  v5 = -[PKWebServiceResponse initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v8 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplePayTrustHashResponse;
  v4 = a3;
  -[PKWebServiceResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_referenceIdentifier, CFSTR("referenceIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));

}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
}

@end
