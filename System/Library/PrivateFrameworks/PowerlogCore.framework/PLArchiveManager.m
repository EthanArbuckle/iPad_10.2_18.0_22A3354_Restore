@implementation PLArchiveManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_8_0);
  return (id)sharedInstance_instance_0;
}

void __34__PLArchiveManager_sharedInstance__block_invoke()
{
  PLArchiveManager *v0;
  void *v1;

  v0 = objc_alloc_init(PLArchiveManager);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;

}

- (PLArchiveManager)init
{
  PLArchiveManager *v2;
  PLArchiveManager *v3;
  uint64_t v4;
  NSMutableArray *archiveJobs;
  uint64_t v6;
  NSMutableArray *notificationBlocks;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PLArchiveManager;
  v2 = -[PLArchiveManager init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    archiveJobs = v3->_archiveJobs;
    v3->_archiveJobs = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    notificationBlocks = v3->_notificationBlocks;
    v3->_notificationBlocks = (NSMutableArray *)v6;

    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLArchiveManager_interval"), 86400.0);
    v3->_interval = v8;
    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLArchiveManager_mustRunInterval"), 259200.0);
    v3->_mustRunInterval = v9;
    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLArchiveManager_EPSQLVacuumInterval"), 2592000.0);
    v3->_EPSQLVacuumInterval = v10;
    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLArchiveManager_mainDBDuration"), 86400.0);
    v3->_PLSQLDBDuration = v11;
    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLArchiveManager_EPSQLDBDuration"), 2592000.0);
    v3->_EPSQLDBDuration = v12;
    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLArchiveManager_CESQLDBDuration"), 604800.0);
    v3->_CESQLDBDuration = v13;
    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLArchiveManager_BGSQLDBDuration"), 2592000.0);
    v3->_BGSQLDBDuration = v14;
    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLArchiveManager_XCSQLDBDuration"), 31449600.0);
    v3->_XCSQLDBDuration = v15;
    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLArchiveManager_allDBDuration"), 604800.0);
    v3->_archiveRetention = v16;
    v3->_monotonicResetOccurred = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("PLExitReasonKey"), -1) == 1006;
    +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerForTimeChangedCallbackWithIdentifier:forTimeReference:usingBlock:", CFSTR("com.apple.powerlogd.archiver"), 1, &__block_literal_global_35);

    -[PLArchiveManager runInitialActivity](v3, "runInitialActivity");
  }
  return v3;
}

uint64_t __24__PLArchiveManager_init__block_invoke()
{
  return +[PLArchiveManager systemTimeChangedByOffset:](PLArchiveManager, "systemTimeChangedByOffset:");
}

- (void)dealloc
{
  objc_super v3;

  -[PLArchiveManager disable](self, "disable");
  v3.receiver = self;
  v3.super_class = (Class)PLArchiveManager;
  -[PLArchiveManager dealloc](&v3, sel_dealloc);
}

+ (id)workQueue
{
  return +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
}

+ (id)storageQueue
{
  void *v2;
  void *v3;

  +[PLCoreStorage storageQueueNameForClass:](PLCoreStorage, "storageQueueNameForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  PLArchiveManager *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_enabled == v3)
  {
    objc_sync_exit(obj);

  }
  else
  {
    obj->_enabled = v3;
    objc_sync_exit(obj);

    if (v3)
      -[PLArchiveManager enable](obj, "enable");
    else
      -[PLArchiveManager disable](obj, "disable");
  }
}

- (void)setInterrupted:(BOOL)a3
{
  _BOOL4 v3;
  PLArchiveManager *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_interrupted != v3)
    obj->_interrupted = v3;
  objc_sync_exit(obj);

}

- (void)runInitialActivity
{
  -[PLArchiveManager recover](self, "recover");
  -[PLArchiveManager migrate](self, "migrate");
  -[PLArchiveManager cleanup](self, "cleanup");
}

