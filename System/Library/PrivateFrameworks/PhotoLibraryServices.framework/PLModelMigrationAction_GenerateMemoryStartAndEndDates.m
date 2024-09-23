@implementation PLModelMigrationAction_GenerateMemoryStartAndEndDates

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
  int64_t v36;
  uint64_t v38;
  id obj;
  _QWORD v40[9];
  _QWORD v41[6];
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[5];
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
  uint64_t v59;
  int v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
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
  __int128 v95;
  _QWORD v96[2];

  v96[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 1;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__38433;
  v54 = __Block_byref_object_dispose__38434;
  v55 = 0;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLMemory entityName](PLMemory, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v96[0] = CFSTR("representativeAssets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v10);

  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__38433;
  v48[4] = __Block_byref_object_dispose__38434;
  v49 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke;
  v42[3] = &unk_1E36700D0;
  v16 = v6;
  v43 = v16;
  v41[0] = v15;
  v41[1] = 3221225472;
  v41[2] = __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke_2;
  v41[3] = &unk_1E3670818;
  v41[4] = self;
  v41[5] = v48;
  v40[0] = v15;
  v40[1] = 3221225472;
  v40[2] = __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke_3;
  v40[3] = &unk_1E36693B0;
  v40[4] = self;
  v40[5] = &v50;
  v40[6] = &v56;
  v40[7] = &v44;
  v40[8] = v48;
  v17 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v11, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v13, v9, v16, v14, 0, 1, v42, v41, v40);

  v18 = (id *)(v51 + 5);
  obj = (id)v51[5];
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
        v64 = 0u;
        v65 = 0u;
        PLMigrationGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        v23 = (void *)v45[3];
        v60 = 134217984;
        v61 = v23;
        LODWORD(v38) = 12;
        v24 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v60, v38);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 167, 0);

        if (v24 != &v64)
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
    v57[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      PLMigrationGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

      if (v29)
      {
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
        v64 = 0u;
        v65 = 0u;
        PLMigrationGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v51[5];
        v60 = 138543618;
        v61 = v32;
        v62 = 2112;
        v63 = v33;
        LODWORD(v38) = 22;
        v34 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v60, v38);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActions_18000.m", 170, 16);

        if (v34 != &v64)
        {
          v26 = v34;
          goto LABEL_10;
        }
      }
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease((id)v51[5]);
  v36 = v57[3];

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(v48, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  return v36;
}

@end
