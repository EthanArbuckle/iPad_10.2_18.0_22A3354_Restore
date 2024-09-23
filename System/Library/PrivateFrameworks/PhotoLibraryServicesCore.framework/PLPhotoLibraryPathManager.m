@implementation PLPhotoLibraryPathManager

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_internalPathManager;
}

- (BOOL)isUBF
{
  return self->_format == 2;
}

- (unsigned)bundleScope
{
  return -[PLPhotoLibraryPathManagerCore bundleScope](self->_internalPathManager, "bundleScope");
}

- (id)sqliteErrorIndicatorFilePath
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self, "photoDirectoryWithType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("sqliteerror"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)systemLibraryPathManager
{
  PLPhotoLibraryPathManager *v3;
  void *v4;
  PLPhotoLibraryPathManager *v5;

  v3 = [PLPhotoLibraryPathManager alloc];
  objc_msgSend(a1, "systemLibraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLPhotoLibraryPathManager initWithLibraryURL:](v3, "initWithLibraryURL:", v4);

  return v5;
}

+ (id)systemLibraryURL
{
  return +[PLPhotoLibraryPathManagerCore systemLibraryURL](PLPhotoLibraryPathManagerCore, "systemLibraryURL");
}

- (PLPhotoLibraryPathManager)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4
{
  return -[PLPhotoLibraryPathManager initWithLibraryURL:bundleScope:libraryFormat:](self, "initWithLibraryURL:bundleScope:libraryFormat:", a3, a4, 0);
}

- (PLPhotoLibraryPathManager)initWithLibraryURL:(id)a3
{
  return -[PLPhotoLibraryPathManager initWithLibraryURL:bundleScope:](self, "initWithLibraryURL:bundleScope:", a3, 0);
}

- (PLPhotoLibraryPathManager)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4 libraryFormat:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  id v9;
  PLPhotoLibraryPathManager *v10;
  PLPhotoLibraryPathManager *v11;
  int v12;
  PLPhotoLibraryPathManagerUBF *v13;
  PLPhotoLibraryPathManagerCore *internalPathManager;
  PLImportFileManager *v15;
  PLPhotoLibraryPathManagerUBF *v16;
  void *v17;
  uint64_t v18;
  PLPhotoLibraryPathManagerCore *v19;
  PLPhotoLibraryPathManagerDCIM *v20;
  PLPhotoLibraryPathManagerCore *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerImpl.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryURL"));

  }
  v25.receiver = self;
  v25.super_class = (Class)PLPhotoLibraryPathManager;
  v10 = -[PLPhotoLibraryPathManager init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    -[PLPhotoLibraryPathManager setOrCompareLibraryURL:](v10, "setOrCompareLibraryURL:", v9);
    v12 = -[PLPhotoLibraryPathManager _bundleFormatFromLibraryURL:libraryFormat:](v11, "_bundleFormatFromLibraryURL:libraryFormat:", v9, v5);
    v11->_format = v12;
    if (v12 == 2)
    {
      v13 = -[PLPhotoLibraryPathManagerUBF initWithLibraryURL:bundleScope:]([PLPhotoLibraryPathManagerUBF alloc], "initWithLibraryURL:bundleScope:", v9, 0);
      internalPathManager = v11->_internalPathManager;
      v11->_internalPathManager = &v13->super;

      if (!(_DWORD)v6)
        goto LABEL_9;
      -[PLPhotoLibraryPathManager photoDirectoryWithType:](v11, "photoDirectoryWithType:", -[PLPhotoLibraryPathManagerCore photoLibraryPathTypeForBundleScope:](v11->_internalPathManager, "photoLibraryPathTypeForBundleScope:", v6));
      v15 = (PLImportFileManager *)objc_claimAutoreleasedReturnValue();
      v16 = [PLPhotoLibraryPathManagerUBF alloc];
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PLPhotoLibraryPathManagerUBF initWithLibraryURL:bundleScope:](v16, "initWithLibraryURL:bundleScope:", v17, v6);
      v19 = v11->_internalPathManager;
      v11->_internalPathManager = (PLPhotoLibraryPathManagerCore *)v18;

    }
    else
    {
      v20 = -[PLPhotoLibraryPathManagerDCIM initWithLibraryURL:bundleScope:]([PLPhotoLibraryPathManagerDCIM alloc], "initWithLibraryURL:bundleScope:", v9, 0);
      v21 = v11->_internalPathManager;
      v11->_internalPathManager = &v20->super;

      v15 = -[PLImportFileManager initWithPathManager:]([PLImportFileManager alloc], "initWithPathManager:", v11);
      -[PLPhotoLibraryPathManagerCore setImportFileManager:](v11->_internalPathManager, "setImportFileManager:", v15);
    }

