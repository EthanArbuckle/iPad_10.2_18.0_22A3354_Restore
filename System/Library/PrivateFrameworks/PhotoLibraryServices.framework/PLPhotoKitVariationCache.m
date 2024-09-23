@implementation PLPhotoKitVariationCache

- (PLPhotoKitVariationCache)initWithPathManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  PLPhotoKitVariationCache *v7;

  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 7, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PLPhotoKitVariationCache initWithCacheURL:](self, "initWithCacheURL:", v6);
  return v7;
}

- (PLPhotoKitVariationCache)initWithCacheURL:(id)a3
{
  id v6;
  PLPhotoKitVariationCache *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *cacheQueue;
  NSCache *v11;
  NSCache *memoryCache;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoKitVariationCache.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cacheURL"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PLPhotoKitVariationCache;
  v7 = -[PLPhotoKitVariationCache init](&v15, sel_init);
  if (v7)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.PLPhotoKitVariationCache.cacheQueue", v8);
    cacheQueue = v7->_cacheQueue;
    v7->_cacheQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v7->_cacheURL, a3);
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    memoryCache = v7->_memoryCache;
    v7->_memoryCache = v11;

    -[NSCache setTotalCostLimit:](v7->_memoryCache, "setTotalCostLimit:", 0x200000);
  }

  return v7;
}

- (void)saveAnalysisResult:(id)a3 assetIdentifier:(id)a4
{
  -[PLPhotoKitVariationCache saveAnalysisResult:assetIdentifier:sourceType:](self, "saveAnalysisResult:assetIdentifier:sourceType:", a3, a4, 0);
}

- (void)saveAnalysisResult:(id)a3 assetIdentifier:(id)a4 sourceType:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[4];
  id v14;
  PLPhotoKitVariationCache *v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__PLPhotoKitVariationCache_saveAnalysisResult_assetIdentifier_sourceType___block_invoke;
  v13[3] = &unk_1E3674F30;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a5;
  v10 = v9;
  v11 = v8;
  v12 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, -8, v13);
  dispatch_barrier_async((dispatch_queue_t)self->_cacheQueue, v12);

}

- (id)analysisResultForAssetIdentifier:(id)a3
{
  return -[PLPhotoKitVariationCache analysisResultForAssetIdentifier:sourceType:](self, "analysisResultForAssetIdentifier:sourceType:", a3, 0);
}

- (id)analysisResultForAssetIdentifier:(id)a3 sourceType:(int64_t)a4
{
  id v6;
  NSObject *cacheQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8965;
  v19 = __Block_byref_object_dispose__8966;
  v20 = 0;
  cacheQueue = self->_cacheQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PLPhotoKitVariationCache_analysisResultForAssetIdentifier_sourceType___block_invoke;
  v11[3] = &unk_1E3674DF8;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(cacheQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)savePortraitEffectSettings:(id)a3 sourceType:(int64_t)a4 assetIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[4];
  id v14;
  PLPhotoKitVariationCache *v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__PLPhotoKitVariationCache_savePortraitEffectSettings_sourceType_assetIdentifier___block_invoke;
  v13[3] = &unk_1E3674F30;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a4;
  v10 = v9;
  v11 = v8;
  v12 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, -8, v13);
  dispatch_barrier_async((dispatch_queue_t)self->_cacheQueue, v12);

}

- (void)savePortraitEffectSettings:(id)a3 assetIdentifier:(id)a4
{
  -[PLPhotoKitVariationCache savePortraitEffectSettings:sourceType:assetIdentifier:](self, "savePortraitEffectSettings:sourceType:assetIdentifier:", a3, 0, a4);
}

