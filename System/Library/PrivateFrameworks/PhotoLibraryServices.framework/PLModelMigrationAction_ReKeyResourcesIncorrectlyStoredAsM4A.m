@implementation PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  PLEnumerateAndSaveController *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  PLEnumerateAndSaveController *v15;
  id *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  __int128 *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  int64_t v35;
  uint64_t v37;
  id obj;
  _QWORD v39[8];
  _QWORD v40[6];
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
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

  v95 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 1;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__38433;
  v53 = __Block_byref_object_dispose__38434;
  v54 = 0;
  +[PLInternalResource fetchRequest](PLInternalResource, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d AND %K = %d AND %K = %d AND %K != nil"), CFSTR("resourceType"), 1, CFSTR("compactUTI"), 24, CFSTR("dataStoreClassID"), 0, CFSTR("dataStoreKeyData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__38433;
  v47 = __Block_byref_object_dispose__38434;
  v48 = 0;
  v9 = [PLEnumerateAndSaveController alloc];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke;
  v41[3] = &unk_1E36700D0;
  v14 = v6;
  v42 = v14;
  v40[0] = v13;
  v40[1] = 3221225472;
  v40[2] = __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke_2;
  v40[3] = &unk_1E3670818;
  v40[4] = self;
  v40[5] = &v43;
  v39[0] = v13;
  v39[1] = 3221225472;
  v39[2] = __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke_3;
  v39[3] = &unk_1E36694A0;
  v39[4] = self;
  v39[5] = &v49;
  v39[6] = &v55;
  v39[7] = &v43;
  v15 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v9, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v11, v7, v14, v12, 0, 1, v41, v40, v39);

  v16 = (id *)(v50 + 5);
  obj = (id)v50[5];
  LODWORD(v12) = -[PLEnumerateAndSaveController processObjectsWithError:](v15, "processObjectsWithError:", &obj);
  objc_storeStrong(v16, obj);
  if ((_DWORD)v12)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_10;
    PLMigrationGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (!v19)
      goto LABEL_10;
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
    v20 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    v21 = objc_msgSend((id)v44[5], "totalUnitCount");
    v59 = 134217984;
    v60 = v21;
    LODWORD(v37) = 12;
    v22 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v59, v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 680, 0);

  }
  else
  {
    v56[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_10;
    PLMigrationGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

    if (!v26)
      goto LABEL_10;
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
    v27 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v50[5];
    v59 = 138543618;
    v60 = (uint64_t)v29;
    v61 = 2112;
    v62 = v30;
    LODWORD(v37) = 22;
    v22 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v59, v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 683, 16);

  }
  if (v22 != &v63)
    free(v22);
LABEL_10:
  v32 = v56[3];
  v33 = (id)v50[5];
  v34 = v33;
  if (v32 != 1 && a4)
    *a4 = objc_retainAutorelease(v33);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v35 = v56[3];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v35;
}

@end
