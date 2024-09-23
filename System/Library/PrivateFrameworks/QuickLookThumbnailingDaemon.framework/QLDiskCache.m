@implementation QLDiskCache

- (id)blobDatabase
{
  return self->_blobDatabase;
}

- (id)enumeratorForThumbnailRequests:(id)a3
{
  id v4;
  QLDiskCacheQueryEnumerator *v5;

  v4 = a3;
  v5 = -[QLDiskCacheQueryEnumerator initWithDiskCache:thumbnailRequests:]([QLDiskCacheQueryEnumerator alloc], "initWithDiskCache:thumbnailRequests:", self, v4);

  return v5;
}

uint64_t __25__QLDiskCache_doWriting___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = MEMORY[0x1E0CD3398];
  v3 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
  if (!v3)
  {
    QLTInitLogging();
    v3 = *(NSObject **)(v2 + 32);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __25__QLDiskCache_doWriting___block_invoke_cold_1();
  result = objc_msgSend(*(id *)(a1 + 32), "isOpened");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createDirtyLockInformDelegate:", 1);
    objc_msgSend(*(id *)(a1 + 32), "indexDatabase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "beginTransaction");

    if (v6)
    {
      v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      if (objc_msgSend(*(id *)(a1 + 32), "metaDataDirty"))
      {
        objc_msgSend(*(id *)(a1 + 32), "metaData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "metaDataFilePath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "writeToFile:atomically:", v9, 1);

        objc_msgSend(*(id *)(a1 + 32), "setMetaDataDirty:", 0);
      }
      objc_msgSend(*(id *)(a1 + 32), "indexDatabase");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endTransaction");

      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "indexDatabase");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "save");

        objc_msgSend(*(id *)(a1 + 32), "blobDatabase");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "save");

      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
    return objc_msgSend(*(id *)(a1 + 32), "_removeDirtyLock");
  }
  return result;
}

- (id)indexDatabase
{
  return self->_indexDatabase;
}

- (BOOL)isOpened
{
  return self->_opened;
}

- (BOOL)metaDataDirty
{
  return self->_metaDataDirty;
}

