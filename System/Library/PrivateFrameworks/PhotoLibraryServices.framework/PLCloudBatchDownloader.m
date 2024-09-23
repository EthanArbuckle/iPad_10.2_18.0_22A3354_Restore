@implementation PLCloudBatchDownloader

- (PLCloudBatchDownloader)initWithLibraryServicesManager:(id)a3 manager:(id)a4
{
  id v7;
  id v8;
  PLCloudBatchDownloader *v9;
  PLCloudBatchDownloader *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLCloudBatchDownloader;
  v9 = -[PLCloudBatchDownloader init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lsm, a3);
    objc_storeWeak((id *)&v10->_manager, v8);
  }

  return v10;
}

- (void)_saveIfNeeded:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasChanges");

  if (v5)
  {
    objc_msgSend(v3, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v7 = objc_msgSend(v6, "save:", &v10);
    v8 = v10;

    if ((v7 & 1) == 0 && !*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to save CPL changes: %@", buf, 0xCu);
      }

    }
  }

}

- (id)_handlePersonRecords:(id)a3 inLibrary:(id)a4 includesTiboSchema:(BOOL *)a5
{
  id v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  BOOL v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  SEL v41;
  id v43;
  char v44;
  id obj;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v49 = a4;
  objc_msgSend(v49, "managedObjectContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v7;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (!v51)
  {
    v44 = 0;
    v8 = 0x1E0D11000uLL;
    goto LABEL_81;
  }
  v41 = a2;
  v44 = 0;
  v50 = *(_QWORD *)v55;
  v8 = 0x1E0D11000;
  do
  {
    for (i = 0; i != v51; ++i)
    {
      if (*(_QWORD *)v55 != v50)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
      v11 = (void *)MEMORY[0x19AEC1554]();
      if (objc_msgSend(v10, "personType") != -1
        || objc_msgSend(v10, "verifiedType") != 2 && objc_msgSend(v10, "verifiedType") != 4)
      {
        objc_msgSend(v10, "scopedIdentifier", v41);
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject scopeIdentifier](v12, "scopeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "mainScopeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", v41, self, CFSTR("PLCloudBatchDownloader.m"), 133, CFSTR("person record is only supported in main library"));

        }
        -[NSObject identifier](v12, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fullName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v16, v48);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v19, "syncDescription");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v59 = v21;
              v60 = 2112;
              v61 = v10;
              _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Updating local person %@ with person record %@", buf, 0x16u);

            }
          }
          if (objc_msgSend(v10, "isFullRecord") && !*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v19, "syncDescription");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v59 = v23;
              v60 = 2112;
              v61 = v10;
              _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Found existing person %@ for a full person record %@", buf, 0x16u);

            }
          }
          v24 = -[PLCloudBatchDownloader _shouldIgnoreIncomingPersonTypeChange:localPerson:](self, "_shouldIgnoreIncomingPersonTypeChange:localPerson:", v10, v19);
          v25 = -[PLCloudBatchDownloader _shouldIgnoreIncomingManualOrderChange:localPerson:](self, "_shouldIgnoreIncomingManualOrderChange:localPerson:", v10, v19);
LABEL_36:
          objc_msgSend(v19, "setFullName:", v17);
          objc_msgSend(v10, "displayName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setDisplayName:", v30);

          if (!v24)
            objc_msgSend(v19, "setType:", objc_msgSend(v10, "personType"));
          v8 = 0x1E0D11000uLL;
          if (!v25)
            objc_msgSend(v19, "setManualOrder:", objc_msgSend(v10, "manualSortOrder"));
          if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsAssetSortOrder"))
            objc_msgSend(v19, "setAssetSortOrder:", (__int16)objc_msgSend(v10, "assetSortOrder"));
          if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsGraphPeopleHome"))
          {
            if (objc_msgSend(v10, "verifiedType"))
            {
              v31 = objc_msgSend(v10, "verifiedType");
              v32 = 0;
              v33 = 4294967294;
              switch(v31)
              {
                case -2:
                  goto LABEL_51;
                case 1:
                case 3:
                  v33 = 1;
                  goto LABEL_51;
                case 2:
                case 4:
                  if (objc_msgSend(v19, "cloudVerifiedType", 0) == 1)
                  {
                    v32 = 1;
                  }
                  else
                  {
                    v33 = 2;
LABEL_51:
                    objc_msgSend(v19, "setCloudVerifiedType:", v33);
                    v32 = v33;
                  }
LABEL_52:
                  objc_msgSend(v19, "setVerifiedType:", v32);
                  v44 = 1;
                  break;
                default:
                  goto LABEL_52;
              }
            }
          }
          else
          {
            objc_msgSend(v19, "setEffectiveVerifiedType:", 1);
          }
          if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsMergeTargetRef"))
          {
            objc_msgSend(v10, "mergeTargetPersonIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (v34)
            {
              if ((objc_msgSend(v34, "isEqualToString:", v16) & 1) != 0)
              {
                if (!*MEMORY[0x1E0D115D0])
                {
                  __CPLAssetsdOSLogDomain();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v59 = v10;
                    _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Person record %@ points to itself as the merge target, setting the local merge target to nil", buf, 0xCu);
                  }

                }
                objc_msgSend(v19, "setMergeTargetPerson:", 0);
              }
              else
              {
                objc_msgSend(v43, "setObject:forKey:", v35, v16);
              }
            }

          }
          if (objc_msgSend(MEMORY[0x1E0D113F0], "serverSupportsDetectionType"))
          {
            v37 = objc_msgSend(v10, "detectionType");
            objc_msgSend(v19, "setCloudDetectionType:", v37);
            if ((_DWORD)v37 || objc_msgSend(v19, "detectionType"))
            {
              if ((_DWORD)v37 == objc_msgSend(v19, "detectionType")
                || v37 > 4
                || ((1 << v37) & 0x1A) == 0)
              {
                goto LABEL_72;
              }
            }
            else
            {
              v37 = 1;
            }
            objc_msgSend(v19, "setDetectionType:", v37);
            objc_msgSend(v19, "assignDetectionTypeFromFaces");
          }
LABEL_72:
          objc_msgSend(v10, "contactMatchingDictionary");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "verifiedType") == -2)
          {

            v38 = 0;
          }
          objc_msgSend(v19, "applyCPLChangeForContactMatchingDictionary:", v38);
          objc_msgSend(v19, "setCloudLocalState:", 1);
          objc_msgSend(v47, "addObject:", v19);

        }
        else
        {
          if ((objc_msgSend(v10, "isFullRecord") & 1) == 0 && !*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v10;
              _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Existing person not found for an updated person record %@", buf, 0xCu);
            }

          }
          objc_msgSend(v49, "managedObjectContext");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLPerson insertIntoManagedObjectContext:withPersonUUID:fullName:verifiedType:](PLPerson, "insertIntoManagedObjectContext:withPersonUUID:fullName:verifiedType:", v27, v16, v17, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v19, "syncDescription");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v59 = v29;
              v60 = 2112;
              v61 = v10;
              _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Inserted new person %@ for personRecord %@", buf, 0x16u);

            }
          }
          if (v19)
          {
            v24 = 0;
            v25 = 0;
            goto LABEL_36;
          }
          v8 = 0x1E0D11000;
        }

        goto LABEL_76;
      }
      if (*MEMORY[0x1E0D115D0])
        goto LABEL_77;
      __CPLAssetsdOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v10;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Dropping hidden graph person record %@", buf, 0xCu);
      }
LABEL_76:

LABEL_77:
      objc_autoreleasePoolPop(v11);
    }
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  }
  while (v51);
LABEL_81:

  if (objc_msgSend(*(id *)(v8 + 1008), "serverSupportsMergeTargetRef"))
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __76__PLCloudBatchDownloader__handlePersonRecords_inLibrary_includesTiboSchema___block_invoke;
    v52[3] = &unk_1E36773C8;
    v53 = v48;
    objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v52);

  }
  if (a5)
    *a5 = v44 & 1;

  return v47;
}

- (BOOL)_shouldIgnoreIncomingPersonTypeChange:(id)a3 localPerson:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isHiddenGraphPerson")
    && ((v7 = objc_msgSend(v5, "verifiedType"), v7 == 4) || v7 == 2))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "personUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v9;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring incoming person change to hidden graph person %{public}@", (uint8_t *)&v12, 0xCu);

      }
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldIgnoreIncomingManualOrderChange:(id)a3 localPerson:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6
    && ((v7 = objc_msgSend(v5, "verifiedType"), v7 == 4) || v7 == 2)
    && objc_msgSend(v5, "manualSortOrder") >= 1024)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(v5, "manualSortOrder");
        objc_msgSend(v6, "personUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 134218242;
        v14 = v9;
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring incoming person manualOrder (%td) change from cloud graph person %{public}@", (uint8_t *)&v13, 0x16u);

      }
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_dropDeferredRebuildFacesInPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PLDeferredRebuildFace fetchRequest](PLDeferredRebuildFace, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;

  if (v6)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v3, "managedObjectContext", (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deleteObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }

    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 134217984;
        v27 = v16;
        v17 = "Dropped all deferred rebuild faces (count: %lu)";
        v18 = v15;
        v19 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
        _os_log_impl(&dword_199541000, v18, v19, v17, buf, 0xCu);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = (uint64_t)v7;
      v17 = "Unable to fetch deferred rebuild faces with error %@";
      v18 = v15;
      v19 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
LABEL_16:

  }
}

- (void)_mergeExistingPersonsWithPerson:(id)a3 inPhotoLibrary:(id)a4
{
  id v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  SEL v29;
  PLCloudBatchDownloader *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "personUri");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") && objc_msgSend(MEMORY[0x1E0D11348], "serverSupportsVision"))
  {
    objc_msgSend(v8, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPerson personsWithPersonUri:inManagedObjectContext:](PLPerson, "personsWithPersonUri:inManagedObjectContext:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v11, "count") < 2)
    {
LABEL_28:

      goto LABEL_29;
    }
    v29 = a2;
    v30 = self;
    v33 = v8;
    v34 = v7;
    -[PLCloudBatchDownloader _mergeTargetFromPersons:](self, "_mergeTargetFromPersons:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finalMergeTargetPerson");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v13;
    objc_msgSend(v13, "personUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v32 = v11;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v21, "personUUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "isEqualToString:", v14) & 1) != 0)
          {

          }
          else
          {
            v23 = objc_msgSend(v21, "isTombstone");

            if ((v23 & 1) == 0)
              objc_msgSend(v15, "addObject:", v21);
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      }
      while (v18);
    }

    if (objc_msgSend(v15, "count"))
    {
      v8 = v33;
      v7 = v34;
      v24 = v31;
      v11 = v32;
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v43 = v15;
          v44 = 2112;
          v45 = v31;
          v46 = 2112;
          v47 = v9;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Merging persons %@ to person %@ with same personUri %@", buf, 0x20u);
        }

      }
      -[PLCloudBatchDownloader _saveIfNeeded:](v30, "_saveIfNeeded:", v33);
      objc_msgSend(v33, "libraryServicesManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "databaseContext");
      v27 = objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v29, v30, CFSTR("PLCloudBatchDownloader.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseContext"));

      }
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __73__PLCloudBatchDownloader__mergeExistingPersonsWithPerson_inPhotoLibrary___block_invoke;
      v35[3] = &unk_1E3669158;
      v36 = v31;
      v37 = v15;
      -[NSObject performTransactionSync:withName:](v27, "performTransactionSync:withName:", v35, "-[PLCloudBatchDownloader _mergeExistingPersonsWithPerson:inPhotoLibrary:]");

    }
    else
    {
      v8 = v33;
      v7 = v34;
      v24 = v31;
      v11 = v32;
      if (*MEMORY[0x1E0D115D0])
      {
LABEL_27:

        goto LABEL_28;
      }
      __CPLAssetsdOSLogDomain();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v34;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Unexpected personToMerge for person %@", buf, 0xCu);
      }
    }

    goto LABEL_27;
  }
LABEL_29:

}

- (id)_mergeTargetFromPersons:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!v6
          || +[PLPerson person:isBetterMergeTargetThanPerson:](PLPerson, "person:isBetterMergeTargetThanPerson:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), v6))
        {
          v10 = v9;

          v6 = v10;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "finalMergeTargetPerson");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_handleScopeChanges:(id)a3 inLibrary:(id)a4
{
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  PLCloudPhotoLibraryManager **p_manager;
  uint64_t i;
  void *v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id WeakRetained;
  unint64_t v20;
  id v21;
  __int128 v22;
  id v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v27;
    p_manager = &self->_manager;
    *(_QWORD *)&v8 = 138412290;
    v22 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "scopeType", v22);
        if (v14 <= 6)
        {
          if (((1 << v14) & 0x43) != 0)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v22;
                v31 = v13;
                _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Ignoring unsupported scope type for scopeChange %@", buf, 0xCu);
              }

            }
          }
          else if (((1 << v14) & 0xC) != 0)
          {
            +[PLMomentShare insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:](PLMomentShare, "insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:", v13, v23);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v15, "compactDescription");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v22;
                v31 = v17;
                _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Created or updated moment share %@", buf, 0xCu);

              }
            }

          }
          else
          {
            WeakRetained = objc_loadWeakRetained((id *)p_manager);
            v20 = objc_msgSend(WeakRetained, "deviceLibraryConfiguration");

            if (v20 <= 2 && ((3u >> (v20 & 7)) & 1) != 0)
            {
              v21 = objc_loadWeakRetained((id *)p_manager);
              v24[0] = MEMORY[0x1E0C809B0];
              v24[1] = 3221225472;
              v24[2] = __56__PLCloudBatchDownloader__handleScopeChanges_inLibrary___block_invoke;
              v24[3] = &unk_1E3677C18;
              v24[4] = v13;
              v25 = v23;
              objc_msgSend(v21, "performTransactionOnLibraryScopeSynchronizationQueue:", v24);

            }
          }
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v9);
  }

}

