@implementation PKApplePayTrustSignatureRequest

- (PKApplePayTrustSignatureRequest)initWithKeyIdentifier:(id)a3 manifestHash:(id)a4 nonce:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKApplePayTrustSignatureRequest *v12;
  PKApplePayTrustSignatureRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKApplePayTrustSignatureRequest;
  v12 = -[PKApplePayTrustSignatureRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyIdentifier, a3);
    objc_storeStrong((id *)&v13->_manifestHash, a4);
    objc_storeStrong((id *)&v13->_nonce, a5);
  }

  return v13;
}

- (PKApplePayTrustSignatureRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplePayTrustSignatureRequest *v5;
  uint64_t v6;
  NSData *nonce;
  uint64_t v8;
  NSData *manifestHash;
  uint64_t v10;
  NSString *keyIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKApplePayTrustSignatureRequest;
  v5 = -[PKApplePayTrustSignatureRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v6 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifestHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *nonce;
  id v5;

  nonce = self->_nonce;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", nonce, CFSTR("nonce"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manifestHash, CFSTR("manifestHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyIdentifier, CFSTR("keyIdentifier"));

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("keyIdentifier: '%@'; "), self->_keyIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("manifestHash length: '%lu'; "),
    -[NSData length](self->_manifestHash, "length"));
  objc_msgSend(v3, "appendFormat:", CFSTR("nonce length: '%lu'; "), -[NSData length](self->_nonce, "length"));
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

- (NSData)nonce
{
  return self->_nonce;
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
