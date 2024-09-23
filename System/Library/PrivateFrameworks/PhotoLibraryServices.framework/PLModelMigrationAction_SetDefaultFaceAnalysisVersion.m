@implementation PLModelMigrationAction_SetDefaultFaceAnalysisVersion

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  id v24;
  __int128 *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  __int128 *v33;
  void *v34;
  uint64_t v35;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  id obj;
  uint64_t v43;
  id *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  void *v54;
  __int16 v55;
  void *v56;
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
  __int128 v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v49 = 0;
  v50 = &v49;
  if (-[PLModelMigrationActionCore startingSchemaVersion](self, "startingSchemaVersion") >> 3 <= 0x752u)
    v6 = 5;
  else
    v6 = 10;
  v51 = 0x2020000000;
  v52 = 1;
  v43 = 0;
  v44 = (id *)&v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__46461;
  v47 = __Block_byref_object_dispose__46462;
  v48 = 0;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("faceAdjustmentVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);
  v11 = v44 + 5;
  obj = v44[5];
  objc_msgSend(v5, "executeFetchRequest:error:", v9, &obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v11, obj);
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v12, "count"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __100__PLModelMigrationAction_SetDefaultFaceAnalysisVersion_performActionWithManagedObjectContext_error___block_invoke;
    v37[3] = &unk_1E366ACB0;
    v37[4] = self;
    v39 = &v43;
    v40 = &v49;
    v41 = v6;
    v38 = v13;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v12, v37);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (!v44[5])
      {
        objc_storeStrong(v44 + 5, v15);
        v50[3] = 3;
        -[PLModelMigrationActionCore logger](self, "logger");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          PLMigrationGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

          if (v29)
          {
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
            v57 = 0u;
            v58 = 0u;
            PLMigrationGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = 138543618;
            v54 = v32;
            v55 = 2114;
            v56 = v15;
            LODWORD(v35) = 22;
            v33 = (__int128 *)_os_log_send_and_compose_impl();

            -[PLModelMigrationActionCore logger](self, "logger", &v53, v35);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActions_15000.m", 630, 16);

            if (v33 != &v57)
              free(v33);
          }
        }
      }
    }

  }
  else
  {
    v50[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      PLMigrationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
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
        v57 = 0u;
        v58 = 0u;
        PLMigrationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v44[5];
        v53 = 138543618;
        v54 = v23;
        v55 = 2114;
        v56 = v24;
        LODWORD(v35) = 22;
        v25 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v53, v35);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_15000.m", 634, 16);

        if (v25 != &v57)
          free(v25);
      }
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v44[5]);
  v16 = v50[3];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v16;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end
