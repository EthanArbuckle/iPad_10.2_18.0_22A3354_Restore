@implementation VCDaemonDatabaseProvider

- (id)databaseWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4705;
  v19 = __Block_byref_object_dispose__4706;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4705;
  v13 = __Block_byref_object_dispose__4706;
  v14 = 0;
  -[VCDaemonDatabaseProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCDaemonDatabaseProvider_databaseWithError___block_invoke;
  block[3] = &unk_1E7AA6EB0;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(v5, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __46__VCDaemonDatabaseProvider_databaseWithError___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  id obj;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
    return;
  }
  if ((objc_msgSend(v2, "isShortcutsAppInstalled") & 1) == 0)
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[VCDaemonDatabaseProvider databaseWithError:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Not initializing the database because Shortcuts app is not installed, returning nil", buf, 0xCu);
    }

    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = CFSTR("Shortcuts app is not installed");
    goto LABEL_11;
  }
  if (WFProcessIsRunningInUserSetup())
  {
    getWFGeneralLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[VCDaemonDatabaseProvider databaseWithError:]_block_invoke";
    }

    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = CFSTR("Shortcuts daemon is running under the macOS Installer user");
LABEL_11:
    WFLocalizedString(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vc_voiceShortcutErrorWithCode:reason:", 1004, CFSTR("%@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    return;
  }
  v12 = objc_alloc(MEMORY[0x1E0DD9D00]);
  objc_msgSend(MEMORY[0x1E0C97C08], "wf_shortcutsConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "initWithStoreDescription:runMigrationsIfNecessary:useLockFile:error:", v13, 1, 1, &obj);
  objc_storeStrong((id *)(v14 + 40), obj);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v18)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), v18);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v25 = *(id *)(v19 + 40);
    v20 = WFRecoverDatabaseContentsIfNeeded();
    objc_storeStrong((id *)(v19 + 40), v25);
    if ((v20 & 1) == 0)
    {
      getWFGeneralLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136315394;
        v28 = "-[VCDaemonDatabaseProvider databaseWithError:]_block_invoke";
        v29 = 2114;
        v30 = v22;
        _os_log_impl(&dword_1C146A000, v21, OS_LOG_TYPE_FAULT, "%s Failed to run migrations in database: %{public}@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0DD9D00], "setDefaultDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(a1 + 32), "migrateVoiceShortcutsToShortcutsInDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {
    getWFGeneralLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      v28 = "-[VCDaemonDatabaseProvider databaseWithError:]_block_invoke";
      v29 = 2114;
      v30 = v24;
      _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_ERROR, "%s Failed to initialize database: %{public}@", buf, 0x16u);
    }

  }
}

- (VCDaemonDatabaseProvider)init
{
  VCDaemonDatabaseProvider *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  VCDaemonDatabaseProvider *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCDaemonDatabaseProvider;
  v2 = -[VCDaemonDatabaseProvider init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.shortcuts.VCDaemonDatabaseProvider", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (WFDatabase)database
{
  return (WFDatabase *)-[VCDaemonDatabaseProvider databaseWithError:](self, "databaseWithError:", 0);
}

- (void)migrateVoiceShortcutsToShortcutsInDatabase:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  VCOSTransactionWithName((uint64_t)CFSTR("WFDaemonDatabaseProvider.migrateVoiceShortcutsToShortcutsInDatabase"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9C08]), "initWithDatabase:", v3);

  v9 = 0;
  v6 = objc_msgSend(v5, "migrateWithError:", &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[VCDaemonDatabaseProvider migrateVoiceShortcutsToShortcutsInDatabase:]";
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to migrate shortcuts from CoreData: %{public}@", buf, 0x16u);
    }

  }
}

- (BOOL)isShortcutsAppInstalled
{
  id v2;
  void *v3;
  BOOL v4;

  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  v3 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", *MEMORY[0x1E0DC7FD8], 0, 0);
  v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
