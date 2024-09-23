@implementation PLDelayedSearchIndexUpdates

+ (void)recordAssetIfNeeded:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled"))
  {
    if (PLPlatformSearchSupported())
    {
      objc_msgSend(v3, "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = objc_msgSend(v3, "isEligibleForSearchIndexing");
        objc_msgSend(v3, "changedValues");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "isDeleted") & 1) == 0)
        {
          if ((v5 & 1) != 0)
            goto LABEL_9;
          if ((objc_msgSend(v3, "isInserted") & 1) != 0)
            goto LABEL_30;
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityState"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34
            || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedAssetType")),
                (v34 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
            || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hidden")),
                (v34 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {

          }
          else
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trashedState"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v35)
              goto LABEL_30;
          }
        }
        objc_msgSend(v3, "photoLibrary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "libraryServicesManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "wellKnownPhotoLibraryIdentifier");

        if (v9 != 3)
        {
          PLSearchBackendIndexStatusGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v3, "uuid");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v48 = v28;
            _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "property changes to asset: %@ indicate remove from index", buf, 0xCu);

          }
          objc_msgSend(v3, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "photoLibrary");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "managedObjectContext");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = +[PLBackgroundJobWorkItem insertDeleteFromSearchIndexWorkItemIfNeededWithIdentifier:managedObjectContext:](PLBackgroundJobWorkItem, "insertDeleteFromSearchIndexWorkItemIfNeededWithIdentifier:managedObjectContext:", v29, v31);

LABEL_29:
          objc_msgSend(v3, "photoLibrary");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "signalBackgroundProcessingNeeded");

LABEL_30:
          goto LABEL_31;
        }
        if (!v5)
          goto LABEL_30;
LABEL_9:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dateCreated"));
        v10 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("favorite"));
        v46 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kind"));
        v45 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kindSubtype"));
        v44 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("depthType"));
        v43 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("avalanchePickType"));
        v42 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playbackVariation"));
        v41 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playbackStyle"));
        v40 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibilityState"));
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v10 | v38;

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("savedAssetType"));
        v11 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hidden"));
        v12 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trashedState"));
        v13 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dayGroupHighlightBeingAssets"));
        v37 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("albums"));
        v36 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("memoriesBeingCuratedAssets"));
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("moment"));
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("libraryScope"));
        v16 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("libraryScopeContributors"));
        v17 = objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v3, "isInserted");
        if (v12)
          v19 = 1;
        else
          v19 = v18;
        if (v13)
          v19 = 1;
        if (v11)
          v19 = 1;
        if (v38)
          v19 = 1;
        v20 = v19 == 0;
        v21 = 14;
        if (v20)
          v21 = 0;
        if (v39 | v11 | v12 | v13 | v46 | v45 | v44 | v43 | v42 | v41 | v40 | v37 | v36 | v14 | v15 | v16 | v17)
          v22 = v21 | 4;
        else
          v22 = v21;
        if (!v22)
          goto LABEL_30;
        objc_msgSend(v3, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "photoLibrary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "managedObjectContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v23, v22, v25);

        goto LABEL_29;
      }
    }
  }
LABEL_31:

}

+ (void)recordAlbumIfNeeded:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled"))
  {
    if (PLPlatformSearchSupported())
    {
      objc_msgSend(v3, "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        if (objc_msgSend(v3, "isCandidateForSearchIndexing"))
        {
          objc_msgSend(v3, "changedValues");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v3, "isDeleted") & 1) == 0 && (objc_msgSend(v3, "isInserted") & 1) == 0)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trashedState"));
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            if (v6
              || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startDate")),
                  (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
              || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endDate")),
                  (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
              || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assets")),
                  (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {

            }
            else
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v20)
              {
LABEL_21:

                goto LABEL_22;
              }
            }
          }
          if ((objc_msgSend(v3, "isDeleted") & 1) != 0)
            goto LABEL_17;
          objc_msgSend(v3, "photoLibrary");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "libraryServicesManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLGenericAlbum isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLGenericAlbum, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", objc_msgSend(v8, "wellKnownPhotoLibraryIdentifier"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "evaluateWithObject:", v3);

          if (!v10)
          {
LABEL_17:
            PLSearchBackendIndexStatusGetLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v3, "uuid");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = 138412290;
              v22 = v14;
              _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "property changes to album: %@ indicate remove from index", (uint8_t *)&v21, 0xCu);

            }
            v12 = 1;
          }
          else if ((objc_msgSend(v3, "isInserted") & 1) != 0
                 || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trashedState")),
                     v11 = (void *)objc_claimAutoreleasedReturnValue(),
                     v11,
                     v11))
          {
            v12 = 34;
          }
          else
          {
            v12 = 32;
          }
          objc_msgSend(v3, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "photoLibrary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "managedObjectContext");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = +[PLBackgroundJobWorkItem insertSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v15, v12, v17);

          objc_msgSend(v3, "photoLibrary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "signalBackgroundProcessingNeeded");

          goto LABEL_21;
        }
      }
    }
  }
