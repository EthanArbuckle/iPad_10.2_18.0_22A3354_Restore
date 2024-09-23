@implementation NRDLDKeychainItemData

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  NSData *secretData;
  NSData *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NRDLDKeychainItemData;
  v4 = -[NRDLDKeychainItem copyWithZone:](&v9, "copyWithZone:", a3);
  if (self)
    secretData = self->_secretData;
  else
    secretData = 0;
  v6 = secretData;
  v7 = -[NSData copy](v6, "copy");
  if (v4)
    objc_storeStrong(v4 + 2, v7);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secretData, 0);
}

@end
