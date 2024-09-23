@implementation _LTDAnalyticsAssetSnapshot

- (_LTDAnalyticsAssetSnapshot)initWithAssetBuild:(id)a3 expectedAssetVersion:(id)a4 installedAssetVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LTDAnalyticsAssetSnapshot *v11;
  uint64_t v12;
  NSString *assetBuild;
  uint64_t v14;
  NSString *expectedAssetVersion;
  uint64_t v16;
  NSString *installedAssetVersion;
  _LTDAnalyticsAssetSnapshot *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_LTDAnalyticsAssetSnapshot;
  v11 = -[_LTDAnalyticsAssetSnapshot init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    assetBuild = v11->_assetBuild;
    v11->_assetBuild = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    expectedAssetVersion = v11->_expectedAssetVersion;
    v11->_expectedAssetVersion = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    installedAssetVersion = v11->_installedAssetVersion;
    v11->_installedAssetVersion = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (BOOL)hasAllData
{
  return self->_assetBuild && self->_expectedAssetVersion && self->_installedAssetVersion != 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDAnalyticsAssetSnapshot assetBuild](self, "assetBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDAnalyticsAssetSnapshot expectedAssetVersion](self, "expectedAssetVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDAnalyticsAssetSnapshot installedAssetVersion](self, "installedAssetVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; assetBuild: %@; expectedAssetVersion: %@; installedAssetVersion: %@>"),
    v5,
    self,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)assetBuild
{
  return self->_assetBuild;
}

- (NSString)expectedAssetVersion
{
  return self->_expectedAssetVersion;
}

- (NSString)installedAssetVersion
{
  return self->_installedAssetVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedAssetVersion, 0);
  objc_storeStrong((id *)&self->_expectedAssetVersion, 0);
  objc_storeStrong((id *)&self->_assetBuild, 0);
}

@end
