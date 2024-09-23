@implementation PKPlugInProxy

- (PKPlugInProxy)initWithURL:(id)a3
{
  void *v4;
  PKPlugInProxy *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPlugInProxy;
    self = -[PKBundleProxy initWithLSBundleProxy:](&v7, sel_initWithLSBundleProxy_, v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PKPlugInProxy)initWithUUID:(id)a3
{
  void *v4;
  PKPlugInProxy *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPlugInProxy;
    self = -[PKBundleProxy initWithLSBundleProxy:](&v7, sel_initWithLSBundleProxy_, v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PKPlugInProxy)initWithLSPlugInKitProxy:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPlugInProxy;
  return -[PKBundleProxy initWithLSBundleProxy:](&v4, sel_initWithLSBundleProxy_, a3);
}

- (NSUUID)pluginUUID
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (PKBundleProxy)containingBundle
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containingBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKBundleProxy *)v3;
}

- (NSString)pluginIdentifier
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)registrationDate
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registrationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)isOnSystemPartition
{
  void *v2;
  char v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnSystemPartition");

  return v3;
}

- (NSString)originalIdentifier
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)infoPlist
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoPlist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSNumber)platform
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (PKExtensionPointProxy)extensionPoint
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionPoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKExtensionPointProxy *)v3;
}

- (NSArray)launchPersonas
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchPersonas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)pluginKitDictionary
{
  void *v2;
  void *v3;

  -[PKBundleProxy lsObject](self, "lsObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginKitDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 inScope:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[PKBundleProxy lsObject](self, "lsObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForInfoDictionaryKey:ofClass:inScope:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
