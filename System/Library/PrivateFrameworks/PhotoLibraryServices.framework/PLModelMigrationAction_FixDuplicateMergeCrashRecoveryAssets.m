@implementation PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  id *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  __int128 *v28;
  void *v29;
  __int128 *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  __int128 *v35;
  void *v36;
  int64_t v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  uint64_t v44;
  __int128 *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  _BOOL4 v49;
  NSObject *v50;
  objc_class *v51;
  void *v52;
  uint64_t v53;
  __int128 *v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v60;
  uint64_t v61;
  _QWORD v63[5];
  id v64;
  _BYTE *v65;
  uint64_t *v66;
  __int128 *v67;
  id obj;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  _BYTE v77[24];
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _QWORD v84[2];
  _QWORD v85[3];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
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
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets _isLibraryRepairRequiredWithManagedObjectContext:](self, "_isLibraryRepairRequiredWithManagedObjectContext:", v5))
  {
    v8 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("duplicateAssetVisibilityState"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("activeLibraryScopeParticipationState"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v13;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("master"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v85[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v16);

    objc_msgSend(v10, "setFetchBatchSize:", 100);
    v84[0] = CFSTR("modernResources");
    v84[1] = CFSTR("albums");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", v17);

    *(_QWORD *)&v79 = 0;
    *((_QWORD *)&v79 + 1) = &v79;
    v80 = 0x3032000000;
    v81 = __Block_byref_object_copy__1109;
    v82 = __Block_byref_object_dispose__1110;
    v83 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 1;
    obj = 0;
    objc_msgSend(v5, "executeFetchRequest:error:", v10, &obj);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v83, obj);
    if (!v18)
    {
      v70[3] = 3;
      -[PLModelMigrationActionBackground logger](self, "logger");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        PLMigrationGetLog();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);

        if (v40)
        {
          v116 = 0u;
          v117 = 0u;
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          v110 = 0u;
          v111 = 0u;
          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          PLMigrationGetLog();
          v41 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 40);
          *(_DWORD *)v77 = 138543618;
          *(_QWORD *)&v77[4] = v43;
          *(_WORD *)&v77[12] = 2112;
          *(_QWORD *)&v77[14] = v44;
          LODWORD(v61) = 22;
          v45 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionBackground logger](self, "logger", v77, v61);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "logWithMessage:fromCodeLocation:type:", v45, "PLModelMigrationActionBackground.m", 722, 16);

          if (v45 != &v86)
            free(v45);
        }
      }
      goto LABEL_24;
    }
    -[PLModelMigrationActionBackground cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v18, "count"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v77 = 0;
    *(_QWORD *)&v77[8] = v77;
    *(_QWORD *)&v77[16] = 0x2020000000;
    v78 = 0;
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __107__PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets_performActionWithManagedObjectContext_error___block_invoke;
    v63[3] = &unk_1E3666398;
    v63[4] = self;
    v65 = v77;
    v66 = &v69;
    v67 = &v79;
    v20 = v19;
    v64 = v20;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v18, v63);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 && (v22 = (id *)(*((_QWORD *)&v79 + 1) + 40), !*(_QWORD *)(*((_QWORD *)&v79 + 1) + 40)))
    {
      v70[3] = 3;
      objc_storeStrong(v22, v21);
      -[PLModelMigrationActionBackground logger](self, "logger");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v47)
        goto LABEL_23;
      PLMigrationGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);

      if (!v49)
        goto LABEL_23;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      PLMigrationGetLog();
      v50 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 40);
      v73 = 138543618;
      v74 = v52;
      v75 = 2112;
      v76 = v53;
      LODWORD(v61) = 22;
      v54 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionBackground logger](self, "logger", &v73, v61);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "logWithMessage:fromCodeLocation:type:", v54, "PLModelMigrationActionBackground.m", 716, 16);

      if (v54 == &v86)
        goto LABEL_23;
      v30 = v54;
    }
    else
    {
      -[PLModelMigrationActionBackground logger](self, "logger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_23;
      PLMigrationGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);

      if (!v25)
        goto LABEL_23;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      PLMigrationGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      v27 = *(void **)(*(_QWORD *)&v77[8] + 24);
      v73 = 134217984;
      v74 = v27;
      LODWORD(v61) = 12;
      v28 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionBackground logger](self, "logger", &v73, v61);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActionBackground.m", 718, 1);

      if (v28 == &v86)
        goto LABEL_23;
      v30 = v28;
    }
    free(v30);