LABEL_9:
    if (!v11->_internalPathManager)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("PLPhotoLibraryPathManagerImpl.m"), 102, CFSTR("Failed to create a valid path manager for url: %@"), v9);

    }
  }

  return v11;
}

- (void)setOrCompareLibraryURL:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *singletonPhotoLibraryPath;
  id v17;

  v4 = a3;
  v5 = v4;
  v6 = atomic_load(sMultiLibraryMode);
  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:isDirectory:", v8, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock(&sSingletonPhotoLibraryPathLock);
    WeakRetained = objc_loadWeakRetained(&sSingletonPhotoLibraryPath);
    if (WeakRetained)
    {
      v10 = PLIsUBFOnDCIMLibraryURLForSingletonLibraryPath(v17, WeakRetained);
      objc_msgSend(v17, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", WeakRetained);

      if ((v12 & 1) == 0 && !v10)
      {
        os_unfair_lock_unlock(&sSingletonPhotoLibraryPathLock);
        v13 = (void *)objc_opt_class();
        objc_msgSend(v17, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "throwMultiLibraryAPIMisuseForLibraryPath:", v14);

LABEL_10:
        v4 = v17;
        goto LABEL_11;
      }
      objc_storeStrong((id *)&self->_singletonPhotoLibraryPath, WeakRetained);
    }
    else
    {
      objc_msgSend(v17, "path");
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      singletonPhotoLibraryPath = self->_singletonPhotoLibraryPath;
      self->_singletonPhotoLibraryPath = v15;

    }
    objc_storeWeak(&sSingletonPhotoLibraryPath, self->_singletonPhotoLibraryPath);
    os_unfair_lock_unlock(&sSingletonPhotoLibraryPathLock);
    goto LABEL_10;
  }
LABEL_11:

}

- (unsigned)_bundleFormatFromLibraryURL:(id)a3 libraryFormat:(unsigned __int8)a4
{
  int v4;
  id v5;

  v4 = a4;
  v5 = a3;
  if (v4 != 2 && v4 != 1)
  {
    if (v4)
    {
      LOBYTE(v4) = 0;
    }
    else if (objc_msgSend((id)objc_opt_class(), "isSystemPhotoLibraryURL:", v5))
    {
      if (PLMobileSlideShowPhotoLibraryTestingMode_onceToken != -1)
        dispatch_once(&PLMobileSlideShowPhotoLibraryTestingMode_onceToken, &__block_literal_global_3361);
      if (PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode == 2)
        LOBYTE(v4) = 2;
      else
        LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 2;
    }
  }

  return v4;
}

+ (BOOL)isSystemPhotoLibraryURL:(id)a3
{
  return +[PLPhotoLibraryPathManagerCore isSystemPhotoLibraryURL:](PLPhotoLibraryPathManagerCore, "isSystemPhotoLibraryURL:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singletonPhotoLibraryPath, 0);
  objc_storeStrong((id *)&self->_internalPathManager, 0);
}

+ (void)assertSingleLibraryMode
{
  if (objc_msgSend(a1, "isMultiLibraryModeEnabled"))
    objc_msgSend(a1, "throwMultiLibraryAPIMisuse");
}

+ (BOOL)isMultiLibraryModeEnabled
{
  unsigned __int8 v2;

  v2 = atomic_load(sMultiLibraryMode);
  return v2 & 1;
}

+ (int64_t)wellKnownPhotoLibraryIdentifierForURL:(id)a3
{
  return +[PLPhotoLibraryPathManagerCore wellKnownPhotoLibraryIdentifierForURL:](PLPhotoLibraryPathManagerCore, "wellKnownPhotoLibraryIdentifierForURL:", a3);
}

+ (BOOL)ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:](PLPhotoLibraryPathManagerCore, "ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:", a3);
}

+ (void)enableMultiLibraryMode
{
  unsigned __int8 v2;
  uint64_t v3;
  void *v4;

  do
    v2 = __ldaxr(sMultiLibraryMode);
  while (__stlxr(1u, sMultiLibraryMode));
  if ((v2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sMultiLibraryModeEnablingCallStack;
    sMultiLibraryModeEnablingCallStack = v3;

  }
}

- (PLPhotoLibraryPathManager)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid initializer used: %s"), "-[PLPhotoLibraryPathManager init]");

  return 0;
}

