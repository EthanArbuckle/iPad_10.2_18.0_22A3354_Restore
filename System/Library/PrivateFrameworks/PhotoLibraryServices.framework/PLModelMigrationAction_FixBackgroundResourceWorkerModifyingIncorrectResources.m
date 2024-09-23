@implementation PLModelMigrationAction_FixBackgroundResourceWorkerModifyingIncorrectResources

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  id v28;
  __int128 *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  __int128 *v37;
  void *v38;
  uint64_t v39;
  _QWORD v41[5];
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  id obj;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  void *v57;
  __int16 v58;
  void *v59;
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
  __int128 v91;
  _QWORD v92[6];

  v92[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 1;
  v46 = 0;
  v47 = (id *)&v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__46461;
  v50 = __Block_byref_object_dispose__46462;
  v51 = 0;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("dataStoreClassID"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("localAvailability"), 4294934528);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("recipeID"), &unk_1E3763BD8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v92[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v14);

  v15 = v47 + 5;
  obj = v47[5];
  objc_msgSend(v5, "executeFetchRequest:error:", v8, &obj);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v15, obj);
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v16, "count"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __125__PLModelMigrationAction_FixBackgroundResourceWorkerModifyingIncorrectResources_performActionWithManagedObjectContext_error___block_invoke;
    v41[3] = &unk_1E366AC10;
    v41[4] = self;
    v43 = &v46;
    v44 = &v52;
    v42 = v17;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v16, v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if (!v47[5])
      {
        objc_storeStrong(v47 + 5, v19);
        v53[3] = 3;
        -[PLModelMigrationActionCore logger](self, "logger");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          PLMigrationGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

          if (v33)
          {
            v90 = 0u;
            v91 = 0u;
            v88 = 0u;
            v89 = 0u;
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
            PLMigrationGetLog();
            v34 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = 138543618;
            v57 = v36;
            v58 = 2114;
            v59 = v19;
            LODWORD(v39) = 22;
            v37 = (__int128 *)_os_log_send_and_compose_impl();

            -[PLModelMigrationActionCore logger](self, "logger", &v56, v39);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "logWithMessage:fromCodeLocation:type:", v37, "PLModelMigrationActions_15000.m", 726, 16);

            if (v37 != &v60)
              free(v37);
          }
        }
      }
    }

  }
  else
  {
    v53[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      PLMigrationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
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
        PLMigrationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v47[5];
        v56 = 138543618;
        v57 = v27;
        v58 = 2114;
        v59 = v28;
        LODWORD(v39) = 22;
        v29 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v56, v39);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_15000.m", 730, 16);

        if (v29 != &v60)
          free(v29);
      }
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v47[5]);
  v20 = v53[3];

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  return v20;
}

@end
