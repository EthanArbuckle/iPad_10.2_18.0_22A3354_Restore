@implementation PLBackgroundJobLockedResourceWorker

- (PLBackgroundJobLockedResourceWorker)initWithLibraryBundle:(id)a3
{
  PLBackgroundJobLockedResourceWorker *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *userInfo;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLBackgroundJobLockedResourceWorker;
  v3 = -[PLBackgroundJobWorker initWithLibraryBundle:](&v7, sel_initWithLibraryBundle_, a3);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v3->_userInfo;
    v3->_userInfo = v4;

  }
  return v3;
}

- (BOOL)_eraseTableThumbnailAtIndex:(int64_t)a3 managedObjectContext:(id)a4 pathManager:(id)a5
{
  id v7;
  id v8;
  PLThumbnailManager *v9;
  void *v10;
  void *v11;
  void *v12;
  PLThumbnailManager *v13;
  PLThumbnailManager *thumbnailManager;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  int64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (!self->_thumbnailManager)
  {
    v9 = [PLThumbnailManager alloc];
    objc_msgSend(v7, "persistentStoreCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistentStores");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PLThumbnailManager initWithPhotoLibraryPathManager:storeFromMigration:](v9, "initWithPhotoLibraryPathManager:storeFromMigration:", v8, v12);
    thumbnailManager = self->_thumbnailManager;
    self->_thumbnailManager = v13;

  }
  v28 = v7;
  v15 = 1;
  +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:withPathManager:](PLThumbnailManager, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v8, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    v15 = 1;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v21 = (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "intValue");
        objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isTable"))
        {
          -[PLThumbnailManager imageTableForFormat:](self->_thumbnailManager, "imageTableForFormat:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v23, "deleteEntryAtIndex:", a3) & 1) == 0)
          {
            PLBackendGetLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              -[PLBackgroundJobWorker workerName](self, "workerName");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v35 = a3;
              v36 = 2114;
              v37 = v25;
              _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Failed to overwrite thumbnail table at index: %td for %{public}@", buf, 0x16u);

            }
            v15 = 0;
          }

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v18);
  }

  return v15 & 1;
}

- (BOOL)_cloneResourceWithCPLResourceType:(unint64_t)a3 version:(unsigned int)a4 recipeID:(unsigned int)a5 resourceType:(unsigned int)a6 utiString:(id)a7 asset:(id)a8 destinationBundleScope:(unsigned __int16)a9 pathManager:(id)a10 sourceURL:(id *)a11 destinationURL:(id *)a12 error:(id *)a13
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v20;
  id v21;
  void *v22;
  __int16 v23;
  id v24;
  id v25;
  id v26;
  char v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  _QWORD *v41;
  unint64_t v42;
  int v43;
  int v44;
  int v45;
  unsigned __int16 v46;
  _QWORD v47[4];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;

  v14 = *(_QWORD *)&a6;
  v15 = *(_QWORD *)&a5;
  v16 = *(_QWORD *)&a4;
  v20 = a7;
  v21 = a8;
  v32 = a10;
  if (objc_msgSend(v21, "bundleScope") != 4 && objc_msgSend(v21, "bundleScope"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobLockedResourceWorker.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset.bundleScope == PLBundleScopeLocked || asset.bundleScope == PLBundleScopeMain"));

  }
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 1;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__32988;
  v64 = __Block_byref_object_dispose__32989;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__32988;
  v58 = __Block_byref_object_dispose__32989;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__32988;
  v52 = __Block_byref_object_dispose__32989;
  v53 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v22 = (void *)objc_opt_class();
  v23 = objc_msgSend(v21, "bundleScope");
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __185__PLBackgroundJobLockedResourceWorker__cloneResourceWithCPLResourceType_version_recipeID_resourceType_utiString_asset_destinationBundleScope_pathManager_sourceURL_destinationURL_error___block_invoke;
  v33[3] = &unk_1E3668710;
  v38 = &v60;
  v37 = &v66;
  v33[4] = self;
  v24 = v21;
  v34 = v24;
  v42 = a3;
  v43 = v16;
  v44 = v15;
  v45 = v14;
  v25 = v20;
  v35 = v25;
  v46 = a9;
  v26 = v32;
  v36 = v26;
  v39 = &v54;
  v40 = &v48;
  v41 = v47;
  LOBYTE(v31) = 1;
  LOWORD(v30) = v23;
  objc_msgSend(v22, "_accessFileForAsset:cplResourceType:version:recipeID:resourceType:utiString:bundleScope:pathManager:mode:handler:", v24, a3, v16, v15, v14, v25, v30, v26, v31, v33);
  if (!*((_BYTE *)v67 + 24) && a13)
    *a13 = objc_retainAutorelease((id)v61[5]);
  if (a11)
    *a11 = objc_retainAutorelease((id)v55[5]);
  if (a12)
    *a12 = objc_retainAutorelease((id)v49[5]);
  v27 = *((_BYTE *)v67 + 24);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  return v27;
}