- (PLPhotoLibraryPathManager)initWithBaseDirectory:(id)a3
{
  void *v4;
  PLPhotoLibraryPathManager *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLPhotoLibraryPathManager initWithLibraryURL:](self, "initWithLibraryURL:", v4);

  return v5;
}

- (BOOL)isDCIM
{
  return self->_format != 2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoLibraryPathManager;
  -[PLPhotoLibraryPathManager description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLStringFromPLPhotoLibraryPathManagerLibraryFormatShort(self->_format);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self, "photoDirectoryWithType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@] [%@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self, "photoDirectoryWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLFileUtilities redactedDescriptionForPath:](PLFileUtilities, "redactedDescriptionForPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PLPhotoLibraryPathManager;
  -[PLPhotoLibraryPathManager description](&v10, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLStringFromPLPhotoLibraryPathManagerLibraryFormatShort(self->_format);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ [%@] [%@]"), v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_existingPrivateCacheDirectoriesToExclude
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)MEMORY[0x1E0C99E98];
  -[PLPhotoLibraryPathManagerCore basePrivateDirectoryPath](self->_internalPathManager, "basePrivateDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 1);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C999D0];
  v30[0] = *MEMORY[0x1E0C99A90];
  v30[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v5;
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v8, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("caches")))
        {
          objc_msgSend(v23, "path");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "URLByDeletingLastPathComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "URLByDeletingLastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v16, "isEqualToString:", v19);

          if (!v20)
            continue;
          objc_msgSend(v14, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v15);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  return v22;
}

- (id)_pathsToExcludeFromAllBackups
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLPhotoLibraryPathManager privateCacheDirectoryWithSubType:createIfNeeded:error:](self, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 0, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 18, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[PLPhotoLibraryPathManager _existingPrivateCacheDirectoriesToExclude](self, "_existingPrivateCacheDirectoriesToExclude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[PLPhotoLibraryPathManager externalDirectoryWithSubType:createIfNeeded:error:](self, "externalDirectoryWithSubType:createIfNeeded:error:", 0, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "addObject:", v8);
  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 3, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[PLPhotoLibraryPathManager internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:](self, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 5, 0, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  return v3;
}

- (id)_commonPathsToExcludeFromTimeMachineAndICloudBackups
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  PLPhotoLibraryPathManager *v16;
  id v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 2, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 14, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __81__PLPhotoLibraryPathManager__commonPathsToExcludeFromTimeMachineAndICloudBackups__block_invoke;
  v15 = &unk_1E376B6E0;
  v16 = self;
  v6 = v3;
  v17 = v6;
  -[PLPhotoLibraryPathManager enumerateBundleScopesWithBlock:](self, "enumerateBundleScopesWithBlock:", &v12);
  -[PLPhotoLibraryPathManager photoDirectoryWithType:leafType:createIfNeeded:error:](self, "photoDirectoryWithType:leafType:createIfNeeded:error:", 13, 3, 1, 0, v12, v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  -[PLPhotoLibraryPathManager photoDirectoryWithType:leafType:createIfNeeded:error:](self, "photoDirectoryWithType:leafType:createIfNeeded:error:", 13, 2, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  v9 = v17;
  v10 = v6;

  return v10;
}

- (id)_pathsToExcludeFromTimeMachineBackups
{
  void *v3;
  void *v4;

  -[PLPhotoLibraryPathManager _commonPathsToExcludeFromTimeMachineAndICloudBackups](self, "_commonPathsToExcludeFromTimeMachineAndICloudBackups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (id)_pathsToExcludeFromICloudBackups
{
  void *v3;
  void *v4;

  -[PLPhotoLibraryPathManager _commonPathsToExcludeFromTimeMachineAndICloudBackups](self, "_commonPathsToExcludeFromTimeMachineAndICloudBackups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 10, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (id)_pathsToExcludeFromICloudBackupsWithICPLEnabled
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PLPhotoLibraryPathManager *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 2, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 7, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PLPhotoLibraryPathManager__pathsToExcludeFromICloudBackupsWithICPLEnabled__block_invoke;
  v10[3] = &unk_1E376B6E0;
  v7 = v3;
  v11 = v7;
  v12 = self;
  -[PLPhotoLibraryPathManager enumerateBundleScopesWithBlock:](self, "enumerateBundleScopesWithBlock:", v10);
  v8 = v7;

  return v8;
}

- (id)_pathsToExplicitlyIncludeInAllBackups
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self, "photoDirectoryWithType:", 13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self, "photoDirectoryWithType:", 27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  return v3;
}

- (void)resetBackupExclusionPathsForBackupType:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__6878;
  v13[4] = __Block_byref_object_dispose__6879;
  v14 = 0;
  -[PLPhotoLibraryPathManager _pathsToExcludeFromAllBackups](self, "_pathsToExcludeFromAllBackups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke;
  v12[3] = &unk_1E376B708;
  v12[4] = v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

  -[PLPhotoLibraryPathManager _pathsToExplicitlyIncludeInAllBackups](self, "_pathsToExplicitlyIncludeInAllBackups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_45;
  v11[3] = &unk_1E376B708;
  v11[4] = v13;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  if (a3 == 2)
  {
    -[PLPhotoLibraryPathManager _pathsToExcludeFromICloudBackupsWithICPLEnabled](self, "_pathsToExcludeFromICloudBackupsWithICPLEnabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_46;
    v10[3] = &unk_1E376B708;
    v10[4] = v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
    goto LABEL_5;
  }
  if (a3 == 3)
  {
    -[PLPhotoLibraryPathManager _pathsToExcludeFromICloudBackups](self, "_pathsToExcludeFromICloudBackups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_47;
    v9[3] = &unk_1E376B708;
    v9[4] = v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
LABEL_5:

  }
  -[PLPhotoLibraryPathManager updateBackupExclusionPathsForBackupType:](self, "updateBackupExclusionPathsForBackupType:", a3);
  _Block_object_dispose(v13, 8);

}

- (void)updateBackupExclusionPathsForBackupType:(int64_t)a3
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__6878;
  v7[4] = __Block_byref_object_dispose__6879;
  v8 = 0;
  switch(a3)
  {
    case 3:
      -[PLPhotoLibraryPathManager _pathsToExcludeFromICloudBackupsWithICPLEnabled](self, "_pathsToExcludeFromICloudBackupsWithICPLEnabled");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke_49;
      v4[3] = &unk_1E376B708;
      v4[4] = v7;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);
      goto LABEL_7;
    case 2:
      -[PLPhotoLibraryPathManager _pathsToExcludeFromICloudBackups](self, "_pathsToExcludeFromICloudBackups");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke_48;
      v5[3] = &unk_1E376B708;
      v5[4] = v7;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
      goto LABEL_7;
    case 1:
      -[PLPhotoLibraryPathManager _pathsToExcludeFromTimeMachineBackups](self, "_pathsToExcludeFromTimeMachineBackups");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke;
      v6[3] = &unk_1E376B708;
      v6[4] = v7;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
LABEL_7:

      break;
  }
  _Block_object_dispose(v7, 8);

}

- (void)setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions:(unint64_t)a3 andBackupType:(int64_t)a4
{
  char v5;
  int v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v5 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (-[PLPhotoLibraryPathManager isUBF](self, "isUBF"))
  {
    v24 = 0;
    v7 = -[PLPhotoLibraryPathManager createPathsForNewLibrariesWithError:](self, "createPathsForNewLibrariesWithError:", &v24);
    v8 = v24;
    if (!v7)
    {
LABEL_19:

      return;
    }
    v9 = (void *)objc_opt_class();
    -[PLPhotoLibraryPathManager libraryURL](self, "libraryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "wellKnownPhotoLibraryIdentifierForURL:", v10);

    if (v11)
    {
      if (+[PLPhotoLibraryPathManagerCore backupSupportedForWellKnownLibraryIdentifier:](PLPhotoLibraryPathManagerCore, "backupSupportedForWellKnownLibraryIdentifier:", v11))
      {
        goto LABEL_13;
      }
    }
    else
    {
      v12 = (void *)objc_opt_class();
      -[PLPhotoLibraryPathManager libraryURL](self, "libraryURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isSystemPhotoLibraryURL:", v13);

      if ((v5 & 0x20) != 0 || v14)
      {
LABEL_13:
        -[PLPhotoLibraryPathManager resetBackupExclusionPathsForBackupType:](self, "resetBackupExclusionPathsForBackupType:", a4);
        -[PLPhotoLibraryPathManager libraryURL](self, "libraryURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        v20 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setTimeMachineExclusionAttribute:url:error:", 0, v19, &v23);
        v17 = v23;

        if (!v20)
        {
          PLLibraryServicesGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v17;
            goto LABEL_16;
          }
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    -[PLPhotoLibraryPathManager libraryURL](self, "libraryURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v16 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setTimeMachineExclusionAttribute:url:error:", 1, v15, &v22);
    v17 = v22;

    if (!v16)
    {
      PLLibraryServicesGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v17;
LABEL_16:
        _os_log_impl(&dword_199DF7000, v18, OS_LOG_TYPE_ERROR, "Failed to set the backup exclusion marker for the library bundle. Error: %@", buf, 0xCu);
      }
LABEL_17:

    }
LABEL_18:

    goto LABEL_19;
  }
  if (!a4)
  {
    -[PLPhotoLibraryPathManager _existingPrivateCacheDirectoriesToExclude](self, "_existingPrivateCacheDirectoriesToExclude");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", &__block_literal_global_6874);

  }
}

- (id)rebuildHistoryFilePath
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self, "photoDirectoryWithType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("rebuildHistory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __112__PLPhotoLibraryPathManager_setBackupExclusionAttributesForWellKnownLibrariesOrWithCreateOptions_andBackupType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v4 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setTimeMachineExclusionAttribute:url:error:", 1, v3, &v7);
  v5 = v7;
  if (!v4)
  {
    PLLibraryServicesGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v9 = v2;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion marker [DCIM private caches], path: %@, error: %@", buf, 0x16u);
    }

  }
}

void __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  id obj;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setTimeMachineExclusionAttribute:url:error:", 1, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion marker [time-machine], path: %@, error: %@", buf, 0x16u);
    }

  }
}

void __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  id obj;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = +[PLPhotoLibraryPathManagerCore setICloudBackupExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setICloudBackupExclusionAttribute:url:error:", 1, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion marker [iCloud], path: %@, error: %@", buf, 0x16u);
    }

  }
}

