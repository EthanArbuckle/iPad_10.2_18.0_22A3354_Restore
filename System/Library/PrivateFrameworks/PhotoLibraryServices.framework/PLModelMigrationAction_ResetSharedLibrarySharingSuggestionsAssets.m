@implementation PLModelMigrationAction_ResetSharedLibrarySharingSuggestionsAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
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
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  int64_t v31;
  uint64_t v33;
  _QWORD v35[5];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  id obj;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  void *v51;
  __int16 v52;
  id v53;
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
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 1;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__21263;
  v44 = __Block_byref_object_dispose__21264;
  v45 = 0;
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateToIncludeSharedLibrarySharingSuggestionsAssets](PLManagedAsset, "predicateToIncludeSharedLibrarySharingSuggestionsAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(v6, "setFetchBatchSize:", 100);
  v8 = v41 + 5;
  obj = v41[5];
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);
  if (objc_msgSend(v9, "count"))
  {
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v9, "count"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __113__PLModelMigrationAction_ResetSharedLibrarySharingSuggestionsAssets_performActionWithManagedObjectContext_error___block_invoke;
    v35[3] = &unk_1E366AC60;
    v35[4] = self;
    v37 = &v40;
    v38 = &v46;
    v11 = v10;
    v36 = v11;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v9, v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && !v41[5])
    {
      objc_storeStrong(v41 + 5, v12);
      v47[3] = 3;
    }
    if (v47[3] == 1)
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
          v54 = 0u;
          v55 = 0u;
          PLMigrationGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          v17 = objc_msgSend(v9, "count");
          v50 = 67109120;
          LODWORD(v51) = v17;
          LODWORD(v33) = 8;
          v18 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v50, v33);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActions_16000.m", 435, 0);

          goto LABEL_14;
        }
      }
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        PLMigrationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

        if (v22)
        {
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
          v54 = 0u;
          v55 = 0u;
          PLMigrationGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v41[5];
          v50 = 138543618;
          v51 = v25;
          v52 = 2114;
          v53 = v26;
          LODWORD(v33) = 22;
          v18 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v50, v33);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActions_16000.m", 437, 16);

LABEL_14:
          if (v18 != &v54)
            free(v18);
        }
      }
    }

    goto LABEL_17;
  }
  if (!v9)
    v47[3] = 3;
LABEL_17:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v28 = v47[3];
  v29 = v41[5];
  v30 = v29;
  if (v28 != 1 && a4)
    *a4 = objc_retainAutorelease(v29);

  v31 = v47[3];
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v31;
}

@end
