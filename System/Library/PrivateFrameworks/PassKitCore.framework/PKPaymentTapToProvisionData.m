@implementation PKPaymentTapToProvisionData

- (PKPaymentTapToProvisionData)initWithEncryptedData:(id)a3 casdCertificate:(id)a4
{
  id v7;
  id v8;
  PKPaymentTapToProvisionData *v9;
  PKPaymentTapToProvisionData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentTapToProvisionData;
  v9 = -[PKPaymentTapToProvisionData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptedData, a3);
    objc_storeStrong((id *)&v10->_casdCertificate, a4);
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("encryptedTapData");
  -[NSData base64EncodedStringWithOptions:](self->_encryptedData, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("casdCertificate");
  v8[0] = v3;
  -[NSData base64EncodedStringWithOptions:](self->_casdCertificate, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PKPaymentTapToProvisionData)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTapToProvisionData *v5;
  uint64_t v6;
  NSData *encryptedData;
  uint64_t v8;
  NSData *casdCertificate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentTapToProvisionData;
  v5 = -[PKPaymentTapToProvisionData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedData"));
    v6 = objc_claimAutoreleasedReturnValue();
    encryptedData = v5->_encryptedData;
    v5->_encryptedData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("casdCertificate"));
    v8 = objc_claimAutoreleasedReturnValue();
    casdCertificate = v5->_casdCertificate;
    v5->_casdCertificate = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *encryptedData;
  id v5;

  encryptedData = self->_encryptedData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", encryptedData, CFSTR("encryptedData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_casdCertificate, CFSTR("casdCertificate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (NSData)casdCertificate
{
  return self->_casdCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casdCertificate, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
}

@end
