@implementation WBSWebExtensionSQLiteStoreMigrator

- (WBSWebExtensionSQLiteStoreMigrator)initWithUserDefaults:(id)a3 safariContainerSettingsDirectoryURL:(id)a4
{
  id v7;
  id v8;
  WBSWebExtensionSQLiteStoreMigrator *v9;
  WBSWebExtensionSQLiteStoreMigrator *v10;
  WBSWebExtensionSQLiteStoreMigrator *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSWebExtensionSQLiteStoreMigrator;
  v9 = -[WBSWebExtensionSQLiteStoreMigrator init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v10->_safariContainerSettingsDirectoryURL, a4);
    v11 = v10;
  }

  return v10;
}

- (void)migrateSQLiteStorageToWebKitIfNecessary
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  __int16 v7;

  if (-[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("DidMigrateWebExtensionSQLiteStorageToWebKit")))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      return;
    v7 = 0;
    v4 = "Web Extension Storage Migration: Skipping web extension storage migration because it's already been done";
    v5 = (uint8_t *)&v7;
    goto LABEL_7;
  }
  if (!-[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", CFSTR("WebExtensionSQLiteStorageMigrationInProgress")))
  {
    -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 1, CFSTR("WebExtensionSQLiteStorageMigrationInProgress"));
    -[WBSWebExtensionSQLiteStoreMigrator _migrateAllSafariSQLiteStoresToWebKit](self, "_migrateAllSafariSQLiteStoresToWebKit");
    -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", 1, CFSTR("DidMigrateWebExtensionSQLiteStorageToWebKit"));
    -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", CFSTR("WebExtensionSQLiteStorageMigrationInProgress"));
    return;
  }
  v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 0;
    v4 = "Web Extension Storage Migration: Skipping web extension storage migration because it's in progress";
    v5 = (uint8_t *)&v6;
LABEL_7:
    _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
  }
}

- (void)_migrateAllSafariSQLiteStoresToWebKit
{
  -[WBSWebExtensionSQLiteStoreMigrator _initialize](self, "_initialize");
  -[WBSWebExtensionSQLiteStoreMigrator _migrateExtensionSQLiteStoresForDefaultProfile](self, "_migrateExtensionSQLiteStoresForDefaultProfile");
  -[WBSWebExtensionSQLiteStoreMigrator _migrateExtensionSQLiteStoresForNamedProfiles](self, "_migrateExtensionSQLiteStoresForNamedProfiles");
  -[WBSWebExtensionSQLiteStoreMigrator _deleteLegacySafariWebExtensionDataForDefaultProfile](self, "_deleteLegacySafariWebExtensionDataForDefaultProfile");
  -[WBSWebExtensionSQLiteStoreMigrator _deleteLegacySafariWebExtensionDataForNamedProfiles](self, "_deleteLegacySafariWebExtensionDataForNamedProfiles");
}

- (void)_initialize
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *storeFileNameMappings;
  void *v8;
  NSURL *v9;
  NSURL *safariWebExtensionSettingsDirectoryURLForDefaultProfile;
  NSURL *v11;
  NSURL *safariProfilesDirectoryURL;
  void *v13;
  void *v14;
  NSURL *v15;
  NSURL *webKitWebExtensionSettingsDirectoryURLForDefaultProfile;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A160]), "initWithFirst:second:", CFSTR("local.db"), CFSTR("LocalStorage.db"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A160]), "initWithFirst:second:", CFSTR("sync.db"), CFSTR("SyncStorage.db"), v3);
  v17[1] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A160]), "initWithFirst:second:", CFSTR("dnr-dynamic-rules.db"), CFSTR("DeclarativeNetRequestRules.db"));
  v17[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  storeFileNameMappings = self->_storeFileNameMappings;
  self->_storeFileNameMappings = v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_webExtensionsSettingsDirectoryURL");
  v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
  safariWebExtensionSettingsDirectoryURLForDefaultProfile = self->_safariWebExtensionSettingsDirectoryURLForDefaultProfile;
  self->_safariWebExtensionSettingsDirectoryURLForDefaultProfile = v9;

  objc_msgSend(v8, "safari_profilesDirectoryURL");
  v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
  safariProfilesDirectoryURL = self->_safariProfilesDirectoryURL;
  self->_safariProfilesDirectoryURL = v11;

  -[NSURL URLByDeletingLastPathComponent](self->_safariContainerSettingsDirectoryURL, "URLByDeletingLastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", CFSTR("WebKit/WebExtensions"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_webKitProfilesDirectoryURL, v14);
  objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("Default"), 1);
  v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  webKitWebExtensionSettingsDirectoryURLForDefaultProfile = self->_webKitWebExtensionSettingsDirectoryURLForDefaultProfile;
  self->_webKitWebExtensionSettingsDirectoryURLForDefaultProfile = v15;

}

