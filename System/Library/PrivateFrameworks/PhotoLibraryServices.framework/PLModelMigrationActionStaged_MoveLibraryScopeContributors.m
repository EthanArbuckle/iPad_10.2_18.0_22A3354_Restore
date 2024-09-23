@implementation PLModelMigrationActionStaged_MoveLibraryScopeContributors

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  int64_t v19;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  id v27;
  __int128 *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  __int128 *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *, uint64_t, _BYTE *);
  void *v42;
  id v43;
  PLModelMigrationActionStaged_MoveLibraryScopeContributors *v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  id obj;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  int v59;
  void *v60;
  __int16 v61;
  void *v62;
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
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v53 = 0;
  v54 = (id *)&v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__58032;
  v57 = __Block_byref_object_dispose__58033;
  v58 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 1;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("libraryScopeOriginators.@count != 0"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setFetchBatchSize:", 100);
  v11 = v54 + 5;
  obj = v54[5];
  objc_msgSend(v6, "executeFetchRequest:error:", v9, &obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v11, obj);
  if (v12)
  {
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v12, "count"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __105__PLModelMigrationActionStaged_MoveLibraryScopeContributors_performActionWithManagedObjectContext_error___block_invoke;
    v42 = &unk_1E366D9B8;
    v43 = v6;
    v44 = self;
    v46 = &v53;
    v47 = &v49;
    v14 = v13;
    v45 = v14;
    objc_msgSend(v43, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v12, &v39);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (!v54[5])
      {
        objc_storeStrong(v54 + 5, v15);
        v50[3] = 3;
        -[PLModelMigrationActionCore logger](self, "logger");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          PLMigrationGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

          if (v32)
          {
            v93 = 0u;
            v94 = 0u;
            v91 = 0u;
            v92 = 0u;
            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
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
            PLMigrationGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = 138543618;
            v60 = v35;
            v61 = 2114;
            v62 = v15;
            LODWORD(v38) = 22;
            v36 = (__int128 *)_os_log_send_and_compose_impl();

            -[PLModelMigrationActionCore logger](self, "logger", &v59, v38, v39, v40, v41, v42, v43, v44);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActionStaged.m", 219, 16);

            if (v36 != &v63)
              free(v36);
          }
        }
      }
    }

  }
  else
  {
    v50[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
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
        PLMigrationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v54[5];
        v59 = 138543618;
        v60 = v26;
        v61 = 2114;
        v62 = v27;
        LODWORD(v38) = 22;
        v28 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v59, v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActionStaged.m", 223, 16);

        if (v28 != &v63)
          free(v28);
      }
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v16 = v50[3];
  v17 = v54[5];
  v18 = v17;
  if (v16 != 1 && a4)
    *a4 = objc_retainAutorelease(v17);

  v19 = v50[3];
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v19;
}

@end