- (void)_handleAlbumRecords:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scopedIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "parentIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v11, "parentIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLGenericAlbum albumWithCloudGUID:inLibrary:](PLGenericAlbum, "albumWithCloudGUID:inLibrary:", v16, v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            +[PLManagedFolder insertNewFolderWithTitle:kind:intoLibrary:](PLManagedFolder, "insertNewFolderWithTitle:kind:intoLibrary:", CFSTR("Folder"), 4000, v6);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "parentIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setCloudGUID:", v18);

          }
        }
        +[PLGenericAlbum albumWithCloudGUID:inLibrary:](PLGenericAlbum, "albumWithCloudGUID:inLibrary:", v14, v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          goto LABEL_33;
        if (!objc_msgSend(v11, "albumType"))
        {
          +[PLGenericAlbum insertNewAlbumWithTitle:intoLibrary:](PLGenericAlbum, "insertNewAlbumWithTitle:intoLibrary:", v12, v6);
          v21 = objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
        if (objc_msgSend(v11, "albumType") == 3)
        {
          if ((objc_msgSend(v14, "isEqualToString:", CFSTR("----Root-Folder----")) & 1) != 0
            || objc_msgSend(v14, "isEqualToString:", CFSTR("----Project-Root-Folder----")))
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v14;
                _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Dropping root album from albumChange with cloudGUID: %@. Cannot find it locally", buf, 0xCu);
              }

LABEL_27:
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  v25 = objc_msgSend(v11, "albumType");
                  *(_DWORD *)buf = 138412546;
                  v36 = v14;
                  v37 = 2048;
                  v38 = v25;
                  _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Dropping album from albumChange %@, unsupported type: %lu", buf, 0x16u);
                }
                v19 = 0;
                goto LABEL_31;
              }
            }
            v19 = 0;
            goto LABEL_32;
          }
          +[PLManagedFolder insertNewFolderWithTitle:kind:intoLibrary:](PLManagedFolder, "insertNewFolderWithTitle:kind:intoLibrary:", v12, 4000, v6);
          v21 = objc_claimAutoreleasedReturnValue();
LABEL_20:
          v19 = (void *)v21;
          if (!v21)
            goto LABEL_27;
          goto LABEL_21;
        }
        if (objc_msgSend(v11, "albumType") != 7)
          goto LABEL_27;
        objc_msgSend(v11, "projectDocumentType");
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = (void *)v23;
          +[PLGenericAlbum insertNewProjectAlbumWithTitle:documentType:intoLibrary:](PLGenericAlbum, "insertNewProjectAlbumWithTitle:documentType:intoLibrary:", v12, v23, v6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
            goto LABEL_27;
LABEL_21:
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v36 = v14;
              _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "Created album from albumChange %@", buf, 0xCu);
            }
LABEL_31:

          }
LABEL_32:
          objc_msgSend(v19, "setCloudLocalState:", 1);
LABEL_33:
          objc_msgSend(v19, "applyPropertiesFromAlbumChange:", v11);
          goto LABEL_34;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v11;
            _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_FAULT, "Skipping CPLAlbum record of project type with nil projectDocumentType: %@", buf, 0xCu);
          }

        }
        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "scopedIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("Attempted to pull a CPLAlbum project record %@ with nil projectDocumentType. \n\nSee rdar://problem/77014185"), v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Cloud Photo Library state detected"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: CPLAlbum project record with nil projectDocumentType"), v19);
LABEL_34:

        ++v10;
      }
      while (v8 != v10);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      v8 = v29;
    }
    while (v29);
  }

}

- (id)_handleMasterRecords:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  PLCloudDownloadBatchDetails *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  PLCloudDownloadBatchDetails *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  char v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v43;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *context;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PLCloudDownloadBatchDetails);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  NSStringFromSelector(sel_scopedIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v43 = (void *)v10;
  +[PLCloudMaster cloudMastersByScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:](PLCloudMaster, "cloudMastersByScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:", v10, 0, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  v14 = (_BYTE *)MEMORY[0x1E0D115D0];
  v47 = v13;
  if (v13)
  {
    v46 = *(_QWORD *)v52;
    v45 = v11;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v52 != v46)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v15);
        context = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v16, "scopedIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
LABEL_7:
          if (objc_msgSend(v18, "cloudLocalState") != 3)
            objc_msgSend(v18, "setCloudLocalState:", 3);
          if (objc_msgSend(v16, "hasChangeType:", 2))
          {
            if (!*v14)
            {
              __CPLAssetsdOSLogDomain();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v56 = v16;
                _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "Applying properties change from masterChange %@", buf, 0xCu);
              }

            }
            objc_msgSend(v18, "applyPropertiesFromCPLMasterChange:", v16);
          }
          if (objc_msgSend(v16, "hasChangeType:", 8))
          {
            -[PLCloudDownloadBatchDetails setHasResourceChanges:](v7, "setHasResourceChanges:", 1);
            if ((objc_msgSend(v16, "isFullRecord") & 1) == 0
              && objc_msgSend(v18, "placeholderState") != 1)
            {
              objc_msgSend(v18, "allMasterResources");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLCloudBatchDownloader _triggerBackgroundDownloadFailureForResources:](self, "_triggerBackgroundDownloadFailureForResources:", v20);

            }
            if (!*v14)
            {
              __CPLAssetsdOSLogDomain();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v56 = v16;
                _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "Applying resource change from masterChange %@", buf, 0xCu);
              }

            }
            objc_msgSend(v18, "rm_applyResourcesFromCPLMasterChange:inPhotoLibrary:", v16, v6);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "count"))
              objc_msgSend(v8, "unionSet:", v22);

          }
          if (objc_msgSend(v16, "hasChangeType:", 2))
          {
            objc_msgSend(v16, "expungeableResourceStates");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");

            if (v24)
            {
              v14 = (_BYTE *)MEMORY[0x1E0D115D0];
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v56 = v16;
                  _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Applying expungeable resource states change from masterChange %@", buf, 0xCu);
                }

              }
              objc_msgSend(v18, "rm_applyExpungeableResourceStatesFromCPLMasterChange:inPhotoLibrary:", v16, v6);
            }
            else
            {
              v14 = (_BYTE *)MEMORY[0x1E0D115D0];
            }
          }
          goto LABEL_47;
        }
        if (!*v14)
        {
          __CPLAssetsdOSLogDomain();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v16;
            _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "Creating cloudMaster from masterChange %@", buf, 0xCu);
          }

        }
        objc_msgSend(v16, "scopedIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
        v28 = +[PLShare getShareIfNecessary:forCPLRecordWithClass:scopedIdentifier:inLibrary:](PLMomentShare, "getShareIfNecessary:forCPLRecordWithClass:scopedIdentifier:inLibrary:", &v50, objc_opt_class(), v27, v6);
        v29 = v50;
        v30 = v29;
        if (v28)
        {
          objc_msgSend(v27, "identifier");
          v31 = v12;
          v32 = v8;
          v33 = v7;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCloudMaster insertIntoPhotoLibrary:withCloudMasterGUID:inMomentShare:](PLCloudMaster, "insertIntoPhotoLibrary:withCloudMasterGUID:inMomentShare:", v6, v34, v30);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setCloudLocalState:", 3);

          v7 = v33;
          v8 = v32;
          v12 = v31;
          v11 = v45;

          v14 = (_BYTE *)MEMORY[0x1E0D115D0];
          if (v18)
            goto LABEL_7;
        }
        else
        {

          v14 = (_BYTE *)MEMORY[0x1E0D115D0];
        }
        if (!*v14)
        {
          __CPLAssetsdOSLogDomain();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v16;
            _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "Unable to create cloudMaster for %@", buf, 0xCu);
          }

        }
        v18 = 0;
LABEL_47:

        objc_autoreleasePoolPop(context);
        ++v15;
      }
      while (v47 != v15);
      v47 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v47);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "managedObjectContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v38 = objc_msgSend(v36, "obtainPermanentIDsForObjects:error:", v37, &v49);
    v39 = v49;

    if ((v38 & 1) == 0 && !*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v56 = v8;
        v57 = 2112;
        v58 = v39;
        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "Unable to obtain permanent ID for %@: %@", buf, 0x16u);
      }

    }
    objc_msgSend(v8, "valueForKey:", CFSTR("objectID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudDownloadBatchDetails setConfirmedResourceIDs:](v7, "setConfirmedResourceIDs:", v41);

  }
  return v7;
}

