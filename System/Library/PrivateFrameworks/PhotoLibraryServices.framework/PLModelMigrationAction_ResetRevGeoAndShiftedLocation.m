@implementation PLModelMigrationAction_ResetRevGeoAndShiftedLocation

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  __int128 *v18;
  void *v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  __int128 *v28;
  void *v29;
  uint64_t v31;
  id v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
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
  _QWORD v69[2];
  _QWORD v70[3];

  v70[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("shiftedLocationData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = CFSTR("reverseLocationDataIsValid");
  v69[1] = CFSTR("shiftedLocationIsValid");
  v70[0] = MEMORY[0x1E0C9AAA0];
  v70[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v11 = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v10, v8, v9, v7, &v32);

  v12 = v32;
  if (v11)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
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
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        PLMigrationGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        LOWORD(v33) = 0;
        LODWORD(v31) = 2;
        v18 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v33, v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActions_16000.m", 1105, 0);

        if (v18 != &v37)
          free(v18);
      }
    }
    v20 = 1;
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    -[PLModelMigrationActionCore logger](self, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      PLMigrationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
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
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        PLMigrationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v27;
        v35 = 2114;
        v36 = v12;
        LODWORD(v31) = 22;
        v28 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v33, v31);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_16000.m", 1109, 16);

        if (v28 != &v37)
          free(v28);
      }
    }
    v20 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return v20;
}

@end
