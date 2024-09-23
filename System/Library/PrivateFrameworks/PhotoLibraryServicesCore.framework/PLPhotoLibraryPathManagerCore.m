@implementation PLPhotoLibraryPathManagerCore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyMemoriesRelatedSnapshotDirectory, 0);
  objc_storeStrong((id *)&self->_legacyModelInterestDatabasePath, 0);
  objc_storeStrong((id *)&self->_iTunesPhotosDirectory, 0);
  objc_storeStrong((id *)&self->_assetUUIDRecoveryMappingPath, 0);
  objc_storeStrong((id *)&self->_baseDirectory, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 createIfNeeded:(BOOL)a5 error:(id *)a6
{
  return -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:leafType:additionalPathComponents:createIfNeeded:error:](self, "photoDirectoryWithType:leafType:additionalPathComponents:createIfNeeded:error:", a3, a4, 0, a5, a6);
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;
  unsigned __int8 v14;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v12 = a5;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:leafType:additionalPathComponents:](self, "photoDirectoryWithType:leafType:additionalPathComponents:", v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((_DWORD)v9 == 1 && objc_msgSend(v12, "length"))
    {
      v14 = 1;
    }
    else if (v9 > 1)
    {
      v14 = 1;
    }
    else
    {
      v14 = 2;
    }
    -[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:](self, "createDirectoryOnceWithPath:mask:pathType:error:", v13, v14, v10, a7);
  }

  return v13;
}

- (BOOL)createDirectoryOnceWithPath:(id)a3 mask:(unsigned __int8)a4 pathType:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v11;
  BOOL v12;
  id v13;
  unint64_t *p_photoDirectoriesExists;
  NSObject *v15;
  BOOL v16;
  os_unfair_lock_s *p_folderCreationAndCapabilitiesLock;
  id v18;
  _BOOL4 v19;
  id v20;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v7 = a5;
  v8 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (v7 >= 0x3F)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerCore.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(sizeof(PLExistsMask) * 8 - 1) > pathType"));

  }
  v27 = 0;
  v12 = -[PLPhotoLibraryPathManagerCore validateCreationRequestWithError:](self, "validateCreationRequestWithError:", &v27);
  v13 = v27;
  if (v12)
  {
    v26 = 0;
    p_photoDirectoriesExists = (unint64_t *)&v26;
    switch((int)v8)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid maskType for directory creation in %s"), "-[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:]");
        goto LABEL_31;
      case 1:
        goto LABEL_20;
      case 2:
        p_photoDirectoriesExists = &self->_photoDirectoriesExists;
        if (!v11)
          goto LABEL_31;
        goto LABEL_21;
      case 3:
        p_photoDirectoriesExists = &self->_privateSubDirectoriesExists;
        if (!v11)
          goto LABEL_31;
        goto LABEL_21;
      case 4:
        p_photoDirectoriesExists = &self->_privateCacheSubDirectoriesExists;
        if (!v11)
          goto LABEL_31;
        goto LABEL_21;
      case 5:
        p_photoDirectoriesExists = &self->_externalDirectoriesExists;
        if (!v11)
          goto LABEL_31;
        goto LABEL_21;
      case 6:
        p_photoDirectoriesExists = &self->_internalDirectoriesExists;
LABEL_20:
        if (v11)
          goto LABEL_21;
        goto LABEL_31;
      case 7:
        p_photoDirectoriesExists = &self->_persistedAlbumDataDirectoryExists;
        if (!v11)
          goto LABEL_31;
LABEL_21:
        p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
        os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
        if ((*p_photoDirectoriesExists & (1 << v7)) != 0)
        {
          v18 = v13;
          goto LABEL_30;
        }
        v25 = v13;
        v19 = +[PLFileUtilities createDirectoryAtPath:error:](PLFileUtilities, "createDirectoryAtPath:error:", v11, &v25);
        v18 = v25;

        if (v19)
        {
          *p_photoDirectoriesExists ^= 1 << v7;
          v24 = v18;
          -[PLPhotoLibraryPathManagerCore updateExclusionAttributeWithPath:mask:pathType:error:](self, "updateExclusionAttributeWithPath:mask:pathType:error:", v11, v8, v7, &v24);
          v20 = v24;

          v18 = v20;
LABEL_29:
          p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
          goto LABEL_30;
        }
        if (a6)
        {
          v18 = objc_retainAutorelease(v18);
          *a6 = v18;
          goto LABEL_29;
        }
        PLBackendGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v29 = "-[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:]";
          v30 = 2112;
          v31 = v11;
          v32 = 2112;
          v33 = v18;
          _os_log_impl(&dword_199DF7000, v22, OS_LOG_TYPE_ERROR, "%{public}s: failed to create directory: %@ with error: %@", buf, 0x20u);
        }

LABEL_30:
        os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
        v13 = v18;
LABEL_31:
        v16 = v13 == 0;
        break;
      default:
        goto LABEL_31;
    }
  }
  else
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "-[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:]";
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_ERROR, "%{public}s: failed to create directory: %@ with error: %@", buf, 0x20u);
    }

    if (a6)
    {
      v13 = objc_retainAutorelease(v13);
      v16 = 0;
      *a6 = v13;
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  return -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:leafType:createIfNeeded:error:](self, "photoDirectoryWithType:leafType:createIfNeeded:error:", a3, 0, a4, a5);
}

