@implementation PLModelMigrationAction_LibraryScopeTrashedStateFixup

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PLEnumerateAndSaveController *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  PLEnumerateAndSaveController *v21;
  id *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  __int128 *v28;
  void *v29;
  __int128 *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  __int128 *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  int64_t v43;
  uint64_t v45;
  id obj;
  _QWORD v47[9];
  _QWORD v48[6];
  _QWORD v49[4];
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[5];
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
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
  _QWORD v103[5];

  v103[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 1;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__46832;
  v61 = __Block_byref_object_dispose__46833;
  v62 = 0;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLLibraryScope entityName](PLLibraryScope, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  +[PLLibraryScope predicateForActiveLibraryScope](PLLibraryScope, "predicateForActiveLibraryScope");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trashedState"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v14);

  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__46832;
  v55[4] = __Block_byref_object_dispose__46833;
  v56 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v15 = [PLEnumerateAndSaveController alloc];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke;
  v49[3] = &unk_1E36700D0;
  v20 = v6;
  v50 = v20;
  v48[0] = v19;
  v48[1] = 3221225472;
  v48[2] = __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke_2;
  v48[3] = &unk_1E3670818;
  v48[4] = self;
  v48[5] = v55;
  v47[0] = v19;
  v47[1] = 3221225472;
  v47[2] = __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke_3;
  v47[3] = &unk_1E366ADE0;
  v47[4] = self;
  v47[5] = &v51;
  v47[6] = &v57;
  v47[7] = &v63;
  v47[8] = v55;
  v21 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v15, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v17, v9, v20, v18, 0, 1, v49, v48, v47);

  v22 = (id *)(v58 + 5);
  obj = (id)v58[5];
  LOBYTE(v18) = -[PLEnumerateAndSaveController processObjectsWithError:](v21, "processObjectsWithError:", &obj);
  objc_storeStrong(v22, obj);
  if ((v18 & 1) != 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      PLMigrationGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
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
        v26 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        v27 = (void *)v52[3];
        v67 = 134217984;
        v68 = v27;
        LODWORD(v45) = 12;
        v28 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v67, v45);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_17000.m", 483, 0);

        if (v28 != &v71)
        {
          v30 = v28;
LABEL_10:
          free(v30);
        }
      }
    }
  }
  else
  {
    v64[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      PLMigrationGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

      if (v33)
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
        v34 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v58[5];
        v67 = 138543618;
        v68 = v36;
        v69 = 2114;
        v70 = v37;
        LODWORD(v45) = 22;
        v38 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v67, v45);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActions_17000.m", 481, 16);

        if (v38 != &v71)
        {
          v30 = v38;
          goto LABEL_10;
        }
      }
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v40 = v64[3];
  v41 = (id)v58[5];
  v42 = v41;
  if (v40 != 1 && a4)
    *a4 = objc_retainAutorelease(v41);

  v43 = v64[3];
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v55, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  return v43;
}

@end
