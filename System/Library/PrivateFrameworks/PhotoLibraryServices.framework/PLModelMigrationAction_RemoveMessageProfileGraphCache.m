@implementation PLModelMigrationAction_RemoveMessageProfileGraphCache

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  __int128 *v17;
  void *v18;
  id v19;
  int64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
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
  -[PLModelMigrationActionCore pathManager](self, "pathManager", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privateCacheDirectoryWithSubType:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("PGMessageProfile.plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "fileExistsAtPath:", v8))
  {
    v11 = 0;
LABEL_8:
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v19 = v11;
    v20 = 1;
    goto LABEL_16;
  }
  v29 = 0;
  v10 = objc_msgSend(v9, "removeItemAtPath:error:", v8, &v29);
  v11 = v29;
  -[PLModelMigrationActionCore logger](self, "logger");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v10)
  {
    if (v12)
    {
      PLMigrationGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

      if (v15)
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
        v16 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        v30 = 138543362;
        v31 = v8;
        LODWORD(v28) = 12;
        v17 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v30, v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logWithMessage:fromCodeLocation:type:", v17, "PLModelMigrationActions_18000.m", 1510, 1);

        if (v17 != &v34)
          free(v17);
      }
    }
    goto LABEL_8;
  }
  if (v12)
  {
    PLMigrationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
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
      v23 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      v30 = 138543618;
      v31 = v8;
      v32 = 2112;
      v33 = v11;
      LODWORD(v28) = 22;
      v24 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v30, v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 1513, 16);

      if (v24 != &v34)
        free(v24);
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v26 = v11;
  v19 = v26;
  if (a4)
  {
    v19 = objc_retainAutorelease(v26);
    *a4 = v19;
  }
  v20 = 3;
LABEL_16:

  return v20;
}

@end