- (void)_migrateExtensionSQLiteStoresForDefaultProfile
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Migrating web extension store files for default profile", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_topLevelDirectoriesAtURL:", self->_safariWebExtensionSettingsDirectoryURLForDefaultProfile);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "lastPathComponent", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL URLByAppendingPathComponent:isDirectory:](self->_webKitWebExtensionSettingsDirectoryURLForDefaultProfile, "URLByAppendingPathComponent:isDirectory:", v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[WBSWebExtensionSQLiteStoreMigrator _anyWebKitSQLiteStoresExistInFolder:](self, "_anyWebKitSQLiteStoresExistInFolder:", v12))-[WBSWebExtensionSQLiteStoreMigrator _copySQLiteStoresFromSafariExtensionFolder:toWebKitExtensionFolder:](self, "_copySQLiteStoresFromSafariExtensionFolder:toWebKitExtensionFolder:", v10, v12);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

}

- (void)_migrateExtensionSQLiteStoresForNamedProfiles
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Migrating web extension store files for all profiles", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_topLevelDirectoriesAtURL:", self->_safariProfilesDirectoryURL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[WBSWebExtensionSQLiteStoreMigrator _migrateExtensionSQLiteStoresForNamedProfileFolderURL:](self, "_migrateExtensionSQLiteStoresForNamedProfileFolderURL:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)_deleteLegacySafariWebExtensionDataForDefaultProfile
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Deleting legacy web extension data for default profile", v6, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_topLevelDirectoriesAtURL:", self->_safariWebExtensionSettingsDirectoryURLForDefaultProfile);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSWebExtensionSQLiteStoreMigrator _removeDirectories:](self, "_removeDirectories:", v5);
}

- (void)_deleteLegacySafariWebExtensionDataForNamedProfiles
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Deleting legacy web extension data for all profiles", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_topLevelDirectoriesAtURL:", self->_safariProfilesDirectoryURL);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "URLByAppendingPathComponent:", CFSTR("WebExtensions"), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "safari_topLevelDirectoriesAtURL:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSWebExtensionSQLiteStoreMigrator _removeDirectories:](self, "_removeDirectories:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

}

- (BOOL)_anyWebKitSQLiteStoresExistInFolder:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_storeFileNameMappings;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "second", (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v9, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", 0))
          {
            v11 = WBS_LOG_CHANNEL_PREFIXExtensions();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              -[WBSWebExtensionSQLiteStoreMigrator _anyWebKitSQLiteStoresExistInFolder:].cold.1((uint64_t)v10, v11);

            LOBYTE(v6) = 1;
            goto LABEL_15;
          }

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_migrateExtensionSQLiteStoresForNamedProfileFolderURL:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  objc_msgSend(v16, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Migrating web extension store files for profile %{public}@", buf, 0xCu);
  }
  objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("WebExtensions"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_topLevelDirectoriesAtURL:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL URLByAppendingPathComponent:isDirectory:](self->_webKitProfilesDirectoryURL, "URLByAppendingPathComponent:isDirectory:", v4, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v13, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[WBSWebExtensionSQLiteStoreMigrator _anyWebKitSQLiteStoresExistInFolder:](self, "_anyWebKitSQLiteStoresExistInFolder:", v15))-[WBSWebExtensionSQLiteStoreMigrator _copySQLiteStoresFromSafariExtensionFolder:toWebKitExtensionFolder:](self, "_copySQLiteStoresFromSafariExtensionFolder:toWebKitExtensionFolder:", v12, v15);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

- (void)_copySQLiteStoresFromSafariExtensionFolder:(id)a3 toWebKitExtensionFolder:(id)a4
{
  id v6;
  void *v7;
  WBSWebExtensionSQLiteStoreMigrator *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  __int128 v23;
  NSArray *obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = self;
  obj = self->_storeFileNameMappings;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v27;
    *(_QWORD *)&v10 = 138739971;
    v23 = v10;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "first", v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "URLByAppendingPathComponent:isDirectory:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v7, "fileExistsAtPath:", v16);

        if ((v17 & 1) != 0)
        {
          objc_msgSend(v13, "second");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v18, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!-[WBSWebExtensionSQLiteStoreMigrator _copySafariSQLiteStoreAndAssociatedFiles:toWebKitSQLiteStore:webKitWebExtensionFolder:](v8, "_copySafariSQLiteStoreAndAssociatedFiles:toWebKitSQLiteStore:webKitWebExtensionFolder:", v15, v19, v6))
          {
            v21 = WBS_LOG_CHANNEL_PREFIXExtensions();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[WBSWebExtensionSQLiteStoreMigrator _copySQLiteStoresFromSafariExtensionFolder:toWebKitExtensionFolder:].cold.1((uint64_t)v15, v21, v22);
            objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);

            goto LABEL_17;
          }

        }
        else
        {
          v20 = WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v31 = v15;
            _os_log_debug_impl(&dword_1A840B000, v20, OS_LOG_TYPE_DEBUG, "Not migrating web extension store file from '%{sensitive}@' because file doesn't exist", buf, 0xCu);
          }
        }

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_17:

}

