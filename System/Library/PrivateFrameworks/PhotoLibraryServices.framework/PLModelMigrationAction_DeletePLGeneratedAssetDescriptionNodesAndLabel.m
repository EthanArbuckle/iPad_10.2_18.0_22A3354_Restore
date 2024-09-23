@implementation PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLEnumerateAndSaveController *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  PLEnumerateAndSaveController *v18;
  id *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  __int128 *v25;
  void *v26;
  __int128 *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  uint64_t v32;
  __int128 *v33;
  void *v34;
  id *v35;
  int64_t v36;
  id v37;
  int64_t v38;
  uint64_t v40;
  id v41;
  id obj;
  _QWORD v43[5];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  _QWORD v47[6];
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
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
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[2];

  v100[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 1;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__38433;
  v60 = __Block_byref_object_dispose__38434;
  v61 = 0;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v100[0] = CFSTR("primaryLabel");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("primaryLabelCode"), 1300);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v11);

  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__38433;
  v54 = __Block_byref_object_dispose__38434;
  v55 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke;
  v48[3] = &unk_1E36700D0;
  v49 = v6;
  v47[0] = v16;
  v47[1] = 3221225472;
  v47[2] = __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke_2;
  v47[3] = &unk_1E3670818;
  v47[4] = self;
  v47[5] = &v50;
  v43[0] = v16;
  v43[1] = 3221225472;
  v43[2] = __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke_3;
  v43[3] = &unk_1E36694C8;
  v43[4] = self;
  v45 = &v56;
  v46 = &v62;
  v17 = v49;
  v44 = v17;
  v18 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v14, v9, v17, v15, 0, 0, v48, v47, v43);

  v19 = (id *)(v57 + 5);
  obj = (id)v57[5];
  LODWORD(v15) = -[PLEnumerateAndSaveController processObjectsWithError:](v18, "processObjectsWithError:", &obj);
  objc_storeStrong(v19, obj);
  if ((_DWORD)v15)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      PLMigrationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
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
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        PLMigrationGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        v24 = objc_msgSend((id)v51[5], "totalUnitCount");
        v66 = 134217984;
        v67 = v24;
        LODWORD(v40) = 12;
        v25 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v66, v40);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 720, 0);

        if (v25 != &v68)
        {
          v27 = v25;
LABEL_10:
          free(v27);
        }
      }
    }
  }
  else
  {
    v63[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      PLMigrationGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

      if (v30)
      {
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
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        PLMigrationGetLog();
        v31 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
        v32 = v57[5];
        v66 = 138412290;
        v67 = v32;
        LODWORD(v40) = 12;
        v33 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v66, v40);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActions_18000.m", 723, 16);

        if (v33 != &v68)
        {
          v27 = v33;
          goto LABEL_10;
        }
      }
    }
  }
  v35 = (id *)(v57 + 5);
  if (v63[3] != 1)
  {
    v37 = (id)v57[5];
    if (!a4)
      goto LABEL_17;
LABEL_16:
    v37 = objc_retainAutorelease(v37);
    *a4 = v37;
    goto LABEL_17;
  }
  v41 = (id)v57[5];
  v36 = -[PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel _deleteLabelWithCode1300InContext:error:](self, "_deleteLabelWithCode1300InContext:error:", v17, &v41);
  objc_storeStrong(v35, v41);
  v63[3] = v36;
  v37 = (id)v57[5];
  if (v36 != 1 && a4)
    goto LABEL_16;
LABEL_17:

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v38 = v63[3];

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  return v38;
}

- (int64_t)_deleteLabelWithCode1300InContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  __int128 *v31;
  void *v32;
  int64_t v33;
  __int128 *v34;
  void *v35;
  __int128 *v36;
  void *v37;
  uint64_t v39;
  int v40;
  id v41;
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
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphLabel entityName](PLGraphLabel, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 1300"), CFSTR("code"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v6, "executeFetchRequest:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v6, "deleteObject:", v13);
      if ((objc_msgSend(v6, "save:", a4) & 1) == 0)
      {
        -[PLModelMigrationActionCore logger](self, "logger");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          PLMigrationGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

          if (v17)
          {
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
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
            PLMigrationGetLog();
            v18 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
            if (a4)
              v19 = *a4;
            else
              v19 = 0;
            v40 = 138412290;
            v41 = v19;
            LODWORD(v39) = 12;
            v36 = (__int128 *)_os_log_send_and_compose_impl();

            -[PLModelMigrationActionCore logger](self, "logger", &v40, v39);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActions_18000.m", 744, 16);

            if (v36 != &v42)
              free(v36);
          }
        }
        v33 = 3;
        goto LABEL_25;
      }
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        PLMigrationGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

        if (v29)
        {
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
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
          PLMigrationGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          LOWORD(v40) = 0;
          LODWORD(v39) = 2;
          v31 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v40, v39);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_18000.m", 747, 0);

          if (v31 != &v42)
            free(v31);
        }
      }
    }
    v33 = 1;
LABEL_25:

    goto LABEL_26;
  }
  -[PLModelMigrationActionCore logger](self, "logger");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    PLMigrationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

    if (v23)
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
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
      PLMigrationGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      v25 = a4 ? *a4 : 0;
      v40 = 138412290;
      v41 = v25;
      LODWORD(v39) = 12;
      v34 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v40, v39);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActions_18000.m", 751, 16);

      if (v34 != &v42)
        free(v34);
    }
  }
  v33 = 3;
LABEL_26:

  return v33;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end
