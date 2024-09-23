@implementation PLDiskSpaceManagement

+ (unint64_t)performCloudSharingSpaceManagementWithBytesToPurge:(unint64_t)a3 shouldFreeSpace:(BOOL)a4 shouldKeepRecentlyViewedAssets:(BOOL)a5 fromPhotoLibrary:(id)a6
{
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  id v20;
  unint64_t v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v7 = a4;
  v10 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v11 = objc_msgSend(a1, "_scanFilesInPhotoLibrary:fromReimportPhotoCloudSharingDataDirectoryShouldFreeSpace:bytesToPurge:", v10, v7, a3);
  v12 = v25[3] + v11;
  v25[3] = v12;
  if (!v7 || a3 > v12)
  {
    v13 = objc_msgSend(a1, "_scanFilesInPhotoLibrary:fromCloudSharingCacheDataDirectoryShouldFreeSpace:bytesToPurge:", v10, v7, a3 - v12);
    v12 = v25[3] + v13;
    v25[3] = v12;
    if (!v7 || v12 < a3)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __140__PLDiskSpaceManagement_performCloudSharingSpaceManagementWithBytesToPurge_shouldFreeSpace_shouldKeepRecentlyViewedAssets_fromPhotoLibrary___block_invoke;
      v17[3] = &unk_1E3660118;
      v20 = a1;
      v14 = v10;
      v22 = v7;
      v23 = a5;
      v21 = a3;
      v18 = v14;
      v19 = &v24;
      v15 = (void *)MEMORY[0x19AEC174C](v17);
      if (v7)
        objc_msgSend(v14, "performTransactionAndWait:", v15);
      else
        objc_msgSend(v14, "performBlockAndWait:", v15);
      v12 = v25[3];

    }
  }
  _Block_object_dispose(&v24, 8);

  return v12;
}

