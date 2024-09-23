@implementation PLModelMigrationAction_RepairUnknownAssetTypeAndUnsupportedPlaybackStyle

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  int64_t v35;
  uint64_t v37;
  _QWORD v38[5];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  id obj;
  uint64_t v58;
  id *v59;
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
  id v71;
  __int16 v72;
  uint64_t v73;
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
  __int128 v104;
  __int128 v105;
  _QWORD v106[4];

  v106[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 1;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__21263;
  v62 = __Block_byref_object_dispose__21264;
  v63 = 0;
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K == %d"), CFSTR("kind"), 3, CFSTR("playbackStyle"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v106[0] = CFSTR("master");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", v9);

  objc_msgSend(v7, "setFetchBatchSize:", 100);
  v10 = v59 + 5;
  obj = v59[5];
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj);
  if (objc_msgSend(v11, "count"))
  {
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v11, "count"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __120__PLModelMigrationAction_RepairUnknownAssetTypeAndUnsupportedPlaybackStyle_performActionWithManagedObjectContext_error___block_invoke;
    v38[3] = &unk_1E3666348;
    v41 = &v45;
    v42 = &v49;
    v40 = &v53;
    v38[4] = self;
    v43 = &v58;
    v44 = &v64;
    v13 = v12;
    v39 = v13;
    objc_msgSend(v6, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v11, v38);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && !v59[5])
    {
      objc_storeStrong(v59 + 5, v14);
      v65[3] = 3;
    }
    if (v65[3] == 1)
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

        if (v17)
        {
          v104 = 0u;
          v105 = 0u;
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
          PLMigrationGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          v19 = (void *)v50[3];
          v20 = (void *)v54[3];
          v21 = v46[3];
          v68 = 134218496;
          v69 = v19;
          v70 = 2048;
          v71 = v20;
          v72 = 2048;
          v73 = v21;
          LODWORD(v37) = 32;
          v22 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v68, v37);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_16000.m", 664, 0);

          goto LABEL_14;
        }
      }
    }
    else
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        PLMigrationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

        if (v26)
        {
          v104 = 0u;
          v105 = 0u;
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
          PLMigrationGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v59[5];
          v68 = 138543618;
          v69 = v29;
          v70 = 2114;
          v71 = v30;
          LODWORD(v37) = 22;
          v22 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v68, v37);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_16000.m", 666, 16);

LABEL_14:
          if (v22 != &v74)
            free(v22);
        }
      }
    }

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);
    goto LABEL_17;
  }
  if (!v11)
    v65[3] = 3;
LABEL_17:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v32 = v65[3];
  v33 = v59[5];
  v34 = v33;
  if (v32 != 1 && a4)
    *a4 = objc_retainAutorelease(v33);

  v35 = v65[3];
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  return v35;
}

@end
