@implementation VCCKShortcutSyncCoordinator

uint64_t __78__VCCKShortcutSyncCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "accountStatus");
  if (!result)
  {
    getWFCloudKitSyncLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[VCCKShortcutSyncCoordinator observeValueForKeyPath:ofObject:change:context:]_block_invoke_2";
      _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Application moved into foreground, updating account status", (uint8_t *)&v4, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 32), "updateAccountStatusAndUserRecordID");
  }
  return result;
}

- (void)updateAccountStatusAndUserRecordID
{
  NSObject *v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  NSObject *v25;
  VCCKShortcutSyncCoordinator *v26;
  __int128 *p_buf;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t v35[4];
  const char *v36;
  __int16 v37;
  void *v38;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[VCCKShortcutSyncCoordinator stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Updating iCloud account status", (uint8_t *)&buf, 0xCu);
  }

  v5 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__5895;
  v42 = __Block_byref_object_dispose__5896;
  v43 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__5895;
  v33 = __Block_byref_object_dispose__5896;
  v34 = 0;
  -[VCCKShortcutSyncCoordinator container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __65__VCCKShortcutSyncCoordinator_updateAccountStatusAndUserRecordID__block_invoke;
  v24 = &unk_1E7AA7B98;
  v7 = v5;
  v25 = v7;
  v26 = self;
  p_buf = &buf;
  v28 = &v29;
  objc_msgSend(v6, "accountInfoWithCompletionHandler:", &v21);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  -[VCCKShortcutSyncCoordinator userRecordID](self, "userRecordID", v21, v22, v23, v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v30[5], "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "syncShortcutsUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0DD9F50];
    v13 = objc_msgSend(v11, "BOOLForKey:", *MEMORY[0x1E0DD9F50]);

    if (!v13)
      goto LABEL_10;
    getWFCloudKitSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v35 = 136315138;
      v36 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]";
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_INFO, "%s iCloud account changed, resetting flags for sync unavailable message", v35, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "syncShortcutsUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBool:forKey:", 0, v12);

    objc_msgSend(MEMORY[0x1E0C99EA0], "syncShortcutsUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBool:forKey:", 0, *MEMORY[0x1E0DDA070]);

    objc_msgSend(MEMORY[0x1E0C99EA0], "syncShortcutsUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInteger:forKey:", 0, *MEMORY[0x1E0DDA060]);

    objc_msgSend(MEMORY[0x1E0C99EA0], "syncShortcutsUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", 0, *MEMORY[0x1E0DDA068]);
  }

LABEL_10:
  -[VCCKShortcutSyncCoordinator setAccountStatus:](self, "setAccountStatus:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "accountStatus"));
  -[VCCKShortcutSyncCoordinator setUserRecordID:](self, "setUserRecordID:", v30[5]);
  v18 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "walrusStatus");
  getWFWalrusLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    CKStringFromWalrusStatus();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v35 = 136315394;
    v36 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]";
    v37 = 2112;
    v38 = v20;
    _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_INFO, "%s Got Walrus status from CloudKit: %@", v35, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0DD9CC0], "setWalrusEnabled:", v18 == 1);
  -[VCCKShortcutSyncCoordinator updateCurrentSyncService](self, "updateCurrentSyncService");

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&buf, 8);

}

