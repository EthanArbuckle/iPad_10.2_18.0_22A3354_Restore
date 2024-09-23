@implementation PLModelMigrationAction_CPLSettings

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  _OWORD *v16;
  void *v17;
  uint64_t v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  _OWORD v25[32];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PLModelMigrationActionCore pathManager](self, "pathManager", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCPLSettings settingsWithPathManager:](PLCPLSettings, "settingsWithPathManager:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v7 = objc_msgSend(v6, "migrateSettings:", &v20);
  v8 = v20;
  if ((v7 & 1) == 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (v12)
      {
        memset(v25, 0, sizeof(v25));
        PLMigrationGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v15;
        v23 = 2112;
        v24 = v8;
        LODWORD(v19) = 22;
        v16 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v21, v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logWithMessage:fromCodeLocation:type:", v16, "PLModelMigrationActions_18000.m", 208, 16);

        if (v16 != v25)
          free(v16);
      }
    }
  }

  return 1;
}

@end