- (void)_removeDirtyLock
{
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_14_1(a1);
  v2 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_21(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_5(&dword_1D54AE000, v3, v4, "error removing dirty file: %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_2();
}

- (void)_createDirtyLockInformDelegate:(BOOL)a3
{
  id WeakRetained;
  int v5;
  uint64_t v6;
  NSObject *v7;

  self->_hasDirtyLock = 1;
  if (a3)
  {
    self->_dirtyForDelegate = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "startWriting");

  }
  ++self->_writingCount;
  v5 = open(-[NSString fileSystemRepresentation](self->_dirtyFilePath, "fileSystemRepresentation"), 521, 384);
  if (v5 < 0)
  {
    v6 = MEMORY[0x1E0CD3398];
    v7 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
    if (!v7)
    {
      QLTInitLogging();
      v7 = *(NSObject **)(v6 + 32);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[QLDiskCache _createDirtyLockInformDelegate:].cold.1(v7);
  }
  else
  {
    close(v5);
  }
}

uint64_t __25__QLDiskCache_doReading___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isOpened");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (unint64_t)cleanup
{
  void *v3;
  unint64_t v4;

  -[QLDiskCache logCacheSizeBeforeCleanup](self, "logCacheSizeBeforeCleanup");
  -[QLCacheIndexDatabase removeOldThumbnails](self->_indexDatabase, "removeOldThumbnails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[QLDiskCache _deleteBlobArrayFromDatabase:](self, "_deleteBlobArrayFromDatabase:", v3);

  return v4;
}

- (void)logCacheSizeBeforeCleanup
{
  double Current;
  void *v4;
  void *v5;
  double v6;
  unint64_t v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("QLMTCacheSizeLastCheckAbsoluteTime");
  v10[0] = &unk_1E99DDA88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerDefaults:", v5);

  objc_msgSend(v4, "doubleForKey:", CFSTR("QLMTCacheSizeLastCheckAbsoluteTime"));
  if (Current - v6 > 86400.0)
  {
    objc_msgSend(v4, "setDouble:forKey:", CFSTR("QLMTCacheSizeLastCheckAbsoluteTime"), Current);
    v7 = -[QLCacheMMAPBlobDatabase size](self->_blobDatabase, "size") >> 20;
    +[QLTAnalyticsManager sharedManager](QLTAnalyticsManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendCacheSizeEventWithCacheSize:", v7);

  }
}

- (unint64_t)_deleteBlobArrayFromDatabase:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[QLCacheMMAPBlobDatabase deleteBlobWithInfo:](self->_blobDatabase, "deleteBlobWithInfo:", v10))
          v7 += objc_msgSend(v10, "length");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateHitCount:(id)a3 forFileIdentifier:(id)a4
{
  -[QLCacheIndexDatabase updateHitCount:forFileIdentifier:](self->_indexDatabase, "updateHitCount:forFileIdentifier:", a3, a4);
}

- (BOOL)doReading:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__QLDiskCache_doReading___block_invoke;
  v7[3] = &unk_1E99D36D0;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[QLDiskCache do:](self, "do:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)doWriting:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v5 = MEMORY[0x1E0CD3398];
  v6 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
  if (!v6)
  {
    QLTInitLogging();
    v6 = *(NSObject **)(v5 + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[QLDiskCache doWriting:].cold.1();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __25__QLDiskCache_doWriting___block_invoke;
  v10[3] = &unk_1E99D36D0;
  v12 = &v13;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  -[QLDiskCache do:](self, "do:", v10);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)do:(id)a3
{
  -[QLCacheIndexDatabase do:](self->_indexDatabase, "do:", a3);
}

- (BOOL)itemIsMissingRemoteThumbnail:(id)a3
{
  return -[QLCacheIndexDatabase itemIsMissingRemoteThumbnail:](self->_indexDatabase, "itemIsMissingRemoteThumbnail:", a3);
}

+ (void)setCacheLocationForTesting:(id)a3
{
  objc_storeStrong((id *)&overrideCacheLocation, a3);
}

+ (id)defaultLocation
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;

  if (!defaultLocation_location)
  {
    QLGetValidCacheLocation();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)defaultLocation_location;
    defaultLocation_location = v4;

    v6 = MEMORY[0x1E0CD3398];
    if (!defaultLocation_location)
    {
      v7 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
      if (!v7)
      {
        QLTInitLogging();
        v7 = *(NSObject **)(v6 + 32);
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[QLDiskCache defaultLocation].cold.3(v7);
    }
    v8 = *(NSObject **)(v6 + 32);
    if (!v8)
    {
      QLTInitLogging();
      v8 = *(NSObject **)(v6 + 32);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[QLDiskCache defaultLocation].cold.2(v8, v9, v10);
    objc_msgSend(a1, "setupCacheAtLocationIfNecessary:", defaultLocation_location);
    objc_msgSend((id)defaultLocation_location, "fileSystemRepresentation");
    if ((int)rootless_check_datavault_flag() >= 1)
    {
      objc_msgSend((id)defaultLocation_location, "fileSystemRepresentation");
      if (rootless_convert_to_datavault())
      {
        v11 = *(NSObject **)(v6 + 32);
        if (!v11)
        {
          QLTInitLogging();
          v11 = *(NSObject **)(v6 + 32);
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          +[QLDiskCache defaultLocation].cold.1(v11);
      }
    }
  }
  return (id)defaultLocation_location;
}

+ (void)setupCacheAtLocationIfNecessary:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  id v13;
  char v14;

  v3 = a3;
  v14 = 0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v14);

    if (!v5)
    {
      v8 = MEMORY[0x1E0CD3398];
      v9 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
      if (!v9)
      {
        QLTInitLogging();
        v9 = *(NSObject **)(v8 + 32);
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[QLDiskCache setupCacheAtLocationIfNecessary:].cold.3();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v11 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v13);
      v7 = v13;

      v12 = *(NSObject **)(v8 + 32);
      if ((v11 & 1) != 0)
      {
        if (!v12)
        {
          QLTInitLogging();
          v12 = *(NSObject **)(v8 + 32);
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          +[QLDiskCache setupCacheAtLocationIfNecessary:].cold.1();
      }
      else
      {
        if (!v12)
        {
          QLTInitLogging();
          v12 = *(NSObject **)(v8 + 32);
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          +[QLDiskCache setupCacheAtLocationIfNecessary:].cold.2();
      }
      goto LABEL_18;
    }
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeItemAtPath:error:", v3, 0);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);
LABEL_18:

    }
  }

}

- (QLDiskCache)initWithPathLocation:(id)a3 cacheSize:(int64_t)a4 cacheThread:(id)a5
{
  id v9;
  id v10;
  QLDiskCache *v11;
  QLDiskCache *v12;
  uint64_t v13;
  NSString *metaDataFilePath;
  uint64_t v15;
  NSString *dirtyFilePath;
  uint64_t v17;
  NSString *exclusivePath;
  uint64_t v19;
  NSString *resetFilePath;
  uint64_t v21;
  NSString *resetReasonPath;
  QLCacheIndexDatabase *v23;
  QLCacheIndexDatabase *indexDatabase;
  QLCacheMMAPBlobDatabase *v25;
  void *v26;
  uint64_t v27;
  QLCacheMMAPBlobDatabase *blobDatabase;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;

  v9 = a3;
  v10 = a5;
  v11 = -[QLDiskCache init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_path, a3);
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("metadata"));
    v13 = objc_claimAutoreleasedReturnValue();
    metaDataFilePath = v12->_metaDataFilePath;
    v12->_metaDataFilePath = (NSString *)v13;

    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("dirty"));
    v15 = objc_claimAutoreleasedReturnValue();
    dirtyFilePath = v12->_dirtyFilePath;
    v12->_dirtyFilePath = (NSString *)v15;

    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("exclusive"));
    v17 = objc_claimAutoreleasedReturnValue();
    exclusivePath = v12->_exclusivePath;
    v12->_exclusivePath = (NSString *)v17;

    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("forcereset"));
    v19 = objc_claimAutoreleasedReturnValue();
    resetFilePath = v12->_resetFilePath;
    v12->_resetFilePath = (NSString *)v19;

    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("resetreason"));
    v21 = objc_claimAutoreleasedReturnValue();
    resetReasonPath = v12->_resetReasonPath;
    v12->_resetReasonPath = (NSString *)v21;

    v23 = -[QLCacheIndexDatabase initWithPath:]([QLCacheIndexDatabase alloc], "initWithPath:", v9);
    indexDatabase = v12->_indexDatabase;
    v12->_indexDatabase = v23;

    v25 = [QLCacheMMAPBlobDatabase alloc];
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("thumbnails"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[QLCacheMMAPBlobDatabase initWithPath:cacheSize:cacheThread:](v25, "initWithPath:cacheSize:cacheThread:", v26, a4, v10);
    blobDatabase = v12->_blobDatabase;
    v12->_blobDatabase = (QLCacheMMAPBlobDatabase *)v27;

    -[QLCacheIndexDatabase addObserver:forKeyPath:options:context:](v12->_indexDatabase, "addObserver:forKeyPath:options:context:", v12, CFSTR("database.isCorrupted"), 3, 0);
    v29 = MEMORY[0x1E0CD3398];
    v30 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
    if (!v30)
    {
      QLTInitLogging();
      v30 = *(NSObject **)(v29 + 32);
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[QLDiskCache initWithPathLocation:cacheSize:cacheThread:].cold.1((uint64_t *)&v12->_exclusivePath, v30, v31);
  }

  return v12;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  QLCacheIndexDatabase *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id WeakRetained;
  objc_super v17;

  v10 = a3;
  v11 = (QLCacheIndexDatabase *)a4;
  v12 = a5;
  if (self->_indexDatabase == v11 && objc_msgSend(v10, "isEqualToString:", CFSTR("database.isCorrupted")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      if ((v15 & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "databaseCorruptionDetected");

      }
    }
    else
    {

    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)QLDiskCache;
    -[QLDiskCache observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (id)enumeratorForAllFilesUbiquitousFiles:(BOOL)a3 withExtraInfo:(BOOL)a4
{
  return -[QLDiskCacheFileInfoEnumerator initWithDiskCache:forUbiquitousFiles:extraInfo:]([QLDiskCacheFileInfoEnumerator alloc], "initWithDiskCache:forUbiquitousFiles:extraInfo:", self, a3, a4);
}

- (id)enumeratorForAllThumbnailsWithFileIdentifier:(id)a3
{
  id v4;
  QLDiskCacheAllThumbnailPerFileEnumerator *v5;

  v4 = a3;
  v5 = -[QLDiskCacheAllThumbnailPerFileEnumerator initWithDiskCache:fileIdentifier:]([QLDiskCacheAllThumbnailPerFileEnumerator alloc], "initWithDiskCache:fileIdentifier:", self, v4);

  return v5;
}

- (BOOL)_setThumbnailData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  QLCacheIndexDatabase *indexDatabase;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v62;
  QLCacheIndexDatabase *v63;
  unint64_t v64;
  void *v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int16 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v72 = 0;
  if ((objc_msgSend(v4, "setState:", 1) & 1) != 0)
  {
    objc_msgSend(v4, "fileIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "versionedFileIdentifierClass"));
    objc_msgSend(v4, "fileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithFileIdentifier:version:", v7, v8);

    v65 = (void *)v9;
    v10 = -[QLCacheIndexDatabase insertOrUpdateThumbnailWithVersionedFileIdentifier:shouldInvalidAllThumbnailSizes:added:](self->_indexDatabase, "insertOrUpdateThumbnailWithVersionedFileIdentifier:shouldInvalidAllThumbnailSizes:added:", v9, (char *)&v72 + 1, &v72);
    v11 = v10;
    if (HIBYTE(v72))
    {
      -[QLCacheIndexDatabase removeAllThumbnailsForCacheId:](self->_indexDatabase, "removeAllThumbnailsForCacheId:", v10);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v69 != v15)
              objc_enumerationMutation(v12);
            -[QLCacheMMAPBlobDatabase deleteBlobWithInfo:](self->_blobDatabase, "deleteBlobWithInfo:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
        }
        while (v14);
      }
    }
    else
    {
      if (!v10)
        goto LABEL_23;
      indexDatabase = self->_indexDatabase;
      objc_msgSend(v4, "size");
      v22 = v21;
      v23 = objc_msgSend(v4, "iconMode");
      v24 = objc_msgSend(v4, "badgeType");
      v25 = objc_msgSend(v4, "iconVariant");
      v26 = objc_msgSend(v4, "interpolationQuality");
      v27 = objc_msgSend(v4, "externalGeneratorDataHash");
      v66 = 0;
      v67 = 0;
      LODWORD(v28) = v22;
      -[QLCacheIndexDatabase getBlobInfoForCacheId:size:iconMode:badgeType:iconVariant:interpolationQuality:externalGeneratorDataHash:bitmapDataBlobInfo:plistBufferBlobInfo:](indexDatabase, "getBlobInfoForCacheId:size:iconMode:badgeType:iconVariant:interpolationQuality:externalGeneratorDataHash:bitmapDataBlobInfo:plistBufferBlobInfo:", v11, v23, v24, v25, v26, v27, v28, &v67, &v66);
      v12 = v67;
      v29 = v66;
      if (v12)
        -[QLCacheMMAPBlobDatabase deleteBlobWithInfo:](self->_blobDatabase, "deleteBlobWithInfo:", v12);
      if (v29)
        -[QLCacheMMAPBlobDatabase deleteBlobWithInfo:](self->_blobDatabase, "deleteBlobWithInfo:", v29);

    }
LABEL_23:
    v30 = MEMORY[0x1E0CD3398];
    v31 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
    if (!v31)
    {
      QLTInitLogging();
      v31 = *(NSObject **)(v30 + 32);
    }
    v64 = v11;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[QLDiskCache _setThumbnailData:].cold.2(v31, v4);
    v63 = self->_indexDatabase;
    objc_msgSend(v4, "size");
    v33 = v32;
    v34 = objc_msgSend(v4, "iconMode");
    v35 = objc_msgSend(v4, "badgeType");
    v36 = objc_msgSend(v4, "iconVariant");
    v37 = objc_msgSend(v4, "interpolationQuality");
    objc_msgSend(v4, "bitmapFormat");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bitmapDataToValidate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadataToValidate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v4, "flavor");
    objc_msgSend(v4, "contentRect");
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v50 = objc_msgSend(v4, "externalGeneratorDataHash");
    LODWORD(v62) = v41;
    LODWORD(v51) = v33;
    v19 = -[QLCacheIndexDatabase insertOrUpdateImageDataForCacheId:size:iconMode:badgeType:iconVariant:interpolationQuality:bitmapFormat:bitmapDataBlobInfo:metadataBlobInfo:flavor:contentRect:externalGeneratorDataHash:lastHitDate:](v63, "insertOrUpdateImageDataForCacheId:size:iconMode:badgeType:iconVariant:interpolationQuality:bitmapFormat:bitmapDataBlobInfo:metadataBlobInfo:flavor:contentRect:externalGeneratorDataHash:lastHitDate:", v64, v34, v35, v36, v37, v38, v51, v43, v45, v47, v49, v39, v40, v62, v50, 0);

    if (v19)
    {
      objc_msgSend(v4, "bitmapDataToValidate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_msgSend(v4, "bitmapDataToValidate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLDiskCache validateReservedBuffer:](self, "validateReservedBuffer:", v53);

        objc_msgSend(v4, "setBitmapDataToValidate:", 0);
      }
      objc_msgSend(v4, "metadataToValidate");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v54)
        goto LABEL_41;
      objc_msgSend(v4, "metadataToValidate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLDiskCache validateReservedBuffer:](self, "validateReservedBuffer:", v55);
    }
    else
    {
      v56 = MEMORY[0x1E0CD3398];
      v57 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
      if (!v57)
      {
        QLTInitLogging();
        v57 = *(NSObject **)(v56 + 32);
      }
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        -[QLDiskCache _setThumbnailData:].cold.1();
      objc_msgSend(v4, "bitmapDataToValidate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        objc_msgSend(v4, "bitmapDataToValidate");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLDiskCache discardReservedBuffer:](self, "discardReservedBuffer:", v59);

        objc_msgSend(v4, "setBitmapDataToValidate:", 0);
      }
      objc_msgSend(v4, "metadataToValidate");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v60)
        goto LABEL_41;
      objc_msgSend(v4, "metadataToValidate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLDiskCache discardReservedBuffer:](self, "discardReservedBuffer:", v55);
    }

    objc_msgSend(v4, "setMetadataToValidate:", 0);
LABEL_41:

    goto LABEL_42;
  }
  v17 = MEMORY[0x1E0CD3398];
  v18 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
  if (!v18)
  {
    QLTInitLogging();
    v18 = *(NSObject **)(v17 + 32);
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[QLDiskCache _setThumbnailData:].cold.3(v18, v4);
  LOBYTE(v19) = 0;
LABEL_42:

  return v19;
}

