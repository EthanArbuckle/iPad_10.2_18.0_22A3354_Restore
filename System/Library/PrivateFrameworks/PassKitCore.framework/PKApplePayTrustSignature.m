@implementation PKApplePayTrustSignature

- (PKApplePayTrustSignature)initWithSignatureRequest:(id)a3 signature:(id)a4
{
  id v7;
  id v8;
  PKApplePayTrustSignature *v9;
  PKApplePayTrustSignature *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKApplePayTrustSignature;
  v9 = -[PKApplePayTrustSignature init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signatureRequest, a3);
    objc_storeStrong((id *)&v10->_signatureData, a4);
  }

  return v10;
}

- (PKApplePayTrustSignature)initWithCoder:(id)a3
{
  id v4;
  PKApplePayTrustSignature *v5;
  uint64_t v6;
  NSData *signatureData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplePayTrustSignature;
  v5 = -[PKApplePayTrustSignature init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signatureData"));
    v6 = objc_claimAutoreleasedReturnValue();
    signatureData = v5->_signatureData;
    v5->_signatureData = (NSData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_signatureData, CFSTR("signatureData"));
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("signatureData: '%@'; "), self->_signatureData);
  objc_msgSend(v3, "appendFormat:", CFSTR("signatureRequest: '%@'; "), self->_signatureRequest);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplePayTrustSignatureRequest)signatureRequest
{
  return self->_signatureRequest;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (NSData)paymentData
{
  return self->_paymentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentData, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_signatureRequest, 0);
}

@end
