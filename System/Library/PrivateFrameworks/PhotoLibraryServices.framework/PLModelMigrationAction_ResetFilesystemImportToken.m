@implementation PLModelMigrationAction_ResetFilesystemImportToken

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  PLGlobalValues *v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  __int128 *v16;
  void *v17;
  id v18;
  int64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  __int128 *v27;
  void *v28;
  id v29;
  uint64_t v31;
  id v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
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
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v6);
  -[PLGlobalValues setImportFilesystemAssetsState:](v8, "setImportFilesystemAssetsState:", -1);
  v32 = 0;
  v9 = objc_msgSend(v6, "save:", &v32);

  v10 = v32;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "setCompletedUnitCount:", 1);
    -[PLModelMigrationActionCore logger](self, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      PLMigrationGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (v14)
      {
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
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        PLMigrationGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        LOWORD(v33) = 0;
        LODWORD(v31) = 2;
        v16 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v33, v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logWithMessage:fromCodeLocation:type:", v16, "PLModelMigrationActions_17000.m", 569, 0);

        if (v16 != &v37)
          free(v16);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v18 = v10;
    v19 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
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
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        PLMigrationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v26;
        v35 = 2112;
        v36 = v10;
        LODWORD(v31) = 22;
        v27 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v33, v31);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_17000.m", 566, 16);

        if (v27 != &v37)
          free(v27);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v29 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v29);
    v19 = 3;
  }

  return v19;
}

@end
