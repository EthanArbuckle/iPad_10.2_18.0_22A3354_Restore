@implementation PLDuplicateMerge

- (PLDuplicateMerge)initWithSourceAssets:(id)a3 targetAsset:(id)a4 photolibrary:(id)a5
{
  id v10;
  id v11;
  id v12;
  PLDuplicateMerge *v13;
  PLDuplicateMerge *v14;
  PLDuplicateMergeCrashRecovery *v15;
  PLDuplicateMergeCrashRecovery *mergeCrashRecovery;
  PLDuplicateMergeModelProperties *v17;
  PLDuplicateMergeModelProperties *mergeModelProperties;
  void *v20;
  void *v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateMerge.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceAssets"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateMerge.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetAsset"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)PLDuplicateMerge;
  v13 = -[PLDuplicateMerge init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_library, a5);
    v15 = -[PLDuplicateMergeCrashRecovery initWithPhotoLibrary:]([PLDuplicateMergeCrashRecovery alloc], "initWithPhotoLibrary:", v12);
    mergeCrashRecovery = v14->_mergeCrashRecovery;
    v14->_mergeCrashRecovery = v15;

    objc_storeStrong((id *)&v14->_sourceAssets, a3);
    objc_storeStrong((id *)&v14->_targetAsset, a4);
    v17 = -[PLDuplicateMergeModelProperties initWithTargetAsset:photoLibrary:]([PLDuplicateMergeModelProperties alloc], "initWithTargetAsset:photoLibrary:", v11, v12);
    mergeModelProperties = v14->_mergeModelProperties;
    v14->_mergeModelProperties = v17;

  }
  return v14;
}

- (PLManagedAsset)asset
{
  return -[PLDuplicateAsset asset](self->_targetAsset, "asset");
}

- (PLDuplicateMerge)mergeWithError:(id *)a3
{
  PLPhotoLibrary *library;
  int v5;
  id v6;
  void *v7;
  PLDuplicateMerge *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__75493;
  v15 = __Block_byref_object_dispose__75494;
  v16 = 0;
  library = self->_library;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__PLDuplicateMerge_mergeWithError___block_invoke;
  v10[3] = &unk_1E3677830;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  -[PLPhotoLibrary performBlockAndWait:](library, "performBlockAndWait:", v10);
  v5 = *((unsigned __int8 *)v18 + 24);
  v6 = (id)v12[5];
  v7 = v6;
  if (!v5 && a3)
    *a3 = objc_retainAutorelease(v6);

  v8 = (PLDuplicateMerge *)*((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)_mergeMetadataFromSource:(id)a3
{
  id v4;
  PLDuplicateMergeModelProperties *mergeModelProperties;
  BOOL v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  mergeModelProperties = self->_mergeModelProperties;
  v12 = 0;
  v6 = -[PLDuplicateMergeModelProperties transferPropertiesFromSourceAsset:propertyMergeType:error:](mergeModelProperties, "transferPropertiesFromSourceAsset:propertyMergeType:error:", v4, 0, &v12);
  v7 = v12;
  if (!v6)
  {
    PLDuplicateDetectionGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateMerge targetAsset](self, "targetAsset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Duplicate Merge: failed to merge properties for %{public}@, target asset: %{public}@. Error: %@", buf, 0x20u);

    }
  }
  -[PLDuplicateMerge _mergeLocationFromSource:forceUpdate:](self, "_mergeLocationFromSource:forceUpdate:", v4, 0);
  -[PLDuplicateMerge _mergeSharedLibraryMetadataFromSource:](self, "_mergeSharedLibraryMetadataFromSource:", v4);
  -[PLDuplicateMerge _mergeFaceRelationshipsFromSource:](self, "_mergeFaceRelationshipsFromSource:", v4);

}

- (void)_mergeLocationFromSource:(id)a3 forceUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLDuplicateMerge targetAsset](self, "targetAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "locationUpdated") & 1) != 0
    || !-[PLDuplicateMerge _isValidForLocationOverwriteWithSource:](self, "_isValidForLocationOverwriteWithSource:", v6))
  {

    if (!v4)
      goto LABEL_10;
  }
  else
  {

  }
  -[PLDuplicateMerge asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocation:", v10);

  -[PLDuplicateMerge targetAsset](self, "targetAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocationUpdated:", 1);

  PLDuplicateDetectionGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = CFSTR("NO");
    if (v4)
      v13 = CFSTR("YES");
    v14 = v13;
    objc_msgSend(v8, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuplicateMerge targetAsset](self, "targetAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shortDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544130;
    v20 = v14;
    v21 = 2112;
    v22 = v15;
    v23 = 2114;
    v24 = v16;
    v25 = 2114;
    v26 = v18;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "Duplicate Merge: location (forced:%{public}@): \"%@\" [%{public}@ -> %{public}@]", (uint8_t *)&v19, 0x2Au);

  }
LABEL_10:

}

