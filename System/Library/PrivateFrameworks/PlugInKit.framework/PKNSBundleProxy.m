@implementation PKNSBundleProxy

- (PKNSBundleProxy)initWithNSBundle:(id)a3
{
  id v5;
  PKNSBundleProxy *v6;
  PKNSBundleProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKNSBundleProxy;
  v6 = -[PKNSBundleProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__underlyingNSBundle, a3);

  return v7;
}

- (NSURL)bundleURL
{
  void *v2;
  void *v3;

  -[PKNSBundleProxy _underlyingNSBundle](self, "_underlyingNSBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[PKNSBundleProxy _underlyingNSBundle](self, "_underlyingNSBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)builtInPlugInsURL
{
  void *v2;
  void *v3;

  -[PKNSBundleProxy _underlyingNSBundle](self, "_underlyingNSBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "builtInPlugInsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSDictionary)infoDictionary
{
  void *v2;
  void *v3;

  -[PKNSBundleProxy _underlyingNSBundle](self, "_underlyingNSBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)localizedInfoDictionary
{
  void *v2;
  void *v3;

  -[PKNSBundleProxy _underlyingNSBundle](self, "_underlyingNSBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedInfoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (Class)principalClass
{
  void *v2;
  void *v3;

  -[PKNSBundleProxy _underlyingNSBundle](self, "_underlyingNSBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "principalClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (BOOL)loadAndReturnError:(id *)a3
{
  void *v4;

  -[PKNSBundleProxy _underlyingNSBundle](self, "_underlyingNSBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "loadAndReturnError:", a3);

  return (char)a3;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKNSBundleProxy _underlyingNSBundle](self, "_underlyingNSBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSBundle)_underlyingNSBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__underlyingNSBundle, 0);
}

@end