- (NSString)baseDirectory
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 additionalPathComponents:(id)a4
{
  return -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:leafType:additionalPathComponents:](self, "photoDirectoryWithType:leafType:additionalPathComponents:", a3, 1, a4);
}

- (id)photoDirectoryWithType:(unsigned __int8)a3
{
  return -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:additionalPathComponents:](self, "photoDirectoryWithType:additionalPathComponents:", a3, 0);
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (BOOL)updateExclusionAttributeWithPath:(id)a3 mask:(unsigned __int8)a4 pathType:(unsigned __int8)a5 error:(id *)a6
{
  int v7;
  int v8;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = v10;
  if (v8 == 6)
  {
    if (v7 == 6)
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid pathType for exclusion attribute in %s"), "-[PLPhotoLibraryPathManagerCore updateExclusionAttributeWithPath:mask:pathType:error:]");
      goto LABEL_12;
    }
    if (v7 == 5)
      goto LABEL_7;
LABEL_12:
    v13 = 1;
    goto LABEL_13;
  }
  if (v8 != 4)
    goto LABEL_12;
  if ((v7 - 1) >= 0x10)
  {
    if (v7 != 17)
    {
      if (v7)
        goto LABEL_12;
LABEL_7:
      v13 = -[PLPhotoLibraryPathManagerCore updateTimeMachineExclusionAttributeForExcludePath:error:](self, "updateTimeMachineExclusionAttributeForExcludePath:error:", v10, a6);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  objc_msgSend(v10, "stringByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLPhotoLibraryPathManagerCore updateTimeMachineExclusionAttributeForExcludePath:error:](self, "updateTimeMachineExclusionAttributeForExcludePath:error:", v12, a6);

LABEL_13:
  return v13;
}

- (id)privateDirectoryWithBundleIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[PLPhotoLibraryPathManagerCore basePrivateDirectoryPath](self, "basePrivateDirectoryPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v13 = 0;
      v9 = -[PLPhotoLibraryPathManagerCore validateCreationRequestWithError:](self, "validateCreationRequestWithError:", &v13);
      v10 = v13;
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = objc_claimAutoreleasedReturnValue();
        -[NSObject createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);
      }
      else
      {
        PLBackendGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v15 = "-[PLPhotoLibraryPathManagerCore privateDirectoryWithBundleIdentifier:createIfNeeded:]";
          v16 = 2112;
          v17 = v8;
          v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_ERROR, "%{public}s: failed to create directory: %@ with error: %@", buf, 0x20u);
        }
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)postInit
{
  id v3;

  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:additionalPathComponents:](self, "photoDirectoryWithType:additionalPathComponents:", 33, CFSTR("assetUUIDForPath.plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManagerCore setAssetUUIDRecoveryMappingPath:](self, "setAssetUUIDRecoveryMappingPath:", v3);

}

- (void)setAssetUUIDRecoveryMappingPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (PLPhotoLibraryPathManagerCore)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4
{
  uint64_t v4;
  id v7;
  PLPhotoLibraryPathManagerCore *v8;
  PLPhotoLibraryPathManagerCore *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  objc_super v15;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerCore.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryURL"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PLPhotoLibraryPathManagerCore;
  v8 = -[PLPhotoLibraryPathManagerCore init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_folderCreationAndCapabilitiesLock._os_unfair_lock_opaque = 0;
    v10 = (void *)objc_msgSend(v7, "copy");
    -[PLPhotoLibraryPathManagerCore setLibraryURL:](v9, "setLibraryURL:", v10);

    objc_msgSend(v7, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[PLPhotoLibraryPathManagerCore setBaseDirectory:](v9, "setBaseDirectory:", v12);

    -[PLPhotoLibraryPathManagerCore setBundleScope:](v9, "setBundleScope:", v4);
    *(_OWORD *)&v9->_privateCacheSubDirectoriesExists = 0u;
    *(_OWORD *)&v9->_internalDirectoriesExists = 0u;
    *(_OWORD *)&v9->_photoDirectoriesExists = 0u;
  }

  return v9;
}

+ (BOOL)isSystemPhotoLibraryURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "systemLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if ((v8 & 1) != 0)
    {
      v9 = 1;
      goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("libraryURLString cannot be nil"));
  }
  objc_msgSend(v5, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  +[PLFileUtilities realPathForPath:error:](PLFileUtilities, "realPathForPath:error:", v10, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;

  if (!v11)
  {
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v5;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_199DF7000, v13, OS_LOG_TYPE_DEFAULT, "No realpath for SPL URL %@, %@", buf, 0x16u);
    }

    objc_msgSend(v5, "URLByStandardizingPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v26 = v12;
  +[PLFileUtilities realPathForPath:error:](PLFileUtilities, "realPathForPath:error:", v6, &v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v26;

  if (!v15)
  {
    v17 = PLIsErrorFileNotFound(v16);
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v4;
        v30 = 2112;
        v31 = v16;
        v20 = v19;
        v21 = OS_LOG_TYPE_DEBUG;
LABEL_15:
        _os_log_impl(&dword_199DF7000, v20, v21, "No realpath for URL %@, %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v4;
      v30 = 2112;
      v31 = v16;
      v20 = v19;
      v21 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }

    objc_msgSend(v4, "URLByStandardizingPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = 0;
  if (v11 && v15)
  {
    stringWithoutTrailingSlashes(v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    stringWithoutTrailingSlashes(v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v23, "isEqualToString:", v24);

  }
LABEL_21:

  return v9;
}

+ (id)systemLibraryURL
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "systemLibraryURLIfResolvable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(a1, "_legacySystemLibraryBookmarkData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      && (objc_msgSend(a1, "_constructLegacySystemPhotoLibraryURLFromUnresolvableBookmark:", v4),
          (v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v3 = (void *)v5;
      PLBackendGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "path");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v7;
        v8 = "Constructed legacy SPL URL from unresolvable bookmark: %@";
LABEL_8:
        _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);

      }
    }
    else
    {
      +[PLFileUtilities defaultSystemLibraryURL](PLFileUtilities, "defaultSystemLibraryURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      PLBackendGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "path");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v7;
        v8 = "Returning default system library path (%@) as SPL";
        goto LABEL_8;
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)&splLock);
    objc_msgSend(v3, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_persistSystemPhotoLibraryPath:sendChangeNotification:", v9, 0);

    os_unfair_lock_unlock((os_unfair_lock_t)&splLock);
  }
  return v3;
}

+ (id)systemLibraryURLIfResolvable
{
  return +[PLFileUtilities defaultSystemLibraryURL](PLFileUtilities, "defaultSystemLibraryURL");
}

- (void)setLibraryURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void)setBundleScope:(unsigned __int16)a3
{
  self->_bundleScope = a3;
}

- (void)setBaseDirectory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setLegacyModelInterestDatabasePath:(id)a3
{
  objc_storeStrong((id *)&self->_legacyModelInterestDatabasePath, a3);
}

- (void)setLegacyMemoriesRelatedSnapshotDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_legacyMemoriesRelatedSnapshotDirectory, a3);
}