- (id)getArchivingCriteria
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLActivityCriterionTime timeCriterionWithInterval:](PLActivityCriterionTime, "timeCriterionWithInterval:", self->_interval);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  +[PLActivityCriterionEntry audioOffCriterion](PLActivityCriterionEntry, "audioOffCriterion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  if (+[PLUtilities hasBattery](PLUtilities, "hasBattery"))
  {
    +[PLActivityCriterionEntry displayOffCriterion](PLActivityCriterionEntry, "displayOffCriterion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

    +[PLActivityCriterionEntry pluggedInCriterion](PLActivityCriterionEntry, "pluggedInCriterion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (void)enable
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "storageLocked");

  if ((v5 & 1) == 0)
  {
    -[PLArchiveManager setInterrupted:](self, "setInterrupted:", 0);
    -[PLArchiveManager getArchivingCriteria](self, "getArchivingCriteria");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __26__PLArchiveManager_enable__block_invoke;
    v13[3] = &unk_1E6A552E0;
    v13[4] = self;
    v8 = (void *)MEMORY[0x1BCC9EB70](v13);
    +[PLActivityScheduler sharedInstance](PLActivityScheduler, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLArchiveManager mustRunInterval](self, "mustRunInterval");
    +[PLActivityCriterionTime timeCriterionWithInterval:](PLActivityCriterionTime, "timeCriterionWithInterval:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLArchiveManager workQueue](PLArchiveManager, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __26__PLArchiveManager_enable__block_invoke_2;
    v12[3] = &unk_1E6A55308;
    v12[4] = self;
    objc_msgSend(v9, "scheduleActivityWithIdentifier:withCriteria:withMustRunCriterion:withQueue:withInterruptBlock:withActivityBlock:", CFSTR("com.apple.powerlogd.archiver"), v6, v10, v11, v8, v12);

  }
}

uint64_t __26__PLArchiveManager_enable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInterrupted:", 1);
}

void __26__PLArchiveManager_enable__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setInterrupted:", 0);
  objc_msgSend(*(id *)(a1 + 32), "runActivityWithLastCompletedDate:", v4);

}

- (void)disable
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "storageLocked");

  if ((v5 & 1) == 0)
  {
    -[PLArchiveManager setInterrupted:](self, "setInterrupted:", 0);
    +[PLActivityScheduler sharedInstance](PLActivityScheduler, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelActivityWithIdentifier:", CFSTR("com.apple.powerlogd.archiver"));

  }
}

- (void)runActivityWithLastCompletedDate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[4];
  id v24;
  uint8_t buf[8];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogArchiving();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::runActivity", buf, 2u);
  }

  v6 = (void *)os_transaction_create();
  v7 = (void *)MEMORY[0x1BCC9E9B4]();
  -[PLArchiveManager deprecateTables](self, "deprecateTables");
  -[PLArchiveManager scheduleArchiveJobs](self, "scheduleArchiveJobs");
  -[PLArchiveManager runArchiveJobs](self, "runArchiveJobs");
  -[PLArchiveManager trimCleanEnergyLog](self, "trimCleanEnergyLog");
  -[PLArchiveManager trimExtendedPersistenceLog](self, "trimExtendedPersistenceLog");
  -[PLArchiveManager trimXcodeOrganizerLog](self, "trimXcodeOrganizerLog");
  -[PLArchiveManager trimBackgroundProcessingLog](self, "trimBackgroundProcessingLog");
  -[PLArchiveManager cleanup](self, "cleanup");
  objc_autoreleasePoolPop(v7);
  v8 = dispatch_time(0, 60000000000);
  +[PLUtilities transactionWorkQueue](PLUtilities, "transactionWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PLArchiveManager_runActivityWithLastCompletedDate___block_invoke;
  block[3] = &unk_1E6A52050;
  v10 = v6;
  v24 = v10;
  dispatch_after(v8, v9, block);

  if (v4)
  {
    if (!-[PLArchiveManager interrupted](self, "interrupted"))
    {
      PLLogArchiving();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6AB6000, v11, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::runArchiveJobs: notifying clients", buf, 2u);
      }

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[PLArchiveManager notificationBlocks](self, "notificationBlocks", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16);
            if (v17)
              (*(void (**)(void))(v17 + 16))();
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
        }
        while (v14);
      }

    }
    PLLogArchiving();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v18, OS_LOG_TYPE_DEFAULT, "Cleanly restarting powerlog to reduce memory fragmentation", buf, 2u);
    }

    +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 4);
  }

}

- (void)deprecateTables
{
  void *v3;
  void *v4;
  char v5;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "storageLocked");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(&unk_1E6AF5F60, "enumerateObjectsUsingBlock:", &__block_literal_global_264);
    -[PLArchiveManager deprecateTablesEPSQL](self, "deprecateTablesEPSQL");
    -[PLArchiveManager deprecateTablesCESQL](self, "deprecateTablesCESQL");
    -[PLArchiveManager deprecateTablesXCSQL](self, "deprecateTablesXCSQL");
    -[PLArchiveManager deprecateTablesBGSQL](self, "deprecateTablesBGSQL");
  }
}