- (BOOL)_cloneResource:(id)a3 asset:(id)a4 destinationBundleScope:(unsigned __int16)a5 pathManager:(id)a6 sourceURL:(id *)a7 destinationURL:(id *)a8 error:(id *)a9
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = objc_msgSend(v14, "cplType");
  v16 = objc_msgSend(v14, "version");
  v17 = objc_msgSend(v14, "recipeID");
  v18 = objc_msgSend(v14, "resourceType");
  objc_msgSend(v14, "uniformTypeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v22) = a5;
  LOBYTE(v18) = -[PLBackgroundJobLockedResourceWorker _cloneResourceWithCPLResourceType:version:recipeID:resourceType:utiString:asset:destinationBundleScope:pathManager:sourceURL:destinationURL:error:](self, "_cloneResourceWithCPLResourceType:version:recipeID:resourceType:utiString:asset:destinationBundleScope:pathManager:sourceURL:destinationURL:error:", v15, v16, v17, v18, v20, v13, v22, v12, a7, a8, a9);

  return v18;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  PLBackgroundJobWorkerPendingWorkItems *v7;
  void *v8;
  PLBackgroundJobWorkerPendingWorkItems *v9;
  _QWORD v11[4];
  id v12;
  PLBackgroundJobLockedResourceWorker *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__32988;
    v19 = __Block_byref_object_dispose__32989;
    v20 = 0;
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[PLBackgroundJobWorker workerName](self, "workerName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v6;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ running on library: %@", buf, 0x16u);

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__PLBackgroundJobLockedResourceWorker_workItemsNeedingProcessingInLibrary___block_invoke;
    v11[3] = &unk_1E3676EA0;
    v12 = v4;
    v13 = self;
    v14 = &v15;
    objc_msgSend(v12, "performBlockAndWait:", v11);
    v7 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    +[PLBackgroundJobCriteria criteriaForUrgentResourceWorker](PLBackgroundJobCriteria, "criteriaForUrgentResourceWorker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v7, "initWithCriteria:workItemsNeedingProcessing:", v8, v16[5]);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithZeroWorkItems");
  }

  return v9;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  const __CFString *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  const __CFString *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t i;
  const __CFString *v42;
  void *v43;
  char v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  char v50;
  id v51;
  NSObject *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  uint64_t v56;
  char v57;
  id v58;
  NSObject *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  void (**v75)(id, void *);
  _QWORD v77[4];
  id v78;
  id v79;
  PLBackgroundJobLockedResourceWorker *v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  id v96;
  PLBackgroundJobLockedResourceWorker *v97;
  id v98;
  id v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t *v102;
  uint64_t *v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t (*v125)(uint64_t, uint64_t);
  void (*v126)(uint64_t);
  id v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  uint8_t buf[4];
  uint64_t v141;
  __int16 v142;
  const __CFString *v143;
  __int16 v144;
  id v145;
  __int16 v146;
  uint64_t v147;
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;
  _QWORD v151[4];

  v151[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v73 = a4;
  v75 = (void (**)(id, void *))a5;
  v72 = v7;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v150 = *MEMORY[0x1E0CB2938];
    v151[0] = CFSTR("LockingHiddenMoveResources fetaure not enabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, &v150, 1);
    v74 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46309, v74);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v75[2](v75, v33);

    goto LABEL_64;
  }
  v8 = v7;
  v134 = 0;
  v135 = &v134;
  v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__32988;
  v138 = __Block_byref_object_dispose__32989;
  v139 = 0;
  v128 = 0;
  v129 = &v128;
  v130 = 0x3032000000;
  v131 = __Block_byref_object_copy__32988;
  v132 = __Block_byref_object_dispose__32989;
  v133 = 0;
  v122 = 0;
  v123 = &v122;
  v124 = 0x3032000000;
  v125 = __Block_byref_object_copy__32988;
  v126 = __Block_byref_object_dispose__32989;
  v127 = 0;
  v116 = 0;
  v117 = &v116;
  v118 = 0x3032000000;
  v119 = __Block_byref_object_copy__32988;
  v120 = __Block_byref_object_dispose__32989;
  v121 = 0;
  v110 = 0;
  v111 = &v110;
  v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__32988;
  v114 = __Block_byref_object_dispose__32989;
  v115 = 0;
  v106 = 0;
  v107 = &v106;
  v108 = 0x2020000000;
  v109 = 0;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = __78__PLBackgroundJobLockedResourceWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v94[3] = &unk_1E3668738;
  v95 = v73;
  v74 = v8;
  v96 = v74;
  v97 = self;
  v100 = &v134;
  v101 = &v106;
  v102 = &v116;
  v103 = &v122;
  v104 = &v110;
  v105 = &v128;
  v70 = v9;
  v98 = v70;
  v71 = v10;
  v99 = v71;
  v69 = v95;
  objc_msgSend(v95, "performBlockAndWait:", v94);
  if (v107[3] != 2)
  {
    PLBackendGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      -[PLBackgroundJobWorker workerName](self, "workerName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (const __CFString *)v123[5];
      *(_DWORD *)buf = 138543874;
      v141 = (uint64_t)v35;
      v142 = 2114;
      v143 = v36;
      v144 = 2112;
      v145 = v71;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "%{public}@ failed to transition hidden or trashed asset %{public}@, cleaning up cloned URLs: %@", buf, 0x20u);

    }
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v37 = v71;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v84, v148, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v85;
      v40 = 1;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v85 != v39)
            objc_enumerationMutation(v37);
          v42 = *(const __CFString **)(*((_QWORD *)&v84 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = 0;
          v44 = objc_msgSend(v43, "removeItemAtURL:error:", v42, &v83);
          v45 = v83;

          if ((v44 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
          {
            PLBackendGetLog();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              -[PLBackgroundJobWorker workerName](self, "workerName");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v141 = (uint64_t)v47;
              v142 = 2112;
              v143 = v42;
              v144 = 2112;
              v145 = v45;
              _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove destination resource URL: %@, error: %@", buf, 0x20u);

            }
            v40 = 0;
          }

        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v84, v148, 16);
      }
      while (v38);
    }
    else
    {
      v40 = 1;
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v117[5];
    v82 = 0;
    v50 = objc_msgSend(v48, "removeItemAtURL:error:", v49, &v82);
    v51 = v82;

    if ((v50 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      PLBackendGetLog();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        -[PLBackgroundJobWorker workerName](self, "workerName");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (const __CFString *)v117[5];
        *(_DWORD *)buf = 138543874;
        v141 = (uint64_t)v53;
        v142 = 2112;
        v143 = v54;
        v144 = 2112;
        v145 = v51;
        _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove source marker file URL: %@, error: %@", buf, 0x20u);

      }
    }
    if ((v40 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v111[5];
      v81 = 0;
      v57 = objc_msgSend(v55, "removeItemAtURL:error:", v56, &v81);
      v58 = v81;

      if ((v57 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
      {
        PLBackendGetLog();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          -[PLBackgroundJobWorker workerName](self, "workerName");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (const __CFString *)v111[5];
          *(_DWORD *)buf = 138543874;
          v141 = (uint64_t)v60;
          v142 = 2112;
          v143 = v61;
          v144 = 2112;
          v145 = v58;
          _os_log_impl(&dword_199541000, v59, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove destination marker file URL: %@, error: %@", buf, 0x20u);

        }
      }

    }
    v24 = v107[3];
    goto LABEL_55;
  }
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[PLBackgroundJobWorker workerName](self, "workerName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (const __CFString *)v123[5];
    *(_DWORD *)buf = 138543874;
    v141 = (uint64_t)v12;
    v142 = 2114;
    v143 = v13;
    v144 = 2112;
    v145 = v70;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ cleaning source resources for hidden or trashed asset %{public}@ after move: %@", buf, 0x20u);

  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v14 = v70;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v90, v149, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v91;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v91 != v16)
          objc_enumerationMutation(v14);
        v18 = *(const __CFString **)(*((_QWORD *)&v90 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = 0;
        v20 = objc_msgSend(v19, "removeItemAtURL:error:", v18, &v89);
        v21 = v89;

        if ((v20 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
        {
          PLBackendGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            -[PLBackgroundJobWorker workerName](self, "workerName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v141 = (uint64_t)v23;
            v142 = 2112;
            v143 = v18;
            v144 = 2112;
            v145 = v21;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove source resource URL: %@, error: %@", buf, 0x20u);

          }
          v107[3] = 6;
        }

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v90, v149, 16);
    }
    while (v15);
  }

  v24 = v107[3];
  if (v24 != 2)
    goto LABEL_55;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v117[5];
  v88 = 0;
  v27 = objc_msgSend(v25, "removeItemAtURL:error:", v26, &v88);
  v28 = v88;

  if ((v27 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
  {
    PLBackendGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      -[PLBackgroundJobWorker workerName](self, "workerName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (const __CFString *)v117[5];
      *(_DWORD *)buf = 138543874;
      v141 = (uint64_t)v30;
      v142 = 2112;
      v143 = v31;
      v144 = 2112;
      v145 = v28;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove source marker file URL: %@, error: %@", buf, 0x20u);

    }
    v107[3] = 6;
  }

  v24 = v107[3];
  if (v24 != 2)
  {
LABEL_55:
    if (v24 == 5)
    {
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __78__PLBackgroundJobLockedResourceWorker_performWorkOnItem_inLibrary_completion___block_invoke_77;
      v77[3] = &unk_1E3677530;
      v78 = v69;
      v79 = v74;
      v80 = self;
      objc_msgSend(v78, "performTransactionAndWait:", v77);

    }
    goto LABEL_57;
  }
  v107[3] = 4;
LABEL_57:
  if (v129[5])
    +[PLClientServerTransaction removeTransactionFromUserInfo:](PLClientServerTransaction, "removeTransactionFromUserInfo:", self->_userInfo);
  objc_msgSend(v69, "globalValues");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setLockedResourceTransitionAssetUUID:", 0);
  PLBackendGetLog();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    -[PLBackgroundJobWorker workerName](self, "workerName");
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)v64;
    v66 = CFSTR("N");
    v67 = (void *)v107[3];
    if (v67 == (void *)4)
      v66 = CFSTR("Y");
    v68 = v135[5];
    *(_DWORD *)buf = 138544130;
    v141 = v64;
    v142 = 2114;
    v143 = v66;
    v144 = 2048;
    v145 = v67;
    v146 = 2112;
    v147 = v68;
    _os_log_impl(&dword_199541000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with success: %{public}@, final state: %tu, error: %@", buf, 0x2Au);

  }
  v75[2](v75, (void *)v135[5]);

  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);

  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(&v122, 8);

  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v134, 8);

LABEL_64:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_thumbnailManager, 0);
}

void __78__PLBackgroundJobLockedResourceWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  char v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  char v83;
  id v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i;
  uint64_t v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  NSObject *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  BOOL v116;
  id v117;
  uint64_t v118;
  NSObject *v119;
  void *v120;
  id v121;
  id obj;
  void *v123;
  unsigned int v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  id v134;
  id v135;
  id v136;
  id v137;
  uint8_t buf[4];
  void *v139;
  __int16 v140;
  id v141;
  __int16 v142;
  id v143;
  __int16 v144;
  id v145;
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v137 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v137);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v137;
  v121 = v137;

  if (!v4)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "workerName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v139 = v7;
      v140 = 2112;
      v141 = v121;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "%{public}@ failed fetch request, error: %@", buf, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 3;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v9 = 0x1E0CB3000uLL;
  if (!v8)
  {
    v10 = objc_msgSend(v4, "bundleScope");
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLockedResourceTransferRecovery dontImportMarkerFileURLForAsset:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "dontImportMarkerFileURLForAsset:bundleScope:pathManager:", v4, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v136 = 0;
    v17 = objc_msgSend(v15, "removeItemAtURL:error:", v16, &v136);
    v18 = v136;
    v19 = v136;

    if ((v17 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      PLBackendGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "workerName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v139 = v21;
        v140 = 2112;
        v141 = v22;
        v142 = 2112;
        v143 = v19;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "%{public}@ found dirty marker file in source bundle scope at path: '%@', failed to remove with error: %@", buf, 0x20u);

      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v18);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 5;
    }

    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    if (v8)
    {
      v124 = 5;
      v9 = 0x1E0CB3000uLL;
      goto LABEL_23;
    }
    objc_msgSend(v4, "uuid");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    v124 = objc_msgSend(v4, "expectedBundleScopeBasedOnAssetLockingProperties");
    v9 = 0x1E0CB3000uLL;
    if (v124 == objc_msgSend(v4, "bundleScope"))
    {
      PLBackendGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "workerName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v27;
        v140 = 2114;
        v141 = v28;
        v29 = "%{public}@ no work required for asset %{public}@, bundle scope matches locked resource state";
        v30 = v26;
        v31 = 22;
LABEL_20:
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);

      }
    }
    else
    {
      if (!objc_msgSend(v4, "deferredProcessingNeeded"))
      {
        v34 = 1;
        goto LABEL_22;
      }
      PLBackendGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "workerName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
        v33 = objc_msgSend(v4, "deferredProcessingNeeded");
        *(_DWORD *)buf = 138543874;
        v139 = v27;
        v140 = 2114;
        v141 = v32;
        v142 = 1024;
        LODWORD(v143) = v33;
        v29 = "%{public}@ asset %{public}@ requires deferred processing (%hu), skipping";
        v30 = v26;
        v31 = 28;
        goto LABEL_20;
      }
    }

    v34 = 3;
