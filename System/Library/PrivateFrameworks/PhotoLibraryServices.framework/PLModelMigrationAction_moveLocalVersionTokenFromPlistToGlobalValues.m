@implementation PLModelMigrationAction_moveLocalVersionTokenFromPlistToGlobalValues

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  __int128 *v25;
  void *v26;
  PLGlobalValues *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  __int128 *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  __int128 *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  NSObject *v49;
  __int128 *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  _BOOL4 v57;
  NSObject *v58;
  __int128 *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v64;
  void *v65;
  id v66;
  int v67;
  void *v68;
  __int16 v69;
  void *v70;
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
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentStores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A08]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0x1E0D73000uLL;
  v12 = (void *)MEMORY[0x1E0D73190];
  v13 = *MEMORY[0x1E0D734E8];
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "readCPLPlistObjectWithKey:pathManager:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqualToString:", v15))
  {
    v16 = (void *)MEMORY[0x1E0D73190];
    -[PLModelMigrationActionCore pathManager](self, "pathManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "readCPLPlistObjectWithKey:pathManager:", CFSTR("localVersionToken"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v66 = v18;
      pl_result_with_autoreleasepool();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLModelMigrationActionCore logger](self, "logger");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        PLMigrationGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

        if (v23)
        {
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
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
          PLMigrationGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          v67 = 138412290;
          v68 = v19;
          LODWORD(v64) = 12;
          v25 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v67, v64);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 239, 0);

          if (v25 != &v71)
            free(v25);
        }
      }
      v27 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v5);
      -[PLGlobalValues setCloudTrackerLastKnownToken:](v27, "setCloudTrackerLastKnownToken:", v19);
      -[PLGlobalValues setLibraryScopeRulesTrackerLastKnownToken:](v27, "setLibraryScopeRulesTrackerLastKnownToken:", v19);
      v28 = (void *)MEMORY[0x1E0D73190];
      -[PLModelMigrationActionCore pathManager](self, "pathManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "readCPLPlistObjectWithKey:pathManager:", CFSTR("cloudVersion"), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLModelMigrationActionCore logger](self, "logger");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)v31;
        PLMigrationGetLog();
        v65 = v10;
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

        v10 = v65;
        if (v34)
        {
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
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
          PLMigrationGetLog();
          v35 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
          v67 = 138412290;
          v68 = v30;
          LODWORD(v64) = 12;
          v36 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v67, v64);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActions_18000.m", 250, 0);

          if (v36 != &v71)
            free(v36);
          v10 = v65;
        }
      }
      -[PLGlobalValues setCloudTrackerLastKnownCloudVersion:](v27, "setCloudTrackerLastKnownCloudVersion:", v30);

      v11 = 0x1E0D73000;
    }

  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = (void *)v38;
      PLMigrationGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

      if (v41)
      {
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
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
        PLMigrationGetLog();
        v42 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
        v67 = 138543618;
        v68 = v10;
        v69 = 2114;
        v70 = v15;
        LODWORD(v64) = 22;
        v43 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v67, v64);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "logWithMessage:fromCodeLocation:type:", v43, "PLModelMigrationActions_18000.m", 256, 16);

        if (v43 != &v71)
          free(v43);
      }
    }
  }
  -[PLModelMigrationActionCore logger](self, "logger");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    PLMigrationGetLog();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

    if (v48)
    {
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
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
      PLMigrationGetLog();
      v49 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
      LOWORD(v67) = 0;
      LODWORD(v64) = 2;
      v50 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v67, v64);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "logWithMessage:fromCodeLocation:type:", v50, "PLModelMigrationActions_18000.m", 260, 0);

      if (v50 != &v71)
        free(v50);
    }
  }
  v52 = *(void **)(v11 + 400);
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "saveCPLPlistObject:forKey:pathManager:", 0, CFSTR("localVersionToken"), v53);

  -[PLModelMigrationActionCore logger](self, "logger");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    PLMigrationGetLog();
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);

    if (v57)
    {
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
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
      PLMigrationGetLog();
      v58 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
      LOWORD(v67) = 0;
      LODWORD(v64) = 2;
      v59 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v67, v64);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "logWithMessage:fromCodeLocation:type:", v59, "PLModelMigrationActions_18000.m", 263, 0);

      if (v59 != &v71)
        free(v59);
    }
  }
  v61 = *(void **)(v11 + 400);
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "saveCPLPlistObject:forKey:pathManager:", 0, CFSTR("cloudVersion"), v62);

  return 1;
}

@end
