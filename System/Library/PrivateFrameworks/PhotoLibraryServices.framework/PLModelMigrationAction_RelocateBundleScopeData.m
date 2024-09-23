@implementation PLModelMigrationAction_RelocateBundleScopeData

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  __int128 *v24;
  void *v25;
  int64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  __int128 *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  unsigned __int16 v46;
  void *v47;
  uint64_t v48;
  int64_t v49;
  id v50;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  _BOOL4 v55;
  NSObject *v56;
  __int128 *v57;
  void *v58;
  uint64_t v60;
  uint64_t v61;
  id *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  uint64_t v73;
  const __CFString *v74;
  int v75;
  id v76;
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
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _QWORD v110[4];

  v110[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUBF");

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C97B48];
    +[PLInternalResource entityName](PLInternalResource, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("dataStoreKeyData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("asset.bundleScope"), &unk_1E3763BA8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v110[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v16);

    v72 = 0;
    v63 = v11;
    v17 = objc_msgSend(v6, "countForFetchRequest:error:", v11, &v72);
    v18 = v72;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
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
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
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
          PLMigrationGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
          v75 = 138412290;
          v76 = v18;
          LODWORD(v61) = 12;
          v24 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v75, v61);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_15000.m", 479, 16);

          if (v24 != &v77)
            free(v24);
        }
      }
      v26 = 3;
    }
    else
    {
      -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(&unk_1E3763BC0, "count") + v17, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLModelMigrationActionCore pathManager](self, "pathManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *MEMORY[0x1E0D74648];
      v71 = v18;
      objc_msgSend(v38, "photoDirectoryWithType:leafType:additionalPathComponents:createIfNeeded:error:", 1, 1, v39, 1, &v71);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v71;

      v64 = v6;
      if (v40)
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v42 = objc_msgSend(&unk_1E3763BC0, "countByEnumeratingWithState:objects:count:", &v67, v109, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v68;
          v26 = 1;
          v62 = a4;
          while (2)
          {
            for (i = 0; i != v43; ++i)
            {
              if (*(_QWORD *)v68 != v44)
                objc_enumerationMutation(&unk_1E3763BC0);
              v46 = objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "unsignedIntValue");
              -[PLModelMigrationActionCore pathManager](self, "pathManager");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v47, "photoLibraryPathTypeForBundleScope:", v46);

              v66 = v41;
              v49 = -[PLModelMigrationAction_RelocateBundleScopeData renameWithDestinationPath:error:](self, "renameWithDestinationPath:error:", v48, &v66);
              v50 = v66;

              if (v49 != 1 || v46 == 2)
              {
                v41 = v50;
              }
              else
              {
                v65 = v50;
                v49 = -[PLModelMigrationAction_RelocateBundleScopeData updateResourceFilePathWithManagedObjectContext:bundleScope:progress:error:](self, "updateResourceFilePathWithManagedObjectContext:bundleScope:progress:error:", v64, v46, v37, &v65);
                v41 = v65;

              }
              objc_msgSend(v37, "setCompletedUnitCount:", objc_msgSend(v37, "completedUnitCount") + 1);
              if (v49 != 1)
              {
                v26 = v49;
                a4 = v62;
                goto LABEL_36;
              }
            }
            v43 = objc_msgSend(&unk_1E3763BC0, "countByEnumeratingWithState:objects:count:", &v67, v109, 16);
            a4 = v62;
            if (v43)
              continue;
            break;
          }
        }
        else
        {
          v26 = 1;
        }
      }
      else
      {
        -[PLModelMigrationActionCore logger](self, "logger");
        v52 = objc_claimAutoreleasedReturnValue();
        if (v52)
        {
          v53 = (void *)v52;
          PLMigrationGetLog();
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

          if (v55)
          {
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v103 = 0u;
            v104 = 0u;
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
            PLMigrationGetLog();
            v56 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v56, OS_LOG_TYPE_ERROR);
            v75 = 138412290;
            v76 = v41;
            LODWORD(v61) = 12;
            v57 = (__int128 *)_os_log_send_and_compose_impl();

            -[PLModelMigrationActionCore logger](self, "logger", &v75, v61);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "logWithMessage:fromCodeLocation:type:", v57, "PLModelMigrationActions_15000.m", 475, 16);

            if (v57 != &v77)
              free(v57);
          }
        }
        v26 = 3;
      }