void __35__PLArchiveManager_deprecateTables__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE '%@';"), a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "performQuery:", v6);

}

- (void)deprecateTablesEPSQL
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "storageLocked");

  if ((v4 & 1) == 0)
  {
    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "EPSQLConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__PLArchiveManager_deprecateTablesEPSQL__block_invoke;
    v8[3] = &unk_1E6A55370;
    v9 = v5;
    v6 = v5;
    objc_msgSend(&unk_1E6AF5F78, "enumerateObjectsUsingBlock:", v8);

  }
}

void __40__PLArchiveManager_deprecateTablesEPSQL__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE '%@';"), a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "performQuery:", v4);

}

- (void)deprecateTablesCESQL
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "storageLocked");

  if ((v4 & 1) == 0)
  {
    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CESQLConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__PLArchiveManager_deprecateTablesCESQL__block_invoke;
    v8[3] = &unk_1E6A55370;
    v9 = v5;
    v6 = v5;
    objc_msgSend(&unk_1E6AF5F90, "enumerateObjectsUsingBlock:", v8);

  }
}

void __40__PLArchiveManager_deprecateTablesCESQL__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE '%@';"), a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "performQuery:", v4);

}

- (void)deprecateTablesBGSQL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLArchiveManager::trimBGSQL: disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __40__PLArchiveManager_deprecateTablesBGSQL__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE '%@';"), a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "performQuery:", v4);

}

- (BOOL)isInterrupted
{
  PLArchiveManager *v2;
  BOOL interrupted;

  v2 = self;
  objc_sync_enter(v2);
  interrupted = v2->_interrupted;
  objc_sync_exit(v2);

  return interrupted;
}

- (void)handleFailure:(int64_t)a3 forArchiveEntry:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;

  v5 = a4;
  PLLogArchiving();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[PLArchiveManager handleFailure:forArchiveEntry:].cold.1(a3, v5, v6);

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
    v10 = 1004;
  else
    v10 = 1001;
  if (a3)
    v11 = v10;
  else
    v11 = 1003;
  +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", v11, v9);

}

- (void)scheduleArchiveJobs
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_8_2(a1, a2), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_5_2(&dword_1B6AB6000, v5, v6, "PLArchiveManager::scheduleArchiveJobs: scheduled archiveEntry=%@");

  OUTLINED_FUNCTION_10_0();
}

- (void)runArchiveJobs
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLArchiveManager::runJobs: vacuuming", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __34__PLArchiveManager_runArchiveJobs__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "connection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vacuum");

}

- (void)trimCleanEnergyLog
{
  NSObject *v3;
  NSObject *v4;
  double v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  PLLogArchiving();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimCESQL: start", buf, 2u);
  }

  if (-[PLArchiveManager isInterrupted](self, "isInterrupted"))
  {
    PLLogArchiving();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimCESQL: interrupted", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v4 = objc_claimAutoreleasedReturnValue();
    -[PLArchiveManager CESQLDBDuration](self, "CESQLDBDuration");
    -[NSObject dateByAddingTimeInterval:](v4, "dateByAddingTimeInterval:", -v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightBeforeDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogArchiving();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimCESQL: trimDate=%@", buf, 0xCu);
    }

    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLArchiveJob storageQueue](PLArchiveJob, "storageQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __38__PLArchiveManager_trimCleanEnergyLog__block_invoke;
    v19[3] = &unk_1E6A521A0;
    v12 = v9;
    v20 = v12;
    v21 = v7;
    v13 = v7;
    +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v10, v19);

    PLLogArchiving();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v14, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimCESQL: vacuum", buf, 2u);
    }

    +[PLArchiveManager storageQueue](PLArchiveManager, "storageQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __38__PLArchiveManager_trimCleanEnergyLog__block_invoke_301;
    v17[3] = &unk_1E6A52050;
    v18 = v12;
    v16 = v12;
    +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v15, v17);

  }
}

void __38__PLArchiveManager_trimCleanEnergyLog__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "trimConditionsForCESQLWithTrimDate:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "CESQLConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trimAllTablesFromDate:toDate:withTableFilters:", *(_QWORD *)(a1 + 40), 0, v3);

}

