@implementation VUIAssetLibrary

- (id)assetPathForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetInfoForKey:queue:", v6, self->assetAccessQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("VUIAssetPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

  v17 = *MEMORY[0x1E0C80C00];
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

+ (id)sharedInstance
{
  return (id)sSharedInstance;
}

void __73__VUIAssetLibrary__initializeAssetLibraryWithCachePath_purgeCacheOnLoad___block_invoke(uint64_t a1)
{
  VUIAssetLibrary *v1;
  void *v2;

  v1 = -[VUIAssetLibrary initWithCachePath:purgeCacheOnLoad:]([VUIAssetLibrary alloc], "initWithCachePath:purgeCacheOnLoad:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)sSharedInstance;
  sSharedInstance = (uint64_t)v1;

}

- (VUIAssetLibrary)initWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  VUIAssetLibrary *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *assetWriteQueue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *assetAccessQueue;
  uint64_t v13;
  NSString *cachePath;
  NSMutableArray *v15;
  NSMutableArray *registeredGroups;
  void *v17;
  int AppBooleanValue;
  uint64_t v19;
  VUIAssetGroup *v20;
  VUIAssetGroup *v21;
  VUIAssetGroup *v22;
  VUIAssetGroup *v23;
  Boolean keyExistsAndHasValidFormat;
  objc_super v26;

  v4 = a4;
  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VUIAssetLibrary;
  v7 = -[VUIAssetLibrary init](&v26, sel_init);
  if (v7)
  {
    v8 = dispatch_queue_create("com.apple.VUIAssetLibrary.writeQueue", 0);
    assetWriteQueue = v7->assetWriteQueue;
    v7->assetWriteQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.VUIAssetLibrary.accessQueue", v10);
    assetAccessQueue = v7->assetAccessQueue;
    v7->assetAccessQueue = (OS_dispatch_queue *)v11;

    v13 = objc_msgSend(v6, "copy");
    cachePath = v7->_cachePath;
    v7->_cachePath = (NSString *)v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    registeredGroups = v7->_registeredGroups;
    v7->_registeredGroups = v15;

    keyExistsAndHasValidFormat = 0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PurgeImageCache"), (CFStringRef)objc_msgSend(v17, "bundleIdentifier"), &keyExistsAndHasValidFormat);

    if (keyExistsAndHasValidFormat)
      v19 = AppBooleanValue != 0;
    else
      v19 = v4;
    v20 = -[VUIAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]([VUIAssetGroup alloc], "initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:", 0, v7->_cachePath, CFSTR("SharedImageCache"), 512, v19);
    -[VUIAssetLibrary registerGroup:](v7, "registerGroup:", v20);
    v21 = -[VUIAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]([VUIAssetGroup alloc], "initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:", 1, v7->_cachePath, CFSTR("LSMImageCache"), 512, v19);
    -[VUIAssetLibrary registerGroup:](v7, "registerGroup:", v21);
    v22 = -[VUIAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]([VUIAssetGroup alloc], "initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:", 2, v7->_cachePath, CFSTR("TrickPlay"), 50, 1);
    -[VUIAssetLibrary registerGroup:](v7, "registerGroup:", v22);
    v23 = -[VUIAssetGroup initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:]([VUIAssetGroup alloc], "initWithGroupType:baseCachePath:folderName:maxCacheSize:purgeOnLoad:", 3, v7->_cachePath, CFSTR("ARFileCache"), 256, v19);
    -[VUIAssetLibrary registerGroup:](v7, "registerGroup:", v23);

  }
  return v7;
}

- (void)registerGroup:(id)a3
{
  -[NSMutableArray addObject:](self->_registeredGroups, "addObject:", a3);
}

+ (void)initializeAssetLibraryWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_initializeAssetLibraryWithCachePath:purgeCacheOnLoad:", v5, v4);

}

