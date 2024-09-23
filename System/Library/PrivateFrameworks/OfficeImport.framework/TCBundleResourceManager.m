@implementation TCBundleResourceManager

+ (id)instance
{
  id v2;
  void *v3;
  TCBundleResourceManager *v4;
  void *v5;
  id v6;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)sInstance;
  if (!sInstance)
  {
    v4 = objc_alloc_init(TCBundleResourceManager);
    v5 = (void *)sInstance;
    sInstance = (uint64_t)v4;

    v3 = (void *)sInstance;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (void)disposeInstance
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)sInstance;
  if (sInstance)
  {
    sInstance = 0;

  }
  objc_sync_exit(obj);

}

- (TCBundleResourceManager)init
{
  TCBundleResourceManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mPackageMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TCBundleResourceManager;
  v2 = -[TCBundleResourceManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mPackageMap = v2->mPackageMap;
    v2->mPackageMap = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)dataForResource:(id)a3 ofType:(id)a4 inPackage:(id)a5 cacheResult:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[TCBundleResourceDebugEntry addEntry:ofType:inPackage:cacheResult:](TCBundleResourceDebugEntry, "addEntry:ofType:inPackage:cacheResult:", v10, v11, v12, v6);
  -[TCBundleResourceManager packageWithName:cacheResult:](self, "packageWithName:cacheResult:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "stringByAppendingPathExtension:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "entryWithName:cacheResult:", v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      +[TCBundleResourceException raise:format:](TCBundleResourceException, "raise:format:", CFSTR("TCBundleResourcePackageEntryNotFoundError"), CFSTR("Entry %@ not found in package %@"), v14, v12);
    objc_msgSend(v15, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)packageEntryForResource:(id)a3 ofType:(id)a4 inPackage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[TCBundleResourceDebugEntry addEntry:ofType:inPackage:cacheResult:](TCBundleResourceDebugEntry, "addEntry:ofType:inPackage:cacheResult:", v8, v9, v10, 0);
  -[TCBundleResourceManager packageWithName:cacheResult:](self, "packageWithName:cacheResult:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "stringByAppendingPathExtension:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "entryWithName:cacheResult:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      +[TCBundleResourceException raise:format:](TCBundleResourceException, "raise:format:", CFSTR("TCBundleResourcePackageEntryNotFoundError"), CFSTR("Entry %@ not found in package %@"), v12, v10);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_xmlDoc)xmlDocumentForResource:(id)a3 ofType:(id)a4 inPackage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _xmlDoc *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[TCBundleResourceDebugEntry addEntry:ofType:inPackage:cacheResult:](TCBundleResourceDebugEntry, "addEntry:ofType:inPackage:cacheResult:", v8, v9, v10, 1);
  -[TCBundleResourceManager packageWithName:cacheResult:](self, "packageWithName:cacheResult:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "stringByAppendingPathExtension:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "entryWithName:cacheResult:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      +[TCBundleResourceException raise:format:](TCBundleResourceException, "raise:format:", CFSTR("TCBundleResourcePackageEntryNotFoundError"), CFSTR("Entry %@ not found in package %@"), v12, v10);
    v14 = (_xmlDoc *)objc_msgSend(v13, "xmlDocument");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPackageMap, 0);
}

- (id)packageWithName:(id)a3 cacheResult:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  TCBundleResourcePackage *v7;
  void *v8;
  void *v9;
  OISFUZipArchive *v10;
  NSMutableDictionary *v11;

  v4 = a4;
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->mPackageMap, "objectForKey:", v6);
  v7 = (TCBundleResourcePackage *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    TCBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForResource:ofType:", v6, CFSTR("zip"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      os_unfair_lock_unlock(&self->_lock);
      +[TCBundleResourceException raise:format:](TCBundleResourceException, "raise:format:", CFSTR("TCBundleResourcePackageNotFound"), CFSTR("Couldn't find bundle resource package named %@"), v6);
    }
    v10 = -[OISFUZipArchive initWithPath:collapseCommonRootDirectory:]([OISFUZipArchive alloc], "initWithPath:collapseCommonRootDirectory:", v9, 0);
    if (v10)
    {
      v7 = -[TCBundleResourcePackage initWithZipArchive:]([TCBundleResourcePackage alloc], "initWithZipArchive:", v10);
      if (v4)
      {
        v11 = self->mPackageMap;
        objc_sync_enter(v11);
        -[NSMutableDictionary setObject:forKey:](self->mPackageMap, "setObject:forKey:", v7, v6);
        objc_sync_exit(v11);

      }
    }
    else
    {
      v7 = 0;
    }

  }
  os_unfair_lock_unlock(&self->_lock);

  return v7;
}

@end
