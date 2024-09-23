@implementation MTDB

+ (id)sharedInstance
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (+[PFClientUtil supportsLocalLibrary](PFClientUtil, "supportsLocalLibrary"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    if (!_instance)
    {
      v3 = objc_alloc_init((Class)a1);
      v4 = (void *)_instance;
      _instance = (uint64_t)v3;

      if (!+[PFClientUtil isPodcastsApp](PFClientUtil, "isPodcastsApp")
        && (objc_msgSend((id)objc_opt_class(), "canExtensionOpenDatabase") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%@ %s:%@"), CFSTR("The Podcasts database is unavailable, corrupt, or requires migration. Please contact podcasts-app@group.apple.com if you need to use PodcastsKit."), "+[MTDB sharedInstance]", objc_opt_class());
        v5 = (void *)_instance;
        _instance = 0;

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    v6 = (id)_instance;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ %s:%@"), CFSTR("This is a thin client and should not create a local database. Please file a radar if you hit this."), "+[MTDB sharedInstance]", objc_opt_class());
    v6 = 0;
  }
  return v6;
}

- (id)contextForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MTDB coreDataContainer](self, "coreDataContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextForName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)importContext
{
  void *v2;
  void *v3;

  -[MTDB coreDataContainer](self, "coreDataContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)privateQueueContext
{
  void *v2;
  void *v3;

  -[MTDB coreDataContainer](self, "coreDataContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateQueueContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mainOrPrivateContext
{
  void *v2;
  void *v3;

  -[MTDB coreDataContainer](self, "coreDataContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainOrPrivateContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MTCoreDataContainer)coreDataContainer
{
  return self->_coreDataContainer;
}

+ (id)libraryPath
{
  void *v2;
  void *v3;

  +[MTConstants sharedDocumentsDirectory](MTConstants, "sharedDocumentsDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("MTLibrary.sqlite"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MTDB)init
{
  MTDBConfig *v3;
  MTCoreDataContainer *v4;
  MTDB *v5;

  v3 = objc_alloc_init(MTDBConfig);
  v4 = -[MTCoreDataContainer initWithConfig:]([MTCoreDataContainer alloc], "initWithConfig:", v3);
  v5 = -[MTDB initWithCoreDataContainer:config:](self, "initWithCoreDataContainer:config:", v4, v3);

  return v5;
}

- (MTDB)initWithCoreDataContainer:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  MTDB *v8;
  MTDB *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTDB;
  v8 = -[MTDB init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MTDB setCoreDataContainer:](v8, "setCoreDataContainer:", v6);
    -[MTDB setConfig:](v9, "setConfig:", v7);
  }

  return v9;
}

- (void)setCoreDataContainer:(id)a3
{
  objc_storeStrong((id *)&self->_coreDataContainer, a3);
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void)addChangeNotifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTDB coreDataContainer](self, "coreDataContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChangeNotifier:", v4);

}

+ (BOOL)quickCheckForNeedsContainerMigration
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MTLibraryPerformedSharedContainerMigration"));

  return v3;
}

+ (void)setStoreBothFreeAndPaidUrlsPreviousBootup
{
  id v2;

  objc_msgSend(a1, "isPodcastsAppCheck");
  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("StoreBothFreeAndPaidUrlsFeatureFlagWasEnabledLastTime"));

}

+ (BOOL)needsCacheBustForFreeAndPaidUrlStorage
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("StoreBothFreeAndPaidUrlsFeatureFlagWasEnabledLastTime")) ^ 1;

  return v3;
}

+ (BOOL)needsSerpentIdEpisodeMigration
{
  return objc_msgSend(a1, "serpentIdMigrationComplete") ^ 1;
}

+ (BOOL)serpentIdMigrationComplete
{
  void *v2;
  char v3;

  objc_msgSend(a1, "isPodcastsAppCheck");
  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MTSerpentIdFeatureFlagWasEnabledLastTime"));

  return v3;
}

+ (BOOL)isCorrupt
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MTDetectedCorruptDB"));

  return v3;
}

+ (void)isPodcastsAppCheck
{
  if (!+[PFClientUtil isPodcastsApp](PFClientUtil, "isPodcastsApp"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Calling the previous method is only allowed from the Podcasts.app process"));
}

+ (BOOL)needsMigrationToDeltaFeedUpdates
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("FeedManagerSystemMigrator.currentSystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(CFSTR("deltaSystem"), "isEqual:", v3) ^ 1;
  return (char)v2;
}

+ (int64_t)libraryDataVersion
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MTLibraryMigrationVersion"));

  return v3;
}

+ (int64_t)coreDataVersion
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MTCoreDataMigrationVersion"));

  return v3;
}

- (id)storeContext
{
  void *v2;
  void *v3;

  -[MTDB coreDataContainer](self, "coreDataContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)playbackContext
{
  void *v2;
  void *v3;

  -[MTDB coreDataContainer](self, "coreDataContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)fetchManagedObjectModelFromDisk
{
  void *v2;
  void *v3;

  +[MTConstants managedObjectModelDefinitionURL](MTConstants, "managedObjectModelDefinitionURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v2);

  return v3;
}

+ (void)setSharedInstance:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_lock);
  v4 = (void *)_instance;
  _instance = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
}

- (void)removeChangeNotifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTDB coreDataContainer](self, "coreDataContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChangeNotifier:", v4);

}

+ (BOOL)createDatabaseIfNeeded
{
  void *v3;
  BOOL v4;

  if (!+[MTLibraryMigrationUtil isNewInstall](MTLibraryMigrationUtil, "isNewInstall"))
    return 0;
  objc_msgSend(a1, "fetchManagedObjectModelFromDisk");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = +[MTLibraryMigrationUtil createPersistentStoreForModel:attemptMigration:](MTLibraryMigrationUtil, "createPersistentStoreForModel:attemptMigration:", v3, 0);
  else
    v4 = 0;

  return v4;
}

+ (BOOL)canExtensionOpenDatabase
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;

  if (+[MTLibraryMigrationUtil isNewInstall](MTLibraryMigrationUtil, "isNewInstall"))
  {
    _MTLogCategoryDatabase();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v9 = 0;
      v3 = "Extension cannot open DB because no DB file exists";
      v4 = (uint8_t *)&v9;
LABEL_13:
      _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_ERROR, v3, v4, 2u);
    }
  }
  else if (+[MTDB isCorrupt](MTDB, "isCorrupt"))
  {
    _MTLogCategoryDatabase();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v8 = 0;
      v3 = "Extension cannot open DB because the DB is corrupt";
      v4 = (uint8_t *)&v8;
      goto LABEL_13;
    }
  }
  else if (+[MTLibraryMigrationUtil needsCoreDataMigration](MTLibraryMigrationUtil, "needsCoreDataMigration"))
  {
    _MTLogCategoryDatabase();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v7 = 0;
      v3 = "Extension cannot open DB because the DB needs a Core Data migration";
      v4 = (uint8_t *)&v7;
      goto LABEL_13;
    }
  }
  else
  {
    if (!+[MTLibraryMigrationUtil needsDataMigration](MTLibraryMigrationUtil, "needsDataMigration"))
      return 1;
    _MTLogCategoryDatabase();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v6 = 0;
      v3 = "Extension cannot open DB because the DB needs a data migration";
      v4 = (uint8_t *)&v6;
      goto LABEL_13;
    }
  }

  return 0;
}

