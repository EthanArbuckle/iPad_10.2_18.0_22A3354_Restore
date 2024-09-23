@implementation PLModelMigrationAction_UpdateAssetAdjustmentsState

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PLEnumerateAndSaveController *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  PLEnumerateAndSaveController *v16;
  id *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  __int128 *v23;
  void *v24;
  __int128 *v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  __int128 *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v39;
  id obj;
  _QWORD v41[9];
  _QWORD v42[6];
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[5];
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
  void *v62;
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
  _QWORD v97[2];

  v97[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 1;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__1109;
  v55 = __Block_byref_object_dispose__1110;
  v56 = 0;
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("adjustmentsState"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v97[0] = CFSTR("additionalAttributes.unmanagedAdjustment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", v9);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setChangeSource:", 1);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__1109;
  v49[4] = __Block_byref_object_dispose__1110;
  v50 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v10 = [PLEnumerateAndSaveController alloc];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionBackground pathManager](self, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke;
  v43[3] = &unk_1E36700D0;
  v15 = v6;
  v44 = v15;
  v42[0] = v14;
  v42[1] = 3221225472;
  v42[2] = __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke_2;
  v42[3] = &unk_1E3670818;
  v42[4] = self;
  v42[5] = v49;
  v41[0] = v14;
  v41[1] = 3221225472;
  v41[2] = __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke_3;
  v41[3] = &unk_1E366ADB8;
  v41[4] = self;
  v41[5] = &v51;
  v41[6] = &v57;
  v41[7] = &v45;
  v41[8] = v49;
  v16 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v10, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v12, v7, v15, v13, 0, 0, v43, v42, v41);

  v17 = (id *)(v52 + 5);
  obj = (id)v52[5];
  LODWORD(v13) = -[PLEnumerateAndSaveController processObjectsWithError:](v16, "processObjectsWithError:", &obj);
  objc_storeStrong(v17, obj);
  if ((_DWORD)v13)
  {
    -[PLModelMigrationActionBackground logger](self, "logger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      PLMigrationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
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
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        v22 = (void *)v46[3];
        v61 = 134217984;
        v62 = v22;
        LODWORD(v39) = 12;
        v23 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v61, v39);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActionBackground.m", 1075, 0);

        if (v23 != &v65)
        {
          v25 = v23;
LABEL_12:
          free(v25);
        }
      }
    }
  }
  else
  {
    v58[3] = 3;
    -[PLModelMigrationActionBackground logger](self, "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      PLMigrationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (v28)
      {
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
        v62 = v31;
        v63 = 2114;
        v64 = v32;
        LODWORD(v39) = 22;
        v33 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v61, v39);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActionBackground.m", 1078, 16);

        if (v33 != &v65)
        {
          v25 = v33;
          goto LABEL_12;
        }
      }
    }
  }
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  v35 = v58[3];
  v36 = (id)v52[5];
  v37 = v36;
  if (v35 != 1 && a4)
    *a4 = objc_retainAutorelease(v36);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return 1;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

+ (BOOL)isResetAfterRebuildRequiredWithLibrary:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[8];
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__1109;
  v14[4] = __Block_byref_object_dispose__1110;
  v15 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__PLModelMigrationAction_UpdateAssetAdjustmentsState_isResetAfterRebuildRequiredWithLibrary___block_invoke;
  v10[3] = &unk_1E3677830;
  v12 = &v16;
  v4 = v3;
  v11 = v4;
  v13 = v14;
  objc_msgSend(v4, "performBlockAndWait:", v10);
  v5 = 0;
  v6 = v17[3];
  if (v6 && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Requesting background migration after rebuild", v9, 2u);
    }

    v5 = 1;
  }

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);

  return v5;
}

@end