- (id)_findMaster:(id)a3 fromAdditionalRecordInBatch:(id)a4 inLibrary:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(a4, "additionalRecordWithScopedIdentifier:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PLCloudBatchDownloader _handleMasterRecords:inLibrary:](self, "_handleMasterRecords:inLibrary:", v11, v8);

    objc_msgSend(v10, "scopedIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", v13, 0, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_assetsAndCloudMastersFromAssetRecords:(id)a3 assetsByScopedIdentifier:(id *)a4 mastersByScopedIdentifier:(id *)a5 inLibrary:(id)a6
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v25 = a6;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", CFSTR("master"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = v9;
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v13);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x19AEC1554]();
        if (objc_msgSend(v15, "hasChangeType:", 2))
          objc_msgSend(v8, "addObject:", CFSTR("additionalAttributes"));
        if (objc_msgSend(v15, "hasChangeType:", 8))
          objc_msgSend(v8, "addObject:", CFSTR("modernResources"));
        objc_msgSend(v15, "keywords");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("additionalAttributes"), CFSTR("keywords"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v18);

        }
        objc_autoreleasePoolPop(v16);
      }
      v9 = v13;
      v11 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  if (a4)
  {
    NSStringFromSelector(sel_scopedIdentifier);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset assetsByScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:](PLManagedAsset, "assetsByScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:", v20, v21, v25);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "_pl_map:", &__block_literal_global_36997);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    +[PLCloudMaster cloudMastersByScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:](PLCloudMaster, "cloudMastersByScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:", v22, 0, v25);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (id)_handleAssetRecords:(id)a3 inSyncContext:(id)a4 withChangeBatch:(id)a5 insertedAssetUUIDs:(id *)a6
{
  id v8;
  id v9;
  id v10;
  char *v11;
  char *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  id v17;
  id v18;
  NSObject *v19;
  id WeakRetained;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  int v24;
  id v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  unint64_t v33;
  __CFString *v34;
  __CFString *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  unint64_t v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  _BOOL4 v53;
  void *v54;
  NSObject *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  NSObject *v66;
  __CFString *v67;
  void *v68;
  __CFString *v69;
  NSObject *v70;
  NSObject *v71;
  const char *v72;
  NSObject *v73;
  void *v74;
  uint64_t v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  BOOL v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t j;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _BOOL4 v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t k;
  void *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t m;
  uint64_t v112;
  void *v113;
  NSObject *v114;
  id v115;
  void *v116;
  void *v117;
  char v118;
  id v119;
  char v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t n;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t ii;
  void *v136;
  void *v137;
  id v138;
  unint64_t v139;
  __CFString *v140;
  __CFString *v141;
  void *v142;
  void *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t jj;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  PLCloudDownloadBatchDetails *v152;
  id v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  PLCloudDownloadBatchDetails *v164;
  void *v165;
  id obj;
  void *v167;
  void *v168;
  id *location;
  void *v170;
  uint64_t v171;
  id v172;
  id v173;
  id v174;
  uint64_t v175;
  void *v176;
  void *v178;
  char *v179;
  id v180;
  void *context;
  id contexta;
  id v183;
  id v184;
  void (**v185)(void);
  id v186;
  void *v187;
  id v188;
  void *v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _QWORD v202[5];
  id v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  _QWORD v220[4];
  id v221;
  id v222;
  PLCloudBatchDownloader *v223;
  id v224;
  id v225;
  _BYTE *v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  id v231;
  id v232;
  _BYTE v233[128];
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  _BYTE v237[128];
  _BYTE v238[128];
  uint8_t v239[128];
  uint8_t buf[4];
  __CFString *v241;
  __int16 v242;
  __CFString *v243;
  __int16 v244;
  void *v245;
  _BYTE v246[24];
  uint64_t (*v247)(uint64_t, uint64_t);
  void (*v248)(uint64_t);
  id v249;
  _BYTE v250[128];
  uint64_t v251;

  v251 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v173 = a5;
  v170 = v9;
  objc_msgSend(v9, "photoLibrary");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "mainScopeIdentifier");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "managedObjectContext");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = objc_alloc_init(PLCloudDownloadBatchDetails);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v159 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v162 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v161 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", v178);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v232 = 0;
  v231 = 0;
  -[PLCloudBatchDownloader _assetsAndCloudMastersFromAssetRecords:assetsByScopedIdentifier:mastersByScopedIdentifier:inLibrary:](self, "_assetsAndCloudMastersFromAssetRecords:assetsByScopedIdentifier:mastersByScopedIdentifier:inLibrary:", v8, &v232, &v231, v187);
  v174 = v232;
  v172 = v231;
  v163 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v229 = 0u;
  v230 = 0u;
  v227 = 0u;
  v228 = 0u;
  obj = v8;
  v175 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v227, v250, 16);
  if (!v175)
  {
    v156 = 0;
    v157 = 0;
    goto LABEL_166;
  }
  v156 = 0;
  v157 = 0;
  location = (id *)&self->_manager;
  v171 = *(_QWORD *)v228;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v228 != v171)
      {
        v12 = v11;
        objc_enumerationMutation(obj);
        v11 = v12;
      }
      v179 = v11;
      v13 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * (_QWORD)v11);
      context = (void *)MEMORY[0x19AEC1554]();
      v14 = v13;
      -[__CFString scopedIdentifier](v14, "scopedIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v246 = 0;
      *(_QWORD *)&v246[8] = v246;
      *(_QWORD *)&v246[16] = 0x3032000000;
      v247 = __Block_byref_object_copy__36784;
      v248 = __Block_byref_object_dispose__36785;
      -[__CFString masterScopedIdentifier](v14, "masterScopedIdentifier");
      v249 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "objectForKey:", v15);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v220[0] = MEMORY[0x1E0C809B0];
      v220[1] = 3221225472;
      v220[2] = __95__PLCloudBatchDownloader__handleAssetRecords_inSyncContext_withChangeBatch_insertedAssetUUIDs___block_invoke;
      v220[3] = &unk_1E36691C0;
      v17 = v172;
      v221 = v17;
      v226 = v246;
      v183 = v15;
      v222 = v183;
      v223 = self;
      v18 = v173;
      v224 = v18;
      v188 = v187;
      v225 = v188;
      v185 = (void (**)(void))MEMORY[0x19AEC174C](v220);
      if (v16)
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v241 = v16;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "Found asset %@", buf, 0xCu);
          }

        }
        if (!-[__CFString hasChangeType:](v14, "hasChangeType:", 64)
          || (WeakRetained = objc_loadWeakRetained(location),
              v21 = objc_msgSend(WeakRetained, "deviceLibraryConfiguration"),
              objc_msgSend(v168, "scopeIdentifier"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              LOBYTE(v21) = -[__CFString qualifiesForDeviceLibraryConfiguration:sharingScopeIdentifier:mainScopeIdentifier:](v14, "qualifiesForDeviceLibraryConfiguration:sharingScopeIdentifier:mainScopeIdentifier:", v21, v22, v167), v22, WeakRetained, (v21 & 1) != 0))
        {
          if (-[__CFString isFullRecord](v14, "isFullRecord"))
          {
            -[__CFString master](v16, "master");
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v23
              || (+[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", *(_QWORD *)(*(_QWORD *)&v246[8] + 40), 0, v188), (v23 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              v24 = 0;
            }
            else
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v241 = v14;
                  v242 = 2112;
                  v243 = v23;
                  _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_ERROR, "%@ is known to the library with no master. Trying to fix-up library with cloudMaster %@", buf, 0x16u);
                }

              }
              +[PLManagedAsset fixupCloudPhotoLibraryAsset:withCloudMaster:inLibrary:](PLManagedAsset, "fixupCloudPhotoLibraryAsset:withCloudMaster:inLibrary:", v16, v23, v188);
              v24 = 1;
            }

          }
          else
          {
            v24 = 0;
          }
          -[__CFString master](v16, "master");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48;
          if (v48 && *(_QWORD *)(*(_QWORD *)&v246[8] + 40))
          {
            -[__CFString master](v16, "master");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "scopedIdentifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "isEqual:", *(_QWORD *)(*(_QWORD *)&v246[8] + 40));

            v53 = v24 != 0;
            if ((v52 & 1) == 0)
            {
              -[__CFString master](v16, "master");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v54, "scopedIdentifier");
                  v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v57 = *(void **)(*(_QWORD *)&v246[8] + 40);
                  *(_DWORD *)buf = 138412802;
                  v241 = v14;
                  v242 = 2112;
                  v243 = v56;
                  v244 = 2112;
                  v245 = v57;
                  _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_DEFAULT, "Going to remap asset record %@ master from %@ to %@", buf, 0x20u);

                }
              }
              v185[2]();
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              if (v58)
              {
                -[__CFString allMasterCPLResources](v16, "allMasterCPLResources");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = v58;
                v218 = 0u;
                v219 = 0u;
                v216 = 0u;
                v217 = 0u;
                v61 = v59;
                v62 = -[NSObject countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v216, v239, 16);
                if (v62)
                {
                  v63 = *(_QWORD *)v217;
                  do
                  {
                    for (i = 0; i != v62; ++i)
                    {
                      if (*(_QWORD *)v217 != v63)
                        objc_enumerationMutation(v61);
                      v65 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * i);
                      -[__CFString removeLocalFileForResource:allowDCIMPath:](v16, "removeLocalFileForResource:allowDCIMPath:", v65, 1);
                      objc_msgSend(v65, "deleteResource");
                    }
                    v62 = -[NSObject countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v216, v239, 16);
                  }
                  while (v62);
                }

                v58 = v60;
                +[PLManagedAsset fixupCloudPhotoLibraryAsset:withCloudMaster:inLibrary:](PLManagedAsset, "fixupCloudPhotoLibraryAsset:withCloudMaster:inLibrary:", v16, v60, v188);
                -[__CFString invalidateThumbnailIfNeededAfterMasterResourceChangeInLibrary:](v16, "invalidateThumbnailIfNeededAfterMasterResourceChangeInLibrary:", v188);
                if (!*MEMORY[0x1E0D115D0])
                {
                  __CPLAssetsdOSLogDomain();
                  v66 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v54, "scopedIdentifier");
                    v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "scopedIdentifier");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v241 = v14;
                    v242 = 2112;
                    v243 = v67;
                    v244 = 2112;
                    v245 = v68;
                    _os_log_impl(&dword_199541000, v66, OS_LOG_TYPE_DEFAULT, "Existing asset record's %@ master has been remapped from %@ to %@", buf, 0x20u);

                  }
                }
                +[PLCloudMaster deleteMasterIfNecessary:inLibrary:](PLCloudMaster, "deleteMasterIfNecessary:inLibrary:", v54, v188);
                v24 = 1;
                goto LABEL_83;
              }
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v61 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  v69 = *(__CFString **)(*(_QWORD *)&v246[8] + 40);
                  *(_DWORD *)buf = 138412546;
                  v241 = v69;
                  v242 = 2112;
                  v243 = v14;
                  _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_ERROR, "Unable to find new master %@ to remap asset %@", buf, 0x16u);
                }
LABEL_83:

              }
              v53 = v24 != 0;
            }
          }
          else
          {

            v53 = v24 != 0;
          }
LABEL_101:
          if (-[__CFString hasChangeType:](v14, "hasChangeType:", 32))
          {
            objc_msgSend((id)objc_opt_class(), "_adjustmentStateDictionaryForComparingIncomingFaceRecordForAsset:", v16);
            v36 = objc_claimAutoreleasedReturnValue();
            -[__CFString cloudIdentifier](v16, "cloudIdentifier");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v170, "setAssetAdjustmentState:forCloudIdentifier:", v36, v78);

          }
          else
          {
            v36 = 0;
          }
          if (-[__CFString cloudLocalState](v16, "cloudLocalState") != 1)
            -[__CFString setCloudLocalState:](v16, "setCloudLocalState:", 1);
          if (-[__CFString isPartOfBurst](v16, "isPartOfBurst"))
          {
            -[__CFString avalancheUUID](v16, "avalancheUUID");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "addObject:", v79);

          }
          -[__CFString burstIdentifier](v14, "burstIdentifier");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v80 == 0;

          if (!v81)
          {
            -[__CFString burstIdentifier](v14, "burstIdentifier");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "addObject:", v82);

          }
          if ((_os_feature_enabled_impl() & 1) == 0
            && -[__CFString hasChangeType:](v14, "hasChangeType:", 64))
          {
            -[__CFString applySharingPropertiesFromAssetChange:inLibrary:](v16, "applySharingPropertiesFromAssetChange:inLibrary:", v14, v188);
          }
          if (-[__CFString hasChangeType:](v14, "hasChangeType:", 2))
            -[__CFString applyPropertiesFromAssetChange:inLibrary:](v16, "applyPropertiesFromAssetChange:inLibrary:", v14, v188);
          if (-[__CFString hasChangeType:](v14, "hasChangeType:", 8))
          {
            -[PLCloudDownloadBatchDetails setHasResourceChanges:](v164, "setHasResourceChanges:", 1);
            if ((-[__CFString isFullRecord](v14, "isFullRecord") & 1) == 0
              && (-[__CFString isPlaceholderAsset](v16, "isPlaceholderAsset") & 1) == 0)
            {
              -[__CFString allAssetCPLResources](v16, "allAssetCPLResources");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLCloudBatchDownloader _triggerBackgroundDownloadFailureForResources:](self, "_triggerBackgroundDownloadFailureForResources:", v83);

            }
            -[__CFString rm_applyResourcesFromAssetChange:inLibrary:](v16, "rm_applyResourcesFromAssetChange:inLibrary:", v14, v188);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v84, "count"))
              objc_msgSend(v10, "unionSet:", v84);

          }
          if (-[__CFString hasChangeType:](v14, "hasChangeType:", 2))
          {
            buf[0] = 0;
            -[__CFString applyComputeSyncPropertiesFromAssetChange:inLibrary:didInstallComputeSyncResource:](v16, "applyComputeSyncPropertiesFromAssetChange:inLibrary:didInstallComputeSyncResource:", v14, v188, buf);
            if (buf[0])
              -[PLCloudDownloadBatchDetails setHasResourceChanges:](v164, "setHasResourceChanges:", 1);
          }
          if (-[__CFString isFullRecord](v14, "isFullRecord"))
          {
            v214 = 0u;
            v215 = 0u;
            v212 = 0u;
            v213 = 0u;
            -[__CFString allMasterCPLResources](v16, "allMasterCPLResources");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v212, v238, 16);
            if (v86)
            {
              v87 = *(_QWORD *)v213;
              do
              {
                for (j = 0; j != v86; ++j)
                {
                  if (*(_QWORD *)v213 != v87)
                    objc_enumerationMutation(v85);
                  v89 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * j);
                  if (objc_msgSend(v89, "isLocallyAvailable"))
                    objc_msgSend(v10, "addObject:", v89);
                }
                v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v212, v238, 16);
              }
              while (v86);
            }

          }
          if (-[__CFString hasChangeType:](v14, "hasChangeType:", 32))
            -[__CFString applyFacesFromAssetChange:inSyncContext:](v16, "applyFacesFromAssetChange:inSyncContext:", v14, v170);
          if ((-[__CFString hasChangeType:](v14, "hasChangeType:", 2) & 1) != 0
            || -[__CFString hasChangeType:](v14, "hasChangeType:", 8))
          {
            -[__CFString postProcessResourceDependentPropertyChangesFromAssetChange:inLibrary:](v16, "postProcessResourceDependentPropertyChangesFromAssetChange:inLibrary:", v14, v188);
          }
          -[__CFString cloudIdentifier](v16, "cloudIdentifier");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v170, "setAssetAdjustmentState:forCloudIdentifier:", 0, v90);

          if (v53)
            v91 = +[PLResourceDataStoreManager updateDerivativeResourcesForAsset:forLifecycleEvent:](PLResourceDataStoreManager, "updateDerivativeResourcesForAsset:forLifecycleEvent:", v16, 2);
          -[__CFString momentShare](v16, "momentShare");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (v92)
            v93 = v53;
          else
            v93 = 0;

          if (v93)
          {
            -[__CFString momentShare](v16, "momentShare");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "addObject:", v94);

          }
          if (-[__CFString isPlaceholderAsset](v16, "isPlaceholderAsset"))
          {
            -[__CFString momentShare](v16, "momentShare");
            v95 = (void *)objc_claimAutoreleasedReturnValue();

            if (v95)
            {
              -[__CFString fixupPlaceholderAssetWithSavedAssetType:](v16, "fixupPlaceholderAssetWithSavedAssetType:", objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForMomentSharedAsset"));
              -[__CFString momentShare](v16, "momentShare");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v163, "addObject:", v96);
              goto LABEL_153;
            }
            -[__CFString fixupPlaceholderAssetWithSavedAssetType:](v16, "fixupPlaceholderAssetWithSavedAssetType:", objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCloudPhotoLibraryAsset"));
            -[__CFString additionalAttributes](v16, "additionalAttributes");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "syndicationIdentifier");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            if (v99)
            {
              v100 = (-[__CFString syndicationState](v16, "syndicationState") & 2) == 0;

              if (v100)
                -[__CFString syndicatedAssetDidSaveToUserLibrary](v16, "syndicatedAssetDidSaveToUserLibrary");
              goto LABEL_154;
            }
          }
          else
          {
            -[__CFString additionalAttributes](v16, "additionalAttributes");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "sourceAssetForDuplicationCPLScopedIdentifier");
            v98 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v98)
              goto LABEL_154;
            -[__CFString additionalAttributes](v16, "additionalAttributes");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "setSourceAssetForDuplicationCPLScopedIdentifier:", 0);
          }
