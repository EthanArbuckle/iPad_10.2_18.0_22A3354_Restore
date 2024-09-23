@implementation REMDatabaseMigrationContext

- (REMDatabaseMigrationContext)init
{
  void *v3;
  uint64_t v4;

  +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "databaseMigrationTestModeEnabled");

  return -[REMDatabaseMigrationContext initWithSandboxDatabaseEnabled:](self, "initWithSandboxDatabaseEnabled:", v4);
}

- (REMDatabaseMigrationContext)initWithSandboxDatabaseEnabled:(BOOL)a3
{
  _BOOL4 v3;
  REMDatabaseMigrationContext *v4;
  BOOL v5;
  uint64_t v6;
  id v7;
  REMStoreContainerToken *containerToken;
  REMDatabaseMigrationContext *v9;
  NSObject *v11;
  id v12;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)REMDatabaseMigrationContext;
  v4 = -[REMDatabaseMigrationContext init](&v13, sel_init);
  if (v4)
    v5 = !v3;
  else
    v5 = 1;
  if (v5)
    goto LABEL_7;
  v12 = 0;
  +[REMStore createIsolatedStoreContainerWithError:](REMStore, "createIsolatedStoreContainerWithError:", &v12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  containerToken = v4->_containerToken;
  v4->_containerToken = (REMStoreContainerToken *)v6;

  if (v4->_containerToken)
  {

LABEL_7:
    v9 = v4;
    goto LABEL_8;
  }
  +[REMLogStore write](REMLogStore, "write");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[REMDatabaseMigrationContext initWithSandboxDatabaseEnabled:].cold.1();

  v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)shouldDeleteMigratedData
{
  void *v2;
  BOOL v3;

  -[REMDatabaseMigrationContext containerToken](self, "containerToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)isDatabaseMigrated
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[REMDatabaseMigrationContext containerToken](self, "containerToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[REMSystemUtilities systemBuildVersion](REMSystemUtilities, "systemBuildVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastDatabaseMigrationSystemBuildVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isEqual:", v5);

  }
  else
  {
    +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isDatabaseMigrated");
  }

  return v6;
}

- (void)setIsDatabaseMigrated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[REMDatabaseMigrationContext containerToken](self, "containerToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsDatabaseMigrated:", v3);

  }
}

- (void)setShouldDataAccessStopSyncingReminders:(BOOL)a3
{
  void *v3;
  id v4;

  -[REMDatabaseMigrationContext containerToken](self, "containerToken", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataaccessDaemonStopSyncingReminders");

  }
}

- (id)remStore
{
  REMStore *v3;
  void *v4;
  REMStore *v5;
  void *v6;
  REMStore *v7;

  -[REMDatabaseMigrationContext cachedStore](self, "cachedStore");
  v3 = (REMStore *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[REMDatabaseMigrationContext containerToken](self, "containerToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = [REMStore alloc];
      -[REMDatabaseMigrationContext containerToken](self, "containerToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[REMStore initWithStoreContainerToken:](v5, "initWithStoreContainerToken:", v6);

    }
    else
    {
      v3 = objc_alloc_init(REMStore);
    }

    -[REMStore setMode:](v3, "setMode:", 1);
    -[REMDatabaseMigrationContext setCachedStore:](self, "setCachedStore:", v3);
  }
  v7 = v3;

  return v7;
}

- (void)destroySandboxContainerIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Failed to destroy isolated store container for database migration {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)dealloc
{
  objc_super v3;

  -[REMDatabaseMigrationContext destroySandboxContainerIfNecessary](self, "destroySandboxContainerIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)REMDatabaseMigrationContext;
  -[REMDatabaseMigrationContext dealloc](&v3, sel_dealloc);
}

- (void)reportMigrationWillBegin
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  +[REMLogStore write](REMLogStore, "write");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B4A39000, v3, OS_LOG_TYPE_DEFAULT, "Database Migration will begin", v5, 2u);
  }

  AnalyticsSendEvent();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDatabaseMigrationContext setMigrationStartDate:](self, "setMigrationStartDate:", v4);

}