- (void)setUserRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_userRecordID, a3);
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  objc_super v18;
  _QWORD v19[5];
  _QWORD block[4];
  id v21;
  VCCKShortcutSyncCoordinator *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)VCCKShortcutSyncAccountObserverUserDefaultsChangedContext == a6)
  {
    getWFCloudKitSyncLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[VCCKShortcutSyncCoordinator observeValueForKeyPath:ofObject:change:context:]";
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v12;
      _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_INFO, "%s Received user defaults update for keyPath %{public}@, change dictionary: %{public}@", buf, 0x20u);
    }

    -[VCCKShortcutSyncCoordinator stateAccessQueue](self, "stateAccessQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__VCCKShortcutSyncCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E7AA8138;
    v21 = v10;
    v22 = self;
    dispatch_async(v14, block);

  }
  else if ((void *)VCCKShortcutSyncAccountObserverApplicationVisibilityChangedContext == a6)
  {
    -[VCCKShortcutSyncCoordinator applicationObserver](self, "applicationObserver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isApplicationVisible");

    if (v16)
    {
      -[VCCKShortcutSyncCoordinator stateAccessQueue](self, "stateAccessQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __78__VCCKShortcutSyncCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v19[3] = &unk_1E7AA8300;
      v19[4] = self;
      dispatch_async(v17, v19);

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VCCKShortcutSyncCoordinator;
    -[VCCKShortcutSyncCoordinator observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (OS_dispatch_queue)stateAccessQueue
{
  return self->_stateAccessQueue;
}

- (VCCKApplicationStateObserver)applicationObserver
{
  return self->_applicationObserver;
}

- (void)updateCurrentSyncService
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *currentSyncService;
  id v10;
  id v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  int v35;
  int v36;
  NSObject *v37;
  _BOOL4 v38;
  WFShortcutsSyncEngine *v39;
  WFShortcutsSyncService *v40;
  WFShortcutsSyncService *v41;
  VCCKShortcutSyncService *v42;
  void *v43;
  void *v44;
  WFShortcutsSyncService *v45;
  WFShortcutsSyncService *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  _BYTE v54[10];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  -[VCCKShortcutSyncCoordinator stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Trying to re-create a shortcut sync service.", buf, 0xCu);
  }

  -[VCCKShortcutSyncCoordinator databaseProvider](self, "databaseProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v5, "databaseWithError:", &v50);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v50;

  if (!v6)
  {
    getWFCloudKitSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
      v53 = 2114;
      *(_QWORD *)v54 = v7;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Database is not available, cannot create new sync service: %{public}@", buf, 0x16u);
    }

    goto LABEL_20;
  }
  if ((objc_msgSend(MEMORY[0x1E0DD9CC0], "isSyncEnabled") & 1) != 0)
  {
    if (-[VCCKShortcutSyncCoordinator accountStatus](self, "accountStatus") == 1)
    {
      -[VCCKShortcutSyncCoordinator accountForSyncToken](self, "accountForSyncToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        getWFCloudKitSyncLogObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
          _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_INFO, "%s Account name for sync token is nil, not creating new sync service", buf, 0xCu);
        }

        currentSyncService = self->_currentSyncService;
        self->_currentSyncService = 0;
        goto LABEL_56;
      }
      objc_msgSend(v6, "syncToken");
      currentSyncService = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(currentSyncService, "account");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v8;
      v12 = v11;
      if (v10 == v11)
      {

        v21 = v12;
        v22 = v12;
      }
      else
      {
        if (v10)
        {
          v13 = objc_msgSend(v10, "isEqualToString:", v11);

          if ((v13 & 1) != 0)
          {
LABEL_31:
            if (objc_msgSend(MEMORY[0x1E0DD9CC0], "zoneWasPurged"))
            {
              getWFCloudKitSyncLogObject();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
                _os_log_impl(&dword_1C146A000, v26, OS_LOG_TYPE_INFO, "%s 'Zone purged' flag is set, not creating new sync service until user confirms that it is okay to resume syncing", buf, 0xCu);
              }

              objc_msgSend(v6, "clearTombstonesAndSyncState");
              v27 = self->_currentSyncService;
              self->_currentSyncService = 0;
LABEL_55:

LABEL_56:
              goto LABEL_21;
            }
            if (self->_currentSyncService)
            {
              objc_msgSend(currentSyncService, "account");
              v28 = (id)objc_claimAutoreleasedReturnValue();
              v29 = v12;
              v30 = v29;
              if (v28 == v29)
              {

                goto LABEL_41;
              }
              if (v28)
              {
                v31 = objc_msgSend(v28, "isEqualToString:", v29);

                if (!v31)
                  goto LABEL_44;
LABEL_41:
                getWFCloudKitSyncLogObject();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
                  _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_INFO, "%s A sync service already exists and account has not changed, not creating new sync service", buf, 0xCu);
                }
                goto LABEL_55;
              }

            }
LABEL_44:
            getWFCloudKitSyncLogObject();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
              _os_log_impl(&dword_1C146A000, v32, OS_LOG_TYPE_INFO, "%s Shortcut sync is enabled and iCloud account information is available, creating new sync service", buf, 0xCu);
            }

            getWFCloudKitSyncLogObject();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              v34 = objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled");
              v35 = objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence");
              *(_DWORD *)buf = 136315650;
              v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
              v53 = 1024;
              *(_DWORD *)v54 = v34;
              *(_WORD *)&v54[4] = 1024;
              *(_DWORD *)&v54[6] = v35;
              _os_log_impl(&dword_1C146A000, v33, OS_LOG_TYPE_DEBUG, "%s Coherence feature flag enabled: %i, coherence sync enabled: %i", buf, 0x18u);
            }

            v36 = _os_feature_enabled_impl();
            getWFCloudKitSyncLogObject();
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
            if (v36)
            {
              if (v38)
              {
                *(_DWORD *)buf = 136315138;
                v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
                _os_log_impl(&dword_1C146A000, v37, OS_LOG_TYPE_DEFAULT, "%s Shortcuts/toprak_syncengine feature flag enabled, using Toprak sync service", buf, 0xCu);
              }

              v39 = [WFShortcutsSyncEngine alloc];
              -[VCCKShortcutSyncCoordinator container](self, "container");
              v27 = objc_claimAutoreleasedReturnValue();
              v40 = -[WFShortcutsSyncEngine initWithDatabase:container:](v39, "initWithDatabase:container:", v6, v27);
              v41 = self->_currentSyncService;
              self->_currentSyncService = v40;

            }
            else
            {
              if (v38)
              {
                *(_DWORD *)buf = 136315138;
                v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
                _os_log_impl(&dword_1C146A000, v37, OS_LOG_TYPE_DEFAULT, "%s Shortcuts/toprak_syncengine feature flag disabled, using legacy sync service", buf, 0xCu);
              }

              v42 = [VCCKShortcutSyncService alloc];
              -[VCCKShortcutSyncCoordinator container](self, "container");
              v27 = objc_claimAutoreleasedReturnValue();
              -[VCCKShortcutSyncCoordinator applicationObserver](self, "applicationObserver");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[VCCKShortcutSyncCoordinator logger](self, "logger");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = -[VCCKShortcutSyncService initWithContainer:database:applicationObserver:automaticSyncEnabled:logger:](v42, "initWithContainer:database:applicationObserver:automaticSyncEnabled:logger:", v27, v6, v43, 1, v44);
              v46 = self->_currentSyncService;
              self->_currentSyncService = v45;

            }
            goto LABEL_55;
          }
        }
        else
        {

        }
        getWFCloudKitSyncLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(currentSyncService, "account");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
          v53 = 2114;
          *(_QWORD *)v54 = v24;
          *(_WORD *)&v54[8] = 2114;
          v55 = v12;
          _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_INFO, "%s Database sync token account (%{public}@) is different from current account (%{public}@), clearing tombstones and invalidating persisted sync engine metadata", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0DD9CC0], "setZoneWasPurged:", 0);
        v25 = (void *)objc_opt_new();
        objc_msgSend(v25, "setAccount:", v12);
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __55__VCCKShortcutSyncCoordinator_updateCurrentSyncService__block_invoke;
        v47[3] = &unk_1E7AA7BC0;
        v48 = v6;
        v49 = v25;
        v22 = v25;
        objc_msgSend(v48, "performTransactionWithReason:block:error:", CFSTR("update sync service state"), v47, 0);

        v21 = v48;
      }

      goto LABEL_31;
    }
    getWFCloudKitSyncLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    v19 = -[VCCKShortcutSyncCoordinator accountStatus](self, "accountStatus");
    *(_DWORD *)buf = 136315394;
    v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
    v53 = 2048;
    *(_QWORD *)v54 = v19;
    v16 = "%s iCloud account status is %ld, clearing tombstones and not creating new sync service";
    v17 = v15;
    v18 = 22;
    goto LABEL_18;
  }
  getWFCloudKitSyncLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[VCCKShortcutSyncCoordinator updateCurrentSyncService]";
    v16 = "%s Shortcut syncing disabled in preferences, clearing tombstones and not creating new sync service";
    v17 = v15;
    v18 = 12;