LABEL_153:

          goto LABEL_154;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = objc_loadWeakRetained(location);
            v39 = objc_msgSend(v38, "deviceLibraryConfiguration");
            v40 = CFSTR("unknown");
            if (v39 <= 2)
              v40 = off_1E366BE48[v39];
            v41 = v40;
            *(_DWORD *)buf = 138412546;
            v241 = v14;
            v242 = 2112;
            v243 = v41;
            _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "Deleting asset for record %@, asset does not qualify for device-library configuration: %@", buf, 0x16u);

          }
        }
        objc_msgSend(v160, "addObject:", v16);
        +[PLMemory memoryObjectIDsContainingAsset:](PLMemory, "memoryObjectIDsContainingAsset:", v16);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "unionSet:", v42);

        +[PLSuggestion suggestionObjectIDsContainingAsset:](PLSuggestion, "suggestionObjectIDsContainingAsset:", v16);
        v36 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "unionSet:", v36);
LABEL_154:

LABEL_155:
        v28 = v14;
        goto LABEL_156;
      }
      v25 = objc_loadWeakRetained(location);
      v26 = objc_msgSend(v25, "deviceLibraryConfiguration");
      objc_msgSend(v168, "scopeIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v26) = -[__CFString qualifiesForDeviceLibraryConfiguration:sharingScopeIdentifier:mainScopeIdentifier:](v14, "qualifiesForDeviceLibraryConfiguration:sharingScopeIdentifier:mainScopeIdentifier:", v26, v27, v167);

      if ((v26 & 1) == 0)
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = objc_loadWeakRetained(location);
            v33 = objc_msgSend(v32, "deviceLibraryConfiguration");
            v34 = CFSTR("unknown");
            if (v33 <= 2)
              v34 = off_1E366BE48[v33];
            v35 = v34;
            *(_DWORD *)buf = 138412546;
            v241 = v14;
            v242 = 2112;
            v243 = v35;
            _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "Skipping asset record %@, no existing asset and new asset does not qualify for device-library configuration: %@", buf, 0x16u);

          }
        }
        objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)&v246[8] + 40));
        v36 = objc_claimAutoreleasedReturnValue();
        if (v36)
          objc_msgSend(v159, "addObject:", v36);
        v16 = 0;
        goto LABEL_154;
      }
      if ((-[__CFString isFullRecord](v14, "isFullRecord") & 1) != 0
        || !-[__CFString hasChangeType:](v14, "hasChangeType:", 64))
      {
        v28 = v14;
      }
      else
      {
        objc_msgSend(v18, "additionalRecordWithScopedIdentifier:", v183);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

        -[__CFString masterScopedIdentifier](v28, "masterScopedIdentifier");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = *(void **)(*(_QWORD *)&v246[8] + 40);
        *(_QWORD *)(*(_QWORD *)&v246[8] + 40) = v29;

      }
      if ((-[__CFString isFullRecord](v28, "isFullRecord") & 1) != 0)
      {
        if (*(_QWORD *)(*(_QWORD *)&v246[8] + 40))
        {
          v185[2]();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            +[PLManagedAsset createCloudPhotoLibraryAssetWithAssetRecord:withCloudMaster:inLibrary:](PLManagedAsset, "createCloudPhotoLibraryAssetWithAssetRecord:withCloudMaster:inLibrary:", v28, v43, v188);
            v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v16 = v44;
            if (v44)
            {
              if (-[__CFString isPhoto](v44, "isPhoto"))
                ++v157;
              else
                v156 += -[__CFString isVideo](v16, "isVideo");
              -[__CFString momentShare](v16, "momentShare");
              v73 = objc_claimAutoreleasedReturnValue();
              v70 = v73;
              if (v73)
              {
                if (-[NSObject shouldNotifyOnUploadCompletion](v73, "shouldNotifyOnUploadCompletion"))
                {
                  -[NSObject momentShareAssets](v70, "momentShareAssets");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = objc_msgSend(v74, "count");
                  v76 = v75 == -[NSObject assetCount](v70, "assetCount");

                  if (v76)
                  {
                    -[NSObject uuid](v70, "uuid");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v155, "addObject:", v77);

                  }
                }
              }
              objc_msgSend(v158, "addObject:", v16);
              v53 = 1;
              goto LABEL_99;
            }
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v241 = v28;
                v71 = v70;
                v72 = "Failed to create asset from assetRecord %@ ";
                goto LABEL_91;
              }
              goto LABEL_92;
            }
          }
          else if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v241 = v28;
              v71 = v70;
              v72 = "Failed to create asset from assetRecord %@, can't find master";
LABEL_91:
              _os_log_impl(&dword_199541000, v71, OS_LOG_TYPE_ERROR, v72, buf, 0xCu);
            }
LABEL_92:
            v53 = 0;
            v16 = 0;
LABEL_99:

            goto LABEL_100;
          }
          v53 = 0;
          v16 = 0;
LABEL_100:

          v14 = v28;
          if (v16)
            goto LABEL_101;
          goto LABEL_155;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v241 = v28;
            v45 = v36;
            v46 = "Skipping asset record %@, can't create asset, no master identifier";
LABEL_78:
            _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);
          }
          goto LABEL_79;
        }
      }
      else if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v241 = v28;
          v45 = v36;
          v46 = "Skipping asset record %@, received a non-full record from CPL and we can't find the asset to apply this change to";
          goto LABEL_78;
        }
LABEL_79:
        v16 = 0;
        v14 = v28;
        goto LABEL_154;
      }
      v16 = 0;
LABEL_156:

      _Block_object_dispose(v246, 8);
      objc_autoreleasePoolPop(context);
      v11 = v179 + 1;
    }
    while (v179 + 1 != (char *)v175);
    v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v227, v250, 16);
    v175 = v101;
  }
  while (v101);
LABEL_166:

  v210 = 0u;
  v211 = 0u;
  v208 = 0u;
  v209 = 0u;
  v186 = v163;
  v102 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v208, v237, 16);
  if (v102)
  {
    v103 = *(_QWORD *)v209;
    do
    {
      for (k = 0; k != v102; ++k)
      {
        if (*(_QWORD *)v209 != v103)
          objc_enumerationMutation(v186);
        v105 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * k);
        objc_msgSend(v105, "computeUploadedAssetCountsUsingAssetRelationship");
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v105, "scopeIdentifier");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "uuid");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v246 = 138543618;
            *(_QWORD *)&v246[4] = v107;
            *(_WORD *)&v246[12] = 2114;
            *(_QWORD *)&v246[14] = v108;
            _os_log_impl(&dword_199541000, v106, OS_LOG_TYPE_DEFAULT, "Recomputed uploaded asset counts on MomentShare %{public}@ %{public}@ after handling asset records", v246, 0x16u);

          }
        }
      }
      v102 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v208, v237, 16);
    }
    while (v102);
  }

  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  v184 = v165;
  v109 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v204, v236, 16);
  if (v109)
  {
    v110 = *(_QWORD *)v205;
    do
    {
      for (m = 0; m != v109; ++m)
      {
        if (*(_QWORD *)v205 != v110)
          objc_enumerationMutation(v184);
        v112 = *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * m);
        +[PLAvalanche assetsWithAvalancheUUID:inManagedObjectContext:](PLAvalanche, "assetsWithAvalancheUUID:inManagedObjectContext:", v112, v178);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v113, "count")
          && !+[PLAvalanche isValidBurstWithAssets:](PLAvalanche, "isValidBurstWithAssets:", v113))
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v114 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v246 = 138412290;
              *(_QWORD *)&v246[4] = v112;
              _os_log_impl(&dword_199541000, v114, OS_LOG_TYPE_DEFAULT, "Found burst on a download, revalidating %@", v246, 0xCu);
            }

          }
          v115 = +[PLAvalanche revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:](PLAvalanche, "revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:", v113, v187, 0, 0);
        }

      }
      v109 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v204, v236, 16);
    }
    while (v109);
  }

  -[PLCloudDownloadBatchDetails setNumberOfPhotos:](v164, "setNumberOfPhotos:", v157);
  -[PLCloudDownloadBatchDetails setNumberOfVideos:](v164, "setNumberOfVideos:", v156);
  -[PLCloudDownloadBatchDetails setCmmUUIDsToNotify:](v164, "setCmmUUIDsToNotify:", v155);
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v187, "managedObjectContext");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v203 = 0;
    v118 = objc_msgSend(v116, "obtainPermanentIDsForObjects:error:", v117, &v203);
    v119 = v203;

    if (*MEMORY[0x1E0D115D0])
      v120 = 1;
    else
      v120 = v118;
    if ((v120 & 1) == 0)
    {
      __CPLAssetsdOSLogDomain();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v246 = 138412546;
        *(_QWORD *)&v246[4] = v10;
        *(_WORD *)&v246[12] = 2112;
        *(_QWORD *)&v246[14] = v119;
        _os_log_impl(&dword_199541000, v121, OS_LOG_TYPE_ERROR, "Unable to obtain permanent ID for %@: %@", v246, 0x16u);
      }

    }
    objc_msgSend(v10, "valueForKey:", CFSTR("objectID"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudDownloadBatchDetails setConfirmedResourceIDs:](v164, "setConfirmedResourceIDs:", v122);

  }
  +[PLManagedAsset deDupCMMAssets:](PLManagedAsset, "deDupCMMAssets:", v158);
  *(_QWORD *)v246 = 0;
  *(_QWORD *)&v246[8] = v246;
  *(_QWORD *)&v246[16] = 0x3032000000;
  v247 = __Block_byref_object_copy__36784;
  v248 = __Block_byref_object_dispose__36785;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v158, "count"));
  v249 = (id)objc_claimAutoreleasedReturnValue();
  v202[0] = MEMORY[0x1E0C809B0];
  v202[1] = 3221225472;
  v202[2] = __95__PLCloudBatchDownloader__handleAssetRecords_inSyncContext_withChangeBatch_insertedAssetUUIDs___block_invoke_87;
  v202[3] = &unk_1E36691E8;
  v202[4] = v246;
  objc_msgSend(v158, "_pl_filter:", v202);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)&v246[8] + 40), "allObjects");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLImportSession albumsWithImportSessionIDs:inManagedObjectContext:](PLImportSession, "albumsWithImportSessionIDs:inManagedObjectContext:", v124, v178);
  v176 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v176, "_pl_indexBy:", &__block_literal_global_91);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = (void *)objc_msgSend(v125, "mutableCopy");

  v200 = 0u;
  v201 = 0u;
  v198 = 0u;
  v199 = 0u;
  contexta = v123;
  v126 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v198, v235, 16);
  if (v126)
  {
    v127 = *(_QWORD *)v199;
    do
    {
      for (n = 0; n != v126; ++n)
      {
        if (*(_QWORD *)v199 != v127)
          objc_enumerationMutation(contexta);
        v129 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * n);
        objc_msgSend(v129, "master");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "importSessionID");
        v131 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v189, "objectForKeyedSubscript:", v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v132)
        {
          +[PLImportSession insertNewImportSessionAlbumWithImportSessionID:inManagedObjectContext:](PLImportSession, "insertNewImportSessionAlbumWithImportSessionID:inManagedObjectContext:", v131, v178);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v189, "setObject:forKeyedSubscript:", v132, v131);
        }
        objc_msgSend(v129, "setImportSession:", v132);
        objc_msgSend(v132, "updateImportDatesFromAddedAsset:", v129);

      }
      v126 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v198, v235, 16);
    }
    while (v126);
  }

  v196 = 0u;
  v197 = 0u;
  v194 = 0u;
  v195 = 0u;
  v180 = v160;
  v133 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v194, v234, 16);
  if (v133)
  {
    v134 = *(_QWORD *)v195;
    do
    {
      for (ii = 0; ii != v133; ++ii)
      {
        if (*(_QWORD *)v195 != v134)
          objc_enumerationMutation(v180);
        v136 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * ii);
        objc_msgSend(v136, "setLocalOnlyDelete:", 1);
        v137 = (void *)MEMORY[0x1E0CB3940];
        v138 = objc_loadWeakRetained((id *)&self->_manager);
        v139 = objc_msgSend(v138, "deviceLibraryConfiguration");
        v140 = CFSTR("unknown");
        if (v139 <= 2)
          v140 = off_1E366BE48[v139];
        v141 = v140;
        objc_msgSend(v137, "stringWithFormat:", CFSTR("Asset does not qualify for device-library configuration: %@"), v141);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "deleteWithReason:", v143);

      }
      v133 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v194, v234, 16);
    }
    while (v133);
  }

  v192 = 0u;
  v193 = 0u;
  v190 = 0u;
  v191 = 0u;
  v144 = v159;
  v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v190, v233, 16);
  if (v145)
  {
    v146 = *(_QWORD *)v191;
    do
    {
      for (jj = 0; jj != v145; ++jj)
      {
        if (*(_QWORD *)v191 != v146)
          objc_enumerationMutation(v144);
        +[PLCloudMaster deleteMasterIfNecessary:inLibrary:](PLCloudMaster, "deleteMasterIfNecessary:inLibrary:", *(_QWORD *)(*((_QWORD *)&v190 + 1) + 8 * jj), v187);
      }
      v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v190, v233, 16);
    }
    while (v145);
  }

  objc_msgSend(v187, "managedObjectContext");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMemory deleteMemoriesWithObjectIDs:inManagedObjectContext:](PLMemory, "deleteMemoriesWithObjectIDs:inManagedObjectContext:", v162, v148);

  objc_msgSend(v187, "managedObjectContext");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSuggestion deleteSuggestionsWithObjectIDs:inManagedObjectContext:](PLSuggestion, "deleteSuggestionsWithObjectIDs:inManagedObjectContext:", v161, v149);

  if (a6)
  {
    v150 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v158, "valueForKey:", CFSTR("uuid"));
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setWithArray:", v151);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v152 = v164;

  _Block_object_dispose(v246, 8);
  return v152;
}

