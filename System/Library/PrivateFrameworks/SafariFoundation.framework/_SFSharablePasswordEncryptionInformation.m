@implementation _SFSharablePasswordEncryptionInformation

- (_SFSharablePasswordEncryptionInformation)initWithEncryptedPasswordData:(id)a3 encryptionKeyReference:(id)a4
{
  id v6;
  id v7;
  _SFSharablePasswordEncryptionInformation *v8;
  uint64_t v9;
  NSData *encryptedPasswordData;
  uint64_t v11;
  NSData *encryptionKeyReference;
  _SFSharablePasswordEncryptionInformation *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SFSharablePasswordEncryptionInformation;
  v8 = -[_SFSharablePasswordEncryptionInformation init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    encryptedPasswordData = v8->_encryptedPasswordData;
    v8->_encryptedPasswordData = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    encryptionKeyReference = v8->_encryptionKeyReference;
    v8->_encryptionKeyReference = (NSData *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSData)encryptedPasswordData
{
  return self->_encryptedPasswordData;
}

- (NSData)encryptionKeyReference
{
  return self->_encryptionKeyReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKeyReference, 0);
  objc_storeStrong((id *)&self->_encryptedPasswordData, 0);
}

@end