- (void)setITunesPhotosDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesPhotosDirectory, a3);
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

+ (void)initialize
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
    objc_msgSend(a1, "listenForSystemPhotoLibraryURLChanges");
}

+ (void)listenForSystemPhotoLibraryURLChanges
{
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch("com.apple.photos.systemphotolibraryurl", &splURLChangeNotificationToken, v2, &__block_literal_global_9074);

}

+ (BOOL)ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 > 0;
}

+ (int64_t)wellKnownPhotoLibraryIdentifierForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  int v9;

  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E378FDB8, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "integerValue");
    if (v7 >= 2)
    {
      objc_msgSend(a1, "wellKnownPhotoLibraryURLForIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "isEqual:", v8);

      if (!v9)
        v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)pathForCPLStatus
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:leafType:createIfNeeded:error:](self, "photoDirectoryWithType:leafType:createIfNeeded:error:", 13, 3, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("syncstatus.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3
{
  return -[PLPhotoLibraryPathManagerCore privateCacheDirectoryWithSubType:leafType:additionalPathComponents:](self, "privateCacheDirectoryWithSubType:leafType:additionalPathComponents:", a3, 0, 0);
}

- (PLPhotoLibraryPathManagerCore)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid initializer used: %s"), "-[PLPhotoLibraryPathManagerCore init]");

  return 0;
}

- (PLFileSystemCapabilities)capabilities
{
  os_unfair_lock_s *p_folderCreationAndCapabilitiesLock;
  PLFileSystemCapabilities *capabilities;
  PLFileSystemCapabilities *v5;
  PLFileSystemCapabilities *v6;
  PLFileSystemCapabilities *v7;
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  PLFileSystemCapabilities *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  capabilities = self->_capabilities;
  if (!capabilities)
  {
    v5 = objc_alloc_init(PLFileSystemCapabilities);
    v6 = self->_capabilities;
    self->_capabilities = v5;

    v7 = self->_capabilities;
    -[PLPhotoLibraryPathManagerCore libraryURL](self, "libraryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v9 = -[PLFileSystemCapabilities determineCapabilitiesWithURL:error:](v7, "determineCapabilitiesWithURL:error:", v8, &v16);
    v10 = v16;

    if (!v9)
    {
      PLBackendGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[PLPhotoLibraryPathManagerCore libraryURL](self, "libraryURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLFilePathDescription descriptionWithFileURL:](PLFilePathDescription, "descriptionWithFileURL:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_ERROR, "Error determining capabilities for %@: %@", buf, 0x16u);

      }
    }

    capabilities = self->_capabilities;
  }
  v14 = capabilities;
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
  return v14;
}

- (BOOL)validateCreationRequestWithError:(id *)a3
{
  char v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  v5 = 1;
  if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
  {
    -[PLPhotoLibraryPathManagerCore libraryURL](self, "libraryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v5 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", &v15);
    v7 = v15;

    if ((v5 & 1) == 0)
    {
      v16[0] = *MEMORY[0x1E0CB3308];
      -[PLPhotoLibraryPathManagerCore libraryURL](self, "libraryURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0CB3388];
      v17[0] = v8;
      v17[1] = v7;
      v10 = *MEMORY[0x1E0CB2D50];
      v16[1] = v9;
      v16[2] = v10;
      v17[2] = CFSTR("Bundle root was unreachable");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46802, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (a3)
        *a3 = objc_retainAutorelease(v12);

    }
  }
  return v5;
}

- (void)photoDirectoryCreationMaskResetWithType:(unsigned __int8)a3
{
  os_unfair_lock_s *p_folderCreationAndCapabilitiesLock;

  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  self->_photoDirectoriesExists &= ~(1 << a3);
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
}

- (void)privateDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3
{
  os_unfair_lock_s *p_folderCreationAndCapabilitiesLock;

  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  self->_privateSubDirectoriesExists &= ~(1 << a3);
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
}

- (void)privateCacheDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3
{
  os_unfair_lock_s *p_folderCreationAndCapabilitiesLock;

  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  self->_privateCacheSubDirectoriesExists &= ~(1 << a3);
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
}

- (void)externalDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3
{
  os_unfair_lock_s *p_folderCreationAndCapabilitiesLock;

  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  self->_externalDirectoriesExists &= ~(1 << a3);
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
}

- (void)internalDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3
{
  os_unfair_lock_s *p_folderCreationAndCapabilitiesLock;

  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  self->_internalDirectoriesExists &= ~(1 << a3);
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
}

- (BOOL)updateTimeMachineExclusionAttributeForExcludePath:(id)a3 error:(id *)a4
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)basePrivateDirectoryPath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)convertPhotoLibraryPathType:(unsigned __int8)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unsigned)photoLibraryPathTypeForBundleScope:(unsigned __int16)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)photosDatabasePath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)photosCPLDatabasePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:leafType:additionalPathComponents:](self, "photoDirectoryWithType:leafType:additionalPathComponents:", 13, 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = CFSTR("storage");
  v7[2] = CFSTR("store.cloudphotodb");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)photosAsideDatabasePath
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManagerCore photosDatabasePath](self, "photosDatabasePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("aside"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)clientOwnedDirectoryPathsForClientAccess:(id)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)pathsForClientAccess:(id)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)pathsForPermissionCheck
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return objc_alloc_init(MEMORY[0x1E0C99E60]);
}

