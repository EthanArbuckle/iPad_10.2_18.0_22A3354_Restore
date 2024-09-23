@implementation TPSDataMigrator

+ (void)performMigrationIfNeeded
{
  objc_msgSend(a1, "_performDesiredOutcomeMigration");
  objc_msgSend(a1, "_performSavedTipsMigration");
}

+ (void)_performDesiredOutcomeMigration
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("TPSDidMigrateDesiredOutcomePerformed")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DAC2F000, v3, OS_LOG_TYPE_DEFAULT, "Should perform desired outcome migration.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tipStatusController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "tipStatusMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__TPSDataMigrator__performDesiredOutcomeMigration__block_invoke;
    v8[3] = &unk_1EA1E1358;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);
    objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("TPSDidMigrateDesiredOutcomePerformed"));
    objc_msgSend(v2, "synchronize");

  }
}

void __50__TPSDataMigrator__performDesiredOutcomeMigration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a2;
  objc_msgSend(a3, "desiredOutcomePerformedDates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "donateDesiredOutcomePerformedForIdentifier:date:", v5, v7);
    objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __50__TPSDataMigrator__performDesiredOutcomeMigration__block_invoke_cold_1();

  }
}

+ (void)_performSavedTipsMigration
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAC2F000, v2, OS_LOG_TYPE_DEFAULT, "Should migrate saved tips and dates with correlation id.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tipStatusController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "tipStatusMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF3F8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "majorVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v6, "removeInvalidEntries");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__TPSDataMigrator__performSavedTipsMigration__block_invoke;
  v12[3] = &unk_1EA1E1380;
  v14 = v4;
  v15 = v9;
  v13 = v6;
  v10 = v4;
  v11 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

}

void __45__TPSDataMigrator__performSavedTipsMigration__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "savedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastUsedVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v7 && v9 >= a1[6] - 2)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __45__TPSDataMigrator__performSavedTipsMigration__block_invoke_cold_1();

    v11 = (void *)a1[4];
    objc_msgSend(v6, "correlationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastUsedVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateSavedTipsWithCorrelationId:tipIdentifier:savedDate:lastUsedVersion:", v12, v13, v7, v14);

    v15 = (void *)a1[5];
    objc_msgSend(v6, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clearSavedDateForIdentifier:", v16);

  }
}

+ (void)revertTipStatusArchivalIfNeeded
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("TPSDidRevertArchivedTipStatuses")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1DAC2F000, v3, OS_LOG_TYPE_DEFAULT, "Should revert tip status archival.", (uint8_t *)&v13, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "archivedTipStatuses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tipStatusController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "tipStatusCount"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v9;
        _os_log_impl(&dword_1DAC2F000, v8, OS_LOG_TYPE_DEFAULT, "Pre-unarchival tip status count: %@", (uint8_t *)&v13, 0xCu);

      }
      objc_msgSend(v7, "addTipStatuses:", v5);
      objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "tipStatusCount"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_1DAC2F000, v10, OS_LOG_TYPE_DEFAULT, "Post-unarchival tip status count: %@", (uint8_t *)&v13, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteTipStatusArchivalDirectory");

    objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("TPSDidRevertArchivedTipStatuses"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("TPSLastTipStatusArchivalMajorVersion"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("TPSDidResetTipStatusDataProtectionLevel"));
    objc_msgSend(v2, "synchronize");

  }
}

void __50__TPSDataMigrator__performDesiredOutcomeMigration__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_7(&dword_1DAC2F000, v0, v1, "Migrate desiredOutomePerformed for identifier: %@, date: %@");
}

void __45__TPSDataMigrator__performSavedTipsMigration__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_7(&dword_1DAC2F000, v0, v1, "Migrate savedTip to defaults for identifier: %@, date: %@");
}

@end
