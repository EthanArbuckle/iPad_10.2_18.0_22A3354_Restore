@implementation SBFBacklightSceneHostEnvironmentProviderEntry

+ (id)entryWithSceneHostEnvironment:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSceneHostEnvironment:bundleIdentifier:", v7, v6);

  return v8;
}

- (SBFBacklightSceneHostEnvironmentProviderEntry)initWithSceneHostEnvironment:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  SBFBacklightSceneHostEnvironmentProviderEntry *v9;
  SBFBacklightSceneHostEnvironmentProviderEntry *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBFBacklightSceneHostEnvironmentProviderEntry;
  v9 = -[SBFBacklightSceneHostEnvironmentProviderEntry init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a3);
    v11 = objc_msgSend(v8, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

  }
  return v10;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