- (BOOL)createPathsForNewLibrariesWithError:(id *)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)pathsForExternalWriters
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return objc_alloc_init(MEMORY[0x1E0C99E60]);
}

- (void)enumerateBundleScopesWithBlock:(id)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)path:(id)a3 isSubpathOfPhotoDirectoryWithType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  BOOL v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](self, "photoDirectoryWithType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10 <= objc_msgSend(v8, "count"))
  {
    v19 = 0;
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v21 = v6;
      v14 = 0;
      v15 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v9, "objectAtIndexedSubscript:", v14 + i);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v17) = objc_msgSend(v17, "isEqualToString:", v18);

          if (!(_DWORD)v17)
          {
            v19 = 0;
            goto LABEL_13;
          }
        }
        v14 += i;
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v13)
          continue;
        break;
      }
      v19 = 1;
LABEL_13:
      v6 = v21;
    }
    else
    {
      v19 = 1;
    }

  }
  return v19;
}

- (BOOL)pathRelativeToBundle:(id)a3 isSubpathOfPhotoDirectoryWithType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](self, "photoDirectoryWithType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = -[PLPhotoLibraryPathManagerCore path:isSubpathOfPhotoDirectoryWithType:](self, "path:isSubpathOfPhotoDirectoryWithType:", v8, v4);
  return v4;
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3
{
  return -[PLPhotoLibraryPathManagerCore privateDirectoryWithSubType:leafType:additionalPathComponents:](self, "privateDirectoryWithSubType:leafType:additionalPathComponents:", a3, 0, 0);
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  return -[PLPhotoLibraryPathManagerCore privateDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:](self, "privateDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", a3, 0, 0, a4, a5);
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 createIfNeeded:(BOOL)a5 error:(id *)a6
{
  return -[PLPhotoLibraryPathManagerCore privateDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:](self, "privateDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", a3, a4, 0, a5, a6);
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;
  uint64_t v14;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v12 = a5;
  -[PLPhotoLibraryPathManagerCore privateDirectoryWithSubType:leafType:additionalPathComponents:](self, "privateDirectoryWithSubType:leafType:additionalPathComponents:", v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((_DWORD)v9 == 1 && objc_msgSend(v12, "length"))
    {
      v14 = 1;
    }
    else if ((_DWORD)v9 == 2)
    {
      v14 = 1;
    }
    else
    {
      v14 = 3;
    }
    -[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:](self, "createDirectoryOnceWithPath:mask:pathType:error:", v13, v14, v10, a7);
  }

  return v13;
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  return -[PLPhotoLibraryPathManagerCore privateCacheDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:](self, "privateCacheDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", a3, 0, 0, a4, a5);
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;
  uint64_t v14;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v12 = a5;
  -[PLPhotoLibraryPathManagerCore privateCacheDirectoryWithSubType:leafType:additionalPathComponents:](self, "privateCacheDirectoryWithSubType:leafType:additionalPathComponents:", v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14 = 4;
    if ((_DWORD)v9 == 1)
    {
      if (objc_msgSend(v12, "length"))
        v14 = 1;
      else
        v14 = 4;
    }
    -[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:](self, "createDirectoryOnceWithPath:mask:pathType:error:", v13, v14, v10, a7);
  }

  return v13;
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3
{
  return -[PLPhotoLibraryPathManagerCore externalDirectoryWithSubType:leafType:additionalPathComponents:](self, "externalDirectoryWithSubType:leafType:additionalPathComponents:", a3, 0, 0);
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  return -[PLPhotoLibraryPathManagerCore externalDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:](self, "externalDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", a3, 0, 0, a4, a5);
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void *v13;
  uint64_t v14;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v12 = a5;
  -[PLPhotoLibraryPathManagerCore externalDirectoryWithSubType:leafType:additionalPathComponents:](self, "externalDirectoryWithSubType:leafType:additionalPathComponents:", v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((_DWORD)v9 == 1 && objc_msgSend(v12, "length"))
    {
      v14 = 1;
    }
    else if ((_DWORD)v9 == 2)
    {
      v14 = 1;
    }
    else
    {
      v14 = 5;
    }
    -[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:](self, "createDirectoryOnceWithPath:mask:pathType:error:", v13, v14, v10, a7);
  }

  return v13;
}

- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4 createIfNeeded:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  uint64_t v8;
  id v10;
  void *v11;
  uint64_t v12;

  v7 = a5;
  v8 = a3;
  v10 = a4;
  -[PLPhotoLibraryPathManagerCore internalDirectoryWithSubType:additionalPathComponents:](self, "internalDirectoryWithSubType:additionalPathComponents:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v10, "length"))
      v12 = 1;
    else
      v12 = 6;
    -[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:](self, "createDirectoryOnceWithPath:mask:pathType:error:", v11, v12, v8, a6);
  }

  return v11;
}

- (id)assetMainFilePathWithDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)pathToAssetsToAlbumsMapping
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)syncInfoPath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)knownDBPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibraryPathManagerCore photosDatabasePath](self, "photosDatabasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  -[PLPhotoLibraryPathManagerCore photosAsideDatabasePath](self, "photosAsideDatabasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  -[PLPhotoLibraryPathManagerCore privateDirectoryWithSubType:](self, "privateDirectoryWithSubType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  -[PLPhotoLibraryPathManagerCore photosCPLDatabasePath](self, "photosCPLDatabasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)temporaryFileBackedDebugDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("com.apple.photos.file-backed-datasource"));
  v7 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = 0;
    v8 = +[PLFileUtilities createDirectoryAtPath:error:](PLFileUtilities, "createDirectoryAtPath:error:", v7, &v13);
    v9 = v13;
    v10 = v9;
    if (!v8)
    {
      if (a4)
      {
        *a4 = objc_retainAutorelease(v9);
        v11 = v7;
        v7 = 0;
      }
      else
      {
        PLBackendGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v15 = "-[PLPhotoLibraryPathManagerCore temporaryFileBackedDebugDirectoryCreateIfNeeded:error:]";
          v16 = 2112;
          v17 = v7;
          v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_ERROR, "%s: failed to create directory: %@ with error: %@", buf, 0x20u);
        }
      }

    }
  }
  return v7;
}