- (void)reportMigrationErrorWithIdentifier:(id)a3 atStage:(unint64_t)a4 error:(id)a5 objectLocator:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  +[REMLogStore OVERSIZED](REMLogStore, "OVERSIZED");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if (a4 - 1 > 5)
      v14 = CFSTR("REMDatabaseMigrationContextStageUnknown");
    else
      v14 = off_1E67F9E90[a4 - 1];
    objc_msgSend(v10, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = v9;
    v21 = 2114;
    v22 = v14;
    v23 = 2114;
    v24 = v10;
    v25 = 2112;
    v26 = v16;
    _os_log_error_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_ERROR, "Migration Error {identifier: %{public}@, stage: %{public}@, error: %{public}@, error.debugDescription: %@}", buf, 0x2Au);

  }
  v18 = v10;
  v17 = v9;
  v12 = v10;
  v13 = v9;
  AnalyticsSendEventLazy();
  -[REMDatabaseMigrationContext setLastReportedErrorIdentifier:](self, "setLastReportedErrorIdentifier:", v13);
  -[REMDatabaseMigrationContext setLastReportedError:](self, "setLastReportedError:", v12);
  -[REMDatabaseMigrationContext setLastReportedErrorStage:](self, "setLastReportedErrorStage:", a4);

}

id __94__REMDatabaseMigrationContext_reportMigrationErrorWithIdentifier_atStage_error_objectLocator___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("stage"));

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("errorCode"));

  }
  return v2;
}

- (void)_postMigrationLocalAccountCleanup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "_postMigrationLocalAccountCleanup: Failed to save account objects for local migration {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)reportMigrationDidFinishWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  _BOOL4 v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[REMDatabaseMigrationContext migrationStartDate](self, "migrationStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;

  +[REMLogStore write](REMLogStore, "write");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v21 = v3;
    v22 = 2048;
    v23 = v7;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_DEFAULT, "Database Migration did finish {success: %d, duration: %.2f}", buf, 0x12u);
  }

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __67__REMDatabaseMigrationContext_reportMigrationDidFinishWithSuccess___block_invoke;
  v17 = &__block_descriptor_41_e19___NSDictionary_8__0l;
  LOBYTE(v19) = v3;
  v18 = v7;
  AnalyticsSendEventLazy();
  if (!v3)
  {
    v9 = -[REMDatabaseMigrationContext lastReportedErrorStage](self, "lastReportedErrorStage", v14, 3221225472, __67__REMDatabaseMigrationContext_reportMigrationDidFinishWithSuccess___block_invoke, &__block_descriptor_41_e19___NSDictionary_8__0l, v7, v19);
    -[REMDatabaseMigrationContext lastReportedErrorIdentifier](self, "lastReportedErrorIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDatabaseMigrationContext lastReportedError](self, "lastReportedError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDatabaseMigrationContext _diagnosticReportWithStage:failureIdentifier:error:](self, "_diagnosticReportWithStage:failureIdentifier:error:", v9, v10, v11);

  }
  -[REMDatabaseMigrationContext setIsDatabaseMigrated:](self, "setIsDatabaseMigrated:", 1, v14, v15, v16, v17, v18, v19);
  -[REMDatabaseMigrationContext setShouldDataAccessStopSyncingReminders:](self, "setShouldDataAccessStopSyncingReminders:", 1);
  +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMSystemUtilities systemBuildVersion](REMSystemUtilities, "systemBuildVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLastDatabaseMigrationSystemBuildVersion:", v13);

  -[REMDatabaseMigrationContext _postMigrationLocalAccountCleanup](self, "_postMigrationLocalAccountCleanup");
}

id __67__REMDatabaseMigrationContext_reportMigrationDidFinishWithSuccess___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("duration");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fabs(*(double *)(a1 + 32)));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_diagnosticReportWithStage:(unint64_t)a3 failureIdentifier:(id)a4 error:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0DAFF28];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  if (a3 - 1 > 5)
    v11 = CFSTR("REMDatabaseMigrationContextStageUnknown");
  else
    v11 = off_1E67F9E90[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "processName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("ReminderKit"), CFSTR("EventKitMigration"), v11, v9, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v18[0] = CFSTR("errorDomain");
    objc_msgSend(v7, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("errorCode");
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "code"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v10, "snapshotWithSignature:duration:event:payload:reply:", v14, v17, 0, &__block_literal_global_18, 0.0);

}