- (id)portraitEffectSettingsForAssetIdentifier:(id)a3 sourceType:(int64_t)a4
{
  id v6;
  NSObject *cacheQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8965;
  v19 = __Block_byref_object_dispose__8966;
  v20 = 0;
  cacheQueue = self->_cacheQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PLPhotoKitVariationCache_portraitEffectSettingsForAssetIdentifier_sourceType___block_invoke;
  v11[3] = &unk_1E3674DF8;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(cacheQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)portraitEffectSettingsForAssetIdentifier:(id)a3
{
  return -[PLPhotoKitVariationCache portraitEffectSettingsForAssetIdentifier:sourceType:](self, "portraitEffectSettingsForAssetIdentifier:sourceType:", a3, 0);
}

- (void)saveGatingResult:(id)a3 forVariationType:(int64_t)a4 assetIdentifier:(id)a5 sourceType:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD block[4];
  id v16;
  PLPhotoKitVariationCache *v17;
  id v18;
  int64_t v19;
  int64_t v20;

  v10 = a3;
  v11 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PLPhotoKitVariationCache_saveGatingResult_forVariationType_assetIdentifier_sourceType___block_invoke;
  block[3] = &unk_1E36753F8;
  v16 = v10;
  v17 = self;
  v18 = v11;
  v19 = a6;
  v20 = a4;
  v12 = v11;
  v13 = v10;
  v14 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, -8, block);
  dispatch_barrier_async((dispatch_queue_t)self->_cacheQueue, v14);

}

- (void)saveGatingResult:(id)a3 forVariationType:(int64_t)a4 assetIdentifier:(id)a5
{
  -[PLPhotoKitVariationCache saveGatingResult:forVariationType:assetIdentifier:sourceType:](self, "saveGatingResult:forVariationType:assetIdentifier:sourceType:", a3, a4, a5, 0);
}

- (id)gatingResultForVariationType:(int64_t)a3 assetIdentifier:(id)a4 sourceType:(int64_t)a5
{
  id v8;
  NSObject *cacheQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8965;
  v22 = __Block_byref_object_dispose__8966;
  v23 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PLPhotoKitVariationCache_gatingResultForVariationType_assetIdentifier_sourceType___block_invoke;
  block[3] = &unk_1E36756C0;
  block[4] = self;
  v14 = v8;
  v16 = a5;
  v17 = a3;
  v15 = &v18;
  v10 = v8;
  dispatch_sync(cacheQueue, block);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)gatingResultForVariationType:(int64_t)a3 assetIdentifier:(id)a4
{
  return -[PLPhotoKitVariationCache gatingResultForVariationType:assetIdentifier:sourceType:](self, "gatingResultForVariationType:assetIdentifier:sourceType:", a3, a4, 0);
}