+ (void)_initializeAssetLibraryWithCachePath:(id)a3 purgeCacheOnLoad:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  BOOL v10;

  v7 = a3;
  v5 = objc_msgSend(v7, "length");
  v6 = v7;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__VUIAssetLibrary__initializeAssetLibraryWithCachePath_purgeCacheOnLoad___block_invoke;
    block[3] = &unk_1E9F2C9C8;
    v9 = v7;
    v10 = a4;
    if (_initializeAssetLibraryWithCachePath_purgeCacheOnLoad__onceToken != -1)
      dispatch_once(&_initializeAssetLibraryWithCachePath_purgeCacheOnLoad__onceToken, block);

    v6 = v7;
  }

}

void __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke(uint64_t a1)
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

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cachePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v2);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if (v6)
    {
      *(_DWORD *)buf = 0;
      v7 = (void *)MEMORY[0x1E0CB3620];
      goto LABEL_6;
    }
  }
  if (objc_msgSend(0, "length"))
  {
    objc_msgSend(0, "writeToFile:atomically:", v4, 0);
    *(_DWORD *)buf = 0;
    v7 = (void *)MEMORY[0x1E0CB3620];
LABEL_6:
    objc_msgSend(v7, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "vui_onDiskSizeOfFileAtPath:status:", v4, buf);

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
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "vui_onDiskSizeOfFileAtPath:status:", v4, buf);

        if (*(_DWORD *)buf)
          v10 = 0;
        else
          v10 = v17;
      }
      else
      {
        VUICImageLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v12;
          _os_log_impl(&dword_1D951F000, v18, OS_LOG_TYPE_DEFAULT, "CGImageDestinationFinalize failed to save image to: %@", buf, 0xCu);
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
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v4, CFSTR("VUIAssetPath"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("VUIAssetSize"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("VUIAssetLastAccessedDate"));

    v26 = *(_QWORD *)(a1 + 56);
    if (v26)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("VUIVAssetExpiryDate"));
    v27 = *(_QWORD *)(a1 + 64);
    if (v27)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("VUIAssetTags"));
    objc_msgSend(*(id *)(a1 + 40), "setAssetInfo:forKey:queue:", v23, *(_QWORD *)(a1 + 32), v22);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_32;
    block[3] = &unk_1E9F2C198;
    v31 = *(id *)(a1 + 32);
    v32 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAssetInfoForKey:queue:", *(_QWORD *)(a1 + 32), v22);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_2;
    v28[3] = &unk_1E9F2C048;
    v29 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v28);
    v23 = v29;
  }

}

- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 tags:(id)a7
{
  -[VUIAssetLibrary _setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:tags:](self, "_setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:tags:", a3, a4, a5, a6, 0, a7);
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
  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("VUIAsset"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("VUIAssetLastAccessedDate"));

  if (v16)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("VUIVAssetExpiryDate"));
  objc_msgSend(v18, "setAssetInfo:forKey:queue:", v19, v15, self->assetAccessQueue);
  objc_initWeak(&location, self);
  assetWriteQueue = self->assetWriteQueue;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke;
  v27[3] = &unk_1E9F2CA30;
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
  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetInfoForKey:queue:", v6, self->assetAccessQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("VUIAssetPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("VUIAsset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("VUIAsset"));
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if (!v11)
  {
    -[VUIAssetLibrary removeAssetForKey:inGroupOfType:](self, "removeAssetForKey:inGroupOfType:", v6, a4);
    goto LABEL_8;
  }
  +[VUIImage imageWithPath:](VUIImage, "imageWithPath:", v9);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v14 = (void *)v12;
LABEL_9:

  return v14;
}

- (id)assetExpiryDateForKey:(id)a3 inGroupOfType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetInfoForKey:queue:", v6, self->assetAccessQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("VUIVAssetExpiryDate"));
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

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a4);
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
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("VUIAssetPath"));
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
  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAssetInfoForKey:queue:", v6, self->assetAccessQueue);

}

- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6
{
  -[VUIAssetLibrary setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:](self, "setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:", a3, a4, a5, a6, 0);
}

- (void)setImageAsset:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6 overWrite:(BOOL)a7
{
  -[VUIAssetLibrary _setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:tags:](self, "_setImageAsset:forKey:inGroupOfType:expiryDate:overWrite:tags:", a3, a4, a5, a6, a7, 0);
}

