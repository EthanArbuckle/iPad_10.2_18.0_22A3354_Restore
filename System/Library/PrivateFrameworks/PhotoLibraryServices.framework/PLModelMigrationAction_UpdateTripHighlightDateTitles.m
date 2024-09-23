@implementation PLModelMigrationAction_UpdateTripHighlightDateTitles

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PLDateRangeTitleGenerator *v11;
  PLEnumerateAndSaveController *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  PLDateRangeTitleGenerator *v18;
  PLEnumerateAndSaveController *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  uint64_t v26;
  __int128 *v27;
  void *v28;
  int64_t v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  __int128 *v36;
  void *v37;
  id v38;
  void *v39;
  char v40;
  uint64_t v42;
  id v44;
  _QWORD v45[4];
  PLDateRangeTitleGenerator *v46;
  uint64_t *v47;
  _QWORD v48[6];
  _QWORD v49[4];
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  int v57;
  uint64_t v58;
  __int16 v59;
  id v60;
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
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[5];

  v93[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLPhotosHighlight predicateForAllTripHighlights](PLPhotosHighlight, "predicateForAllTripHighlights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v93[0] = CFSTR("dayGroupAssets");
  v93[1] = CFSTR("dayGroupExtendedAssets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v10);

  v11 = objc_alloc_init(PLDateRangeTitleGenerator);
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__38433;
  v55 = __Block_byref_object_dispose__38434;
  v56 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke;
  v49[3] = &unk_1E36700D0;
  v17 = v5;
  v50 = v17;
  v48[0] = v16;
  v48[1] = 3221225472;
  v48[2] = __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke_2;
  v48[3] = &unk_1E3670818;
  v48[4] = self;
  v48[5] = &v51;
  v45[0] = v16;
  v45[1] = 3221225472;
  v45[2] = __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke_3;
  v45[3] = &unk_1E36695E0;
  v18 = v11;
  v46 = v18;
  v47 = &v51;
  v19 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v14, v8, v17, v15, 0, 0, v49, v48, v45);

  v44 = 0;
  v20 = -[PLEnumerateAndSaveController processObjectsWithError:](v19, "processObjectsWithError:", &v44);
  v21 = v44;
  if (v20)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      PLMigrationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);

      if (v24)
      {
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
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        PLMigrationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
        v26 = objc_msgSend((id)v52[5], "completedUnitCount");
        v57 = 134217984;
        v58 = v26;
        LODWORD(v42) = 12;
        v27 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v57, v42);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_18000.m", 1339, 1);

        if (v27 != &v61)
          free(v27);
      }
    }
    v29 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      PLMigrationGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

      if (v32)
      {
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
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        PLMigrationGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 138543618;
        v58 = (uint64_t)v35;
        v59 = 2112;
        v60 = v21;
        LODWORD(v42) = 22;
        v36 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v57, v42);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActions_18000.m", 1342, 16);

        if (v36 != &v61)
          free(v36);
      }
    }
    v29 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v38 = v21;
  v39 = v38;
  if (a4)
    v40 = v20;
  else
    v40 = 1;
  if ((v40 & 1) == 0)
    *a4 = objc_retainAutorelease(v38);

  _Block_object_dispose(&v51, 8);
  return v29;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end
