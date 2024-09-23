@implementation PKApplePayTrustKeyRequest

- (PKApplePayTrustKeyRequest)initWithKeyIdentifier:(id)a3 subjectIdentifier:(id)a4
{
  id v7;
  id v8;
  PKApplePayTrustKeyRequest *v9;
  PKApplePayTrustKeyRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplePayTrustKeyRequest;
  v9 = -[PKApplePayTrustKeyRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyIdentifier, a3);
    objc_storeStrong((id *)&v10->_subjectIdentifier, a4);
  }

  return v10;
}

- (PKApplePayTrustKeyRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplePayTrustKeyRequest *v5;
  uint64_t v6;
  NSString *keyIdentifier;
  uint64_t v8;
  NSData *subjectIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplePayTrustKeyRequest;
  v5 = -[PKApplePayTrustKeyRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subjectIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    subjectIdentifier = v5->_subjectIdentifier;
    v5->_subjectIdentifier = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *keyIdentifier;
  id v5;

  keyIdentifier = self->_keyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", keyIdentifier, CFSTR("keyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subjectIdentifier, CFSTR("subjectIdentifier"));

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("keyIdentifier: '%@'; "), self->_keyIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("subjectIdentifier: '%@'; "), self->_subjectIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSData)subjectIdentifier
{
  return self->_subjectIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