LABEL_18:
    _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
  }
LABEL_19:

  objc_msgSend(v6, "clearTombstonesAndSyncState");
LABEL_20:
  v8 = self->_currentSyncService;
  self->_currentSyncService = 0;
LABEL_21:

}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

void __65__VCCKShortcutSyncCoordinator_updateAccountStatusAndUserRecordID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    getWFCloudKitSyncLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
      v28 = 2114;
      v29 = v7;
      v9 = "%s Fatal error fetching account info: %{public}@";
      goto LABEL_7;
    }
LABEL_9:

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_10;
  }
  if (v6)
  {
    getWFCloudKitSyncLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
      v28 = 2114;
      v29 = v7;
      v9 = "%s Encountered error fetching account info, but we have an account info object, continuing: %{public}@";
LABEL_7:
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_8:
      _os_log_impl(&dword_1C146A000, v10, v11, v9, buf, v12);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v13 = objc_msgSend(v5, "accountStatus");
  getWFCloudKitSyncLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
    v28 = 2112;
    v29 = v5;
    v30 = 2048;
    v31 = v13;
    _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_INFO, "%s Successfully fetched iCloud account info: %@, status = %ld", buf, 0x20u);
  }

  getWFCloudKitSyncLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v13 != 1)
  {
    if (!v15)
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v27 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
    v9 = "%s Not fetching current user record ID because iCloud account is not available";
    v10 = v8;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_8;
  }
  if (v15)
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_INFO, "%s Fetching current user record ID", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "container");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__VCCKShortcutSyncCoordinator_updateAccountStatusAndUserRecordID__block_invoke_139;
  v21[3] = &unk_1E7AA7B70;
  v17 = *(id *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 48);
  v22 = v17;
  v24 = v18;
  v19 = v5;
  v20 = *(_QWORD *)(a1 + 56);
  v23 = v19;
  v25 = v20;
  objc_msgSend(v16, "fetchUserRecordIDWithCompletionHandler:", v21);