void __38__PLArchiveManager_trimCleanEnergyLog__block_invoke_301(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "CESQLConnection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vacuum");

}

- (void)trimExtendedPersistenceLog
{
  NSObject *v3;
  NSObject *v4;
  double v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  PLLogArchiving();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimEPSQL: start", buf, 2u);
  }

  if (-[PLArchiveManager isInterrupted](self, "isInterrupted"))
  {
    PLLogArchiving();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimEPSQL: interrupted", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v4 = objc_claimAutoreleasedReturnValue();
    -[PLArchiveManager EPSQLDBDuration](self, "EPSQLDBDuration");
    -[NSObject dateByAddingTimeInterval:](v4, "dateByAddingTimeInterval:", -v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogArchiving();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimEPSQL: trimDate=%@", buf, 0xCu);
    }

    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLArchiveJob storageQueue](PLArchiveJob, "storageQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__PLArchiveManager_trimExtendedPersistenceLog__block_invoke;
    v17[3] = &unk_1E6A521A0;
    v11 = v8;
    v18 = v11;
    v12 = v6;
    v19 = v12;
    +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v9, v17);

    if (-[PLArchiveManager eliglibleToVacuumEPSQLForDate:](self, "eliglibleToVacuumEPSQLForDate:", v4)
      && !-[PLArchiveManager isInterrupted](self, "isInterrupted"))
    {
      PLLogArchiving();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6AB6000, v13, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimEPSQL: vacuum", buf, 2u);
      }

      +[PLArchiveManager storageQueue](PLArchiveManager, "storageQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __46__PLArchiveManager_trimExtendedPersistenceLog__block_invoke_302;
      v15[3] = &unk_1E6A52050;
      v16 = v11;
      +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v14, v15);

      -[PLArchiveManager setLastEPSQLVacuumDate:](self, "setLastEPSQLVacuumDate:", v4);
    }

  }
}

void __46__PLArchiveManager_trimExtendedPersistenceLog__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "trimConditionsForEPSQLWithTrimDate:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "EPSQLConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trimAllTablesFromDate:toDate:withTableFilters:", *(_QWORD *)(a1 + 40), 0, v3);

}

void __46__PLArchiveManager_trimExtendedPersistenceLog__block_invoke_302(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "EPSQLConnection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vacuum");

}

- (void)trimBackgroundProcessingLog
{
  char v3;
  NSObject *v4;
  NSObject *v5;
  double v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = _os_feature_enabled_impl();
  PLLogArchiving();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimBGSQL: start", buf, 2u);
    }

    if (-[PLArchiveManager isInterrupted](self, "isInterrupted"))
    {
      PLLogArchiving();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimBGSQL: interrupted", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v5 = objc_claimAutoreleasedReturnValue();
      -[PLArchiveManager BGSQLDBDuration](self, "BGSQLDBDuration");
      -[NSObject dateByAddingTimeInterval:](v5, "dateByAddingTimeInterval:", -v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogArchiving();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimBGSQL: trimDate=%@", buf, 0xCu);
      }

      +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLArchiveJob storageQueue](PLArchiveJob, "storageQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __47__PLArchiveManager_trimBackgroundProcessingLog__block_invoke;
      v19[3] = &unk_1E6A521A0;
      v12 = v9;
      v20 = v12;
      v21 = v7;
      v13 = v7;
      +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v10, v19);

      PLLogArchiving();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6AB6000, v14, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::trimBGSQL: vacuum", buf, 2u);
      }

      +[PLArchiveManager storageQueue](PLArchiveManager, "storageQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v11;
      v17[1] = 3221225472;
      v17[2] = __47__PLArchiveManager_trimBackgroundProcessingLog__block_invoke_303;
      v17[3] = &unk_1E6A52050;
      v18 = v12;
      v16 = v12;
      +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v15, v17);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[PLArchiveManager deprecateTablesBGSQL].cold.1();
  }

}

void __47__PLArchiveManager_trimBackgroundProcessingLog__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "trimConditionsForBGSQLWithTrimDate:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "BGSQLConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trimAllTablesFromDate:toDate:withTableFilters:", *(_QWORD *)(a1 + 40), 0, v3);

}

void __47__PLArchiveManager_trimBackgroundProcessingLog__block_invoke_303(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "BGSQLConnection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vacuum");

}