void __82__REMDatabaseMigrationContext__diagnosticReportWithStage_failureIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[REMLogStore write](REMLogStore, "write");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B4A39000, v3, OS_LOG_TYPE_DEFAULT, "AutoBugCapture did reply {response: %@}", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)ensureAccountsExistWithMigrationAccountInfos:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  void *v36;
  NSObject *v37;
  id *v39;
  id v40;
  NSObject *v41;
  REMSaveRequest *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id obj;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[16];
  _BYTE v54[16];
  _BYTE v55[16];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[REMDatabaseMigrationContext hasPerformedEnsureAccountsExist](self, "hasPerformedEnsureAccountsExist"))
  {
    v7 = 1;
    goto LABEL_49;
  }
  if (-[REMDatabaseMigrationContext isDatabaseMigrated](self, "isDatabaseMigrated"))
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "ensureAccountsExist: There is no need to clean local database before we ensure accounts exist for local migration.";
LABEL_8:
      _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
    }
  }
  else
  {
    -[REMDatabaseMigrationContext _cleanLocalDatabases:](self, "_cleanLocalDatabases:", a4);
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "ensureAccountsExist: Finished calling [_cleanLocalDatabases]";
      goto LABEL_8;
    }
  }

  -[REMDatabaseMigrationContext setHasPerformedEnsureAccountsExist:](self, "setHasPerformedEnsureAccountsExist:", 1);
  if (objc_msgSend(v6, "count"))
  {
    v39 = a4;
    -[REMDatabaseMigrationContext remStore](self, "remStore");
    v10 = objc_claimAutoreleasedReturnValue();
    v42 = -[REMSaveRequest initWithStore:]([REMSaveRequest alloc], "initWithStore:", v10);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v40 = v6;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v50;
      v44 = *(_QWORD *)v50;
      v41 = v10;
      do
      {
        v14 = 0;
        v45 = v12;
        do
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v14);
          v16 = objc_msgSend(v15, "type");
          +[REMLogStore write](REMLogStore, "write");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
          if (v16 == 1)
          {
            if (v18)
            {
              objc_msgSend(v15, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v57 = v19;
              v58 = 2112;
              v59 = v20;
              _os_log_impl(&dword_1B4A39000, v17, OS_LOG_TYPE_INFO, "ensureAccountsExist: Local account is ignored {accountID: %{public}@, name: %@}", buf, 0x16u);

            }
          }
          else
          {
            if (v18)
            {
              objc_msgSend(v15, "identifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v15, "type");
              *(_DWORD *)buf = 138543874;
              v57 = v21;
              v58 = 2112;
              v59 = v22;
              v60 = 2048;
              v61 = v23;
              _os_log_impl(&dword_1B4A39000, v17, OS_LOG_TYPE_INFO, "ensureAccountsExist: About to add account per request {accountID: %{public}@, name: %@, type: %ld}", buf, 0x20u);

              v13 = v44;
            }

            objc_msgSend(v15, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = 0;
            v25 = v10;
            -[NSObject fetchAccountWithExternalIdentifier:error:](v10, "fetchAccountWithExternalIdentifier:error:", v24, &v48);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v48;

            if (v26)
            {
              +[REMLogStore write](REMLogStore, "write");
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                -[REMDatabaseMigrationContext ensureAccountsExistWithMigrationAccountInfos:error:].cold.4((uint64_t)v55, (uint64_t)v15);
            }
            else
            {
              objc_msgSend(v15, "name");
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = objc_alloc(MEMORY[0x1E0CB3A28]);
              objc_msgSend(v15, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)objc_msgSend(v28, "initWithUUIDString:", v29);

              if (v30)
              {
                v43 = v30;
                +[REMAccount objectIDWithUUID:](REMAccount, "objectIDWithUUID:", v30);
                v31 = objc_claimAutoreleasedReturnValue();
                -[REMSaveRequest __addAccountWithType:name:accountObjectID:](v42, "__addAccountWithType:name:accountObjectID:", objc_msgSend(v15, "type"), v27, v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v15, "isCloudKit") & 1) != 0)
                {
                  +[REMLogStore write](REMLogStore, "write");
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    -[REMDatabaseMigrationContext ensureAccountsExistWithMigrationAccountInfos:error:].cold.3((uint64_t)v53, (uint64_t)v15);
                }
                else
                {
                  objc_msgSend(v15, "identifier");
                  v33 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setExternalIdentifier:", v33);
                }

                v25 = v41;
                v13 = v44;
                v30 = v43;
              }
              else
              {
                +[REMLogStore write](REMLogStore, "write");
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  -[REMDatabaseMigrationContext ensureAccountsExistWithMigrationAccountInfos:error:].cold.2((uint64_t)v54, (uint64_t)v15);
                v13 = v44;
              }

            }
            v12 = v45;
            v10 = v25;
          }

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
      }
      while (v12);
    }

    +[REMLogStore write](REMLogStore, "write");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4A39000, v34, OS_LOG_TYPE_INFO, "ensureAccountsExist: About to save pending changes to our database", buf, 2u);
    }

    v47 = 0;
    -[REMSaveRequest saveSynchronouslyWithError:](v42, "saveSynchronouslyWithError:", &v47);
    v35 = v47;
    v36 = v35;
    v7 = v35 == 0;
    if (v35)
    {
      if (v39)
        *v39 = objc_retainAutorelease(v35);
      +[REMLogStore write](REMLogStore, "write");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[REMDatabaseMigrationContext ensureAccountsExistWithMigrationAccountInfos:error:].cold.1();

    }
    v6 = v40;
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_DEFAULT, "ensureAccountsExist: There's no input account info. There's nothing we need to do.", buf, 2u);
    }
    v7 = 1;
  }