LABEL_10:
}

- (VCCKShortcutSyncCoordinator)initWithDatabaseProvider:(id)a3
{
  id v6;
  VCCKShortcutSyncCoordinator *v7;
  VCCKShortcutSyncCoordinator *v8;
  uint64_t v9;
  CKContainer *container;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *stateAccessQueue;
  nw_path_monitor_t v15;
  OS_nw_path_monitor *pathMonitor;
  __CFBundle *MainBundle;
  VCCKApplicationStateObserver *v18;
  uint64_t v19;
  VCCKApplicationStateObserver *applicationObserver;
  VCCKCoherenceSyncCoordinator *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  VCCKCoherenceSyncCoordinator *coherenceSyncCoordinator;
  VCCKShortcutSyncCoordinator *v26;
  void *v28;
  objc_super v29;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCKShortcutSyncCoordinator.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseProvider"));

  }
  v29.receiver = self;
  v29.super_class = (Class)VCCKShortcutSyncCoordinator;
  v7 = -[VCCKShortcutSyncCoordinator init](&v29, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_databaseProvider, a3);
    objc_msgSend(MEMORY[0x1E0C94C28], "wf_shortcutsContainer");
    v9 = objc_claimAutoreleasedReturnValue();
    container = v8->_container;
    v8->_container = (CKContainer *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.VoiceShortcuts.VCCKShortcutSyncCoordinator.stateAccessQueue", v12);
    stateAccessQueue = v8->_stateAccessQueue;
    v8->_stateAccessQueue = (OS_dispatch_queue *)v13;

    v15 = nw_path_monitor_create();
    pathMonitor = v8->_pathMonitor;
    v8->_pathMonitor = (OS_nw_path_monitor *)v15;

    MainBundle = CFBundleGetMainBundle();
    CFBundleGetIdentifier(MainBundle);
    v8->_telephonyConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    v18 = [VCCKApplicationStateObserver alloc];
    v19 = -[VCCKApplicationStateObserver initWithBundleIdentifier:](v18, "initWithBundleIdentifier:", *MEMORY[0x1E0DC7FD8]);
    applicationObserver = v8->_applicationObserver;
    v8->_applicationObserver = (VCCKApplicationStateObserver *)v19;

    v21 = [VCCKCoherenceSyncCoordinator alloc];
    -[VCCKShortcutSyncCoordinator container](v8, "container");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncCoordinator applicationObserver](v8, "applicationObserver");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[VCCKCoherenceSyncCoordinator initWithContainer:applicationObserver:](v21, "initWithContainer:applicationObserver:", v22, v23);
    coherenceSyncCoordinator = v8->_coherenceSyncCoordinator;
    v8->_coherenceSyncCoordinator = (VCCKCoherenceSyncCoordinator *)v24;

    -[VCCKShortcutSyncCoordinator setupPathMonitor](v8, "setupPathMonitor");
    v26 = v8;
  }

  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[VCCKShortcutSyncCoordinator stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VCCKShortcutSyncCoordinator_dealloc__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)VCCKShortcutSyncCoordinator;
  -[VCCKShortcutSyncCoordinator dealloc](&v4, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[VCCKShortcutSyncCoordinator stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__VCCKShortcutSyncCoordinator_start__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (WFShortcutsSyncService)currentSyncService
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5895;
  v11 = __Block_byref_object_dispose__5896;
  v12 = 0;
  -[VCCKShortcutSyncCoordinator stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__VCCKShortcutSyncCoordinator_currentSyncService__block_invoke;
  v6[3] = &unk_1E7AA8288;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (WFShortcutsSyncService *)v4;
}

- (BOOL)isUsingToprakSyncEngine
{
  void *v2;
  char isKindOfClass;

  -[VCCKShortcutSyncCoordinator currentSyncService](self, "currentSyncService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)setSyncEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_syncEnabled != a3)
  {
    v3 = a3;
    self->_syncEnabled = a3;
    getWFCloudKitSyncLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 136315394;
      v7 = "-[VCCKShortcutSyncCoordinator setSyncEnabled:]";
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling CloudKit sync enabled setting change, syncEnabled = %d", (uint8_t *)&v6, 0x12u);
    }

    if (v3)
    {
      -[VCCKShortcutSyncCoordinator startObservingAccountChanges](self, "startObservingAccountChanges");
      -[VCCKShortcutSyncCoordinator startObservingReachability](self, "startObservingReachability");
      -[VCCKShortcutSyncCoordinator startObservingDataUsagePermission](self, "startObservingDataUsagePermission");
      -[VCCKShortcutSyncCoordinator startObservingApplicationVisibility](self, "startObservingApplicationVisibility");
      -[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID](self, "updateAccountStatusAndUserRecordID");
    }
    else
    {
      -[VCCKShortcutSyncCoordinator stopObservingApplicationVisibility](self, "stopObservingApplicationVisibility");
      -[VCCKShortcutSyncCoordinator stopObservingDataUsagePermission](self, "stopObservingDataUsagePermission");
      -[VCCKShortcutSyncCoordinator stopObservingReachability](self, "stopObservingReachability");
      -[VCCKShortcutSyncCoordinator stopObservingAccountChanges](self, "stopObservingAccountChanges");
      -[VCCKShortcutSyncCoordinator updateCurrentSyncService](self, "updateCurrentSyncService");
    }
  }
}

- (void)handleCloudKitSyncEnabledChange
{
  -[VCCKShortcutSyncCoordinator setSyncEnabled:](self, "setSyncEnabled:", objc_msgSend(MEMORY[0x1E0DD9CC0], "isSyncEnabled"));
}

- (void)handleCloudKitSyncZoneWasPurgedChange
{
  int v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0DD9CC0], "zoneWasPurged");
  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[VCCKShortcutSyncCoordinator handleCloudKitSyncZoneWasPurgedChange]";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Handling CloudKit sync zone purged flag change, zoneWasPurged = %d", (uint8_t *)&v5, 0x12u);
  }

  -[VCCKShortcutSyncCoordinator updateCurrentSyncService](self, "updateCurrentSyncService");
}

