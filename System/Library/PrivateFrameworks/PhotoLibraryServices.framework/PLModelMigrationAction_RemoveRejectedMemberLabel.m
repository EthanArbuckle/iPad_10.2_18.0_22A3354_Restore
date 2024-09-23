@implementation PLModelMigrationAction_RemoveRejectedMemberLabel

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PLEnumerateAndSaveController *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  PLEnumerateAndSaveController *v17;
  id *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  __int128 *v24;
  void *v25;
  __int128 *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  __int128 *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  int64_t v39;
  uint64_t v41;
  id obj;
  _QWORD v43[5];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  _QWORD *v48;
  _QWORD v49[6];
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[5];
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  void *v69;
  __int16 v70;
  uint64_t v71;
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
  __int128 v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 1;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__38433;
  v62 = __Block_byref_object_dispose__38434;
  v63 = 0;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphLabel entityName](PLGraphLabel, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("code"), 1002);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__38433;
  v56[4] = __Block_byref_object_dispose__38434;
  v57 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke;
  v50[3] = &unk_1E36700D0;
  v51 = v6;
  v49[0] = v15;
  v49[1] = 3221225472;
  v49[2] = __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke_2;
  v49[3] = &unk_1E3670818;
  v49[4] = self;
  v49[5] = v56;
  v43[0] = v15;
  v43[1] = 3221225472;
  v43[2] = __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke_3;
  v43[3] = &unk_1E3669428;
  v43[4] = self;
  v45 = &v58;
  v46 = &v64;
  v16 = v51;
  v44 = v16;
  v47 = &v52;
  v48 = v56;
  v17 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v11, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v13, v9, v16, v14, 0, 1, v50, v49, v43);

  v18 = (id *)(v59 + 5);
  obj = (id)v59[5];
  LODWORD(v14) = -[PLEnumerateAndSaveController processObjectsWithError:](v17, "processObjectsWithError:", &obj);
  objc_storeStrong(v18, obj);
  if ((_DWORD)v14)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      PLMigrationGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

      if (v21)
      {
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
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        PLMigrationGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        v23 = (void *)v53[3];
        v68 = 134217984;
        v69 = v23;
        LODWORD(v41) = 12;
        v24 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v68, v41);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 525, 0);

        if (v24 != &v72)
        {
          v26 = v24;
LABEL_10:
          free(v26);
        }
      }
    }
  }
  else
  {
    v65[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      PLMigrationGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

      if (v29)
      {
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
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        PLMigrationGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v59[5];
        v68 = 138543618;
        v69 = v32;
        v70 = 2112;
        v71 = v33;
        LODWORD(v41) = 22;
        v34 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v68, v41);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActions_18000.m", 528, 16);

        if (v34 != &v72)
        {
          v26 = v34;
          goto LABEL_10;
        }
      }
    }
  }
  v36 = v65[3];
  v37 = (id)v59[5];
  v38 = v37;
  if (v36 != 1 && a4)
    *a4 = objc_retainAutorelease(v37);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v39 = v65[3];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  return v39;
}

@end