- (id)temporaryDragAndDropDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("com.apple.photos.drag-and-drop"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = 0;
    v8 = +[PLFileUtilities createDirectoryAtPath:error:](PLFileUtilities, "createDirectoryAtPath:error:", v7, &v13);
    v9 = v13;
    v10 = v9;
    if (!v8)
    {
      if (a4)
      {
        *a4 = objc_retainAutorelease(v9);
      }
      else
      {
        PLBackendGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v15 = "-[PLPhotoLibraryPathManagerCore temporaryDragAndDropDirectoryCreateIfNeeded:error:]";
          v16 = 2112;
          v17 = v7;
          v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_ERROR, "%s: failed to create directory: %@ with error: %@", buf, 0x20u);
        }

      }
    }

  }
  return v7;
}

- (BOOL)shouldUseFileIdentifierForBundleScope:(unsigned __int16)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)readOnlyUrlWithIdentifier:(id)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setExtendedAttributesWithIdentifier:(id)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setExtendedAttributesWithIdentifier:(id)a3 andURL:(id)a4
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)obtainAccessAndWaitWithFileWithIdentifier:(id)a3 mode:(unsigned __int8)a4 toURLWithHandler:(id)a5
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (id)pathsForLibraryFilesystemSizeCalculation
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)pathsForFinderSyncFilesystemSizeCalculation
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)_dataProtectionIndicatorFilePath
{
  return -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:additionalPathComponents:](self, "photoDirectoryWithType:additionalPathComponents:", 2, CFSTR("protection"));
}

