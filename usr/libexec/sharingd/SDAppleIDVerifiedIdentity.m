@implementation SDAppleIDVerifiedIdentity

- (SDAppleIDVerifiedIdentity)initWithAccountIdentifier:(id)a3 emailOrPhone:(id)a4
{
  id v7;
  id v8;
  SDAppleIDVerifiedIdentity *v9;
  SDAppleIDVerifiedIdentity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SDAppleIDVerifiedIdentity;
  v9 = -[SDAppleIDVerifiedIdentity init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountIdentifier, a3);
    objc_storeStrong((id *)&v10->_emailOrPhone, a4);
  }

  return v10;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)emailOrPhone
{
  return self->_emailOrPhone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailOrPhone, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
