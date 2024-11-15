@implementation SESKeyPair

- (SESKeyPair)initWithPublicKey:(id)a3 secretKey:(id)a4
{
  id v7;
  id v8;
  SESKeyPair *v9;
  SESKeyPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SESKeyPair;
  v9 = -[SESKeyPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publicKey, a3);
    objc_storeStrong((id *)&v10->_secretKey, a4);
  }

  return v10;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSData)secretKey
{
  return self->_secretKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secretKey, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end