- (void)_mergeSharedLibraryMetadataFromSource:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  objc_msgSend(a3, "asset");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateMerge asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryScope");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(v4, "libraryScopeShareState");

    if ((v7 & 0x800000) != 0)
    {
      objc_msgSend(v4, "libraryScope");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "libraryScopeContributors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v21, "libraryScope");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v21, "libraryScopeContributors");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
        {
LABEL_8:
          objc_msgSend(v4, "setLibraryScope:withContributors:", v8, v10);
          objc_msgSend(v4, "additionalAttributes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "appendLibraryScopeAssetContributorsToUpdate:", v11);

          goto LABEL_9;
        }
        objc_msgSend(v21, "libraryScopeContributors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v16);

        objc_msgSend(v21, "libraryScopeContributors");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "allObjects");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_pl_map:", &__block_literal_global_47_75515);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v19);

      }
      else
      {
        objc_msgSend(v8, "currentUserParticipant");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);
        objc_msgSend(v17, "userIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v18);
      }

      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)_mergeFaceRelationshipsFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateMerge asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceAdjustmentVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceAdjustmentVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detectedFaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "temporalDetectedFaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detectedFaces");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "temporalDetectedFaces");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legacyFaces");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "legacyFaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateMerge targetAsset](self, "targetAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  v61 = v11;
  if (!objc_msgSend(v12, "facesUpdated") && !v7 && v8)
  {
    v13 = objc_msgSend(v9, "count");
    v14 = v13 + objc_msgSend(v10, "count") == 0;
    v11 = v61;
    v15 = !v14;
    v62 = v15;
  }
  v56 = (void *)v7;

  if (objc_msgSend(v11, "count"))
    v16 = 0;
  else
    v16 = objc_msgSend(v58, "count") != 0;
  v57 = v9;
  v54 = v10;
  v55 = v8;
  if (v62)
  {
    objc_msgSend(v6, "setDetectedFaces:", v9);
    objc_msgSend(v6, "setTemporalDetectedFaces:", v10);
    objc_msgSend(v6, "setFaceAreaPoints:", objc_msgSend(v5, "faceAreaPoints"));
    objc_msgSend(v5, "additionalAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "faceRegions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "additionalAttributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFaceRegions:", v18);

    v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (objc_msgSend(v60, "count"))
    {
      objc_msgSend(v60, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObjectsFromArray:", v21);

    }
    v52 = v4;
    if (objc_msgSend(v59, "count"))
    {
      objc_msgSend(v59, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObjectsFromArray:", v22);

    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v23 = v20;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v68 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v28, "associatedAssetForFaceOrTorso:orTemporal:", 1, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateMerge.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[face associatedAssetForFaceOrTorso:YES orTemporal:YES] == nil"));

          }
          objc_msgSend(v28, "managedObjectContext");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "deleteObject:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v25);
    }

    objc_msgSend(v5, "resetFaceAnalysisStates");
    -[PLDuplicateMerge targetAsset](self, "targetAsset");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFacesUpdated:", 1);

    v4 = v52;
    v10 = v54;
    v8 = v55;
    v9 = v57;
    v11 = v61;
  }
  if (v16)
  {
    objc_msgSend(v5, "legacyFaces");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegacyFaces:", v33);

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v34 = v11;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v64 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          objc_msgSend(v39, "asset");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateMerge.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("face.asset == nil"));

          }
          objc_msgSend(v39, "managedObjectContext");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "deleteObject:", v39);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v36);
    }

    PLDuplicateDetectionGetLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "shortDescription");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateMerge targetAsset](self, "targetAsset");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "shortDescription");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v44;
      v73 = 2114;
      v74 = v46;
      _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_INFO, "Duplicate Merge: merged over legacy faces: [%{public}@ -> %{public}@]", buf, 0x16u);

    }
    v10 = v54;
    v8 = v55;
    v9 = v57;
    v11 = v61;
  }
  if (v62)
  {
    -[PLDuplicateMerge _resetMediaAnalysisStateWithType:](self, "_resetMediaAnalysisStateWithType:", 1);
    PLDuplicateDetectionGetLog();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "shortDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateMerge targetAsset](self, "targetAsset");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "shortDescription");
      v50 = v10;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v48;
      v73 = 2114;
      v74 = v51;
      _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_INFO, "Duplicate Merge: merged over faces: [%{public}@ -> %{public}@]", buf, 0x16u);

      v10 = v50;
      v11 = v61;

      v9 = v57;
    }

  }
}