- (BOOL)isDataProtectionComplete
{
  void *v2;
  BOOL v3;

  -[PLPhotoLibraryPathManagerCore _dataProtectionIndicatorFilePath](self, "_dataProtectionIndicatorFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PLDoesIndicatorFileExistAtPath(v2);

  return v3;
}

- (void)setDataProtectionComplete:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[PLPhotoLibraryPathManagerCore _dataProtectionIndicatorFilePath](self, "_dataProtectionIndicatorFilePath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  PLMakeIndicatorFileExistAtPath(v4, v3);

}

- (BOOL)isDeviceRestoreSupported
{
  return 1;
}

- (BOOL)ensureFileProviderSyncExclusionAttributeIsSetWithError:(id *)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 type:(unsigned __int8)a4 bundleScope:(unsigned __int16)a5
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 rootPath:(id)a4
{
  __CFString *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = (__CFString *)a3;
  v6 = a4;
  if ((-[__CFString hasPrefix:](v5, "hasPrefix:", v6) & 1) != 0)
  {
    v7 = v5;
    goto LABEL_3;
  }
  if (-[__CFString hasPrefix:](v5, "hasPrefix:", CFSTR("/private/"))
    && (objc_msgSend(v6, "hasPrefix:", CFSTR("/private/")) & 1) == 0)
  {
    -[__CFString substringFromIndex:](v5, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "hasPrefix:", v6))
    {
LABEL_10:

      goto LABEL_11;
    }

LABEL_3:
    v8 = objc_msgSend(v7, "length");
    if (v8 == objc_msgSend(v6, "length"))
    {
      v5 = &stru_1E376D3F8;
    }
    else
    {
      objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v6, "length") + 1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (id)pathToAssetAlbumOrderStructure
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)cloudRestoreForegroundPhaseCompleteTokenPath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)cloudRestoreBackgroundPhaseInProgressTokenPath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)cloudRestoreCompleteTokenPath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)cloudRestoreContextPath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)modelRestorePostProcessingCompleteTokenPath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)iTunesPhotosLastSyncMetadataFilePath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)iTunesPhotosSyncCurrentLibraryUUIDPath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)iTunesPhotosSyncMetadataFilePath
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)iTunesSyncedAssetMetadataThumbnailsDirectory
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)iTunesSyncedAssetSmallThumbnailsDirectory
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)iTunesSyncedAssetsDirectory
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)iTunesSyncedFaceAlbumThumbnailsDirectory
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)iTunesSyncedFaceDataDirectory
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)persistedAlbumDataDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)photoMetadataDirectoryForMediaInMainDirectory:(id)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)assetBaseFilenameForAdjustmentFilePath:(id)a3
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)pathsGroupedByAssetBasePathFromFilePaths:(id)a3 populateInvalidAdjustmentPaths:(id)a4
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)simpleDCIMDirectory
{
  -[PLPhotoLibraryPathManagerCore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)assetUUIDRecoveryMappingPath
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)iTunesPhotosDirectory
{
  return self->_iTunesPhotosDirectory;
}

- (NSString)legacyModelInterestDatabasePath
{
  return self->_legacyModelInterestDatabasePath;
}

- (NSString)legacyMemoriesRelatedSnapshotDirectory
{
  return self->_legacyMemoriesRelatedSnapshotDirectory;
}

+ (BOOL)setTimeMachineExclusionAttribute:(BOOL)a3 url:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  id v13;
  char v14;
  id v15;
  BOOL v16;
  id v18;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C999D8];
  v18 = 0;
  v11 = objc_msgSend(v8, "setResourceValue:forKey:error:", v9, v10, &v18);

  v12 = v18;
  if (v11)
  {
    v13 = v12;
LABEL_4:
    v16 = 1;
    goto LABEL_5;
  }
  v14 = PLIsErrorFileNotFound(v12);
  v15 = v12;
  if ((v14 & 1) != 0)
    goto LABEL_4;
  v16 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v15);
LABEL_5:

  return v16;
}

+ (BOOL)setICloudBackupExclusionAttribute:(BOOL)a3 url:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v7;
  id v8;
  void *v9;
  BOOL result;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v8, "setResourceValue:forKey:error:", v9, *MEMORY[0x1E0C9AC90], a5);

  if ((v7 & 1) != 0 || (PLIsErrorFileNotFound(0) & 1) != 0)
    return 1;
  result = 0;
  if (a5)
    *a5 = 0;
  return result;
}

+ (id)libraryURLFromDatabaseURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isSupportedFileSystemAtURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PLFileSystemCapabilities capabilitiesWithURL:](PLFileSystemCapabilities, "capabilitiesWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isWholeFileLockCapable");
  if ((v5 & 1) == 0)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_DEFAULT, "Not a valid system library URL because it not a supported filesystem %@: %@", (uint8_t *)&v9, 0x16u);

    }
  }

  return v5;
}

+ (id)systemLibraryBaseDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "systemLibraryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allPhotosPathsOnThisDevice
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (void)_updateSystemLibraryURLWithOldValue:(id)a3
{
  id v3;
  PLNonBindingAssetsdClient *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;

  v3 = a3;
  v4 = objc_alloc_init(PLNonBindingAssetsdClient);
  -[PLNonBindingAssetsdClient systemLibraryURLReadOnlyClient](v4, "systemLibraryURLReadOnlyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "systemPhotoLibraryURLWithError:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&splLock);
    if ((id)sCurrentSystemPhotoLibraryURL == v3)
      objc_storeStrong((id *)&sCurrentSystemPhotoLibraryURL, v6);
    os_unfair_lock_unlock((os_unfair_lock_t)&splLock);
  }

}

+ (id)_legacySystemLibraryBookmarkData
{
  return 0;
}

+ (id)_legacySystemLibraryPath
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&splLock);
  return 0;
}

+ (id)_constructLegacySystemPhotoLibraryURLFromUnresolvableBookmark:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = *MEMORY[0x1E0C99AA8];
  v23[0] = *MEMORY[0x1E0C99AA8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceValuesForKeys:fromBookmarkData:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = v9;
        _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_DEFAULT, "Constructed legacy SPL URL based on unresolvable bookmark: %@", (uint8_t *)&v21, 0xCu);
      }

      if (v9)
      {
        v11 = v9;

        goto LABEL_16;
      }
    }
    else
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_DEFAULT, "No NSURLPathKey available from unresolvable bookmark", (uint8_t *)&v21, 2u);
      }

    }
  }
  v13 = 0;
  do
  {
    v14 = v13;
    v15 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/Volumes/"), "stringByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:isDirectory:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while ((objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0);
  PLBackendGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v13;
    _os_log_impl(&dword_199DF7000, v19, OS_LOG_TYPE_DEFAULT, "Legacy system photo library URL exists but it is not resolvable. Returning bogus URL: %@", (uint8_t *)&v21, 0xCu);
  }

  v11 = v13;
LABEL_16:

  return v11;
}

