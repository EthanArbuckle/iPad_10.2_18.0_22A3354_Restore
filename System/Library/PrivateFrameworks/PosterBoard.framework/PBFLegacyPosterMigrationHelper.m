@implementation PBFLegacyPosterMigrationHelper

- (PBFLegacyPosterMigrationHelper)initWithDataStore:(id)a3 legacyPosterPair:(id)a4
{
  id v7;
  id v8;
  PBFLegacyPosterMigrationHelper *v9;
  PBFLegacyPosterMigrationHelper *v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  _BOOL4 distinctHomeScreenMigrationEnabled;
  int v18;
  void *v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  BOOL v30;
  int v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  _BOOL4 canMigrateLegacyPoster;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  _BOOL4 v39;
  _BOOL4 canMigrateLegacyLockPoster;
  objc_super v42;
  uint8_t buf[4];
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  int v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v42.receiver = self;
  v42.super_class = (Class)PBFLegacyPosterMigrationHelper;
  v9 = -[PBFLegacyPosterMigrationHelper init](&v42, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_legacyPosterPair, a4);
    objc_storeStrong((id *)&v10->_dataStore, a3);
    v10->_migrationEnabled = _os_feature_enabled_impl();
    v10->_distinctHomeScreenMigrationEnabled = _os_feature_enabled_impl();
    PBFLogLegacyPosterMigration();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PBFLegacyPosterMigrationHelper initWithDataStore:legacyPosterPair:].cold.2((unsigned __int8 *)&v10->_migrationEnabled, (unsigned __int8 *)&v10->_distinctHomeScreenMigrationEnabled, v11);

    if (-[PBFLegacyPosterMigrationHelper _shouldAllowMigration](v10, "_shouldAllowMigration"))
    {
      v12 = objc_alloc_init(MEMORY[0x1E0D652A0]);
      objc_msgSend(v12, "posterMigrationInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&v10->_migrationInfo, v13);
      v14 = objc_msgSend(v13, "pairingType");
      v15 = objc_msgSend(v13, "homeProvider") == 2 && objc_msgSend(v13, "pairingType") != 1;
      if (objc_msgSend(v13, "homeProvider") == 1 && objc_msgSend(v13, "pairingType") == 2)
      {
        distinctHomeScreenMigrationEnabled = v10->_distinctHomeScreenMigrationEnabled;
        v18 = 1;
      }
      else
      {
        v18 = 0;
        distinctHomeScreenMigrationEnabled = 1;
      }
      -[PBFLegacyPosterMigrationHelper migrationInfo](v10, "migrationInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "lockProvider");

      if (!v20)
      {
        PBFLogLegacyPosterMigration();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[PBFLegacyPosterMigrationHelper initWithDataStore:legacyPosterPair:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

      }
      PBFLogLegacyPosterMigration();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109888;
        v44 = v14 != 0;
        v45 = 1024;
        v46 = v15;
        v47 = 1024;
        v48 = v18;
        v49 = 1024;
        v50 = distinctHomeScreenMigrationEnabled;
        _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_INFO, "Supported migration: %d, Collections Home Mismatched: %d, Distinct Photo Home: %d, canMigrateHome:%d", buf, 0x1Au);
      }

      v30 = v20 != 0;
      v31 = (v14 != 0) & ~v15;
      if (!v20)
        v31 = 0;
      v32 = distinctHomeScreenMigrationEnabled & v31;
      v10->_canMigrateLegacyPoster = distinctHomeScreenMigrationEnabled & v31;
      v10->_canMigrateLegacyLockPoster = v30;
      PBFLogLegacyPosterMigration();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
      if (v32 == 1)
      {
        if (v34)
        {
          canMigrateLegacyPoster = v10->_canMigrateLegacyPoster;
          *(_DWORD *)buf = 67109120;
          v44 = canMigrateLegacyPoster;
          v36 = "Can Migrate:%d";
          v37 = v33;
          v38 = 8;
LABEL_28:
          _os_log_impl(&dword_1CB9FA000, v37, OS_LOG_TYPE_INFO, v36, buf, v38);
        }
      }
      else if (v34)
      {
        v39 = v10->_canMigrateLegacyPoster;
        canMigrateLegacyLockPoster = v10->_canMigrateLegacyLockPoster;
        *(_DWORD *)buf = 67109376;
        v44 = v39;
        v45 = 1024;
        v46 = canMigrateLegacyLockPoster;
        v36 = "Can Migrate:%d, Lock:%d";
        v37 = v33;
        v38 = 14;
        goto LABEL_28;
      }

      goto LABEL_30;
    }
    PBFLogLegacyPosterMigration();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_INFO, "Migration not enabled", buf, 2u);
    }

    v10->_canMigrateLegacyPoster = 0;
  }