LABEL_36:

      v18 = v41;
      v6 = v64;
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0D74498];
    v73 = *MEMORY[0x1E0CB2D50];
    v74 = CFSTR("Unexpected attempt to relocate scoped paths for DCIM");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 46003, v29);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[PLModelMigrationActionCore logger](self, "logger");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = (void *)v30;
      PLMigrationGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

      if (v33)
      {
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
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
        PLMigrationGetLog();
        v34 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
        LOWORD(v75) = 0;
        LODWORD(v60) = 2;
        v35 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v75, v60);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logWithMessage:fromCodeLocation:type:", v35, "PLModelMigrationActions_15000.m", 485, 16);

        if (v35 != &v77)
          free(v35);
      }
    }
    v26 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v18);

  return v26;
}

- (int64_t)renameWithDestinationPath:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  const std::__fs::filesystem::path *v10;
  id v11;
  const std::__fs::filesystem::path *v12;
  std::error_code *v13;
  int v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  __int128 *v20;
  void *v21;
  int64_t v22;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  void *v42;
  void *v43;
  int v44;
  int *v45;
  char *v46;
  __int128 *v47;
  void *v48;
  uint64_t v49;
  id *v50;
  int v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  char *v58;
  _QWORD v59[2];
  _QWORD v60[2];
  uint64_t v61;
  void *v62;
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
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;

  v5 = a3;
  v95 = *MEMORY[0x1E0C80C00];
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoDirectoryWithType:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLModelMigrationAction_RelocateBundleScopeData legacyPrefixPathWithType:](self, "legacyPrefixPathWithType:", v5);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const std::__fs::filesystem::path *)objc_msgSend(v9, "fileSystemRepresentation");
  v11 = objc_retainAutorelease(v8);
  v12 = (const std::__fs::filesystem::path *)objc_msgSend(v11, "fileSystemRepresentation");
  rename(v10, v12, v13);
  if (!v14)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  if (*__error() != 2)
  {
    v50 = a4;
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2FE0];
    v26 = *__error();
    v61 = *MEMORY[0x1E0CB2D50];
    v27 = v61;
    v28 = (void *)MEMORY[0x1E0CB3940];
    v29 = __error();
    objc_msgSend(v28, "stringWithUTF8String:", strerror(*v29));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, v26, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0D74498];
    v35 = *MEMORY[0x1E0CB3388];
    v59[0] = v27;
    v59[1] = v35;
    v60[0] = CFSTR("Failed to relocate bundle directory");
    v60[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 46003, v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLModelMigrationActionCore logger](self, "logger");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      PLMigrationGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);

      if (v40)
      {
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
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        PLMigrationGetLog();
        v41 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
        objc_msgSend(v9, "lastPathComponent");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *__error();
        v45 = __error();
        v46 = strerror(*v45);
        v51 = 138544130;
        v52 = v42;
        v53 = 2114;
        v54 = v43;
        v55 = 1024;
        v56 = v44;
        v57 = 2082;
        v58 = v46;
        LODWORD(v49) = 38;
        v47 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v51, v49);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "logWithMessage:fromCodeLocation:type:", v47, "PLModelMigrationActions_15000.m", 509, 16);

        if (v47 != &v63)
          free(v47);
      }
    }

    v22 = 3;
    a4 = v50;
    if (v50)
      goto LABEL_9;
    goto LABEL_10;
  }
  -[PLModelMigrationActionCore logger](self, "logger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
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
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      PLMigrationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      objc_msgSend(v9, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543362;
      v52 = v19;
      LODWORD(v49) = 12;
      v20 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v51, v49);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_15000.m", 502, 0);

      if (v20 != &v63)
        free(v20);
    }
    goto LABEL_7;
  }
