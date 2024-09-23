@implementation TVApplicationControllerContext

- (TVApplicationControllerContext)init
{
  TVApplicationControllerContext *v2;
  uint64_t v3;
  NSDictionary *launchOptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVApplicationControllerContext;
  v2 = -[TVApplicationControllerContext init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    launchOptions = v2->_launchOptions;
    v2->_launchOptions = (NSDictionary *)v3;

    v2->_supportsPictureInPicturePlayback = 1;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TVApplicationControllerContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = -[TVApplicationControllerContext init](+[TVApplicationControllerContext allocWithZone:](TVApplicationControllerContext, "allocWithZone:", a3), "init");
  -[TVApplicationControllerContext javaScriptApplicationURL](self, "javaScriptApplicationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVApplicationControllerContext setJavaScriptApplicationURL:](v4, "setJavaScriptApplicationURL:", v5);

  -[TVApplicationControllerContext storageIdentifier](self, "storageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVApplicationControllerContext setStorageIdentifier:](v4, "setStorageIdentifier:", v6);

  -[TVApplicationControllerContext launchOptions](self, "launchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVApplicationControllerContext setLaunchOptions:](v4, "setLaunchOptions:", v7);

  -[TVApplicationControllerContext setSupplementary:](v4, "setSupplementary:", -[TVApplicationControllerContext isSupplementary](self, "isSupplementary"));
  -[TVApplicationControllerContext appLocalJSURL](self, "appLocalJSURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVApplicationControllerContext setAppLocalJSURL:](v4, "setAppLocalJSURL:", v8);

  -[TVApplicationControllerContext appJSCachePath](self, "appJSCachePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVApplicationControllerContext setAppJSCachePath:](v4, "setAppJSCachePath:", v9);

  -[TVApplicationControllerContext bagBootURLKey](self, "bagBootURLKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVApplicationControllerContext setBagBootURLKey:](v4, "setBagBootURLKey:", v10);

  -[TVApplicationControllerContext offlineJSURL](self, "offlineJSURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVApplicationControllerContext setOfflineJSURL:](v4, "setOfflineJSURL:", v11);

  -[TVApplicationControllerContext setSupportsPictureInPicturePlayback:](v4, "setSupportsPictureInPicturePlayback:", -[TVApplicationControllerContext supportsPictureInPicturePlayback](self, "supportsPictureInPicturePlayback"));
  return v4;
}

- (NSURL)javaScriptApplicationURL
{
  return self->_javaScriptApplicationURL;
}

- (void)setJavaScriptApplicationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)storageIdentifier
{
  return self->_storageIdentifier;
}

- (void)setStorageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)supportsPictureInPicturePlayback
{
  return self->_supportsPictureInPicturePlayback;
}

- (void)setSupportsPictureInPicturePlayback:(BOOL)a3
{
  self->_supportsPictureInPicturePlayback = a3;
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (void)setLaunchOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isSupplementary
{
  return self->_supplementary;
}

- (void)setSupplementary:(BOOL)a3
{
  self->_supplementary = a3;
}

- (NSURL)appLocalJSURL
{
  return self->_appLocalJSURL;
}

- (void)setAppLocalJSURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)appJSCachePath
{
  return self->_appJSCachePath;
}

- (void)setAppJSCachePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)bagBootURLKey
{
  return self->_bagBootURLKey;
}

- (void)setBagBootURLKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)offlineJSURL
{
  return self->_offlineJSURL;
}

- (void)setOfflineJSURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineJSURL, 0);
  objc_storeStrong((id *)&self->_bagBootURLKey, 0);
  objc_storeStrong((id *)&self->_appJSCachePath, 0);
  objc_storeStrong((id *)&self->_appLocalJSURL, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_storageIdentifier, 0);
  objc_storeStrong((id *)&self->_javaScriptApplicationURL, 0);
}

@end