- (BOOL)mergeResourcesFromSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  PLDuplicateMergeCrashRecovery *mergeCrashRecovery;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  void *v55;
  void *v56;
  id *v57;
  BOOL v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  int v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  PLDuplicateMergeModelProperties *mergeModelProperties;
  uint64_t (*v79)(uint64_t, uint64_t);
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  _BOOL4 v88;
  id v89;
  id v90;
  BOOL v91;
  id v92;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  char v104;
  id v105;
  void *v106;
  id obj;
  void *v108;
  void *v109;
  void *v110;
  _BOOL4 v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void *v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  _QWORD v123[5];
  id v124;
  id v125;
  id v126;
  id v127;
  uint64_t *v128;
  _BYTE *v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  char v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint8_t v142[4];
  void *v143;
  __int16 v144;
  void *v145;
  __int16 v146;
  uint64_t v147;
  _BYTE buf[24];
  uint64_t (*v149)(uint64_t, uint64_t);
  void (*v150)(uint64_t);
  id v151;
  uint64_t v152;
  void *v153;
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;
  _QWORD v157[4];

  v157[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v105 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v109 = v4;
  objc_msgSend(v4, "asset");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateMerge asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathManager");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistedResourcesMatching:", &__block_literal_global_54_75480);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isCPLEnabled") & 1) != 0
    || (objc_msgSend(v106, "master"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6)
    || !-[PLDuplicateMerge _checkCPLDisabledAssetHasValidOriginalResourcesForAsset:](self, "_checkCPLDisabledAssetHasValidOriginalResourcesForAsset:", v5)|| -[PLDuplicateMerge _checkCPLDisabledAssetHasValidOriginalResourcesForAsset:](self, "_checkCPLDisabledAssetHasValidOriginalResourcesForAsset:", v106))
  {
    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    v7 = v100;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v138, v155, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v139;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v139 != v9)
            objc_enumerationMutation(v7);
          v11 = *(id *)(*((_QWORD *)&v138 + 1) + 8 * i);
          objc_msgSend(v5, "removeLocalFileForResource:allowDCIMPath:", v11, 1);
          objc_msgSend(v11, "deleteResource");

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v138, v155, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v112, "isDCIM"))
      -[PLDuplicateMerge _setDCIMFilenameFromSource:](self, "_setDCIMFilenameFromSource:", v109);
    else
      -[PLDuplicateMerge _setUBFFilenameFromDuplicateSource:](self, "_setUBFFilenameFromDuplicateSource:", v109);
    if (!objc_msgSend(v109, "isCPLEnabled")
      || (objc_msgSend(v106, "master"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = v12 == 0,
          v12,
          v13))
    {
      objc_msgSend(v106, "master");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        PLDuplicateDetectionGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v109, "shortDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLDuplicateMerge targetAsset](self, "targetAsset");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "shortDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v28;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: Source asset has a master record, but CPL is not enabled [%{public}@ -> %{public}@]", buf, 0x16u);

        }
      }
      PLDuplicateDetectionGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v109, "shortDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDuplicateMerge targetAsset](self, "targetAsset");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "shortDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v32;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_INFO, "Duplicate Merge: no master to remap, going to copy all resources manually [%{public}@ -> %{public}@]", buf, 0x16u);

      }
      objc_msgSend(v106, "persistedResourcesMatching:", &__block_literal_global_60_75489);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = 0;
    }
    else
    {
      PLDuplicateDetectionGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[PLDuplicateMerge targetAsset](self, "targetAsset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "master");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "scopedIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "shortDescription");
        v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2114;
        v149 = v19;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Duplicate Merge: going to remap master on %{public}@ with master %{public}@ from %{public}@", buf, 0x20u);

      }
      objc_msgSend(v106, "master");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset fixupCloudPhotoLibraryAsset:withCloudMaster:inLibrary:](PLManagedAsset, "fixupCloudPhotoLibraryAsset:withCloudMaster:inLibrary:", v5, v20, self->_library);

      objc_msgSend(v5, "setCloudPlaceholderKind:", objc_msgSend(v106, "cloudPlaceholderKind"));
      objc_msgSend(v106, "allAssetCPLResources");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");
      v111 = v22 != 0;
      if (v22)
        v23 = (void *)objc_msgSend(v21, "copy");
      else
        v23 = 0;
      mergeCrashRecovery = self->_mergeCrashRecovery;
      objc_msgSend(v5, "uuid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateMergeCrashRecovery writeCrashRecoveryMarkerFileForTargetAssetUUID:error:](mergeCrashRecovery, "writeCrashRecoveryMarkerFileForTargetAssetUUID:error:", v34, 0);

    }
    PLDuplicateDetectionGetLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = objc_msgSend(v23, "count");
      objc_msgSend(v109, "shortDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateMerge targetAsset](self, "targetAsset");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "shortDescription");
      v39 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2114;
      v149 = v39;
      _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_INFO, "Duplicate Merge: manually installing %lu resources [%{public}@ -> %{public}@]", buf, 0x20u);

    }
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    obj = v23;
    v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v154, 16);
    if (v114)
    {
      v108 = 0;
      v104 = 1;
      v113 = *(_QWORD *)v135;
      v101 = *MEMORY[0x1E0D74498];
      v102 = *MEMORY[0x1E0CB2D50];
LABEL_34:
      v40 = 0;
      while (1)
      {
        if (*(_QWORD *)v135 != v113)
        {
          v41 = v40;
          objc_enumerationMutation(obj);
          v40 = v41;
        }
        v116 = v40;
        v42 = *(id *)(*((_QWORD *)&v134 + 1) + 8 * v40);
        objc_msgSend(v42, "validatedExternalResourceRepresentationUsingFileURL:", 0);
        v117 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "storedResourceForExternalResource:asset:", v117, v5);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        if (v119)
          goto LABEL_95;
        PLDuplicateDetectionGetLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v109, "shortDescription");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLDuplicateMerge targetAsset](self, "targetAsset");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "shortDescription");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v44;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v46;
          *(_WORD *)&buf[22] = 2112;
          v149 = v117;
          _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_ERROR, "Duplicate Merge: failed to install new resource on target with external source resource: [%{public}@ -> %{public}@] %@", buf, 0x20u);

        }
        if ((objc_msgSend(v42, "isDerivative") & 1) != 0)
        {
LABEL_95:
          objc_msgSend(v119, "resetPrefetchState");
          objc_msgSend(v42, "fileURL");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v149 = __Block_byref_object_copy__75493;
          v150 = __Block_byref_object_dispose__75494;
          v151 = 0;
          v130 = 0;
          v131 = &v130;
          v132 = 0x2020000000;
          v133 = 0;
          if (!v118)
            goto LABEL_56;
          if (objc_msgSend(v112, "isUBF"))
          {
            v47 = objc_alloc(MEMORY[0x1E0D73278]);
            objc_msgSend(v5, "uuid");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v5, "bundleScope");
            objc_msgSend(v42, "uniformTypeIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "identifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v42, "version");
            v52 = objc_msgSend(v42, "resourceType");
            v53 = objc_msgSend(v42, "recipeID");
            v54 = objc_msgSend(v42, "recipeID");
            if (v54)
            {
              v55 = 0;
            }
            else
            {
              objc_msgSend(v106, "originalFilename");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v103;
            }
            v56 = (void *)objc_msgSend(v47, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v110, v48, v50, v51, v52, v53, v55);
            if (!v54)

            v123[0] = MEMORY[0x1E0C809B0];
            v123[1] = 3221225472;
            v123[2] = __51__PLDuplicateMerge_mergeResourcesFromSource_error___block_invoke_64;
            v123[3] = &unk_1E3670F90;
            v123[4] = self;
            v128 = &v130;
            v124 = v118;
            v125 = v119;
            v126 = v5;
            v127 = v105;
            v129 = buf;
            objc_msgSend(v112, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v56, 2, v123);

          }
          else
          {
            objc_msgSend(v119, "cplFileURL");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (v56)
            {
              -[PLDuplicateMerge _preFileCloneChecksForURL:](self, "_preFileCloneChecksForURL:", v56);
              v57 = (id *)(*(_QWORD *)&buf[8] + 40);
              v122 = *(id *)(*(_QWORD *)&buf[8] + 40);
              v58 = +[PLManagedAsset cloneResourceFileFromURL:toURL:forDestinationResource:forDestinationAsset:fileManager:error:](PLManagedAsset, "cloneResourceFileFromURL:toURL:forDestinationResource:forDestinationAsset:fileManager:error:", v118, v56, v119, v5, v105, &v122);
              objc_storeStrong(v57, v122);
              *((_BYTE *)v131 + 24) = v58;
            }
          }

          if (*((_BYTE *)v131 + 24))
            goto LABEL_56;
          PLDuplicateDetectionGetLog();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v109, "shortDescription");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLDuplicateMerge targetAsset](self, "targetAsset");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "shortDescription");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v142 = 138543874;
            v143 = v67;
            v144 = 2114;
            v145 = v69;
            v146 = 2112;
            v147 = v70;
            _os_log_impl(&dword_199541000, v66, OS_LOG_TYPE_ERROR, "Duplicate Merge: clone resource file failed: [%{public}@ -> %{public}@] Error: %@", v142, 0x20u);

          }
          if ((objc_msgSend(v42, "isDerivative") & 1) != 0)
          {
LABEL_56:
            if (v111
              && objc_msgSend(v42, "isCPLAssetResource")
              && objc_msgSend(v42, "isCPLResource")
              && !*((_BYTE *)v131 + 24)
              && objc_msgSend(v42, "isRemotelyAvailable"))
            {
              objc_msgSend(v5, "additionalAttributes");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "scopedIdentifier");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "setSourceAssetForDuplicationCPLScopedIdentifier:", v72);

              objc_msgSend(v5, "setCloudLocalState:", 0);
              v65 = 0;
            }
            else
            {
              v65 = 0;
            }
          }
          else
          {
            v73 = *(id *)(*(_QWORD *)&buf[8] + 40);

            v104 = 0;
            v65 = 4;
            v108 = v73;
          }
          _Block_object_dispose(&v130, 8);
          _Block_object_dispose(buf, 8);

        }
        else
        {
          v59 = (void *)MEMORY[0x1E0CB35C8];
          v152 = v102;
          v60 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v106, "uuid");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "uuid");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "stringWithFormat:", CFSTR("Duplicate Merge: failed to install new resource on target with external source resource: [%@ -> %@] %@"), v118, v61, v117);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = v62;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "errorWithDomain:code:userInfo:", v101, 47011, v63);
          v64 = objc_claimAutoreleasedReturnValue();

          v104 = 0;
          v65 = 4;
          v108 = (void *)v64;
        }

        if (v65)
          break;
        v40 = v116 + 1;
        if (v114 == v116 + 1)
        {
          v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v154, 16);
          v114 = v74;
          if (v74)
            goto LABEL_34;
          break;
        }
      }
    }
    else
    {
      v108 = 0;
      v104 = 1;
    }

    objc_msgSend(v106, "master");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudMaster deleteMasterIfNecessary:inLibrary:](PLCloudMaster, "deleteMasterIfNecessary:inLibrary:", v75, self->_library);

    if ((v104 & 1) != 0)
    {
      -[PLDuplicateMerge asset](self, "asset");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "uuid");
      v77 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "setResourceSwapAssetUUID:", v77);

      mergeModelProperties = self->_mergeModelProperties;
      v121 = 0;
      LOBYTE(v77) = -[PLDuplicateMergeModelProperties transferPropertiesFromSourceAsset:propertyMergeType:error:](mergeModelProperties, "transferPropertiesFromSourceAsset:propertyMergeType:error:", v109, 1, &v121);
      v79 = (uint64_t (*)(uint64_t, uint64_t))v121;
      if ((v77 & 1) == 0)
      {
        PLDuplicateDetectionGetLog();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v109, "shortDescription");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLDuplicateMerge targetAsset](self, "targetAsset");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "shortDescription");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v81;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v83;
          *(_WORD *)&buf[22] = 2112;
          v149 = v79;
          _os_log_impl(&dword_199541000, v80, OS_LOG_TYPE_ERROR, "Duplicate Merge: update extended attributes failed: [%@ -> %@] Error: %@", buf, 0x20u);

        }
      }
      if (objc_msgSend(v109, "resourceComparisonPropertyUpdateLocation"))
        -[PLDuplicateMerge _mergeLocationFromSource:forceUpdate:](self, "_mergeLocationFromSource:forceUpdate:", v109, 1);
      PLDuplicateDetectionGetLog();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v109, "shortDescription");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDuplicateMerge targetAsset](self, "targetAsset");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "shortDescription");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v85;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v87;
        _os_log_impl(&dword_199541000, v84, OS_LOG_TYPE_INFO, "Duplicate Merge: resource merge [%{public}@ -> %{public}@]", buf, 0x16u);

      }
      v120 = v108;
      v88 = -[PLDuplicateMerge _mergeAdjustmentsFromSource:error:](self, "_mergeAdjustmentsFromSource:error:", v109, &v120);
      v89 = v120;

      if (v88)
      {
        if ((MEMORY[0x19AEC0720]() & 1) == 0)
        {
          objc_msgSend(v5, "invalidateThumbnailIfNeededAfterMasterResourceChangeInLibrary:", self->_library);
          objc_msgSend(v5, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, 0, 0);
        }
        -[PLDuplicateMerge _resetMediaAnalysisStateWithType:](self, "_resetMediaAnalysisStateWithType:", objc_msgSend(v5, "originalHeight") * objc_msgSend(v5, "originalWidth") > 89999);
        v90 = v89;
        v91 = 1;
        goto LABEL_88;
      }
      v108 = v89;
    }
    v92 = v108;
    v90 = v92;
    if (a4)
    {
      v90 = objc_retainAutorelease(v92);
      v91 = 0;
      *a4 = v90;
    }
    else
    {
      v91 = 0;
    }