- (void)setImageAssetFromPath:(id)a3 forKey:(id)a4 inGroupOfType:(int64_t)a5 expiryDate:(id)a6
{
  -[VUIAssetLibrary setImageAssetFromPath:forKey:inGroupOfType:expiryDate:tags:](self, "setImageAssetFromPath:forKey:inGroupOfType:expiryDate:tags:", a3, a4, a5, a6, 0);
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

  v42[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v13, "length"))
  {
    v33 = v14;
    v16 = v13;
    -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cachePath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathComponent:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
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
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v30, "vui_onDiskSizeOfFileAtPath:status:", v19, &v39);

        if (v39)
          v22 = 0;
        if (v22)
          goto LABEL_19;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "moveItemAtPath:toPath:error:", v12, v19, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "fileExistsAtPath:isDirectory:", v19, &v40);

      v22 = 0;
      if (v26 && !v40)
      {
        v39 = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "vui_onDiskSizeOfFileAtPath:status:", v19, &v39);

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
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__VUIAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke_2;
      block[3] = &unk_1E9F2C048;
      v35 = v16;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v29 = v35;
      v14 = v33;
LABEL_24:

      goto LABEL_25;
    }
LABEL_19:
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v19, CFSTR("VUIAssetPath"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("VUIAssetSize"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("VUIAssetLastAccessedDate"));

    v14 = v33;
    if (v33)
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, CFSTR("VUIVAssetExpiryDate"));
    if (v15)
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v15, CFSTR("VUIAssetTags"));
    objc_msgSend(v17, "setAssetInfo:forKey:queue:", v29, v16, self->assetAccessQueue);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __78__VUIAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke;
    v36[3] = &unk_1E9F2C198;
    v37 = v16;
    v38 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v36);

    goto LABEL_24;
  }
  VUICImageLogObject();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[VUIAssetLibrary setImageAssetFromPath:forKey:inGroupOfType:expiryDate:tags:].cold.1(v23);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v41 = CFSTR("VUIAssetDidWriteNotificationErrorKey");
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VideosUICoreErrorDomain"), 104, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("VUIAssetDidWriteNotification"), v13, v19);
LABEL_25:

}

void __78__VUIAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("VUIAssetDidWriteNotificationAssetPathKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VUIAssetDidWriteNotification"), v4, v5);

}

void __78__VUIAssetLibrary_setImageAssetFromPath_forKey_inGroupOfType_expiryDate_tags___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("VUIAssetDidWriteNotificationErrorKey");
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -36, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VUIAssetDidWriteNotification"), v3, v5);

}

- (void)purgeAssetsInGroupOfType:(int64_t)a3
{
  id v4;

  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAssetsWithQueue:", self->assetAccessQueue);

}

- (void)updateAssetsInGroupOfType:(int64_t)a3
{
  id v3;

  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAssetsFromFiles");

}

- (id)assetPathsForGroupOfType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoForAllAssetsWithQueue:", self->assetAccessQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_arrayByMappingObjectsUsingBlock:", &__block_literal_global_20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __44__VUIAssetLibrary_assetPathsForGroupOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VUIAssetPath"));
}

- (id)cachePathForGroupOfType:(int64_t)a3
{
  void *v3;
  void *v4;

  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)unRegisterGroup:(int64_t)a3
{
  id v4;

  -[VUIAssetLibrary groupWithGroupType:](self, "groupWithGroupType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](self->_registeredGroups, "removeObject:", v4);

}

void __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_32(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("VUIAssetDidWriteNotificationAssetPathKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VUIAssetDidWriteNotification"), v4, v5);

}

void __81__VUIAssetLibrary__setImageAsset_forKey_inGroupOfType_expiryDate_overWrite_tags___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("VUIAssetDidWriteNotificationErrorKey");
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -36, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VUIAssetDidWriteNotification"), v3, v5);

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
  _os_log_error_impl(&dword_1D951F000, log, OS_LOG_TYPE_ERROR, "Attempted to save image asset with nil key", v1, 2u);
}

@end