+ (BOOL)setSystemLibraryURL:(id)a3 options:(unsigned __int16)a4 error:(id *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PLNonBindingAssetsdClient *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v27;
  id v28;
  uint8_t buf[8];
  _QWORD v30[2];
  _QWORD v31[3];

  v6 = a4;
  v31[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
LABEL_4:
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
    if (PLIsReallyAssetsd_isAssetsd)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&splLock);
      if ((v6 & 2) != 0)
      {
        if ((v6 & 1) != 0)
        {
          v25 = (void *)sSystemPhotoLibraryOverridePath;
          sSystemPhotoLibraryOverridePath = 0;

          v23 = 0;
          v15 = 1;
        }
        else
        {
          PLBackendGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199DF7000, v24, OS_LOG_TYPE_DEFAULT, "Resetting persisted system photo library path", buf, 2u);
          }

          v15 = 1;
          objc_msgSend(a1, "_persistSystemPhotoLibraryPath:sendChangeNotification:", 0, 1);
          v23 = 0;
        }
      }
      else
      {
        objc_msgSend(v8, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        +[PLFileUtilities realPathForPath:error:](PLFileUtilities, "realPathForPath:error:", v12, &v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v28;

        v15 = v13 != 0;
        if (v13)
        {
          if ((v6 & 1) != 0)
            objc_storeStrong((id *)&sSystemPhotoLibraryOverridePath, v13);
          else
            objc_msgSend(a1, "_persistSystemPhotoLibraryPath:sendChangeNotification:", v13, 1);
          v23 = 0;
        }
        else
        {
          v23 = v14;
        }

      }
      os_unfair_lock_unlock((os_unfair_lock_t)&splLock);
      if (!a5)
        goto LABEL_28;
    }
    else
    {
      v21 = objc_alloc_init(PLNonBindingAssetsdClient);
      -[PLNonBindingAssetsdClient libraryManagementClient](v21, "libraryManagementClient");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v15 = objc_msgSend(v22, "setSystemPhotoLibraryURL:error:", v8, &v27);
      v23 = v27;

      if (!a5)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    if (v23)
      *a5 = objc_retainAutorelease(v23);
    goto LABEL_28;
  }
  buf[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, buf);

  if (!v11)
  {
    v16 = 41015;
    if (!a5)
      goto LABEL_11;
LABEL_10:
    v17 = *MEMORY[0x1E0CB3308];
    v31[0] = v8;
    v18 = *MEMORY[0x1E0CB2D50];
    v30[0] = v17;
    v30[1] = v18;
    NSStringFromPLErrorCode(v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), v16, v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  if (+[PLPhotoLibraryPathManagerCore isSupportedFileSystemAtURL:](PLPhotoLibraryPathManagerCore, "isSupportedFileSystemAtURL:", v8))
  {
    goto LABEL_4;
  }
  v16 = 46107;
  if (a5)
    goto LABEL_10;
LABEL_11:
  v15 = 0;
LABEL_29:

  return v15;
}

+ (void)recordPrevSystemLibraryPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99EA0];
    v4 = a3;
    objc_msgSend(v3, "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("PrevSystemLibraryPathsByDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v6, "mutableCopy");

    v7 = v15;
    if (!v15)
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = v7;
    if ((unint64_t)objc_msgSend(v7, "count") >= 0xA)
    {
      objc_msgSend(v16, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectForKey:", v10);

    }
    if (recordPrevSystemLibraryPath__onceToken != -1)
      dispatch_once(&recordPrevSystemLibraryPath__onceToken, &__block_literal_global_190_9052);
    v11 = (void *)recordPrevSystemLibraryPath__formatter;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setObject:forKey:", v4, v13);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("PrevSystemLibraryPathsByDate"));

  }
}

+ (id)_readSystemPhotoLibraryPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&splLock);
  v3 = (void *)sSystemLibraryPath;
  if (!sSystemLibraryPath)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.photolibraryd.private"));
    objc_msgSend(v4, "objectForKey:", CFSTR("SystemLibraryPath"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)sSystemLibraryPath;
    sSystemLibraryPath = v5;

    if (sSystemLibraryPath)
    {
LABEL_13:

      v3 = (void *)sSystemLibraryPath;
      return v3;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForKey:", CFSTR("SystemLibraryPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!objc_msgSend(a1, "_persistSystemPhotoLibraryPath:sendChangeNotification:", v8, 0))
      {
LABEL_12:

        goto LABEL_13;
      }
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_DEFAULT, "Removing SPL path from NSUserDefaults", (uint8_t *)&v12, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v10, "removeObjectForKey:", CFSTR("SystemLibraryPath"));
    }
    else
    {
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_DEFAULT, "No SPL stored, and SPL from standard defaults was %@", (uint8_t *)&v12, 0xCu);
      }
    }

    goto LABEL_12;
  }
  return v3;
}

