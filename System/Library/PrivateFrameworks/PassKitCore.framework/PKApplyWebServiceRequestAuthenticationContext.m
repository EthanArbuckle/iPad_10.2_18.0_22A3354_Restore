@implementation PKApplyWebServiceRequestAuthenticationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplyWebServiceRequestAuthenticationContext)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceRequestAuthenticationContext *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *certificates;
  uint64_t v11;
  NSData *signaturePayload;
  uint64_t v13;
  NSData *signature;
  uint64_t v15;
  NSData *authenticationCrediential;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKApplyWebServiceRequestAuthenticationContext;
  v5 = -[PKApplyWebServiceRequestAuthenticationContext init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("certificates"));
    v9 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signaturePayload"));
    v11 = objc_claimAutoreleasedReturnValue();
    signaturePayload = v5->_signaturePayload;
    v5->_signaturePayload = (NSData *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v13 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationCrediential"));
    v15 = objc_claimAutoreleasedReturnValue();
    authenticationCrediential = v5->_authenticationCrediential;
    v5->_authenticationCrediential = (NSData *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *certificates;
  id v5;

  certificates = self->_certificates;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", certificates, CFSTR("certificates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signaturePayload, CFSTR("signaturePayload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authenticationCrediential, CFSTR("authenticationCrediential"));

}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)signaturePayload
{
  return self->_signaturePayload;
}

- (void)setSignaturePayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)authenticationCrediential
{
  return self->_authenticationCrediential;
}

- (void)setAuthenticationCrediential:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationCrediential, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_signaturePayload, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end
