@implementation PLModelMigrationAction_RunSocialGroupAssetContainment

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  __int128 *v20;
  void *v21;
  id v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  __int128 *v31;
  void *v32;
  id v33;
  uint64_t v35;
  id v36;
  id v37;
  int v38;
  void *v39;
  __int16 v40;
  id v41;
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
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphLabel ensureLabelsAreUpdatedInContext:](PLGraphLabel, "ensureLabelsAreUpdatedInContext:", v6);
  objc_msgSend(v7, "becomeCurrentWithPendingUnitCount:", 1);
  v37 = 0;
  v8 = +[PLSocialGroup runAssetContainmentOnAllSocialGroupsInContext:error:](PLSocialGroup, "runAssetContainmentOnAllSocialGroupsInContext:error:", v6, &v37);
  v9 = v37;
  v10 = v9;
  if (!v8)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
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
        PLMigrationGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = v19;
        v40 = 2112;
        v41 = v10;
        LODWORD(v35) = 22;
        v20 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v38, v35);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_18000.m", 1003, 16);

        if (v20 != &v42)
          free(v20);
      }
    }
    goto LABEL_8;
  }
  v36 = v9;
  v11 = objc_msgSend(v6, "save:", &v36);
  v12 = v36;

  if ((v11 & 1) != 0)
  {
    v10 = v12;
LABEL_8:
    objc_msgSend(v7, "resignCurrent");
    v22 = v10;
    v23 = 1;
    goto LABEL_16;
  }
  -[PLModelMigrationActionCore logger](self, "logger");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    PLMigrationGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

    if (v27)
    {
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
      PLMigrationGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543618;
      v39 = v30;
      v40 = 2112;
      v41 = v12;
      LODWORD(v35) = 22;
      v31 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v38, v35);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_18000.m", 1005, 16);

      if (v31 != &v42)
        free(v31);
    }
  }
  objc_msgSend(v7, "resignCurrent");
  v33 = v12;
  v22 = v33;
  if (a4)
  {
    v22 = objc_retainAutorelease(v33);
    *a4 = v22;
  }
  v23 = 3;
LABEL_16:

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  return v23;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

@end
