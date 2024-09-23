@implementation PLModelMigrationAction_ResetRecentHighlightTitleUpdateDate

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  _OWORD *v12;
  void *v13;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  _OWORD v20[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[PLPhotosHighlightGenerator lastHighlightTitlesUpdateDay](PLPhotosHighlightGenerator, "lastHighlightTitlesUpdateDay", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotosHighlightGenerator setLastHighlightTitlesUpdateDay:](PLPhotosHighlightGenerator, "setLastHighlightTitlesUpdateDay:", v6);
  -[PLModelMigrationActionCore logger](self, "logger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      memset(v20, 0, sizeof(v20));
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      v16 = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      LODWORD(v15) = 22;
      v12 = (_OWORD *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v16, v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logWithMessage:fromCodeLocation:type:", v12, "PLModelMigrationActions_16000.m", 1192, 0);

      if (v12 != v20)
        free(v12);
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return 1;
}

@end
