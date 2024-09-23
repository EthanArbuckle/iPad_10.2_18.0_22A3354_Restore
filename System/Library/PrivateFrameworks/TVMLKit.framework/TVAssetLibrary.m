@implementation TVAssetLibrary

+ (id)sharedInstance
{
  return (id)sSharedInstance;
}

+ (void)initializeAssetLibraryWithCachePath:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "initializeAssetLibraryWithCachePath:purgeCacheOnLoad:", v3, 0);

}

+ (void)initializeAssetLibraryWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_initializeAssetLibraryWithCachePath:screensaverCache:purgeCacheOnLoad:", v5, 0, v4);

}

+ (void)intializeScreensaverSharedAssetLibrary
{
  id v2;

  objc_msgSend(CFSTR("/var/mobile/Library/Caches"), "stringByAppendingPathComponent:", CFSTR("com.apple.AppleTV"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_initializeAssetLibraryWithCachePath:screensaverCache:purgeCacheOnLoad:", v2, 1, 0);

}

+ (void)_initializeAssetLibraryWithCachePath:(id)a3 screensaverCache:(BOOL)a4 purgeCacheOnLoad:(BOOL)a5
{
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  BOOL v12;
  BOOL v13;

  v9 = a3;
  v7 = objc_msgSend(v9, "length");
  v8 = v9;
  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__TVAssetLibrary__initializeAssetLibraryWithCachePath_screensaverCache_purgeCacheOnLoad___block_invoke;
    block[3] = &unk_24EB856A8;
    v11 = v9;
    v12 = a4;
    v13 = a5;
    if (_initializeAssetLibraryWithCachePath_screensaverCache_purgeCacheOnLoad__onceToken != -1)
      dispatch_once(&_initializeAssetLibraryWithCachePath_screensaverCache_purgeCacheOnLoad__onceToken, block);

    v8 = v9;
  }

}

void __89__TVAssetLibrary__initializeAssetLibraryWithCachePath_screensaverCache_purgeCacheOnLoad___block_invoke(uint64_t a1)
{
  TVAssetLibrary *v1;
  void *v2;

  v1 = -[TVAssetLibrary initWithCachePath:screensaverCache:purgeCacheOnLoad:]([TVAssetLibrary alloc], "initWithCachePath:screensaverCache:purgeCacheOnLoad:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
  v2 = (void *)sSharedInstance;
  sSharedInstance = (uint64_t)v1;

}

- (TVAssetLibrary)initWithCachePath:(id)a3 screensaverCache:(BOOL)a4 purgeCacheOnLoad:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  TVAssetLibrary *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *assetWriteQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *assetAccessQueue;
  uint64_t v14;
  NSString *cachePath;
  NSMutableArray *v16;
  NSMutableArray *registeredGroups;
  _BOOL4 v18;
  _BOOL8 v19;
  _TVAssetGroup *v20;
  _TVAssetGroup *v21;
  _TVAssetGroup *v22;
  _TVAssetGroup *v23;
  _TVAssetGroup *v24;
  _TVAssetGroup *v25;
  Boolean keyExistsAndHasValidFormat;
  objc_super v28;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TVAssetLibrary;
  v9 = -[TVAssetLibrary init](&v28, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.ATVAssetLibrary.writeQueue", 0);
    assetWriteQueue = v9->assetWriteQueue;
    v9->assetWriteQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.ATVAssetLibrary.accessQueue", MEMORY[0x24BDAC9C0]);
    assetAccessQueue = v9->assetAccessQueue;
    v9->assetAccessQueue = (OS_dispatch_queue *)v12;

    v14 = objc_msgSend(v8, "copy");
    cachePath = v9->_cachePath;
    v9->_cachePath = (NSString *)v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    registeredGroups = v9->_registeredGroups;
    v9->_registeredGroups = v16;

    keyExistsAndHasValidFormat = 0;
    v18 = CFPreferencesGetAppBooleanValue(CFSTR("PurgeImageCache"), CFSTR("com.apple.TVMLKit"), &keyExistsAndHasValidFormat) != 0;
    if (keyExistsAndHasValidFormat)
      v19 = v18;
    else
      v19 = v5;
    v20 = -[_TVAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]([_TVAssetGroup alloc], "initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:", 0, v9->_cachePath, CFSTR("SharedImageCache"), 512, v19);
    -[TVAssetLibrary registerGroup:](v9, "registerGroup:", v20);
    v21 = -[_TVAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]([_TVAssetGroup alloc], "initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:", 1, v9->_cachePath, CFSTR("LSMImageCache"), 512, v19);
    -[TVAssetLibrary registerGroup:](v9, "registerGroup:", v21);
    v22 = -[_TVAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]([_TVAssetGroup alloc], "initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:", 3, v9->_cachePath, CFSTR("TrickPlay"), 50, 1);
    -[TVAssetLibrary registerGroup:](v9, "registerGroup:", v22);
    v23 = -[_TVAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]([_TVAssetGroup alloc], "initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:", 4, v9->_cachePath, CFSTR("PhotostreamImages"), 280, 0);
    -[TVAssetLibrary registerGroup:](v9, "registerGroup:", v23);
    v24 = -[_TVAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]([_TVAssetGroup alloc], "initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:", 5, v9->_cachePath, CFSTR("ARFileCache"), 256, v19);
    -[TVAssetLibrary registerGroup:](v9, "registerGroup:", v24);
    if (v6)
    {
      v25 = -[_TVAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]([_TVAssetGroup alloc], "initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:", 2, v9->_cachePath, CFSTR("ScreenSaverImages"), 250, 0);
      -[TVAssetLibrary registerGroup:](v9, "registerGroup:", v25);

    }
  }

  return v9;
}

- (id)assetForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetInfoForKey:queue:", v6, self->assetAccessQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("ATVAssetPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("ATVAsset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ATVAsset"));
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if (!v11)
  {
    -[TVAssetLibrary removeAssetForKey:inGroupOfType:](self, "removeAssetForKey:inGroupOfType:", v6, a4);
    goto LABEL_8;
  }
  +[TVImage imageWithPath:](TVImage, "imageWithPath:", v9);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v14 = (void *)v12;