+ (void)_processPurgeWithPhotoLibrary:(id)a3 shouldFreeSpace:(BOOL)a4 shouldKeepRecentlyViewedAssets:(BOOL)a5 bytesToPurge:(unint64_t)a6 bytesProcessed:(unint64_t *)a7
{
  _BOOL8 v9;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v27 = a5;
  v9 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  objc_msgSend(v11, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset persistedRecentlyUsedGUIDSWithPathManager:](PLManagedAsset, "persistedRecentlyUsedGUIDSWithPathManager:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PLPhotoSharingGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = objc_msgSend(v13, "count");
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "recentlyUsedGUIDS contains %lu entries", buf, 0xCu);
  }

  +[PLManagedAsset fetchRequestForSortedCloudSharedAssetsWithPlaceholderKinds:additionalPredicate:ascending:](PLManagedAsset, "fetchRequestForSortedCloudSharedAssetsWithPlaceholderKinds:additionalPredicate:ascending:", &unk_1E3763110, 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(a1, "_purgeAssetsFromFetchRequest:photoLibrary:recentlyUsedGUIDS:recentlyUsedAssetObjectIDs:shouldFreeSpace:bytesToPurge:", v15, v11, v13, v16, v9, a6);
  v18 = v17;
  if (v17 < a6)
  {
    +[PLManagedAsset fetchRequestForSortedCloudSharedAssetsWithPlaceholderKinds:additionalPredicate:ascending:](PLManagedAsset, "fetchRequestForSortedCloudSharedAssetsWithPlaceholderKinds:additionalPredicate:ascending:", &unk_1E3763128, 0, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(a1, "_purgeAssetsFromFetchRequest:photoLibrary:recentlyUsedGUIDS:recentlyUsedAssetObjectIDs:shouldFreeSpace:bytesToPurge:")+ v18;
    if (v19 < a6)
    {
      if (!v27 && objc_msgSend(v16, "count"))
      {
        v24 = (void *)MEMORY[0x1E0C97B48];
        +[PLManagedAsset entityName](PLManagedAsset, "entityName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fetchRequestWithEntityName:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPredicate:", v21);

        objc_msgSend(v25, "setFetchBatchSize:", 100);
        v19 += objc_msgSend(a1, "_purgeAssetsFromFetchRequest:photoLibrary:recentlyUsedGUIDS:recentlyUsedAssetObjectIDs:shouldFreeSpace:bytesToPurge:", v25, v11, 0, 0, v9, a6);
        if (v19 >= a6)
        {
          if (a7)
            *a7 = v19;

          v23 = (void *)v26;
          goto LABEL_17;
        }

      }
      if (a6 > v19 || !v9)
      {
        if (v27)
          v22 = v13;
        else
          v22 = 0;
        v19 += objc_msgSend(a1, "_scanFilesInPhotoLibrary:fromPhotoMetadataDirectoryShouldFreeSpace:bytesToPurge:skipAssets:", v11, v9, a6 - v19, v22);
      }
    }
    v23 = (void *)v26;
    if (a7)
      *a7 = v19;
LABEL_17:

    goto LABEL_20;
  }
  if (a7)
    *a7 = v17;
LABEL_20:

}

+ (unint64_t)_purgeAssetsFromFetchRequest:(id)a3 photoLibrary:(id)a4 recentlyUsedGUIDS:(id)a5 recentlyUsedAssetObjectIDs:(id)a6 shouldFreeSpace:(BOOL)a7 bytesToPurge:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  int AppBooleanValue;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  PLEnumerateAndSaveController *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  PLEnumerateAndSaveController *v31;
  id v32;
  NSObject *v33;
  unint64_t v34;
  void *v36;
  BOOL v37;
  BOOL v38;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  id v45;
  unint64_t v46;
  BOOL v47;
  BOOL v48;
  _QWORD v49[4];
  id v50;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint8_t buf[4];
  id v57;
  _QWORD v58[8];

  v58[6] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PSSpaceManagementDebuggingEnabled"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  v58[0] = CFSTR("additionalAttributes");
  v58[1] = CFSTR("modernResources");
  v58[2] = CFSTR("cloudFeedAssetsEntry");
  v58[3] = CFSTR("extendedAttributes");
  v58[4] = CFSTR("mediaAnalysisAttributes");
  v58[5] = CFSTR("photoAnalysisAttributes");
  v18 = AppBooleanValue != 0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRelationshipKeyPathsForPrefetching:", v19);

  v37 = v18;
  v38 = a7;
  v20 = v16;
  objc_msgSend(v14, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = a8;
  v23 = [PLEnumerateAndSaveController alloc];
  NSStringFromClass((Class)a1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pathManager");
  v25 = objc_claimAutoreleasedReturnValue();
  v36 = v14;
  v26 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __141__PLDiskSpaceManagement__purgeAssetsFromFetchRequest_photoLibrary_recentlyUsedGUIDS_recentlyUsedAssetObjectIDs_shouldFreeSpace_bytesToPurge___block_invoke;
  v49[3] = &unk_1E36700D0;
  v27 = v21;
  v50 = v27;
  v41[0] = v26;
  v28 = v13;
  v41[1] = 3221225472;
  v41[2] = __141__PLDiskSpaceManagement__purgeAssetsFromFetchRequest_photoLibrary_recentlyUsedGUIDS_recentlyUsedAssetObjectIDs_shouldFreeSpace_bytesToPurge___block_invoke_2;
  v41[3] = &unk_1E3660140;
  v29 = v15;
  v42 = v29;
  v30 = v20;
  v47 = v38;
  v43 = v30;
  v44 = &v52;
  v48 = v37;
  v45 = a1;
  v46 = v22;
  v31 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v23, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v24, v28, v27, v25, 0, 1, v49, 0, v41);

  v40 = 0;
  LOBYTE(v25) = -[PLEnumerateAndSaveController processObjectsWithError:](v31, "processObjectsWithError:", &v40);
  v32 = v40;
  if ((v25 & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v32;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "PLDiskSpaceManagement: Failed to process purge request. Error: %@", buf, 0xCu);
    }

  }
  v34 = v53[3];

  _Block_object_dispose(&v52, 8);
  return v34;
}

+ (unint64_t)_scanFilesInPhotoLibrary:(id)a3 fromReimportPhotoCloudSharingDataDirectoryShouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v6 = a4;
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "privateCacheDirectoryWithSubType:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:isDirectory:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(a1, "_scanAndDeleteCacheFilesInDirectory:shouldFreeSpace:bytesToPurge:", v11, v6, a5);
  return v12;
}