- (id)_handleMemoryRecords:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  char v23;
  id WeakRetained;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  unint64_t v29;
  __CFString *v30;
  __CFString *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  PLCloudBatchDownloader *v47;
  id v48;
  id v49;
  PLCloudDownloadBatchDetails *v50;
  id *location;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  __CFString *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v45 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_alloc_init(PLCloudDownloadBatchDetails);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v8 = v6;
  v54 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  v47 = self;
  if (!v54)
  {
    v46 = 0;
    goto LABEL_52;
  }
  v46 = 0;
  location = (id *)&self->_manager;
  v53 = *(_QWORD *)v56;
  v48 = v8;
  v49 = v7;
  do
  {
    for (i = 0; i != v54; ++i)
    {
      if (*(_QWORD *)v56 != v53)
        objc_enumerationMutation(v8);
      v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
      v11 = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(v10, "scopedIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[PLMemory memoryWithUUID:inPhotoLibrary:](PLMemory, "memoryWithUUID:inPhotoLibrary:", v13, v7);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "creationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v10;
            _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_FAULT, "Skipping CPLMemory record with nil creationDate: %@", buf, 0xCu);
          }

        }
        v34 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "scopedIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("Attempted to pull a CPLMemory %@ with nil creationDate. \n\nSee rdar://problem/81107309"), v35);
        v32 = (id)objc_claimAutoreleasedReturnValue();

        v36 = CFSTR("TTR: CPLMemory with nil creationDate");
        goto LABEL_33;
      }
      objc_msgSend(v10, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v10;
            _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_FAULT, "Skipping CPLMemory record with nil title: %@", buf, 0xCu);
          }

        }
        v38 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "scopedIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR("Attempted to pull a CPLMemory %@ with nil title. \n\nSee rdar://problem/81107309"), v39);
        v32 = (id)objc_claimAutoreleasedReturnValue();

        v36 = CFSTR("TTR: CPLMemory with nil title");
LABEL_33:
        +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Cloud Photo Library state detected"), CFSTR("Please file a Radar against Photos"), v36, v32);
        v17 = (void *)v14;
        goto LABEL_48;
      }
      v52 = v11;
      v17 = (void *)v14;
      if (!v14)
      {
        objc_msgSend(v7, "managedObjectContext");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "subtitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "creationDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLMemory insertIntoContext:withUUID:title:subtitle:creationDate:](PLMemory, "insertIntoContext:withUUID:title:subtitle:creationDate:", v18, v13, v19, v20, v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v60 = v17;
            v61 = 2112;
            v62 = v10;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Created new local memory %@ with cloud memory %@", buf, 0x16u);
          }

        }
        v8 = v48;
        v7 = v49;
      }
      v23 = objc_msgSend(v17, "updateWithCPLMemoryChange:inPhotoLibrary:", v10, v7);
      WeakRetained = objc_loadWeakRetained(location);
      v25 = objc_msgSend(WeakRetained, "deviceLibraryConfiguration") - 3;

      if (v25 < 0xFFFFFFFFFFFFFFFELL || (v23 & 1) != 0)
      {
        v11 = v52;
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v60 = v17;
            v61 = 2112;
            v62 = v10;
            _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "Updating local memory %@ with cloud memory %@", buf, 0x16u);
          }

        }
        if ((unsigned __int16)objc_msgSend(v10, "graphVersion") < 0x301u)
        {
          objc_msgSend(v17, "creationDate");
          v32 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (-[PLCloudBatchDownloader _shouldHandleNotificationChangeForMemory:memoryRecord:wasPersisted:](v47, "_shouldHandleNotificationChangeForMemory:memoryRecord:wasPersisted:", v17, v10, v14 != 0))
          {
            objc_msgSend(v45, "addObject:", v17);
          }
          objc_msgSend(v17, "creationDate");
          v32 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isUserCreatedMemory") & 1) == 0)
          {
            if (!v46 || objc_msgSend(v32, "compare:", v46) == 1)
            {
              v32 = v32;

              v46 = v32;
            }
            v11 = v52;
          }
        }
        -[PLCloudDownloadBatchDetails setNeedsWidgetTimelineReload:](v50, "setNeedsWidgetTimelineReload:", 1);
      }
      else
      {
        v11 = v52;
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v17, "uuid");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_loadWeakRetained(location);
            v29 = objc_msgSend(v28, "deviceLibraryConfiguration");
            v30 = CFSTR("unknown");
            if (v29 <= 2)
              v30 = off_1E366BE48[v29];
            v31 = v30;
            *(_DWORD *)buf = 138412802;
            v60 = v27;
            v61 = 2112;
            v62 = v10;
            v63 = 2112;
            v64 = v31;
            _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Deleting local memory %@ for cloud memory %@ in limited device-library configuration: %@", buf, 0x20u);

            v11 = v52;
          }

        }
        objc_msgSend(v7, "managedObjectContext");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "deleteObject:", v17);
      }
LABEL_48:

      objc_autoreleasePoolPop(v11);
    }
    v54 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  }
  while (v54);
LABEL_52:

  if (objc_msgSend(v45, "count"))
    -[PLCloudBatchDownloader _processNotificationUpdatesForMemories:](v47, "_processNotificationUpdatesForMemories:", v45);
  if (v46)
  {
    objc_msgSend(v44, "startOfDayForDate:", v46);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "dateByAddingUnit:value:toDate:options:", 16, 1, v41, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      +[PLMemory deletePendingMemoriesCreatedBefore:inPhotoLibrary:](PLMemory, "deletePendingMemoriesCreatedBefore:inPhotoLibrary:", v42, v7);

  }
  return v50;
}

- (BOOL)_shouldHandleNotificationChangeForMemory:(id)a3 memoryRecord:(id)a4 wasPersisted:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  _BYTE *v15;
  void *v16;
  unint64_t v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v30;
  uint8_t buf[4];
  _BYTE v32[14];
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "notificationState");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v7, "creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (*MEMORY[0x1E0D115D0])
      {
        LOBYTE(v20) = 0;
        goto LABEL_33;
      }
      __CPLAssetsdOSLogDomain();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v32 = v22;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Error: No creation data for memory with UUID: %@", buf, 0xCu);

      }
      LOBYTE(v20) = 0;
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isDateInToday:", v11);

    v14 = 0;
    v15 = (_BYTE *)MEMORY[0x1E0D115D0];
    if (v10 != 1 || !v13)
    {
LABEL_23:
      if (v10 == (int)objc_msgSend(v7, "notificationState") && v5)
      {
        v20 = 0;
      }
      else if (v10 == 2)
      {
        v20 = 1;
      }
      else
      {
        v20 = v14;
      }
      if (*v15)
        goto LABEL_33;
      __CPLAssetsdOSLogDomain();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "scopedIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "score");
        v27 = v26;
        objc_msgSend(v8, "creationDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v32 = v20;
        *(_WORD *)&v32[4] = 2112;
        *(_QWORD *)&v32[6] = v25;
        v33 = 2048;
        v34 = v27;
        v35 = 1024;
        v36 = v5;
        v37 = 1024;
        v38 = v13;
        v39 = 2112;
        v40 = v28;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Handling change %d, for memory %@, state %.2f, was persisted %d, created today %d, creationDate %@", buf, 0x32u);

      }
      goto LABEL_32;
    }
    objc_msgSend(v7, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v17 = +[PLMemory countOfMemoriesCreatedTodayWithNotificationStateRequestedOrSeenInPhotoLibrary:excludingMemory:error:](PLMemory, "countOfMemoriesCreatedTodayWithNotificationStateRequestedOrSeenInPhotoLibrary:excludingMemory:error:", v16, v7, &v30);
    v18 = v30;

    if (v17)
    {
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!*v15)
        {
          __CPLAssetsdOSLogDomain();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "uuid");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v32 = v24;
            _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Clearing notification state of memory %@, already have notification today", buf, 0xCu);

          }
        }
        objc_msgSend(v7, "setNotificationState:", 0);
        v14 = 0;
        goto LABEL_22;
      }
      if (!*v15)
      {
        __CPLAssetsdOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v32 = v18;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Error fetching countOfMemoriesCreatedTodayWithNotificationStateRequestedOrSeen, error: %@", buf, 0xCu);
        }

      }
    }
    v14 = 1;
LABEL_22:

    goto LABEL_23;
  }
  LOBYTE(v20) = 0;
LABEL_34:

  return v20;
}

- (id)_handleSuggestionRecords:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  id v8;
  __objc2_class **v9;
  uint64_t i;
  void *v11;
  void *v12;
  __objc2_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __objc2_class *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  __objc2_class *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  char v32;
  id WeakRetained;
  unint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  unint64_t v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  NSObject *v57;
  void *v59;
  void *v60;
  id v61;
  PLCloudDownloadBatchDetails *v62;
  void *v63;
  id v64;
  id *location;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  unint64_t v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  __CFString *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v60 = (void *)objc_opt_new();
  v59 = (void *)objc_opt_new();
  v62 = objc_alloc_init(PLCloudDownloadBatchDetails);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v8 = v6;
  v67 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  if (!v67)
  {
    v51 = 0;
    v52 = v8;
    goto LABEL_62;
  }
  v63 = 0;
  v9 = off_1E365A000;
  location = (id *)&self->_manager;
  v66 = *(_QWORD *)v69;
  v61 = v7;
  v64 = v8;
  do
  {
    for (i = 0; i != v67; ++i)
    {
      if (*(_QWORD *)v69 != v66)
        objc_enumerationMutation(v8);
      v11 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
      v12 = (void *)MEMORY[0x19AEC1554]();
      if (!-[__objc2_class shouldHandleCPLSuggestionChange:](v9[455], "shouldHandleCPLSuggestionChange:", v11))
      {
        objc_msgSend(v11, "scopedIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLSuggestion suggestionWithUUID:inPhotoLibrary:](PLSuggestion, "suggestionWithUUID:inPhotoLibrary:", v26, v7);
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          +[PLSuggestion insertIntoPhotoLibrary:withUUID:](PLSuggestion, "insertIntoPhotoLibrary:withUUID:", v7, v26);
          v27 = objc_claimAutoreleasedReturnValue();
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v73 = (unint64_t)v27;
              v74 = 2112;
              v75 = v11;
              _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "Created new local suggestion %@ with cloud suggestion %@", buf, 0x16u);
            }

          }
        }
        v32 = -[NSObject updateWithCPLSuggestionChange:inPhotoLibrary:](v27, "updateWithCPLSuggestionChange:inPhotoLibrary:", v11, v7);
        WeakRetained = objc_loadWeakRetained(location);
        v34 = objc_msgSend(WeakRetained, "deviceLibraryConfiguration") - 3;

        if (v34 >= 0xFFFFFFFFFFFFFFFELL && (v32 & 1) == 0)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject uuid](v27, "uuid");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_loadWeakRetained(location);
              v38 = objc_msgSend(v37, "deviceLibraryConfiguration");
              v39 = CFSTR("unknown");
              if (v38 <= 2)
                v39 = off_1E366BE48[v38];
              v40 = v39;
              *(_DWORD *)buf = 138412802;
              v73 = (unint64_t)v36;
              v74 = 2112;
              v75 = v11;
              v76 = 2112;
              v77 = v40;
              _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "Deleting local suggestion %@ for cloud suggestion %@ in limited device-library configuration: %@", buf, 0x20u);

              v7 = v61;
            }

          }
          objc_msgSend(v7, "managedObjectContext");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "deleteObject:", v27);
          goto LABEL_50;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v73 = (unint64_t)v27;
            v74 = 2112;
            v75 = v11;
            _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEFAULT, "Updating local suggestion %@ with cloud suggestion %@", buf, 0x16u);
          }

        }
        -[NSObject creationDate](v27, "creationDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v43;
        if (!v63 || objc_msgSend(v43, "compare:", v63) == 1)
        {
          v44 = v41;

          v63 = v44;
        }
        -[PLCloudDownloadBatchDetails setNeedsWidgetTimelineReload:](v62, "setNeedsWidgetTimelineReload:", 1);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v11, "type"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "type") == 6 && objc_msgSend(v11, "state") == 4)
        {
          objc_msgSend(v59, "objectForKeyedSubscript:", v45);
          v46 = (id)objc_claimAutoreleasedReturnValue();
          if (!v46)
          {
            v46 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v59, "setObject:forKeyedSubscript:", v46, v45);
          }
          -[NSObject keyAssets](v27, "keyAssets");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "anyObject");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            objc_msgSend(v46, "addObject:", v49);
            goto LABEL_47;
          }
          v7 = v61;
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v73 = (unint64_t)v26;
              _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_ERROR, "Unexpectedly found no key asset for suggestion %@", buf, 0xCu);
            }

