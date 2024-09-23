@implementation PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;

  v6 = a3;
  v7 = -[PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant updateLegacyHiddenValueWithManagedObjectContext:error:](self, "updateLegacyHiddenValueWithManagedObjectContext:error:", v6, a4);
  if (v7 == 1)
    v7 = -[PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant updateKeyAssetVisibilityStateWithManagedObjectContext:error:](self, "updateKeyAssetVisibilityStateWithManagedObjectContext:error:", v6, a4);
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return v7;
}

- (int64_t)updateLegacyHiddenValueWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  _OWORD *v24;
  void *v25;
  id v26;
  uint64_t v28;
  id v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  _OWORD v34[32];
  const __CFString *v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3528];
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a3;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("duplicateAssetVisibilityState"), 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = CFSTR("duplicateAssetVisibilityState");
  v36 = &unk_1E375E598;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  LOBYTE(v10) = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v13, v11, v12, v8, &v29);

  v14 = v29;
  if ((v10 & 1) != 0)
  {
    v15 = v14;
    v16 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      PLMigrationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
        memset(v34, 0, sizeof(v34));
        PLMigrationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v23;
        v32 = 2114;
        v33 = v14;
        LODWORD(v28) = 22;
        v24 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v30, v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_16000.m", 540, 16);

        if (v24 != v34)
          free(v24);
      }
    }
    v26 = v14;
    if (a4)
      *a4 = objc_retainAutorelease(v26);
    v16 = 3;
  }

  return v16;
}

- (int64_t)updateKeyAssetVisibilityStateWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  int v17;
  __int128 *v18;
  void *v19;
  uint64_t *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  int64_t v32;
  uint64_t v34;
  _QWORD v36[5];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  id obj;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  void *v52;
  __int16 v53;
  id v54;
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
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];

  v87[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 1;
  v41 = 0;
  v42 = (id *)&v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__21263;
  v45 = __Block_byref_object_dispose__21264;
  v46 = 0;
  objc_msgSend(v5, "refreshAllObjects");
  +[PLDuplicateAlbum fetchRequest](PLDuplicateAlbum, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = CFSTR("assets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v7);

  objc_msgSend(v6, "setIncludesPendingChanges:", 1);
  objc_msgSend(v6, "setFetchBatchSize:", 100);
  v8 = v42 + 5;
  obj = v42[5];
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);
  if (objc_msgSend(v9, "count"))
  {
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v9, "count"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __134__PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant_updateKeyAssetVisibilityStateWithManagedObjectContext_error___block_invoke;
    v36[3] = &unk_1E3666320;
    v36[4] = self;
    v38 = &v41;
    v39 = &v47;
    v11 = v10;
    v37 = v11;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v9, v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && !v42[5])
    {
      objc_storeStrong(v42 + 5, v12);
      v48[3] = 3;
    }
    if (v48[3] == 1)
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

        if (v15)
        {
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          PLMigrationGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          v17 = objc_msgSend(v9, "count");
          v51 = 67109120;
          LODWORD(v52) = v17;
          LODWORD(v34) = 8;
          v18 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v51, v34);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActions_16000.m", 578, 0);

          goto LABEL_14;
        }
      }
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        PLMigrationGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

        if (v23)
        {
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          PLMigrationGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v42[5];
          v51 = 138543618;
          v52 = v26;
          v53 = 2114;
          v54 = v27;
          LODWORD(v34) = 22;
          v18 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v51, v34);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActions_16000.m", 580, 16);

LABEL_14:
          if (v18 != &v55)
            free(v18);
        }
      }
    }

    v20 = v48;
    goto LABEL_17;
  }
  v20 = v48;
  if (!v9)
    v48[3] = 3;
LABEL_17:
  v29 = v20[3];
  v30 = v42[5];
  v31 = v30;
  if (v29 != 1 && a4)
    *a4 = objc_retainAutorelease(v30);

  v32 = v48[3];
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v32;
}

@end