LABEL_88:

    goto LABEL_89;
  }
  v94 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v106, "uuid");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "stringWithFormat:", CFSTR("Duplicate Merge: Invalid non-iCPL original resources: [%@ -> %@]"), v95, v96);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v97 = (void *)MEMORY[0x1E0CB35C8];
  v156 = *MEMORY[0x1E0CB2938];
  v157[0] = obj;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, &v156, 1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 47011, v98);
  v90 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v90 = objc_retainAutorelease(v90);
    v91 = 0;
    *a4 = v90;
  }
  else
  {
    v91 = 0;
  }
LABEL_89:

  return v91;
}

- (BOOL)_checkCPLDisabledAssetHasValidOriginalResourcesForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "primaryStoreOriginalResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistedResourcesMatching:", &__block_literal_global_67_75478);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || ((objc_msgSend(v3, "isRAWPlusJPEG") & 1) != 0 || objc_msgSend(v3, "isPhotoIris"))
    && (unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "fileURL", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", 0);

          if (!v13)
          {
            v6 = 0;
            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
    v6 = 1;
LABEL_16:

  }
  return v6;
}

- (void)_preFileCloneChecksForURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  NSObject *v14;
  int v15;
  int *v16;
  char *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint32_t v23;
  int v24;
  int *v25;
  char *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  _DWORD v31[7];

  *(_QWORD *)&v31[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v29 = 0;
    v6 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", &v29);
    v7 = v29;
    if ((v6 & 1) != 0)
    {
      v28 = 0;
      v8 = *MEMORY[0x1E0C999D0];
      v27 = 0;
      v9 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v28, v8, &v27);
      v10 = v28;
      v11 = v27;

      if (!v9)
      {
        PLDuplicateDetectionGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v31 = v11;
          v18 = "Duplicate Merge: Failed to identify if the cloned target is a directory. Error: %@";
          v22 = v14;
          v23 = 12;
LABEL_20:
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, v18, buf, v23);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
      v12 = -[NSObject BOOLValue](v10, "BOOLValue");
      v13 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
      if (v12)
      {
        if (rmdir(v13))
        {
          PLDuplicateDetectionGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = *__error();
            v16 = __error();
            v17 = strerror(*v16);
            *(_DWORD *)buf = 67109378;
            v31[0] = v15;
            LOWORD(v31[1]) = 2080;
            *(_QWORD *)((char *)&v31[1] + 2) = v17;
            v18 = "Duplicate Merge: Failed to remove a directory on the cloned target location. Error: [%d] %s";
LABEL_19:
            v22 = v14;
            v23 = 18;
            goto LABEL_20;
          }
          goto LABEL_21;
        }
      }
      else if (unlink(v13))
      {
        PLDuplicateDetectionGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v24 = *__error();
          v25 = __error();
          v26 = strerror(*v25);
          *(_DWORD *)buf = 67109378;
          v31[0] = v24;
          LOWORD(v31[1]) = 2080;
          *(_QWORD *)((char *)&v31[1] + 2) = v26;
          v18 = "Duplicate Merge: Failed to remove a file on the cloned target location. Error: [%d] %s";
          goto LABEL_19;
        }
