@implementation PLModelMigrationActionStaged_MoveLibraryScopeShareState

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
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
  _QWORD v40[5];
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  id obj;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  int v55;
  void *v56;
  __int16 v57;
  void *v58;
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
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];

  v91[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v49 = 0;
  v50 = (id *)&v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__58032;
  v53 = __Block_byref_object_dispose__58033;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 1;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("libraryScopeShareState != %d"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(v8, "setFetchBatchSize:", 100);
  v91[0] = CFSTR("asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v10);

  v11 = v50 + 5;
  obj = v50[5];
  objc_msgSend(v5, "executeFetchRequest:error:", v8, &obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v11, obj);
  if (v12)
  {
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v12, "count"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __103__PLModelMigrationActionStaged_MoveLibraryScopeShareState_performActionWithManagedObjectContext_error___block_invoke;
    v40[3] = &unk_1E366D990;
    v40[4] = self;
    v42 = &v49;
    v43 = &v45;
    v14 = v13;
    v41 = v14;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v12, v40);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (!v50[5])
      {
        objc_storeStrong(v50 + 5, v15);
        v46[3] = 3;
        -[PLModelMigrationActionCore logger](self, "logger");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          PLMigrationGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

          if (v32)
          {
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
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            PLMigrationGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = 138543618;
            v56 = v35;
            v57 = 2114;
            v58 = v15;
            LODWORD(v38) = 22;
            v36 = (__int128 *)_os_log_send_and_compose_impl();

            -[PLModelMigrationActionCore logger](self, "logger", &v55, v38);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActionStaged.m", 169, 16);

            if (v36 != &v59)
              free(v36);
          }
        }
      }
    }

  }
  else
  {
    v46[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
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
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        PLMigrationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v50[5];
        v55 = 138543618;
        v56 = v26;
        v57 = 2114;
        v58 = v27;
        LODWORD(v38) = 22;
        v28 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v55, v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActionStaged.m", 173, 16);

        if (v28 != &v59)
          free(v28);
      }
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v16 = v46[3];
  v17 = v50[5];
  v18 = v17;
  if (v16 != 1 && a4)
    *a4 = objc_retainAutorelease(v17);

  v19 = v46[3];
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  return v19;
}

@end