- (BOOL)_performChangesForAssetIdentifier:(id)a3 sourceType:(int64_t)a4 changesBlock:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v8 = (void (**)(id, void *))a5;
  if (v8)
  {
    -[PLPhotoKitVariationCache _fileURLWithIdentifier:sourceType:pathExtension:](self, "_fileURLWithIdentifier:sourceType:pathExtension:", a3, a4, CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoKitVariationCache _readInfoForURL:](self, "_readInfoForURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8[2](v8, v11);
    v12 = -[PLPhotoKitVariationCache _writeInfo:atURL:](self, "_writeInfo:atURL:", v11, v9);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)evictIfNeeded
{
  NSObject *cacheQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PLPhotoKitVariationCache_evictIfNeeded__block_invoke;
  v5[3] = &unk_1E3677C68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(cacheQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)purgeAll
{
  NSObject *cacheQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PLPhotoKitVariationCache_purgeAll__block_invoke;
  v5[3] = &unk_1E3677C68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)deleteCacheForAssetIdentifier:(id)a3 sourceType:(int64_t)a4
{
  id v6;
  NSObject *cacheQueue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  cacheQueue = self->_cacheQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PLPhotoKitVariationCache_deleteCacheForAssetIdentifier_sourceType___block_invoke;
  v10[3] = &unk_1E3674DF8;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_barrier_sync(cacheQueue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (BOOL)deleteCacheForAssetIdentifier:(id)a3
{
  return -[PLPhotoKitVariationCache deleteCacheForAssetIdentifier:sourceType:](self, "deleteCacheForAssetIdentifier:sourceType:", a3, 0);
}

- (id)_fileURLWithIdentifier:(id)a3 sourceType:(int64_t)a4 pathExtension:(id)a5
{
  NSURL *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v8 = self->_cacheURL;
  v9 = a5;
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("SpatialOverCapture");
  if (a4 != 1)
    v12 = 0;
  if (!a4)
    v12 = CFSTR("Primary");
  v20[0] = v10;
  v20[1] = v12;
  v13 = (void *)MEMORY[0x1E0C99D20];
  v14 = v12;
  objc_msgSend(v13, "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("-"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringByAppendingPathExtension:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL URLByAppendingPathComponent:isDirectory:](v8, "URLByAppendingPathComponent:isDirectory:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)_writeInfo:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  PLPhotoKitVariationCache *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  v10 = v9;
  if (v8)
  {
    v16 = v9;
    v11 = objc_msgSend(v8, "writeToURL:options:error:", v7, 1073741825, &v16);
    v12 = v16;

    if (v11)
    {
      -[PLPhotoKitVariationCache _saveToMemoryCache:forFileURL:fileSize:](self, "_saveToMemoryCache:forFileURL:fileSize:", v6, v7, objc_msgSend(v8, "length"));
      v13 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v12 = v9;
  }
  PLBackendGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "%@: could not write file at %@ (%@)", buf, 0x20u);
  }

  v13 = 0;
LABEL_8:

  return v13;
}

- (id)_readInfoForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  PLPhotoKitVariationCache *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSCache objectForKey:](self->_memoryCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  if ((objc_msgSend(v5, "isValid") & 1) == 0)
  {
    -[NSCache removeObjectForKey:](self->_memoryCache, "removeObjectForKey:", v4);
    goto LABEL_6;
  }
  objc_msgSend(v6, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v12;
      if (v7)
      {
        -[PLPhotoKitVariationCache _saveToMemoryCache:forFileURL:fileSize:](self, "_saveToMemoryCache:forFileURL:fileSize:", v7, v4, objc_msgSend(v8, "length"));
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v9 = 0;
    }
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v14 = self;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "%@: could not read file at %@ (%@)", buf, 0x20u);
    }

    v7 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (void)_saveToMemoryCache:(id)a3 forFileURL:(id)a4 fileSize:(unint64_t)a5
{
  id v8;
  id v9;
  _PHVariationInMemoryCachedValue *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[_PHVariationInMemoryCachedValue initWithInfo:fileURL:]([_PHVariationInMemoryCachedValue alloc], "initWithInfo:fileURL:", v9, v8);

  -[NSCache setObject:forKey:cost:](self->_memoryCache, "setObject:forKey:cost:", v10, v8, a5);
}

- (BOOL)_removeCachesForURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  PLPhotoKitVariationCache *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSCache removeObjectForKey:](self->_memoryCache, "removeObjectForKey:", v4);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v10);
  v7 = v10;

  if ((v6 & 1) == 0)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "%@: could not delete file at %@ (%@)", buf, 0x20u);
    }

  }
  return v6;
}

- (NSURL)cacheURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

void __69__PLPhotoKitVariationCache_deleteCacheForAssetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_fileURLWithIdentifier:sourceType:pathExtension:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), CFSTR("plist"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_removeCachesForURL:", v2);

}

void __36__PLPhotoKitVariationCache_purgeAll__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[3];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C99998];
  v18[0] = *MEMORY[0x1E0C99998];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v4, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v12 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v12, v3, 0);
        v11 = v12;
        if (objc_msgSend(*(id *)(a1 + 32), "_removeCachesForURL:", v10))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v11, "integerValue");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