LABEL_21:

      }
LABEL_22:

      v7 = v11;
      goto LABEL_23;
    }
    if ((PLIsErrorFileNotFound() & 1) == 0)
    {
      PLDuplicateDetectionGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v31 = v7;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Duplicate Merge: Failed to check if the cloned target location was reachable. Error: %@", buf, 0xCu);
      }
      v11 = v7;
      goto LABEL_22;
    }
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[PLDuplicateMerge targetAsset](self, "targetAsset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "asset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v31 = v21;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: Skipping pre clone check for asset: %{public}@", buf, 0xCu);

    }
  }
LABEL_23:

}

- (void)_setUBFFilenameFromDuplicateSource:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PLDuplicateMerge asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUBF");

  if (v6)
  {
    objc_msgSend(v13, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "originalFilename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOriginalFilename:", v8);

    objc_msgSend(v7, "primaryStoreOriginalResource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "setDirectory:", 0);
      objc_msgSend(v4, "setFilename:", 0);
      objc_msgSend(v9, "uniformTypeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "originalFilename");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setUBFFilenameAndDirectoryWithOriginalUniformTypeIdentifier:originalFilename:", v11, v12);

    }
  }

}

- (BOOL)_mergeAdjustmentsFromSource:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  PLPhotoLibrary *library;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  id v36;
  uint8_t buf[4];
  NSObject *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PLDuplicateMerge asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceSwapAssetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(v5, "asset");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject originalHeight](v10, "originalHeight");
    if (v11 != objc_msgSend(v6, "originalHeight")
      || (v12 = -[NSObject originalWidth](v10, "originalWidth"), v12 != objc_msgSend(v6, "originalWidth")))
    {
      PLDuplicateDetectionGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "shortDescription");
        v29 = objc_claimAutoreleasedReturnValue();
        -[PLDuplicateMerge targetAsset](self, "targetAsset");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "shortDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v29;
        v39 = 2114;
        v40 = v31;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Duplicate Merge: skipping adjustment merge - resource size mismatch [%{public}@ -> %{public}@]", buf, 0x16u);

      }
      v16 = 1;
      goto LABEL_24;
    }
    if (-[NSObject hasAdjustments](v10, "hasAdjustments"))
    {
      library = self->_library;
      v36 = 0;
      v14 = +[PLUnmanagedAdjustment copyUnmanagedAdjustmentFromSourceAsset:forPlaceholderAsset:inLibrary:error:](PLUnmanagedAdjustment, "copyUnmanagedAdjustmentFromSourceAsset:forPlaceholderAsset:inLibrary:error:", v10, v6, library, &v36);
      v15 = v36;
      v16 = v14 != 0;
      if (v14)
      {
        objc_msgSend(v6, "setAdjustmentsState:", -[NSObject adjustmentsState](v10, "adjustmentsState"));
        -[NSObject imageRequestHints](v10, "imageRequestHints");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setImageRequestHints:", v17);

        objc_msgSend(v6, "setPackedAcceptableCropRect:", -[NSObject packedAcceptableCropRect](v10, "packedAcceptableCropRect"));
        objc_msgSend(v6, "setPackedPreferredCropRect:", -[NSObject packedPreferredCropRect](v10, "packedPreferredCropRect"));
        -[NSObject additionalAttributes](v10, "additionalAttributes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "adjustedStableHash");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "additionalAttributes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAdjustedStableHash:", v19);

        objc_msgSend(v6, "additionalAttributes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setUnmanagedAdjustment:", v14);

        PLDuplicateDetectionGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "shortDescription");
          v23 = objc_claimAutoreleasedReturnValue();
          -[PLDuplicateMerge targetAsset](self, "targetAsset");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "shortDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v23;
          v39 = 2114;
          v40 = v25;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "Duplicate Merge: transfer adjustment [%{public}@ -> %{public}@]", buf, 0x16u);

        }
      }
      else
      {
        PLDuplicateDetectionGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v15;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Duplicate Merge: Error copying source adjustment. Error: %@", buf, 0xCu);
        }
      }

      goto LABEL_23;
    }
    if (objc_msgSend(v6, "hasAdjustments"))
    {
      objc_msgSend(v6, "revertToOriginal");
      PLDuplicateDetectionGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "shortDescription");
        v14 = objc_claimAutoreleasedReturnValue();
        -[PLDuplicateMerge targetAsset](self, "targetAsset");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v14;
        v39 = 2114;
        v40 = v33;
        v34 = "Duplicate Merge: revert adjustment [%{public}@ -> %{public}@]";
