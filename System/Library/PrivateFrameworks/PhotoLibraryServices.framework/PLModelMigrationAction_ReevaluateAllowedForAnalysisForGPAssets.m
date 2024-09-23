@implementation PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets

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
  uint64_t v15;
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
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  int64_t v38;
  uint64_t v40;
  id obj;
  _QWORD v42[8];
  _QWORD v43[6];
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
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
  __int128 v97;
  _QWORD v98[2];

  v98[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 1;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLExtendedAttributes entityName](PLExtendedAttributes, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("generativeAIType"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v98[0] = CFSTR("asset.additionalAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v11);

  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__38433;
  v56 = __Block_byref_object_dispose__38434;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__38433;
  v50 = __Block_byref_object_dispose__38434;
  v51 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke;
  v44[3] = &unk_1E36700D0;
  v17 = v6;
  v45 = v17;
  v43[0] = v16;
  v43[1] = 3221225472;
  v43[2] = __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke_2;
  v43[3] = &unk_1E3670818;
  v43[4] = self;
  v43[5] = &v46;
  v42[0] = v16;
  v42[1] = 3221225472;
  v42[2] = __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke_3;
  v42[3] = &unk_1E36695B8;
  v42[4] = self;
  v42[5] = &v52;
  v42[6] = &v58;
  v42[7] = &v46;
  v18 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v14, v9, v17, v15, 0, 1, v44, v43, v42);

  v19 = (id *)(v53 + 5);
  obj = (id)v53[5];
  LOBYTE(v15) = -[PLEnumerateAndSaveController processObjectsWithError:](v18, "processObjectsWithError:", &obj);
  objc_storeStrong(v19, obj);
  if ((v15 & 1) != 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_10;
    PLMigrationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

    if (!v22)
      goto LABEL_10;
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
    v66 = 0u;
    v67 = 0u;
    PLMigrationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    v24 = objc_msgSend((id)v47[5], "totalUnitCount");
    v62 = 134217984;
    v63 = v24;
    LODWORD(v40) = 12;
    v25 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v62, v40);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 1159, 0);

  }
  else
  {
    v59[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
      goto LABEL_10;
    PLMigrationGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

    if (!v29)
      goto LABEL_10;
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
    v66 = 0u;
    v67 = 0u;
    PLMigrationGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v53[5];
    v62 = 138543618;
    v63 = (uint64_t)v32;
    v64 = 2112;
    v65 = v33;
    LODWORD(v40) = 22;
    v25 = (__int128 *)_os_log_send_and_compose_impl();

    -[PLModelMigrationActionCore logger](self, "logger", &v62, v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 1157, 16);

  }
  if (v25 != &v66)
    free(v25);
LABEL_10:
  v35 = v59[3];
  v36 = (id)v53[5];
  v37 = v36;
  if (v35 != 1 && a4)
    *a4 = objc_retainAutorelease(v36);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v38 = v59[3];

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  return v38;
}

@end