- (BOOL)eliglibleToVacuumEPSQLForDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLArchiveManager lastEPSQLVacuumDate](self, "lastEPSQLVacuumDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PLLogArchiving();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLArchiveManager eliglibleToVacuumEPSQLForDate:].cold.1();
    goto LABEL_7;
  }
  if (-[PLArchiveManager monotonicResetOccurred](self, "monotonicResetOccurred"))
  {
    PLLogArchiving();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_INFO, "PLArchiveManager::trimEPSQL: Restarting after monotonic reset %@", (uint8_t *)&v13, 0xCu);
    }
LABEL_7:

    -[PLArchiveManager setLastEPSQLVacuumDate:](self, "setLastEPSQLVacuumDate:", v4);
    goto LABEL_8;
  }
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v10 = v9;
  -[PLArchiveManager EPSQLVacuumInterval](self, "EPSQLVacuumInterval");
  if (v10 >= v11)
  {
    v7 = 1;
    goto LABEL_9;
  }
  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PLArchiveManager eliglibleToVacuumEPSQLForDate:].cold.2();

LABEL_8:
  v7 = 0;
LABEL_9:

  return v7;
}

- (void)cleanup
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  PLArchiveManager *v38;
  void *v39;
  uint64_t v40;
  id obj;
  void *v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "storageLocked");

  if ((v5 & 1) == 0)
  {
    PLLogArchiving();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::cleanup: start", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v9, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    +[PLArchiveManager archiveEntriesFinished](PLArchiveManager, "archiveEntriesFinished");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v50;
      v37 = v10;
      v38 = self;
      v36 = *(_QWORD *)v50;
      do
      {
        v14 = 0;
        v40 = v12;
        do
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v14);
          objc_msgSend(v15, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "timeIntervalSinceDate:", v16);
          v18 = v17;
          -[PLArchiveManager archiveRetention](self, "archiveRetention");
          v20 = v19;

          if (v18 > v20)
          {
            v44 = v14;
            PLLogArchiving();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v15, "uuid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v55 = v22;
              _os_log_impl(&dword_1B6AB6000, v21, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::cleanup: removing archiveEntry=%@", buf, 0xCu);

            }
            v23 = (void *)MEMORY[0x1E0CB3880];
            v43 = v15;
            objc_msgSend(v15, "uuid");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "predicateWithFormat:", CFSTR("SELF CONTAINS %@"), v24);
            v25 = objc_claimAutoreleasedReturnValue();

            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v42 = (void *)v25;
            objc_msgSend(v39, "filteredArrayUsingPredicate:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v46 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
                  +[PLUtilities containerPath](PLUtilities, "containerPath");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "stringByAppendingPathComponent:", v31);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "removeItemAtPath:error:", v34, 0);

                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
              }
              while (v28);
            }

            v10 = v37;
            objc_msgSend(v43, "setRemovedDate:", v37);

            self = v38;
            v13 = v36;
            v12 = v40;
            v14 = v44;
          }
          ++v14;
        }
        while (v14 != v12);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v12);
    }

    PLLogArchiving();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v35, OS_LOG_TYPE_DEFAULT, "PLArchiveManager::cleanup: done", buf, 2u);
    }

  }
}