void __69__PLPhotoLibraryPathManager_updateBackupExclusionPathsForBackupType___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  id obj;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = +[PLPhotoLibraryPathManagerCore setICloudBackupExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setICloudBackupExclusionAttribute:url:error:", 1, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion marker [iCloud-iCPL-enabled], path: %@, error: %@", buf, 0x16u);
    }

  }
}

void __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  id obj;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setTimeMachineExclusionAttribute:url:error:", 1, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Failed to set backup exclusion marker [all], path: %@, error: %@", buf, 0x16u);
    }

  }
}

void __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id obj;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setTimeMachineExclusionAttribute:url:error:", 0, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Failed to clear backup exclusion marker [include], path: %@, error: %@", buf, 0x16u);
    }

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(id *)(v9 + 40);
  v10 = +[PLPhotoLibraryPathManagerCore setICloudBackupExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setICloudBackupExclusionAttribute:url:error:", 0, v4, &v13);
  objc_storeStrong((id *)(v9 + 40), v13);
  if (!v10)
  {
    PLLibraryServicesGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_ERROR, "Failed to clear backup backup exclusion marker [include], path: %@, error: %@", buf, 0x16u);
    }

  }
}

void __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  id obj;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = +[PLPhotoLibraryPathManagerCore setICloudBackupExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setICloudBackupExclusionAttribute:url:error:", 0, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Failed to clear backup exclusion marker [iCloud], path: %@, error: %@", buf, 0x16u);
    }

  }
}