LABEL_47:
            v7 = v61;
          }

        }
        else
        {
          objc_msgSend(v60, "addObject:", v45);
        }

LABEL_50:
        v8 = v64;
LABEL_51:

        goto LABEL_52;
      }
      v13 = v9[455];
      objc_msgSend(v11, "scopedIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "managedObjectContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[__objc2_class userFeedbackWithUUID:inManagedObjectContext:](v13, "userFeedbackWithUUID:inManagedObjectContext:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = v9[455];
        objc_msgSend(v7, "managedObjectContext");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scopedIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[__objc2_class insertIntoManagedObjectContext:withUUID:](v18, "insertIntoManagedObjectContext:withUUID:", v19, v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setCreationType:", 2);
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v17, "detailedDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v73 = (unint64_t)v23;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Created new local user feedback %@", buf, 0xCu);

          }
        }
      }
      v24 = v9[455];
      objc_msgSend(v7, "managedObjectContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[__objc2_class updateUserFeedback:withCPLSuggestionChange:inManagedObjectContext:](v24, "updateUserFeedback:withCPLSuggestionChange:inManagedObjectContext:", v17, v11, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v26, "detailedDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "cplFullDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v73 = (unint64_t)v28;
          v74 = 2112;
          v75 = v29;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Updated new local user feedback %@ with cloud suggestion %@", buf, 0x16u);

        }
        goto LABEL_51;
      }
LABEL_52:

      objc_autoreleasePoolPop(v12);
      v9 = off_1E365A000;
    }
    v67 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  }
  while (v67);

  v51 = v63;
  if (v63)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "startOfDayForDate:", v63);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "dateByAddingUnit:value:toDate:options:", 16, 1, v53, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      objc_msgSend(v7, "managedObjectContext");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = +[PLSuggestion deletePendingSuggestionsCreatedBefore:withTypes:andRejectedAssetsBySuggestionType:inManagedObjectContext:](PLSuggestion, "deletePendingSuggestionsCreatedBefore:withTypes:andRejectedAssetsBySuggestionType:inManagedObjectContext:", v54, v60, v59, v55);

      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v73 = v56;
          _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_DEFAULT, "Deleted %lu pending suggestions", buf, 0xCu);
        }

      }
    }

LABEL_62:
  }

  return v62;
}

- (void)_handleSocialGroupRecords:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v7)
  {
    v9 = v7;
    v25 = *(_QWORD *)v27;
    *(_QWORD *)&v8 = 138412290;
    v23 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v11, "scopedIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "managedObjectContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLGraphNode graphNodeWithUUID:inManagedObjectContext:](PLGraphNode, "graphNodeWithUUID:inManagedObjectContext:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLGraphNodeContainer, "newNodeContainerWithNode:", v16);
        }
        else
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v31 = v11;
              _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Inserting new local socialGroup since we did not find one with the same identifier %@", buf, 0xCu);
            }

          }
          objc_msgSend(v6, "managedObjectContext", v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = +[PLSocialGroup newNodeContainerWithManagedObjectContext:](PLSocialGroup, "newNodeContainerWithManagedObjectContext:", v19);

          objc_msgSend(v11, "scopedIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setUuid:", v21);

        }
        objc_msgSend(v17, "updateSocialGroupwithCPLSocialGroupChange:inPhotoLibrary:", v11, v6, v23);
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v31 = v17;
            v32 = 2112;
            v33 = v11;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Insert/update local socialGroup %@ with cloud socialGroup %@", buf, 0x16u);
          }

        }
        objc_autoreleasePoolPop(v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v9);
  }

}

- (void)_processNotificationUpdatesForMemories:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "photoLibrary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "notificationState") == 1)
        {
          +[PLNotificationManager _notificationDeliveryDate](PLNotificationManager, "_notificationDeliveryDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "postNotificationForInterestingMemoryWithMemoryUUID:library:notificationDeliveryDate:", v10, v9, v11);

        }
        else
        {
          if (objc_msgSend(v8, "notificationState") != 2)
            goto LABEL_11;
          +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeNotificationForInterestingMemoryWithUUID:", v10);
        }

LABEL_11:
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)_mergeUpdatedPersons:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x19AEC1554](v9);
        -[PLCloudBatchDownloader _mergeExistingPersonsWithPerson:inPhotoLibrary:](self, "_mergeExistingPersonsWithPerson:inPhotoLibrary:", v13, v7, (_QWORD)v15);
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v10 = v9;
    }
    while (v9);
  }

}

- (void)_handleFaceCropRecords:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = (_BYTE *)MEMORY[0x1E0D115D0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v13, "resourceData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          +[PLFaceCrop insertOrUpdateWithCPLFaceCrop:inPhotoLibrary:](PLFaceCrop, "insertOrUpdateWithCPLFaceCrop:inPhotoLibrary:", v13, v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (*v11)
          {
            v16 = 0;
            goto LABEL_16;
          }
          __CPLAssetsdOSLogDomain();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v13;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Skipping faceCrop without resource data %@", buf, 0xCu);
          }

          v16 = 0;
        }
        if (!*v11)
        {
          __CPLAssetsdOSLogDomain();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v25 = v16;
            v26 = 2112;
            v27 = v13;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "insert/update local faceCrop %@ with cloud faceCrop %@", buf, 0x16u);
          }

        }
LABEL_16:

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v9 != v12);
      v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      v9 = v19;
    }
    while (v19);
  }

}

- (void)_handleDeleteRecords:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  char v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  SEL v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  _QWORD v80[4];
  id v81;
  NSObject *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  NSObject *v88;
  uint8_t buf[4];
  NSObject *v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "count"))
    goto LABEL_148;
  v69 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[CPL]Syncing batch downloaded from cloud: deleting local asset to match iCloud Library"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v8);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v71 = v6;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (!v10)
    goto LABEL_134;
  v11 = v10;
  v12 = *(_QWORD *)v84;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v84 != v12)
        objc_enumerationMutation(v9);
      v14 = *(NSObject **)(*((_QWORD *)&v83 + 1) + 8 * v13);
      -[NSObject scopedIdentifier](v14, "scopedIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject identifier](v15, "identifier");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        if (*MEMORY[0x1E0D115D0])
          goto LABEL_41;
        __CPLAssetsdOSLogDomain();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v90 = v14;
          v24 = v23;
          v25 = OS_LOG_TYPE_DEFAULT;
          v26 = "Skipping deleting a CPLRecordChange %@ without identifier";
          goto LABEL_23;
        }
LABEL_24:

        goto LABEL_41;
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v90 = v15;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Trying to delete %@", buf, 0xCu);
        }

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[PLGenericAlbum albumWithCloudGUID:inLibrary:](PLGenericAlbum, "albumWithCloudGUID:inLibrary:", v16, v7);
        v18 = objc_claimAutoreleasedReturnValue();
        if ((-[NSObject isEqualToString:](v16, "isEqualToString:", CFSTR("----Project-Root-Folder----")) & 1) != 0
          || -[NSObject isEqualToString:](v16, "isEqualToString:", CFSTR("----Root-Folder----")))
        {
          if (*MEMORY[0x1E0D115D0])
            goto LABEL_40;
          __CPLAssetsdOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            goto LABEL_19;
          *(_DWORD *)buf = 138543362;
          v90 = v16;
          v20 = v19;
          v21 = OS_LOG_TYPE_ERROR;
          v22 = "Root folder deletion record should not exist, cloudGUID = %{public}@";
          goto LABEL_18;
        }
        if (v18)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v18;
              _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "Found album %@ to delete", buf, 0xCu);
            }

          }
          -[NSObject delete](v18, "delete");
          goto LABEL_40;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            goto LABEL_19;
          *(_DWORD *)buf = 138543362;
          v90 = v16;
          v20 = v19;
          v21 = OS_LOG_TYPE_DEFAULT;
          v22 = "Could not find album with UUID %{public}@ to delete. Skipping";
          goto LABEL_18;
        }
LABEL_40:

        goto LABEL_41;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v15, v7, 1);
        v27 = objc_claimAutoreleasedReturnValue();
        v18 = v27;
        if (v27)
        {
          -[NSObject allAssetCPLResources](v27, "allAssetCPLResources");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLCloudBatchDownloader _triggerBackgroundDownloadFailureForResources:](self, "_triggerBackgroundDownloadFailureForResources:", v28);

          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v18;
              _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "Found asset %@ to delete", buf, 0xCu);
            }

          }
          -[NSObject deleteWithReason:](v18, "deleteWithReason:", v73);
          goto LABEL_40;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            goto LABEL_19;
          *(_DWORD *)buf = 138412290;
          v90 = v16;
          v20 = v19;
          v21 = OS_LOG_TYPE_DEFAULT;
          v22 = "Could not find asset with UUID %@ to delete. Skipping";
          goto LABEL_18;
        }
        goto LABEL_40;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v72, "addObject:", v15);
        goto LABEL_41;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "managedObjectContext");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v16, v31);
        v32 = objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v32;
              _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "Found person %@ to delete", buf, 0xCu);
            }

          }
          -[PLCloudBatchDownloader _saveIfNeeded:](self, "_saveIfNeeded:", v7);
          objc_msgSend(v7, "libraryServicesManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "databaseContext");
          v35 = objc_claimAutoreleasedReturnValue();

          if (!v35)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", v69, self, CFSTR("PLCloudBatchDownloader.m"), 1235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseContext"));

          }
          v36 = (void *)-[NSObject newShortLivedLibraryWithName:](v35, "newShortLivedLibraryWithName:", "-[PLCloudBatchDownloader _handleDeleteRecords:inLibrary:]");
          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = __57__PLCloudBatchDownloader__handleDeleteRecords_inLibrary___block_invoke;
          v80[3] = &unk_1E3677C18;
          v81 = v36;
          v82 = v32;
          v37 = v36;
          -[NSObject performTransactionAndWait:](v37, "performTransactionAndWait:", v80);

          goto LABEL_96;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v90 = v16;
            _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "Could not find person with UUID %@ to delete. Skipping", buf, 0xCu);
          }
          goto LABEL_97;
        }
        goto LABEL_98;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[PLMemory memoryWithUUID:inPhotoLibrary:](PLMemory, "memoryWithUUID:inPhotoLibrary:", v16, v7);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              goto LABEL_59;
            goto LABEL_61;
          }
          goto LABEL_62;
        }
        if (*MEMORY[0x1E0D115D0])
          goto LABEL_40;
        __CPLAssetsdOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 138412290;
        v90 = v16;
        v20 = v19;
        v21 = OS_LOG_TYPE_DEFAULT;
        v22 = "Could not find Memory with UUID %@ to delete. Skipping";
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "managedObjectContext");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLUserFeedback userFeedbackWithUUID:inManagedObjectContext:](PLUserFeedback, "userFeedbackWithUUID:inManagedObjectContext:", v16, v41);
        v32 = objc_claimAutoreleasedReturnValue();

        +[PLSuggestion suggestionWithUUID:inPhotoLibrary:](PLSuggestion, "suggestionWithUUID:inPhotoLibrary:", v16, v7);
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v35;
              _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEFAULT, "Deleting %@", buf, 0xCu);
            }

          }
          objc_msgSend(v7, "managedObjectContext");
          v43 = objc_claimAutoreleasedReturnValue();
          v37 = v43;
          v44 = v35;
          goto LABEL_95;
        }
        if (v32)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v32;
              _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_DEFAULT, "Deleting %@", buf, 0xCu);
            }

          }
          objc_msgSend(v7, "managedObjectContext");
          v43 = objc_claimAutoreleasedReturnValue();
          v37 = v43;
          v44 = v32;
LABEL_95:
          -[NSObject deleteObject:](v43, "deleteObject:", v44);
