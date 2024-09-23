@implementation PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded

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
  void *v15;
  objc_class *v16;
  void *v17;
  PLEnumerateAndSaveController *v18;
  void *v19;
  uint64_t v20;
  id v21;
  PLEnumerateAndSaveController *v22;
  id *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  __int128 *v29;
  void *v30;
  __int128 *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  uint64_t v36;
  __int128 *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  int64_t v42;
  uint64_t v44;
  id obj;
  _QWORD v46[9];
  _QWORD v47[6];
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[5];
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
  void *v67;
  __int16 v68;
  uint64_t v69;
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
  __int128 v100;
  __int128 v101;
  const __CFString *v102;
  _QWORD v103[5];

  v103[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 1;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLComputeSyncAttributes entityName](PLComputeSyncAttributes, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("cloudComputeStateVersion"), CFSTR("1.900"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("localAnalysisStage"), 900);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v14);

  v102 = CFSTR("asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v15);

  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__38433;
  v60 = __Block_byref_object_dispose__38434;
  v61 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__38433;
  v54[4] = __Block_byref_object_dispose__38434;
  v55 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [PLEnumerateAndSaveController alloc];
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke;
  v48[3] = &unk_1E36700D0;
  v21 = v6;
  v49 = v21;
  v47[0] = v20;
  v47[1] = 3221225472;
  v47[2] = __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke_2;
  v47[3] = &unk_1E3670818;
  v47[4] = self;
  v47[5] = v54;
  v46[0] = v20;
  v46[1] = 3221225472;
  v46[2] = __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke_3;
  v46[3] = &unk_1E3669658;
  v46[4] = self;
  v46[5] = &v56;
  v46[6] = &v62;
  v46[7] = &v50;
  v46[8] = v54;
  v22 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v18, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v17, v9, v21, v19, 0, 1, v48, v47, v46);

  v23 = (id *)(v57 + 5);
  obj = (id)v57[5];
  LOBYTE(v20) = -[PLEnumerateAndSaveController processObjectsWithError:](v22, "processObjectsWithError:", &obj);
  objc_storeStrong(v23, obj);
  if ((v20 & 1) != 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      PLMigrationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

      if (v26)
      {
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
        v70 = 0u;
        v71 = 0u;
        PLMigrationGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        v28 = (void *)v51[3];
        v66 = 134217984;
        v67 = v28;
        LODWORD(v44) = 12;
        v29 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v66, v44);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_18000.m", 1559, 0);

        if (v29 != &v70)
        {
          v31 = v29;
LABEL_10:
          free(v31);
        }
      }
    }
  }
  else
  {
    v63[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      PLMigrationGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

      if (v34)
      {
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
        v70 = 0u;
        v71 = 0u;
        PLMigrationGetLog();
        v35 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
        v36 = v57[5];
        v66 = 138543618;
        v67 = v17;
        v68 = 2112;
        v69 = v36;
        LODWORD(v44) = 22;
        v37 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v66, v44);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logWithMessage:fromCodeLocation:type:", v37, "PLModelMigrationActions_18000.m", 1557, 16);

        if (v37 != &v70)
        {
          v31 = v37;
          goto LABEL_10;
        }
      }
    }
  }
  v39 = v63[3];
  v40 = (id)v57[5];
  v41 = v40;
  if (v39 != 1 && a4)
    *a4 = objc_retainAutorelease(v40);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v42 = v63[3];

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(v54, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  return v42;
}

@end
