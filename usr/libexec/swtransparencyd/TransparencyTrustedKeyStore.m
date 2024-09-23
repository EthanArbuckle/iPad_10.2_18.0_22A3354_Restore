@implementation TransparencyTrustedKeyStore

- (TransparencyTrustedKeyStore)initWithTrustedKeys:(id)a3
{
  id v4;
  TransparencyTrustedKeyStore *v5;
  TransparencyTrustedKeyStore *v6;
  TransparencySignatureVerifier *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransparencyTrustedKeyStore;
  v5 = -[TransparencyTrustedKeyStore init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[TransparencyTrustedKeyStore setTrustedKeys:](v5, "setTrustedKeys:", v4);
    v7 = -[TransparencySignatureVerifier initWithTrustedKeys:]([TransparencySignatureVerifier alloc], "initWithTrustedKeys:", v4);
    -[TransparencyTrustedKeyStore setSignatureVerifier:](v6, "setSignatureVerifier:", v7);

  }
  return v6;
}

- (TransparencySignatureVerifier)signatureVerifier
{
  return (TransparencySignatureVerifier *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSignatureVerifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)trustedKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrustedKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedKeys, 0);
  objc_storeStrong((id *)&self->_signatureVerifier, 0);
}

@end
