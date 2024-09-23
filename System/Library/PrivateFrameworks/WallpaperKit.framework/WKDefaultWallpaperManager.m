@implementation WKDefaultWallpaperManager

- (WKDefaultWallpaperManager)initWithCollectionsManager:(id)a3
{
  id v5;
  WKDefaultWallpaperManager *v6;
  WKDefaultWallpaperManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WKDefaultWallpaperManager;
  v6 = -[WKDefaultWallpaperManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__collectionsManager, a3);
    -[WKDefaultWallpaperManager _loadDefaultWallpaperFile](v7, "_loadDefaultWallpaperFile");
    -[WKDefaultWallpaperManager _loadDefaultWallpaperInformation](v7, "_loadDefaultWallpaperInformation");
  }

  return v7;
}

+ (WKDefaultWallpaperManager)defaultWallpaperManager
{
  if (defaultWallpaperManager_onceToken[0] != -1)
    dispatch_once(defaultWallpaperManager_onceToken, &__block_literal_global_8);
  return (WKDefaultWallpaperManager *)(id)defaultWallpaperManager__defaultManager;
}

void __52__WKDefaultWallpaperManager_defaultWallpaperManager__block_invoke()
{
  WKDefaultWallpaperManager *v0;
  void *v1;
  WKWallpaperRepresentingCollectionsManager *v2;

  v2 = -[WKWallpaperRepresentingCollectionsManager initWithDownloadManager:]([WKWallpaperRepresentingCollectionsManager alloc], "initWithDownloadManager:", 0);
  v0 = -[WKDefaultWallpaperManager initWithCollectionsManager:]([WKDefaultWallpaperManager alloc], "initWithCollectionsManager:", v2);
  v1 = (void *)defaultWallpaperManager__defaultManager;
  defaultWallpaperManager__defaultManager = (uint64_t)v0;

}

- (void)_loadDefaultWallpaperFile
{
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  OUTLINED_FUNCTION_0(&dword_1B8C64000, a3, v8, "%{public}@: Default wallpaper lookup file does not exist at path '%{public}@'", (uint8_t *)&v9);

}

- (void)_loadDefaultWallpaperInformation
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[WKDefaultWallpaperManager _loadDefaultWallpaperInformation]";
  v5 = 2114;
  v6 = a1;
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_1B8C64000, log, OS_LOG_TYPE_ERROR, "%s: No compatible wallpaper found on disk (wallpaperIdentifier: '%{public}@'; collectionIdentifier: '%{public}@'.); "
    "falling back to synthesized wallpaper.",
    (uint8_t *)&v3,
    0x20u);
}

void __61__WKDefaultWallpaperManager__loadDefaultWallpaperInformation__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  WKLogForCategory(2uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[WKDefaultWallpaperManager _loadDefaultWallpaperInformation]_block_invoke";
    _os_log_impl(&dword_1B8C64000, v0, OS_LOG_TYPE_DEFAULT, "%s: Complete.", (uint8_t *)&v1, 0xCu);
  }

}

+ (id)defaultWallpaperLookupURL
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WKWallpapersBaseURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MGCopyAnswer();
  WKLogForCategory(2uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass((Class)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_1B8C64000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolving default wallpaper for device name '%{public}@'", buf, 0x16u);

  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("DefaultWallpapers~%@.plist"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WKLogForCategory(2uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass((Class)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_1B8C64000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolved to default wallpaper look up file at path '%{public}@'", buf, 0x16u);

  }
  return v10;
}

- (id)deviceProductType
{
  return (id)MGCopyAnswer();
}

- (id)deviceLogicalScreenClass
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WKLogicalScreenClassString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WKLogForCategory(2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v2;
    _os_log_impl(&dword_1B8C64000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolved to logical screen class '%{public}@'", (uint8_t *)&v7, 0x16u);

  }
  return v2;
}

- (id)deviceColor
{
  return (id)MGCopyAnswer();
}

- (id)deviceEnclosureColor
{
  return (id)MGCopyAnswer();
}

- (id)_wallpaperRepresentingWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  -[WKDefaultWallpaperManager _collectionsManager](self, "_collectionsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfWallpaperCollections");

  if (v6 < 1)
  {
LABEL_5:
    v10 = 0;
  }
  else
  {
    v7 = 0;
    while (1)
    {
      -[WKDefaultWallpaperManager _collectionsManager](self, "_collectionsManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "wallpaperCollectionAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "wallpaperRepresentingWithIdentifier:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        break;
      ++v7;
      -[WKDefaultWallpaperManager _collectionsManager](self, "_collectionsManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "numberOfWallpaperCollections");

      if (v7 >= v12)
        goto LABEL_5;
    }
  }

  return v10;
}

- (NSDictionary)_defaultWallpaperLookup
{
  return self->__defaultWallpaperLookup;
}

- (void)set_defaultWallpaperLookup:(id)a3
{
  objc_storeStrong((id *)&self->__defaultWallpaperLookup, a3);
}

- (WKWallpaperRepresentingCollectionsManager)_collectionsManager
{
  return self->__collectionsManager;
}

- (void)set_collectionsManager:(id)a3
{
  objc_storeStrong((id *)&self->__collectionsManager, a3);
}

- (WKWallpaperBundle)_defaultWallpaperBundle
{
  return self->__defaultWallpaperBundle;
}

- (void)set_defaultWallpaperBundle:(id)a3
{
  objc_storeStrong((id *)&self->__defaultWallpaperBundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__defaultWallpaperBundle, 0);
  objc_storeStrong((id *)&self->__collectionsManager, 0);
  objc_storeStrong((id *)&self->__defaultWallpaperLookup, 0);
}

@end
