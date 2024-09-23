@implementation PLModelMigrationAction_RepairMaintenanceTaskMarker

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  __int128 *v19;
  void *v20;
  void *v21;
  __int128 *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  uint64_t v31;
  id v32;
  int v33;
  const __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
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
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D73158];
  -[PLModelMigrationActionCore pathManager](self, "pathManager", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryURL");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appPrivateDataForLibraryURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueForKey:", CFSTR("PLDeferredMaintenanceTask"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if ((v7 & 1) == 0)
  {
    v32 = 0;
    v10 = objc_msgSend(v8, "setValue:forKey:error:", 0, CFSTR("PLDeferredMaintenanceTask"), &v32);
    v11 = v32;
    -[PLModelMigrationActionCore logger](self, "logger");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v10)
    {
      if (v12)
      {
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

        if (v15)
        {
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
          PLMigrationGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543874;
          v34 = CFSTR("PLDeferredMaintenanceTask");
          v35 = 2114;
          v36 = v18;
          v37 = 2112;
          v38 = v11;
          LODWORD(v31) = 32;
          v19 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v33, v31);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          v22 = v19;
          v23 = 266;
          v24 = 0;
          goto LABEL_9;
        }
      }
    }
    else if (v12)
    {
      PLMigrationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (v26)
      {
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
        PLMigrationGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543874;
        v34 = CFSTR("PLDeferredMaintenanceTask");
        v35 = 2114;
        v36 = v29;
        v37 = 2112;
        v38 = v11;
        LODWORD(v31) = 32;
        v19 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v33, v31);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = v19;
        v23 = 268;
        v24 = 16;
LABEL_9:
        objc_msgSend(v20, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_16000.m", v23, v24);

        if (v19 != &v39)
          free(v19);
      }
    }

  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return 1;
}

@end