LABEL_8:
  v22 = 1;
  if (a4)
LABEL_9:
    *a4 = objc_retainAutorelease(v15);
LABEL_10:

  return v22;
}

- (int64_t)updateResourceFilePathWithManagedObjectContext:(id)a3 bundleScope:(unsigned __int16)a4 progress:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  int64_t v28;
  NSObject *v29;
  uint64_t v30;
  id v32;
  _QWORD v33[5];
  id v34;
  _BYTE *v35;
  char v36;
  id v37;
  uint8_t buf[4];
  _BYTE v39[18];
  _BYTE v40[24];
  uint64_t v41;
  const __CFString *v42;
  _QWORD v43[4];

  v8 = a4;
  v43[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v32 = a5;
  if (v8 > 4 || ((1 << v8) & 0x1A) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationActions_15000.m"), 519, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scope == PLBundleScopeCMM || scope == PLBundleScopeSyndication || scope == PLBundleScopeLocked"));

  }
  v13 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("dataStoreKeyData"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("asset.bundleScope"), v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "andPredicateWithSubpredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v20);

  v42 = CFSTR("asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRelationshipKeyPathsForPrefetching:", v21);

  objc_msgSend(v15, "setFetchBatchSize:", 100);
  v37 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v15, &v37);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v37;
  if (v22)
  {
    *(_QWORD *)v40 = 0;
    *(_QWORD *)&v40[8] = v40;
    *(_QWORD *)&v40[16] = 0x2020000000;
    v41 = 0;
    -[PLModelMigrationActionCore pathManager](self, "pathManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "photoLibraryPathTypeForBundleScope:", v8);

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __124__PLModelMigrationAction_RelocateBundleScopeData_updateResourceFilePathWithManagedObjectContext_bundleScope_progress_error___block_invoke;
    v33[3] = &unk_1E366AC88;
    v36 = v25;
    v33[4] = self;
    v35 = v40;
    v34 = v32;
    objc_msgSend(v11, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v22, v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      PLMigrationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)v39 = "-[PLModelMigrationAction_RelocateBundleScopeData updateResourceFilePathWithManagedObjectContext"
                         ":bundleScope:progress:error:]";
        *(_WORD *)&v39[8] = 2112;
        *(_QWORD *)&v39[10] = v26;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "%{public}s: enumerate with incremental save failed: %@", buf, 0x16u);
      }
      v28 = 3;
    }
    else
    {
      PLMigrationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(_QWORD *)(*(_QWORD *)&v40[8] + 24);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v39 = v25;
        *(_WORD *)&v39[4] = 2048;
        *(_QWORD *)&v39[6] = v30;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Updated file key paths for type %d. %ld assets updated.", buf, 0x12u);
      }
      v28 = 1;
    }

    _Block_object_dispose(v40, 8);
    if (a6)
LABEL_17:
      *a6 = objc_retainAutorelease(v26);
  }
  else
  {
    PLMigrationGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v40 = 136446466;
      *(_QWORD *)&v40[4] = "-[PLModelMigrationAction_RelocateBundleScopeData updateResourceFilePathWithManagedObjectConte"
                           "xt:bundleScope:progress:error:]";
      *(_WORD *)&v40[12] = 2112;
      *(_QWORD *)&v40[14] = v23;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "%{public}s: resource fetch failed: %@", v40, 0x16u);
    }

    v28 = 3;
    v26 = v23;
    if (a6)
      goto LABEL_17;
  }

  return v28;
}

- (id)legacyPrefixPathWithType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoDirectoryWithType:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoDirectoryWithType:", 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