LABEL_49:
  return v7;
}

- (BOOL)ensureAccountsExist:(id)a3 error:(id *)a4
{
  void *v6;

  -[REMDatabaseMigrationContext _migrationAccountInfosFromDEPRECATEDInfoDictionaryList:](self, "_migrationAccountInfosFromDEPRECATEDInfoDictionaryList:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[REMDatabaseMigrationContext ensureAccountsExistWithMigrationAccountInfos:error:](self, "ensureAccountsExistWithMigrationAccountInfos:error:", v6, a4);

  return (char)a4;
}

- (BOOL)ensureAccountsExist:(id *)a3
{
  NSObject *v3;

  +[REMLogStore write](REMLogStore, "write", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[REMDatabaseMigrationContext ensureAccountsExist:].cold.1(v3);

  return 0;
}

- (id)_migrationAccountInfosFromDEPRECATEDInfoDictionaryList:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  REMDatabaseMigrationAccountInfo *v18;
  void *v19;
  NSObject *p_super;
  const char *v21;
  uint64_t v22;
  id v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    v26 = 1;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v7);
        v9 = objc_opt_class();
        objc_msgSend(v8, "objectForKey:", CFSTR("identifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        REMDynamicCast(v9, (uint64_t)v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_opt_class();
        objc_msgSend(v8, "objectForKey:", CFSTR("name"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        REMDynamicCast(v12, (uint64_t)v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_opt_class();
        objc_msgSend(v8, "objectForKey:", CFSTR("type"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        REMDynamicCast(v15, (uint64_t)v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          +[REMLogStore write](REMLogStore, "write");
          v18 = (REMDatabaseMigrationAccountInfo *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR))
            goto LABEL_12;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v19;
          v33 = 2112;
          v34 = v8;
          p_super = &v18->super;
          v21 = "ensureAccountsExist: Given account info #(%{public}@) does not contain an identifier: %@";
          goto LABEL_15;
        }
        if (v17)
        {
          v18 = -[REMDatabaseMigrationAccountInfo initWithAccountType:identifier:name:]([REMDatabaseMigrationAccountInfo alloc], "initWithAccountType:identifier:name:", objc_msgSend(v17, "unsignedIntegerValue"), v11, v14);
          objc_msgSend(v24, "addObject:", v18);
          ++v26;
          goto LABEL_12;
        }
        +[REMLogStore write](REMLogStore, "write");
        v18 = (REMDatabaseMigrationAccountInfo *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v19;
          v33 = 2112;
          v34 = v8;
          p_super = &v18->super;
          v21 = "ensureAccountsExist: Given account info #(%{public}@) does not contain an account type: %@";
LABEL_15:
          _os_log_error_impl(&dword_1B4A39000, p_super, OS_LOG_TYPE_ERROR, v21, buf, 0x16u);

        }
LABEL_12:

        ++v7;
      }
      while (v5 != v7);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      v5 = v22;
    }
    while (v22);
  }

  return v24;
}

- (BOOL)_cleanLocalDatabases:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  BOOL v37;
  id v38;
  id *v40;
  BOOL v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  REMSaveRequest *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  _BYTE v61[128];
  char v62[16];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  -[REMDatabaseMigrationContext remStore](self, "remStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  objc_msgSend(v4, "fetchAccountsIncludingInactive:error:", 1, &v60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v60;
  if (v6)
  {
    v7 = v6;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    +[REMLogStore write](REMLogStore, "write");
    v49 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v49->super, OS_LOG_TYPE_ERROR))
      -[REMDatabaseMigrationContext _cleanLocalDatabases:].cold.3();
    v8 = 0;
    goto LABEL_47;
  }
  v49 = -[REMSaveRequest initWithStore:]([REMSaveRequest alloc], "initWithStore:", v4);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v9 = v5;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  v8 = v10 == 0;
  if (!v10)
  {
    v38 = 0;
    goto LABEL_45;
  }
  v40 = a3;
  v41 = v10 == 0;
  v42 = v5;
  v43 = v4;
  v11 = 0;
  v7 = 0;
  v12 = *(_QWORD *)v57;
  v13 = 0x1E67F4000uLL;
  v14 = v10;
  v44 = *(_QWORD *)v57;
  v45 = v9;
  do
  {
    v15 = 0;
    v46 = v14;
    do
    {
      if (*(_QWORD *)v57 != v12)
        objc_enumerationMutation(v9);
      v48 = v15;
      v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v15);
      objc_msgSend(v16, "accountTypeHost");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if ((objc_msgSend(v17, "isCalDav") & 1) != 0 || objc_msgSend(v17, "isExchange"))
      {
        objc_msgSend(*(id *)(v13 + 3888), "write");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "name");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "externalIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v64 = v32;
          v65 = 2114;
          v66 = v33;
          v67 = 2114;
          v68 = v34;
          _os_log_error_impl(&dword_1B4A39000, v19, OS_LOG_TYPE_ERROR, "REMDatabaseMigrationContext found existing CalDAV account locally before migration, deleting store: {name: %@, id: %{public}@, externalIdentifier: %{public}@}", buf, 0x20u);

          v17 = v18;
          v14 = v46;
        }

        -[REMSaveRequest updateAccount:](v49, "updateAccount:", v16);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeFromStore");
        v11 = 1;
LABEL_17:

        goto LABEL_18;
      }
      if (objc_msgSend(v17, "isLocal"))
      {
        objc_msgSend(*(id *)(v13 + 3888), "write");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[REMDatabaseMigrationContext _cleanLocalDatabases:].cold.2((uint64_t)v62, (uint64_t)v16);

        v55 = v7;
        objc_msgSend(v16, "fetchListsWithError:", &v55);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v55;

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v20 = v22;
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v52 != v25)
                objc_enumerationMutation(v20);
              v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_msgSend(v27, "objectID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              +[REMList localAccountDefaultListID](REMList, "localAccountDefaultListID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v28, "isEqual:", v29);

              if ((v30 & 1) == 0)
              {
                -[REMSaveRequest updateList:](v49, "updateList:", v27);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "removeFromParent");

                v11 = 1;
              }
            }
            v17 = v18;
            v24 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          }
          while (v24);
        }

        v14 = v46;
        v7 = v47;
        v13 = 0x1E67F4000;
        v12 = v44;
        v9 = v45;
        goto LABEL_17;
      }