LABEL_96:

        }
        else if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v90 = v16;
            _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "Could not find Suggetion or UserFeedback with UUID %@ to delete. Skipping", buf, 0xCu);
          }
          goto LABEL_96;
        }
LABEL_97:

LABEL_98:
        goto LABEL_41;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "managedObjectContext");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLGraphNode graphNodeWithUUID:inManagedObjectContext:](PLGraphNode, "graphNodeWithUUID:inManagedObjectContext:", v16, v45);
        v18 = objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v18;
              v39 = v38;
              v40 = "Deleting social group node: %@";
LABEL_60:
              _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);
            }
            goto LABEL_61;
          }
          goto LABEL_62;
        }
        if (*MEMORY[0x1E0D115D0])
          goto LABEL_40;
        __CPLAssetsdOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 138412290;
        v90 = v16;
        v20 = v19;
        v21 = OS_LOG_TYPE_DEFAULT;
        v22 = "Could not find SocialGroup with UUID %@ to delete. Skipping";
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v88 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLFaceCrop faceCropsWithUUIDs:inPhotoLibrary:](PLFaceCrop, "faceCropsWithUUIDs:inPhotoLibrary:", v46, v7);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "firstObject");
        v18 = objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
LABEL_59:
              *(_DWORD *)buf = 138412290;
              v90 = v18;
              v39 = v38;
              v40 = "Deleting %@";
              goto LABEL_60;
            }
LABEL_61:

          }
LABEL_62:
          objc_msgSend(v7, "managedObjectContext");
          v19 = objc_claimAutoreleasedReturnValue();
          -[NSObject deleteObject:](v19, "deleteObject:", v18);
LABEL_19:

          goto LABEL_40;
        }
        if (*MEMORY[0x1E0D115D0])
          goto LABEL_40;
        __CPLAssetsdOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 138412290;
        v90 = v16;
        v20 = v19;
        v21 = OS_LOG_TYPE_DEFAULT;
        v22 = "Could not find FaceCrop with UUID %@ to delete. Skipping";
LABEL_18:
        _os_log_impl(&dword_199541000, v20, v21, v22, buf, 0xCu);
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSObject scopeIdentifier](v14, "scopeIdentifier");
        v49 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "managedObjectContext");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (void *)v49;
        +[PLShare shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:](PLShare, "shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:", v49, 1, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v51, "compactDescription");
                v53 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v90 = v53;
                _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_DEFAULT, "Trashing %@", buf, 0xCu);

              }
            }
            objc_msgSend(v51, "trash");
            goto LABEL_132;
          }
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v51, "compactDescription");
              v56 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v90 = v56;
              _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_DEFAULT, "Deleting %@", buf, 0xCu);

            }
          }
          v79 = 0;
          v57 = objc_msgSend(v51, "incrementallyDeleteAndSaveWithError:", &v79);
          v54 = v79;
          if ((v57 & 1) == 0 && !*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v54;
              _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_ERROR, "Failed to prepare assets for scope deletion: %@", buf, 0xCu);
            }

          }
LABEL_131:

        }
        else if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v90 = v15;
            _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_DEFAULT, "Cound not find share with scopeIdentifier %@", buf, 0xCu);
          }
          goto LABEL_131;
        }
LABEL_132:

        goto LABEL_41;
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v90 = v14;
          v24 = v23;
          v25 = OS_LOG_TYPE_ERROR;
          v26 = "Ignoring unsupported record type for deletion: %@";
LABEL_23:
          _os_log_impl(&dword_199541000, v24, v25, v26, buf, 0xCu);
        }
        goto LABEL_24;
      }
LABEL_41:

      ++v13;
    }
    while (v11 != v13);
    v60 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    v11 = v60;
  }
  while (v60);
LABEL_134:

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v61 = v72;
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v76 != v64)
          objc_enumerationMutation(v61);
        v66 = *(NSObject **)(*((_QWORD *)&v75 + 1) + 8 * i);
        +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", v66, 0, v7);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (v67)
        {
          +[PLCloudMaster deleteMasterIfNecessary:inLibrary:](PLCloudMaster, "deleteMasterIfNecessary:inLibrary:", v67, v7);
        }
        else if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v90 = v66;
            _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_DEBUG, "Unable to find master %@ to delete", buf, 0xCu);
          }

        }
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    }
    while (v63);
  }

  v6 = v71;
LABEL_148:

}

- (void)_handleExpungedRecords:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _UNKNOWN **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0x1E0D11000uLL;
    v11 = &off_1E3659000;
    v23 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v13, "scopedIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11[476], "assetWithScopedIdentifier:inLibrary:prefetchResources:", v15, v6, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17 && objc_msgSend(v17, "trashedState") != 2)
            objc_msgSend(v18, "expunge");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[PLGenericAlbum albumWithCloudGUID:inLibrary:](PLGenericAlbum, "albumWithCloudGUID:inLibrary:", v16, v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v19;
            if (v19 && objc_msgSend(v19, "trashedState") != 2)
              objc_msgSend(v18, "applyTrashedState:cascade:", 2, 0);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_19;
            v20 = v10;
            v21 = v7;
            objc_msgSend(v6, "managedObjectContext");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v16, v22);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              objc_msgSend(v18, "deletePersonWithReason:", 4);
            v7 = v21;
            v10 = v20;
            v11 = &off_1E3659000;
          }
        }

LABEL_19:
        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

}

- (id)_debugPrintAlbumOrderForAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t k;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v10, "albums");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v35 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
              if ((objc_msgSend(v16, "isCameraAlbum") & 1) == 0 && !objc_msgSend(v16, "trashedState"))
                objc_msgSend(v4, "addObject:", v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v7);
  }
  v28 = v5;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    v20 = &stru_1E36789C0;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
        objc_msgSend(v22, "title");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cloudGUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingFormat:](v20, "stringByAppendingFormat:", CFSTR("Album Title: %@ cloudGUID: %@\n"), v23, v24, v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "descriptionOfAssetOrderValues");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByAppendingFormat:", CFSTR("%@\n"), v26);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v18);
  }
  else
  {
    v20 = &stru_1E36789C0;
  }

  return v20;
}

- (void)_handleRelationsForAssetRecords:(id)a3 inLibrary:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t j;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  PLTransientOrderKey *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t n;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t ii;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  NSObject *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  id obj;
  void *context;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  uint8_t v128[128];
  uint8_t buf[4];
  uint64_t v130;
  __int16 v131;
  _BYTE v132[14];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _QWORD v138[4];

  v138[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v91 = a4;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v130 = (uint64_t)v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Setting relations for asset records %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("scopedIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  v138[0] = CFSTR("albums");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)v7;
  +[PLManagedAsset assetsWithScopedIdentifiers:prefetchResources:relationshipKeyPathsForPrefetching:inLibrary:](PLManagedAsset, "assetsWithScopedIdentifiers:prefetchResources:relationshipKeyPathsForPrefetching:inLibrary:", v7, 0, v8, v91);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v137, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v124;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v124 != v13)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * i), "containerRelations");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v15, "_pl_map:", &__block_literal_global_132_36846);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "unionSet:", v18);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v137, 16);
    }
    while (v12);
  }

  v85 = v10;
  objc_msgSend(v10, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumsWithCloudGUIDs:inLibrary:](PLManagedAlbum, "albumsWithCloudGUIDs:inLibrary:", v19, v91);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = v20;
  objc_msgSend(v20, "_pl_indexBy:", &__block_literal_global_135);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v88 = v9;
  v21 = v87;
  v92 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v119, v136, 16);
  if (v92)
  {
    v90 = *(_QWORD *)v120;
    do
    {
      for (j = 0; j != v92; j = v66 + 1)
      {
        if (*(_QWORD *)v120 != v90)
          objc_enumerationMutation(v88);
        v95 = j;
        v23 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
        context = (void *)MEMORY[0x19AEC1554]();
        v115 = 0u;
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        v24 = obj;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v115, v135, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v116;
LABEL_19:
          v28 = 0;
          while (1)
          {
            if (*(_QWORD *)v116 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v28);
            objc_msgSend(v29, "scopedIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "scopedIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "isEqual:", v31);

            if ((v32 & 1) != 0)
              break;
            if (v26 == ++v28)
            {
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v115, v135, 16);
              if (!v26)
                goto LABEL_25;
              goto LABEL_19;
            }
          }
          v33 = v29;

          if (v33)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = 0u;
            v112 = 0u;
            v113 = 0u;
            v114 = 0u;
            objc_msgSend(v23, "albums");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v111, v134, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v112;
              do
              {
                for (k = 0; k != v37; ++k)
                {
                  if (*(_QWORD *)v112 != v38)
                    objc_enumerationMutation(v35);
                  objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * k), "cloudGUID");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v40)
                    objc_msgSend(v34, "addObject:", v40);

                }
                v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v111, v134, 16);
              }
              while (v37);
            }

            v89 = v33;
            -[NSObject containerRelations](v33, "containerRelations");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = 0u;
            v108 = 0u;
            v109 = 0u;
            v110 = 0u;
            v96 = v41;
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v107, v133, 16);
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v108;
              do
              {
                for (m = 0; m != v43; ++m)
                {
                  if (*(_QWORD *)v108 != v44)
                    objc_enumerationMutation(v96);
                  v46 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * m);
                  objc_msgSend(v46, "containerIdentifier");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v47)
                  {
                    v48 = objc_msgSend(v46, "position");
                    objc_msgSend(v98, "objectForKeyedSubscript:", v47);
                    v49 = objc_claimAutoreleasedReturnValue();
                    if (v49)
                    {
                      if (objc_msgSend(v46, "isKeyAsset"))
                      {
                        -[NSObject customKeyAsset](v49, "customKeyAsset");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v50 != v23)
                        {
                          if (!*MEMORY[0x1E0D115D0])
                          {
                            __CPLAssetsdOSLogDomain();
                            v51 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                            {
                              objc_msgSend(v23, "cloudAssetGUID");
                              v52 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138412546;
                              v130 = (uint64_t)v52;
                              v131 = 2112;
                              *(_QWORD *)v132 = v47;
                              _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_DEFAULT, "setting custom key asset %@ for album %@", buf, 0x16u);

                            }
                          }
                          -[NSObject setCustomKeyAsset:](v49, "setCustomKeyAsset:", v23);
                        }
                      }
                      if (!*MEMORY[0x1E0D115D0])
                      {
                        __CPLAssetsdOSLogDomain();
                        v53 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                        {
                          objc_msgSend(v23, "cloudAssetGUID");
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412802;
                          v130 = (uint64_t)v54;
                          v131 = 1024;
                          *(_DWORD *)v132 = v48;
                          *(_WORD *)&v132[4] = 2112;
                          *(_QWORD *)&v132[6] = v47;
                          _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_DEBUG, "Received asset %@ with position: %d for album: %@", buf, 0x1Cu);

                        }
                      }
                      v55 = objc_alloc_init(PLTransientOrderKey);
                      -[PLTransientOrderKey setOrderValue:](v55, "setOrderValue:", v48);
                      objc_msgSend(v23, "objectID");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PLTransientOrderKey setObjectID:](v55, "setObjectID:", v56);

                      -[NSObject objectID](v49, "objectID");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v97, "objectForKey:", v57);
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v58)
                      {
                        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v97, "setObject:forKey:", v58, v57);
                      }
                      objc_msgSend(v58, "addObject:", v55);

                      goto LABEL_63;
                    }
                    if (!*MEMORY[0x1E0D115D0])
                    {
                      __CPLAssetsdOSLogDomain();
                      v55 = (PLTransientOrderKey *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(&v55->super, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v130 = (uint64_t)v46;
                        _os_log_impl(&dword_199541000, &v55->super, OS_LOG_TYPE_DEFAULT, "Unable to find an album for the container relation %@", buf, 0xCu);
                      }
LABEL_63:

                    }
                    objc_msgSend(v34, "removeObject:", v47);
                    goto LABEL_65;
                  }
                  if (*MEMORY[0x1E0D115D0])
                    goto LABEL_66;
                  __CPLAssetsdOSLogDomain();
                  v49 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v130 = (uint64_t)v46;
                    _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "Found container relation %@ without container identifier, skipping", buf, 0xCu);
                  }
LABEL_65:

LABEL_66:
                }
                v43 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v107, v133, 16);
              }
              while (v43);
            }
            v105 = 0u;
            v106 = 0u;
            v103 = 0u;
            v104 = 0u;
            v59 = v34;
            v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v103, v128, 16);
            v21 = v87;
            if (v60)
            {
              v61 = v60;
              v62 = *(_QWORD *)v104;
              do
              {
                for (n = 0; n != v61; ++n)
                {
                  if (*(_QWORD *)v104 != v62)
                    objc_enumerationMutation(v59);
                  v64 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * n);
                  objc_msgSend(v87, "objectForKey:", v64);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v65)
                  {
                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "setObject:forKey:", v65, v64);
                  }
                  objc_msgSend(v65, "addObject:", v23);

                }
                v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v103, v128, 16);
              }
              while (v61);
            }

            v66 = v95;
            v67 = v89;
            goto LABEL_81;
          }
        }
        else
        {
LABEL_25:

        }
        v66 = v95;
        if (*MEMORY[0x1E0D115D0])
          goto LABEL_82;
        __CPLAssetsdOSLogDomain();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v23, "scopedIdentifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v130 = (uint64_t)v68;
          _os_log_impl(&dword_199541000, v67, OS_LOG_TYPE_DEBUG, "Can't find CPLAssetChange matching asset scopedIdentifier %@, ignoring asset", buf, 0xCu);

        }
