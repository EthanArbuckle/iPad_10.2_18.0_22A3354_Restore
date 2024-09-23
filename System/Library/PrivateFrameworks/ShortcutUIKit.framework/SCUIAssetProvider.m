@implementation SCUIAssetProvider

- (SCUIAssetProvider)initWithBundleURL:(id)a3
{
  id v6;
  SCUIAssetProvider *v7;
  SCUIAssetProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCUIAssetProvider.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleURL != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SCUIAssetProvider;
  v7 = -[SCUIAssetProvider init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_bundleURL, a3);

  return v8;
}

- (id)imageNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SCUIAssetProvider _assetManager](self, "_assetManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:withTrait:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[NSURL URLByAppendingPathComponent:](self->_bundleURL, "URLByAppendingPathComponent:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithContentsOfFile:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_assetManager
{
  _UIAssetManager *assetManager;
  void *v4;
  void *v5;
  uint64_t v6;
  _UIAssetManager *v7;
  _UIAssetManager *v8;

  assetManager = self->_assetManager;
  if (!assetManager)
  {
    -[NSURL URLByAppendingPathComponent:](self->_bundleURL, "URLByAppendingPathComponent:", CFSTR("Assets.car"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = (_UIAssetManager *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7010]), "initWithURL:idiom:error:", v4, v6, 0);
    v8 = self->_assetManager;
    self->_assetManager = v7;

    assetManager = self->_assetManager;
  }
  return assetManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end
