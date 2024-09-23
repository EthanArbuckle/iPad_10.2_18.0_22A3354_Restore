@implementation KeychainItem

- (KeychainItem)initWithAccessGroup:(id)a3
{
  id v5;
  KeychainItem *v6;
  KeychainItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KeychainItem;
  v6 = -[KeychainItem init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accessGroup, a3);

  return v7;
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccessGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

@end