- (void)recover
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _QWORD block[5];

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "storageLocked");

  if ((v5 & 1) == 0)
  {
    +[PLArchiveManager workQueue](PLArchiveManager, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__PLArchiveManager_recover__block_invoke;
    block[3] = &unk_1E6A52050;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

void __27__PLArchiveManager_recover__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PLArchiveJob *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[16];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PLLogArchiving();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __27__PLArchiveManager_recover__block_invoke_cold_3();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[PLArchiveManager archiveEntriesUnfinished](PLArchiveManager, "archiveEntriesUnfinished", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        PLLogArchiving();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __27__PLArchiveManager_recover__block_invoke_cold_2((uint64_t)v17, v7);

        objc_msgSend(*(id *)(a1 + 32), "archiveJobs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v9);
        objc_msgSend(*(id *)(a1 + 32), "archiveJobs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[PLArchiveJob initWithManager:andArchiveEntry:]([PLArchiveJob alloc], "initWithManager:andArchiveEntry:", *(_QWORD *)(a1 + 32), v7);
        objc_msgSend(v10, "addObject:", v11);

        objc_sync_exit(v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v4);
  }

  PLLogArchiving();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __27__PLArchiveManager_recover__block_invoke_cold_1();

}

- (void)migrateArchive:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  PLArchiveEntry *v19;
  void *v20;
  void *v21;
  void *v22;
  PLValueComparison *v23;
  void *v24;
  PLValueComparison *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  PLArchiveEntry *v50;
  void *v51;
  void *v52;
  PLValueComparison *v53;
  _QWORD v54[5];
  _QWORD block[5];
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PLUtilities extractDateStringAndUUIDStringFromFilePath:](PLUtilities, "extractDateStringAndUUIDStringFromFilePath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "count") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid archivePath=%@"), v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveManager.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLArchiveManager migrateArchive:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v21, v22, 874);

    PLLogCommon();
    v19 = (PLArchiveEntry *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v19->super.super, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
    goto LABEL_34;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("Library/BatteryLife/Archives/powerlog_metadata_%@_%@.txt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v12, "fileExistsAtPath:", v11);

  if ((_DWORD)v8)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v13 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__PLArchiveManager_migrateArchive___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v13;
      if (migrateArchive__defaultOnce != -1)
        dispatch_once(&migrateArchive__defaultOnce, block);
      if (migrateArchive__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLArchiveManager::migrateArchive: archive with metadata:%@"), v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveManager.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLArchiveManager migrateArchive:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v16, v17, 883);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v19 = -[PLArchiveEntry initWithMetadata:]([PLArchiveEntry alloc], "initWithMetadata:", v11);
    goto LABEL_33;
  }
  v23 = [PLValueComparison alloc];
  objc_msgSend(v5, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:](v23, "initWithKey:withValue:withComparisonOperation:", CFSTR("UUID"), v24, 0);

  v56[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLArchiveManager archiveEntriesWithComparisons:](PLArchiveManager, "archiveEntriesWithComparisons:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27 && objc_msgSend(v27, "count"))
  {

    v19 = 0;
    goto LABEL_34;
  }
  v53 = v25;
  v52 = v27;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v28 = objc_opt_class();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __35__PLArchiveManager_migrateArchive___block_invoke_320;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v28;
    if (migrateArchive__defaultOnce_318 != -1)
      dispatch_once(&migrateArchive__defaultOnce_318, v54);
    if (migrateArchive__classDebugEnabled_319)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLArchiveManager::migrateArchive: archive without metadata:%@"), v3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveManager.m");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLArchiveManager migrateArchive:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v31, v32, 897);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(v5, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "length");
  v36 = objc_msgSend(CFSTR("yyyy-MM-dd"), "length");

  if (v35 >= v36)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "defaultDateFormatter");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "substringToIndex:", objc_msgSend(CFSTR("yyyy-MM-dd"), "length"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dateFromString:", v48);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "dateByAddingTimeInterval:", 86400.0);
    v49 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v49;
    if (v38 && v49)
    {
      v50 = [PLArchiveEntry alloc];
      objc_msgSend(v38, "convertFromSystemToMonotonic");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "convertFromSystemToMonotonic");
      v43 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PLArchiveEntry initWithStartDate:endDate:andUUID:](v50, "initWithStartDate:endDate:andUUID:", v39, v43, v51);

      v45 = v52;
      v44 = 1;
      goto LABEL_32;
    }
  }
  else
  {
    v37 = 0;
    v38 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid startDate=%@, endDate=%@"), v38, v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveManager.m");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "lastPathComponent");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLArchiveManager migrateArchive:]");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v41, v42, 906);

  PLLogCommon();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
  v19 = 0;
  v44 = 0;
  v45 = v52;
LABEL_32:

  if (v44)
LABEL_33:
    -[PLArchiveEntry setStage:](v19, "setStage:", 5);
LABEL_34:

}

BOOL __35__PLArchiveManager_migrateArchive___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  migrateArchive__classDebugEnabled = result;
  return result;
}

BOOL __35__PLArchiveManager_migrateArchive___block_invoke_320(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  migrateArchive__classDebugEnabled_319 = result;
  return result;
}

