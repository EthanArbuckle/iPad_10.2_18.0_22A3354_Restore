@implementation PLModelMigrationAction_DeleteCarouselCruft

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  __int128 *v23;
  void *v24;
  void *v25;
  __int128 *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  id v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  __int128 *v42;
  void *v43;
  int64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  NSObject *v49;
  objc_class *v50;
  void *v51;
  __int128 *v52;
  void *v53;
  uint64_t v55;
  uint64_t v56;
  id *v57;
  id v58;
  void *v59;
  PLModelMigrationAction_DeleteCarouselCruft *v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  int v67;
  void *v68;
  __int16 v69;
  id v70;
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
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v60 = self;
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 4, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v8;
  if (objc_msgSend(v8, "length"))
  {
    v57 = a4;
    v58 = v6;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v10 = objc_msgSend(&unk_1E3763A10, "countByEnumeratingWithState:objects:count:", &v63, v103, 16);
    if (!v10)
      goto LABEL_21;
    v11 = v10;
    v12 = *(_QWORD *)v64;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v64 != v12)
          objc_enumerationMutation(&unk_1E3763A10);
        objc_msgSend(v8, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "fileExistsAtPath:", v14))
        {
          v62 = 0;
          v15 = objc_msgSend(v9, "removeItemAtPath:error:", v14, &v62);
          v16 = v62;
          -[PLModelMigrationActionCore logger](v60, "logger");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v15)
          {
            if (v17)
            {
              PLMigrationGetLog();
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

              if (v20)
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
                v21 = objc_claimAutoreleasedReturnValue();
                os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
                objc_msgSend(v14, "lastPathComponent");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = 138543362;
                v68 = v22;
                LODWORD(v55) = 12;
                v23 = (__int128 *)_os_log_send_and_compose_impl();

                -[PLModelMigrationActionCore logger](v60, "logger", &v67, v55);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v24;
                v26 = v23;
                v27 = 1779;
                v28 = 1;
                goto LABEL_15;
              }
            }
          }
          else if (v17)
          {
            PLMigrationGetLog();
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

            v8 = v59;
            if (v30)
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
              v31 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
              objc_msgSend(v14, "lastPathComponent");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = 138543618;
              v68 = v32;
              v69 = 2112;
              v70 = v16;
              LODWORD(v55) = 22;
              v23 = (__int128 *)_os_log_send_and_compose_impl();

              -[PLModelMigrationActionCore logger](v60, "logger", &v67, v55);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              v26 = v23;
              v27 = 1781;
              v28 = 16;
LABEL_15:
              objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActions_18000.m", v27, v28);

              if (v23 != &v71)
                free(v23);
              v8 = v59;
            }
          }

        }
      }
      v11 = objc_msgSend(&unk_1E3763A10, "countByEnumeratingWithState:objects:count:", &v63, v103, 16);
      if (!v11)
      {
LABEL_21:

        a4 = v57;
        v6 = v58;
        break;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("type"), 9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSuggestion entityName](PLSuggestion, "entityName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v35 = +[PLModelMigrator executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:](PLModelMigrator, "executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:", v34, v33, v6, &v61);
  v36 = v61;

  if (v35)
  {
    -[PLModelMigrationActionCore logger](v60, "logger");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      PLMigrationGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

      if (v40)
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
        v41 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
        LOWORD(v67) = 0;
        LODWORD(v56) = 2;
        v42 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](v60, "logger", &v67, v56);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "logWithMessage:fromCodeLocation:type:", v42, "PLModelMigrationActions_18000.m", 1792, 0);

        if (v42 != &v71)
          free(v42);
      }
    }
    v44 = 1;
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease(v36);
    -[PLModelMigrationActionCore logger](v60, "logger");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = (void *)v45;
      PLMigrationGetLog();
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);

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
        os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 138543618;
        v68 = v51;
        v69 = 2114;
        v70 = v36;
        LODWORD(v56) = 22;
        v52 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](v60, "logger", &v67, v56);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "logWithMessage:fromCodeLocation:type:", v52, "PLModelMigrationActions_18000.m", 1796, 16);

        if (v52 != &v71)
          free(v52);
      }
    }
    v44 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](v60, "finalizeProgress");

  return v44;
}

@end
