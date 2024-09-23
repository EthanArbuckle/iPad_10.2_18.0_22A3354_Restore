@implementation SESDefaultNFCApplication

- (SESDefaultNFCApplication)initWithBundleId:(id)a3 displayName:(id)a4 rawDomain:(id)a5
{
  id v9;
  id v10;
  id v11;
  SESDefaultNFCApplication *v12;
  SESDefaultNFCApplication *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SESDefaultNFCApplication;
  v12 = -[SESDefaultNFCApplication init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleId, a3);
    objc_storeStrong((id *)&v13->_localizedDisplayName, a4);
    objc_storeStrong((id *)&v13->_domain, a5);
  }

  return v13;
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)localizedDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)domain
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