LABEL_81:

LABEL_82:
        objc_autoreleasePoolPop(context);
      }
      v92 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v119, v136, 16);
    }
    while (v92);
  }

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v69 = v21;
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v99, v127, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v100;
    do
    {
      for (ii = 0; ii != v71; ++ii)
      {
        if (*(_QWORD *)v100 != v72)
          objc_enumerationMutation(v69);
        v74 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * ii);
        +[PLGenericAlbum albumWithCloudGUID:inLibrary:](PLManagedAlbum, "albumWithCloudGUID:inLibrary:", v74, v91);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v75;
        if (v75 && (objc_msgSend(v75, "isCameraAlbum") & 1) == 0)
        {
          objc_msgSend(v69, "objectForKey:", v74);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v78 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                v79 = objc_msgSend(v77, "count");
                *(_DWORD *)buf = 134218242;
                v130 = v79;
                v131 = 2112;
                *(_QWORD *)v132 = v74;
                _os_log_impl(&dword_199541000, v78, OS_LOG_TYPE_DEFAULT, "Removing %lu assets from album %@", buf, 0x16u);
              }

            }
            objc_msgSend(v76, "mutableAssets");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "removeObjectsInArray:", v77);

          }
        }

      }
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v99, v127, 16);
    }
    while (v71);
  }

  if (objc_msgSend(v97, "count"))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v130 = (uint64_t)v97;
        _os_log_impl(&dword_199541000, v81, OS_LOG_TYPE_DEBUG, "Update album assets order with %@", buf, 0xCu);
      }

    }
    objc_msgSend(v91, "libraryServicesManager");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "relationshipOrderKeyManager");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v83, "updateAlbumAssetsUsingTransientOrdersByAlbumOID:inLibrary:", v97, v91);
  }

}

- (void)_handleRelationsForAlbumRecords:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v12, "scopedIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(CFSTR("----Root-Folder----"), "isEqualToString:", v15) & 1) == 0
          && (objc_msgSend(CFSTR("----Project-Root-Folder----"), "isEqualToString:", v15) & 1) == 0)
        {
          +[PLGenericAlbum albumWithCloudGUID:inLibrary:](PLGenericAlbum, "albumWithCloudGUID:inLibrary:", v15, v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "updateAlbumFolderRelation:inLibrary:", v12, v6);
          }
          else if (!*MEMORY[0x1E0D115D0])
          {
            v18 = v7;
            v19 = v6;
            __CPLAssetsdOSLogDomain();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v26 = v15;
              v27 = 2112;
              v28 = v12;
              _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Can't find album with id %@, ignoring record %@", buf, 0x16u);
            }

            v6 = v19;
            v7 = v18;
          }

        }
        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v9);
  }

}

- (id)deletedRecordsFromBatch:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "changeType", (_QWORD)v13) & 0x400) != 0)
        {
          objc_msgSend(v10, "scopedIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)handleIncomingBatch:(id)a3
{
  id v4;
  PLCloudDownloadBatchDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  PLLibrarySyncContext *v9;
  void *v10;
  uint64_t v11;
  id v12;
  PLCloudDownloadBatchDetails *v13;
  PLLibrarySyncContext *v14;
  id v15;
  id v16;
  void *v17;
  PLCloudDownloadBatchDetails *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  PLCloudBatchDownloader *v26;
  id v27;
  PLCloudDownloadBatchDetails *v28;
  PLLibrarySyncContext *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;

  v4 = a3;
  v5 = objc_alloc_init(PLCloudDownloadBatchDetails);
  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudBatchDownloader handleIncomingBatch:]");

  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalOnlyDelete:", 1);

  v9 = -[PLLibrarySyncContext initWithPhotoLibrary:]([PLLibrarySyncContext alloc], "initWithPhotoLibrary:", v7);
  -[PLLibrarySyncContext recordOrganizer](v9, "recordOrganizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__36784;
  v31[4] = __Block_byref_object_dispose__36785;
  v32 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __46__PLCloudBatchDownloader_handleIncomingBatch___block_invoke;
  v23[3] = &unk_1E3675B18;
  v12 = v4;
  v24 = v12;
  v25 = v10;
  v26 = self;
  v27 = v7;
  v13 = v5;
  v28 = v13;
  v14 = v9;
  v29 = v14;
  v30 = v31;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __46__PLCloudBatchDownloader_handleIncomingBatch___block_invoke_2;
  v20[3] = &unk_1E3677530;
  v20[4] = self;
  v15 = v25;
  v21 = v15;
  v16 = v27;
  v22 = v16;
  objc_msgSend(v16, "performTransactionAndWait:completionHandler:", v23, v20);
  v17 = v22;
  v18 = v13;

  _Block_object_dispose(v31, 8);
  return v18;
}

- (void)_triggerBackgroundDownloadFailureForResources:(id)a3
{
  PLCloudPhotoLibraryManager **p_manager;
  id v4;
  id WeakRetained;

  p_manager = &self->_manager;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manager);
  +[PLInternalResource triggerBackgroundDownloadFailureForResources:cloudPhotoLibraryManager:](PLInternalResource, "triggerBackgroundDownloadFailureForResources:cloudPhotoLibraryManager:", v4, WeakRetained);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsm, 0);
  objc_destroyWeak((id *)&self->_manager);
}

void __46__PLCloudBatchDownloader_handleIncomingBatch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  char v34;

  objc_msgSend(*(id *)(a1 + 32), "records");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "organizeRecords:", v2);
  v3 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "scopeRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_handleScopeChanges:inLibrary:", v4, *(_QWORD *)(a1 + 56));

  v34 = 0;
  v5 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "personRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handlePersonRecords:inLibrary:includesTiboSchema:", v6, *(_QWORD *)(a1 + 56), &v34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
    objc_msgSend(*(id *)(a1 + 48), "_dropDeferredRebuildFacesInPhotoLibrary:", *(_QWORD *)(a1 + 56));
  v8 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "albumRecords");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_handleAlbumRecords:inLibrary:", v9, *(_QWORD *)(a1 + 56));

  v10 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "masterRecords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_handleMasterRecords:inLibrary:", v11, *(_QWORD *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 64), "unionBatchDetails:", v12);
  v13 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "assetRecords");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 72);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v17 + 40);
  objc_msgSend(v13, "_handleAssetRecords:inSyncContext:withChangeBatch:insertedAssetUUIDs:", v14, v16, v15, &obj);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v17 + 40), obj);

  objc_msgSend(*(id *)(a1 + 64), "unionBatchDetails:", v18);
  v19 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "memoryRecords");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_handleMemoryRecords:inLibrary:", v20, *(_QWORD *)(a1 + 56));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 64), "unionBatchDetails:", v21);
  v22 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "faceCropRecords");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_handleFaceCropRecords:inLibrary:", v23, *(_QWORD *)(a1 + 56));

  v24 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "suggestionRecords");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_handleSuggestionRecords:inLibrary:", v25, *(_QWORD *)(a1 + 56));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 64), "unionBatchDetails:", v26);
  objc_msgSend(*(id *)(a1 + 48), "_mergeUpdatedPersons:inLibrary:", v7, *(_QWORD *)(a1 + 56));
  v27 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "socialGroupRecords");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_handleSocialGroupRecords:inLibrary:", v28, *(_QWORD *)(a1 + 56));

  v29 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "deleteRecords");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_handleDeleteRecords:inLibrary:", v30, *(_QWORD *)(a1 + 56));

  v31 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "expungedRecords");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_handleExpungedRecords:inLibrary:", v32, *(_QWORD *)(a1 + 56));

}

void __46__PLCloudBatchDownloader_handleIncomingBatch___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "assetRecordsWithContainerChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleRelationsForAssetRecords:inLibrary:", v3, *(_QWORD *)(a1 + 48));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "albumRecordsWithContainerChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_handleRelationsForAlbumRecords:inLibrary:", v5, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v7 = objc_msgSend(v6, "save:", &v18);
  v8 = v18;

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "relationshipOrderKeyManager");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    v12 = -[NSObject writeStashedLocationValuesInContext:error:](v10, "writeStashedLocationValuesInContext:error:", v11, &v17);
    v13 = v17;

    if ((v12 & 1) == 0 && !*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to save order keys: %@", buf, 0xCu);
      }

    }
LABEL_11:

    v8 = v13;
    goto LABEL_12;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to save relation records: %@", buf, 0xCu);
    }
    v13 = v8;
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset clearImportSessionObjectIDCacheOnManagedObjectContext:](PLManagedAsset, "clearImportSessionObjectIDCacheOnManagedObjectContext:", v15);

  objc_msgSend(*(id *)(a1 + 48), "libraryBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "touch");

}

uint64_t __68__PLCloudBatchDownloader__handleRelationsForAssetRecords_inLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudGUID");
}

uint64_t __68__PLCloudBatchDownloader__handleRelationsForAssetRecords_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containerIdentifier");
}

void __57__PLCloudBatchDownloader__handleDeleteRecords_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v4)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v4;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Deleting %@ in transient moc", buf, 0xCu);
      }

    }
    objc_msgSend(v4, "deletePersonWithReason:", 4);
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch transient person %@ to delete in transient moc: %@", buf, 0x16u);
    }

  }
}

id __95__PLCloudBatchDownloader__handleAssetRecords_inSyncContext_withChangeBatch_insertedAssetUUIDs___block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (_BYTE *)MEMORY[0x1E0D115D0];
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v6 = *(_QWORD *)(a1 + 40);
        v10 = 138412546;
        v11 = v5;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Can't find the master %@ for asset %@ in Photos db or in the batch. Checking batch additionalRecords", (uint8_t *)&v10, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "_findMaster:fromAdditionalRecordInBatch:inLibrary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      if (!*v3)
      {
        __CPLAssetsdOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          v10 = 138412290;
          v11 = v8;
          _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Can't find the master %@ on the additionalRecord", (uint8_t *)&v10, 0xCu);
        }

      }
      v2 = 0;
    }
  }
  return v2;
}

BOOL __95__PLCloudBatchDownloader__handleAssetRecords_inSyncContext_withChangeBatch_insertedAssetUUIDs___block_invoke_87(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "master");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "importSessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

  return v4 != 0;
}

uint64_t __95__PLCloudBatchDownloader__handleAssetRecords_inSyncContext_withChangeBatch_insertedAssetUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "importSessionID");
}

uint64_t __126__PLCloudBatchDownloader__assetsAndCloudMastersFromAssetRecords_assetsByScopedIdentifier_mastersByScopedIdentifier_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "masterScopedIdentifier");
}

void __56__PLCloudBatchDownloader__handleScopeChanges_inLibrary___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  +[PLLibraryScope insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:](PLLibraryScope, "insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Created or updated library scope %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

void __73__PLCloudBatchDownloader__mergeExistingPersonsWithPerson_inPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v3, "existingObjectWithID:error:", v4, &v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v26;

  if (v5)
  {
    v19 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v7 = objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = *(id *)(a1 + 40);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          v12 = v6;
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v13, "objectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v6;
          objc_msgSend(v3, "existingObjectWithID:error:", v14, &v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v21;

          if (v15)
          {
            -[NSObject addObject:](v7, "addObject:", v15);
          }
          else if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v13;
              v29 = 2112;
              v30 = v6;
              _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch personToMerge %@ in transient moc: %@", buf, 0x16u);
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v9);
    }

    v5 = v19;
    objc_msgSend(v19, "pickKeyFaceOptimalStateForContactDedupeWithPersons:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mergePersons:withOptimalState:", v7, v17);

LABEL_19:
    goto LABEL_20;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v28 = v18;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch merge target person %@ in transient moc: %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
LABEL_20:

}

void __76__PLCloudBatchDownloader__handlePersonRecords_inLibrary_includesTiboSchema___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v5, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v6, *(_QWORD *)(a1 + 32));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412546;
        v14 = v6;
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to find merge target person with identifier %@ for person %@", (uint8_t *)&v13, 0x16u);
      }

    }
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412546;
        v14 = v7;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Setting %@ merge target person to %@ after processing all persons", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(v7, "setCPLSyncedMergeTarget:", v9);
  }

}

+ (id)_adjustmentStateDictionaryForComparingIncomingFaceRecordForAsset:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("PLCPLAssetHasAdjustmentsKey");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "hasAdjustments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("PLCPLAssetAdjustmentFingerprintKey");
  v11[0] = v5;
  objc_msgSend(v4, "syncedAdjustmentFingerprint");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = &stru_1E36789C0;
  if (v6)
    v7 = v6;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
