@implementation SESDataAttestation

- (SESDataAttestation)initWithAppBundleID:(id)a3 nonce:(id)a4 signedData:(id)a5 signature:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SESDataAttestation *v15;
  SESDataAttestation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SESDataAttestation;
  v15 = -[SESDataAttestation init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appBundleID, a3);
    objc_storeStrong((id *)&v16->_nonce, a4);
    objc_storeStrong((id *)&v16->_signedData, a5);
    objc_storeStrong((id *)&v16->_signature, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SESDataAttestation appBundleID](self, "appBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("appBundleID"));

  -[SESDataAttestation nonce](self, "nonce");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("nonce"));

  -[SESDataAttestation signedData](self, "signedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("signedData"));

  -[SESDataAttestation signature](self, "signature");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("signature"));

}

- (SESDataAttestation)initWithCoder:(id)a3
{
  id v4;
  SESDataAttestation *v5;
  SESDataAttestation *v6;
  void *v7;
  uint64_t v8;
  NSString *appBundleID;
  void *v10;
  uint64_t v11;
  NSData *nonce;
  void *v13;
  uint64_t v14;
  NSData *signedData;
  void *v16;
  uint64_t v17;
  NSData *signature;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SESDataAttestation;
  v5 = -[SESDataAttestation init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SESDataAttestation appBundleID](v5, "appBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    appBundleID = v6->_appBundleID;
    v6->_appBundleID = (NSString *)v8;

    -[SESDataAttestation nonce](v6, "nonce");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v11 = objc_claimAutoreleasedReturnValue();
    nonce = v6->_nonce;
    v6->_nonce = (NSData *)v11;

    -[SESDataAttestation signedData](v6, "signedData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedData"));
    v14 = objc_claimAutoreleasedReturnValue();
    signedData = v6->_signedData;
    v6->_signedData = (NSData *)v14;

    -[SESDataAttestation signature](v6, "signature");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v17 = objc_claimAutoreleasedReturnValue();
    signature = v6->_signature;
    v6->_signature = (NSData *)v17;

  }
  return v6;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleID, a3);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
  objc_storeStrong((id *)&self->_signedData, a3);
}

- (NSData)signature
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
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

@end
