@implementation PLModelMigrationAction_ResetSocialGroup

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  __int128 *v15;
  void *v16;
  id v17;
  int64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  __int128 *v24;
  void *v25;
  id v26;
  uint64_t v28;
  id v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
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
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "becomeCurrentWithPendingUnitCount:", 1);
  v29 = 0;
  v8 = +[PLSocialGroup resetAllInContext:error:](PLSocialGroup, "resetAllInContext:error:", v6, &v29);

  v9 = v29;
  -[PLModelMigrationActionCore logger](self, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8)
  {
    if (v10)
    {
      PLMigrationGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
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
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        LOWORD(v30) = 0;
        LODWORD(v28) = 2;
        v15 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v30, v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigrationActions_18000.m", 336, 0);

        if (v15 != &v34)
          free(v15);
      }
    }
    objc_msgSend(v7, "resignCurrent");
    v17 = v9;
    v18 = 1;
  }
  else
  {
    if (v10)
    {
      PLMigrationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
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
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        PLMigrationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v23;
        v32 = 2112;
        v33 = v9;
        LODWORD(v28) = 22;
        v24 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v30, v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 339, 16);

        if (v24 != &v34)
          free(v24);
      }
    }
    objc_msgSend(v7, "resignCurrent");
    v26 = v9;
    if (a4)
      *a4 = objc_retainAutorelease(v26);
    v18 = 3;
  }

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  return v18;
}

@end