LABEL_9:

  return v14;
}

- (id)assetPathForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetInfoForKey:queue:", v6, self->assetAccessQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("ATVAssetPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)assetExpiryDateForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetInfoForKey:queue:", v6, self->assetAccessQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("ATVAssetExpiryDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)keyForAssetWithTags:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "infoForAllAssetsWithTags:queue:", v6, self->assetAccessQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v19 = v6;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ATVAssetPath"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = v14;

          goto LABEL_11;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
        continue;
      break;
    }
    v17 = 0;
LABEL_11:
    v6 = v19;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)removeAssetForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAssetInfoForKey:queue:", v6, self->assetAccessQueue);

}

- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6
{
  -[TVAssetLibrary setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:](self, "setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:", a3, a4, a5, a6, 0);
}

- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 overWrite:(BOOL)a7
{
  -[TVAssetLibrary _setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:tags:](self, "_setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:tags:", a3, a4, a5, a6, a7, 0);
}

- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 tags:(id)a7
{
  -[TVAssetLibrary _setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:tags:](self, "_setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:tags:", a3, a4, a5, a6, 0, a7);
}

- (void)setImageAssetFromPath:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6
{
  -[TVAssetLibrary setImageAssetFromPath:forKey:inGroupOfType:expiryDate:tags:](self, "setImageAssetFromPath:forKey:inGroupOfType:expiryDate:tags:", a3, a4, a5, a6, 0);
}

