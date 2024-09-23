@implementation PLSearchManagedObjectUtilities

+ (id)psiObjectForObject:(id)a3 fetchHelper:(id)a4 partialUpdateMask:(int64_t)a5 indexingContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (!v15)
  {
    objc_msgSend(v9, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", v21))
    {

    }
    else
    {
      objc_msgSend(v9, "entity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLFetchingAlbum entityName](PLFetchingAlbum, "entityName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

      if (!v25)
      {
        objc_msgSend(v9, "entity");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLMemory entityName](PLMemory, "entityName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqualToString:", v30);

        if (!v31)
        {
          objc_msgSend(v9, "entity");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v33, "isEqualToString:", v34);

          if ((v35 & 1) == 0)
          {
            objc_msgSend(v9, "entity");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "name");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLGraphNode entityName](PLGraphNode, "entityName");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v37, "isEqualToString:", v38);

            if (v39)
            {
              v40 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v9);
              +[PSISearchEntityTranslator psiGroupFromSearchEntity:](PSISearchEntityTranslator, "psiGroupFromSearchEntity:", v40);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_10;
            }
            PLSearchBackendIndexingEngineGetLog();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v9, "entity");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "name");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = 138543362;
              v45 = v43;
              _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_ERROR, "Invalid entity to process for search indexing: %{public}@", (uint8_t *)&v44, 0xCu);

            }
          }
          v18 = 0;
          goto LABEL_10;
        }
        +[PSIMemoryTranslator psiCollectionFromMemory:indexingContext:](PSIMemoryTranslator, "psiCollectionFromMemory:indexingContext:", v9, v11);
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    +[PSIAlbumTranslator psiCollectionFromAlbum:indexingContext:](PSIAlbumTranslator, "psiCollectionFromAlbum:indexingContext:", v9, v11);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v18 = (void *)v26;
    goto LABEL_10;
  }
  if (!a5)
    a5 = 3;
  v16 = v9;
  objc_msgSend(v16, "documentObservation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSIAssetTranslator psiAssetFromAsset:fetchHelper:propertySets:graphData:indexingContext:documentObservation:](PSIAssetTranslator, "psiAssetFromAsset:fetchHelper:propertySets:graphData:indexingContext:documentObservation:", v16, v10, a5, MEMORY[0x1E0C9AA70], v11, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v18;
}

+ (id)psiObjectForIdentifierRequiringAdditonalWork:(id)a3 entity:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a4 < 7 || a4 == 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchManagedObjectUtilities.m"), 93, CFSTR("Invalid entity for additional work"));

LABEL_3:
    v9 = 0;
    goto LABEL_4;
  }
  if (a4 != 7)
    goto LABEL_3;
  v17 = 0;
  v18 = 0;
  v16 = 0;
  +[PLSearchEntity decodeIdentifierString:intoLabel:type:outIdentifier:](PLSearchEntity, "decodeIdentifierString:intoLabel:type:outIdentifier:", v7, &v17, &v18, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  v13 = v16;
  if (objc_msgSend(v11, "isSuccess"))
  {
    +[PSISearchEntityTranslator zeroScorePSIGroupFromLabel:type:identifier:](PSISearchEntityTranslator, "zeroScorePSIGroupFromLabel:type:identifier:", v12, v18, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLSearchBackendIndexWorkerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v7;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to decode search entity identifier: %{public}@, error: %@", buf, 0x16u);

    }
    v9 = 0;
  }

LABEL_4:
  return v9;
}