void __68__PLPhotoLibraryPathManager_resetBackupExclusionPathsForBackupType___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  id obj;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = +[PLPhotoLibraryPathManagerCore setICloudBackupExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setICloudBackupExclusionAttribute:url:error:", 0, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (!v6)
  {
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Failed to clear backup exclusion marker [iCloud-iCPL-enabled], path: %@, error: %@", buf, 0x16u);
    }

  }
}

void __76__PLPhotoLibraryPathManager__pathsToExcludeFromICloudBackupsWithICPLEnabled__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  if ((_DWORD)a3 != 1)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "photoDirectoryWithType:createIfNeeded:error:", a3, 1, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __81__PLPhotoLibraryPathManager__commonPathsToExcludeFromTimeMachineAndICloudBackups__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  if ((objc_msgSend((id)objc_opt_class(), "bundleScopeShouldBePersistedForRebuild:", a2) & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "photoDirectoryWithType:createIfNeeded:error:", a3, 1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

+ (void)throwMultiLibraryAPIMisuseForLibraryPath:(id)a3
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained(&sSingletonPhotoLibraryPath);
    v7 = 138412546;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error: API misuse. Operating in single library mode for %@ but a different library was requested: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Requesting different library while in single library mode"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

+ (void)throwMultiLibraryAPIMisuse
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199DF7000, v2, OS_LOG_TYPE_ERROR, "Error: API misuse. Operating in multi library mode but calling single library mode API.", buf, 2u);
  }

  if (PFOSVariantHasInternalDiagnostics())
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_ERROR, "File radar with sysdiagnose to component: Photos Backend Storage | all", buf, 2u);
    }

    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Ask for help in #help-photos-disclosed", buf, 2u);
    }

  }
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "Call stack that enabled multi-library mode:", buf, 2u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (id)sMultiLibraryModeEnablingCallStack;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        PLBackendGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v11;
          _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_ERROR, "  %@", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

  v13 = (void *)sMultiLibraryModeEnablingCallStack;
  if (!sMultiLibraryModeEnablingCallStack)
    v13 = &unk_1E378FFC0;
  v14 = v13;
  v15 = (void *)MEMORY[0x1E0C99DA0];
  v16 = *MEMORY[0x1E0C99768];
  v23 = CFSTR("EnablingCallStack");
  v24 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, CFSTR("Calling single library mode API while in multi library mode"), v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v18);
}