+ (unint64_t)_scanFilesInPhotoLibrary:(id)a3 fromCloudSharingCacheDataDirectoryShouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v6 = a4;
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoDirectoryWithType:createIfNeeded:error:", 24, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:isDirectory:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(a1, "_scanAndDeleteCacheFilesInDirectory:shouldFreeSpace:bytesToPurge:", v11, v6, a5);
  return v12;
}

+ (unint64_t)_scanFilesInPhotoLibrary:(id)a3 fromPhotoMetadataDirectoryShouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5 skipAssets:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  int v25;
  void *v26;
  NSObject *v27;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  unint64_t v46;
  void *v47;
  id v48;
  void *v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t buf[16];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _QWORD v61[5];

  v45 = a4;
  v61[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v48 = a6;
  v9 = (void *)MEMORY[0x1E0C99E98];
  v44 = v8;
  objc_msgSend(v8, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoDirectoryWithType:", 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:isDirectory:", v11, 1);
  v12 = objc_claimAutoreleasedReturnValue();

  v53 = *MEMORY[0x1E0C99A18];
  v13 = *MEMORY[0x1E0C99A18];
  v54 = *MEMORY[0x1E0C99A90];
  v61[0] = *MEMORY[0x1E0C99A90];
  v61[1] = v13;
  v42 = *MEMORY[0x1E0C99998];
  v61[2] = *MEMORY[0x1E0C99998];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v12;
  v49 = (void *)v14;
  objc_msgSend(v47, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v14, 0, &__block_literal_global_1450);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (!v52)
  {
    v46 = 0;
    v15 = (void *)v14;
    goto LABEL_35;
  }
  v40 = a5;
  v46 = 0;
  v51 = *(_QWORD *)v57;
  v15 = (void *)v14;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v57 != v51)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(v17, "resourceValuesForKeys:error:", v15, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v54);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByDeletingPathExtension");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v53);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");
      if (v20)
        v24 = v23 == 0;
      else
        v24 = 1;
      if (!v24)
      {
        objc_msgSend(v20, "pathExtension");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset extensionForLargeThumbnailFile](PLManagedAsset, "extensionForLargeThumbnailFile");
        v27 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isEqualToString:", v27))
        {
          v29 = objc_msgSend(v48, "containsObject:", v21);

          if ((v29 & 1) != 0)
          {
            v25 = 1;
            v15 = v49;
            goto LABEL_26;
          }
          +[PLManagedAsset extensionForMediumThumbnailFile](PLManagedAsset, "extensionForMediumThumbnailFile");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringByAppendingPathExtension:", v30);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "path");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringByDeletingLastPathComponent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "stringByAppendingPathComponent:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v47, "fileExistsAtPath:", v26))
          {
LABEL_20:
            v25 = 1;
            goto LABEL_24;
          }
          if (v45)
          {
            objc_msgSend(v17, "path");
            v27 = objc_claimAutoreleasedReturnValue();
            v25 = 1;
            +[PLPhotoLibrary fileReservationForFileAtPath:exclusive:](PLPhotoLibrary, "fileReservationForFileAtPath:exclusive:", v27, 1);
            v33 = objc_claimAutoreleasedReturnValue();
            if (v33)
            {
              v41 = (void *)v33;
              objc_msgSend(v17, "path");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v47, "removeItemAtPath:error:", v34, 0);

              if (!v35)
                goto LABEL_20;
              objc_msgSend(v19, "objectForKeyedSubscript:", v42);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "unsignedLongLongValue") + v46;

              v46 = v37;
              if (v37 < v40)
                goto LABEL_20;
              PLPhotoSharingGetLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "enough bytes have been freed, finishing", buf, 2u);
              }
              v25 = 0;
            }
LABEL_23:

LABEL_24:
            v15 = v49;
            goto LABEL_25;
          }
          objc_msgSend(v19, "objectForKeyedSubscript:", v42);
          v27 = objc_claimAutoreleasedReturnValue();
          v46 += -[NSObject unsignedLongLongValue](v27, "unsignedLongLongValue");
        }
        v25 = 1;
        goto LABEL_23;
      }
      v25 = 1;
LABEL_25:

LABEL_26:
      objc_autoreleasePoolPop(v18);
      if (!v25)
        goto LABEL_35;
      ++v16;
    }
    while (v52 != v16);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    v52 = v38;
  }
  while (v38);
LABEL_35:

  return v46;
}

+ (unint64_t)_scanAndDeleteCacheFilesInDirectory:(id)a3 shouldFreeSpace:(BOOL)a4 bytesToPurge:(unint64_t)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v30;
  void *v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  unint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  _QWORD v47[5];

  v33 = a4;
  v47[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0C99A90];
  v7 = *MEMORY[0x1E0C99A18];
  v47[0] = *MEMORY[0x1E0C99A90];
  v47[1] = v7;
  v34 = *MEMORY[0x1E0C99998];
  v47[2] = *MEMORY[0x1E0C99998];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v5;
  objc_msgSend(v32, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v8, 0, &__block_literal_global_54);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (!v9)
  {
    v38 = 0;
    goto LABEL_30;
  }
  v10 = v9;
  v38 = 0;
  v39 = *(_QWORD *)v41;
  v35 = *MEMORY[0x1E0D74310];
  while (2)
  {
    v11 = 0;
    v36 = v10;
    do
    {
      if (*(_QWORD *)v41 != v39)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(v12, "resourceValuesForKeys:error:", v8, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "BOOLValue"))
        v17 = v15 == 0;
      else
        v17 = 1;
      if (v17)
        goto LABEL_11;
      v18 = v7;
      v19 = v6;
      v20 = v8;
      v21 = objc_msgSend(v15, "isEqualToString:", v35);

      if ((v21 & 1) != 0
        || (objc_msgSend(v14, "objectForKeyedSubscript:", v34),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v38 += objc_msgSend(v22, "unsignedLongLongValue"),
            v22,
            !v33))
      {
        v8 = v20;
      }
      else
      {
        objc_msgSend(v12, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v32, "removeItemAtPath:error:", v23, 0);

        if (!v24)
        {
          PLPhotoSharingGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          v8 = v20;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v12;
            _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "failed to remove %@", buf, 0xCu);
          }

          objc_msgSend(v14, "objectForKeyedSubscript:", v34);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v38 -= objc_msgSend(v16, "unsignedLongLongValue");
          v6 = v19;
          v7 = v18;
          v10 = v36;
LABEL_11:

          goto LABEL_19;
        }
        v8 = v20;
        if (v38 >= a5)
        {
          PLPhotoSharingGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "enough bytes have been freed, finishing", buf, 2u);
          }

          objc_autoreleasePoolPop(v13);
          goto LABEL_30;
        }
      }
      v6 = v19;
      v7 = v18;
      v10 = v36;
LABEL_19:

      objc_autoreleasePoolPop(v13);
      ++v11;
    }
    while (v10 != v11);
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    v10 = v26;
    if (v26)
      continue;
    break;
  }
LABEL_30:

  return v38;
}

+ (int64_t)_processCloudSharedAsset:(id)a3 shouldFreeSpace:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  int v15;
  BOOL v16;
  int v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  int64_t v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  int64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  int v35;
  void *context;
  void *v38;
  void *v39;
  _BOOL4 v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  id v50;
  unsigned __int8 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  NSObject *v60;
  _BYTE v61[128];
  uint64_t v62;

  v40 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isCloudSharedAsset"))
  {
    context = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v38 = v4;
    objc_msgSend(v4, "allFileURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v53;
      v43 = *MEMORY[0x1E0C99998];
      v42 = *(_QWORD *)v53;
      v39 = v6;
      while (1)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v53 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          v51 = 0;
          objc_msgSend(v12, "path");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v13, &v51);
          v15 = v51;

          if (v14)
            v16 = v15 == 0;
          else
            v16 = 0;
          if (v16)
          {
            v49 = 0;
            v50 = 0;
            v17 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v50, v43, &v49);
            v18 = v50;
            v19 = v49;
            if (v17)
              v20 = v18 == 0;
            else
              v20 = 1;
            if (v20)
            {
              PLPhotoSharingGetLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v58 = v12;
                v59 = 2112;
                v60 = v19;
                _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "couldn't get file size for %@. Error: %@", buf, 0x16u);
              }
