@implementation PLPhotoLibraryPathManager(SQLError)

- (uint64_t)sqliteErrorIndicatorFileExists
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "sqliteErrorIndicatorFilePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", v1);

  return v3;
}

- (id)_rebuildDateFormatter
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v0, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSZZZZZ"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLocale:", v1);

  return v0;
}

- (uint64_t)_createSqliteErrorIndicatorFileWithRebuildReason:()SQLError
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  NSObject *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sqliteErrorIndicatorFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_retainAutorelease(v5);
    v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 2689, 438);
    if ((v8 & 0x80000000) == 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v8, 1);
      objc_msgSend(a1, "_rebuildDateFormatter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringFromDate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 200, 0, &v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v27;
      if (!v15)
      {
        PLBackendGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v14;
          v30 = 2112;
          v31 = v16;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to archive %@: %@", buf, 0x16u);
        }
        v17 = 0;
        goto LABEL_15;
      }
      v26 = 0;
      v17 = objc_msgSend(v9, "writeData:error:", v15, &v26);
      v18 = v26;
      PLBackendGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if ((_DWORD)v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v14;
          v30 = 2112;
          v31 = v7;
          v21 = "Written %@ to %@";
          v22 = v20;
          v23 = OS_LOG_TYPE_DEFAULT;
          v24 = 22;
LABEL_13:
          _os_log_impl(&dword_199541000, v22, v23, v21, buf, v24);
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v14;
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v18;
        v21 = "Failed to write %@ to %@: %@";
        v22 = v20;
        v23 = OS_LOG_TYPE_ERROR;
        v24 = 32;
        goto LABEL_13;
      }

LABEL_15:
      goto LABEL_16;
    }
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (void)removeSqliteErrorIndicatorFile
{
  void *v1;
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sqliteErrorIndicatorFilePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v3 = objc_msgSend(v2, "removeItemAtPath:error:", v1, &v12);
  v4 = v12;

  if (v3)
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v1;
      v6 = "Removed sqliteErrorIndicatorFile %@";
LABEL_8:
      v9 = v5;
      v10 = OS_LOG_TYPE_INFO;
      v11 = 12;
LABEL_11:
      _os_log_impl(&dword_199541000, v9, v10, v6, buf, v11);
    }
  }
  else if (objc_msgSend(v4, "code") == 4
         && (objc_msgSend(v4, "domain"),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
             v7,
             v8))
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v1;
      v6 = "sqliteErrorIndicatorFile does not exist at %@";
      goto LABEL_8;
    }
  }
  else
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v1;
      v15 = 2112;
      v16 = v4;
      v6 = "Failed to remove sqliteErrorIndicatorFile %@, %@";
      v9 = v5;
      v10 = OS_LOG_TYPE_ERROR;
      v11 = 22;
      goto LABEL_11;
    }
  }

}

- (void)_abortWithRebuildReasonPLRebuildReasonSimulatedCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonStagedDemoContentInstallation
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonLightweightMigration
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonUnknown
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonExcessiveRecoveryAttempts
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonTooManyOrphanedRecords
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonUUIDCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonPathCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonDatabaseCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonTooManyThumbnailRebuilds
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonUpgradeForceRebuild
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonMPSPathCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonSharedAlbumPathCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonMPSUUIDCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonSharedAlbumUUIDCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonExcessivePersistentHistorySize
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonBackgroundMigration
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonPersonUUIDCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonExcessiveOrphanedSceneClassifications
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)_abortWithRebuildReasonPLRebuildReasonUnknownAssetColumnTriggerCorruption
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
  __break(1u);
}

- (void)setSqliteErrorForRebuildReason:()SQLError allowsExit:
{
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "_createSqliteErrorIndicatorFileWithRebuildReason:"))
  {
    switch((unint64_t)a3)
    {
      case 0uLL:
      case 1uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
        PLBackendGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_6;
        *(_DWORD *)buf = 134217984;
        v29 = a3;
        v8 = "Handling corrupt database due to rebuild reason %ld... killing all photos clients";
        v9 = v7;
        v10 = 12;
        goto LABEL_5;
      case 2uLL:
        PLBackendGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v8 = "Forcing all photos clients to exit to simulate a corrupt database...";
          v9 = v7;
          v10 = 2;
LABEL_5:
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        }
LABEL_6:
        v11 = 1;
        goto LABEL_28;
      case 3uLL:
        PLBackendGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_WORD *)buf = 0;
        v14 = "Forcing all photos clients to exit to install staged demo content...";
        goto LABEL_25;
      case 4uLL:
        PLBackendGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        *(_WORD *)buf = 0;
        v14 = "Creating sqlite error file before lightweight migration";
        goto LABEL_20;
      case 0x10uLL:
        PLBackendGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        *(_WORD *)buf = 0;
        v14 = "Creating sqlite error file for excessive persistent history size";
LABEL_20:
        v15 = v7;
        v16 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_26;
      case 0x11uLL:
        PLBackendGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_WORD *)buf = 0;
        v14 = "User requested force rebuild from Settings";
        goto LABEL_25;
      case 0x12uLL:
        PLBackendGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_WORD *)buf = 0;
        v14 = "Creating sqlite error file for background Migration failure";
