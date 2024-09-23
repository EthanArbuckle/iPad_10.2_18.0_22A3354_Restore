@implementation PLModelMigrationAction_dedupeResourcesWithSimilarCompactUTI

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
  PLEnumerateAndSaveController *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  PLEnumerateAndSaveController *v20;
  id *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  __int128 *v27;
  void *v28;
  __int128 *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
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
  _QWORD v103[4];

  v103[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 1;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__1109;
  v60 = __Block_byref_object_dispose__1110;
  v61 = 0;
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLInternalResource fetchRequest](PLInternalResource, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v11);

  v102 = CFSTR("asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v12);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K BEGINSWITH %@"), CFSTR("compactUTI"), CFSTR("_"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v13);

  }
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__1109;
  v54[4] = __Block_byref_object_dispose__1110;
  v55 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v14 = [PLEnumerateAndSaveController alloc];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionBackground pathManager](self, "pathManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __107__PLModelMigrationAction_dedupeResourcesWithSimilarCompactUTI_performActionWithManagedObjectContext_error___block_invoke;
  v48[3] = &unk_1E36700D0;
  v19 = v6;
  v49 = v19;
  v47[0] = v18;
  v47[1] = 3221225472;
  v47[2] = __107__PLModelMigrationAction_dedupeResourcesWithSimilarCompactUTI_performActionWithManagedObjectContext_error___block_invoke_2;
  v47[3] = &unk_1E3670818;
  v47[4] = self;
  v47[5] = v54;
  v46[0] = v18;
  v46[1] = 3221225472;
  v46[2] = __107__PLModelMigrationAction_dedupeResourcesWithSimilarCompactUTI_performActionWithManagedObjectContext_error___block_invoke_3;
  v46[3] = &unk_1E365FFF0;
  v46[4] = self;
  v46[5] = &v56;
  v46[6] = &v62;
  v46[7] = &v50;
  v46[8] = v54;
  v20 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v14, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v16, v9, v19, v17, 0, 1, v48, v47, v46);

  v21 = (id *)(v57 + 5);
  obj = (id)v57[5];
  LODWORD(v17) = -[PLEnumerateAndSaveController processObjectsWithError:](v20, "processObjectsWithError:", &obj);
  objc_storeStrong(v21, obj);
  if ((_DWORD)v17)
  {
    -[PLModelMigrationActionBackground logger](self, "logger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      PLMigrationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (v24)
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
        v25 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        v26 = (void *)v51[3];
        v66 = 134217984;
        v67 = v26;
        LODWORD(v44) = 12;
        v27 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v66, v44);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActionBackground.m", 955, 0);

        if (v27 != &v70)
        {
          v29 = v27;
LABEL_12:
          free(v29);
        }
      }
    }
  }
  else
  {
    v63[3] = 3;
    -[PLModelMigrationActionBackground logger](self, "logger");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      PLMigrationGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

      if (v32)
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
        v33 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v57[5];
        v66 = 138543618;
        v67 = v35;
        v68 = 2114;
        v69 = v36;
        LODWORD(v44) = 22;
        v37 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v66, v44);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logWithMessage:fromCodeLocation:type:", v37, "PLModelMigrationActionBackground.m", 958, 16);

        if (v37 != &v70)
        {
          v29 = v37;
          goto LABEL_12;
        }
      }
    }
  }
  if (v63[3] == 1)
    -[PLModelMigrationActionBackground setResumeMarkerValue:](self, "setResumeMarkerValue:", 0);
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  v39 = v63[3];
  v40 = (id)v57[5];
  v41 = v40;
  if (v39 != 1 && a4)
    *a4 = objc_retainAutorelease(v40);

  v42 = v63[3];
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(v54, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  return v42;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end