LABEL_30:

  return v10;
}

- (BOOL)_shouldAllowMigration
{
  return self->_migrationEnabled || self->_distinctHomeScreenMigrationEnabled;
}

- (id)lockScreenMigrationViewController
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  PBFLegacyMigrationEditingSceneViewController *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[16];

  if (-[PBFLegacyPosterMigrationHelper canMigrateLegacyPoster](self, "canMigrateLegacyPoster")
    || -[PBFLegacyPosterMigrationHelper canMigrateLegacyLockPoster](self, "canMigrateLegacyLockPoster"))
  {
    -[PBFLegacyPosterMigrationHelper migrationInfo](self, "migrationInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lockProvider");

    PBUIExtensionIdentifierForPosterWallpaperMigrationProvider();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (id)*MEMORY[0x1E0D7F758];
    objc_msgSend(MEMORY[0x1E0D7F8D0], "temporaryPathForRole:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D7F8E0];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:", v4, v5, v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0D7F8E8];
    objc_msgSend(v6, "contentsURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathWithContainerURL:identity:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "providerForPath:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      PBFLogLegacyPosterMigration();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[PBFLegacyPosterMigrationHelper lockScreenMigrationViewController].cold.1();
      v19 = 0;
      goto LABEL_18;
    }
    v26 = 0;
    objc_msgSend(v12, "ensureContentsURLIsReachableAndReturnError:", &v26);
    v16 = v26;
    if (v16)
    {
      v17 = v16;
      PBFLogLegacyPosterMigration();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PBFLegacyPosterMigrationHelper lockScreenMigrationViewController].cold.3(v17);
    }
    else
    {
      v25 = 0;
      objc_msgSend(v12, "storeUserInfo:error:", &unk_1E8741B48, &v25);
      v20 = v25;
      if (!v20)
      {
        v22 = (void *)MEMORY[0x1E0D7F8C0];
        objc_msgSend(v15, "identity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "extensionInstanceForIdentity:instanceIdentifier:", v23, v24);
        v17 = objc_claimAutoreleasedReturnValue();

        v19 = -[PBFLegacyMigrationEditingSceneViewController initWithProvider:contents:exnihiloPathAssertion:replacing:]([PBFLegacyMigrationEditingSceneViewController alloc], "initWithProvider:contents:exnihiloPathAssertion:replacing:", v17, v12, v6, 0);
        PBFLogLegacyPosterMigration();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_INFO, "(lockScreenMigrationViewController) will provide editing view controller for lock screen legacy migration", buf, 2u);
        }
        goto LABEL_17;
      }
      v17 = v20;
      PBFLogLegacyPosterMigration();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PBFLegacyPosterMigrationHelper lockScreenMigrationViewController].cold.2(v17);
    }
    v19 = 0;
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  PBFLogLegacyPosterMigration();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "(lockScreenMigrationViewController) Unable to migrate legacy poster, returning nil", buf, 2u);
  }
  v19 = 0;
LABEL_19:

  return v19;
}

- (void)migrateHomePosterAndAssociateToConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *homeMigrationQueue;
  NSObject *v17;
  OS_dispatch_queue *v18;
  OS_dispatch_queue *v19;
  id v20;
  id v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (!-[PBFLegacyPosterMigrationHelper _shouldAllowMigration](self, "_shouldAllowMigration")
    || !-[PBFLegacyPosterMigrationHelper isDistinctHomeScreenMigrationEnabled](self, "isDistinctHomeScreenMigrationEnabled"))
  {
    PBFLogLegacyPosterMigration();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v23 = "(migrateHomeScreenWallpaperIfNeeded...) Home screen migration not enabled.";
    goto LABEL_10;
  }
  -[PBFLegacyPosterMigrationHelper migrationInfo](self, "migrationInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pairingType");

  if (v9 != 2)
  {
    PBFLogLegacyPosterMigration();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v23 = "(migrateHomeScreenWallpaperIfNeeded...) Home screen migration not needed.";
LABEL_10:
    v24 = v22;
    v25 = OS_LOG_TYPE_INFO;
LABEL_11:
    _os_log_impl(&dword_1CB9FA000, v24, v25, v23, buf, 2u);
    goto LABEL_12;
  }
  -[PBFLegacyPosterMigrationHelper migrationInfo](self, "migrationInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "homeProvider");

  if (!v11)
  {
    PBFLogLegacyPosterMigration();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v23 = "Unable to migrate legacy home wallpaper because we could not resolve a home provider";
    v24 = v22;
    v25 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_11;
  }
  PBUIExtensionIdentifierForPosterWallpaperMigrationProvider();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0D7F6F0]);
  objc_msgSend(v13, "setUserInfo:", &unk_1E8741B70);
  objc_msgSend(MEMORY[0x1E0D7F6B8], "posterUpdateHomeScreenPosterProvider:sessionInfo:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7F6B8], "posterUpdateHomeScreenAppearance:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  homeMigrationQueue = self->_homeMigrationQueue;
  if (!homeMigrationQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PosterBoard.LegacyPosterHomeMigration", v17);
    v19 = self->_homeMigrationQueue;
    self->_homeMigrationQueue = v18;

    homeMigrationQueue = self->_homeMigrationQueue;
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke;
  v26[3] = &unk_1E86F2FC0;
  v27 = v6;
  v28 = v14;
  v29 = v15;
  v30 = v7;
  v20 = v15;
  v21 = v14;
  dispatch_async(homeMigrationQueue, v26);

LABEL_13:
}

void __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PBFLogLegacyPosterMigration();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_INFO, "(migrateHomeScreenWallpaperIfNeeded...) Home screen migration required, updating configuration for UUID: %{public}@", buf, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v11[0] = *(_QWORD *)(a1 + 40);
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_23;
  v9[3] = &unk_1E86F29E0;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v3, "updatePosterConfigurationMatchingUUID:updates:completion:", v6, v8, v9);

}

void __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_23(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  v6 = a2;
  v7 = a4;
  PBFLogLegacyPosterMigration();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_23_cold_1(v7);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_INFO, "Home screen migrated successfully", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_24;
  block[3] = &unk_1E86F2E08;
  v10 = *(id *)(a1 + 32);
  v15 = v7;
  v16 = v10;
  v14 = v6;
  v11 = v7;
  v12 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_24(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(a1[6] + 16))(a1[6], a1[4] == 0, a1[5]);
}

- (void)revertMigrationWithMigratedConfigurationUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  const char *v22;
  _BOOL4 v23;
  NSObject *v24;
  uint32_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "switcherConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFLegacyPosterMigrationHelper legacyPosterPair](self, "legacyPosterPair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "configurations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __79__PBFLegacyPosterMigrationHelper_revertMigrationWithMigratedConfigurationUUID___block_invoke;
  v29[3] = &unk_1E86F2E80;
  v12 = v4;
  v30 = v12;
  objc_msgSend(v10, "bs_firstObjectPassingTest:", v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "configurations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __79__PBFLegacyPosterMigrationHelper_revertMigrationWithMigratedConfigurationUUID___block_invoke_2;
  v27[3] = &unk_1E86F2E80;
  v15 = v9;
  v28 = v15;
  objc_msgSend(v14, "bs_firstObjectPassingTest:", v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 || !v16)
  {
    if (!v13 || v16)
    {
      PBFLogLegacyPosterMigration();
      v18 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v13 || !v16)
      {
        if (!v23)
          goto LABEL_20;
        *(_DWORD *)buf = 138543618;
        v32 = v15;
        v33 = 2114;
        v34 = v12;
        v22 = "revertMigration: Could not locate configs to remove or set for legacy UUID: %{public}@, UUID: %{public}@";
        v24 = v18;
        v25 = 22;
LABEL_19:
        _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, v22, buf, v25);
        goto LABEL_20;
      }
      if (!v23)
        goto LABEL_20;
      *(_DWORD *)buf = 138543362;
      v32 = v12;
      v22 = "revertMigration: Could not locate config to remove for UUID: %{public}@";
    }
    else
    {
      PBFLogLegacyPosterMigration();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      v22 = "revertMigration: Could not locate config to set for legacy UUID: %{public}@";
    }
    v24 = v18;
    v25 = 12;
    goto LABEL_19;
  }
  objc_msgSend(v6, "switcherConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "mutableCopy");

  -[NSObject removeConfiguration:](v18, "removeConfiguration:", v13);
  -[NSObject setSelectedConfiguration:](v18, "setSelectedConfiguration:", v16);
  -[NSObject setDesiredActiveConfiguration:](v18, "setDesiredActiveConfiguration:", v16);
  v26 = 0;
  v19 = (id)objc_msgSend(v6, "updateDataStoreForSwitcherConfiguration:options:reason:error:", v18, 0, CFSTR("Reverting legacy migration"), &v26);
  v20 = v26;
  if (v20)
  {
    PBFLogLegacyPosterMigration();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PBFLegacyPosterMigrationHelper revertMigrationWithMigratedConfigurationUUID:].cold.1(v20);

  }
LABEL_20:

}

uint64_t __79__PBFLegacyPosterMigrationHelper_revertMigrationWithMigratedConfigurationUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

uint64_t __79__PBFLegacyPosterMigrationHelper_revertMigrationWithMigratedConfigurationUUID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

- (void)finalizeMigrationWithMigratedConfigurationUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE v59[16];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "switcherConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFLegacyPosterMigrationHelper legacyPosterPair](self, "legacyPosterPair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "configurations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0x7FFFFFFFFFFFFFFFLL;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0x7FFFFFFFFFFFFFFFLL;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__8;
  v49 = __Block_byref_object_dispose__8;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__8;
  v43 = __Block_byref_object_dispose__8;
  v44 = 0;
  v12 = objc_opt_class();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __81__PBFLegacyPosterMigrationHelper_finalizeMigrationWithMigratedConfigurationUUID___block_invoke;
  v32[3] = &unk_1E86F5E78;
  v13 = v4;
  v33 = v13;
  v35 = &v45;
  v36 = &v55;
  v14 = v9;
  v34 = v14;
  v37 = &v39;
  v38 = &v51;
  objc_msgSend(v11, "bs_enumerateObjectsOfClass:usingBlock:", v12, v32);
  if (v56[3] == 0x7FFFFFFFFFFFFFFFLL || v52[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    PBFLogLegacyPosterMigration();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[PBFLegacyPosterMigrationHelper finalizeMigrationWithMigratedConfigurationUUID:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    v15 = objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v52[3], v46[5]);
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v56[3], v40[5]);
    -[NSObject setConfigurations:](v15, "setConfigurations:", v11);
    -[NSObject selectedConfiguration](v15, "selectedConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqual:", v40[5]);

    if (v24)
      -[NSObject setSelectedConfiguration:](v15, "setSelectedConfiguration:", v46[5]);
    -[NSObject activeConfiguration](v15, "activeConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqual:", v40[5]);

    if (v26)
      -[NSObject setDesiredActiveConfiguration:](v15, "setDesiredActiveConfiguration:", v46[5]);
    -[NSObject removeConfiguration:](v15, "removeConfiguration:", v40[5]);
    v31 = 0;
    v27 = (id)objc_msgSend(v6, "updateDataStoreForSwitcherConfiguration:options:reason:error:", v15, 0, CFSTR("Finalizing legacy migration"), &v31);
    v28 = v31;
    if (v28)
    {
      PBFLogLegacyPosterMigration();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v28, "localizedDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFLegacyPosterMigrationHelper finalizeMigrationWithMigratedConfigurationUUID:].cold.2(v30, (uint64_t)v59, v29);
      }

    }
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

}