LABEL_19:
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, v34, buf, 0x16u);

LABEL_23:
      }
    }
    else
    {
      PLDuplicateDetectionGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "shortDescription");
        v14 = objc_claimAutoreleasedReturnValue();
        -[PLDuplicateMerge targetAsset](self, "targetAsset");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v14;
        v39 = 2114;
        v40 = v33;
        v34 = "Duplicate Merge: no adjustment migration [%{public}@ -> %{public}@]";
        goto LABEL_19;
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  PLDuplicateDetectionGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "shortDescription");
    v26 = objc_claimAutoreleasedReturnValue();
    -[PLDuplicateMerge targetAsset](self, "targetAsset");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shortDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    v39 = 2114;
    v40 = v28;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Duplicate Merge: skipping adjustment merge - resource swap uuid mismatch [%{public}@ -> %{public}@]", buf, 0x16u);

  }
  v16 = 1;
LABEL_25:

  return v16;
}

- (void)_resetMediaAnalysisStateWithType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PLDuplicateMerge asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (a3 == 1)
    goto LABEL_4;
  v5 = v4;
  if (!a3)
  {
    PLResetMediaProcessingStateOnAsset(2, v4, 1);
    PLResetMediaProcessingStateOnAsset(1, v6, 1);
    PLResetMediaProcessingStateOnAsset(17, v6, 1);
    PLResetMediaProcessingStateOnAsset(12, v6, 0x3FFF);
    PLResetMediaProcessingStateOnAsset(10, v6, 0x3FFF);
LABEL_4:
    PLResetMediaProcessingStateOnAsset(3, v6, 1);
    v5 = v6;
  }

}

