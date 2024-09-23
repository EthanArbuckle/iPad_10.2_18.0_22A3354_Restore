@implementation PLPhotoLibraryPathManager(conveniences)

- (uint64_t)cplLocalModeEnabledMarkerFilePathForReading
{
  return objc_msgSend(a1, "_cplLocalModeEnabledMarkerFilePathCreateIfNeeded:", 0);
}

- (id)_cplLocalModeEnabledMarkerFilePathCreateIfNeeded:()conveniences
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 32, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("cpl_local_mode_enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)searchIndexSpotlightProgressFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("spotlightProgress.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchIndexMetadataStoreFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("searchMetadata.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)searchIndexDirectory
{
  return objc_msgSend(a1, "photoDirectoryWithType:", 3);
}

- (id)searchIndexDatabaseFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("psi.sqlite"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)isSystemPhotoLibraryPathManager
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "libraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleForLibraryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "isSystemPhotoLibrary");
  }
  else
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "libraryURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v7;
      v13 = 2114;
      v14 = objc_opt_class();
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "PLPhotoLibraryBundle is not available for %@. Falling back to %{public}@ isSystemPhotoLibraryURL:", (uint8_t *)&v11, 0x16u);

    }
    v8 = (void *)objc_opt_class();
    objc_msgSend(a1, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "isSystemPhotoLibraryURL:", v9);

  }
  return v5;
}

- (uint64_t)isAppLibraryPathManager
{
  void *v1;
  uint64_t v2;

  +[PLCPLSettings settingsWithPathManager:](PLCPLSettings, "settingsWithPathManager:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isAppLibrary");

  return v2;
}

