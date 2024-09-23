@implementation PLResetSyncStatusWithLibraryImpl

uint64_t __PLResetSyncStatusWithLibraryImpl_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  PLEnumerateAndSaveController *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  PLEnumerateAndSaveController *v30;
  char v31;
  id v32;
  unsigned __int8 *v33;
  int v34;
  char v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD *v49;
  void *v50;
  void *v51;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  id v65;
  __int128 *v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint8_t buf[4];
  id v77;
  __int16 v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _QWORD v85[5];

  v85[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 3)
  {
    if ((unint64_t)(*(_QWORD *)(a1 + 56) - 1) >= 2)
      goto LABEL_36;
LABEL_12:
    v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v85[0] = CFSTR("modernResources");
    v85[1] = CFSTR("additionalAttributes");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addObjectsFromArray:", v9);

    +[PLMemory keyPathsForMemoriesBeingAssets](PLMemory, "keyPathsForMemoriesBeingAssets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addObjectsFromArray:", v10);

    if (*(_QWORD *)(a1 + 48) == 3)
    {
      objc_msgSend(v55, "addObject:", CFSTR("libraryScope"));
      objc_msgSend(v55, "addObject:", CFSTR("master"));
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    v13 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
    v54 = (id)objc_claimAutoreleasedReturnValue();

    +[PLManagedAsset predicateForAssetsToCheckForDeletionOnCPLDisable](PLManagedAsset, "predicateForAssetsToCheckForDeletionOnCPLDisable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setPredicate:", v15);

    objc_msgSend(v54, "setRelationshipKeyPathsForPrefetching:", v55);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 0;
    v17 = MEMORY[0x1E0C809B0];
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_81;
    v68[3] = &unk_1E3667CE0;
    v6 = v16;
    v69 = v6;
    v70 = &v71;
    v18 = (void *)MEMORY[0x19AEC174C](v68);
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "databaseContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&v80 = 0;
    *((_QWORD *)&v80 + 1) = &v80;
    v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__30178;
    v83 = __Block_byref_object_dispose__30179;
    v84 = 0;
    v21 = [PLEnumerateAndSaveController alloc];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v17;
    v63[1] = 3221225472;
    v63[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_3;
    v63[3] = &unk_1E3667D08;
    v66 = &v80;
    v25 = v20;
    v64 = v25;
    v26 = *(id *)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 48);
    v65 = v26;
    v67 = v27;
    v57[0] = v17;
    v57[1] = 3221225472;
    v57[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_4;
    v57[3] = &unk_1E3667ED0;
    v61 = v27;
    v28 = v18;
    v29 = *(_QWORD *)(a1 + 56);
    v60 = v28;
    v62 = v29;
    v53 = v12;
    v58 = v53;
    v59 = *(id *)(a1 + 40);
    v30 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:](v21, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultsBlock:", v22, v54, v23, v24, 0, 1, v63, 0, v57);

    v56 = 0;
    v31 = -[PLEnumerateAndSaveController processObjectsWithError:](v30, "processObjectsWithError:", &v56);
    v32 = v56;
    v33 = (unsigned __int8 *)MEMORY[0x1E0D115D0];
    v34 = *MEMORY[0x1E0D115D0];
    if (*MEMORY[0x1E0D115D0])
      v35 = 1;
    else
      v35 = v31;
    if ((v35 & 1) == 0)
    {
      __CPLAssetsdOSLogDomain();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v77 = v54;
        v78 = 2112;
        v79 = (uint64_t)v32;
        _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "Error processing assets for CPL disable: %@ error: %@", buf, 0x16u);
      }

      v34 = *v33;
    }
    if (!v34)
    {
      __CPLAssetsdOSLogDomain();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)v72[3];
        v39 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 134218240;
        v77 = v38;
        v78 = 2048;
        v79 = v39;
        _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "Deleted %lu assets, %lu memories", buf, 0x16u);
      }

    }
    objc_msgSend(v6, "removeAllObjects");

    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(&v71, 8);
    goto LABEL_27;
  }
  if ((unint64_t)(v2 - 1) >= 2)
    goto LABEL_36;
  if (v2 != 2 || !*(_BYTE *)(a1 + 64))
    goto LABEL_12;
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v55 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudSharedAsset"), 1);
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setPredicate:", v53);
  objc_msgSend(v55, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v55, &v75);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v54 = v75;

  if (!objc_msgSend(v6, "count") || v54)
  {
    if (!v54 || *MEMORY[0x1E0D115D0])
      goto LABEL_11;
    __CPLAssetsdOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v80) = 138412290;
      *(_QWORD *)((char *)&v80 + 4) = v54;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Error on fetch: %@", (uint8_t *)&v80, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (id)-[NSObject enumerateWithIncrementalSaveUsingObjects:withBlock:](v7, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v6, &__block_literal_global_30172);
  }

