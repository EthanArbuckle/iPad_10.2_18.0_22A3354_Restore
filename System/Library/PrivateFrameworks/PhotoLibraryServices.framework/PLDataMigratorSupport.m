@implementation PLDataMigratorSupport

- (PLDataMigratorSupport)initWithPathManager:(id)a3
{
  id v5;
  PLDataMigratorSupport *v6;
  PLDataMigratorSupport *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLDataMigratorSupport;
  v6 = -[PLDataMigratorSupport init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pathManager, a3);

  return v7;
}

- (void)recordDataMigrationInfo:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  char v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self->_pathManager, "photoDirectoryWithType:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v6 = objc_msgSend(MEMORY[0x1E0D73208], "createDirectoryAtPath:error:", v5, &v21);
  v7 = v21;
  if ((v6 & 1) == 0)
  {
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v5;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Unable to create directory: %{public}@, reason: %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v5, "stringByAppendingPathComponent:", *MEMORY[0x1E0D73DF0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 100, 0, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;

  if (v10)
  {
    v19 = v11;
    v12 = objc_msgSend(v10, "writeToFile:options:error:", v9, 1073741825, &v19);
    v13 = v19;

    if ((v12 & 1) != 0)
      goto LABEL_13;
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v23 = v4;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Unable to write info dictionary: %{public}@ to %{public}@, reason: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v4;
      v24 = 2114;
      v25 = v11;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Unable to create data from info dictionary: %{public}@, reason: %{public}@", buf, 0x16u);
    }
    v13 = v11;
  }

LABEL_13:
  v18 = v13;
  v15 = objc_msgSend(MEMORY[0x1E0D73208], "changeFileOwnerToMobileAtPath:error:", v9, &v18);
  v16 = v18;

  if ((v15 & 1) == 0)
  {
    PLMigrationGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v9;
      v24 = 2114;
      v25 = v16;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unable to change owner of file at path: %{public}@, reason: %{public}@", buf, 0x16u);
    }

  }
}

- (void)removeModelInterestDatabase
{
  id v2;

  -[PLPhotoLibraryPathManager legacyModelInterestDatabasePath](self->_pathManager, "legacyModelInterestDatabasePath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73208], "removeDisconnectedSQLiteDatabaseFileWithPath:error:", v2, 0);

}

- (void)removeInternalMemoriesRelatedSnapshotDirectory
{
  void *v2;
  void *v3;
  void *v4;
  int v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  char v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibraryPathManager legacyMemoriesRelatedSnapshotDirectory](self->_pathManager, "legacyMemoriesRelatedSnapshotDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v12 = 0;
  if (v2)
  {
    if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v12) && v12 != 0)
    {
      v11 = 0;
      v6 = objc_msgSend(v4, "removeItemAtPath:error:", v2, &v11);
      v7 = v11;
      v8 = v7;
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 0;
      if (!v9)
      {
        PLMigrationGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v14 = v2;
          v15 = 2112;
          v16 = v8;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to clean up %@ [%@]", buf, 0x16u);
        }

      }
    }
  }

}

- (void)removeAsidePhotosDatabase
{
  id v2;

  -[PLPhotoLibraryPathManager photosAsideDatabasePath](self->_pathManager, "photosAsideDatabasePath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73208], "removeDisconnectedSQLiteDatabaseFileWithPath:error:", v2, 0);

}

- (void)removeLegacyMetadataFiles
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibraryPathManager privateDirectoryWithSubType:createIfNeeded:error:](self->_pathManager, "privateDirectoryWithSubType:createIfNeeded:error:", 5, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("NVP_HIDDENFACES.hiddenfacemetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    v8 = 0;
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v8);
    v6 = v8;
    if ((v5 & 1) == 0)
    {
      PLMigrationGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v10 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to remove hidden faces metadata file with error: %{public}@", buf, 0xCu);
      }

    }
  }

}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
}

@end