- (void)_setDCIMFilenameFromSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "asset");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateMerge asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v15, "filename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "filename");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByDeletingPathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "stringByAppendingPathExtension:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFilename:", v14);

    }
  }

}

- (BOOL)_isValidForLocationOverwriteWithSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;

  v4 = a3;
  -[PLDuplicateMerge asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_6;
  objc_msgSend(v5, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    LOBYTE(v12) = 1;
    goto LABEL_10;
  }
  v9 = objc_msgSend(v4, "hasModifiedUserLocation");
  -[PLDuplicateMerge targetAsset](self, "targetAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "hasModifiedUserLocation"))
  {

    if ((v9 & 1) == 0)
      goto LABEL_6;
LABEL_9:
    objc_msgSend(v7, "coordinate");
    v12 = objc_msgSend(v5, "isLocatedAtCoordinates:") ^ 1;
    goto LABEL_10;
  }
  v11 = objc_msgSend(v4, "hasModifiedUserLocation");

  if (!v11)
  {
    if (!v9)
      goto LABEL_6;
    goto LABEL_9;
  }
  if (-[PLDuplicateMergeModelProperties isRecentlyModifiedSourceAsset:](self->_mergeModelProperties, "isRecentlyModifiedSourceAsset:", v4))
  {
    goto LABEL_9;
  }
LABEL_6:
  LOBYTE(v12) = 0;
LABEL_10:

  return v12;
}

- (PLDuplicateAsset)targetAsset
{
  return (PLDuplicateAsset *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTargetAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAsset, 0);
  objc_storeStrong((id *)&self->_mergeModelProperties, 0);
  objc_storeStrong((id *)&self->_mergeCrashRecovery, 0);
  objc_storeStrong((id *)&self->_sourceAssets, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

BOOL __76__PLDuplicateMerge__checkCPLDisabledAssetHasValidOriginalResourcesForAsset___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "cplType") == 1 || objc_msgSend(v2, "cplType") == 18 || objc_msgSend(v2, "cplType") == 17;

  return v3;
}

void __51__PLDuplicateMerge_mergeResourcesFromSource_error___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  id obj;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_preFileCloneChecksForURL:", v5);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v11 + 40);
    v12 = +[PLManagedAsset cloneResourceFileFromURL:toURL:forDestinationResource:forDestinationAsset:fileManager:error:](PLManagedAsset, "cloneResourceFileFromURL:toURL:forDestinationResource:forDestinationAsset:fileManager:error:", v7, v5, v8, v9, v10, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v12;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a3);
  }

}