LABEL_32:

              v10 = v42;
            }
            else
            {
              v22 = v9;
              v9 += objc_msgSend(v18, "unsignedLongLongValue");
              if (v40)
              {
                objc_msgSend(v12, "path");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                +[PLPhotoLibrary fileReservationForFileAtPath:exclusive:](PLPhotoLibrary, "fileReservationForFileAtPath:exclusive:", v23, 1);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24)
                {
                  objc_msgSend(v38, "setCloudPlaceholderKind:", 3);
                  v48 = 0;
                  v25 = objc_msgSend(v5, "removeItemAtURL:error:", v12, &v48);
                  v21 = v48;
                  if (v25)
                  {
                    objc_msgSend(v41, "addObject:", v12);
                    PLPhotoSharingGetLog();
                    v26 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v58 = v12;
                      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "deleted derivative file at %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    PLPhotoSharingGetLog();
                    v26 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v58 = v12;
                      v59 = 2112;
                      v60 = v21;
                      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "couldn't delete file at %@. Error: %@", buf, 0x16u);
                    }
                    v9 = v22;
                  }
                  v6 = v39;

                }
                else
                {
                  PLPhotoSharingGetLog();
                  v21 = objc_claimAutoreleasedReturnValue();
                  v9 = v22;
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v58 = v12;
                    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "file reservation not permitted for %@", buf, 0xCu);
                  }
                  v6 = v39;
                }
                goto LABEL_32;
              }
              v6 = v39;
            }

            continue;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (!v8)
          goto LABEL_39;
      }
    }
    v9 = 0;
LABEL_39:

    v4 = v38;
    if (v40 && objc_msgSend(v41, "count"))
    {
      v27 = v9;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v38, "modernResources");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v45 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
            objc_msgSend(v33, "fileURL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v41, "containsObject:", v34);

            if (v35)
              objc_msgSend(v33, "markAsNotLocallyAvailable");
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
        }
        while (v30);
      }

      v9 = v27;
    }

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __90__PLDiskSpaceManagement__scanAndDeleteCacheFilesInDirectory_shouldFreeSpace_bytesToPurge___block_invoke()
{
  return 1;
}

uint64_t __116__PLDiskSpaceManagement__scanFilesInPhotoLibrary_fromPhotoMetadataDirectoryShouldFreeSpace_bytesToPurge_skipAssets___block_invoke()
{
  return 1;
}

id __141__PLDiskSpaceManagement__purgeAssetsFromFetchRequest_photoLibrary_recentlyUsedGUIDS_recentlyUsedAssetObjectIDs_shouldFreeSpace_bytesToPurge___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __141__PLDiskSpaceManagement__purgeAssetsFromFetchRequest_photoLibrary_recentlyUsedGUIDS_recentlyUsedAssetObjectIDs_shouldFreeSpace_bytesToPurge___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "cloudAssetGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v7)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v6, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 56), "_processCloudSharedAsset:shouldFreeSpace:", v6, *(unsigned __int8 *)(a1 + 72));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v11;
    if (*(_BYTE *)(a1 + 73))
    {
      v12 = v11;
      objc_msgSend(v6, "cloudShareAlbum");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoSharingGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cloudBatchPublishDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dateCreated");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "pathForOriginalFile");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v21 = 138413570;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        v27 = 2112;
        v28 = v18;
        v29 = 2048;
        v30 = v12;
        v31 = 2048;
        v32 = v19;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "%@ asset %@ %@ %@ size %lu total %lld", (uint8_t *)&v21, 0x3Eu);

      }
    }
    if (*(_BYTE *)(a1 + 72) && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 64))
    {
      PLPhotoSharingGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "enough bytes have been freed, finishing", (uint8_t *)&v21, 2u);
      }

      *a4 = 1;
    }
  }

}

uint64_t __140__PLDiskSpaceManagement_performCloudSharingSpaceManagementWithBytesToPurge_shouldFreeSpace_shouldKeepRecentlyViewedAssets_fromPhotoLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_processPurgeWithPhotoLibrary:shouldFreeSpace:shouldKeepRecentlyViewedAssets:bytesToPurge:bytesProcessed:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

@end