- (void)_discardThumbnailDataForReset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;

  v4 = a3;
  if ((objc_msgSend(v4, "setState:", 1) & 1) != 0)
  {
    objc_msgSend(v4, "bitmapDataToValidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "bitmapDataToValidate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLDiskCache discardReservedBuffer:](self, "discardReservedBuffer:", v6);

      objc_msgSend(v4, "setBitmapDataToValidate:", 0);
    }
    objc_msgSend(v4, "metadataToValidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "metadataToValidate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLDiskCache discardReservedBuffer:](self, "discardReservedBuffer:", v8);

      objc_msgSend(v4, "setMetadataToValidate:", 0);
    }
  }
  else
  {
    v9 = MEMORY[0x1E0CD3398];
    v10 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
    if (!v10)
    {
      QLTInitLogging();
      v10 = *(NSObject **)(v9 + 32);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[QLDiskCache _setThumbnailData:].cold.3(v10, v4);
  }

}

- (void)forceResetAtNextLaunch
{
  FILE *v2;

  v2 = fopen(-[NSString fileSystemRepresentation](self->_resetFilePath, "fileSystemRepresentation"), "a+");
  if (v2)
    fclose(v2);
}

- (void)_cleanupForceResetAtNextLaunch
{
  unlink(-[NSString fileSystemRepresentation](self->_resetFilePath, "fileSystemRepresentation"));
}