LABEL_23:

    _Block_object_dispose(v77, 8);
LABEL_24:
    -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
    v56 = v70[3];
    v57 = *(id *)(*((_QWORD *)&v79 + 1) + 40);
    v58 = v57;
    if (v56 != 1 && a4)
      *a4 = objc_retainAutorelease(v57);

    v37 = v70[3];
    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v79, 8);

    goto LABEL_28;
  }
  -[PLModelMigrationActionBackground logger](self, "logger");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    PLMigrationGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

    if (v33)
    {
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      PLMigrationGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      LODWORD(v79) = 138543362;
      *(_QWORD *)((char *)&v79 + 4) = v7;
      LODWORD(v60) = 12;
      v35 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionBackground logger](self, "logger", &v79, v60);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logWithMessage:fromCodeLocation:type:", v35, "PLModelMigrationActionBackground.m", 675, 0);

      if (v35 != &v86)
        free(v35);
    }
  }
  v37 = 1;
LABEL_28:

  return v37;
}

- (BOOL)_isLibraryRepairRequiredWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;

  v4 = a3;
  -[PLModelMigrationActionBackground pathManager](self, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v6);

  if (v7)
  {
    objc_opt_class();
    v8 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "pl_libraryBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indicatorFileCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "isDisableICloudPhotos") ^ 1;
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (void)_processForRepairWithAsset:(id)a3 repairCount:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  _OWORD *v19;
  void *v20;
  uint64_t v21;
  id v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  _OWORD v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "masterResourceForCPLType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cplFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v9 = objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", &v22);
  v10 = v22;
  if (!v8)
    goto LABEL_4;
  if ((v9 & 1) != 0)
    goto LABEL_6;
  if (!PLIsErrorFileNotFound())
  {
    -[PLModelMigrationActionBackground logger](self, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      PLMigrationGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

      if (v14)
      {
        memset(v29, 0, sizeof(v29));
        PLMigrationGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v17;
        v25 = 2114;
        v26 = v18;
        v27 = 2112;
        v28 = v10;
        LODWORD(v21) = 32;
        v19 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v23, v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logWithMessage:fromCodeLocation:type:", v19, "PLModelMigrationActionBackground.m", 762, 16);

        if (v19 != v29)
          free(v19);
      }
    }
  }
  else
  {
LABEL_4:
    -[PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets _repairAsset:](self, "_repairAsset:", v6);
    if (a4)
      ++*a4;
  }
LABEL_6:

}