+ (BOOL)bundleScopeShouldBePersistedForRebuild:(unsigned __int16)a3
{
  return (a3 < 6u) & (0x11u >> a3);
}

+ (id)managedPathWithUuid:(const char *)a3 base:(const char *)a4 fileMarker:(const char *)a5 extension:(const char *)a6
{
  return +[PLPhotoLibraryPathManagerCore managedPathWithUuid:base:fileMarker:extension:](PLPhotoLibraryPathManagerCore, "managedPathWithUuid:base:fileMarker:extension:", a3, a4, a5, a6);
}

+ (id)systemLibraryBaseDirectory
{
  return +[PLPhotoLibraryPathManagerCore systemLibraryBaseDirectory](PLPhotoLibraryPathManagerCore, "systemLibraryBaseDirectory");
}

+ (BOOL)setSystemLibraryURL:(id)a3 options:(unsigned __int16)a4 error:(id *)a5
{
  return +[PLPhotoLibraryPathManagerCore setSystemLibraryURL:options:error:](PLPhotoLibraryPathManagerCore, "setSystemLibraryURL:options:error:", a3, a4, a5);
}

+ (id)libraryURLFromDatabaseURL:(id)a3
{
  return +[PLPhotoLibraryPathManagerCore libraryURLFromDatabaseURL:](PLPhotoLibraryPathManagerCore, "libraryURLFromDatabaseURL:", a3);
}

+ (id)wellKnownPhotoLibraryURLForIdentifier:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore wellKnownPhotoLibraryURLForIdentifier:](PLPhotoLibraryPathManagerCore, "wellKnownPhotoLibraryURLForIdentifier:", a3);
}

+ (unint64_t)libraryCreateOptionsForWellKnownLibraryIdentifier:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore libraryCreateOptionsForWellKnownLibraryIdentifier:](PLPhotoLibraryPathManagerCore, "libraryCreateOptionsForWellKnownLibraryIdentifier:", a3);
}

+ (BOOL)shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:](PLPhotoLibraryPathManagerCore, "shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:", a3);
}

+ (BOOL)shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:](PLPhotoLibraryPathManagerCore, "shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:", a3);
}

+ (id)rootURLForPhotoLibraryDomain:(int64_t)a3
{
  return +[PLPhotoLibraryPathManagerCore rootURLForPhotoLibraryDomain:](PLPhotoLibraryPathManagerCore, "rootURLForPhotoLibraryDomain:", a3);
}

+ (id)photosLibraryExtension
{
  return +[PLPhotoLibraryPathManagerCore photosLibraryExtension](PLPhotoLibraryPathManagerCore, "photosLibraryExtension");
}

+ (id)allPhotosPathsOnThisDevice
{
  return +[PLPhotoLibraryPathManagerDCIM allPhotosPathsOnThisDevice](PLPhotoLibraryPathManagerDCIM, "allPhotosPathsOnThisDevice");
}

@end