LABEL_22:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v34;
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    goto LABEL_23;
  }
  v124 = 5;
LABEL_23:
  if (v8 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLockedResourceTransferRecovery dontImportMarkerFileURLForAsset:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "dontImportMarkerFileURLForAsset:bundleScope:pathManager:", v4, v124, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v36;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "path");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "fileExistsAtPath:", v40);

    if (v41)
    {
      PLBackendGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "workerName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "path");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v139 = v43;
        v140 = 2112;
        v141 = v44;
        _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "%{public}@ destination marker file already exists, bailing out, path: '%@'", buf, 0x16u);

      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 5;
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != 1)
    goto LABEL_82;
  PLBackendGetLog();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "workerName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v139 = v46;
    v140 = 2114;
    v141 = v47;
    _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ cloning resources for hidden or trashed asset %{public}@", buf, 0x16u);

  }
  v123 = v4;

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setLockedResourceTransitionAssetUUID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("PLTransactionScopeLockedResources"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v49, v50, "-[PLBackgroundJobLockedResourceWorker performWorkOnItem:inLibrary:completion:]_block_invoke");
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  v53 = *(void **)(v52 + 40);
  *(_QWORD *)(v52 + 40) = v51;

  +[PLClientServerTransaction addTransaction:toUserInfo:](PLClientServerTransaction, "addTransaction:toUserInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112));
  PLBackendGetLog();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 48), "workerName");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "transactionToken");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v139 = v55;
    v140 = 2112;
    v141 = v56;
    _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_DEBUG, "%{public}@ started client server transaction with token: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "URLByDeletingLastPathComponent");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = 0;
  v59 = objc_msgSend(v58, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v57, 1, 0, &v135);
  v60 = v135;
  v61 = v135;

  if (!v59)
  {
    PLBackendGetLog();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "workerName");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "path");
      v72 = v48;
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v139 = v71;
      v140 = 2112;
      v141 = v73;
      v142 = 2112;
      v143 = v61;
      _os_log_impl(&dword_199541000, v70, OS_LOG_TYPE_ERROR, "%{public}@ failed to create marker file directory: '%@', %@", buf, 0x20u);

      v48 = v72;
      v9 = 0x1E0CB3000;

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v60);
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "path");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v62, "createFileAtPath:contents:attributes:", v63, 0, 0);

  PLBackendGetLog();
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if ((v64 & 1) == 0)
  {
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "workerName");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "path");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v139 = v74;
      v140 = 2112;
      v141 = v75;
      _os_log_impl(&dword_199541000, v66, OS_LOG_TYPE_ERROR, "%{public}@ failed to create marker file: '%@'", buf, 0x16u);

    }