void __41__PLPhotoKitVariationCache_evictIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id obj;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _QWORD v50[5];

  v50[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C99A90];
  v7 = *MEMORY[0x1E0C998E8];
  v50[0] = *MEMORY[0x1E0C99A90];
  v50[1] = v7;
  v35 = v7;
  v34 = *MEMORY[0x1E0C99998];
  v50[2] = *MEMORY[0x1E0C99998];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  obj = v10;
  if (!v11)
  {
LABEL_31:

    goto LABEL_32;
  }
  v12 = v11;
  v32 = v5;
  v33 = a1;
  v36 = 0;
  v13 = *(_QWORD *)v45;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v45 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
      objc_msgSend(v15, "resourceValuesForKeys:error:", v38, 0, v32);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pathExtension");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("plist"));

      if (v19)
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", v35);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (!v20
          || (objc_msgSend(v20, "timeIntervalSinceReferenceDate"), v4 - v22 < 1296000.0)
          || (objc_msgSend(*(id *)(v33 + 32), "_removeCachesForURL:", v15) & 1) == 0)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", v34);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
            v36 += objc_msgSend(v23, "integerValue");
          if (objc_msgSend(v9, "count"))
            objc_msgSend(v9, "insertObject:atIndex:", v15, objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v15, 0, objc_msgSend(v9, "count"), 1024, &__block_literal_global_8963));
          else
            objc_msgSend(v9, "addObject:", v15);

        }
      }

    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  }
  while (v12);

  v25 = v36;
  v5 = v32;
  if (v36 >= 0xA00000)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v10 = v9;
    v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v41 != v28)
            objc_enumerationMutation(v10);
          v30 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          v39 = 0;
          objc_msgSend(v30, "getResourceValue:forKey:error:", &v39, v34, 0);
          v31 = v39;
          if ((objc_msgSend(*(id *)(v33 + 32), "_removeCachesForURL:", v30) & 1) != 0)
          {
            v25 -= objc_msgSend(v31, "integerValue");
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v33 + 40) + 8) + 24) += objc_msgSend(v31, "integerValue");

            if (v25 <= 0x500000)
              goto LABEL_31;
          }
          else
          {

          }
        }
        v27 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v27);
    }
    goto LABEL_31;
  }
LABEL_32:

}

uint64_t __41__PLPhotoKitVariationCache_evictIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v9;
  id v10;

  v10 = 0;
  v4 = *MEMORY[0x1E0C998E8];
  v5 = a3;
  objc_msgSend(a2, "getResourceValue:forKey:error:", &v10, v4, 0);
  v9 = 0;
  v6 = v10;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v9, v4, 0);

  v7 = objc_msgSend(v6, "compare:", v9);
  return v7;
}

void __84__PLPhotoKitVariationCache_gatingResultForVariationType_assetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_fileURLWithIdentifier:sourceType:pathExtension:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), CFSTR("plist"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_readInfoForURL:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _gatingKeyForVariationType(*(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __89__PLPhotoKitVariationCache_saveGatingResult_forVariationType_assetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(_QWORD *)(a1 + 56);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __89__PLPhotoKitVariationCache_saveGatingResult_forVariationType_assetIdentifier_sourceType___block_invoke_2;
    v5[3] = &unk_1E3662388;
    v7 = *(_QWORD *)(a1 + 64);
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "_performChangesForAssetIdentifier:sourceType:changesBlock:", v2, v3, v5);

  }
}

void __89__PLPhotoKitVariationCache_saveGatingResult_forVariationType_assetIdentifier_sourceType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  _gatingKeyForVariationType(*(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v3);

}

void __80__PLPhotoKitVariationCache_portraitEffectSettingsForAssetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_fileURLWithIdentifier:sourceType:pathExtension:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), CFSTR("plist"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_readInfoForURL:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PortraitEffectSettings"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __82__PLPhotoKitVariationCache_savePortraitEffectSettings_sourceType_assetIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(_QWORD *)(a1 + 56);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __82__PLPhotoKitVariationCache_savePortraitEffectSettings_sourceType_assetIdentifier___block_invoke_2;
    v5[3] = &unk_1E3662360;
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "_performChangesForAssetIdentifier:sourceType:changesBlock:", v2, v3, v5);

  }
}

uint64_t __82__PLPhotoKitVariationCache_savePortraitEffectSettings_sourceType_assetIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("PortraitEffectSettings"));
}

void __72__PLPhotoKitVariationCache_analysisResultForAssetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_fileURLWithIdentifier:sourceType:pathExtension:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), CFSTR("plist"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_readInfoForURL:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AnalysisResult"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __74__PLPhotoKitVariationCache_saveAnalysisResult_assetIdentifier_sourceType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(_QWORD *)(a1 + 56);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74__PLPhotoKitVariationCache_saveAnalysisResult_assetIdentifier_sourceType___block_invoke_2;
    v5[3] = &unk_1E3662360;
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "_performChangesForAssetIdentifier:sourceType:changesBlock:", v2, v3, v5);

  }
}

uint64_t __74__PLPhotoKitVariationCache_saveAnalysisResult_assetIdentifier_sourceType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("AnalysisResult"));
}

@end