- (void)setImageAssetFromPath:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 tags:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD block[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  int v39;
  char v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v13, "length"))
  {
    v33 = v14;
    v16 = v13;
    -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cachePath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathComponent:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v19, &v40);

    if (v21)
    {
      if (v40)
      {
        v22 = 0;
      }
      else
      {
        v39 = 0;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v30, "tv_onDiskSizeOfFileAtPath:status:", v19, &v39);

        if (v39)
          v22 = 0;
        if (v22)
          goto LABEL_19;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "moveItemAtPath:toPath:error:", v12, v19, 0);

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "fileExistsAtPath:isDirectory:", v19, &v40);

      v22 = 0;
      if (v26 && !v40)
      {
        v39 = 0;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "tv_onDiskSizeOfFileAtPath:status:", v19, &v39);

        if (v39)
          v22 = 0;
        else
          v22 = v28;
      }
      if (v22)
        goto LABEL_19;
    }
    if (!v40)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __77__TVAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke_2;
      block[3] = &unk_24EB85440;
      v35 = v16;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v29 = v35;
      v14 = v33;
LABEL_24:

      goto LABEL_25;
    }
LABEL_19:
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v19, CFSTR("ATVAssetPath"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v22);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("ATVAssetSize"));

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("ATVAssetLastAccessedDate"));

    v14 = v33;
    if (v33)
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, CFSTR("ATVAssetExpiryDate"));
    if (v15)
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v15, CFSTR("ATVAssetTags"));
    objc_msgSend(v17, "setAssetInfo:forKey:queue:", v29, v16, self->assetAccessQueue);
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __77__TVAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke;
    v36[3] = &unk_24EB848C0;
    v37 = v16;
    v38 = v12;
    dispatch_async(MEMORY[0x24BDAC9B8], v36);

    goto LABEL_24;
  }
  v23 = TVMLKitImageLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR))
    -[TVAssetLibrary setImageAssetFromPath:forKey:inGroupOfType:expiryDate:tags:].cold.1(v23);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v41 = CFSTR("ATVAssetDidWriteNotificationErrorKey");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVMLKitErrorDomain"), 6, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("ATVAssetDidWriteNotification"), v13, v19);
LABEL_25:

}

void __77__TVAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("ATVAssetDidWriteNotificationAssetPathKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ATVAssetDidWriteNotification"), v4, v5);

}

void __77__TVAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("ATVAssetDidWriteNotificationErrorKey");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -36, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ATVAssetDidWriteNotification"), v3, v5);

}

- (void)purgeAssetsInGroupOfType:(int64_t)a3
{
  id v4;

  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAssetsWithQueue:", self->assetAccessQueue);

}

- (void)updateAssetsInGroupOfType:(int64_t)a3
{
  id v3;

  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAssetsFromFiles");

}

- (id)assetPathsForGroupOfType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoForAllAssetsWithQueue:", self->assetAccessQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tv_arrayByMappingObjectsUsingBlock:", &__block_literal_global_12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __43__TVAssetLibrary_assetPathsForGroupOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ATVAssetPath"));
}

- (id)cachePathForGroupOfType:(int64_t)a3
{
  void *v3;
  void *v4;

  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)registerGroup:(id)a3
{
  -[NSMutableArray addObject:](self->_registeredGroups, "addObject:", a3);
}

- (void)unRegisterGroup:(int64_t)a3
{
  id v4;

  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](self->_registeredGroups, "removeObject:", v4);

}