- (void)handleWalrusStatusDidChange
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)os_transaction_create();
  v4 = objc_msgSend(MEMORY[0x1E0DD9CC0], "isWalrusEnabled");
  getWFWalrusLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[VCCKShortcutSyncCoordinator handleWalrusStatusDidChange]";
    v13 = 1024;
    LODWORD(v14) = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling CloudKit Walrus status change, walrusEnabled = %d", buf, 0x12u);
  }

  -[VCCKShortcutSyncCoordinator databaseProvider](self, "databaseProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v6, "databaseWithError:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (v7)
  {
    objc_msgSend(v7, "updateWalrusStatus");
  }
  else
  {
    getWFWalrusLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[VCCKShortcutSyncCoordinator handleWalrusStatusDidChange]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Walrus status did change, but we couldn't find a database to update: %@", buf, 0x16u);
    }

  }
}

- (void)setupPathMonitor
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[VCCKShortcutSyncCoordinator pathMonitor](self, "pathMonitor");
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __47__VCCKShortcutSyncCoordinator_setupPathMonitor__block_invoke;
  v9 = &unk_1E7AA7B00;
  objc_copyWeak(&v10, &location);
  nw_path_monitor_set_update_handler(v3, &v6);

  -[VCCKShortcutSyncCoordinator pathMonitor](self, "pathMonitor", v6, v7, v8, v9);
  v4 = objc_claimAutoreleasedReturnValue();
  -[VCCKShortcutSyncCoordinator stateAccessQueue](self, "stateAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_set_queue(v4, v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)startObservingUserDefaults
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *MEMORY[0x1E0DD9F60], 4, VCCKShortcutSyncAccountObserverUserDefaultsChangedContext);

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, *MEMORY[0x1E0DD9F68], 0, VCCKShortcutSyncAccountObserverUserDefaultsChangedContext);

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, *MEMORY[0x1E0DDA0C0], 0, VCCKShortcutSyncAccountObserverUserDefaultsChangedContext);

}

