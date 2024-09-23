@implementation PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute

- (id)buildFetchRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kind"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("extendedAttributes.fps"), 45);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v9);

  objc_msgSend(v4, "setFetchBatchSize:", 100);
  return v4;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  PLEnumerateAndSaveController *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  PLEnumerateAndSaveController *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  __int128 *v21;
  void *v22;
  int64_t v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  __int128 *v30;
  void *v31;
  id v32;
  void *v33;
  char v34;
  uint64_t v36;
  id v38;
  _QWORD v39[5];
  _QWORD v40[6];
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  int v49;
  uint64_t v50;
  __int16 v51;
  id v52;
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
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute buildFetchRequest](self, "buildFetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__38433;
  v47 = __Block_byref_object_dispose__38434;
  v48 = 0;
  v7 = [PLEnumerateAndSaveController alloc];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke;
  v41[3] = &unk_1E36700D0;
  v12 = v5;
  v42 = v12;
  v40[1] = 3221225472;
  v40[2] = __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke_2;
  v40[3] = &unk_1E3670818;
  v40[4] = self;
  v40[5] = &v43;
  v39[0] = v11;
  v39[1] = 3221225472;
  v39[2] = __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke_3;
  v39[3] = &unk_1E3669450;
  v39[4] = &v43;
  v40[0] = v11;
  v13 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v7, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v9, v6, v12, v10, 0, 1, v41, v40, v39);

  v38 = 0;
  v14 = -[PLEnumerateAndSaveController processObjectsWithError:](v13, "processObjectsWithError:", &v38);
  v15 = v38;
  if (v14)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      PLMigrationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

      if (v18)
      {
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
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        PLMigrationGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
        v20 = objc_msgSend((id)v44[5], "completedUnitCount");
        v49 = 134217984;
        v50 = v20;
        LODWORD(v36) = 12;
        v21 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v49, v36);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_18000.m", 580, 1);

        if (v21 != &v53)
          free(v21);
      }
    }
    v23 = 1;
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
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        PLMigrationGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 138543618;
        v50 = (uint64_t)v29;
        v51 = 2112;
        v52 = v15;
        LODWORD(v36) = 22;
        v30 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v49, v36);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActions_18000.m", 583, 16);

        if (v30 != &v53)
          free(v30);
      }
    }
    v23 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v32 = v15;
  v33 = v32;
  if (a4)
    v34 = v14;
  else
    v34 = 1;
  if ((v34 & 1) == 0)
    *a4 = objc_retainAutorelease(v32);

  _Block_object_dispose(&v43, 8);
  return v23;
}

@end