LABEL_44:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 5;
    goto LABEL_45;
  }
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "workerName");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "uuid");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "path");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v139 = v67;
    v140 = 2114;
    v141 = v68;
    v142 = 2112;
    v143 = v69;
    _os_log_impl(&dword_199541000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ wrote marker file for asset %{public}@, at path: '%@'", buf, 0x20u);

  }
LABEL_45:

  v4 = v123;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 1)
  {
    v76 = objc_msgSend(v123, "thumbnailIndex");
    if (v76 != -1 && v124 == 4)
    {
      v77 = v76;
      v78 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pathManager");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "_eraseTableThumbnailAtIndex:managedObjectContext:pathManager:", v77, v79, v80);

    }
    objc_msgSend(*(id *)(v9 + 1568), "defaultManager");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "fileURLForThumbnailFile");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = 0;
    v83 = objc_msgSend(v81, "removeItemAtURL:error:", v82, &v134);
    v84 = v134;

    if ((v83 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      PLBackendGetLog();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "workerName");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "fileURLForThumbnailFile");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "path");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v139 = v86;
        v140 = 2112;
        v141 = v88;
        v142 = 2112;
        v143 = v84;
        _os_log_impl(&dword_199541000, v85, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove file at path: '%@', error: %@", buf, 0x20u);

      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 5;
    }

    objc_msgSend(v123, "allFileBackedResources");
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v131;
      while (2)
      {
        for (i = 0; i != v90; ++i)
        {
          if (*(_QWORD *)v131 != v91)
            objc_enumerationMutation(obj);
          v93 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * i);
          v94 = *(void **)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 32), "pathManager");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = 0;
          v129 = 0;
          v127 = 0;
          LOBYTE(v93) = objc_msgSend(v94, "_cloneResource:asset:destinationBundleScope:pathManager:sourceURL:destinationURL:error:", v93, v4, v124, v95, &v129, &v128, &v127);
          v96 = v129;
          v97 = v128;
          v98 = v127;

          if ((v93 & 1) == 0)
          {
            PLBackendGetLog();
            v99 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(a1 + 48), "workerName");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v139 = v100;
              v140 = 2112;
              v141 = v98;
              _os_log_impl(&dword_199541000, v99, OS_LOG_TYPE_ERROR, "%{public}@ failed to clone resource with error: %@", buf, 0x16u);

            }
            v101 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            v102 = *(void **)(v101 + 40);
            *(_QWORD *)(v101 + 40) = v98;
            v103 = v98;

            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 5;
            v4 = v123;
            goto LABEL_70;
          }
          if (v96)
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v96);
          if (v97)
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v97);

          v4 = v123;
        }
        v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
        if (v90)
          continue;
        break;
      }
    }
