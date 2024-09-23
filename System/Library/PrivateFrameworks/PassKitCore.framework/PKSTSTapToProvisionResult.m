@implementation PKSTSTapToProvisionResult

- (PKSTSTapToProvisionResult)initWithSTSResult:(id)a3
{
  id v4;
  PKSTSTapToProvisionResult *v5;
  uint64_t v6;
  NSData *encryptedTapData;
  uint64_t v8;
  NSData *casdCertificate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSTSTapToProvisionResult;
  v5 = -[PKSTSTapToProvisionResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "provisionDataBlob");
    v6 = objc_claimAutoreleasedReturnValue();
    encryptedTapData = v5->_encryptedTapData;
    v5->_encryptedTapData = (NSData *)v6;

    objc_msgSend(v4, "casdCertificate");
    v8 = objc_claimAutoreleasedReturnValue();
    casdCertificate = v5->_casdCertificate;
    v5->_casdCertificate = (NSData *)v8;

  }
  return v5;
}

- (NSData)encryptedTapData
{
  return self->_encryptedTapData;
}

- (NSData)casdCertificate
{
  return self->_casdCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casdCertificate, 0);
  objc_storeStrong((id *)&self->_encryptedTapData, 0);
}

@end