- (void)writeThumbnailDataBatch:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[QLDiskCache _setThumbnailData:](self, "_setThumbnailData:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)discardThumbnailDataBatchForReset:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[QLDiskCache _discardThumbnailDataForReset:](self, "_discardThumbnailDataForReset:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (unint64_t)removeThumbnailsOlderThanDate:(id)a3
{
  void *v4;
  unint64_t v5;

  -[QLCacheIndexDatabase removeThumbnailsOlderThanDate:](self->_indexDatabase, "removeThumbnailsOlderThanDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[QLDiskCache _deleteBlobArrayFromDatabase:](self, "_deleteBlobArrayFromDatabase:", v4);

  return v5;
}

- (unint64_t)freeDiskSpaceForNewThumbnails
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;

  v3 = MEMORY[0x1E0CD3398];
  v4 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
  if (!v4)
  {
    QLTInitLogging();
    v4 = *(NSObject **)(v3 + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[QLDiskCache freeDiskSpaceForNewThumbnails].cold.1();
  -[QLCacheIndexDatabase removePercentageOldestThumbnails:](self->_indexDatabase, "removePercentageOldestThumbnails:", 25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[QLDiskCache _deleteBlobArrayFromDatabase:](self, "_deleteBlobArrayFromDatabase:", v5);
  -[QLCacheMMAPBlobDatabase compactFragmentation](self->_blobDatabase, "compactFragmentation");

  return v6;
}

- (unint64_t)cleanupDeletedFiles
{
  void *v3;
  unint64_t v4;

  -[QLCacheIndexDatabase removeThumbnailsForDeletedFiles](self->_indexDatabase, "removeThumbnailsForDeletedFiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[QLDiskCache _deleteBlobArrayFromDatabase:](self, "_deleteBlobArrayFromDatabase:", v3);

  return v4;
}

- (void)checkpoint
{
  -[QLCacheIndexDatabase checkpoint](self->_indexDatabase, "checkpoint");
}

- (void)removeFilesWithFileInfo:(id)a3
{
  id v4;

  -[QLCacheIndexDatabase removeFilesWithFileInfo:](self->_indexDatabase, "removeFilesWithFileInfo:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[QLDiskCache _deleteBlobArrayFromDatabase:](self, "_deleteBlobArrayFromDatabase:", v4);

}

- (float)fragmentation
{
  float result;

  -[QLCacheMMAPBlobDatabase fragmentation](self->_blobDatabase, "fragmentation");
  return result;
}

- (unint64_t)reserveBufferCount
{
  return -[QLCacheIndexDatabase reserveBufferCount](self->_indexDatabase, "reserveBufferCount");
}

- (unint64_t)reserveBufferSize
{
  return -[QLCacheIndexDatabase reserveBufferSize](self->_indexDatabase, "reserveBufferSize");
}

- (unint64_t)size
{
  return -[QLCacheMMAPBlobDatabase size](self->_blobDatabase, "size");
}

- (unint64_t)maxSize
{
  return -[QLCacheMMAPBlobDatabase maxSize](self->_blobDatabase, "maxSize");
}

- (BOOL)_open
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  int *p_exclusiveFD;
  NSObject *v7;
  unint64_t v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *metaData;
  void *v11;
  int v12;
  int v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  QLCacheIndexDatabase **p_indexDatabase;
  QLCacheMMAPBlobDatabase **p_blobDatabase;
  const __CFString *v19;
  const __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  NSObject *v29;
  BOOL opened;
  int v31;
  int v32;
  int v33;
  NSObject *v34;
  const __CFString *v35;
  NSObject *v36;
  NSObject *v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *v40;
  NSMutableDictionary *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v46;
  NSObject *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0CD3398];
  v4 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
  if (!v4)
  {
    QLTInitLogging();
    v4 = *(NSObject **)(v3 + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[QLDiskCache _open].cold.10();
  v5 = open(-[NSString fileSystemRepresentation](self->_exclusivePath, "fileSystemRepresentation"), 545, 384);
  self->_exclusiveFD = v5;
  p_exclusiveFD = &self->_exclusiveFD;
  if (v5 > 0)
  {
    v7 = *(NSObject **)(v3 + 32);
    if (!v7)
    {
      QLTInitLogging();
      v7 = *(NSObject **)(v3 + 32);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[QLDiskCache _open].cold.9((uint64_t *)&self->_exclusivePath, &self->_exclusiveFD, v7);
    fcntl(self->_exclusiveFD, 2, 1);
    v8 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", self->_metaDataFilePath);
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    metaData = self->_metaData;
    self->_metaData = v9;

    -[NSMutableDictionary objectForKeyedSubscript:](self->_metaData, "objectForKeyedSubscript:", CFSTR("QLCacheDebugModeMetadataKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");
    v13 = QLCacheInDebugMode();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "fileExistsAtPath:", self->_dirtyFilePath) & 1) != 0)
    {
      v15 = *(NSObject **)(v3 + 32);
      if (!v15)
      {
        QLTInitLogging();
        v15 = *(NSObject **)(v3 + 32);
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D54AE000, v15, OS_LOG_TYPE_INFO, "dirty lock is on disk, resetting cache", buf, 2u);
      }
      v16 = CFSTR("dirty atomic write");
    }
    else
    {
      v31 = objc_msgSend(v14, "fileExistsAtPath:", self->_resetFilePath);
      if ((v31 & 1) == 0 && ((v12 ^ v13) & 1) == 0)
      {
        v32 = -[QLCacheIndexDatabase doesExist](self->_indexDatabase, "doesExist");
        v33 = -[QLCacheMMAPBlobDatabase doesExist](self->_blobDatabase, "doesExist");
        if (v32 == v33)
        {
          if (((v32 | v33) & 1) == 0)
          {
            v47 = *(NSObject **)(v3 + 32);
            if (!v47)
            {
              QLTInitLogging();
              v47 = *(NSObject **)(v3 + 32);
            }
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              -[QLDiskCache _open].cold.8();
          }
        }
        else
        {
          v34 = *(NSObject **)(v3 + 32);
          if (!v34)
          {
            QLTInitLogging();
            v34 = *(NSObject **)(v3 + 32);
          }
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[QLDiskCache _open].cold.7((uint64_t)&self->_indexDatabase, v34, (id *)&self->_blobDatabase);
          -[QLDiskCache _createDirtyLockInformDelegate:](self, "_createDirtyLockInformDelegate:", 0);
          -[QLDiskCache _closeWhatIsOpen](self, "_closeWhatIsOpen");
          if (v32)
            v35 = CFSTR("blob not found");
          else
            v35 = CFSTR("index not found");
          -[QLDiskCache _resetWithReason:](self, "_resetWithReason:", v35);
          -[QLDiskCache _removeDirtyLock](self, "_removeDirtyLock");
        }
        goto LABEL_17;
      }
      v44 = *(NSObject **)(v3 + 32);
      if (v31)
      {
        if (!v44)
        {
          QLTInitLogging();
          v44 = *(NSObject **)(v3 + 32);
        }
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D54AE000, v44, OS_LOG_TYPE_INFO, "marked as needing reset on previous session", buf, 2u);
        }
        v16 = CFSTR("marked as needing reset on previous session");
      }
      else
      {
        if (!v44)
        {
          QLTInitLogging();
          v44 = *(NSObject **)(v3 + 32);
        }
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v46 = v44;
          *(_DWORD *)buf = 67109120;
          v54 = QLCacheInDebugMode();
          _os_log_impl(&dword_1D54AE000, v46, OS_LOG_TYPE_INFO, "changed debug mode to %d", buf, 8u);

        }
        v16 = CFSTR("cache debug mode changed");
      }
    }
    -[QLDiskCache _closeWhatIsOpen](self, "_closeWhatIsOpen");
    -[QLDiskCache _resetWithReason:](self, "_resetWithReason:", v16);
    -[QLDiskCache _removeDirtyLock](self, "_removeDirtyLock");
    -[QLDiskCache _cleanupForceResetAtNextLaunch](self, "_cleanupForceResetAtNextLaunch");
LABEL_17:
    -[QLDiskCache _createDirtyLockInformDelegate:](self, "_createDirtyLockInformDelegate:", 1);
    p_indexDatabase = &self->_indexDatabase;
    -[QLCacheIndexDatabase open](self->_indexDatabase, "open");
    p_blobDatabase = &self->_blobDatabase;
    -[QLCacheMMAPBlobDatabase open](self->_blobDatabase, "open");
    self->_opened = 1;
    if (!-[QLCacheIndexDatabase isValid](self->_indexDatabase, "isValid")
      || !-[QLCacheMMAPBlobDatabase isValid](*p_blobDatabase, "isValid"))
    {
      if (-[QLCacheIndexDatabase isValid](*p_indexDatabase, "isValid"))
        v19 = CFSTR("valid");
      else
        v19 = CFSTR("invalid");
      if (-[QLCacheMMAPBlobDatabase isValid](*p_blobDatabase, "isValid"))
        v20 = CFSTR("valid");
      else
        v20 = CFSTR("invalid");
      NSLog(CFSTR("something is wrong, let's close the cache and open it after the reset (index is %@, blob is %@)"), v19, v20);
      v21 = *(NSObject **)(v3 + 32);
      if (!v21)
      {
        QLTInitLogging();
        v21 = *(NSObject **)(v3 + 32);
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[QLDiskCache _open].cold.6((uint64_t)&self->_indexDatabase, v21, (id *)&self->_blobDatabase);
      -[QLDiskCache _closeWhatIsOpen](self, "_closeWhatIsOpen");
      -[QLDiskCache _resetWithReason:](self, "_resetWithReason:", CFSTR("index or blob is invalid"));
      -[QLCacheIndexDatabase open](self->_indexDatabase, "open");
      -[QLCacheMMAPBlobDatabase open](self->_blobDatabase, "open");
      self->_opened = 1;
      if (!-[QLCacheIndexDatabase isValid](self->_indexDatabase, "isValid")
        || !-[QLCacheMMAPBlobDatabase isValid](*p_blobDatabase, "isValid"))
      {
        v22 = *(NSObject **)(v3 + 32);
        if (!v22)
        {
          QLTInitLogging();
          v22 = *(NSObject **)(v3 + 32);
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[QLDiskCache _open].cold.3();
        -[QLDiskCache _closeWhatIsOpen](self, "_closeWhatIsOpen");
      }
    }
    if (!self->_opened)
      goto LABEL_79;
    -[QLCacheIndexDatabase allReservedBuffers](*p_indexDatabase, "allReservedBuffers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[QLCacheMMAPBlobDatabase deleteBlobsWithArray:](*p_blobDatabase, "deleteBlobsWithArray:", v23))
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v49 != v27)
              objc_enumerationMutation(v24);
            -[QLCacheIndexDatabase removeReservedBufferWithBlobInfo:](*p_indexDatabase, "removeReservedBufferWithBlobInfo:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        }
        while (v26);
      }

      v8 = 0x1E0C99000;
    }
    else
    {
      NSLog(CFSTR("Problem to free all reserved buffers, we have to reset the cache"));
      v36 = *(NSObject **)(v3 + 32);
      if (!v36)
      {
        QLTInitLogging();
        v36 = *(NSObject **)(v3 + 32);
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[QLDiskCache _open].cold.4();
      -[QLDiskCache _close](self, "_close");
      -[QLDiskCache _resetWithReason:](self, "_resetWithReason:", CFSTR("unable to clean-up reserved buffer"));
      -[QLCacheIndexDatabase open](self->_indexDatabase, "open");
      -[QLCacheMMAPBlobDatabase open](self->_blobDatabase, "open");
      self->_opened = 1;
      if (!-[QLCacheIndexDatabase isValid](self->_indexDatabase, "isValid")
        || !-[QLCacheMMAPBlobDatabase isValid](*p_blobDatabase, "isValid"))
      {
        v37 = *(NSObject **)(v3 + 32);
        if (!v37)
        {
          QLTInitLogging();
          v37 = *(NSObject **)(v3 + 32);
        }
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[QLDiskCache _open].cold.3();
        -[QLDiskCache _closeWhatIsOpen](self, "_closeWhatIsOpen");
      }
    }
    if (self->_opened)
    {
      if (!self->_metaData)
      {
        objc_msgSend(*(id *)(v8 + 3592), "dictionaryWithContentsOfFile:", self->_metaDataFilePath);
        v38 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v39 = self->_metaData;
        self->_metaData = v38;

        if (!self->_metaData)
        {
          v40 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v8 + 3592));
          v41 = self->_metaData;
          self->_metaData = v40;

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", QLCacheInDebugMode());
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLDiskCache setMetaData:forKey:](self, "setMetaData:forKey:", v42, CFSTR("QLCacheDebugModeMetadataKey"));

    }
    if (!self->_opened)
    {
LABEL_79:
      if (*p_exclusiveFD >= 1)
      {
        if (close(*p_exclusiveFD))
        {
          v43 = *(NSObject **)(v3 + 32);
          if (!v43)
          {
            QLTInitLogging();
            v43 = *(NSObject **)(v3 + 32);
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            -[QLDiskCache _open].cold.2();
        }
        else
        {
          *p_exclusiveFD = 0;
        }
      }
    }
    -[QLDiskCache _removeDirtyLock](self, "_removeDirtyLock");
    opened = self->_opened;

    return opened;
  }
  *p_exclusiveFD = 0;
  v29 = *(NSObject **)(v3 + 32);
  if (!v29)
  {
    QLTInitLogging();
    v29 = *(NSObject **)(v3 + 32);
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[QLDiskCache _open].cold.1(v29);
  return 0;
}

- (void)_closeWhatIsOpen
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "closing what is already open", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "close the cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resetWithReason:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = MEMORY[0x1E0CD3398];
  v6 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
  if (!v6)
  {
    QLTInitLogging();
    v6 = *(NSObject **)(v5 + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D54AE000, v6, OS_LOG_TYPE_INFO, "reset of the cache", v8, 2u);
  }
  if (v4)
  {
    objc_msgSend(v4, "writeToFile:atomically:encoding:error:", self->_resetReasonPath, 1, 4, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtPath:error:", self->_resetReasonPath, 0);

  }
  unlink(-[NSString fileSystemRepresentation](self->_metaDataFilePath, "fileSystemRepresentation"));
  -[QLCacheIndexDatabase reset](self->_indexDatabase, "reset");
  -[QLCacheMMAPBlobDatabase reset](self->_blobDatabase, "reset");

}

- (id)_checkConsistency
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[QLCacheIndexDatabase allBuffersIncludingReserved:](self->_indexDatabase, "allBuffersIncludingReserved:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLCacheMMAPBlobDatabase checkConsistency:](self->_blobDatabase, "checkConsistency:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = CFSTR("OK");

  return v6;
}

- (BOOL)open
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __19__QLDiskCache_open__block_invoke;
  v4[3] = &unk_1E99D3098;
  v4[4] = self;
  v4[5] = &v5;
  -[QLDiskCache do:](self, "do:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __19__QLDiskCache_open__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_open");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)close
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __20__QLDiskCache_close__block_invoke;
  v2[3] = &unk_1E99D2B88;
  v2[4] = self;
  -[QLDiskCache do:](self, "do:", v2);
}

uint64_t __20__QLDiskCache_close__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_createDirtyLockInformDelegate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_close");
  return objc_msgSend(*(id *)(a1 + 32), "_removeDirtyLock");
}

- (void)reset
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __20__QLDiskCache_reset__block_invoke;
  v2[3] = &unk_1E99D2B88;
  v2[4] = self;
  -[QLDiskCache do:](self, "do:", v2);
}