LABEL_70:

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 1)
    {
      v104 = (void *)MEMORY[0x1E0D73208];
      v105 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
      v106 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "pathManager");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "capabilities");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = 0;
      LOBYTE(v104) = objc_msgSend(v104, "secureMoveItemAtURL:toURL:capabilities:error:", v105, v106, v108, &v126);
      v109 = v126;
      v110 = v126;

      if ((v104 & 1) == 0)
      {
        PLBackendGetLog();
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 48), "workerName");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "uuid");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "path");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v139 = v112;
          v140 = 2114;
          v141 = v113;
          v142 = 2112;
          v143 = v114;
          v144 = 2112;
          v145 = v110;
          _os_log_impl(&dword_199541000, v111, OS_LOG_TYPE_ERROR, "%{public}@ move marker file for asset: %{public}@, path: '%@', error: %@", buf, 0x2Au);

          v4 = v123;
        }

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v109);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 5;
      }

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 1)
      {
        v115 = *(_QWORD *)(a1 + 32);
        v125 = 0;
        v116 = +[PLLockedResourceTransferRecovery updateAssetPropertiesAndSaveForAsset:moveToDestinationScope:library:error:](PLLockedResourceTransferRecovery, "updateAssetPropertiesAndSaveForAsset:moveToDestinationScope:library:error:", v4, v124, v115, &v125);
        v117 = v125;
        if (v116)
        {
          v118 = 2;
        }
        else
        {
          PLBackendGetLog();
          v119 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 48), "workerName");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v139 = v120;
            v140 = 2112;
            v141 = v117;
            _os_log_impl(&dword_199541000, v119, OS_LOG_TYPE_ERROR, "%{public}@ failed to update asset with error: %@", buf, 0x16u);

          }
          v118 = 5;
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v118;

      }
    }
  }
LABEL_82:

}

void __78__PLBackgroundJobLockedResourceWorker_performWorkOnItem_inLibrary_completion___block_invoke_77(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v4)
  {
    objc_msgSend(v4, "setDeferredProcessingNeeded:", 11);
  }
  else
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "workerName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "%{public}@ failed fetch request, error: %@", buf, 0x16u);

    }
  }

}

void __75__PLBackgroundJobLockedResourceWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[5];

  v52[3] = *MEMORY[0x1E0C80C00];
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("hidden"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trashedState"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trashedState"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "orPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("bundleScope"), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v51[0] = v6;
  v51[1] = v7;
  v43 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("bundleScope"), 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3528];
  v42 = (void *)v10;
  v49[0] = v10;
  v49[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "orPredicateWithSubpredicates:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "addObject:", v18);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d && %K == %d"), CFSTR("deferredProcessingNeeded"), 0, CFSTR("videoDeferredProcessingNeeded"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObject:", v19);
  if (objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("cloudLocalState"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v20);

  }
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForAssetsAllowingLockedResourceTransfer"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObject:", v21);
  v22 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fetchRequestWithEntityName:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v40);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPredicate:", v25);

  objc_msgSend(v24, "setFetchLimit:", 100);
  objc_msgSend(v24, "setResultType:", 1);
  PLBackendGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "workerName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predicate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v27;
    v47 = 2112;
    v48 = (uint64_t)v28;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "%{public}@ fetching work items with predicate: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v29, "executeFetchRequest:error:", v24, &v44);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v44;
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v33 = *(void **)(v32 + 40);
  *(_QWORD *)(v32 + 40) = v30;

  PLBackendGetLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "workerName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    *(_DWORD *)buf = 138543618;
    v46 = v35;
    v47 = 2048;
    v48 = v36;
    _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEBUG, "%{public}@ found %td results", buf, 0x16u);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLBackendGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "workerName");
      v38 = v15;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v39;
      v47 = 2112;
      v48 = (uint64_t)v31;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "%{public}@ failed fetch request, error: %@", buf, 0x16u);

      v15 = v38;
    }

  }
}