- (id)groupWithGroupType:(int64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_registeredGroups;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "groupType", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 overWrite:(BOOL)a7 tags:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *assetWriteQueue;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  -[TVAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("ATVAsset"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("ATVAssetLastAccessedDate"));

  if (v16)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("ATVAssetExpiryDate"));
  objc_msgSend(v18, "setAssetInfo:forKey:queue:", v19, v15, self->assetAccessQueue);
  objc_initWeak(&location, self);
  assetWriteQueue = self->assetWriteQueue;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke;
  v27[3] = &unk_24EB85C20;
  v28 = v15;
  v29 = v18;
  v34 = a7;
  v30 = v14;
  v22 = v14;
  v23 = v18;
  v24 = v15;
  objc_copyWeak(&v33, &location);
  v31 = v16;
  v32 = v17;
  v25 = v17;
  v26 = v16;
  dispatch_async(assetWriteQueue, v27);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

void __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  __CFString *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  CFURLRef v11;
  const __CFURL *v12;
  __CFString *v13;
  CGImageDestination *v14;
  CGImageDestination *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  _QWORD block[4];
  id v31;
  __CFString *v32;
  uint8_t buf[4];
  const __CFURL *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cachePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v2);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if (v6)
    {
      *(_DWORD *)buf = 0;
      v7 = (void *)MEMORY[0x24BDD1580];
      goto LABEL_6;
    }
  }
  if (objc_msgSend(0, "length"))
  {
    objc_msgSend(0, "writeToFile:atomically:", v4, 0);
    *(_DWORD *)buf = 0;
    v7 = (void *)MEMORY[0x24BDD1580];
LABEL_6:
    objc_msgSend(v7, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "tv_onDiskSizeOfFileAtPath:status:", v4, buf);

    if (*(_DWORD *)buf)
      v10 = 0;
    else
      v10 = v9;
    goto LABEL_22;
  }
  v11 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 48), "imageType");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = CGImageDestinationCreateWithURL(v12, v13, 1uLL, 0);
    if (v14)
    {
      v15 = v14;
      CGImageDestinationAddImage(v14, (CGImageRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "image"), 0);
      if (CGImageDestinationFinalize(v15))
      {
        *(_DWORD *)buf = 0;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "tv_onDiskSizeOfFileAtPath:status:", v4, buf);

        if (*(_DWORD *)buf)
          v10 = 0;
        else
          v10 = v17;
      }
      else
      {
        v18 = TVMLKitImageLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v12;
          _os_log_impl(&dword_222D98000, v18, OS_LOG_TYPE_DEFAULT, "CGImageDestinationFinalize failed to save image to: %@", buf, 0xCu);
        }
        v10 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      v10 = 0;
    }
    CFRelease(v12);

  }
  else
  {
    v10 = 0;
  }
LABEL_22:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v20 = WeakRetained;
  if (WeakRetained)
    v21 = (void *)*((_QWORD *)WeakRetained + 2);
  else
    v21 = 0;
  v22 = v21;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v4, CFSTR("ATVAssetPath"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("ATVAssetSize"));

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("ATVAssetLastAccessedDate"));

    v26 = *(_QWORD *)(a1 + 56);
    if (v26)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("ATVAssetExpiryDate"));
    v27 = *(_QWORD *)(a1 + 64);
    if (v27)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("ATVAssetTags"));
    objc_msgSend(*(id *)(a1 + 40), "setAssetInfo:forKey:queue:", v23, *(_QWORD *)(a1 + 32), v22);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_39;
    block[3] = &unk_24EB848C0;
    v31 = *(id *)(a1 + 32);
    v32 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAssetInfoForKey:queue:", *(_QWORD *)(a1 + 32), v22);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_2;
    v28[3] = &unk_24EB85440;
    v29 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v28);
    v23 = v29;
  }

}

void __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_39(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("ATVAssetDidWriteNotificationAssetPathKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ATVAssetDidWriteNotification"), v4, v5);

}

void __80__TVAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("ATVAssetDidWriteNotificationErrorKey");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -36, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ATVAssetDidWriteNotification"), v3, v5);

}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (void)setCachePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableArray)registeredGroups
{
  return self->_registeredGroups;
}

- (void)setRegisteredGroups:(id)a3
{
  objc_storeStrong((id *)&self->_registeredGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredGroups, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->assetAccessQueue, 0);
  objc_storeStrong((id *)&self->assetWriteQueue, 0);
}

- (void)setImageAssetFromPath:(os_log_t)log forKey:inGroupOfType:expiryDate:tags:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222D98000, log, OS_LOG_TYPE_ERROR, "Attempted to save image asset with nil key", v1, 2u);
}

@end