+ (BOOL)_persistSystemPhotoLibraryPath:(id)a3 sendChangeNotification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  int v17;
  id v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&splLock);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.photolibraryd.private"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v6)
    {
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v12;
        _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "object being saved as SPL path is not valid: %@", (uint8_t *)&v17, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("SystemLibraryPath"));
      objc_msgSend(v7, "objectForKey:", CFSTR("SystemLibraryPath"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        PLBackendGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEFAULT, "Removed SPL path from private group container", (uint8_t *)&v17, 2u);
        }
        goto LABEL_19;
      }
    }
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("SystemLibraryPath"));
  objc_msgSend(v7, "objectForKey:", CFSTR("SystemLibraryPath"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !-[NSObject isEqualToString:](v8, "isEqualToString:", v6))
  {
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_199DF7000, v13, OS_LOG_TYPE_ERROR, "Failed to write SPL path to private group container", (uint8_t *)&v17, 2u);
    }

    goto LABEL_15;
  }
  PLBackendGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_DEFAULT, "Successfully wrote SPL path to private group container: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_19:
  objc_storeStrong((id *)&sSystemLibraryPath, a3);
  if (v4)
    notify_post("com.apple.photos.systemphotolibraryurl");
  v15 = 1;
LABEL_16:

  return v15;
}

+ (id)managedPathWithUuid:(const char *)a3 base:(const char *)a4 fileMarker:(const char *)a5 extension:(const char *)a6
{
  size_t v11;
  size_t v12;
  size_t v13;
  char *v14;
  int v15;
  void *v16;
  void *v18;

  v11 = strlen(a4);
  v12 = v11 + strlen(a3) + 4;
  if (a5 && a6)
  {
    v13 = strlen(a5);
    v12 += v13 + strlen(a6) + 2;
    v14 = (char *)malloc_type_calloc(1uLL, v12, 0x2F2B3D45uLL);
    v15 = snprintf(v14, v12, "%s/%c/%s_%s.%s");
  }
  else if (a5)
  {
    v12 += strlen(a5) + 1;
    v14 = (char *)malloc_type_calloc(1uLL, v12, 0x2C6252C8uLL);
    v15 = snprintf(v14, v12, "%s/%c/%s_%s");
  }
  else if (a6)
  {
    v12 += strlen(a6) + 1;
    v14 = (char *)malloc_type_calloc(1uLL, v12, 0x984B066EuLL);
    v15 = snprintf(v14, v12, "%s/%c/%s.%s");
  }
  else
  {
    v14 = (char *)malloc_type_calloc(1uLL, v12, 0xA2FE7322uLL);
    v15 = snprintf(v14, v12, "%s/%c/%s");
  }
  if (v12 <= v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryPathManagerCore.m"), 1157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("formattedLen < urlStringLen"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  free(v14);
  return v16;
}

+ (id)_photosLibrariesDataVaultPathForLibraryBundleName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "photosLibrariesDataVaultPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)photosDataVaultPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[PLFileUtilities embeddedHomeDirectory](PLFileUtilities, "embeddedHomeDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Photos"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)photosLibrariesDataVaultPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "photosDataVaultPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Libraries"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_photosLibrariesDataVaultPathForApplicationLibrariesDomain
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "photosLibrariesDataVaultPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Application"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)photosLibraryExtension
{
  return CFSTR("photoslibrary");
}

+ (id)wellKnownPhotoLibraryURLForIdentifier:(int64_t)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;

  v3 = a1;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PLPhotoLibraryPathManagerCore.m"), 1205, CFSTR("API misuse: requesting URL for a non-well-known library"));

      v6 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fileURLWithPath:", v9);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    case 1:
      objc_msgSend(a1, "systemLibraryURL");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      v11 = CFSTR("Messages.photoslibrary");
      goto LABEL_6;
    case 3:
      v11 = CFSTR("Syndication.photoslibrary");
LABEL_6:
      objc_msgSend(a1, "_photosLibrariesDataVaultPathForLibraryBundleName:", v11);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v3 = (void *)v10;
      break;
    default:
      return v3;
  }
  return v3;
}

+ (unint64_t)libraryCreateOptionsForWellKnownLibraryIdentifier:(int64_t)a3
{
  unint64_t v3;

  if (a3 == 3)
    v3 = 3;
  else
    v3 = 0;
  if (a3 == 2)
    return 19;
  else
    return v3;
}

+ (BOOL)backupSupportedForWellKnownLibraryIdentifier:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

+ (BOOL)shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 > 1;
}

+ (BOOL)shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

+ (id)rootURLForPhotoLibraryDomain:(int64_t)a3
{
  void *v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if ((unint64_t)(a3 - 2) < 2)
  {
    objc_msgSend(a1, "_photosLibrariesDataVaultPathForApplicationLibrariesDomain");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v3 = (void *)v11;
    return v3;
  }
  if (a3 == 1)
  {
    objc_msgSend(a1, "photosLibrariesDataVaultPath");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryPathManagerCore.m"), 1303, CFSTR("API misuse: requesting URL for unknown domain"));

    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)basenameForSpatialOverCaptureFromOriginalBasename:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("S"));
}

void __61__PLPhotoLibraryPathManagerCore_recordPrevSystemLibraryPath___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)recordPrevSystemLibraryPath__formatter;
  recordPrevSystemLibraryPath__formatter = (uint64_t)v0;

  objc_msgSend((id)recordPrevSystemLibraryPath__formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH.mm.ss.SSS"));
  v2 = (void *)recordPrevSystemLibraryPath__formatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

void __70__PLPhotoLibraryPathManagerCore_listenForSystemPhotoLibraryURLChanges__block_invoke()
{
  void *v0;

  os_unfair_lock_lock((os_unfair_lock_t)&splLock);
  v0 = (void *)sCurrentSystemPhotoLibraryURL;
  sCurrentSystemPhotoLibraryURL = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&splLock);
}

@end