void __185__PLBackgroundJobLockedResourceWorker__cloneResourceWithCPLResourceType_version_recipeID_resourceType_utiString_asset_destinationBundleScope_pathManager_sourceURL_destinationURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_opt_class();
    v20 = *(_QWORD *)(a1 + 104);
    v21 = (void *)v7;
    v8 = *(unsigned int *)(a1 + 112);
    v9 = *(unsigned int *)(a1 + 116);
    v10 = *(unsigned int *)(a1 + 120);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_WORD *)(a1 + 124);
    v14 = *(_QWORD *)(a1 + 56);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __185__PLBackgroundJobLockedResourceWorker__cloneResourceWithCPLResourceType_version_recipeID_resourceType_utiString_asset_destinationBundleScope_pathManager_sourceURL_destinationURL_error___block_invoke_2;
    v22[3] = &unk_1E36686E8;
    v26 = *(_OWORD *)(a1 + 64);
    v15 = v5;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v23 = v15;
    v24 = v16;
    v25 = v17;
    v27 = *(_OWORD *)(a1 + 80);
    v28 = *(_QWORD *)(a1 + 96);
    LOBYTE(v19) = 2;
    LOWORD(v18) = v13;
    objc_msgSend(v21, "_accessFileForAsset:cplResourceType:version:recipeID:resourceType:utiString:bundleScope:pathManager:mode:handler:", v11, v20, v8, v9, v10, v12, v18, v14, v19, v22);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  }

}

void __185__PLBackgroundJobLockedResourceWorker__cloneResourceWithCPLResourceType_version_recipeID_resourceType_utiString_asset_destinationBundleScope_pathManager_sourceURL_destinationURL_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  BOOL v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  char v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "workerName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v54 = v8;
        v55 = 2114;
        v56 = v9;
        v57 = 2112;
        v58 = v10;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "%{public}@ source and destination URLs are equal for asset: %{public}@ at URL: %@", buf, 0x20u);

      }
      goto LABEL_34;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 32));
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v54 = v13;
      v55 = 2112;
      v56 = v14;
      v57 = 2112;
      v58 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to copy resource from URL: %@ to URL: %@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByDeletingLastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    v17 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v52);
    v18 = v52;

    if (v17)
    {
      v19 = *(_QWORD *)(a1 + 32);
      v51 = v18;
      v20 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v19, v5, &v51);
      v7 = v51;

      if (v20)
      {
LABEL_10:
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v22 = v5;
LABEL_20:
        v31 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v22;
LABEL_21:

        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
          v48 = 0;
          v47 = -1;
          objc_msgSend(*(id *)(a1 + 32), "path");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 0;
          v33 = +[PLCacheDeleteSupport isPurgeableFile:outIsPhotoType:outUrgencyLevel:error:](PLCacheDeleteSupport, "isPurgeableFile:outIsPhotoType:outUrgencyLevel:error:", v32, &v48, &v47, &v46);
          v34 = v46;

          if (v33)
          {
            if (!v48)
            {
              PLBackendGetLog();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(*(id *)(a1 + 40), "workerName");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 48), "uuid");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = *(void **)(a1 + 32);
                *(_DWORD *)buf = 138543874;
                v54 = v36;
                v55 = 2114;
                v56 = v37;
                v57 = 2112;
                v58 = v38;
                _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "%{public}@ found non-photos purgeable file belonging to asset: %{public}@ at URL: %@", buf, 0x20u);

              }
            }
            v39 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24;
            v45 = v34;
            v40 = +[PLCacheDeleteSupport markPurgeableForFileAtURL:withUrgency:outInode:error:](PLCacheDeleteSupport, "markPurgeableForFileAtURL:withUrgency:outInode:error:", v5, v47, v39, &v45);
            v41 = v45;

            if (v40)
              goto LABEL_33;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
            v42 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v43 = v41;
          }
          else
          {
            if (!v34)
            {
              v41 = 0;
              goto LABEL_33;
            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
            v42 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v43 = v34;
          }
          v41 = v43;
          v44 = *(void **)(v42 + 40);
          *(_QWORD *)(v42 + 40) = v43;

LABEL_33:
        }
LABEL_34:

        goto LABEL_35;
      }
      if (!PLIsErrorOrUnderlyingErrorFileExists())
      {
        if ((PLIsErrorFileNotFound() & 1) != 0)
          goto LABEL_34;
        goto LABEL_19;
      }
      PLBackendGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v25;
        v55 = 2112;
        v56 = v5;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "%{public}@ file already exists, removing item and trying again, at URL: %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v7;
      v27 = objc_msgSend(v26, "removeItemAtURL:error:", v5, &v50);
      v18 = v50;

      if (v27)
      {
        v28 = *(_QWORD *)(a1 + 32);
        v49 = v18;
        v29 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v28, v5, &v49);
        v7 = v49;

        if (v29)
          goto LABEL_10;
LABEL_19:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v22 = v7;
        v7 = v22;
        goto LABEL_20;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = v18;
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v7;
    goto LABEL_21;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
LABEL_35:

}