uint64_t __51__PLDuplicateMerge_mergeResourcesFromSource_error___block_invoke_59()
{
  return 1;
}

uint64_t __51__PLDuplicateMerge_mergeResourcesFromSource_error___block_invoke()
{
  return 1;
}

uint64_t __58__PLDuplicateMerge__mergeSharedLibraryMetadataFromSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userIdentifier");
}

void __35__PLDuplicateMerge_mergeWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sortedArrayUsingComparator:", &__block_literal_global_75523);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLDuplicateDetectionGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "targetAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "valueForKey:", CFSTR("privateDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: merging assets into target [%{public}@] : %{public}@", buf, 0x16u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__PLDuplicateMerge_mergeWithError___block_invoke_42;
  v8[3] = &unk_1E3670EE8;
  v9 = *(_OWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v8);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rollback");

  }
}

void __35__PLDuplicateMerge_mergeWithError___block_invoke_42(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id obj;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  PLDuplicateDetectionGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "targetAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v8;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: %{public}@ -> %{public}@", buf, 0x16u);

  }
  objc_msgSend(v6, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trashWithReason:", 3);

  objc_msgSend(*(id *)(a1 + 32), "_mergeMetadataFromSource:", v6);
  objc_msgSend(*(id *)(a1 + 32), "targetAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "resourceSwapDisabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "targetAsset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v14 + 40);
    v15 = objc_msgSend(v13, "compareResource:error:", v6, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);

    if (v15 != -1)
      goto LABEL_7;
    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(id *)(v17 + 40);
    objc_msgSend(v16, "mergeResourcesFromSource:error:", v6, &v24);
    v18 = v24;
    v12 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v18;
  }

LABEL_7:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    PLDuplicateDetectionGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "targetAsset");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v27 = v20;
      v28 = 2114;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Duplicate Merge: terminating merge for source asset %{public}@, target asset: %{public}@. Error: %@", buf, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __35__PLDuplicateMerge_mergeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (BOOL)mergeAssets:(id)a3 targetAssetOID:(id)a4 photolibrary:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  PLDuplicateMerge *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  const __CFString *v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDuplicateMerge.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetOID"));

    if (v12)
      goto LABEL_4;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDuplicateMerge.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets"));

  if (!v11)
    goto LABEL_26;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDuplicateMerge.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

LABEL_4:
  v39 = v12;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if ((objc_msgSend(v19, "isMergeReady") & 1) == 0)
        {
          PLDuplicateDetectionGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v19, "shortDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v48 = v25;
            _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Duplicate Merge: Skipping merge, asset is not merge ready: %{public}@", buf, 0xCu);

          }
          v26 = (void *)MEMORY[0x1E0CB35C8];
          v27 = *MEMORY[0x1E0D74498];
          v45 = *MEMORY[0x1E0CB2D50];
          v46 = CFSTR("Merge skipped asset failed isMergeReady");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
          v28 = (PLDuplicateMerge *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 49405, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          v31 = v39;
          v32 = v40;
          if (a6)
            *a6 = objc_retainAutorelease(v29);

          v33 = 0;
          goto LABEL_24;
        }
        objc_msgSend(v19, "asset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqual:", v11);

        if (v22)
        {
          v23 = v19;

          v16 = v23;
        }
        else if (v20)
        {
          objc_msgSend(v40, "addObject:", v19);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }

  v31 = v39;
  v32 = v40;
  v28 = -[PLDuplicateMerge initWithSourceAssets:targetAsset:photolibrary:]([PLDuplicateMerge alloc], "initWithSourceAssets:targetAsset:photolibrary:", v40, v16, v39);
  v33 = (char)-[PLDuplicateMerge mergeWithError:](v28, "mergeWithError:", a6);
LABEL_24:

  return v33;
}

@end
