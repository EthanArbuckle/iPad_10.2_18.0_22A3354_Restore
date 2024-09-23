@implementation NRDLDKeychainItemSecKey

- (void)dealloc
{
  objc_super v3;

  if (self)
    objc_setProperty_nonatomic(self, a2, 0, 16);
  v3.receiver = self;
  v3.super_class = (Class)NRDLDKeychainItemSecKey;
  -[NRDLDKeychainItemSecKey dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  void *v6;
  __SecKey *secKeyRef;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NRDLDKeychainItemSecKey;
  v4 = -[NRDLDKeychainItem copyWithZone:](&v9, "copyWithZone:", a3);
  v6 = v4;
  if (!self)
  {
    secKeyRef = 0;
    if (!v4)
      return v6;
    goto LABEL_3;
  }
  secKeyRef = self->_secKeyRef;
  if (v4)
LABEL_3:
    objc_setProperty_nonatomic(v4, v5, secKeyRef, 16);
  return v6;
}

@end