LABEL_11:
  +[PLGenericAlbum removeAllUserAlbumsAndFoldersInLibrary:](PLGenericAlbum, "removeAllUserAlbumsAndFoldersInLibrary:", *(_QWORD *)(a1 + 32));
  +[PLMemory deleteAllMemoriesInPhotoLibrary:](PLMemory, "deleteAllMemoriesInPhotoLibrary:", *(_QWORD *)(a1 + 32));
LABEL_27:

  v40 = *(_QWORD *)(a1 + 48);
  if (v40 == 3)
  {
    v44 = *(_QWORD *)(a1 + 56);
    v45 = *(void **)(a1 + 32);
    if (v44 <= 2 && ((3u >> (v44 & 7)) & 1) != 0)
    {
      objc_msgSend(v45, "managedObjectContext");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLShare deleteAllSharesInManagedObjectContext:](PLMomentShare, "deleteAllSharesInManagedObjectContext:", v46);

    }
    else
    {
      objc_msgSend(v45, "managedObjectContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLShare deleteAllSharesInManagedObjectContext:](PLShare, "deleteAllSharesInManagedObjectContext:", v47);

    }
  }
  else if (v40 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum removeTrashedAlbumsAndFoldersForCloudResetInManagedObjectContext:](PLGenericAlbum, "removeTrashedAlbumsAndFoldersForCloudResetInManagedObjectContext:", v41);

    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum removeEmptyAlbumsAndFoldersForCloudResetInManagedObjectContext:](PLGenericAlbum, "removeEmptyAlbumsAndFoldersForCloudResetInManagedObjectContext:", v42);

    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLShare deleteAllSharesInManagedObjectContext:](PLShare, "deleteAllSharesInManagedObjectContext:", v43);

    _PLResetPlaceholderKindFlag(*(void **)(a1 + 32));
  }
  if ((unint64_t)(*(_QWORD *)(a1 + 48) - 1) <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudMaster deleteAllCloudMastersInManagedObjectContext:](PLCloudMaster, "deleteAllCloudMastersInManagedObjectContext:", v48);

  }