- (BOOL)_copySafariSQLiteStoreAndAssociatedFiles:(id)a3 toWebKitSQLiteStore:(id)a4 webKitWebExtensionFolder:(id)a5
{
  void *v7;
  uint64_t v8;
  __int128 v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  _BOOL4 v25;
  char v26;
  id v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  __int128 v35;
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v37 = a4;
  v36 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = objc_msgSend(&unk_1E547C3A8, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v8)
  {
    v10 = 0;
    v11 = *(_QWORD *)v41;
    *(_QWORD *)&v9 = 138740227;
    v35 = v9;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v11)
        objc_enumerationMutation(&unk_1E547C3A8);
      v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
      if (!objc_msgSend(v13, "length", v35))
        break;
      v14 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v38, "absoluteString");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v15, "stringByAppendingString:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLWithString:", v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v7, "fileExistsAtPath:", v18);

      if ((v15 & 1) != 0)
      {
        v19 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v37, "absoluteString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByAppendingString:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLWithString:", v21);
        v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
        v23 = WBS_LOG_CHANNEL_PREFIXExtensions();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v35;
          v45 = v17;
          v46 = 2117;
          v47 = v22;
          _os_log_impl(&dword_1A840B000, v23, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Migrating web extension store file from '%{sensitive}@' to '%{sensitive}@'", buf, 0x16u);
        }
        if ((v10 & 1) == 0)
        {
          objc_msgSend(v7, "safari_ensureDirectoryExists:", v36);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24 == 0;

          if (v25)
          {
            v32 = WBS_LOG_CHANNEL_PREFIXExtensions();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              -[WBSWebExtensionSQLiteStoreMigrator _copySafariSQLiteStoreAndAssociatedFiles:toWebKitSQLiteStore:webKitWebExtensionFolder:].cold.2((uint64_t)v36, v32, v33);
            goto LABEL_24;
          }
        }
        v39 = 0;
        v26 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v17, v22, &v39);
        v27 = v39;
        v28 = v27;
        if ((v26 & 1) == 0)
        {
          v30 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v28, "safari_privacyPreservingDescription");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSWebExtensionSQLiteStoreMigrator _copySafariSQLiteStoreAndAssociatedFiles:toWebKitSQLiteStore:webKitWebExtensionFolder:].cold.1(v31, (uint64_t)buf, v30);
          }

LABEL_24:
          v29 = 0;
          goto LABEL_25;
        }

        v10 = 1;
      }

      if (v8 == ++v12)
      {
        v8 = objc_msgSend(&unk_1E547C3A8, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    v17 = v38;
    v22 = v37;
    goto LABEL_10;
  }
LABEL_18:
  v29 = 1;
LABEL_25:

  return v29;
}

- (void)_removeDirectories:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v14;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v15 = 0;
        v9 = objc_msgSend(v3, "removeItemAtURL:error:", v8, &v15);
        v10 = v15;
        if (v9)
        {
          v11 = WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138739971;
            v21 = v8;
            _os_log_impl(&dword_1A840B000, v11, OS_LOG_TYPE_DEFAULT, "Web Extension Storage Migration: Deleting legacy web extension data at: '%{sensitive}@'", buf, 0xCu);
          }
        }
        else
        {
          v12 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "safari_privacyPreservingDescription");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138740227;
            v21 = v8;
            v22 = 2114;
            v23 = v13;
            _os_log_error_impl(&dword_1A840B000, v12, OS_LOG_TYPE_ERROR, "Failed to delete legacy Safari web extension data at '%{sensitive}@': %{public}@", buf, 0x16u);

          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webKitProfilesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_safariProfilesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_webKitWebExtensionSettingsDirectoryURLForDefaultProfile, 0);
  objc_storeStrong((id *)&self->_safariWebExtensionSettingsDirectoryURLForDefaultProfile, 0);
  objc_storeStrong((id *)&self->_storeFileNameMappings, 0);
  objc_storeStrong((id *)&self->_safariContainerSettingsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)_anyWebKitSQLiteStoresExistInFolder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138739971;
  v3 = a1;
  _os_log_debug_impl(&dword_1A840B000, a2, OS_LOG_TYPE_DEBUG, "Web Extension Storage Migration: Not migrating web extension store file because file already exists at '%{sensitive}@'", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_copySQLiteStoresFromSafariExtensionFolder:(uint64_t)a3 toWebKitExtensionFolder:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138739971;
  v4 = a1;
  OUTLINED_FUNCTION_0_9(&dword_1A840B000, a2, a3, "Failed to migrate '%{sensitive}@', deleting destination WebKit extension folder", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_copySafariSQLiteStoreAndAssociatedFiles:(void *)a1 toWebKitSQLiteStore:(uint64_t)a2 webKitWebExtensionFolder:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_9(&dword_1A840B000, a3, (uint64_t)a3, "Failed to migrate web extension store file: %{public}@", (uint8_t *)a2);

}

- (void)_copySafariSQLiteStoreAndAssociatedFiles:(uint64_t)a1 toWebKitSQLiteStore:(NSObject *)a2 webKitWebExtensionFolder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138739971;
  v4 = a1;
  OUTLINED_FUNCTION_0_9(&dword_1A840B000, a2, a3, "Couldn't create folder for migration: '%{sensitive}@'", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