LABEL_25:
        v15 = v7;
        v16 = OS_LOG_TYPE_ERROR;
LABEL_26:
        _os_log_impl(&dword_199541000, v15, v16, v14, buf, 2u);
LABEL_27:
        v11 = 0;
LABEL_28:

        if (a4)
        {
LABEL_29:
          v17 = (void *)objc_opt_class();
          objc_msgSend(a1, "libraryURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v17) = objc_msgSend(v17, "isSystemPhotoLibraryURL:", v18);

          if ((_DWORD)v17)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            v20 = &PLPhotoLibraryCorruptNotification;
            if (!v11)
              v20 = &PLPhotoLibraryForceClientExitNotification;
            CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*v20, 0, 0, 0);
          }
          if ((PLIsAssetsd() & 1) == 0)
          {
            objc_msgSend(a1, "libraryURL");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:](PLPhotoLibraryBundleController, "sharedAssetsdClientForPhotoLibraryURL:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "libraryClient");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 0;
            v24 = objc_msgSend(v23, "validateOrRebuildPhotoLibraryDatabaseWithError:", &v27);
            v25 = v27;

            if ((v24 & 1) == 0)
            {
              PLBackendGetLog();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v25;
                _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Error asking assetsd to rebuild photo library: %@", buf, 0xCu);
              }

            }
          }
          if (v11)
          {
            switch((unint64_t)a3)
            {
              case 0uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonUnknown");
                break;
              case 1uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonCorruption");
                break;
              case 2uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonSimulatedCorruption");
                break;
              case 3uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonStagedDemoContentInstallation");
                break;
              case 4uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonLightweightMigration");
                break;
              case 5uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonTooManyOrphanedRecords");
                break;
              case 6uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonUUIDCorruption");
                break;
              case 7uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonPathCorruption");
                break;
              case 8uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonDatabaseCorruption");
                break;
              case 9uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonTooManyThumbnailRebuilds");
                break;
              case 0xAuLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonUpgradeForceRebuild");
                break;
              case 0xBuLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonExcessiveRecoveryAttempts");
                break;
              case 0xCuLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonMPSPathCorruption");
                break;
              case 0xDuLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonSharedAlbumPathCorruption");
                break;
              case 0xEuLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonMPSUUIDCorruption");
                break;
              case 0xFuLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonSharedAlbumUUIDCorruption");
                break;
              case 0x10uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonExcessivePersistentHistorySize");
                break;
              case 0x12uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonBackgroundMigration");
                break;
              case 0x13uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonPersonUUIDCorruption");
                break;
              case 0x14uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonExcessiveOrphanedSceneClassifications");
                break;
              case 0x15uLL:
                objc_msgSend(a1, "_abortWithRebuildReasonPLRebuildReasonUnknownAssetColumnTriggerCorruption");
                break;
              default:
                return;
            }
          }
          else if (a3 != (void *)17)
          {
            if (a3 != (void *)3)
              exit(1);
            PLAbortWithReason();
          }
        }
        break;
      default:
        v11 = 0;
        if (!a4)
          return;
        goto LABEL_29;
    }
  }
  else
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "sqliteErrorIndicatorFilePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to create sqlite error file %@.", buf, 0xCu);

    }
  }
}

- (uint64_t)lastRebuildReason
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "sqliteErrorIndicatorFileExists"))
    return 0;
  objc_msgSend(a1, "sqliteErrorIndicatorFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject lastObject](v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to deserialize sqliteerror. Error: %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (id)recordRebuildReason
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  PLMigrationGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Recording rebuild reason", buf, 2u);
  }

  objc_msgSend(a1, "sqliteErrorIndicatorFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, &v30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v30;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(v23, "attributesOfItemAtPath:error:", v3, &v29);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v29;

      if (!v24)
      {
        PLMigrationGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v3;
          v33 = 2112;
          v34 = v9;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unable to get attributes for %@: %@", buf, 0x16u);
        }
        v7 = 0;
        goto LABEL_15;
      }
      objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A38]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(a1, "_rebuildDateFormatter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringFromDate:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = v27;
        v36[0] = &unk_1E3760098;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

      if (!v7)
        goto LABEL_16;
    }
    PLRecordRebuildHistory(v7);
    objc_msgSend(a1, "rebuildHistoryFilePath");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:", v9);

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = v13;
    }
    -[NSObject addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v7);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v15 = -[NSObject writeToURL:error:](v10, "writeToURL:error:", v14, &v28);
    v16 = v28;

    PLMigrationGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v7;
        v33 = 2112;
        v34 = v9;
        v19 = "Added last rebuild %@ to rebuild history file %@";
        v20 = v18;
        v21 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
        _os_log_impl(&dword_199541000, v20, v21, v19, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v9;
      v33 = 2112;
      v34 = v16;
      v19 = "Failed to update rebuild history file %@: %@";
      v20 = v18;
      v21 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }

LABEL_15:
LABEL_16:

    goto LABEL_17;
  }
  v7 = 0;
LABEL_17:

  return v7;
}

@end