- (uint64_t)isCPLSyncablePhotoLibraryPathManager
{
  if ((objc_msgSend(a1, "isSystemPhotoLibraryPathManager") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isAppLibraryPathManager");
}

- (id)_dcimAssetPathForResourceDirectoryPathType:()conveniences directory:filename:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(a1, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v8, 31, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_7;
  v13 = 0;
  if (objc_msgSend(v11, "length") && v12)
  {
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(a1, "photoDirectoryWithType:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;
        objc_msgSend(v14, "stringByAppendingPathComponent:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "stringByAppendingPathComponent:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
LABEL_7:
    v13 = 0;
  }
LABEL_8:

  objc_autoreleasePoolPop(v10);
  return v13;
}

- (uint64_t)assetPathForMutationsDirectoryWithDirectory:()conveniences filename:
{
  return objc_msgSend(a1, "_dcimAssetPathForResourceDirectoryPathType:directory:filename:", 9, a3, a4);
}

- (uint64_t)assetPathForComputeDirectoryWithDirectory:()conveniences filename:
{
  return objc_msgSend(a1, "_dcimAssetPathForResourceDirectoryPathType:directory:filename:", 18, a3, a4);
}

- (id)URLForMetadataWithExtension:()conveniences forMediaInMainDirectory:withFilename:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x19AEC1554]();
  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "photoDirectoryWithType:", 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v9, 31, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v15, 1);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  if (v10)
  {
    objc_msgSend(v10, "stringByDeletingPathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v18, "URLByAppendingPathExtension:", v8);
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v19;
    }

    v14 = v18;
  }
  objc_autoreleasePoolPop(v11);

  return v14;
}

- (id)photoStreamsDataDirectory
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "baseDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", *MEMORY[0x1E0D74480]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchIndexSystemInfoFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("searchSystemInfo.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchIndexProgressFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("searchProgress.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchIndexZeroKeywordStoreFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("zeroKeywords.data"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchIndexGraphDataProgressFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("graphDataProgress.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchIndexSynonymsFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("synonyms.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)spotlightSearchIndexPath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Spotlight"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchIndexStatusFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("searchIndexStatus.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchRecentSearchesFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("recentSearches.bplist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)searchInitialSearchSuggestionsFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "searchIndexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("initialSuggestions.bplist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)deletedMemoryUUIDsFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photoDirectoryWithType:", 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("deleted_memory_uuids.plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)cplDataDirectoryCreateIfNeeded:()conveniences
{
  return objc_msgSend(a1, "photoDirectoryWithType:leafType:createIfNeeded:error:", 13, 3, a3, 0);
}

- (id)enableICloudPhotosFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "cplDataDirectoryCreateIfNeeded:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("enableICloudPhotos"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pauseICloudPhotosFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "cplDataDirectoryCreateIfNeeded:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("pauseICloudPhotos"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)disableICloudPhotosFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 34, 1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("disableICloudPhotos"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)forceSoftResetSyncPath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 32, 1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("forceSoftResetSync"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wipeCPLOnOpenPath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 34, 1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("wipeCPLOnOpen"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)cplEnableMarkerFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 32, 1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("cpl_enabled_marker"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)cplDownloadFinishedMarkerFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 32, 1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("cpl_download_finished_marker"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)cplLocalModeEnabledMarkerFilePathForWriting
{
  return objc_msgSend(a1, "_cplLocalModeEnabledMarkerFilePathCreateIfNeeded:", 1);
}

- (id)cplInitialSyncMarkerFilePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photoDirectoryWithType:leafType:createIfNeeded:error:", 13, 3, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("initialsync_marker"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)cplInitialSyncMarkerFileExists
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cplInitialSyncMarkerFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  return v4;
}

- (uint64_t)removeCPLDataDirectory
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  NSObject *v8;
  char v9;
  id v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  char v16;
  id v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "cplDataDirectoryCreateIfNeeded:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByDeletingPathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-aside"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v1;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Removing CPL directory: %@", buf, 0xCu);
    }

  }
  v23 = 0;
  v9 = objc_msgSend(v6, "removeItemAtPath:error:", v5, &v23);
  v10 = v23;
  if ((v9 & 1) != 0)
  {
    if (*v7)
      goto LABEL_15;
    __CPLAssetsdOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v12 = "Existing CPL aside directory removed";
    v13 = v11;
    v14 = OS_LOG_TYPE_DEFAULT;
    v15 = 2;
    goto LABEL_13;
  }
  if ((PLIsErrorFileNotFound() & 1) == 0 && !*v7)
  {
    __CPLAssetsdOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412290;
    v25 = v10;
    v12 = "Failed to remove existing aside CPL directory: %@";
    v13 = v11;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 12;
LABEL_13:
    _os_log_impl(&dword_199541000, v13, v14, v12, buf, v15);
    goto LABEL_14;
  }
LABEL_15:
  v22 = v10;
  v16 = objc_msgSend(v6, "removeItemAtPath:error:", v1, &v22);
  v17 = v22;

  if ((v16 & 1) != 0)
  {
    if (!*v7)
    {
      __CPLAssetsdOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v19 = "CPL directory removed";
LABEL_23:
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
LABEL_31:
    v20 = 1;
    goto LABEL_30;
  }
  if ((PLIsErrorFileNotFound() & 1) == 0)
  {
    if (*v7)
    {
      v20 = 0;
      goto LABEL_30;
    }
    __CPLAssetsdOSLogDomain();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to remove CPL directory: %@", buf, 0xCu);
    }
    v20 = 0;
    goto LABEL_29;
  }
  if (*v7)
    goto LABEL_31;
  __CPLAssetsdOSLogDomain();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v19 = "CPL directory does not exist";
    goto LABEL_23;
  }
LABEL_24:
  v20 = 1;
LABEL_29:

LABEL_30:
  return v20;
}

- (id)cloudServiceEnableLogFileURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "photoDirectoryWithType:createIfNeeded:error:", 5, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("cloudServiceEnableLog.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fileURLWithPath:isDirectory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)directoryPathForInFlightComments:()conveniences
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("INFLIGHTCOMMENTS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v6 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v15, *MEMORY[0x1E0C99968], 0);
    v7 = v15;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v14);
      v10 = v14;

      if ((v9 & 1) == 0)
      {
        PLPhotoSharingGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v17 = v12;
          v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\": %@", buf, 0x16u);

        }
        v4 = 0;
      }

    }
  }
  return v4;
}

- (uint64_t)cloudSharingArchiveDirectory
{
  return objc_msgSend(a1, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("INFLIGHT_JOBS"));
}