LABEL_18:

      v15 = v48 + 1;
    }
    while (v48 + 1 != v14);
    v35 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    v14 = v35;
  }
  while (v35);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(*(id *)(v13 + 3888), "write");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4A39000, v36, OS_LOG_TYPE_INFO, "_cleanLocalDatabases saving changes", buf, 2u);
    }

    v50 = v7;
    v37 = -[REMSaveRequest saveSynchronouslyWithError:](v49, "saveSynchronouslyWithError:", &v50);
    v38 = v50;

    v5 = v42;
    v4 = v43;
    v8 = v41;
    if (v37)
    {
      v8 = 1;
      goto LABEL_46;
    }
    if (v40)
      *v40 = objc_retainAutorelease(v38);
    +[REMLogStore write](REMLogStore, "write");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[REMDatabaseMigrationContext _cleanLocalDatabases:].cold.1();
LABEL_45:

LABEL_46:
    v7 = v38;
  }
  else
  {
    v8 = 1;
    v5 = v42;
    v4 = v43;
  }
LABEL_47:

  return v8;
}

- (REMStoreContainerToken)containerToken
{
  return self->_containerToken;
}

- (void)setContainerToken:(id)a3
{
  objc_storeStrong((id *)&self->_containerToken, a3);
}

- (REMStore)cachedStore
{
  return self->_cachedStore;
}

