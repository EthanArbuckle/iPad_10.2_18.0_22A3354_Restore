@implementation MTLibraryMigrationUtil

+ (BOOL)isNewInstall
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[MTDB libraryPath](MTDB, "libraryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5 ^ 1;
}

+ (void)setLibraryImageStoreType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "_applePodcastsFoundationSharedUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("MTImageCacheFormatIdentifier"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", 0, CFSTR("MTHeicImageMigrationHasOccurred"));

}

+ (BOOL)needsImageStoreMigration
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[MTImageStoreConstants deprecatedImageStoreURL](MTImageStoreConstants, "deprecatedImageStoreURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  +[MTLibraryMigrationUtil libraryImageStoreType](MTLibraryMigrationUtil, "libraryImageStoreType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTImageStoreConstants fileType](MTImageStoreConstants, "fileType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);
  _MTLogCategoryDatabase();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109634;
    v11[1] = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1A904E000, v9, OS_LOG_TYPE_DEFAULT, "Needs image store migration: oldDirectoryExists:%d currentType: %@ targetType: %@", (uint8_t *)v11, 0x1Cu);
  }

  return v5 | v8 ^ 1;
}

+ (id)libraryImageStoreType
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("MTImageCacheFormatIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "BOOLForKey:", CFSTR("MTHeicImageMigrationHasOccurred"));

    v4 = (id)*MEMORY[0x1E0CEC530];
  }
  v6 = v4;

  return v6;
}

+ (BOOL)needsDataMigration
{
  int64_t v2;

  v2 = +[MTDB libraryDataVersion](MTDB, "libraryDataVersion");
  if (v2)
    LOBYTE(v2) = +[MTDB libraryDataVersion](MTDB, "libraryDataVersion") < 70;
  return v2;
}

+ (BOOL)needsCoreDataMigration
{
  return +[MTDB coreDataVersion](MTDB, "coreDataVersion") != 141;
}

+ (BOOL)isMomCompatible:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(a1, "isNewInstall") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "createPersistentStoreForModel:attemptMigration:", v4, 0);

  return v5;
}

+ (BOOL)createPersistentStoreForModel:(id)a3 attemptMigration:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  int64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C97C00];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithManagedObjectModel:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("WAL"), CFSTR("journal_mode"), 0);
  v9 = objc_alloc(MEMORY[0x1E0C99D80]);
  v10 = *MEMORY[0x1E0C979E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C978D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v8, v10, v11, v12, v13, *MEMORY[0x1E0C97868], *MEMORY[0x1E0CB2AE0], *MEMORY[0x1E0C97940], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97900], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97978], 0);

  if (v4)
  {
    _MTLogCategoryDatabase();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v28 = +[MTDB coreDataVersion](MTDB, "coreDataVersion");
      v29 = 2048;
      v30 = 141;
      _os_log_impl(&dword_1A904E000, v15, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) Migrating. Current CoreData version is %ld. New version will be %ld", buf, 0x16u);
    }

  }
  _MTLogCategoryDatabase();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v4;
    _os_log_impl(&dword_1A904E000, v16, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) Will add new persistent store, attemptUpgrade: %d", buf, 8u);
  }

  v17 = *MEMORY[0x1E0C979E8];
  +[MTDB libraryPath](MTDB, "libraryPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v7, "addPersistentStoreWithType:configuration:URL:options:error:", v17, 0, v18, v14, &v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v26;

  _MTLogCategoryDatabase();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A904E000, v22, OS_LOG_TYPE_DEFAULT, "[Migration] (CoreData) added persistent store.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    +[MTDB libraryPath](MTDB, "libraryPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = (int64_t)v23;
    v29 = 2112;
    v30 = (uint64_t)v24;
    _os_log_impl(&dword_1A904E000, v22, OS_LOG_TYPE_ERROR, "[Migration] (CoreData) Could not create persistend store for library (%@) %@", buf, 0x16u);

  }
  return v19 != 0;
}

@end
