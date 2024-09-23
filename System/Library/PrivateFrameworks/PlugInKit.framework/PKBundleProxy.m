@implementation PKBundleProxy

- (PKBundleProxy)initWithLSBundleProxy:(id)a3
{
  id v5;
  PKBundleProxy *v6;
  PKBundleProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKBundleProxy;
  v6 = -[PKBundleProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lsObject, a3);

  return v7;
}

- (NSURL)bundleURL
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)entitlements
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSURL)dataContainerURL
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)bundleVersion
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (LSBundleProxy)lsObject
{
  return self->_lsObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsObject, 0);
}

@end
