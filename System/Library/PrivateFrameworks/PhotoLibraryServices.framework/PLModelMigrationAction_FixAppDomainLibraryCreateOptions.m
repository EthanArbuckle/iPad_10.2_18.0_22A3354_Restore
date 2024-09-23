@implementation PLModelMigrationAction_FixAppDomainLibraryCreateOptions

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  PLGlobalValues *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  __int128 *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  __int128 *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  __int128 *v38;
  void *v39;
  void *v40;
  __int128 *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  NSObject *v48;
  __int128 *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  _BOOL4 v55;
  NSObject *v56;
  __int128 *v57;
  void *v58;
  NSObject *v59;
  _BOOL4 v60;
  NSObject *v61;
  id v62;
  int64_t v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  __int128 *v67;
  void *v68;
  id v69;
  uint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  const __CFString *v75;
  int v76;
  id v77;
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
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      PLMigrationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (v26)
      {
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
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
        PLMigrationGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        LOWORD(v76) = 0;
        LODWORD(v71) = 2;
        v28 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v76, v71);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_18000.m", 1248, 16);

        if (v28 != &v78)
          free(v28);
      }
    }
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0D74498];
    v74 = *MEMORY[0x1E0CB2938];
    v75 = CFSTR("Missing required libraryURL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 41001, v32);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if ((MEMORY[0x19AEC04BC]() & 1) == 0)
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v44 = objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        v45 = (void *)v44;
        PLMigrationGetLog();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);

        if (v47)
        {
          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
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
          PLMigrationGetLog();
          v48 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
          LOWORD(v76) = 0;
          LODWORD(v71) = 2;
          v49 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v76, v71);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "logWithMessage:fromCodeLocation:type:", v49, "PLModelMigrationActions_18000.m", 1257, 0);

          if (v49 != &v78)
            free(v49);
        }
      }
      goto LABEL_35;
    }
    v22 = v12;
    goto LABEL_41;
  }
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:](PLPhotoLibraryIdentifier, "photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:", v10, 0, &v73);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v73;

  if (objc_msgSend(v11, "domain") != 3)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v11)
    {
      if (v33)
      {
        PLMigrationGetLog();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);

        if (v36)
        {
          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
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
          PLMigrationGetLog();
          v37 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
          v76 = 138412290;
          v77 = v11;
          LODWORD(v71) = 12;
          v38 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v76, v71);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          v41 = v38;
          v42 = 1242;
          v43 = 0;
          goto LABEL_32;
        }
      }
    }
    else if (v33)
    {
      PLMigrationGetLog();
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);

      if (v60)
      {
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
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
        PLMigrationGetLog();
        v61 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
        v76 = 138412290;
        v77 = v12;
        LODWORD(v71) = 12;
        v38 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v76, v71);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        v41 = v38;
        v42 = 1244;
        v43 = 16;
LABEL_32:
        objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v41, "PLModelMigrationActions_18000.m", v42, v43);

        if (v38 != &v78)
          free(v38);
      }
    }

    goto LABEL_35;
  }
  v13 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v6);
  v14 = -[PLGlobalValues libraryCreateOptions](v13, "libraryCreateOptions");
  if ((~(_DWORD)v14 & 0x73) == 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      PLMigrationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
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
        PLMigrationGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        LOWORD(v76) = 0;
        LODWORD(v71) = 2;
        v20 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v76, v71);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_18000.m", 1239, 0);

        if (v20 != &v78)
          free(v20);
      }
    }
    v22 = v12;
LABEL_9:

    v12 = v22;
LABEL_35:
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v62 = v12;
    v63 = 1;
    goto LABEL_44;
  }
  +[PLGlobalValues setLibraryCreateOptions:managedObjectContext:](PLGlobalValues, "setLibraryCreateOptions:managedObjectContext:", v14 | 0x73, v6);
  v72 = v12;
  v51 = objc_msgSend(v6, "save:", &v72);
  v22 = v72;

  -[PLModelMigrationActionCore logger](self, "logger");
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v52;
  if (v51)
  {
    if (v52)
    {
      PLMigrationGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);

      if (v55)
      {
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
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
        PLMigrationGetLog();
        v56 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
        LOWORD(v76) = 0;
        LODWORD(v71) = 2;
        v57 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v76, v71);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "logWithMessage:fromCodeLocation:type:", v57, "PLModelMigrationActions_18000.m", 1232, 0);

        if (v57 != &v78)
          free(v57);
      }
    }
    goto LABEL_9;
  }
  if (v52)
  {
    PLMigrationGetLog();
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);

    if (v65)
    {
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
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
      PLMigrationGetLog();
      v66 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
      v76 = 138412290;
      v77 = v22;
      LODWORD(v71) = 12;
      v67 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v76, v71);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "logWithMessage:fromCodeLocation:type:", v67, "PLModelMigrationActions_18000.m", 1234, 16);

      if (v67 != &v78)
        free(v67);
    }
  }

  MEMORY[0x19AEC04BC]();
LABEL_41:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v69 = v22;
  v62 = v69;
  if (a4)
  {
    v62 = objc_retainAutorelease(v69);
    *a4 = v62;
  }
  v63 = 3;
LABEL_44:

  return v63;
}

@end