LABEL_22:

}

+ (void)recordHighlightIfNeeded:(id)a3
{
  id v3;
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
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled"))
  {
    if (PLPlatformSearchSupported())
    {
      objc_msgSend(v3, "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v3, "changedValues");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "isDeleted") & 1) != 0 || (objc_msgSend(v3, "isInserted") & 1) != 0)
          goto LABEL_31;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("verboseSmartDescription"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subtitle"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v6)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v6)
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startDate"));
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v6)
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endDate"));
                v6 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v6)
                {
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startTimeZoneOffset"));
                  v6 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v6)
                  {
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endTimeZoneOffset"));
                    v7 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v7)
                    {
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
                      v8 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v8)
                      {
                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assets"));
                        v9 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v9)
                        {
                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dayGroupAssets"));
                          v10 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v10)
                          {
                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("childDayGroupPhotosHighlights"));
                            v11 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v11)
                            {
                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("moments"));
                              v12 = (void *)objc_claimAutoreleasedReturnValue();
                              if (!v12)
                              {
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("keyAssetPrivate"));
                                v13 = (void *)objc_claimAutoreleasedReturnValue();
                                if (!v13)
                                {
                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dayGroupKeyAssetPrivate"));
                                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (!v14)
                                  {
                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("keyAssetShared"));
                                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (!v15)
                                    {
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dayGroupKeyAssetShared"));
                                      v24 = (void *)objc_claimAutoreleasedReturnValue();

                                      if (!v24)
                                      {
LABEL_38:

                                        goto LABEL_39;
                                      }
LABEL_31:
                                      if ((objc_msgSend(v3, "isDeleted") & 1) != 0
                                        || (objc_msgSend(v3, "isEligibleForSearchIndexing") & 1) == 0)
                                      {
                                        PLSearchBackendIndexStatusGetLog();
                                        v17 = objc_claimAutoreleasedReturnValue();
                                        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                                        {
                                          objc_msgSend(v3, "uuid");
                                          v18 = (void *)objc_claimAutoreleasedReturnValue();
                                          v25 = 138412290;
                                          v26 = v18;
                                          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "property changes to highlight: %@ indicate remove from index", (uint8_t *)&v25, 0xCu);

                                        }
                                        v16 = 1;
                                      }
                                      else
                                      {
                                        v16 = 64;
                                      }
                                      objc_msgSend(v3, "uuid");
                                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v3, "photoLibrary");
                                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v20, "managedObjectContext");
                                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                                      v22 = +[PLBackgroundJobWorkItem insertSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v19, v16, v21);

                                      objc_msgSend(v3, "photoLibrary");
                                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v23, "signalBackgroundProcessingNeeded");

                                      goto LABEL_38;
                                    }

                                    v14 = 0;
                                  }

                                  v13 = 0;
                                }

                                v12 = 0;
                              }

                              v11 = 0;
                            }

                            v10 = 0;
                          }

                          v9 = 0;
                        }

                        v8 = 0;
                      }

                      v7 = 0;
                    }

                    v6 = 0;
                  }
                }
              }
            }
          }
        }

        goto LABEL_31;
      }
    }
  }
LABEL_39:

}

+ (void)recordMemoryIfNeeded:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled"))
  {
    if (PLPlatformSearchSupported())
    {
      objc_msgSend(v3, "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        if ((objc_msgSend(v3, "isDeleted") & 1) != 0)
          goto LABEL_7;
        objc_msgSend(v3, "photoLibrary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "libraryServicesManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLMemory isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLMemory, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", objc_msgSend(v6, "wellKnownPhotoLibraryIdentifier"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "evaluateWithObject:", v3);

        if ((v8 & 1) == 0)
        {
LABEL_7:
          PLSearchBackendIndexStatusGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v3, "uuid");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 138412290;
            v18 = v11;
            _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "property changes to memory: %@ indicate remove from index", (uint8_t *)&v17, 0xCu);

          }
          v9 = 1;
        }
        else
        {
          v9 = 128;
        }
        objc_msgSend(v3, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "photoLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "managedObjectContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = +[PLBackgroundJobWorkItem insertSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v12, v9, v14);

        objc_msgSend(v3, "photoLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "signalBackgroundProcessingNeeded");

      }
    }
  }

}

