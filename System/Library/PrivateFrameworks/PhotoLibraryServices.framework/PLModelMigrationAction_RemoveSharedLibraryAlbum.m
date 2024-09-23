@implementation PLModelMigrationAction_RemoveSharedLibraryAlbum

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  __int128 *v17;
  void *v18;
  int64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  __int128 *v27;
  void *v28;
  uint64_t v30;
  id v31;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  __int128 v36;
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
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("kind"), &unk_1E375EFD0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLFetchingAlbum entityName](PLFetchingAlbum, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v10 = +[PLModelMigrator executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:](PLModelMigrator, "executeBatchDeleteWithEntityName:predicate:managedObjectContext:error:", v9, v8, v7, &v31);

  v11 = v31;
  if (v10)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      PLMigrationGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (v15)
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        LOWORD(v32) = 0;
        LODWORD(v30) = 2;
        v17 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v32, v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logWithMessage:fromCodeLocation:type:", v17, "PLModelMigrationActions_17000.m", 71, 0);

        if (v17 != &v36)
          free(v17);
      }
    }
    v19 = 1;
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    -[PLModelMigrationActionCore logger](self, "logger");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        PLMigrationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v26;
        v34 = 2114;
        v35 = v11;
        LODWORD(v30) = 22;
        v27 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v32, v30);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_17000.m", 75, 16);

        if (v27 != &v36)
          free(v27);
      }
    }
    v19 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return v19;
}

@end
