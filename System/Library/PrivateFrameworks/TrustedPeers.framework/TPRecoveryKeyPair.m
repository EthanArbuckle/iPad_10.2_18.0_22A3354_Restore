@implementation TPRecoveryKeyPair

- (TPRecoveryKeyPair)initWithSigningKeyData:(id)a3 encryptionKeyData:(id)a4
{
  id v7;
  id v8;
  TPRecoveryKeyPair *v9;
  TPRecoveryKeyPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPRecoveryKeyPair;
  v9 = -[TPRecoveryKeyPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signingKeyData, a3);
    objc_storeStrong((id *)&v10->_encryptionKeyData, a4);
  }

  return v10;
}

- (TPRecoveryKeyPair)initWithStableInfo:(id)a3
{
  id v4;
  TPRecoveryKeyPair *v5;
  uint64_t v6;
  NSData *signingKeyData;
  uint64_t v8;
  NSData *encryptionKeyData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPRecoveryKeyPair;
  v5 = -[TPRecoveryKeyPair init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "recoverySigningPublicKey");
    v6 = objc_claimAutoreleasedReturnValue();
    signingKeyData = v5->_signingKeyData;
    v5->_signingKeyData = (NSData *)v6;

    objc_msgSend(v4, "recoveryEncryptionPublicKey");
    v8 = objc_claimAutoreleasedReturnValue();
    encryptionKeyData = v5->_encryptionKeyData;
    v5->_encryptionKeyData = (NSData *)v8;

  }
  return v5;
}

- (NSData)signingKeyData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)encryptionKeyData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKeyData, 0);
  objc_storeStrong((id *)&self->_signingKeyData, 0);
}

@end