void __81__PBFLegacyPosterMigrationHelper_finalizeMigrationWithMigratedConfigurationUUID___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "_path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "posterUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", a1[4]);

  if (v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
  }
  objc_msgSend(v16, "_path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serverIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "posterUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", a1[5]);

  if (v15)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = a3;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL
    && *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *a4 = 1;
  }

}

- (BOOL)canMigrateLegacyPoster
{
  return self->_canMigrateLegacyPoster;
}

- (BOOL)canMigrateLegacyLockPoster
{
  return self->_canMigrateLegacyLockPoster;
}

- (id)legacyPosterPair
{
  return self->_legacyPosterPair;
}

- (PBUIPosterWallpaperMigrationInfo)migrationInfo
{
  return self->_migrationInfo;
}

- (PBFPosterExtensionDataStore)dataStore
{
  return self->_dataStore;
}

- (BOOL)isMigrationEnabled
{
  return self->_migrationEnabled;
}

- (BOOL)isDistinctHomeScreenMigrationEnabled
{
  return self->_distinctHomeScreenMigrationEnabled;
}

- (OS_dispatch_queue)homeMigrationQueue
{
  return self->_homeMigrationQueue;
}

- (void)setHomeMigrationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_homeMigrationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeMigrationQueue, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_migrationInfo, 0);
  objc_storeStrong(&self->_legacyPosterPair, 0);
}

- (void)initWithDataStore:(uint64_t)a3 legacyPosterPair:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_4(&dword_1CB9FA000, a1, a3, "Unable to migrate legacy lock wallpaper because we could not resolve a lock provider", a5, a6, a7, a8, 0);
}

- (void)initWithDataStore:(os_log_t)log legacyPosterPair:.cold.2(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_debug_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_DEBUG, "MigrationFF: %d, HomeMigrationFF: %d", (uint8_t *)v5, 0xEu);
}

- (void)lockScreenMigrationViewController
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_3(&dword_1CB9FA000, v2, v3, "(lockScreenMigrationViewController) Unable to create contents at migration path: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __90__PBFLegacyPosterMigrationHelper_migrateHomePosterAndAssociateToConfiguration_completion___block_invoke_23_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_3(&dword_1CB9FA000, v2, v3, "Home screen migration failed: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)revertMigrationWithMigratedConfigurationUUID:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_3(&dword_1CB9FA000, v2, v3, "revertMigration: Failed to revert legacy migration: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)finalizeMigrationWithMigratedConfigurationUUID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_4(&dword_1CB9FA000, a1, a3, "finalizeMigration: Could not find indices for new and legacy poster", a5, a6, a7, a8, 0);
}

- (void)finalizeMigrationWithMigratedConfigurationUUID:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_6(&dword_1CB9FA000, a3, (uint64_t)a3, "finalizeMigration: Failed to finalize legacy migration: %{public}@", (uint8_t *)a2);

}

@end