uint64_t __20__QLDiskCache_reset__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_createDirtyLockInformDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_resetWithReason:", CFSTR("forced"));
  return objc_msgSend(*(id *)(a1 + 32), "_removeDirtyLock");
}

- (id)checkConsistency
{
  void *v2;
  __CFString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__QLDiskCache_checkConsistency__block_invoke;
  v5[3] = &unk_1E99D36F8;
  v5[4] = self;
  v5[5] = &v6;
  -[QLDiskCache doWriting:](self, "doWriting:", v5);
  v2 = (void *)v7[5];
  if (v2)
    v3 = v2;
  else
    v3 = CFSTR("cache is closed");
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __31__QLDiskCache_checkConsistency__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_checkConsistency");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 1;
}

- (id)metaDataForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_metaData, "objectForKey:", a3);
}

- (void)setMetaData:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_metaData, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!v7 || (objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKey:](self->_metaData, "setObject:forKey:", v8, v6);
      self->_metaDataDirty = 1;
    }

  }
  else
  {

    if (v7)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_metaData, "removeObjectForKey:", v6);
      self->_metaDataDirty = 1;
    }
  }

}

- (unint64_t)sizeSumOfThumbnailsOlderThanDate:(id)a3
{
  return -[QLCacheIndexDatabase sizeSumOfThumbnailsOlderThanDate:](self->_indexDatabase, "sizeSumOfThumbnailsOlderThanDate:", a3);
}