+ (void)_accessFileForAsset:(id)a3 cplResourceType:(unint64_t)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6 resourceType:(unsigned int)a7 utiString:(id)a8 bundleScope:(unsigned __int16)a9 pathManager:(id)a10 mode:(unsigned __int8)a11 handler:(id)a12
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v13 = *(_QWORD *)&a7;
  v14 = *(_QWORD *)&a6;
  v15 = *(_QWORD *)&a5;
  v41[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a8;
  v19 = a10;
  v20 = a12;
  if (objc_msgSend(v19, "shouldUseFileIdentifierForBundleScope:", a9))
  {
    v37 = v19;
    v21 = v14;
    v22 = v13;
    v23 = v20;
    v24 = v18;
    v25 = objc_alloc(MEMORY[0x1E0D73278]);
    objc_msgSend(v17, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "originalFilename");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v25;
    v18 = v24;
    v20 = v23;
    v29 = v21;
    v19 = v37;
    v30 = (void *)objc_msgSend(v28, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v26, a9, v18, v15, v22, v29, v27);

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __152__PLBackgroundJobLockedResourceWorker__accessFileForAsset_cplResourceType_version_recipeID_resourceType_utiString_bundleScope_pathManager_mode_handler___block_invoke;
    v38[3] = &unk_1E3671390;
    v39 = v20;
    objc_msgSend(v37, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v30, a11, v38);

  }
  else
  {
    LOWORD(v36) = a9;
    +[PLLockedResourceTransferRecovery dcimFileURLForAsset:cplResourceType:version:recipeID:resourceType:utiString:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "dcimFileURLForAsset:cplResourceType:version:recipeID:resourceType:utiString:bundleScope:pathManager:", v17, a4, v15, v14, v13, v18, v36, v19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = 0;
    }
    else
    {
      v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0D74498];
      v40 = *MEMORY[0x1E0CB2938];
      v41[0] = CFSTR("nil dcim url");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 46309, v35);

    }
    (*((void (**)(id, void *, void *))v20 + 2))(v20, v31, v32);

  }
}

+ (BOOL)_isRecoveringFromTransferForAsset:(id)a3 pathManager:(id)a4 mainMarkerURLIfExists:(id *)a5 lockedMarkerURLIfExists:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;

  v9 = a4;
  v10 = a3;
  +[PLLockedResourceTransferRecovery dontImportMarkerFileURLForAsset:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "dontImportMarkerFileURLForAsset:bundleScope:pathManager:", v10, 0, v9);
  v11 = objc_claimAutoreleasedReturnValue();
  +[PLLockedResourceTransferRecovery dontImportMarkerFileURLForAsset:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "dontImportMarkerFileURLForAsset:bundleScope:pathManager:", v10, 4, v9);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

  if ((v15 & 1) == 0)
  {

    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "fileExistsAtPath:", v17);

  if ((v18 & 1) == 0)
  {

    v12 = 0;
  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v11);
  if (a6)
    *a6 = objc_retainAutorelease((id)v12);

  return (v11 | v12) != 0;
}

+ (BOOL)_removeFilesForAsset:(id)a3 inBundleScope:(unsigned __int16)a4 pathManager:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v22;
  char v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "allFileBackedResources");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v27;
    v23 = 1;
    *(_QWORD *)&v10 = 138412802;
    v22 = v10;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        +[PLLockedResourceTransferRecovery destinationURLForResource:asset:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "destinationURLForResource:asset:bundleScope:pathManager:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v7, v6, v8, v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v16 = objc_msgSend(v15, "removeItemAtURL:error:", v14, &v25);
        v17 = v25;

        if ((v16 & 1) != 0)
        {
          PLBackendGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "uuid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v31 = v19;
            v32 = 2112;
            v33 = v14;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker successfully cleaned up orphan file for asset: %{public}@, url: %@", buf, 0x16u);

          }
        }
        else
        {
          if ((PLIsErrorFileNotFound() & 1) != 0)
            goto LABEL_14;
          PLBackendGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "uuid");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v31 = v14;
            v32 = 2114;
            v33 = v20;
            v34 = 2112;
            v35 = v17;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed to remove file at URL: %@, for asset: %{public}@, error: %@", buf, 0x20u);

          }
          v23 = 0;
        }

LABEL_14:
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (!v11)
        goto LABEL_18;
    }
  }
  v23 = 1;
LABEL_18:

  return v23 & 1;
}

+ (void)recoverFromInterruptedJobWithLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "globalValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockedResourceTransitionAssetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker attempting to recover from interrupted job for asset: %{public}@", buf, 0xCu);
  }

  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__PLBackgroundJobLockedResourceWorker_recoverFromInterruptedJobWithLibrary___block_invoke;
    v9[3] = &unk_1E3677C40;
    v10 = v6;
    v11 = v4;
    v12 = a1;
    objc_msgSend(v11, "performBlockAndWait:", v9);

    v8 = v10;
  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "LockedResourceWorker recover was called, but no recovery asset uuid found in global values", buf, 2u);
    }
  }

}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return ((unint64_t)a3 < 4) & (3u >> (a3 & 0xF));
}

void __76__PLBackgroundJobLockedResourceWorker_recoverFromInterruptedJobWithLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  void *v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  int v36;
  NSObject *v37;
  _BOOL4 v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  _BOOL4 v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  NSObject *v72;
  __int16 v73;
  NSObject *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v70);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v70;

  if (!v7)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v72 = v20;
      v73 = 2112;
      v74 = v8;
      v21 = "LockedResourceWorker failed to fetch asset %{public}@, error: %@";
      v22 = v19;
      v23 = 22;