- (void)_repairAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  PLDuplicateAsset *v13;
  PLDuplicateAsset *v14;
  uint64_t v15;
  uint64_t v16;
  PLDuplicateMerge *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  __int128 *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  void *v37;
  __int128 *v38;
  void *v39;
  uint64_t v40;
  PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets *v41;
  void *v42;
  PLDuplicateAsset *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  int v50;
  void *v51;
  __int16 v52;
  _BYTE v53[10];
  __int16 v54;
  _BOOL4 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  PLDuplicateAsset *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "duplicateAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v89, 16);
  if (!v7)
    goto LABEL_28;
  v8 = v7;
  v9 = *(_QWORD *)v47;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v47 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      if ((objc_msgSend(v11, "isEqual:", v4) & 1) == 0)
      {
        objc_msgSend(v11, "master");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (objc_msgSend(v11, "cloudLocalState") == 1)
          {
            v13 = -[PLDuplicateAsset initWithAsset:]([PLDuplicateAsset alloc], "initWithAsset:", v11);
            v14 = -[PLDuplicateAsset initWithAsset:]([PLDuplicateAsset alloc], "initWithAsset:", v4);
            objc_msgSend(v4, "photoLibrary");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = v15;
            v44 = (void *)v15;
            if (v13 && v14 && v15)
            {
              v17 = [PLDuplicateMerge alloc];
              v88 = v13;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = v16;
              v20 = (void *)v18;
              v43 = v14;
              v21 = -[PLDuplicateMerge initWithSourceAssets:targetAsset:photolibrary:](v17, "initWithSourceAssets:targetAsset:photolibrary:", v18, v14, v19);

              v45 = 0;
              v42 = (void *)v21;
              LOBYTE(v21) = objc_msgSend((id)v21, "mergeResourcesFromSource:error:", v13, &v45);
              v22 = v45;
              if ((v21 & 1) == 0)
              {
                -[PLModelMigrationActionBackground logger](self, "logger");
                v23 = objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  v24 = (void *)v23;
                  PLMigrationGetLog();
                  v41 = self;
                  v25 = objc_claimAutoreleasedReturnValue();
                  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

                  if (v26)
                  {
                    v86 = 0u;
                    v87 = 0u;
                    v84 = 0u;
                    v85 = 0u;
                    v82 = 0u;
                    v83 = 0u;
                    v80 = 0u;
                    v81 = 0u;
                    v78 = 0u;
                    v79 = 0u;
                    v76 = 0u;
                    v77 = 0u;
                    v74 = 0u;
                    v75 = 0u;
                    v72 = 0u;
                    v73 = 0u;
                    v70 = 0u;
                    v71 = 0u;
                    v68 = 0u;
                    v69 = 0u;
                    v66 = 0u;
                    v67 = 0u;
                    v64 = 0u;
                    v65 = 0u;
                    v62 = 0u;
                    v63 = 0u;
                    v60 = 0u;
                    v61 = 0u;
                    v58 = 0u;
                    v59 = 0u;
                    v56 = 0u;
                    v57 = 0u;
                    PLMigrationGetLog();
                    v27 = objc_claimAutoreleasedReturnValue();
                    os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
                    objc_msgSend(v4, "uuid");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "uuid");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v50 = 138543618;
                    v51 = v28;
                    v52 = 2114;
                    *(_QWORD *)v53 = v29;
                    LODWORD(v40) = 22;
                    v30 = (__int128 *)_os_log_send_and_compose_impl();

                    -[PLModelMigrationActionBackground logger](v41, "logger", &v50, v40);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActionBackground.m", 788, 16);

                    if (v30 != &v56)
                      free(v30);
                  }
                }
              }

            }
            else
            {
              -[PLModelMigrationActionBackground logger](self, "logger");
              v32 = objc_claimAutoreleasedReturnValue();
              if (!v32)
              {
                v22 = 0;
                goto LABEL_27;
              }
              v33 = (void *)v32;
              v43 = v14;
              PLMigrationGetLog();
              v34 = objc_claimAutoreleasedReturnValue();
              v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);

              if (v35)
              {
                v86 = 0u;
                v87 = 0u;
                v84 = 0u;
                v85 = 0u;
                v82 = 0u;
                v83 = 0u;
                v80 = 0u;
                v81 = 0u;
                v78 = 0u;
                v79 = 0u;
                v76 = 0u;
                v77 = 0u;
                v74 = 0u;
                v75 = 0u;
                v72 = 0u;
                v73 = 0u;
                v70 = 0u;
                v71 = 0u;
                v68 = 0u;
                v69 = 0u;
                v66 = 0u;
                v67 = 0u;
                v64 = 0u;
                v65 = 0u;
                v62 = 0u;
                v63 = 0u;
                v60 = 0u;
                v61 = 0u;
                v58 = 0u;
                v59 = 0u;
                v56 = 0u;
                v57 = 0u;
                PLMigrationGetLog();
                v36 = objc_claimAutoreleasedReturnValue();
                os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
                objc_msgSend(v4, "uuid");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = 138544130;
                v51 = v37;
                v52 = 1024;
                *(_DWORD *)v53 = v13 != 0;
                *(_WORD *)&v53[4] = 1024;
                *(_DWORD *)&v53[6] = v43 != 0;
                v54 = 1024;
                v55 = v16 != 0;
                LODWORD(v40) = 30;
                v38 = (__int128 *)_os_log_send_and_compose_impl();

                -[PLModelMigrationActionBackground logger](self, "logger", &v50, v40);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActionBackground.m", 791, 16);

                if (v38 != &v56)
                  free(v38);
              }
              v22 = 0;
            }
            v14 = v43;
LABEL_27:

            goto LABEL_28;
          }
        }
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v89, 16);
    if (v8)
      continue;
    break;
  }
LABEL_28:

}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end
