@implementation PBFWallpaperKitBridge

+ (id)defaultBridge
{
  if (defaultBridge_onceToken != -1)
    dispatch_once(&defaultBridge_onceToken, &__block_literal_global_28);
  return (id)defaultBridge_defaultBridge;
}

void __38__PBFWallpaperKitBridge_defaultBridge__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultBridge_defaultBridge;
  defaultBridge_defaultBridge = v0;

}

- (NSString)defaultWallpaperIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(getWKDefaultWallpaperManagerClass(), "defaultWallpaperManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultWallpaperBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "identifier");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (BOOL)shouldInstallHeroPosterAsDefaultLockScreenWallpaper
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  const char *v10;
  uint8_t *v11;
  __int16 v13;
  __int16 v14;

  -[PBFWallpaperKitBridge defaultWallpaperIdentifier](self, "defaultWallpaperIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D652A0]);
    -[NSObject lockScreenWallpaperConfigurationIncludingValuesForTypes:](v4, "lockScreenWallpaperConfigurationIncludingValuesForTypes:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "wallpaperType");
    PBFLogMigration();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    v9 = v6 == 4;
    if (v9)
    {
      if (v8)
      {
        v14 = 0;
        v10 = "(shouldInstallCollectionsPosterAsDefaultLockScreenWallpaper) Color is set, we migrated, and there's no exi"
              "sting wallpaper - returning YES.";
        v11 = (uint8_t *)&v14;
LABEL_11:
        _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else if (v8)
    {
      v13 = 0;
      v10 = "(shouldInstallCollectionsPosterAsDefaultLockScreenWallpaper) A preference has been set, going with legacy wa"
            "llpaper -- returning NO";
      v11 = (uint8_t *)&v13;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  PBFLogMigration();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[PBFWallpaperKitBridge shouldInstallHeroPosterAsDefaultLockScreenWallpaper].cold.1(v4);
  v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)dataMigratorDeterminedLegacyWallpaperMigrationRequired
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char isKindOfClass;
  char v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PBFLogMigration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1CB9FA000, v2, OS_LOG_TYPE_DEFAULT, "(dataMigratorDeterminedLegacyWallpaperMigrationRequired) Detecting if we need to do a data update", (uint8_t *)&v11, 2u);
  }

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
  objc_msgSend(v3, "objectForKey:", CFSTR("SBLegacyWallpaperMigrationNeeded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLogMigration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "(dataMigratorDeterminedLegacyWallpaperMigrationRequired) springBoardIndicatedDataStoreMigrationNeeded: (%{public}@)", (uint8_t *)&v11, 0xCu);
  }

  if (v4
    && (objc_opt_self(),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    v8 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    PBFLogMigration();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEFAULT, "(dataMigratorDeterminedLegacyWallpaperMigrationRequired) springBoardIndicatedDataStoreMigrationNeeded was invalid (%{public}@); nothing to do.",
        (uint8_t *)&v11,
        0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (void)clearLegacyWallpaperMigrationKeys
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.springboard"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBLegacyWallpaperMigrationNeeded"));

}

- (BOOL)shouldDefaultWallpaperDisableModifyingLegibilityBlur
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(getWKDefaultWallpaperManagerClass(), "defaultWallpaperManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "defaultWallpaperBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "disableModifyingLegibilityBlur");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)shouldInstallHeroPosterAsDefaultLockScreenWallpaper
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_FAULT, "(shouldInstallCollectionsPosterAsDefaultLockScreenWallpaper) unable to determine defaultWallpaperIdentifier... good luck with that legacy wallpaper (returning NO)", v1, 2u);
}

@end
