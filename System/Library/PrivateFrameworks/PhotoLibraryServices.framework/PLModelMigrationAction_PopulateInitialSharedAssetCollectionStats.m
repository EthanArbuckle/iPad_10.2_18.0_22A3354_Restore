@implementation PLModelMigrationAction_PopulateInitialSharedAssetCollectionStats

- (int64_t)_recalculateSharedAssetContainerValuesForEntityNamed:(id)a3 propertiesToFetch:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  __int128 *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  __int128 *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  id v45;
  __int128 *v46;
  void *v47;
  void *v48;
  __int128 *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  _BOOL4 v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  __int128 *v59;
  void *v60;
  int64_t v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  id v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  int v76;
  id v77;
  __int16 v78;
  id v79;
  __int16 v80;
  id v81;
  _QWORD v82[14];
  _QWORD v83[14];
  __int128 v84;
  __int128 v85;
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
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a6)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationActions_16000.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

    if (v11)
    {
LABEL_3:
      if (v12)
        goto LABEL_4;
LABEL_36:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationActions_16000.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertiesToFetch"));

      if (v13)
        goto LABEL_5;
LABEL_37:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationActions_16000.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationActions_16000.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityName"));

  if (!v12)
    goto LABEL_36;
LABEL_4:
  if (!v13)
    goto LABEL_37;
LABEL_5:
  -[PLModelMigrationActionCore logger](self, "logger");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
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
      v84 = 0u;
      v85 = 0u;
      PLMigrationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 138543618;
      v77 = v20;
      v78 = 2114;
      v79 = v11;
      LODWORD(v73) = 22;
      v21 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v76, v73);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_16000.m", 144, 0);

      if (v21 != &v84)
        free(v21);
    }
  }
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = CFSTR("photoAssetsSuggestedByPhotosCount");
  v82[1] = CFSTR("videoAssetsSuggestedByPhotosCount");
  v83[0] = &unk_1E375E568;
  v83[1] = &unk_1E375E568;
  v82[2] = CFSTR("assetsCount");
  v82[3] = CFSTR("assetsCountShared");
  v83[2] = &unk_1E375E568;
  v83[3] = &unk_1E375E568;
  v82[4] = CFSTR("summaryCount");
  v82[5] = CFSTR("summaryCountShared");
  v83[4] = &unk_1E375E568;
  v83[5] = &unk_1E375E568;
  v82[6] = CFSTR("extendedCount");
  v82[7] = CFSTR("extendedCountShared");
  v83[6] = &unk_1E375E568;
  v83[7] = &unk_1E375E568;
  v82[8] = CFSTR("dayGroupAssetsCount");
  v82[9] = CFSTR("dayGroupAssetsCountShared");
  v83[8] = &unk_1E375E568;
  v83[9] = &unk_1E375E568;
  v82[10] = CFSTR("dayGroupSummaryAssetsCount");
  v82[11] = CFSTR("dayGroupSummaryAssetsCountShared");
  v83[10] = &unk_1E375E568;
  v83[11] = &unk_1E375E568;
  v82[12] = CFSTR("dayGroupExtendedAssetsCount");
  v82[13] = CFSTR("dayGroupExtendedAssetsCountShared");
  v83[12] = &unk_1E375E568;
  v83[13] = &unk_1E375E568;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  v25 = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v23, 0, v24, v13, &v75);
  v26 = v75;

  if (v25)
  {

    -[PLModelMigrationActionCore logger](self, "logger");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      PLMigrationGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

      if (v30)
      {
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
        v84 = 0u;
        v85 = 0u;
        PLMigrationGetLog();
        v31 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 138543618;
        v77 = v33;
        v78 = 2114;
        v79 = v11;
        LODWORD(v73) = 22;
        v34 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v76, v73);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActions_16000.m", 173, 0);

        if (v34 != &v84)
          free(v34);
      }
    }
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v11);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFetchBatchSize:", 100);
    objc_msgSend(v26, "setPropertiesToFetch:", v12);
    objc_msgSend(v13, "executeFetchRequest:error:", v26, a6);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(v13, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v36, &__block_literal_global_21358);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      *a6 = v37;
      if (!v37)
      {
        v61 = 1;
        goto LABEL_32;
      }
      -[PLModelMigrationActionCore logger](self, "logger");
      v38 = objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v39 = (void *)v38;
        v74 = v12;
        PLMigrationGetLog();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

        if (v41)
        {
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
          v84 = 0u;
          v85 = 0u;
          PLMigrationGetLog();
          v42 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = *a6;
          v76 = 138543874;
          v77 = v44;
          v78 = 2114;
          v79 = v11;
          v80 = 2112;
          v81 = v45;
          LODWORD(v73) = 32;
          v46 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v76, v73);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          v49 = v46;
          v50 = 186;
          v51 = 16;
          goto LABEL_27;
        }
        goto LABEL_29;
      }
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v62 = objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        v63 = (void *)v62;
        v74 = v12;
        PLMigrationGetLog();
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);

        if (v65)
        {
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
          v84 = 0u;
          v85 = 0u;
          PLMigrationGetLog();
          v66 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
          v67 = *a6;
          v76 = 138412290;
          v77 = v67;
          LODWORD(v73) = 12;
          v46 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v76, v73);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          v49 = v46;
          v50 = 190;
          v51 = 0;