- (void)migrate
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _QWORD block[5];

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "storageLocked");

  if ((v5 & 1) == 0)
  {
    +[PLArchiveManager workQueue](PLArchiveManager, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__PLArchiveManager_migrate__block_invoke;
    block[3] = &unk_1E6A52050;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

void __27__PLArchiveManager_migrate__block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _UNKNOWN **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _UNKNOWN **v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  _QWORD block[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  PLLogArchiving();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __27__PLArchiveManager_migrate__block_invoke_cold_2();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        +[PLUtilities containerPath](PLUtilities, "containerPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingString:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v10, "hasSuffix:", CFSTR(".PLSQL")) & 1) != 0
          || (objc_msgSend(CFSTR(".PLSQL"), "stringByAppendingString:", CFSTR(".gz")),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v10, "hasSuffix:", v14),
              v14,
              v15))
        {
          objc_msgSend(*(id *)(a1 + 32), "migrateArchive:", v13);
        }
        else
        {
          objc_msgSend(v35, "addObject:", v13);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v7);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v35;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  v18 = 0x1E0CB3000;
  if (v17)
  {
    v19 = v17;
    v20 = &off_1E6A51000;
    v21 = *(_QWORD *)v40;
    do
    {
      v22 = 0;
      v36 = v19;
      do
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v16);
        v23 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v22);
        if (objc_msgSend(v20[28], "debugEnabled"))
        {
          v24 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __27__PLArchiveManager_migrate__block_invoke_331;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v24;
          if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_4 != -1)
            dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_4, block);
          if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_4)
          {
            v25 = v21;
            v26 = v20;
            v27 = v16;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLArchiveManager::migrate: removing filepath:%@"), v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveManager.m");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "lastPathComponent");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLArchiveManager migrate]_block_invoke_2");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v30, v31, 939);

            PLLogCommon();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v28;
              _os_log_debug_impl(&dword_1B6AB6000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v18 = 0x1E0CB3000uLL;
            v16 = v27;
            v20 = v26;
            v21 = v25;
            v19 = v36;
          }
        }
        objc_msgSend(*(id *)(v18 + 1568), "defaultManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "removeItemAtPath:error:", v23, 0);

        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v19);
  }

  PLLogArchiving();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    __27__PLArchiveManager_migrate__block_invoke_cold_1();

}

BOOL __27__PLArchiveManager_migrate__block_invoke_331(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_4 = result;
  return result;
}

+ (void)systemTimeChangedByOffset:(double)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "storageLocked");

  if ((v6 & 1) == 0)
  {
    PLLogArchiving();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[PLArchiveManager systemTimeChangedByOffset:].cold.2();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    +[PLArchiveManager archiveEntriesFinished](PLArchiveManager, "archiveEntriesFinished", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "systemTimeOffset");
          objc_msgSend(v13, "setSystemTimeOffset:", v14 + a3);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    PLLogArchiving();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[PLArchiveManager systemTimeChangedByOffset:].cold.1();

  }
}

+ (id)lastArchivePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "archiveEntriesFinished");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "count"))
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compressedPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)allArchivePaths
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "archiveEntriesFinished", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "compressedPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)archiveEntriesUnfinished
{
  PLValueComparison *v2;
  PLValueComparison *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:]([PLValueComparison alloc], "initWithKey:withValue:withComparisonOperation:", CFSTR("Stage"), &unk_1E6ABB138, 4);
  v3 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:]([PLValueComparison alloc], "initWithKey:withValue:withComparisonOperation:", CFSTR("RemovedDate"), &unk_1E6ABB150, 0);
  v7[0] = v2;
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLArchiveManager archiveEntriesWithComparisons:](PLArchiveManager, "archiveEntriesWithComparisons:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)archiveEntriesFinished
{
  PLValueComparison *v2;
  PLValueComparison *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:]([PLValueComparison alloc], "initWithKey:withValue:withComparisonOperation:", CFSTR("Stage"), &unk_1E6ABB138, 0);
  v3 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:]([PLValueComparison alloc], "initWithKey:withValue:withComparisonOperation:", CFSTR("RemovedDate"), &unk_1E6ABB150, 0);
  v7[0] = v2;
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLArchiveManager archiveEntriesWithComparisons:](PLArchiveManager, "archiveEntriesWithComparisons:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)archiveEntriesWithComparisons:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLArchiveEntry entryKey](PLArchiveEntry, "entryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entriesForKey:withComparisons:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)registerForArchivingNotificationUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    PLLogArchiving();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PLArchiveManager registerForArchivingNotificationUsingBlock:].cold.1();

    +[PLArchiveManager workQueue](PLArchiveManager, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__PLArchiveManager_registerForArchivingNotificationUsingBlock___block_invoke;
    v7[3] = &unk_1E6A525F8;
    v7[4] = self;
    v8 = v4;
    dispatch_async_and_wait(v6, v7);

  }
}

