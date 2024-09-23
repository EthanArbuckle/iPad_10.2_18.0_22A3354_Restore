@implementation PLPairingProcessor

- (PLPairingProcessor)init
{
  PLPairingProcessor *v2;
  uint64_t v3;
  NSPredicate *locatedInUsersPhotoLibrary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLPairingProcessor;
  v2 = -[PLPairingProcessor init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForUserLibrary"), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    locatedInUsersPhotoLibrary = v2->_locatedInUsersPhotoLibrary;
    v2->_locatedInUsersPhotoLibrary = (NSPredicate *)v3;

  }
  return v2;
}

- (BOOL)processPairingForFetchRequest:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v32;
  id *v33;
  id v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if ((!MEMORY[0x19AEC0720]() || (PLIsAssetsd() & 1) == 0) && (PLIsReallyAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPairing.m"), 206, CFSTR("%@: Only do pairing in server"), v28);

    if (v9)
      goto LABEL_5;
LABEL_24:
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0D74498];
    v44 = *MEMORY[0x1E0CB2938];
    v45 = CFSTR("Couldn't make a request for assets with live photo group UUIDs in the library.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 41003, v14);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (!v9)
    goto LABEL_24;
LABEL_5:
  v33 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __68__PLPairingProcessor_processPairingForFetchRequest_inContext_error___block_invoke;
  v41[3] = &unk_1E3677A78;
  v41[4] = self;
  v12 = v11;
  v42 = v12;
  v32 = v10;
  v34 = v9;
  v13 = (id)objc_msgSend(v10, "enumerateObjectsFromFetchRequest:count:batchSize:usingBlock:", v9, &v43, 100, v41);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v35 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v35)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v14, "objectForKeyedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v21, "count") >= 2)
        {
          v22 = v17;
          while (1)
          {
            -[PLPairingProcessor firstGroupFromAssets:](self, "firstGroupFromAssets:", v21);
            v23 = objc_claimAutoreleasedReturnValue();
            if (!v23)
              break;
            v24 = (void *)v23;
            v36 = v22;
            -[PLPairingProcessor combinePair:error:](self, "combinePair:error:", v23, &v36);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v36;

            if (v25)
              -[PLPairingProcessor setDeferredProcessingIfNescessaryForAsset:](self, "setDeferredProcessingIfNescessaryForAsset:", v25);
            objc_msgSend(v24, "allValues");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "removeObjectsInArray:", v26);

            v22 = v17;
            if ((unint64_t)objc_msgSend(v21, "count") <= 1)
              goto LABEL_18;
          }
          v17 = v22;
        }
LABEL_18:

        objc_autoreleasePoolPop(v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  a5 = v33;
  v9 = v34;
  v10 = v32;
LABEL_25:

  if (a5)
    *a5 = objc_retainAutorelease(v17);

  return v17 == 0;
}

- (id)groupIDForAsset:(id)a3
{
  return 0;
}

- (id)fetchRequestForLibrary
{
  return 0;
}

- (id)fetchRequestForSortedGroupIDs:(id)a3
{
  return 0;
}

- (id)firstGroupFromAssets:(id)a3
{
  return 0;
}

- (id)combinePair:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)_copyResourceOfType:(unsigned int)a3 onAsset:(id)a4 toType:(unsigned int)a5 onAsset:(id)a6 error:(id *)a7
{
  uint64_t v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v30;
  void *v31;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  PLPairingProcessor *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[3];
  _QWORD v46[3];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v9 = *(_QWORD *)&a5;
  v51 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v33 = a6;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__52713;
  v43 = __Block_byref_object_dispose__52714;
  v44 = 0;
  _originalResourceOfType(v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "fileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v11, "pathManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isUBF"))
      {
        v30 = objc_alloc(MEMORY[0x1E0D73278]);
        objc_msgSend(v33, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uniformTypeIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fileURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v30, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v31, 0, v17, 0, v9, 0, v19);

        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __71__PLPairingProcessor__copyResourceOfType_onAsset_toType_onAsset_error___block_invoke;
        v35[3] = &unk_1E366BFA0;
        v36 = v14;
        v37 = self;
        v38 = &v39;
        objc_msgSend(v15, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v20, 2, v35);
        v21 = v36;
      }
      else
      {
        _pathForResourceType(v33, v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v21);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          PLBackendGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v14;
            v49 = 2112;
            v50 = v27;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "PLPairing: copying %@ to %@", buf, 0x16u);
          }

          v34 = 0;
          -[PLPairingProcessor _copyFromURL:toURL:error:](self, "_copyFromURL:toURL:error:", v14, v27, &v34);
          v20 = v34;

        }
        else
        {
          v20 = 0;
        }
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2938];
      v46[0] = CFSTR("Couldn't get file URL.");
      v45[0] = v24;
      v45[1] = CFSTR("Resource Object Id");
      objc_msgSend(v13, "objectID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v15;
      v45[2] = CFSTR("Asset UUID");
      objc_msgSend(v11, "uuid");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v46[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, v21);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v40[5];
      v40[5] = v25;

    }
    v22 = v40[5] == 0;

  }
  else
  {
    v22 = 0;
  }
  if (a7)
    *a7 = objc_retainAutorelease((id)v40[5]);

  _Block_object_dispose(&v39, 8);
  return v22;
}

