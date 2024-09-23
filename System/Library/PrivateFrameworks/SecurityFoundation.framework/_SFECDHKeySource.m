@implementation _SFECDHKeySource

- (_SFECDHKeySource)initWithLocalKeyPair:(id)a3 remotePublickKey:(id)a4
{
  id v7;
  id v8;
  _SFECDHKeySource *v9;
  SFECDHKeySource_Ivars *v10;
  id ecdhKeySourceInternal;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFECDHKeySource;
  v9 = -[_SFECDHKeySource init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(SFECDHKeySource_Ivars);
    ecdhKeySourceInternal = v9->_ecdhKeySourceInternal;
    v9->_ecdhKeySourceInternal = v10;

    objc_storeStrong((id *)v9->_ecdhKeySourceInternal + 1, a3);
    objc_storeStrong((id *)v9->_ecdhKeySourceInternal + 2, a4);
  }

  return v9;
}

- (_SFECKeyPair)localKeyPair
{
  return (_SFECKeyPair *)*((id *)self->_ecdhKeySourceInternal + 1);
}

- (void)setLocalKeyPair:(id)a3
{
  objc_storeStrong((id *)self->_ecdhKeySourceInternal + 1, a3);
}

- (_SFECPublicKey)remotePublicKey
{
  return (_SFECPublicKey *)*((id *)self->_ecdhKeySourceInternal + 2);
}

- (void)setRemotePublicKey:(id)a3
{
  objc_storeStrong((id *)self->_ecdhKeySourceInternal + 2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ecdhKeySourceInternal, 0);
}

@end