- (void)stopObservingUserDefaults
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0DD9F60], VCCKShortcutSyncAccountObserverUserDefaultsChangedContext);

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0DD9F68], VCCKShortcutSyncAccountObserverUserDefaultsChangedContext);

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0DDA0C0], VCCKShortcutSyncAccountObserverUserDefaultsChangedContext);

}

- (void)startObservingApplicationVisibility
{
  id v3;

  -[VCCKShortcutSyncCoordinator applicationObserver](self, "applicationObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("applicationVisible"), 0, VCCKShortcutSyncAccountObserverApplicationVisibilityChangedContext);

}

- (void)stopObservingApplicationVisibility
{
  id v3;

  -[VCCKShortcutSyncCoordinator applicationObserver](self, "applicationObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("applicationVisible"), VCCKShortcutSyncAccountObserverApplicationVisibilityChangedContext);

}

- (void)startObservingAccountChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleAccountChangedNotification_, *MEMORY[0x1E0C94690], 0);

}

- (void)stopObservingAccountChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C94690], 0);

}

- (void)startObservingReachability
{
  NSObject *v2;

  -[VCCKShortcutSyncCoordinator pathMonitor](self, "pathMonitor");
  v2 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_start(v2);

}

- (void)stopObservingReachability
{
  NSObject *v2;

  -[VCCKShortcutSyncCoordinator pathMonitor](self, "pathMonitor");
  v2 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_cancel(v2);

}