- (void)setCachedStore:(id)a3
{
  objc_storeStrong((id *)&self->_cachedStore, a3);
}

- (NSDate)migrationStartDate
{
  return self->_migrationStartDate;
}

- (void)setMigrationStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_migrationStartDate, a3);
}

- (BOOL)hasPerformedEnsureAccountsExist
{
  return self->_hasPerformedEnsureAccountsExist;
}

- (void)setHasPerformedEnsureAccountsExist:(BOOL)a3
{
  self->_hasPerformedEnsureAccountsExist = a3;
}

- (NSString)lastReportedErrorIdentifier
{
  return self->_lastReportedErrorIdentifier;
}

- (void)setLastReportedErrorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastReportedErrorIdentifier, a3);
}

- (unint64_t)lastReportedErrorStage
{
  return self->_lastReportedErrorStage;
}

- (void)setLastReportedErrorStage:(unint64_t)a3
{
  self->_lastReportedErrorStage = a3;
}

- (NSError)lastReportedError
{
  return self->_lastReportedError;
}

- (void)setLastReportedError:(id)a3
{
  objc_storeStrong((id *)&self->_lastReportedError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReportedError, 0);
  objc_storeStrong((id *)&self->_lastReportedErrorIdentifier, 0);
  objc_storeStrong((id *)&self->_migrationStartDate, 0);
  objc_storeStrong((id *)&self->_cachedStore, 0);
  objc_storeStrong((id *)&self->_containerToken, 0);
}

- (void)initWithSandboxDatabaseEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Failed to create isolated store container for database migration {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)ensureAccountsExistWithMigrationAccountInfos:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Failed to save account objects for local migration {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)ensureAccountsExistWithMigrationAccountInfos:(uint64_t)a1 error:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_2_5(a1, a2), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1((uint64_t)v4, 5.8381e-34);
  OUTLINED_FUNCTION_1_5(&dword_1B4A39000, v2, OS_LOG_TYPE_ERROR, "ensureAccountsExist: Invalid UUID. Skip. {uuid: %{public}@}", v3);

  OUTLINED_FUNCTION_5_2();
}

- (void)ensureAccountsExistWithMigrationAccountInfos:(uint64_t)a1 error:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_2_5(a1, a2), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1((uint64_t)v4, 5.8381e-34);
  OUTLINED_FUNCTION_1_5(&dword_1B4A39000, v2, OS_LOG_TYPE_ERROR, "ensureAccountsExist: CloudKit account type is not expected. {uuid: %{public}@}", v3);

  OUTLINED_FUNCTION_5_2();
}

- (void)ensureAccountsExistWithMigrationAccountInfos:(uint64_t)a1 error:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_2_5(a1, a2), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1((uint64_t)v4, 5.8381e-34);
  OUTLINED_FUNCTION_1_5(&dword_1B4A39000, v2, OS_LOG_TYPE_ERROR, "ensureAccountsExist: Found unexpected existing account with external identifier we are about to use for creating new account {uuid: %{public}@}", v3);

  OUTLINED_FUNCTION_5_2();
}

- (void)ensureAccountsExist:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "ensureAccountsExist: Decommissioned [REMDatabaseMigrationContext ensureAccountsExist:] called. Migration will not work.", v1, 2u);
}

- (void)_cleanLocalDatabases:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Failed to remove existing accounts when trying to clear local database before we can create clean ones for local migration {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_cleanLocalDatabases:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  void *v4;

  objc_msgSend((id)OUTLINED_FUNCTION_2_5(a1, a2), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1((uint64_t)v4, 5.8381e-34);
  OUTLINED_FUNCTION_1_5(&dword_1B4A39000, v2, OS_LOG_TYPE_ERROR, "REMDatabaseMigrationContext found existing local account locally before migration, emptying content: {id: %{public}@}", v3);

  OUTLINED_FUNCTION_5_2();
}

- (void)_cleanLocalDatabases:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Failed to fetch existing accounts when trying to clear local database before we can create clean ones for local migration {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