- (BOOL)_copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  NSObject *v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLBackendGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "PLPairing: copying %@ to %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v11 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v7, v8, &v19);
  v12 = v19;

  if (v11)
  {
    v13 = *MEMORY[0x1E0D73F90];
    v18 = 0;
    v14 = objc_msgSend(MEMORY[0x1E0D73208], "stripExtendedAttributesFromFileAtURL:inDomain:error:", v8, v13, &v18);
    v15 = v18;
    if ((v14 & 1) == 0)
    {
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v8;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to strip extended attributes from %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Error trying to copy %@ to %@: %@", buf, 0x20u);
    }
  }

  if (a5)
    *a5 = objc_retainAutorelease(v12);

  return v12 == 0;
}

- (BOOL)updatePrimaryAsset:(id)a3 andRemoveAssetIfPossible:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "hasAdjustments");
  if ((v7 & 1) == 0)
  {
    objc_msgSend(v6, "albums");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v13, "kindValue") == 2)
          {
            objc_msgSend(v13, "mutableAssets");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "indexOfObject:", v6);
            if (v15 != 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v14, "insertObject:atIndex:", v5, v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v10);
    }
    objc_msgSend(v6, "addedDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v18 = v17;
    objc_msgSend(v5, "addedDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    v21 = v18 - v20;

    if (v21 > 0.0)
    {
      objc_msgSend(v6, "importSession");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setImportSession:", v22);

      objc_msgSend(v5, "importSession");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateImportDatesFromAddedAsset:", v5);

    }
    PLBackendGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "additionalAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "originalFilename");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v26;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "PLPairing: deleting asset %@", buf, 0xCu);

    }
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Asset (%@) was paired as a resource of another asset (%@)"), v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteWithReason:", v31);

  }
  return v7 ^ 1;
}

- (void)_deleteResourceOfType:(unsigned int)a3 forAsset:(id)a4 verifyInserted:(BOOL)a5 deleteFile:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  NSObject *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a6;
  v7 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  _originalResourceOfType(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (!v7 || objc_msgSend(v10, "isInserted")))
    objc_msgSend(v11, "deleteResource");
  if (v6)
  {
    _pathForResourceType(v9, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v15 = objc_msgSend(v14, "removeItemAtURL:error:", v13, &v18);
      v16 = v18;

      if ((v15 & 1) == 0)
      {
        PLBackendGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v20 = v13;
          v21 = 2112;
          v22 = v16;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Error trying to clean up copy at %@: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      PLBackendGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = 0;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Error trying to clean up copy at %@: path was nil", buf, 0xCu);
      }
    }

  }
}

- (NSPredicate)locatedInUsersPhotoLibrary
{
  return self->_locatedInUsersPhotoLibrary;
}

- (void)setLocatedInUsersPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_locatedInUsersPhotoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locatedInUsersPhotoLibrary, 0);
}

void __71__PLPairingProcessor__copyResourceOfType_onAsset_toType_onAsset_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = a1[4];
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "PLPairing: copying %@ to %@", buf, 0x16u);
    }

    v10 = a1[4];
    v9 = (void *)a1[5];
    v11 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v11 + 40);
    objc_msgSend(v9, "_copyFromURL:toURL:error:", v10, v5, &v14);
    v12 = v14;
    v13 = (id *)(v11 + 40);
  }
  else
  {
    v13 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
    v12 = a3;
  }
  objc_storeStrong(v13, v12);

}

void __68__PLPairingProcessor_processPairingForFetchRequest_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "groupIDForAsset:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, v3);
  }
  objc_msgSend(v4, "addObject:", v5);

}

@end