- (void)startObservingDataUsagePermission
{
  id v2;
  _QWORD v3[5];
  id v4;
  uint64_t v5;
  id location;

  objc_initWeak(&location, self);
  v5 = 0;
  _CTServerConnectionCopyCellularUsagePolicy();
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = __Block_byref_object_copy__5895;
  v3[4] = __Block_byref_object_dispose__5896;
  v4 = 0;
  objc_copyWeak(&v2, &location);
  _CTServerConnectionRegisterBlockForNotification();
  objc_destroyWeak(&v2);
  _Block_object_dispose(v3, 8);

  objc_destroyWeak(&location);
}

- (void)stopObservingDataUsagePermission
{
  _CTServerConnectionUnregisterForNotification();
}

- (NSString)accountForSyncToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VCCKShortcutSyncCoordinator userRecordID](self, "userRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VCCKShortcutSyncCoordinator container](self, "container");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environment");
    CKContainerEnvironmentString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DD9CC8], "accountForContainerEnvironmentString:userRecordID:", v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (void)deleteLegacyShortcutsZoneSubscriptionIfNeeded
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[5];

  -[VCCKShortcutSyncCoordinator stateAccessQueue](self, "stateAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("LegacyShortcutsZoneSubscriptionUnsubscribed"));

  if ((v5 & 1) == 0)
  {
    -[VCCKShortcutSyncCoordinator container](self, "container");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__VCCKShortcutSyncCoordinator_deleteLegacyShortcutsZoneSubscriptionIfNeeded__block_invoke;
    v7[3] = &unk_1E7AA7C28;
    v7[4] = self;
    objc_msgSend(v6, "accountStatusWithCompletionHandler:", v7);

  }
}

- (WFCloudKitSyncEventLogger)logger
{
  WFCloudKitSyncEventLogger *v3;
  WFCloudKitSyncEventLogger *logger;

  if (!self->_logger
    && objc_msgSend(MEMORY[0x1E0C99EA0], "syncEventLoggingEnabled")
    && VCIsInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0DD9CB0], "createPersistedSyncEventLogger");
    v3 = (WFCloudKitSyncEventLogger *)objc_claimAutoreleasedReturnValue();
    logger = self->_logger;
    self->_logger = v3;

  }
  return self->_logger;
}

- (void)handleAccountChangedNotification:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[VCCKShortcutSyncCoordinator handleAccountChangedNotification:]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Received CKAccountChangedNotification", buf, 0xCu);
  }

  -[VCCKShortcutSyncCoordinator stateAccessQueue](self, "stateAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VCCKShortcutSyncCoordinator_handleAccountChangedNotification___block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)setCurrentSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_currentSyncService, a3);
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (__CTServerConnection)telephonyConnection
{
  return self->_telephonyConnection;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (CKRecordID)userRecordID
{
  return self->_userRecordID;
}

- (BOOL)isSyncEnabled
{
  return self->_syncEnabled;
}

- (VCCKCoherenceSyncCoordinator)coherenceSyncCoordinator
{
  return self->_coherenceSyncCoordinator;
}

- (void)setCoherenceSyncCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coherenceSyncCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coherenceSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_applicationObserver, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_stateAccessQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_currentSyncService, 0);
}

uint64_t __64__VCCKShortcutSyncCoordinator_handleAccountChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAccountStatusAndUserRecordID");
}

uint64_t __78__VCCKShortcutSyncCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0DD9F60]))
    return objc_msgSend(*(id *)(a1 + 40), "handleCloudKitSyncEnabledChange");
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0DD9F68]))
    return objc_msgSend(*(id *)(a1 + 40), "handleCloudKitSyncZoneWasPurgedChange");
  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0DDA0C0]);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "handleWalrusStatusDidChange");
  return result;
}

