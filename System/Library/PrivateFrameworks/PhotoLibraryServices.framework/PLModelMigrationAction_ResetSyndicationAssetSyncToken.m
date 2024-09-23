@implementation PLModelMigrationAction_ResetSyndicationAssetSyncToken

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
  int64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  __int128 *v26;
  void *v27;
  uint64_t v29;
  id v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
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
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v6);
  -[PLGlobalValues setLastAttachmentSyndicationSyncDate:](v8, "setLastAttachmentSyndicationSyncDate:", 0);
  -[PLGlobalValues setInProgressFullIndexSyndicationSyncDate:](v8, "setInProgressFullIndexSyndicationSyncDate:", 0);
  -[PLGlobalValues setSyndicationStartDate:](v8, "setSyndicationStartDate:", 0);
  v30 = 0;
  v9 = objc_msgSend(v6, "save:", &v30);

  v10 = v30;
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
        v35 = 0u;
        v36 = 0u;
        PLMigrationGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        LOWORD(v31) = 0;
        LODWORD(v29) = 2;
        v16 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v31, v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logWithMessage:fromCodeLocation:type:", v16, "PLModelMigrationActions_16000.m", 121, 0);

        if (v16 != &v35)
          free(v16);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v18 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      PLMigrationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (v22)
      {
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
        v35 = 0u;
        v36 = 0u;
        PLMigrationGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v25;
        v33 = 2112;
        v34 = v10;
        LODWORD(v29) = 22;
        v26 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v31, v29);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActions_16000.m", 118, 16);

        if (v26 != &v35)
          free(v26);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    v18 = 3;
  }

  return v18;
}

@end