- (id)reserveBufferWithLength:(unint64_t)a3
{
  QLCacheMMAPBlobDatabase **p_blobDatabase;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;

  if (a3)
  {
    p_blobDatabase = &self->_blobDatabase;
    -[QLCacheMMAPBlobDatabase reserveBufferWithLength:](self->_blobDatabase, "reserveBufferWithLength:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[QLCacheIndexDatabase addReservedBufferWithBlobInfo:](self->_indexDatabase, "addReservedBufferWithBlobInfo:", v5);
      v6 = MEMORY[0x1E0CD3398];
      v7 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
      if (!v7)
      {
        QLTInitLogging();
        v7 = *(NSObject **)(v6 + 32);
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[QLDiskCache reserveBufferWithLength:].cold.2((uint64_t)p_blobDatabase, v7);
    }
    else
    {
      v8 = MEMORY[0x1E0CD3398];
      v9 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
      if (!v9)
      {
        QLTInitLogging();
        v9 = *(NSObject **)(v8 + 32);
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[QLDiskCache reserveBufferWithLength:].cold.1();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)reserveBufferForData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[QLDiskCache reserveBufferWithLength:](self, "reserveBufferWithLength:", objc_msgSend(v4, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[QLCacheMMAPBlobDatabase bufferPointedToByBlobInfo:](self->_blobDatabase, "bufferPointedToByBlobInfo:", v5);
      v7 = objc_retainAutorelease(v4);
      memcpy(v6, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
    }
    else
    {
      v8 = MEMORY[0x1E0CD3398];
      v9 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
      if (!v9)
      {
        QLTInitLogging();
        v9 = *(NSObject **)(v8 + 32);
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        v12 = 134217984;
        v13 = objc_msgSend(v4, "length");
        _os_log_impl(&dword_1D54AE000, v10, OS_LOG_TYPE_INFO, "cannot reserve buffer %llu", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)validateReservedBuffer:(id)a3
{
  id v4;
  QLCacheMMAPBlobDatabase **p_blobDatabase;
  QLCacheMMAPBlobDatabase *blobDatabase;
  uint64_t v7;
  NSObject *v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
LABEL_7:
    v9 = 1;
    goto LABEL_13;
  }
  if (-[QLCacheIndexDatabase removeReservedBufferWithBlobInfo:](self->_indexDatabase, "removeReservedBufferWithBlobInfo:", v4))
  {
    blobDatabase = self->_blobDatabase;
    p_blobDatabase = &self->_blobDatabase;
    -[QLCacheMMAPBlobDatabase validateReservedBufferWithBlobInfo:](blobDatabase, "validateReservedBufferWithBlobInfo:", v4);
    v7 = MEMORY[0x1E0CD3398];
    v8 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
    if (!v8)
    {
      QLTInitLogging();
      v8 = *(NSObject **)(v7 + 32);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[QLDiskCache validateReservedBuffer:].cold.1((uint64_t)p_blobDatabase, v8);
    goto LABEL_7;
  }
  v10 = MEMORY[0x1E0CD3398];
  v11 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
  if (!v11)
  {
    QLTInitLogging();
    v11 = *(NSObject **)(v10 + 32);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[QLDiskCache validateReservedBuffer:].cold.2();
  v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)discardReservedBuffer:(id)a3
{
  id v4;
  QLCacheMMAPBlobDatabase **p_blobDatabase;
  QLCacheMMAPBlobDatabase *blobDatabase;
  uint64_t v7;
  NSObject *v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
LABEL_7:
    v9 = 1;
    goto LABEL_13;
  }
  if (-[QLCacheIndexDatabase removeReservedBufferWithBlobInfo:](self->_indexDatabase, "removeReservedBufferWithBlobInfo:", v4))
  {
    blobDatabase = self->_blobDatabase;
    p_blobDatabase = &self->_blobDatabase;
    -[QLCacheMMAPBlobDatabase discardReservedBufferWithBlobInfo:](blobDatabase, "discardReservedBufferWithBlobInfo:", v4);
    v7 = MEMORY[0x1E0CD3398];
    v8 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
    if (!v8)
    {
      QLTInitLogging();
      v8 = *(NSObject **)(v7 + 32);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[QLDiskCache discardReservedBuffer:].cold.1((uint64_t)p_blobDatabase, v8);
    goto LABEL_7;
  }
  v10 = MEMORY[0x1E0CD3398];
  v11 = *(NSObject **)(MEMORY[0x1E0CD3398] + 32);
  if (!v11)
  {
    QLTInitLogging();
    v11 = *(NSObject **)(v10 + 32);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[QLDiskCache discardReservedBuffer:].cold.2();
  v9 = 0;
LABEL_13:

  return v9;
}

- (unint64_t)maxThumbnailLifeTime
{
  return -[QLCacheIndexDatabase maxThumbnailLifeTime](self->_indexDatabase, "maxThumbnailLifeTime");
}

- (unint64_t)fileEntryCount
{
  return -[QLCacheIndexDatabase fileEntryCount](self->_indexDatabase, "fileEntryCount");
}

- (unint64_t)thumbnailCount
{
  return -[QLCacheIndexDatabase thumbnailCount](self->_indexDatabase, "thumbnailCount");
}

- (id)lastCrapWithDate:(id *)a3
{
  return -[QLCacheIndexDatabase lastCrapWithDate:](self->_indexDatabase, "lastCrapWithDate:", a3);
}

- (id)lastResetWithDate:(id *)a3
{
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_resetReasonPath, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getResourceValue:forKey:error:", a3, *MEMORY[0x1E0C998D8], 0);
  v7 = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", self->_resetReasonPath, 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3
{
  return -[QLCacheIndexDatabase setLastHitDateOfAllCachedThumbnailsToDate:](self->_indexDatabase, "setLastHitDateOfAllCachedThumbnailsToDate:", a3);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (QLDiskCacheDelegate)delegate
{
  return (QLDiskCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasDirtyLock
{
  return self->_hasDirtyLock;
}

- (int64_t)writingCount
{
  return self->_writingCount;
}

- (void)setMetaDataDirty:(BOOL)a3
{
  self->_metaDataDirty = a3;
}

- (NSMutableDictionary)metaData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMetaData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)metaDataFilePath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetaDataFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_databaseLock, 0);
  objc_storeStrong((id *)&self->_resetReasonPath, 0);
  objc_storeStrong((id *)&self->_resetFilePath, 0);
  objc_storeStrong((id *)&self->_exclusivePath, 0);
  objc_storeStrong((id *)&self->_dirtyFilePath, 0);
  objc_storeStrong((id *)&self->_metaDataFilePath, 0);
  objc_storeStrong((id *)&self->_blobDatabase, 0);
  objc_storeStrong((id *)&self->_indexDatabase, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)noteRemoteThumbnailMissingForItems:(id)a3
{
  -[QLCacheIndexDatabase noteRemoteThumbnailMissingForItems:](self->_indexDatabase, "noteRemoteThumbnailMissingForItems:", a3);
}

- (void)noteRemoteThumbnailPresentForItems:(id)a3
{
  -[QLCacheIndexDatabase noteRemoteThumbnailPresentForItems:](self->_indexDatabase, "noteRemoteThumbnailPresentForItems:", a3);
}

- (id)itemsAfterFilteringOutItemsWithMissingThumbnails:(id)a3
{
  return -[QLCacheIndexDatabase itemsAfterFilteringOutItemsWithMissingThumbnails:](self->_indexDatabase, "itemsAfterFilteringOutItemsWithMissingThumbnails:", a3);
}

- (BOOL)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3
{
  QLDiskCache *v3;
  void *v4;

  v3 = self;
  -[QLCacheIndexDatabase removeFilesFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:](self->_indexDatabase, "removeFilesFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[QLDiskCache _deleteBlobArrayFromDatabase:](v3, "_deleteBlobArrayFromDatabase:", v4) != 0;

  return (char)v3;
}

- (BOOL)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3
{
  QLDiskCache *v3;
  void *v4;

  v3 = self;
  -[QLCacheIndexDatabase removeFilesFromUninstalledFileProvidersWithIdentifiers:](self->_indexDatabase, "removeFilesFromUninstalledFileProvidersWithIdentifiers:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[QLDiskCache _deleteBlobArrayFromDatabase:](v3, "_deleteBlobArrayFromDatabase:", v4) != 0;

  return (char)v3;
}

+ (void)defaultLocation
{
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_14_1(a1);
  v2 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_21(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_5(&dword_1D54AE000, v3, v4, "Can not get the user cache directory '%s'", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_2();
}

+ (void)setupCacheAtLocationIfNecessary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, v0, v1, "Did create %@", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)setupCacheAtLocationIfNecessary:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  _os_log_fault_impl(&dword_1D54AE000, v0, OS_LOG_TYPE_FAULT, "Could not create %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

+ (void)setupCacheAtLocationIfNecessary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_1(&dword_1D54AE000, v0, v1, "Creating directory '%@'", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initWithPathLocation:(uint64_t *)a1 cacheSize:(NSObject *)a2 cacheThread:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_1(&dword_1D54AE000, a2, a3, "init cache, _exclusivePath = %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

- (void)_setThumbnailData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "insertOrUpdateImageDataForCacheId failed, discarding buffers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setThumbnailData:(void *)a1 .cold.2(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *log;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  log = a1;
  objc_msgSend(a2, "fileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "bitmapFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v15, "width");
  objc_msgSend(a2, "bitmapFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "height");
  objc_msgSend(a2, "bitmapDataToValidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "location");
  objc_msgSend(a2, "bitmapDataToValidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  objc_msgSend(a2, "metadataToValidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "location");
  objc_msgSend(a2, "metadataToValidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138413826;
  v17 = v3;
  v18 = 2048;
  v19 = v13;
  v20 = 2048;
  v21 = v5;
  v22 = 2048;
  v23 = v7;
  v24 = 2048;
  v25 = v9;
  v26 = 2048;
  v27 = v11;
  v28 = 2048;
  v29 = objc_msgSend(v12, "length");
  _os_log_debug_impl(&dword_1D54AE000, log, OS_LOG_TYPE_DEBUG, "insert data %@ {%zu, %zu} thumbnail location : %llu length : %llu content rect location : %llu length : %llu", buf, 0x48u);

}

- (void)_setThumbnailData:(void *)a1 .cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_14_1(a1);
  objc_msgSend(a2, "fileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_1(&dword_1D54AE000, v3, v5, "pending thumbnail data has been invalidated, so we don't save it to the disk cache %@", v6);

  OUTLINED_FUNCTION_3_2();
}

- (void)_createDirtyLockInformDelegate:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_14_1(a1);
  v2 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_21(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_5(&dword_1D54AE000, v3, v4, "error opening dirty file: %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_2();
}

- (void)doWriting:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-_doWriting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __25__QLDiskCache_doWriting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "-_doWriting is on queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)freeDiskSpaceForNewThumbnails
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Freeing space for new thumbnails.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_open
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "opening the cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)reserveBufferWithLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Can't reserve buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)reserveBufferWithLength:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20(a1, a2);
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_9_1(&dword_1D54AE000, v3, v4, "buffer reserved, pointer: %p location: %lld length: %lld", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_12_0();
}

- (void)validateReservedBuffer:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20(a1, a2);
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_9_1(&dword_1D54AE000, v3, v4, "buffer validated, pointer: %p location: %lld length: %lld", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_12_0();
}

- (void)validateReservedBuffer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, v0, v1, "failed to remove buffer from reserved table while validating %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)discardReservedBuffer:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_20(a1, a2);
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_9_1(&dword_1D54AE000, v3, v4, "buffer discarded, pointer: %p location: %lld length: %lld", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_12_0();
}

- (void)discardReservedBuffer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_2(&dword_1D54AE000, v0, v1, "failed to remove buffer from reserved table while discarding reserved buffer for %@", v2);
  OUTLINED_FUNCTION_5();
}

@end