+ (id)libraryShmPath
{
  void *v2;
  void *v3;

  +[MTConstants sharedDocumentsDirectory](MTConstants, "sharedDocumentsDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("MTLibrary.sqlite-shm"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)libraryWalPath
{
  void *v2;
  void *v3;

  +[MTConstants sharedDocumentsDirectory](MTConstants, "sharedDocumentsDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("MTLibrary.sqlite-wal"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)carPlayContext
{
  void *v2;
  void *v3;

  -[MTDB coreDataContainer](self, "coreDataContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carPlayContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mainQueueContext
{
  void *v2;
  void *v3;

  -[MTDB coreDataContainer](self, "coreDataContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainQueueContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)resetableImportContext
{
  void *v2;
  void *v3;

  -[MTDB coreDataContainer](self, "coreDataContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetableImportContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)loggingContext
{
  void *v2;
  void *v3;

  -[MTDB coreDataContainer](self, "coreDataContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)persistentStoreUuid
{
  void *v2;
  void *v3;

  -[MTDB coreDataContainer](self, "coreDataContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreUuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)managedObjectModel
{
  void *v2;
  void *v3;

  -[MTDB config](self, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setCorrupt:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "isPodcastsAppCheck");
  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("MTDetectedCorruptDB"));

}

+ (void)setLibraryDataVersion:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "isPodcastsAppCheck");
  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("MTLibraryMigrationVersion"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronize");

}

+ (void)setCoreDataVersion:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(a1, "isPodcastsAppCheck");
  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("MTCoreDataMigrationVersion"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronize");

}

+ (void)setQuickCheckForNeedsContainerMigration:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(a1, "isPodcastsAppCheck");
  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("MTLibraryPerformedSharedContainerMigration"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronize");

}

+ (void)setSerpentIdMigrationComplete:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "isPodcastsAppCheck");
  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("MTSerpentIdFeatureFlagWasEnabledLastTime"));

}

+ (void)setMigrationToDeltaFeedUpdatesComplete
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("deltaSystem"), CFSTR("FeedManagerSystemMigrator.currentSystem"));

}

- (MTCoreDataContainerConfigProvider)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_coreDataContainer, 0);
}

@end
