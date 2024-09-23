@implementation PLModelMigrationAction_SetPrivacyStateOnSmartAlbums

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  __int128 *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  __int128 *v29;
  void *v30;
  id *v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  int64_t v37;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  uint64_t v43;
  __int128 *v44;
  void *v45;
  uint64_t v46;
  id v48;
  _QWORD v49[5];
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  int v64;
  uint64_t v65;
  __int16 v66;
  id v67;
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
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__21263;
  v62 = __Block_byref_object_dispose__21264;
  v63 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 1;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 1507);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(v8, "setFetchBatchSize:", 100);
  v53 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v8, &v53);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v53;
  if (v10)
  {
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v10, "count"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __99__PLModelMigrationAction_SetPrivacyStateOnSmartAlbums_performActionWithManagedObjectContext_error___block_invoke;
    v49[3] = &unk_1E36662D0;
    v49[4] = self;
    v51 = &v58;
    v52 = &v54;
    v12 = v11;
    v50 = v12;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v10, v49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v55[3] = 3;
      -[PLModelMigrationActionCore logger](self, "logger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        PLMigrationGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

        if (v16)
        {
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
          PLMigrationGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = 138543618;
          v65 = (uint64_t)v19;
          v66 = 2114;
          v67 = v13;
          LODWORD(v46) = 22;
          v20 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v64, v46);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_16000.m", 330, 16);

          if (v20 != &v68)
            free(v20);
        }
      }
      if (v59[5])
        v22 = v59[5];
      else
        v22 = v13;
      objc_storeStrong(v59 + 5, v22);
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        PLMigrationGetLog();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

        if (v41)
        {
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
          PLMigrationGetLog();
          v42 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          v43 = objc_msgSend(v10, "count");
          v64 = 134217984;
          v65 = v43;
          LODWORD(v46) = 12;
          v44 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v64, v46);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "logWithMessage:fromCodeLocation:type:", v44, "PLModelMigrationActions_16000.m", 327, 0);

          if (v44 != &v68)
            free(v44);
        }
      }
    }

  }
  else
  {
    v55[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      PLMigrationGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (v25)
      {
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
        PLMigrationGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 138543618;
        v65 = (uint64_t)v28;
        v66 = 2114;
        v67 = v48;
        LODWORD(v46) = 22;
        v29 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v64, v46);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_16000.m", 335, 16);

        if (v29 != &v68)
          free(v29);
      }
    }
    v31 = v59;
    v32 = v59[5];
    if (!v32)
      v32 = v48;
    v33 = v32;
    v12 = v31[5];
    v31[5] = v33;
  }

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v34 = v55[3];
  v35 = v59[5];
  v36 = v35;
  if (v34 != 1 && a4)
    *a4 = objc_retainAutorelease(v35);

  v37 = v55[3];
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  return v37;
}

@end
