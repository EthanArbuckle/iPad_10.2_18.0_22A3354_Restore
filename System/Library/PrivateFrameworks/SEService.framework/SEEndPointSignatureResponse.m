@implementation SEEndPointSignatureResponse

+ (id)responseWithSignedData:(id)a3 signature:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setSignedData:", v5);
    objc_msgSend(v8, "setSignature:", v6);
  }

  return v8;
}

+ (id)signature:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setSignature:", v3);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SEEndPointSignatureResponse signedData](self, "signedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointSignatureResponse signature](self, "signature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asHexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\n\tsignedData : %@,\n\tsignature : %@\n}"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SEEndPointSignatureResponse signedData](self, "signedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("signedData"));

  -[SEEndPointSignatureResponse signature](self, "signature");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("signature"));

}

- (SEEndPointSignatureResponse)initWithCoder:(id)a3
{
  id v4;
  SEEndPointSignatureResponse *v5;
  SEEndPointSignatureResponse *v6;
  void *v7;
  uint64_t v8;
  NSData *signedData;
  void *v10;
  uint64_t v11;
  NSData *signature;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SEEndPointSignatureResponse;
  v5 = -[SEEndPointSignatureResponse init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SEEndPointSignatureResponse signedData](v5, "signedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedData"));
    v8 = objc_claimAutoreleasedReturnValue();
    signedData = v6->_signedData;
    v6->_signedData = (NSData *)v8;

    -[SEEndPointSignatureResponse signature](v6, "signature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v11 = objc_claimAutoreleasedReturnValue();
    signature = v6->_signature;
    v6->_signature = (NSData *)v11;

  }
  return v6;
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
}

@end
