@implementation PLModelMigrationAction_setInitialIsDetectedScreenshotValue

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PLEnumerateAndSaveController *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  PLEnumerateAndSaveController *v19;
  id *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  __int128 *v26;
  void *v27;
  __int128 *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  uint64_t v35;
  __int128 *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  int64_t v41;
  uint64_t v43;
  id obj;
  _QWORD v45[9];
  _QWORD v46[6];
  _QWORD v47[4];
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[5];
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  void *v66;
  __int16 v67;
  uint64_t v68;
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
  __int128 v100;
  _QWORD v101[4];

  v101[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 1;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__1109;
  v59 = __Block_byref_object_dispose__1110;
  v60 = 0;
  -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v11);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v12);

  }
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__1109;
  v53[4] = __Block_byref_object_dispose__1110;
  v54 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v13 = [PLEnumerateAndSaveController alloc];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionBackground pathManager](self, "pathManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke;
  v47[3] = &unk_1E36700D0;
  v18 = v6;
  v48 = v18;
  v46[0] = v17;
  v46[1] = 3221225472;
  v46[2] = __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke_2;
  v46[3] = &unk_1E3670818;
  v46[4] = self;
  v46[5] = v53;
  v45[0] = v17;
  v45[1] = 3221225472;
  v45[2] = __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke_3;
  v45[3] = &unk_1E366ADB8;
  v45[4] = self;
  v45[5] = &v55;
  v45[6] = &v61;
  v45[7] = &v49;
  v45[8] = v53;
  v19 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v13, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v15, v9, v18, v16, 0, 1, v47, v46, v45);

  v20 = (id *)(v56 + 5);
  obj = (id)v56[5];
  LODWORD(v16) = -[PLEnumerateAndSaveController processObjectsWithError:](v19, "processObjectsWithError:", &obj);
  objc_storeStrong(v20, obj);
  if ((_DWORD)v16)
  {
    -[PLModelMigrationActionBackground logger](self, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

      if (v23)
      {
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
        v69 = 0u;
        v70 = 0u;
        PLMigrationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        v25 = (void *)v50[3];
        v65 = 134217984;
        v66 = v25;
        LODWORD(v43) = 12;
        v26 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v65, v43);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActionBackground.m", 862, 0);

        if (v26 != &v69)
        {
          v28 = v26;
LABEL_12:
          free(v28);
        }
      }
    }
  }
  else
  {
    v62[3] = 3;
    -[PLModelMigrationActionBackground logger](self, "logger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      PLMigrationGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

      if (v31)
      {
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
        v69 = 0u;
        v70 = 0u;
        PLMigrationGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v56[5];
        v65 = 138543618;
        v66 = v34;
        v67 = 2114;
        v68 = v35;
        LODWORD(v43) = 22;
        v36 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v65, v43);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActionBackground.m", 865, 16);

        if (v36 != &v69)
        {
          v28 = v36;
          goto LABEL_12;
        }
      }
    }
  }
  if (v62[3] == 1)
    -[PLModelMigrationActionBackground setResumeMarkerValue:](self, "setResumeMarkerValue:", 0);
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
  v38 = v62[3];
  v39 = (id)v56[5];
  v40 = v39;
  if (v38 != 1 && a4)
    *a4 = objc_retainAutorelease(v39);

  v41 = v62[3];
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  return v41;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end
