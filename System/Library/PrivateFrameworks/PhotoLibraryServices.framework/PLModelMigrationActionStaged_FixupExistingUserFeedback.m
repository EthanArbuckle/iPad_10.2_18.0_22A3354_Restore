@implementation PLModelMigrationActionStaged_FixupExistingUserFeedback

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int64_t v15;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  id v23;
  __int128 *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  __int128 *v32;
  void *v33;
  uint64_t v34;
  _QWORD v36[5];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  id obj;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  int v51;
  void *v52;
  __int16 v53;
  void *v54;
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
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v45 = 0;
  v46 = (id *)&v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__58032;
  v49 = __Block_byref_object_dispose__58033;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 1;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLUserFeedback entityName](PLUserFeedback, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(v8, "setFetchBatchSize:", 100);
  v10 = v46 + 5;
  obj = v46[5];
  objc_msgSend(v5, "executeFetchRequest:error:", v8, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);
  if (v11)
  {
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v11, "count"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __102__PLModelMigrationActionStaged_FixupExistingUserFeedback_performActionWithManagedObjectContext_error___block_invoke;
    v36[3] = &unk_1E366D940;
    v36[4] = self;
    v38 = &v45;
    v39 = &v41;
    v13 = v12;
    v37 = v13;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v11, v36);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (!v46[5])
      {
        objc_storeStrong(v46 + 5, v14);
        v42[3] = 3;
        -[PLModelMigrationActionCore logger](self, "logger");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          PLMigrationGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

          if (v28)
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
            v29 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 138543618;
            v52 = v31;
            v53 = 2114;
            v54 = v14;
            LODWORD(v34) = 22;
            v32 = (__int128 *)_os_log_send_and_compose_impl();

            -[PLModelMigrationActionCore logger](self, "logger", &v51, v34);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActionStaged.m", 83, 16);

            if (v32 != &v55)
              free(v32);
          }
        }
      }
    }

  }
  else
  {
    v42[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      PLMigrationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (v19)
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
        v20 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v46[5];
        v51 = 138543618;
        v52 = v22;
        v53 = 2114;
        v54 = v23;
        LODWORD(v34) = 22;
        v24 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v51, v34);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActionStaged.m", 87, 16);

        if (v24 != &v55)
          free(v24);
      }
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v46[5]);
  v15 = v42[3];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v15;
}

@end