void __63__PLArchiveManager_registerForArchivingNotificationUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "notificationBlocks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1BCC9EB70](*(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "addObject:", v2);

}

- (NSDate)lastEPSQLVacuumDate
{
  double v2;
  void *v3;

  +[PLDefaults doubleForKey:](PLDefaults, "doubleForKey:", CFSTR("LastEPSQLVacuumDate"));
  if (v2 == 0.0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v3;
}

- (void)setLastEPSQLVacuumDate:(id)a3
{
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSince1970");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v4, CFSTR("LastEPSQLVacuumDate"), 1);

  }
  else
  {
    +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("LastEPSQLVacuumDate"), 1);
  }
  self->_monotonicResetOccurred = 0;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)mustRunInterval
{
  return self->_mustRunInterval;
}

- (void)setMustRunInterval:(double)a3
{
  self->_mustRunInterval = a3;
}

- (double)archiveRetention
{
  return self->_archiveRetention;
}

- (void)setArchiveRetention:(double)a3
{
  self->_archiveRetention = a3;
}

- (double)PLSQLDBDuration
{
  return self->_PLSQLDBDuration;
}

- (void)setPLSQLDBDuration:(double)a3
{
  self->_PLSQLDBDuration = a3;
}

- (double)CESQLDBDuration
{
  return self->_CESQLDBDuration;
}

- (void)setCESQLDBDuration:(double)a3
{
  self->_CESQLDBDuration = a3;
}

- (double)EPSQLDBDuration
{
  return self->_EPSQLDBDuration;
}

- (void)setEPSQLDBDuration:(double)a3
{
  self->_EPSQLDBDuration = a3;
}

- (double)EPSQLVacuumInterval
{
  return self->_EPSQLVacuumInterval;
}

- (void)setEPSQLVacuumInterval:(double)a3
{
  self->_EPSQLVacuumInterval = a3;
}

- (double)XCSQLDBDuration
{
  return self->_XCSQLDBDuration;
}

- (void)setXCSQLDBDuration:(double)a3
{
  self->_XCSQLDBDuration = a3;
}

- (double)BGSQLDBDuration
{
  return self->_BGSQLDBDuration;
}

- (void)setBGSQLDBDuration:(double)a3
{
  self->_BGSQLDBDuration = a3;
}

- (NSMutableArray)archiveJobs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setArchiveJobs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (NSMutableArray)notificationBlocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNotificationBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)monotonicResetOccurred
{
  return self->_monotonicResetOccurred;
}

- (void)setMonotonicResetOccurred:(BOOL)a3
{
  self->_monotonicResetOccurred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationBlocks, 0);
  objc_storeStrong((id *)&self->_archiveJobs, 0);
}

- (void)handleFailure:(NSObject *)a3 forArchiveEntry:.cold.1(int a1, void *a2, NSObject *a3)
{
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = a1;
  v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_1B6AB6000, a3, OS_LOG_TYPE_ERROR, "PLArchiveManager::handleFailure:forArchive: failureType=%i, archiveEntry=%@", (uint8_t *)v6, 0x12u);

}

- (void)eliglibleToVacuumEPSQLForDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLArchiveManager::trimEPSQL: No preset last vacuum date", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)eliglibleToVacuumEPSQLForDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "PLArchiveManager::trimEPSQL: Insufficient time for vacuum since %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __27__PLArchiveManager_recover__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLArchiveManager::recover: done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __27__PLArchiveManager_recover__block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_8_2(a1, a2), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_5_2(&dword_1B6AB6000, v5, v6, "PLArchiveManager::recover unfinishedArchiveEntry=%@");

  OUTLINED_FUNCTION_10_0();
}

void __27__PLArchiveManager_recover__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLArchiveManager::recover: start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __27__PLArchiveManager_migrate__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLArchiveManager::migrate: done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __27__PLArchiveManager_migrate__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLArchiveManager::migrate: start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)systemTimeChangedByOffset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLArchiveManager::systemTimeChangedByOffset: done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)systemTimeChangedByOffset:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLArchiveManager::systemTimeChangedByOffset: start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)registerForArchivingNotificationUsingBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "registered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