- (id)URLForPartialVideoWithResourceFingerprint:()conveniences assetUUID:timeRange:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v10;
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = *a5;
  v13 = a5[3];
  v14 = *((unsigned int *)a5 + 2);
  v15 = *((unsigned int *)a5 + 8);
  objc_msgSend((id)*MEMORY[0x1E0CEC558], "preferredFilenameExtension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%lld_%d-%lld_%d.%@"), v8, v12, v14, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "URLForPartialVideoDirectoryWithAssetUUID:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "URLByAppendingPathComponent:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)URLForPartialVideoDirectoryWithAssetUUID:()conveniences
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = a3;
  objc_msgSend(a1, "photoDirectoryWithType:", 19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "substringToIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (uint64_t)removePartialVideoDirectory
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "photoDirectoryWithType:", 19);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  objc_msgSend(v1, "fileURLWithPath:isDirectory:", v2, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v10);
  v7 = v10;
  if ((v6 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Failed to remove partial video directory: %@", buf, 0xCu);
      }

    }
    v3 = 0;
  }

  return v3;
}

- (uint64_t)removeComputeDirectory
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  id v4;
  char v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photoDirectoryWithType:", 18);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = -[NSObject removeItemAtPath:error:](v2, "removeItemAtPath:error:", v1, &v7);
  v4 = v7;
  if ((v3 & 1) != 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  v5 = PLIsErrorFileNotFound();

  if ((v5 & 1) == 0)
  {
    PLBackendGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Failed to remove compute directory: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  v3 = 1;
LABEL_7:

  return v3;
}

- (id)assetCreationHoldingDirectory
{
  void *v1;
  id v2;
  NSObject *v3;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  objc_msgSend(a1, "externalDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", 2, 1, 0, 1, &v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v5;
  if (v2 && (objc_msgSend(MEMORY[0x1E0D73208], "isFileExistsError:", v2) & 1) == 0)
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v2;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Unable to create external directory for asset creation: %@", buf, 0xCu);
    }

  }
  return v1;
}

- (id)assetCreationHoldingDirectoryForAssetUUID:()conveniences
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "assetCreationHoldingDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cleanupOutboundSharingFilesWithExpiryInterval:()conveniences
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  char v25;
  id v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  int *v30;
  char *v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  const char *v36;
  uint32_t v37;
  int *v38;
  char *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0C999D0];
  v55[0] = *MEMORY[0x1E0C998C0];
  v55[1] = v4;
  v42 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "privateDirectoryWithSubType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(a1, "isDCIM"))
    goto LABEL_4;
  objc_msgSend(a1, "libraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("PhotoData/OutgoingTemp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", v9) & 1) != 0)
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, v5, 12, &__block_literal_global_76964);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v13 = v12;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (!v14)
    {
      v9 = v13;
      goto LABEL_37;
    }
    v15 = v14;
    v40 = v6;
    v41 = v5;
    v16 = *(_QWORD *)v47;
    v17 = v13;
    while (1)
    {
      v18 = 0;
      v43 = v15;
      do
      {
        if (*(_QWORD *)v47 != v16)
          objc_enumerationMutation(v17);
        v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v19, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(a1, "_shouldRemoveOutboundResourceAtURL:withExpiryInterval:", v19, a2) & 1) != 0)
        {
          v22 = v16;
          v23 = a1;
          v24 = v17;
          v44 = 0;
          v45 = 0;
          v25 = objc_msgSend(v19, "getResourceValue:forKey:error:", &v45, v42, &v44);
          v26 = v45;
          v27 = v44;
          if ((v25 & 1) == 0)
          {
            PLBackendGetLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v51 = v21;
              v52 = 2112;
              v53 = v27;
              _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "cleanupOutboundSharingFilesWithExpiryTimeout: Cannot check if file URL is a directory, skipping: %{public}@, error: %@", buf, 0x16u);
            }
            v17 = v24;
            a1 = v23;
            v16 = v22;
            v15 = v43;
LABEL_29:

LABEL_30:
            goto LABEL_31;
          }
          if (objc_msgSend(v26, "BOOLValue"))
          {
            v17 = v24;
            v28 = -[NSObject isEnumeratingDirectoryPostOrder](v24, "isEnumeratingDirectoryPostOrder");
            a1 = v23;
            v16 = v22;
            v15 = v43;
            if (v28
              && rmdir((const char *)objc_msgSend(objc_retainAutorelease(v19), "fileSystemRepresentation")) == -1
              && *__error() != 66)
            {
              PLBackendGetLog();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                v30 = __error();
                v31 = strerror(*v30);
                *(_DWORD *)buf = 138543618;
                v51 = v21;
                v52 = 2080;
                v53 = v31;
                _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "cleanupOutboundSharingFilesWithExpiryTimeout: could not remove directory: %{public}@, error: %s", buf, 0x16u);
              }
              goto LABEL_29;
            }
            goto LABEL_30;
          }
          v32 = unlink((const char *)objc_msgSend(objc_retainAutorelease(v19), "fileSystemRepresentation"));
          PLBackendGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          v29 = v33;
          if (v32 == -1)
          {
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v38 = __error();
              v39 = strerror(*v38);
              *(_DWORD *)buf = 138543618;
              v51 = v21;
              v52 = 2080;
              v53 = v39;
              v34 = v29;
              v35 = OS_LOG_TYPE_ERROR;
              v36 = "cleanupOutboundSharingFilesWithExpiryTimeout: Unable to delete expired outbound file '%{public}@' error: %s";
              v37 = 22;
LABEL_27:
              _os_log_impl(&dword_199541000, v34, v35, v36, buf, v37);
            }
          }
          else if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v51 = v21;
            v34 = v29;
            v35 = OS_LOG_TYPE_INFO;
            v36 = "cleanupOutboundSharingFilesWithExpiryTimeout: Successfully deleted expired outbound file '%{public}@'";
            v37 = 12;
            goto LABEL_27;
          }
          v17 = v24;
          a1 = v23;
          v16 = v22;
          v15 = v43;
          goto LABEL_29;
        }
        PLBackendGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v21;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_INFO, "cleanupOutboundSharingFilesWithExpiryTimeout: Skip deleting non-expired file: %{public}@", buf, 0xCu);
        }
LABEL_31:

        objc_autoreleasePoolPop(v20);
        ++v18;
      }
      while (v15 != v18);
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (!v15)
      {
        v9 = v17;
        v13 = v17;
        v6 = v40;
        v5 = v41;
        goto LABEL_37;
      }
    }
  }
  PLBackendGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v6;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "cleanupOutboundSharingFilesWithExpiryTimeout: unexpected outbound sharing path: %@", buf, 0xCu);
  }
LABEL_37:

}

- (BOOL)_shouldRemoveOutboundResourceAtURL:()conveniences withExpiryInterval:
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  _BOOL8 v12;
  void *v13;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v16 = 0;
  v6 = *MEMORY[0x1E0C998C0];
  v15 = 0;
  v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v16, v6, &v15);
  v8 = v16;
  v9 = v15;
  if (v7)
  {
    objc_msgSend(v8, "dateByAddingTimeInterval:", a1);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceNow](v10, "timeIntervalSinceNow");
    v12 = v11 <= 0.0;
  }
  else
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "cleanupOutboundSharingFilesWithExpiryTimeout: Cannot get the creation date on outgoing resource file %{public}@. Marking for deletion anyway, error: %@", buf, 0x16u);

    }
    v12 = 1;
  }

  return v12;
}

- (id)temporaryRenderContentURLForInternalRendersWithExtension:()conveniences
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "temporaryRenderContentURLForInternalRendersWithExtension:appropriateForURL:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)temporaryRenderContentURLForInternalRendersWithExtension:()conveniences appropriateForURL:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithFilenameExtension:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!+[PLManagedAsset isPrimaryImageFormatForUTI:](PLManagedAsset, "isPrimaryImageFormatForUTI:", v8))
  {
    v9 = objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC5B0]);

    if ((v9 & 1) != 0)
      goto LABEL_6;
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v5;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Unexpected non-primary filename extension %{public}@ for render content URL", buf, 0xCu);
    }
  }

LABEL_6:
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v10, 1);
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("render.%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathExtension:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject URLByAppendingPathComponent:](v11, "URLByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "error finding temporary directory for %@", buf, 0xCu);
    }
    v16 = 0;
  }

  return v16;
}

+ (uint64_t)defaultDeferredRenderFileFormatTypeIdentifier
{
  return objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
}

+ (uint64_t)defaultDeferredRenderFileFormatTypeIdentifierForHDR
{
  return objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
}

@end