LABEL_36:
  v49 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLInternalResource resetCloudResourcesStateForCloudInManagedObjectContext:hardReset:](PLInternalResource, "resetCloudResourcesStateForCloudInManagedObjectContext:hardReset:", v50, (unint64_t)(*(_QWORD *)(a1 + 48) - 1) < 2);

  +[PLGenericAlbum resetAlbumStateForCloudInLibrary:](PLGenericAlbum, "resetAlbumStateForCloudInLibrary:", *(_QWORD *)(a1 + 32));
  +[PLManagedAsset resetAssetsCloudStateInLibrary:](PLManagedAsset, "resetAssetsCloudStateInLibrary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudMaster resetCloudMastersStateInManagedObjectContext:](PLCloudMaster, "resetCloudMastersStateInManagedObjectContext:", v51);

  +[PLMemory resetCloudStateInPhotoLibrary:](PLMemory, "resetCloudStateInPhotoLibrary:", *v49);
  +[PLSuggestion resetCloudStateInPhotoLibrary:](PLSuggestion, "resetCloudStateInPhotoLibrary:", *v49);
  +[PLPerson resetCloudStateInPhotoLibrary:](PLPerson, "resetCloudStateInPhotoLibrary:", *v49);
  +[PLFaceCrop resetCloudStateInPhotoLibrary:](PLFaceCrop, "resetCloudStateInPhotoLibrary:", *v49);
  return +[PLDetectedFace resetCloudStateInPhotoLibrary:](PLDetectedFace, "resetCloudStateInPhotoLibrary:", *v49);
}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = a2;
  +[PLMemory memoriesContainingAsset:](PLMemory, "memoriesContainingAsset:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_2_82;
  v8[3] = &unk_1E3667CB8;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(v6, "setLocalOnlyDelete:", 1);
  objc_msgSend(v6, "deleteWithReason:", v5);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

id __PLResetSyncStatusWithLibraryImpl_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "newShortLivedLibraryWithName:", "void PLResetSyncStatusWithLibraryImpl(PLPhotoLibrary *__strong, CPLLibraryManager *__strong, PLResetCloudLibraryMode, PLCPLDeviceLibraryConfiguration, BOOL)_block_invoke_3");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChangeSource:", objc_msgSend(v6, "changeSource"));

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocalOnlyDelete:", objc_msgSend(v7, "isLocalOnlyDelete"));

  objc_msgSend(v5, "setResetCloudLibraryMode:", *(_QWORD *)(a1 + 56));
  return v5;
}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  dispatch_block_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  v7 = v5;
  if (!v6)
  {
LABEL_30:

    goto LABEL_31;
  }
  v8 = v6;
  v45 = 0;
  v9 = *(_QWORD *)v63;
  v46 = v5;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v63 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "checkAllResourcesRequiredForCPLDisableWithReachableBlock:", &__block_literal_global_89_30183);
      v13 = v12;
      v14 = *(_QWORD *)(a1 + 56);
      if ((unint64_t)(v14 - 1) <= 1)
      {
        if ((v12 & 1) != 0)
          continue;
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("[PLResetSyncStatusWithLibrary] Deleting asset without all required resources on disk: %@"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_24;
      }
      if (v14 != 3)
        continue;
      v19 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v11, "libraryScope");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v19 == 1)
      {
        v27 = objc_msgSend(v20, "isEqualToString:", v21);

        if ((v27 & 1) != 0)
        {
LABEL_18:
          v5 = v46;
          continue;
        }
      }
      else
      {
        if (v19 != 2)
        {

          goto LABEL_23;
        }

        if (!v20)
          goto LABEL_18;
      }
      if ((v13 & 1) != 0)
      {
        objc_msgSend(v11, "allRequiredResourcesForCPLDisable");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v18, "count"));
        v24 = MEMORY[0x1E0C809B0];
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_96;
        v60[3] = &unk_1E3667D70;
        v25 = v23;
        v61 = v25;
        objc_msgSend(v18, "enumerateObjectsUsingBlock:", v60);
        v26 = objc_msgSend(v25, "count");
        if (v26 == objc_msgSend(v18, "count"))
        {
          v57[0] = v24;
          v57[1] = 3221225472;
          v57[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_2_98;
          v57[3] = &unk_1E3667D98;
          v58 = v44;
          v59 = v11;
          objc_msgSend(v25, "enumerateObjectsUsingBlock:", v57);
          ++v45;

        }
        v5 = v46;

        goto LABEL_24;
      }
      v28 = *(_QWORD *)(a1 + 64);
      v29 = CFSTR("unknown");
      if (v28 <= 2)
        v29 = off_1E366BE48[v28];
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = v29;
      objc_msgSend(v11, "uuid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("[PLResetSyncStatusWithLibrary] Deleting non-qualifying asset for device-library configuration %@: %@"), v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v33);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_23:
      v5 = v46;
LABEL_24:

    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  }
  while (v8);

  if (*(_QWORD *)(a1 + 40) && v45)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v45);
    v35 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_101_30186);
    v36 = *(void **)(a1 + 40);
    objc_msgSend(v44, "allKeys");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_4_102;
    v53[3] = &unk_1E3667E30;
    v39 = v44;
    v54 = v39;
    v40 = v34;
    v55 = v40;
    v56 = v35;
    v7 = v35;
    objc_msgSend(v36, "checkResourcesAreSafeToPrune:checkServerIfNecessary:completionHandler:", v37, 0, v53);

    dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    v50[0] = v38;
    v50[1] = 3221225472;
    v50[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_7;
    v50[3] = &unk_1E3667E80;
    v41 = *(_QWORD *)(a1 + 64);
    v51 = v40;
    v52 = v41;
    v42 = v40;
    v43 = v39;
    v5 = v46;
    objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v50);
    v47[0] = v38;
    v47[1] = 3221225472;
    v47[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_108;
    v47[3] = &unk_1E3667EA8;
    v49 = *(_QWORD *)(a1 + 64);
    v48 = *(id *)(a1 + 48);
    objc_msgSend(v42, "enumerateObjectsUsingBlock:", v47);

    goto LABEL_30;
  }
LABEL_31:

}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_96(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "cplResourceIncludeFile:createDirectoryIfNeeded:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_2_98(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_4_102(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_5_103;
  v7[3] = &unk_1E3667E08;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v7);
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4, v5, v6);

}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_8;
  v5[3] = &unk_1E3667E58;
  v4 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v6 = v4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v5);

}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_108(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  if (v4 > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E366BE48[v4];
  v7 = v6;
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[PLResetSyncStatusWithLibrary] Deleting non-qualifying asset for device-library configuration %@: %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5 > 2)
        v6 = CFSTR("unknown");
      else
        v6 = off_1E366BE48[v5];
      v7 = v6;
      objc_msgSend(v3, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Not deleting asset not qualifying for configuration %@, not safe to delete some resources: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", v3);

}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_5_103(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PLResetSyncStatusWithLibraryImpl_block_invoke_6;
  v6[3] = &unk_1E3667DE0;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v4);

}

uint64_t __PLResetSyncStatusWithLibraryImpl_block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isLocallyAvailable") & 1) == 0)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", objc_msgSend(v5, "cplType"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v4;
        v11 = 2114;
        v12 = v7;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Resource marked as unavailable but actually on-disk, updating availability: %@ (%{public}@)", (uint8_t *)&v9, 0x16u);

      }
    }
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "markAsLocallyAvailableWithFilePath:", v8);

  }
}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_2_82(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v9, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(v9, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteObject:", v9);

  }
}

void __PLResetSyncStatusWithLibraryImpl_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("[PLResetSyncStatusWithLibrary]Deleting a CPL asset for Apple TV"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteWithReason:", v3);

}

@end
