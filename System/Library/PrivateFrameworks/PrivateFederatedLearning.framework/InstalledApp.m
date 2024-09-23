@implementation InstalledApp

- (InstalledApp)initWithBundleIdentifier:(id)a3 supportedMediaCategories:(id)a4 supportedIntents:(id)a5 appName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  InstalledApp *v15;
  InstalledApp *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)InstalledApp;
  v15 = -[InstalledApp init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v16->_supportedMediaCategories, a4);
    objc_storeStrong((id *)&v16->_supportedIntents, a5);
    objc_storeStrong((id *)&v16->_appName, a6);
  }

  return v16;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[InstalledApp bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("InstalledApp { bundleIdentifier: %@ }"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSArray)supportedMediaCategories
{
  return self->_supportedMediaCategories;
}

- (void)setSupportedMediaCategories:(id)a3
{
  objc_storeStrong((id *)&self->_supportedMediaCategories, a3);
}

- (NSArray)supportedIntents
{
  return self->_supportedIntents;
}

- (void)setSupportedIntents:(id)a3
{
  objc_storeStrong((id *)&self->_supportedIntents, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_supportedIntents, 0);
  objc_storeStrong((id *)&self->_supportedMediaCategories, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