LABEL_27:
          objc_msgSend(v47, "logWithMessage:fromCodeLocation:type:", v49, "PLModelMigrationActions_16000.m", v50, v51);

          if (v46 != &v84)
            free(v46);
        }
LABEL_29:
        v61 = 3;
        v12 = v74;
LABEL_32:

        goto LABEL_33;
      }
    }
    v61 = 3;
    goto LABEL_32;
  }
  -[PLModelMigrationActionCore logger](self, "logger");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    PLMigrationGetLog();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

    if (v55)
    {
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
      v84 = 0u;
      v85 = 0u;
      PLMigrationGetLog();
      v56 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v56, OS_LOG_TYPE_ERROR);
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 138543618;
      v77 = v58;
      v78 = 2114;
      v79 = v26;
      LODWORD(v73) = 22;
      v59 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v76, v73);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "logWithMessage:fromCodeLocation:type:", v59, "PLModelMigrationActions_16000.m", 167, 16);

      if (v59 != &v84)
        free(v59);
    }
  }
  v61 = 3;
LABEL_33:

  return v61;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  char v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  __int128 *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  __int128 *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v42;
  id v44;
  id v45;
  id v46;
  id v47;
  int v48;
  void *v49;
  __int16 v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
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
  _QWORD v84[3];
  _QWORD v85[5];

  v85[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x19AEC1554]();
  +[PLMoment entityName](PLMoment, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = CFSTR("sharingComposition");
  v85[1] = CFSTR("cachedCount");
  v85[2] = CFSTR("cachedCountShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v10 = -[PLModelMigrationAction_PopulateInitialSharedAssetCollectionStats _recalculateSharedAssetContainerValuesForEntityNamed:propertiesToFetch:inContext:error:](self, "_recalculateSharedAssetContainerValuesForEntityNamed:propertiesToFetch:inContext:error:", v8, v9, v5, &v47);
  v11 = v47;

  objc_autoreleasePoolPop(v7);
  v12 = objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "completedUnitCount") + 1);
  if (!v11)
  {
    v13 = (void *)MEMORY[0x19AEC1554](v12);
    +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = CFSTR("sharingComposition");
    v84[1] = CFSTR("assetsCount");
    v84[2] = CFSTR("assetsCountShared");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v10 = -[PLModelMigrationAction_PopulateInitialSharedAssetCollectionStats _recalculateSharedAssetContainerValuesForEntityNamed:propertiesToFetch:inContext:error:](self, "_recalculateSharedAssetContainerValuesForEntityNamed:propertiesToFetch:inContext:error:", v14, v15, v5, &v46);
    v11 = v46;

    objc_autoreleasePoolPop(v13);
  }
  v16 = objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "completedUnitCount") + 1);
  if (!v11)
  {
    v17 = (void *)MEMORY[0x19AEC1554](v16);
    v45 = 0;
    v18 = +[PLBackgroundJobSharedAssetContainerUpdateWorker performWorkOnAllItemsInContext:withError:](PLBackgroundJobSharedAssetContainerUpdateWorker, "performWorkOnAllItemsInContext:withError:", v5, &v45);
    v19 = v45;
    if (v18)
    {
      if (objc_msgSend(v5, "hasChanges"))
      {
        v44 = v19;
        v20 = objc_msgSend(v5, "save:", &v44);
        v11 = v44;

        if ((v20 & 1) == 0)
        {
          -[PLModelMigrationActionCore logger](self, "logger");
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            PLMigrationGetLog();
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

            if (v24)
            {
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
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              PLMigrationGetLog();
              v25 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
              v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = 138543618;
              v49 = v27;
              v50 = 2112;
              v51 = v11;
              LODWORD(v42) = 22;
              v28 = (__int128 *)_os_log_send_and_compose_impl();

              -[PLModelMigrationActionCore logger](self, "logger", &v48, v42);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_16000.m", 227, 16);

              if (v28 != &v52)
                free(v28);
            }
          }
          v10 = 3;
        }
        goto LABEL_18;
      }
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        PLMigrationGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

        if (v33)
        {
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
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          PLMigrationGetLog();
          v34 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 138543618;
          v49 = v36;
          v50 = 2112;
          v51 = v19;
          LODWORD(v42) = 22;
          v37 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v48, v42);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "logWithMessage:fromCodeLocation:type:", v37, "PLModelMigrationActions_16000.m", 232, 16);

          if (v37 != &v52)
            free(v37);
        }
      }
      v10 = 3;
    }
    v11 = v19;
LABEL_18:
    objc_autoreleasePoolPop(v17);
  }
  objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "completedUnitCount") + 1);
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v39 = v11;
  v40 = v39;
  if (v10 != 1 && a4)
    *a4 = objc_retainAutorelease(v39);

  return v10;
}

@end