+ (void)recordDetectedFaceIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled")&& PLPlatformSearchSupported())
  {
    objc_msgSend(v16, "associatedAssetForFaceOrTorso:orTemporal:", 1, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      goto LABEL_14;
    if ((objc_msgSend(v4, "isDeleted") & 1) != 0)
      goto LABEL_14;
    objc_msgSend(v16, "associatedPersonForFaceOrTorso:orTemporal:", 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldIndexForSearch");

    if (!v7)
      goto LABEL_14;
    if (objc_msgSend(v16, "isDeleted"))
    {
      objc_msgSend(a1, "_recordAssetIfNeededForRelationshipChange:flags:", v5, 4);
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v16, "changedValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isInserted") & 1) == 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personForFace"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9
        || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personForTemporalDetectedFaces")),
            (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ageType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_13;
      }
    }
    objc_msgSend(v16, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v10, 16, v12);

    objc_msgSend(v16, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "signalBackgroundProcessingNeeded");

LABEL_13:
    goto LABEL_14;
  }
LABEL_15:

}

+ (void)recordPersonIfNeeded:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled")&& PLPlatformSearchSupported())
  {
    objc_msgSend(v11, "changedValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isDeleted") & 1) != 0 || objc_msgSend(v11, "verifiedType") != 1)
      goto LABEL_9;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fullName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("detectionType"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    objc_msgSend(v11, "personUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v6, 256, v8);

    objc_msgSend(v11, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signalBackgroundProcessingNeeded");

    goto LABEL_9;
  }
LABEL_10:

}

+ (void)recordAssetDescriptionIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled")&& PLPlatformSearchSupported())
  {
    objc_msgSend(v8, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longDescription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isDeleted") & 1) != 0 || v5)
    {
      objc_msgSend(v8, "assetAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_recordAssetIfNeededForRelationshipChange:flags:", v7, 4);

    }
  }

}

+ (void)recordAdditionalAssetAttributesIfNeeded:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = +[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled");
  v5 = v18;
  if (v4)
  {
    objc_msgSend(v18, "changedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reverseLocationDataIsValid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reverseLocationData"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9 != 0;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keywords"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sceneClassifications"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("temporalSceneClassifications"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cameraCaptureDevice"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessibilityDescription"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 || v10 || v11 || v12 || v13 || v14 || v15 || v16)
    {
      objc_msgSend(v18, "asset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_recordAssetIfNeededForRelationshipChange:flags:", v17, 4);

    }
    v5 = v18;
  }

}

+ (void)recordMediaAnalysisAssetAttributesIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  if (+[PLBackgroundJobWorkItem backgroundJobSearchIndexingEnabled](PLBackgroundJobWorkItem, "backgroundJobSearchIndexingEnabled")&& PLPlatformSearchSupported())
  {
    objc_msgSend(v16, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characterRecognitionAttributes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 || objc_msgSend(v16, "isDeleted"))
      v6 = 8;
    else
      v6 = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("visualSearchAttributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v16, "isDeleted");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaAnalysisImageVersion"));
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaAnalysisVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v9 | v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageEmbeddingVersion"));
    v12 = objc_claimAutoreleasedReturnValue();

    if (v11 | v12)
      v13 = 1;
    else
      v13 = v8;
    if (v7)
      v13 = 1;
    if (v13)
      v14 = v6 | 4;
    else
      v14 = v6;
    if (v14)
    {
      objc_msgSend(v16, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_recordAssetIfNeededForRelationshipChange:flags:", v15, v14);

    }
  }

}

+ (void)_recordAssetIfNeededForRelationshipChange:(id)a3 flags:(int64_t)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v18 = v5;
    v7 = objc_msgSend(v5, "isDeleted");
    v6 = v18;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v18, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v18;
      if (v8)
      {
        objc_msgSend(v18, "photoLibrary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "libraryServicesManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", objc_msgSend(v10, "wellKnownPhotoLibraryIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "evaluateWithObject:", v18);

        v6 = v18;
        if (v12)
        {
          objc_msgSend(v18, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "photoLibrary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "managedObjectContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v13, a4, v15);

          objc_msgSend(v18, "photoLibrary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "signalBackgroundProcessingNeeded");

          v6 = v18;
        }
      }
    }
  }

}

@end
