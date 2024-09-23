@implementation PLModelMigrationAction_PopulatePersonCloudDetectionType

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
  uint64_t v14;
  uint64_t v15;
  id v16;
  PLEnumerateAndSaveController *v17;
  id *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  __int128 *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  int64_t v37;
  uint64_t v39;
  id obj;
  _QWORD v41[8];
  _QWORD v42[6];
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
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
  __int128 v95;
  __int128 v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 1;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__46832;
  v55 = __Block_byref_object_dispose__46833;
  v56 = 0;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLPerson entityName](PLPerson, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("cloudDetectionType"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__46832;
  v49 = __Block_byref_object_dispose__46833;
  v50 = 0;
  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke;
  v43[3] = &unk_1E36700D0;
  v16 = v6;
  v44 = v16;
  v42[0] = v15;
  v42[1] = 3221225472;
  v42[2] = __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke_2;
  v42[3] = &unk_1E3670818;
  v42[4] = self;
  v42[5] = &v45;
  v41[0] = v15;
  v41[1] = 3221225472;
  v41[2] = __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke_3;
  v41[3] = &unk_1E366AE08;
  v41[4] = self;
  v41[5] = &v51;
  v41[6] = &v57;
  v41[7] = &v45;
  v17 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v11, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v13, v9, v16, v14, 0, 1, v43, v42, v41);

  v18 = (id *)(v52 + 5);
  obj = (id)v52[5];
  LOBYTE(v14) = -[PLEnumerateAndSaveController processObjectsWithError:](v17, "processObjectsWithError:", &obj);
  objc_storeStrong(v18, obj);
  if ((v14 & 1) != 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_10;
    PLMigrationGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (!v21)
      goto LABEL_10;
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
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    PLMigrationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    v23 = objc_msgSend((id)v46[5], "totalUnitCount");
    v61 = 134217984;
    v62 = v23;
    LODWORD(v39) = 12;
    v24 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v61, v39);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_17000.m", 521, 0);

  }
  else
  {
    v58[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
      goto LABEL_10;
    PLMigrationGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

    if (!v28)
      goto LABEL_10;
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
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    PLMigrationGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v52[5];
    v61 = 138543618;
    v62 = (uint64_t)v31;
    v63 = 2114;
    v64 = v32;
    LODWORD(v39) = 22;
    v24 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v61, v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_17000.m", 519, 16);

  }
  if (v24 != &v65)
    free(v24);
LABEL_10:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v34 = v58[3];
  v35 = (id)v52[5];
  v36 = v35;
  if (v34 != 1 && a4)
    *a4 = objc_retainAutorelease(v35);

  v37 = v58[3];
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v37;
}

@end