+ (id)searchableItemForObject:(id)a3 fetchHelper:(id)a4 partialUpdateMask:(int64_t)a5 libraryIdentifier:(int64_t)a6 indexingContext:(id)a7 embeddingsFetcher:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __CFString *v22;
  int64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  __CFString *v57;
  id v58;
  uint8_t buf[4];
  const __CFString *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  const __CFString *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  objc_msgSend(v13, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if (!v20)
  {
    objc_msgSend(v13, "entity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v14;
    if (objc_msgSend(v31, "isEqualToString:", v32))
    {

    }
    else
    {
      objc_msgSend(v13, "entity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLFetchingAlbum entityName](PLFetchingAlbum, "entityName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqualToString:", v35);

      if (!v36)
      {
        objc_msgSend(v13, "entity");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLMemory entityName](PLMemory, "entityName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v45, "isEqualToString:", v46);

        if (v47)
        {
          v37 = v13;
          objc_msgSend(v37, "uuid");
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          +[PLSpotlightMemoryTranslator spotlightSearchableItemFromMemory:](PLSpotlightMemoryTranslator, "spotlightSearchableItemFromMemory:", v37);
          v38 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v13, "entity");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "name");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v49, "isEqualToString:", v50);

          if (!v51)
          {
            objc_msgSend(v13, "entity");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "name");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLGraphNode entityName](PLGraphNode, "entityName");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v53, "isEqualToString:", v54);

            if ((v55 & 1) != 0)
            {
              v25 = 0;
              v22 = 0;
              v14 = v58;
              goto LABEL_19;
            }
            PLSearchBackendIndexingEngineGetLog();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "entity");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "name");
              v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v60 = v57;
              _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "Invalid entity to process for search indexing: %{public}@", buf, 0xCu);

            }
            v25 = 0;
            v22 = 0;
            v14 = v58;
            goto LABEL_18;
          }
          v37 = v13;
          objc_msgSend(v37, "uuid");
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          +[PLSpotlightHighlightTranslator spotlightSearchableItemFromHighlight:](PLSpotlightHighlightTranslator, "spotlightSearchableItemFromHighlight:", v37);
          v38 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_15;
      }
    }
    v37 = v13;
    objc_msgSend(v37, "uuid");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightAlbumTranslator spotlightSearchableItemFromAlbum:](PLSpotlightAlbumTranslator, "spotlightSearchableItemFromAlbum:", v37);
    v38 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v25 = (void *)v38;

    v14 = v58;
    if (!v25)
      goto LABEL_19;
    goto LABEL_16;
  }
  v21 = v13;
  objc_msgSend(v21, "uuid");
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (a5)
    v23 = a5;
  else
    v23 = 3;
  objc_msgSend(v21, "documentObservation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSpotlightAssetTranslator partialSpotlightSearchableItemFromAsset:fetchHelper:libraryIdentifier:propertySets:graphData:indexingContext:documentObservation:embeddingsFetcher:](PLSpotlightAssetTranslator, "partialSpotlightSearchableItemFromAsset:fetchHelper:libraryIdentifier:propertySets:graphData:indexingContext:documentObservation:embeddingsFetcher:", v21, v14, a6, v23, MEMORY[0x1E0C9AA70], v15, v24, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  PLSearchBackendIndexWorkerGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    PLSearchIndexingAssetPropertySetDescription(v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "isUpdate");
    v29 = CFSTR("N");
    *(_DWORD *)buf = 138543874;
    v60 = v22;
    v61 = 2114;
    if (v28)
      v29 = CFSTR("Y");
    v62 = v27;
    v63 = 2114;
    v64 = v29;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "search: donation for asset %{public}@ with property sets %{public}@ isUpdate: %{public}@", buf, 0x20u);

  }
  if (v25)
  {
LABEL_16:
    PLSearchBackendIndexWorkerGetLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "entity");
      v40 = v14;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "name");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = CFSTR("inserting");
      v61 = 2114;
      v62 = v42;
      v63 = 2114;
      v64 = v22;
      _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_INFO, "search: %{public}@ object of entity %{public}@ uuid: %{public}@ ", buf, 0x20u);

      v14 = v40;
    }
LABEL_18:

  }
LABEL_19:

  return v25;
}

+ (id)bundleIdentifierForManagedObject:(id)a3 wellKnownLibraryIdentifier:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    +[PLSpotlightDonationUtilities bundleIdentifierForAsset:wellKnownLibraryIdentifier:](PLSpotlightDonationUtilities, "bundleIdentifierForAsset:wellKnownLibraryIdentifier:", v5, a4);
  else
    +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
