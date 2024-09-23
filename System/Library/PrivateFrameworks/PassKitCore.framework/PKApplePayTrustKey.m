@implementation PKApplePayTrustKey

- (PKApplePayTrustKey)initWithKey:(id)a3
{
  id v4;
  PKApplePayTrustKey *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSData *signedEnrollmentData;
  void *v11;
  uint64_t v12;
  NSData *publicKeyHash;
  void *v14;
  uint64_t v15;
  NSData *certificate;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKApplePayTrustKey;
  v5 = -[PKApplePayTrustKey init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "keyAttestation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pk_decodeHexadecimal");
    v9 = objc_claimAutoreleasedReturnValue();
    signedEnrollmentData = v5->_signedEnrollmentData;
    v5->_signedEnrollmentData = (NSData *)v9;

    objc_msgSend(v4, "publicKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "SHA256Hash");
    v12 = objc_claimAutoreleasedReturnValue();
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v12;

    objc_msgSend(v4, "keyAttestationAuthority");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pk_decodeHexadecimal");
    v15 = objc_claimAutoreleasedReturnValue();
    certificate = v5->_certificate;
    v5->_certificate = (NSData *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *signedEnrollmentData;
  id v5;

  signedEnrollmentData = self->_signedEnrollmentData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", signedEnrollmentData, CFSTR("signedEnrollmentData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicKeyHash, CFSTR("publicKeyHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificate, CFSTR("certificate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (PKApplePayTrustKey)initWithCoder:(id)a3
{
  id v4;
  PKApplePayTrustKey *v5;
  uint64_t v6;
  NSData *signedEnrollmentData;
  uint64_t v8;
  NSData *publicKeyHash;
  uint64_t v10;
  NSData *certificate;
  uint64_t v12;
  NSString *identifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKApplePayTrustKey;
  v5 = -[PKApplePayTrustKey init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedEnrollmentData"));
    v6 = objc_claimAutoreleasedReturnValue();
    signedEnrollmentData = v5->_signedEnrollmentData;
    v5->_signedEnrollmentData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("certificate"));
    v10 = objc_claimAutoreleasedReturnValue();
    certificate = v5->_certificate;
    v5->_certificate = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("signedEnrollmentData: '%@'; "), self->_signedEnrollmentData);
  objc_msgSend(v3, "appendFormat:", CFSTR("publicKeyHash: '%@'; "), self->_publicKeyHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("certificate: '%@'; "), self->_certificate);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)signedEnrollmentData
{
  return self->_signedEnrollmentData;
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_signedEnrollmentData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