void __76__VCCKShortcutSyncCoordinator_deleteLegacyShortcutsZoneSubscriptionIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  _QWORD block[9];

  if (a2 == 1)
  {
    block[7] = v2;
    block[8] = v3;
    objc_msgSend(*(id *)(a1 + 32), "stateAccessQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__VCCKShortcutSyncCoordinator_deleteLegacyShortcutsZoneSubscriptionIfNeeded__block_invoke_2;
    block[3] = &unk_1E7AA8300;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v5, block);

  }
}

void __76__VCCKShortcutSyncCoordinator_deleteLegacyShortcutsZoneSubscriptionIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "container");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateCloudDatabase");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteSubscriptionWithID:completionHandler:", CFSTR("ShortcutsZoneSubscription"), &__block_literal_global_149_5869);

}

void __76__VCCKShortcutSyncCoordinator_deleteLegacyShortcutsZoneSubscriptionIfNeeded__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v3;

  if (!a3)
  {
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("ShortcutsZoneSubscription")))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("LegacyShortcutsZoneSubscriptionUnsubscribed"));

    }
  }
}

uint64_t __55__VCCKShortcutSyncCoordinator_updateCurrentSyncService__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearTombstonesAndSyncState");
  return objc_msgSend(*(id *)(a1 + 32), "setSyncToken:", *(_QWORD *)(a1 + 40));
}

void __65__VCCKShortcutSyncCoordinator_updateAccountStatusAndUserRecordID__block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFCloudKitSyncLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 136315394;
      v12 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_INFO, "%s Successfully fetched current user record ID: %@", (uint8_t *)&v11, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = v5;
    v8 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315394;
    v12 = "-[VCCKShortcutSyncCoordinator updateAccountStatusAndUserRecordID]_block_invoke";
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Error fetching current user record: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__VCCKShortcutSyncCoordinator_startObservingDataUsagePermission__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _CTServerConnectionCopyCellularUsagePolicy();
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqualToDictionary:", 0) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
    if (!objc_msgSend(WeakRetained, "accountStatus"))
      objc_msgSend(WeakRetained, "updateAccountStatusAndUserRecordID");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "forceReceiveAndSendAllChangesWithCompletionHandler:", &__block_literal_global_5909);
  }

}

void __47__VCCKShortcutSyncCoordinator_setupPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  NSObject *v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = nw_path_get_status(v3);

  if ((v2 & 0xFFFFFFFD) == 1 && !objc_msgSend(WeakRetained, "accountStatus"))
    objc_msgSend(WeakRetained, "updateAccountStatusAndUserRecordID");

}

void __49__VCCKShortcutSyncCoordinator_currentSyncService__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

void __36__VCCKShortcutSyncCoordinator_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isStarted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setStarted:", 1);
    getWFCloudKitSyncLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[VCCKShortcutSyncCoordinator start]_block_invoke";
      _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_INFO, "%s Starting VCCKShortcutSyncCoordinator", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "startObservingUserDefaults");
    objc_msgSend(*(id *)(a1 + 32), "deleteLegacyShortcutsZoneSubscriptionIfNeeded");
    if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "coherenceSyncCoordinator");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "start");

    }
  }
}

void __38__VCCKShortcutSyncCoordinator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isStarted"))
  {
    objc_msgSend(*(id *)(a1 + 32), "stopObservingUserDefaults");
    objc_msgSend(*(id *)(a1 + 32), "stopObservingApplicationVisibility");
    objc_msgSend(*(id *)(a1 + 32), "stopObservingDataUsagePermission");
    objc_msgSend(*(id *)(a1 + 32), "stopObservingAccountChanges");
    objc_msgSend(*(id *)(a1 + 32), "stopObservingReachability");
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 72));
  }
}

@end