LABEL_12:
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    }
LABEL_13:
    v25 = 0;
    v13 = 0;
    v9 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(v7, "count"))
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v24 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v72 = v24;
      v21 = "LockedResourceWorker failed to find asset with UUID %{public}@";
      v22 = v19;
      v23 = 12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "bundleScope") && objc_msgSend(v9, "bundleScope") != 4)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v42 = *(NSObject **)(a1 + 32);
      v43 = objc_msgSend(v9, "bundleScope");
      *(_DWORD *)buf = 138543618;
      v72 = v42;
      v73 = 1024;
      LODWORD(v74) = v43;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "LockedResourceWorker asked to repair asset (%{public}@) with invalid bundle scope: %hu", buf, 0x12u);
    }
    v25 = 0;
    v13 = 0;
    goto LABEL_14;
  }
  v10 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v69 = 0;
  v12 = objc_msgSend(v10, "_isRecoveringFromTransferForAsset:pathManager:mainMarkerURLIfExists:lockedMarkerURLIfExists:", v9, v11, &v69, &v68);
  v13 = (unint64_t)v69;
  v14 = (unint64_t)v68;

  PLBackendGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v16)
      goto LABEL_19;
    v17 = *(NSObject **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v72 = v17;
    v18 = "LockedResourceWorker fixing interrupted transfer for asset: %{public}@";
  }
  else
  {
    if (!v16)
      goto LABEL_19;
    v28 = *(NSObject **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v72 = v28;
    v18 = "LockedResourceWorker did not find marker file for asset: %{public}@";
  }
  _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
LABEL_19:

  if (v13 && v14)
  {
    v60 = v4;
    v61 = v8;
    v63 = v14;
    PLBackendGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v72 = v30;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker found main and locked marker files for interrupted transfer asset: %{public}@", buf, 0xCu);
    }

    v31 = objc_msgSend(v9, "bundleScope");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = v13;
    if (v31)
      v35 = v13;
    else
      v35 = v63;
    v67 = 0;
    v36 = objc_msgSend(v32, "removeItemAtURL:error:", v35, &v67);
    v19 = v67;

    if (!v36)
    {
      PLBackendGetLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v72 = v35;
        v73 = 2112;
        v74 = v19;
        _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed to remove marker file URL: %@, error: %@", buf, 0x16u);
      }

      v8 = v61;
      v25 = v63;
      v4 = v60;
      goto LABEL_14;
    }
    if (v31)
    {
      v34 = 0;
      v14 = (unint64_t)v63;
    }
    else
    {
      v14 = 0;
    }

    v8 = v61;
    v13 = v34;
    v4 = v60;
  }
  if (!(v13 | v14))
  {
    v25 = 0;
LABEL_40:
    PLBackendGetLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v72 = v45;
      _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker successfully repaired interrupted transfer asset: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "globalValues");
    v26 = objc_claimAutoreleasedReturnValue();
    -[NSObject setLockedResourceTransitionAssetUUID:](v26, "setLockedResourceTransitionAssetUUID:", 0);
    goto LABEL_43;
  }
  PLBackendGetLog();
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
  v64 = v14;
  if (v13)
  {
    if (v38)
    {
      v39 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v72 = v39;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker found main marker file for interrupted transfer asset: %{public}@", buf, 0xCu);
    }
    v40 = 0;
    v41 = 4;
  }
  else
  {
    if (v38)
    {
      v47 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v72 = v47;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker found locked marker file for interrupted transfer asset: %{public}@", buf, 0xCu);
    }
    v41 = 0;
    v40 = 4;
  }

  if (objc_msgSend(v9, "bundleScope") != (_DWORD)v41)
  {
    v48 = *(_QWORD *)(a1 + 40);
    v66 = 0;
    v49 = +[PLLockedResourceTransferRecovery updateAssetPropertiesAndSaveForAsset:moveToDestinationScope:library:error:](PLLockedResourceTransferRecovery, "updateAssetPropertiesAndSaveForAsset:moveToDestinationScope:library:error:", v9, v41, v48, &v66);
    v50 = v66;
    v19 = v50;
    if (!v49)
    {
      PLBackendGetLog();
      v58 = objc_claimAutoreleasedReturnValue();
      v25 = v64;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v19;
        _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed to update asset with error: %@", buf, 0xCu);
      }

      goto LABEL_14;
    }

  }
  v62 = v8;
  v51 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "pathManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v51) = objc_msgSend(v51, "_removeFilesForAsset:inBundleScope:pathManager:", v9, v40, v52);

  if ((v51 & 1) != 0)
  {
    v25 = v64;
    if (v13)
      v53 = (void *)v13;
    else
      v53 = v64;
    v19 = v53;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0;
    v55 = objc_msgSend(v54, "removeItemAtURL:error:", v19, &v65);
    v56 = v65;

    if ((v55 & 1) != 0)
    {

      v8 = v62;
      goto LABEL_40;
    }
    PLBackendGetLog();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v72 = v19;
      v73 = 2112;
      v74 = v56;
      _os_log_impl(&dword_199541000, v59, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed to remove marker file URL: %@, error: %@", buf, 0x16u);
    }

    v8 = v62;
    v25 = v64;
  }
  else
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = v64;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v57 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v72 = v57;
      v73 = 1024;
      LODWORD(v74) = v40;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed to remove all resource files for asset: %{public}@, bundle scope: %hu", buf, 0x12u);
    }
    v8 = v62;
  }
LABEL_14:

  PLBackendGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = *(NSObject **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v72 = v27;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed repair interrupted transfer asset: %{public}@", buf, 0xCu);
  }
LABEL_43:

}

uint64_t __152__PLBackgroundJobLockedResourceWorker__accessFileForAsset_cplResourceType_version_recipeID_resourceType_utiString_bundleScope_pathManager_mode_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
