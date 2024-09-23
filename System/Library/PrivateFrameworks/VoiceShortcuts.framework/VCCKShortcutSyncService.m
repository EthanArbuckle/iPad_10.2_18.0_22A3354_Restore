@implementation VCCKShortcutSyncService

- (void)forceReceiveAndSendAllChangesWithCompletionHandler:(id)a3
{
  sub_1C1489220(self, (int)a2, a3, (uint64_t)&unk_1E7AA29B0, (uint64_t)&unk_1EF6E3698);
}

- (VCCKShortcutSyncService)initWithContainer:(id)a3 database:(id)a4 applicationObserver:(id)a5 automaticSyncEnabled:(BOOL)a6 logger:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  VCCKShortcutSyncService *v17;
  VCCKShortcutSyncService *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  CKSyncEngine *syncEngine;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  CKSyncEngineSendChangesOptions *sendChangesOptions;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  CKSyncEngineFetchChangesOptions *fetchChangesOptions;
  uint64_t v49;
  NSMutableDictionary *filesReferencedUntilSaved;
  VCCKShortcutSyncService *v51;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  objc_super v62;
  void *v63;
  void *v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v8 = a6;
  v69 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCKShortcutSyncService.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCKShortcutSyncService.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

LABEL_3:
  v62.receiver = self;
  v62.super_class = (Class)VCCKShortcutSyncService;
  v17 = -[VCCKShortcutSyncService init](&v62, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_database, a4);
    objc_storeStrong((id *)&v18->_applicationObserver, a5);
    objc_storeStrong((id *)&v18->_logger, a7);
    objc_msgSend(v14, "syncToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "syncEngineMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    getWFCloudKitSyncLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v20, "length");
      *(_DWORD *)buf = 136315394;
      v66 = "-[VCCKShortcutSyncService initWithContainer:database:applicationObserver:automaticSyncEnabled:logger:]";
      v67 = 2048;
      v68 = v22;
      _os_log_impl(&dword_1C146A000, v21, OS_LOG_TYPE_DEFAULT, "%s Loaded sync engine metadata, length = %lu", buf, 0x16u);
    }

    v57 = v15;
    v58 = v14;
    v53 = v20;
    v56 = v16;
    if (!objc_msgSend(v20, "length"))
    {
      getWFCloudKitSyncLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "-[VCCKShortcutSyncService initWithContainer:database:applicationObserver:automaticSyncEnabled:logger:]";
        _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_DEFAULT, "%s Sync engine metadata is empty, initializing configuration with nil state serialization", buf, 0xCu);
      }
      v23 = 0;
      goto LABEL_19;
    }
    v61 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v20, &v61);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v61;
    if (v24)
    {
      getWFCloudKitSyncLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "-[VCCKShortcutSyncService initWithContainer:database:applicationObserver:automaticSyncEnabled:logger:]";
        v67 = 2112;
        v68 = (uint64_t)v24;
        _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_ERROR, "%s Failed to unarchive state serialization: %@", buf, 0x16u);
      }
    }
    else
    {
      if (v23)
      {
        v24 = 0;
LABEL_19:

        v28 = objc_alloc(MEMORY[0x1E0C95160]);
        objc_msgSend(v13, "privateCloudDatabase");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v28, "initWithDatabase:stateSerialization:delegate:", v29, v23, v18);

        objc_msgSend(v30, "setApsMachServiceName:", CFSTR("com.apple.aps.siriactionsd"));
        objc_msgSend(v30, "setAutomaticallySync:", v8);
        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95158]), "initWithConfiguration:", v30);
        syncEngine = v18->_syncEngine;
        v18->_syncEngine = (CKSyncEngine *)v31;

        v33 = objc_alloc(MEMORY[0x1E0C951A8]);
        v34 = (void *)MEMORY[0x1E0C99E60];
        -[VCCKShortcutSyncService shortcutsZoneID](v18, "shortcutsZoneID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v35;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setWithArray:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v33, "initWithZoneIDs:", v37);

        v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0C951A0]), "initWithScope:", v38);
        sendChangesOptions = v18->_sendChangesOptions;
        v18->_sendChangesOptions = (CKSyncEngineSendChangesOptions *)v39;

        v41 = objc_alloc(MEMORY[0x1E0C95170]);
        v42 = (void *)MEMORY[0x1E0C99E60];
        -[VCCKShortcutSyncService shortcutsZoneID](v18, "shortcutsZoneID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v43;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setWithArray:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(v41, "initWithZoneIDs:", v45);

        v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95168]), "initWithScope:", v46);
        fetchChangesOptions = v18->_fetchChangesOptions;
        v18->_fetchChangesOptions = (CKSyncEngineFetchChangesOptions *)v47;

        v49 = objc_opt_new();
        filesReferencedUntilSaved = v18->_filesReferencedUntilSaved;
        v18->_filesReferencedUntilSaved = (NSMutableDictionary *)v49;

        -[VCCKShortcutSyncService start](v18, "start");
        v51 = v18;

        v15 = v57;
        v14 = v58;
        v16 = v56;
        goto LABEL_20;
      }
      getWFCloudKitSyncLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "-[VCCKShortcutSyncService initWithContainer:database:applicationObserver:automaticSyncEnabled:logger:]";
        _os_log_impl(&dword_1C146A000, v26, OS_LOG_TYPE_DEBUG, "%s Migrating from old sync engine metadata blob to new sync engine state serialization", buf, 0xCu);
      }

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C951C0]), "initWithDeprecatedData:", v20);
      objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __102__VCCKShortcutSyncService_initWithContainer_database_applicationObserver_automaticSyncEnabled_logger___block_invoke;
      v59[3] = &unk_1E7AA60C8;
      v60 = v27;
      v25 = v27;
      -[VCCKShortcutSyncService updateSyncTokenInDatabaseWithBlock:](v18, "updateSyncTokenInDatabaseWithBlock:", v59);

    }
    goto LABEL_19;
  }
LABEL_20:

  return v18;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[VCCKShortcutSyncService dealloc]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEFAULT, "%s VCCKShortcutSyncService dealloc", buf, 0xCu);
  }

  -[VCCKShortcutSyncService stopObservingUserDefaults](self, "stopObservingUserDefaults");
  -[VCCKShortcutSyncService applicationObserver](self, "applicationObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("applicationVisible"), VCCKShortcutSyncServiceApplicationVisibilityChangedContext);

  v5.receiver = self;
  v5.super_class = (Class)VCCKShortcutSyncService;
  -[VCCKShortcutSyncService dealloc](&v5, sel_dealloc);
}

- (void)fetchChangesInShortcutsZone
{
  -[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:](self, "fetchChangesInShortcutsZoneWithCompletion:", 0);
}

- (void)fetchChangesInShortcutsZoneWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Fetching changes in Shortcuts zone", buf, 0xCu);
  }

  VCOSTransactionWithName((uint64_t)CFSTR("VCCKShortcutSyncService.fetchChangesInShortcutsZoneWithCompletion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCKShortcutSyncService syncEngine](self, "syncEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCKShortcutSyncService fetchChangesOptions](self, "fetchChangesOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__VCCKShortcutSyncService_fetchChangesInShortcutsZoneWithCompletion___block_invoke;
  v11[3] = &unk_1E7AA60F0;
  v12 = v6;
  v13 = v4;
  v11[4] = self;
  v9 = v6;
  v10 = v4;
  objc_msgSend(v7, "fetchChangesWithOptions:completionHandler:", v8, v11);

}

- (void)modifyPendingChangesInShortcutsZoneWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VCCKShortcutSyncService modifyPendingChangesInShortcutsZoneWithCompletion:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Modifying pending changes in Shortcuts zone", buf, 0xCu);
  }

  VCOSTransactionWithName((uint64_t)CFSTR("VCCKShortcutSyncService.modifyPendingChangesInShortcutsZoneWithCompletion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCKShortcutSyncService syncEngine](self, "syncEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCKShortcutSyncService sendChangesOptions](self, "sendChangesOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__VCCKShortcutSyncService_modifyPendingChangesInShortcutsZoneWithCompletion___block_invoke;
  v11[3] = &unk_1E7AA7A38;
  v12 = v6;
  v13 = v4;
  v9 = v6;
  v10 = v4;
  objc_msgSend(v7, "sendChangesWithOptions:completionHandler:", v8, v11);

}

- (void)fetchAndModifyChangesInShortcutsZoneWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__VCCKShortcutSyncService_fetchAndModifyChangesInShortcutsZoneWithCompletion___block_invoke;
  v6[3] = &unk_1E7AA7A38;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:](self, "fetchChangesInShortcutsZoneWithCompletion:", v6);

}

- (CKRecordZoneID)shortcutsZoneID
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  return (CKRecordZoneID *)(id)objc_msgSend(v2, "initWithZoneName:ownerName:", *MEMORY[0x1E0DD9F58], *MEMORY[0x1E0C94730]);
}

- (void)createShortcutsZone
{
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[VCCKShortcutSyncService createShortcutsZone]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Creating Shortcuts zone", buf, 0xCu);
  }

  v4 = objc_alloc(MEMORY[0x1E0C95190]);
  v5 = objc_alloc(MEMORY[0x1E0C95088]);
  -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithZoneID:", v6);
  v8 = (void *)objc_msgSend(v4, "initWithZone:", v7);

  -[VCCKShortcutSyncService syncEngine](self, "syncEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPendingDatabaseChanges:", v11);

}

- (id)workflowRecordForReference:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[VCCKShortcutSyncService database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v8, "recordWithDescriptor:properties:error:", v6, v7, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v13;
  if (!v9)
  {
    getWFCloudKitSyncLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[VCCKShortcutSyncService workflowRecordForReference:properties:]";
      v16 = 2114;
      v17 = v10;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_FAULT, "%s Failed to load WFWorkflowRecord from WFWorkflowReference: %{public}@, reference = %@", buf, 0x20u);
    }

  }
  return v9;
}

- (void)sendChangedWorkflows
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v27 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[VCCKShortcutSyncService sendChangedWorkflows]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Sending changed workflows", buf, 0xCu);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[VCCKShortcutSyncService database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changedWorkflowIDsForSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1E0DD9CD0];
        -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recordIDWithZoneID:workflowID:", v13, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v8);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[VCCKShortcutSyncService database](self, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deletedWorkflowIDsForSync");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v20);
        v22 = (void *)MEMORY[0x1E0DD9CD0];
        -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "recordIDWithZoneID:workflowID:", v23, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v24);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v18);
  }

  objc_msgSend(v27, "minusSet:", v3);
  objc_msgSend(v27, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v25, v26);

}

- (void)sendChangedFolders
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v37 = (void *)objc_opt_new();
  v36 = (void *)objc_opt_new();
  getWFCloudKitSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[VCCKShortcutSyncService sendChangedFolders]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Sending changed folders", buf, 0xCu);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[VCCKShortcutSyncService database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedVisibleFolders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1C3BAFA00]();
        -[VCCKShortcutSyncService database](self, "database");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "collectionRecordForCollectionIdentifier:createIfNecessary:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = objc_msgSend(v15, "computedSyncHash");
          if (v16 != objc_msgSend(v15, "lastSyncedHash"))
          {
            v17 = (void *)MEMORY[0x1E0DD9C90];
            -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "recordIDWithZoneID:collectionIdentifier:", v18, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v20);

          }
        }

        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v8);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[VCCKShortcutSyncService database](self, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deletedFolders");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "descriptors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v39 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        v29 = (void *)MEMORY[0x1C3BAFA00]();
        v30 = (void *)MEMORY[0x1E0DD9C90];
        -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "recordIDWithZoneID:collectionIdentifier:", v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v33);

        objc_autoreleasePoolPop(v29);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v25);
  }

  objc_msgSend(v37, "minusSet:", v36);
  objc_msgSend(v37, "allObjects");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "allObjects");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v34, v35);

}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    getWFCloudKitSyncLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v37 = "-[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:]";
      v38 = 2114;
      v39 = v6;
      v40 = 2114;
      v41 = v7;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_INFO, "%s Adding identifiers to save: %{public}@, identifiers to delete %{public}@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95188]), "initWithRecordID:type:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14), 0);
          -[NSObject addObject:](v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v12);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
          v22 = objc_alloc(MEMORY[0x1E0C95188]);
          v23 = (void *)objc_msgSend(v22, "initWithRecordID:type:", v21, 1, (_QWORD)v26);
          -[NSObject addObject:](v9, "addObject:", v23);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v18);
    }

    -[VCCKShortcutSyncService syncEngine](self, "syncEngine");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "state");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addPendingRecordZoneChanges:", v9);

  }
  else
  {
    getWFCloudKitSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:]";
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s No changes to save or delete, bailing out", buf, 0xCu);
    }
  }

}

- (void)sendWorkflowOrderingsIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  VCCKShortcutSyncService *v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[VCCKShortcutSyncService sendWorkflowOrderingsIfNeeded]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Sending workflow ordering", buf, 0xCu);
  }

  -[VCCKShortcutSyncService database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WFGetBuiltInCollectionIdentifiers();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WFGetAzulBuiltInCollectionIdentifiers();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__VCCKShortcutSyncService_sendWorkflowOrderingsIfNeeded__block_invoke;
  v12[3] = &unk_1E7AA6118;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "if_map:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v11, 0);
}

- (void)sendSyncFlagsIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0DD9CC0], "syncedFlagsHash");
  v4 = objc_msgSend(MEMORY[0x1E0DD9CC0], "lastSyncedFlagsHash");
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3 == v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[VCCKShortcutSyncService sendSyncFlagsIfNeeded]";
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s Synced flags hash hasn't changed, bailing out", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[VCCKShortcutSyncService sendSyncFlagsIfNeeded]";
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Sending sync flags", buf, 0xCu);
    }

    v7 = (void *)MEMORY[0x1E0DD9CB8];
    -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordIDWithZoneID:", v8);
    v6 = objc_claimAutoreleasedReturnValue();

    v10 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v9, 0);

  }
}

- (id)rootCollectionRecord
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[VCCKShortcutSyncService database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionRecordForCollectionIdentifier:createIfNecessary:", *MEMORY[0x1E0DDA0C8], 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    getWFCloudKitSyncLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[VCCKShortcutSyncService rootCollectionRecord]";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Could not find WFWorkflowCollectionRecord for root collection", (uint8_t *)&v7, 0xCu);
    }

  }
  return v3;
}

- (id)collectionIdentifierForRecordID:(id)a3
{
  id v3;
  NSObject *v4;
  id *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[VCCKShortcutSyncService collectionIdentifierForRecordID:]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Getting collection identifier from CKRecordID", (uint8_t *)&v9, 0xCu);
  }

  v5 = (id *)0x1E0DD9C88;
  if ((objc_msgSend(MEMORY[0x1E0DD9C88], "isOrderingRecordID:", v3) & 1) == 0
    && (v5 = (id *)0x1E0DD9C70, !objc_msgSend(MEMORY[0x1E0DD9C70], "isOrderingRecordID:", v3))
    || (objc_msgSend(*v5, "collectionIdentifierForRecordID:", v3),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    getWFCloudKitSyncLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[VCCKShortcutSyncService collectionIdentifierForRecordID:]";
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get collection identifier from CKRecordID %{public}@", (uint8_t *)&v9, 0x16u);
    }

    v6 = 0;
  }

  return v6;
}

- (id)workflowOrderingRecordForRecordID:(id)a3
{
  id v4;
  NSObject *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  _BOOL4 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  NSObject *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[VCCKShortcutSyncService workflowOrderingRecordForRecordID:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Constructing workflow ordering CKRecord", buf, 0xCu);
  }

  -[VCCKShortcutSyncService collectionIdentifierForRecordID:](self, "collectionIdentifierForRecordID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VCCKShortcutSyncService database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionRecordForCollectionIdentifier:createIfNecessary:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      getWFCloudKitSyncLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[VCCKShortcutSyncService workflowOrderingRecordForRecordID:]";
        v46 = 2114;
        v47 = v6;
        _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_INFO, "%s Could not find WFWorkflowCollectionRecord for collection identifier %{public}@, retuning nil CKRecord", buf, 0x16u);
      }
      v23 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v8, "shortcutOrdering");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastRemoteShortcutOrderingSubset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastRemoteShortcutOrdering");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncService mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:](self, "mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:", v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "collectionOrdering");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastRemoteCollectionOrderingSubset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastRemoteCollectionOrdering");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncService mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:](self, "mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:", v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[VCCKShortcutSyncService database](self, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "workflowsWithTombstonedConflicts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "descriptors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueForKey:", CFSTR("identifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "count"))
    {
      v21 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v21, "removeObjectsInArray:", v20);

      v12 = v21;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DDA0C8]))
    {
      objc_msgSend(v8, "cloudKitOrderingRecordMetadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v22 == 0;

    }
    else
    {
      v43 = 0;
    }
    objc_msgSend(v8, "lastRemoteShortcutOrdering");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v12;
    if (objc_msgSend(v25, "count") && -[NSObject count](v24, "count"))
    {
      v26 = objc_msgSend(v25, "isEqualToOrderedSet:", v24);

      if ((v26 & 1) == 0)
      {
LABEL_17:

        goto LABEL_24;
      }
    }
    else
    {
      v27 = objc_msgSend(v25, "count");
      v28 = -[NSObject count](v24, "count");

      if (v27 != v28)
        goto LABEL_17;
    }
    objc_msgSend(v8, "lastRemoteCollectionOrdering", v20);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v16;
    v31 = v16;
    if (objc_msgSend(v29, "count") && objc_msgSend(v31, "count"))
    {
      v32 = objc_msgSend(v29, "isEqualToOrderedSet:", v31);
    }
    else
    {
      v33 = objc_msgSend(v29, "count");
      v32 = v33 == objc_msgSend(v31, "count");
    }

    v16 = v30;
    v20 = v42;
    if (((v32 ^ 1 | v43) & 1) == 0)
    {
      getWFCloudKitSyncLogObject();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v45 = "-[VCCKShortcutSyncService workflowOrderingRecordForRecordID:]";
        v46 = 2114;
        v47 = v6;
        v48 = 1026;
        LODWORD(v49) = 0;
        _os_log_impl(&dword_1C146A000, v37, OS_LOG_TYPE_INFO, "%s Not returning an ordering CKRecord for collection %{public}@ because orderings did not change since last sync, isUnsyncedRootCollectionRecord = %{public}d", buf, 0x1Cu);
      }
      v23 = 0;
      goto LABEL_30;
    }
LABEL_24:
    getWFCloudKitSyncLogObject();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "lastRemoteShortcutOrdering");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastRemoteCollectionOrdering");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      v45 = "-[VCCKShortcutSyncService workflowOrderingRecordForRecordID:]";
      v46 = 2114;
      v47 = v6;
      v48 = 2114;
      v49 = v35;
      v50 = 2114;
      v51 = v24;
      v52 = 2114;
      v53 = v36;
      v54 = 2114;
      v55 = v16;
      _os_log_impl(&dword_1C146A000, v34, OS_LOG_TYPE_INFO, "%s Returning new ordering for %{public}@: lastRemoteShortcutOrdering = %{public}@, mergedOrderedWorkflowIDs = %{public}@, lastRemoteCollectionOrdering = %{public}@, mergedOrderedFolderIDs = %{public}@", buf, 0x3Eu);

    }
    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0DD9C88]), "initWithIdentifier:orderedWorkflowIDs:orderedFolderIDs:", v4, v24, v16);
    objc_msgSend(v8, "cloudKitOrderingRecordMetadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRecordSystemFieldsData:](v37, "setRecordSystemFieldsData:", v38);

    v39 = (void *)MEMORY[0x1E0DD9C98];
    -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "createRecordFromItem:zoneID:", v37, v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
LABEL_31:

    goto LABEL_32;
  }
  v23 = 0;
LABEL_32:

  return v23;
}

- (id)syncFlagsRecord
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[VCCKShortcutSyncService syncFlagsRecord]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEFAULT, "%s Constructing sync flags CKRecord", (uint8_t *)&v11, 0xCu);
  }

  -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9CB8]), "initWithZoneID:", v4);
  objc_msgSend(v5, "setMigratedVoiceShortcuts:", objc_msgSend(MEMORY[0x1E0DD9CC0], "voiceShortcutMigrationDidRun"));
  objc_msgSend(v5, "setDefaultShortcutsVersion:", objc_msgSend(MEMORY[0x1E0DD9CC0], "defaultShortcutsVersion"));
  -[VCCKShortcutSyncService database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncFlagsCloudKitRecordMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecordSystemFieldsData:", v8);

  objc_msgSend(MEMORY[0x1E0DD9C98], "createRecordFromItem:zoneID:", v5, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)workflowRecordForRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v28 = 136315138;
    v29 = "-[VCCKShortcutSyncService workflowRecordForRecordID:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Constructing workflow CKRecord", (uint8_t *)&v28, 0xCu);
  }

  v6 = (void *)MEMORY[0x1C3BAFA00]();
  objc_msgSend(v4, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1C3BAFA00]();
  v9 = (void *)MEMORY[0x1C3BAFA00]();
  -[VCCKShortcutSyncService database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "referenceForWorkflowID:includingTombstones:", v7, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    getWFCloudKitSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 136315394;
      v29 = "-[VCCKShortcutSyncService workflowRecordForRecordID:]";
      v30 = 2114;
      v31 = v7;
      v13 = "%s Failed to load WFWorkflowReference for workflow with identifier %{public}@, has the workflow been deleted?";
      goto LABEL_9;
    }
LABEL_11:

    objc_autoreleasePoolPop(v9);
LABEL_12:
    objc_autoreleasePoolPop(v8);
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "isDeleted"))
  {
    getWFCloudKitSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 136315394;
      v29 = "-[VCCKShortcutSyncService workflowRecordForRecordID:]";
      v30 = 2114;
      v31 = v7;
      v13 = "%s WFWorkflowReference for workflow with identifier %{public}@ is a tombstone, not returning CKRecord";
LABEL_9:
      v14 = v12;
      v15 = 22;
LABEL_10:
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v28, v15);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  -[VCCKShortcutSyncService database](self, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hasConflictingReferenceForReference:", v11);

  if (v19)
  {
    getWFCloudKitSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v28 = 136315138;
    v29 = "-[VCCKShortcutSyncService workflowRecordForRecordID:]";
    v13 = "%s Shortcut is a conflict, but sync engine is asking for a workflow record for it, retuning nil";
    v14 = v12;
    v15 = 12;
    goto LABEL_10;
  }
  -[VCCKShortcutSyncService workflowRecordForReference:properties:](self, "workflowRecordForReference:properties:", v11, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  if (!v20)
    goto LABEL_12;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9CD0]), "initWithRecord:identifier:", v20, v4);

  objc_autoreleasePoolPop(v8);
  if ((objc_msgSend(v21, "isValidForSyncing") & 1) != 0)
  {
    objc_msgSend(v21, "serializedDataFile");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncService filesReferencedUntilSaved](self, "filesReferencedUntilSaved");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v7);

    v25 = (void *)MEMORY[0x1E0DD9C98];
    -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "createRecordFromItem:zoneID:", v21, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  getWFCloudKitSyncLogObject();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = 136315394;
    v29 = "-[VCCKShortcutSyncService workflowRecordForRecordID:]";
    v30 = 2112;
    v31 = v21;
    _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_ERROR, "%s Not creating a CKRecord from WFCloudKitWorkflow instance because it's not valid: %@", (uint8_t *)&v28, 0x16u);
  }

LABEL_13:
  v16 = 0;
LABEL_14:

  objc_autoreleasePoolPop(v6);
  return v16;
}

- (id)folderRecordForRecordID:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v22 = 136315138;
    v23 = "-[VCCKShortcutSyncService folderRecordForRecordID:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Constructing folder CKRecord", (uint8_t *)&v22, 0xCu);
  }

  v6 = (void *)MEMORY[0x1C3BAFA00]();
  objc_msgSend(MEMORY[0x1E0DD9C90], "collectionIdentifierForRecordID:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    getWFCloudKitSyncLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      v23 = "-[VCCKShortcutSyncService folderRecordForRecordID:]";
      v24 = 2114;
      v25 = v4;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get collection identifier from folder CKRecord with CKRecordID %{public}@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_14;
  }
  v8 = v7;
  v9 = (void *)MEMORY[0x1C3BAFA00]();
  -[VCCKShortcutSyncService database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionWithIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (!objc_msgSend(v11, "isDeleted"))
    {
      -[VCCKShortcutSyncService database](self, "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "collectionRecordForCollectionIdentifier:createIfNecessary:", v8, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9C90]), "initWithCollectionRecord:identifier:", v17, v4);
      objc_msgSend(v17, "cloudKitFolderRecordMetadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRecordSystemFieldsData:", v19);

      objc_autoreleasePoolPop(v9);
      v20 = (void *)MEMORY[0x1E0DD9C98];
      -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createRecordFromItem:zoneID:", v18, v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    getWFCloudKitSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v22 = 136315394;
    v23 = "-[VCCKShortcutSyncService folderRecordForRecordID:]";
    v24 = 2114;
    v25 = v8;
    v13 = "%s WFWorkflowCollection for folder with identifier %{public}@ is a tombstone, not returning CKRecord";
    goto LABEL_12;
  }
  getWFCloudKitSyncLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315394;
    v23 = "-[VCCKShortcutSyncService folderRecordForRecordID:]";
    v24 = 2114;
    v25 = v8;
    v13 = "%s Unable to find a collection in the database with identifier: %{public}@";
LABEL_12:
    _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v22, 0x16u);
  }
LABEL_13:

  objc_autoreleasePoolPop(v9);
LABEL_14:
  v14 = 0;
LABEL_15:

  objc_autoreleasePoolPop(v6);
  return v14;
}

- (id)autoShortcutsPreferencesRecordForRecordID:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[VCCKShortcutSyncService autoShortcutsPreferencesRecordForRecordID:]";
    v27 = 2114;
    v28 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Constructing auto shortcuts preferences CKRecord for recordID: %{public}@", buf, 0x16u);
  }

  v6 = (void *)MEMORY[0x1C3BAFA00]();
  objc_msgSend(MEMORY[0x1E0DD9C80], "identifierForRecordID:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    getWFCloudKitSyncLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[VCCKShortcutSyncService autoShortcutsPreferencesRecordForRecordID:]";
      v27 = 2114;
      v28 = v4;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get identifier from auto shortcuts preferences CKRecord with CKRecordID %{public}@", buf, 0x16u);
    }
    goto LABEL_13;
  }
  v8 = v7;
  v9 = (void *)MEMORY[0x1C3BAFA00]();
  -[VCCKShortcutSyncService database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v10, "autoShortcutsPreferencesForIdentifier:error:", v8, &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;

  if (!v11)
  {
    getWFCloudKitSyncLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "-[VCCKShortcutSyncService autoShortcutsPreferencesRecordForRecordID:]";
      v27 = 2114;
      v28 = v8;
      v29 = 2114;
      v30 = v12;
      _os_log_impl(&dword_1C146A000, v22, OS_LOG_TYPE_DEFAULT, "%s Unable to find auto shortcuts preferences in the database with identifier: %{public}@, error: %{public}@", buf, 0x20u);
    }

    objc_autoreleasePoolPop(v9);
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9C80]), "initWithAutoShortcutsPreferences:identifier:", v11, v4);

  objc_autoreleasePoolPop(v9);
  v14 = (void *)MEMORY[0x1E0DD9C98];
  -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createRecordFromItem:zoneID:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  getWFCloudKitSyncLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    -[NSObject recordName](v4, "recordName");
    v18 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[VCCKShortcutSyncService autoShortcutsPreferencesRecordForRecordID:]";
    v27 = 2114;
    v28 = v18;
    _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_INFO, "%s Setting file representations for the auto shortcuts preferences record: %{public}@", buf, 0x16u);

  }
  -[VCCKShortcutSyncService filesReferencedUntilSaved](self, "filesReferencedUntilSaved");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileRepresentations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject recordName](v4, "recordName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, v21);

LABEL_14:
  objc_autoreleasePoolPop(v6);

  return v16;
}

- (id)libraryRecordForRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[VCCKShortcutSyncService libraryRecordForRecordID:]";
    v28 = 2114;
    v29 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Constructing library CKRecord for recordID: %{public}@", buf, 0x16u);
  }

  v6 = (void *)MEMORY[0x1C3BAFA00]();
  objc_msgSend(MEMORY[0x1E0DD9CA8], "libraryIdentifierFromRecordID:error:", v4, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    getWFCloudKitSyncLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[VCCKShortcutSyncService libraryRecordForRecordID:]";
      v28 = 2114;
      v29 = v4;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get identifier from library CKRecord with CKRecordID %{public}@", buf, 0x16u);
    }
    goto LABEL_15;
  }
  v8 = v7;
  v9 = (void *)MEMORY[0x1C3BAFA00]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v8, 10);
  -[VCCKShortcutSyncService database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v11, "recordWithDescriptor:properties:error:", v10, 0, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;

  if (v13)
  {
    getWFCloudKitSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[VCCKShortcutSyncService libraryRecordForRecordID:]";
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to fetch library record with error: %{public}@", buf, 0x16u);
    }
    v15 = 0;
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0DD9CA8]);
    -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "initWithLibraryRecord:zoneID:", v12, v17);

    objc_msgSend(v12, "cloudKitRecordMetadata");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRecordSystemFieldsData:", v14);
  }

  objc_autoreleasePoolPop(v9);
  if (v13 || !v15)
  {

LABEL_15:
    v23 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v15, "dataFileRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCKShortcutSyncService filesReferencedUntilSaved](self, "filesReferencedUntilSaved");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v8);

  v21 = (void *)MEMORY[0x1E0DD9C98];
  -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "createRecordFromItem:zoneID:", v15, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  objc_autoreleasePoolPop(v6);

  return v23;
}

- (id)autoShortcutsPreferencesWithCloudKitAutoShortcutsPreferences:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0DD9C58];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "appDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isSiriEnabled");
  v8 = objc_msgSend(v4, "isSpotlightEnabled");
  objc_msgSend(v4, "disabledAutoShortcuts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordSystemFieldsData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v5, "initWithAppDescriptor:isSiriEnabled:isSpotlightEnabled:disabledAutoShortcuts:cloudKitMetadata:", v6, v7, v8, v9, v10);
  objc_msgSend(v11, "setLastSyncedHash:", objc_msgSend(v11, "computedSyncHash"));
  return v11;
}

- (void)handleSavedWorkflowOrderingRecord:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[VCCKShortcutSyncService handleSavedWorkflowOrderingRecord:]";
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling saved workflow ordering CKRecord: %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v6, v4, 0);
  objc_msgSend(v6, "collectionIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v7, 2);
    -[VCCKShortcutSyncService database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionRecordForCollectionIdentifier:createIfNecessary:", v7, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "orderedWorkflowIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setLastRemoteShortcutOrdering:](v10, "setLastRemoteShortcutOrdering:", v11);

      objc_msgSend(v6, "orderedWorkflowIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject shortcutOrdering](v10, "shortcutOrdering");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCCKShortcutSyncService calculateSubsetForRemoteOrdering:withLocalOrdering:](self, "calculateSubsetForRemoteOrdering:withLocalOrdering:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setLastRemoteShortcutOrderingSubset:](v10, "setLastRemoteShortcutOrderingSubset:", v14);

      objc_msgSend(v6, "orderedFolderIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setLastRemoteCollectionOrdering:](v10, "setLastRemoteCollectionOrdering:", v15);

      objc_msgSend(v6, "orderedFolderIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject collectionOrdering](v10, "collectionOrdering");
      v17 = objc_claimAutoreleasedReturnValue();
      -[VCCKShortcutSyncService calculateSubsetForRemoteOrdering:withLocalOrdering:](self, "calculateSubsetForRemoteOrdering:withLocalOrdering:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setLastRemoteCollectionOrderingSubset:](v10, "setLastRemoteCollectionOrderingSubset:", v18);

      objc_msgSend(v6, "recordSystemFieldsData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setCloudKitOrderingRecordMetadata:](v10, "setCloudKitOrderingRecordMetadata:", v19);

      -[VCCKShortcutSyncService database](self, "database");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      LOBYTE(v17) = objc_msgSend(v20, "saveRecord:withDescriptor:error:", v10, v8, &v23);
      v21 = v23;

      if ((v17 & 1) == 0)
      {
        getWFCloudKitSyncLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v25 = "-[VCCKShortcutSyncService handleSavedWorkflowOrderingRecord:]";
          v26 = 2114;
          v27 = v21;
          _os_log_impl(&dword_1C146A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to save folder record: %{public}@", buf, 0x16u);
        }

      }
    }
    else
    {
      getWFCloudKitSyncLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[VCCKShortcutSyncService handleSavedWorkflowOrderingRecord:]";
        v26 = 2114;
        v27 = v7;
        _os_log_impl(&dword_1C146A000, v21, OS_LOG_TYPE_DEFAULT, "%s Failed to get WFWorkflowCollectionRecord for collection with identifier %{public}@, has it been deleted?", buf, 0x16u);
      }
    }

    goto LABEL_14;
  }
  getWFCloudKitSyncLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[NSObject recordID](v4, "recordID");
    v10 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[VCCKShortcutSyncService handleSavedWorkflowOrderingRecord:]";
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Unable to retrieve collection identifier from ordering CKRecord with identifier %@", buf, 0x16u);
LABEL_14:

  }
}

- (void)handleSavedWorkflowRecord:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[NSObject recordID](v4, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v22 = "-[VCCKShortcutSyncService handleSavedWorkflowRecord:]";
    v23 = 2114;
    v24 = v6;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling saved workflow CKRecord with CKRecordID %{public}@, workflowRecord = %@", buf, 0x20u);

  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v7, v4, 0);
  -[NSObject recordID](v4, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCCKShortcutSyncService filesReferencedUntilSaved](self, "filesReferencedUntilSaved");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v9);

  -[VCCKShortcutSyncService database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "referenceForWorkflowID:includingTombstones:", v9, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_opt_new();
    -[VCCKShortcutSyncService workflowRecordForReference:properties:](self, "workflowRecordForReference:properties:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v7, "recordSystemFieldsData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setCloudKitRecordMetadata:](v14, "setCloudKitRecordMetadata:", v15);

      -[NSObject setLastSyncedHash:](v14, "setLastSyncedHash:", objc_msgSend(v7, "cachedSyncHash"));
      -[NSObject setLastSyncedEncryptedSchemaVersion:](v14, "setLastSyncedEncryptedSchemaVersion:", objc_msgSend(v7, "encryptedSchemaVersion"));
      -[VCCKShortcutSyncService database](self, "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v17 = objc_msgSend(v16, "saveRecord:withDescriptor:error:", v14, v12, &v20);
      v18 = v20;

      if ((v17 & 1) == 0)
      {
        getWFCloudKitSyncLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v22 = "-[VCCKShortcutSyncService handleSavedWorkflowRecord:]";
          v23 = 2114;
          v24 = v18;
          v25 = 2112;
          v26 = v14;
          _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_ERROR, "%s Failed to save WFWorkflowRecord: %{public}@, record = %@", buf, 0x20u);
        }

      }
    }
  }
  else
  {
    getWFCloudKitSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[VCCKShortcutSyncService handleSavedWorkflowRecord:]";
      v23 = 2114;
      v24 = v9;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to get local workflow reference from workflow CKRecord with identifier: %{public}@, has the workflow been deleted?", buf, 0x16u);
    }
  }

}

- (void)handleSavedFolderRecord:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  NSObject *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "recordID");
    v6 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v22 = "-[VCCKShortcutSyncService handleSavedFolderRecord:]";
    v23 = 2114;
    v24 = v6;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling saved folder CKRecord with CKRecordID %{public}@, folderRecord = %@", buf, 0x20u);

  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v7, v4, 0);
  v8 = (void *)MEMORY[0x1E0DD9C90];
  objc_msgSend(v4, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionIdentifierForRecordID:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v10, 2);
    -[VCCKShortcutSyncService database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionRecordForCollectionIdentifier:createIfNecessary:", v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v7, "recordSystemFieldsData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCloudKitFolderRecordMetadata:", v14);

      objc_msgSend(v13, "setLastSyncedHash:", objc_msgSend(v13, "computedSyncHash"));
      objc_msgSend(v13, "setLastSyncedEncryptedSchemaVersion:", objc_msgSend(v7, "encryptedSchemaVersion"));
      -[VCCKShortcutSyncService database](self, "database");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v16 = objc_msgSend(v15, "saveRecord:withDescriptor:error:", v13, v11, &v20);
      v17 = v20;

      if ((v16 & 1) == 0)
      {
        getWFCloudKitSyncLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "-[VCCKShortcutSyncService handleSavedFolderRecord:]";
          v23 = 2114;
          v24 = v17;
          _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_ERROR, "%s Failed to save folder record: %{public}@", buf, 0x16u);
        }

      }
    }
    else
    {
      getWFCloudKitSyncLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[VCCKShortcutSyncService handleSavedFolderRecord:]";
        v23 = 2114;
        v24 = v10;
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_DEFAULT, "%s Failed to get WFWorkflowCollectionRecord for collection with identifier %{public}@, has it been deleted?", buf, 0x16u);
      }
    }

  }
  else
  {
    getWFCloudKitSyncLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "recordID");
      v19 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[VCCKShortcutSyncService handleSavedFolderRecord:]";
      v23 = 2114;
      v24 = v19;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s Invalid folder record ID: %{public}@", buf, 0x16u);

    }
  }

}

- (void)handleSavedSyncFlagsRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[VCCKShortcutSyncService handleSavedSyncFlagsRecord:]";
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling saved sync flags CKRecord: %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v6, v4, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__VCCKShortcutSyncService_handleSavedSyncFlagsRecord___block_invoke;
  v8[3] = &unk_1E7AA60C8;
  v7 = v6;
  v9 = v7;
  -[VCCKShortcutSyncService updateSyncTokenInDatabaseWithBlock:](self, "updateSyncTokenInDatabaseWithBlock:", v8);
  if (objc_msgSend(v7, "migratedVoiceShortcuts"))
    objc_msgSend(MEMORY[0x1E0DD9CC0], "setVoiceShortcutMigrationDidSync:", 1);
  if (objc_msgSend(v7, "defaultShortcutsVersion"))
    objc_msgSend(MEMORY[0x1E0DD9CC0], "setDefaultShortcutsVersion:", objc_msgSend(v7, "defaultShortcutsVersion"));
  objc_msgSend(MEMORY[0x1E0DD9CC0], "setLastSyncedFlagsHash:", objc_msgSend(MEMORY[0x1E0DD9CC0], "syncedFlagsHash"));

}

- (void)handleSavedAutoShortcutsPreferencesRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[VCCKShortcutSyncService handleSavedAutoShortcutsPreferencesRecord:]";
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Handling saved auto shortcuts preferences record: %@", buf, 0x16u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0DD9C80]);
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v6, v4, 0);
  v7 = (void *)MEMORY[0x1E0DD9C80];
  objc_msgSend(v4, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifierForRecordID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCCKShortcutSyncService database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v10, "autoShortcutsPreferencesForIdentifier:error:", v9, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;

  objc_msgSend(v6, "recordSystemFieldsData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCloudKitMetadata:", v13);

  objc_msgSend(v11, "setLastSyncedHash:", objc_msgSend(v11, "computedSyncHash"));
  -[VCCKShortcutSyncService database](self, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  objc_msgSend(v14, "updateAutoShortcutsPreferencesWithNewPreferences:error:", v11, &v17);
  v15 = v17;

  if (v15)
  {
    getWFCloudKitSyncLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[VCCKShortcutSyncService handleSavedAutoShortcutsPreferencesRecord:]";
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_ERROR, "%s Failed to save auto shortcuts preferences record with error: %{public}@", buf, 0x16u);
    }

  }
}

- (void)handleSavedLibraryRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[VCCKShortcutSyncService handleSavedLibraryRecord:]";
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Handling saved library record: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[VCCKShortcutSyncService database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[VCCKLibrarySyncCoordinator handleSavedLibraryRecord:database:error:](_TtC14VoiceShortcuts26VCCKLibrarySyncCoordinator, "handleSavedLibraryRecord:database:error:", v4, v8, 0);

  if (!v9)
  {
    getWFCloudKitSyncLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[VCCKShortcutSyncService handleSavedLibraryRecord:]";
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to save library record: %{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (void)handleDeletedRecordWithID:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[VCCKShortcutSyncService handleDeletedRecordWithID:]";
    v21 = 2114;
    v22 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling deleted record CKRecord: %{public}@", buf, 0x16u);
  }

  if (!objc_msgSend(MEMORY[0x1E0DD9C90], "isFolderRecordID:", v4))
  {
    -[VCCKShortcutSyncService database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject recordName](v4, "recordName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "referenceForWorkflowID:includingTombstones:", v11, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_12;
    if ((-[NSObject isDeleted](v9, "isDeleted") & 1) == 0)
    {
      getWFCloudKitSyncLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      -[NSObject name](v9, "name");
      v15 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v20 = "-[VCCKShortcutSyncService handleDeletedRecordWithID:]";
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v9;
      v16 = "%s Sync engine has finished deleting workflow with name %@, but it is no longer a tombstone, so we're not de"
            "leting it, deletedWorkflowReference = %@";
      v17 = v14;
      goto LABEL_16;
    }
LABEL_9:
    -[VCCKShortcutSyncService database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v13 = objc_msgSend(v12, "deleteReference:tombstone:deleteConflictIfPresent:error:", v9, 0, 1, &v18);
    v14 = v18;

    if ((v13 & 1) != 0)
    {
LABEL_18:

      goto LABEL_19;
    }
    getWFCloudKitSyncLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315650;
    v20 = "-[VCCKShortcutSyncService handleDeletedRecordWithID:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2114;
    v24 = v14;
    v16 = "%s Failed to delete tombstone for descriptor = %@, error = %{public}@";
    v17 = v15;
LABEL_16:
    _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0DD9C90], "collectionIdentifierForRecordID:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[VCCKShortcutSyncService database](self, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionWithIdentifier:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_9;
  }
LABEL_12:
  getWFCloudKitSyncLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[NSObject recordName](v4, "recordName");
    v14 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v20 = "-[VCCKShortcutSyncService handleDeletedRecordWithID:]";
    v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Unable to find descriptor to delete from record ID %{public}@", buf, 0x16u);
    goto LABEL_18;
  }
LABEL_19:

}

- (BOOL)mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  NSObject *v22;
  char v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  void *context;
  NSObject *v99;
  void *v100;
  NSObject *log;
  id obj;
  uint64_t v104;
  void *v105;
  id v106;
  _QWORD v107[5];
  NSObject *v108;
  NSObject *v109;
  _BYTE *v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  _QWORD v121[5];
  id v122;
  NSObject *v123;
  _BYTE *v124;
  uint8_t v125[4];
  const char *v126;
  __int16 v127;
  id v128;
  __int16 v129;
  void *v130;
  _BYTE v131[128];
  uint8_t v132[128];
  _BYTE buf[24];
  uint64_t (*v134)(uint64_t, uint64_t);
  void (*v135)(uint64_t);
  id v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v105 = (void *)objc_opt_new();
  v100 = v3;
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:");
  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v105;
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Merging local ordering changes with remote ordering changes from %{public}@", buf, 0x16u);
  }

  objc_msgSend(v105, "collectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC7AA8]);
    objc_msgSend(v105, "collectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v7, "initWithIdentifier:objectType:", v8, 2);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v134 = __Block_byref_object_copy__1187;
    v135 = __Block_byref_object_dispose__1188;
    -[VCCKShortcutSyncService database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "collectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionRecordForCollectionIdentifier:createIfNecessary:", v10, 0);
    v136 = (id)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (!v11)
    {
      -[VCCKShortcutSyncService database](self, "database");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v121[0] = MEMORY[0x1E0C809B0];
      v121[1] = 3221225472;
      v121[2] = __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke;
      v121[3] = &unk_1E7AA6168;
      v124 = buf;
      v121[4] = self;
      v122 = v105;
      v123 = v99;
      v120 = 0;
      objc_msgSend(v24, "performTransactionWithReason:block:error:", CFSTR("merge local ordering & remote ordering"), v121, &v120);
      v25 = v120;

      goto LABEL_21;
    }
    objc_msgSend(v11, "cloudKitOrderingRecordMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0DD9C98];
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "cloudKitOrderingRecordMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordFromSystemFieldsData:error:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "recordChangeTag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "recordChangeTag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16;
      v19 = v17;
      if (v18 == v19)
      {

        goto LABEL_16;
      }
      v20 = v19;
      if (v18 && v19)
      {
        v21 = objc_msgSend(v18, "isEqualToString:", v19);

        if ((v21 & 1) == 0)
          goto LABEL_20;
LABEL_16:
        getWFCloudKitSyncLogObject();
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v105, "collectionIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v125 = 136315394;
          v126 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
          v127 = 2114;
          v128 = v26;
          _os_log_impl(&dword_1C146A000, log, OS_LOG_TYPE_INFO, "%s Local WFWorkflowCollectionRecord with identifier %{public}@ has the same recordChangeTag as fetched ordering record, this is likely our own change, discarding it.", v125, 0x16u);

        }
        v23 = 0;
        goto LABEL_60;
      }

    }
LABEL_20:
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "cloudKitOrderingRecordMetadata");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    VCCKCheckRemoteModificationDateNewerThanLocal(v25, v100);
LABEL_21:

    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "shortcutOrdering");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "lastRemoteShortcutOrderingSubset");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "orderedWorkflowIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncService mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:](self, "mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:", v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setShortcutOrdering:", v30);

    log = objc_opt_new();
    v31 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "isFolder");
    v32 = (uint64_t *)MEMORY[0x1E0DDA0C8];
    if ((v31 & 1) != 0
      || (objc_msgSend(v105, "collectionIdentifier"),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          v34 = objc_msgSend(v33, "isEqualToString:", *v32),
          v33,
          v34))
    {
      context = (void *)MEMORY[0x1C3BAFA00]();
      getWFCloudKitSyncLogObject();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v125 = 136315138;
        v126 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
        _os_log_impl(&dword_1C146A000, v35, OS_LOG_TYPE_INFO, "%s Collection with updated ordering is a folder, pruning shortcuts from other folders if they belong to this folder", v125, 0xCu);
      }

      -[VCCKShortcutSyncService database](self, "database");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sortedVisibleFolders");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "descriptors");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      obj = v38;
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v117;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v117 != v40)
              objc_enumerationMutation(obj);
            v42 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
            v43 = (void *)MEMORY[0x1C3BAFA00]();
            objc_msgSend(v42, "identifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "collectionIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v44, "isEqualToString:", v45);

            if ((v46 & 1) == 0)
            {
              -[VCCKShortcutSyncService database](self, "database");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "identifier");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "collectionRecordForCollectionIdentifier:createIfNecessary:", v48, 0);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v49, "shortcutOrdering");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "shortcutOrdering");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v48) = objc_msgSend(v50, "intersectsOrderedSet:", v51);

              if ((_DWORD)v48)
                -[NSObject setObject:forKey:](log, "setObject:forKey:", v49, v42);

            }
            objc_autoreleasePoolPop(v43);
          }
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
        }
        while (v39);
      }

      objc_msgSend(v105, "collectionIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = *v32;
      v54 = objc_msgSend(v52, "isEqualToString:", *v32);

      if ((v54 & 1) == 0)
      {
        -[VCCKShortcutSyncService rootCollectionRecord](self, "rootCollectionRecord");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "shortcutOrdering");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "shortcutOrdering");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v56, "intersectsOrderedSet:", v57);

        if (v58)
        {
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v53, 2);
          -[NSObject setObject:forKey:](log, "setObject:forKey:", v55, v59);

        }
      }
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      -[NSObject allValues](log, "allValues");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
      if (v61)
      {
        v104 = *(_QWORD *)v113;
        do
        {
          for (j = 0; j != v61; ++j)
          {
            if (*(_QWORD *)v113 != v104)
              objc_enumerationMutation(v60);
            v63 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
            v64 = (void *)MEMORY[0x1C3BAFA00]();
            getWFCloudKitSyncLogObject();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v125 = 136315394;
              v126 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
              v127 = 2112;
              v128 = v63;
              _os_log_impl(&dword_1C146A000, v65, OS_LOG_TYPE_INFO, "%s Will prune shortcuts from the ordering of %@", v125, 0x16u);
            }

            objc_msgSend(v63, "shortcutOrdering");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = (void *)objc_msgSend(v66, "mutableCopy");

            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "shortcutOrdering");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "minusOrderedSet:", v68);

            v69 = objc_msgSend(v67, "count");
            objc_msgSend(v63, "shortcutOrdering");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v69) = v69 < objc_msgSend(v70, "count");

            if ((_DWORD)v69)
            {
              getWFCloudKitSyncLogObject();
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v63, "name");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "name");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v125 = 136315650;
                v126 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
                v127 = 2112;
                v128 = v72;
                v129 = 2112;
                v130 = v73;
                _os_log_impl(&dword_1C146A000, v71, OS_LOG_TYPE_DEFAULT, "%s Pruned some shortcuts from folder %@ because they are now present in folder %@", v125, 0x20u);

              }
              objc_msgSend(v63, "setShortcutOrdering:", v67);
            }

            objc_autoreleasePoolPop(v64);
          }
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
        }
        while (v61);
      }

      objc_autoreleasePoolPop(context);
    }
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "collectionOrdering");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "lastRemoteCollectionOrderingSubset");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "orderedFolderIDs");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncService mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:](self, "mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:", v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setCollectionOrdering:", v77);

    -[VCCKShortcutSyncService database](self, "database");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v111 = 0;
    v23 = objc_msgSend(v78, "saveRecord:withDescriptor:error:", v79, v99, &v111);
    v80 = v111;

    if ((v23 & 1) != 0)
    {
      -[VCCKShortcutSyncService database](self, "database");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "collectionIdentifier");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "collectionRecordForCollectionIdentifier:createIfNecessary:", v82, 0);
      v83 = objc_claimAutoreleasedReturnValue();
      v84 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v83;

      objc_msgSend(v105, "orderedWorkflowIDs");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setLastRemoteShortcutOrdering:", v85);

      objc_msgSend(v105, "orderedWorkflowIDs");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "shortcutOrdering");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCCKShortcutSyncService calculateSubsetForRemoteOrdering:withLocalOrdering:](self, "calculateSubsetForRemoteOrdering:withLocalOrdering:", v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setLastRemoteShortcutOrderingSubset:", v88);

      objc_msgSend(v105, "orderedFolderIDs");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setLastRemoteCollectionOrdering:", v89);

      objc_msgSend(v105, "orderedFolderIDs");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "collectionOrdering");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCCKShortcutSyncService calculateSubsetForRemoteOrdering:withLocalOrdering:](self, "calculateSubsetForRemoteOrdering:withLocalOrdering:", v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setLastRemoteCollectionOrderingSubset:", v92);

      objc_msgSend(v105, "recordSystemFieldsData");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setCloudKitOrderingRecordMetadata:", v93);

      -[VCCKShortcutSyncService database](self, "database");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v107[0] = MEMORY[0x1E0C809B0];
      v107[1] = 3221225472;
      v107[2] = __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke_165;
      v107[3] = &unk_1E7AA6168;
      v107[4] = self;
      v110 = buf;
      v108 = v99;
      v109 = log;
      v106 = v80;
      objc_msgSend(v94, "performTransactionWithReason:block:error:", CFSTR("merge local ordering & remote ordering"), v107, &v106);
      v95 = v106;

      v80 = v95;
    }
    else
    {
      getWFCloudKitSyncLogObject();
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v125 = 136315394;
        v126 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
        v127 = 2114;
        v128 = v80;
        _os_log_impl(&dword_1C146A000, v96, OS_LOG_TYPE_ERROR, "%s Failed to save merged orderings to collection record: %{public}@", v125, 0x16u);
      }

    }
LABEL_60:

    _Block_object_dispose(buf, 8);
    v22 = v99;
    goto LABEL_61;
  }
  getWFCloudKitSyncLogObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v100;
    _os_log_impl(&dword_1C146A000, v22, OS_LOG_TYPE_ERROR, "%s Malformed ordering record, missing collectionIdentifier: %{public}@", buf, 0x16u);
  }
  v23 = 0;
LABEL_61:

  return v23;
}

- (void)applyLegacyOrderedWorkflowIDsToRootCollection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *context;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[VCCKShortcutSyncService applyLegacyOrderedWorkflowIDsToRootCollection:]";
    v43 = 2114;
    v44 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Merging local ordering changes with remote ordering changes from legacy full ordering %{public}@", buf, 0x16u);
  }

  -[VCCKShortcutSyncService rootCollectionRecord](self, "rootCollectionRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "shortcutOrdering");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    context = (void *)MEMORY[0x1C3BAFA00]();
    -[VCCKShortcutSyncService database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedVisibleFolders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __73__VCCKShortcutSyncService_applyLegacyOrderedWorkflowIDsToRootCollection___block_invoke;
    v39[3] = &unk_1E7AA6190;
    v39[4] = self;
    v31 = v12;
    objc_msgSend(v12, "if_flatMap:", v39);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = v14;
    else
      v16 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v13, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = v4;
    v18 = v4;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          v24 = (void *)MEMORY[0x1C3BAFA00]();
          if ((objc_msgSend(v17, "containsObject:", v23) & 1) == 0)
            objc_msgSend(v9, "addObject:", v23);
          objc_autoreleasePoolPop(v24);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v20);
    }

    objc_autoreleasePoolPop(context);
    objc_msgSend(v7, "setShortcutOrdering:", v9);
    -[VCCKShortcutSyncService database](self, "database");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc(MEMORY[0x1E0DC7AA8]);
    v27 = (void *)objc_msgSend(v26, "initWithIdentifier:objectType:", *MEMORY[0x1E0DDA0C8], 2);
    v34 = 0;
    v28 = objc_msgSend(v25, "saveRecord:withDescriptor:error:", v7, v27, &v34);
    v29 = v34;

    if ((v28 & 1) == 0)
    {
      getWFCloudKitSyncLogObject();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[VCCKShortcutSyncService applyLegacyOrderedWorkflowIDsToRootCollection:]";
        v43 = 2114;
        v44 = v29;
        _os_log_impl(&dword_1C146A000, v30, OS_LOG_TYPE_ERROR, "%s Failed to save root collection after merging legacy full shortcut ordering: %{public}@", buf, 0x16u);
      }

    }
    v4 = v33;
  }

}

- (id)mergedOrderingFromLocalOrdering:(id)a3 previousOrdering:(id)a4 remoteOrdering:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_13:
    v10 = (id)objc_opt_new();
    if (v11)
      goto LABEL_4;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCKShortcutSyncService.m"), 920, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localOrdering"));

  if (!v10)
    goto LABEL_13;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_14:
  v11 = (id)objc_opt_new();
LABEL_4:
  if (objc_msgSend(v11, "isEqualToOrderedSet:", v10))
  {
    v12 = v9;
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToOrderedSet:", v10)
      && !objc_msgSend(v11, "isEqualToOrderedSet:", v9))
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__1187;
      v25 = __Block_byref_object_dispose__1188;
      v26 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __91__VCCKShortcutSyncService_mergedOrderingFromLocalOrdering_previousOrdering_remoteOrdering___block_invoke;
      v16[3] = &unk_1E7AA61B8;
      v20 = &v21;
      v17 = v11;
      v18 = v9;
      v19 = v10;
      VCCKPerformBlockInsideAutoreleasePoolInTransaction(CFSTR("VCCKShortcutSyncService.orderingMerge"), v16);
      v13 = (id)v22[5];

      _Block_object_dispose(&v21, 8);
      goto LABEL_10;
    }
    v12 = v11;
  }
  v13 = v12;
LABEL_10:

  return v13;
}

- (id)calculateSubsetForRemoteOrdering:(id)a3 withLocalOrdering:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "intersectOrderedSet:", v6);

  return v9;
}

- (void)handleFetchedCollectionOrderingRecord:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[VCCKShortcutSyncService handleFetchedCollectionOrderingRecord:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling fetched collection ordering CKRecord: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:](self, "mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:", v4);
}

- (void)handleFetchedLegacyOrderingRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[VCCKShortcutSyncService handleFetchedLegacyOrderingRecord:]";
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling fetched legacy ordering CKRecord: %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v6, v4, 0);
  objc_msgSend(v6, "collectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    getWFCloudKitSyncLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[VCCKShortcutSyncService handleFetchedLegacyOrderingRecord:]";
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEFAULT, "%s Received legacy per-collection ordering CKRecord, ignoring", buf, 0xCu);
    }
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__VCCKShortcutSyncService_handleFetchedLegacyOrderingRecord___block_invoke;
    v12[3] = &unk_1E7AA60C8;
    v9 = v6;
    v13 = v9;
    -[VCCKShortcutSyncService updateSyncTokenInDatabaseWithBlock:](self, "updateSyncTokenInDatabaseWithBlock:", v12);
    -[NSObject orderedWorkflowIDs](v9, "orderedWorkflowIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSObject orderedWorkflowIDs](v9, "orderedWorkflowIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCCKShortcutSyncService applyLegacyOrderedWorkflowIDsToRootCollection:](self, "applyLegacyOrderedWorkflowIDsToRootCollection:", v11);

    }
    v8 = v13;
  }

}

- (void)handleNameConflictsForFetchedWorkflowRecord:(id)a3 identifier:(id)a4 shouldMarkFetchedRecordAsTombstone:(BOOL *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  char v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  id obj;
  void *v52;
  uint64_t v53;
  id v54;
  VCCKShortcutSyncService *v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v54 = a4;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = self;
  if (v8)
  {
    -[VCCKShortcutSyncService database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visibleReferencesForWorkflowName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  if (objc_msgSend(v11, "count"))
  {
    getWFCloudKitSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRecordAsTombstone:]";
      v66 = 2114;
      v67 = v54;
      v68 = 2112;
      v69 = v13;
      v70 = 2112;
      v71 = v7;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_INFO, "%s Checking for name conflicts for fetched WFWorkflowRecord with identifier %{public}@ and name %@, WFWorkflowRecord = %@", buf, 0x2Au);

    }
    v52 = v7;

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v49 = v11;
    obj = v11;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (!v14)
    {
      v16 = 0;
      goto LABEL_51;
    }
    v15 = v14;
    v16 = 0;
    v53 = *(_QWORD *)v60;
    while (1)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v60 != v53)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x1C3BAFA00]();
        objc_msgSend(v18, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "localizedStandardCompare:", v54);

        if (v21)
        {
          getWFCloudKitSyncLogObject();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v52, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRecordAsTombstone:]";
            v66 = 2112;
            v67 = v23;
            v68 = 2112;
            v69 = v18;
            _os_log_impl(&dword_1C146A000, v22, OS_LOG_TYPE_DEFAULT, "%s Found local WFWorkflowReference with same name %@ as fetched record, sameNameReference = %@", buf, 0x20u);

          }
          v24 = (void *)MEMORY[0x1C3BAFA00]();
          -[VCCKShortcutSyncService database](v55, "database");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v16;
          objc_msgSend(v25, "recordWithDescriptor:error:", v18, &v58);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v58;

          if (!v26)
          {
            getWFCloudKitSyncLogObject();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRe"
                    "cordAsTombstone:]";
              v66 = 2114;
              v67 = v27;
              v68 = 2112;
              v69 = v18;
              _os_log_impl(&dword_1C146A000, v36, OS_LOG_TYPE_ERROR, "%s Failed to load WFWorkflowRecord for same name WFWorkflowReference, skipping name conflict check: %{public}@, sameNameReference = %@", buf, 0x20u);
            }

            objc_autoreleasePoolPop(v24);
            goto LABEL_38;
          }
          v28 = objc_msgSend(v26, "isEquivalentForSyncTo:", v52);

          objc_autoreleasePoolPop(v24);
          getWFCloudKitSyncLogObject();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if (v28)
          {
            if (v30)
            {
              *(_DWORD *)buf = 136315138;
              v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRe"
                    "cordAsTombstone:]";
              _os_log_impl(&dword_1C146A000, v29, OS_LOG_TYPE_DEFAULT, "%s Local WFWorkflowRecord is equivalent to fetched WFWorkflowRecord with same name, deleting one of them", buf, 0xCu);
            }

            getWFCloudKitSyncLogObject();
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            if (v21 != 1)
            {
              if (v32)
              {
                *(_DWORD *)buf = 136315138;
                v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetched"
                      "RecordAsTombstone:]";
                _os_log_impl(&dword_1C146A000, v31, OS_LOG_TYPE_DEFAULT, "%s Deleting remote WFWorkflowRecord", buf, 0xCu);
              }

              *a5 = 1;
LABEL_38:
              v16 = v27;
              goto LABEL_39;
            }
            if (v32)
            {
              *(_DWORD *)buf = 136315138;
              v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRe"
                    "cordAsTombstone:]";
              _os_log_impl(&dword_1C146A000, v31, OS_LOG_TYPE_DEFAULT, "%s Deleting local WFWorkflowRecord", buf, 0xCu);
            }

            -[VCCKShortcutSyncService database](v55, "database");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = v27;
            v34 = objc_msgSend(v33, "deleteReference:tombstone:deleteConflictIfPresent:error:", v18, 0, 1, &v57);
            v16 = v57;

            if ((v34 & 1) == 0)
            {
              getWFCloudKitSyncLogObject();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetched"
                      "RecordAsTombstone:]";
                v66 = 2114;
                v67 = v16;
                v68 = 2112;
                v69 = v18;
                _os_log_impl(&dword_1C146A000, v35, OS_LOG_TYPE_ERROR, "%s Failed to delete WFWorkflowReference: %{public}@, sameNameReference = %@", buf, 0x20u);
              }

            }
          }
          else
          {
            if (v30)
            {
              *(_DWORD *)buf = 136315138;
              v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRe"
                    "cordAsTombstone:]";
              _os_log_impl(&dword_1C146A000, v29, OS_LOG_TYPE_DEFAULT, "%s Local WFWorkflowRecord is not equivalent to fetched WFWorkflowRecord with same name, renaming local one", buf, 0xCu);
            }

            -[VCCKShortcutSyncService database](v55, "database");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "hasConflictingReferenceForReference:", v18);

            if (v38)
            {
              getWFCloudKitSyncLogObject();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetched"
                      "RecordAsTombstone:]";
                _os_log_impl(&dword_1C146A000, v39, OS_LOG_TYPE_DEFAULT, "%s Local WFWorkflowReference is a conflict, skipping rename", buf, 0xCu);
              }

              goto LABEL_38;
            }
            -[VCCKShortcutSyncService database](v55, "database");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "name");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "suggestedWorkflowNameForName:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            getWFCloudKitSyncLogObject();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v18, "name");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRe"
                    "cordAsTombstone:]";
              v66 = 2112;
              v67 = v44;
              v68 = 2112;
              v69 = v42;
              _os_log_impl(&dword_1C146A000, v43, OS_LOG_TYPE_DEFAULT, "%s Renaming local WFWorkflowReference with name '%@' to '%@'", buf, 0x20u);

            }
            -[VCCKShortcutSyncService database](v55, "database");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v27;
            objc_msgSend(v45, "renameReference:to:error:", v18, v42, &v56);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v56;

            if (!v46)
            {
              getWFCloudKitSyncLogObject();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v65 = "-[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetched"
                      "RecordAsTombstone:]";
                v66 = 2114;
                v67 = v16;
                v68 = 2112;
                v69 = v18;
                _os_log_impl(&dword_1C146A000, v47, OS_LOG_TYPE_ERROR, "%s Failed to rename WFWorkflowReference: %{public}@, sameNameReference = %@", buf, 0x20u);
              }

            }
          }
        }
LABEL_39:
        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v15 != v17);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      v15 = v48;
      if (!v48)
      {
LABEL_51:

        v7 = v52;
        v11 = v49;
        break;
      }
    }
  }

}

- (void)handleFetchedWorkflowRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void (**v16)(void *, uint64_t);
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  id *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  id *v30;
  id v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  NSObject *v43;
  void *v44;
  int v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  _BOOL4 v56;
  void *v57;
  uint64_t v58;
  int v59;
  NSObject *v60;
  _BOOL4 v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  void *v70;
  id v71;
  uint64_t v72;
  char v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void (**v81)(void *, uint64_t);
  void *v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  VCCKShortcutSyncService *v87;
  id v88;
  unsigned __int8 v89;
  id v90;
  _QWORD v91[5];
  id v92;
  void (**v93)(void *, uint64_t);
  id v94;
  _QWORD v95[5];
  id v96;
  id v97;
  _QWORD aBlock[5];
  id v99;
  char v100;
  id v101;
  uint8_t buf[4];
  const char *v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  id v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
    v104 = 2114;
    v105 = (uint64_t)v6;
    v106 = 2112;
    v107 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling fetched workflow CKRecord with CKRecordID %{public}@, CKRecord = %@", buf, 0x20u);

  }
  v7 = (void *)MEMORY[0x1C3BAFA00]();
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v8, v4, 0);
  v101 = 0;
  objc_msgSend(v8, "recordRepresentationWithError:", &v101);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v101;
  v11 = v10;
  if (v9)
  {

    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v100 = 0;
    -[VCCKShortcutSyncService handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRecordAsTombstone:](self, "handleNameConflictsForFetchedWorkflowRecord:identifier:shouldMarkFetchedRecordAsTombstone:", v9, v13, &v100);
    if (v100)
      objc_msgSend(v9, "setDeleted:", 1);
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke;
    aBlock[3] = &unk_1E7AA61E0;
    aBlock[4] = self;
    v15 = v13;
    v99 = v15;
    v16 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    -[VCCKShortcutSyncService database](self, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "referenceForWorkflowID:includingTombstones:", v15, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    getWFCloudKitSyncLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (!v18)
    {
      if (v20)
      {
        *(_DWORD *)buf = 136315394;
        v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
        v104 = 2114;
        v105 = (uint64_t)v15;
        _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_INFO, "%s No local WFWorkflowReference exists for identifier %{public}@, proceeding to create new workflow with fetched record.", buf, 0x16u);
      }

      -[VCCKShortcutSyncService database](self, "database");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v95[0] = v14;
      v95[1] = 3221225472;
      v95[2] = __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_179;
      v95[3] = &unk_1E7AA6208;
      v95[4] = self;
      v21 = &v96;
      v96 = v15;
      v30 = &v97;
      v97 = v9;
      v94 = 0;
      objc_msgSend(v33, "performTransactionWithReason:block:error:", CFSTR("save fetched workflow record"), v95, &v94);
      v31 = v94;

      v16[2](v16, 1);
      goto LABEL_26;
    }
    if (v20)
    {
      *(_DWORD *)buf = 136315394;
      v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
      v104 = 2112;
      v105 = (uint64_t)v18;
      _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_INFO, "%s Found existing local WFWorkflowReference for fetched workflow: %@", buf, 0x16u);
    }

    v91[0] = v14;
    v91[1] = 3221225472;
    v91[2] = __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_182;
    v91[3] = &unk_1E7AA6230;
    v91[4] = self;
    v21 = &v92;
    v22 = v9;
    v92 = v22;
    v81 = v16;
    v93 = v16;
    v79 = _Block_copy(v91);
    -[VCCKShortcutSyncService database](self, "database");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = 0;
    objc_msgSend(v23, "recordWithDescriptor:error:", v18, &v90);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v90;

    v82 = v24;
    if (!v24)
    {
      getWFCloudKitSyncLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      v31 = v80;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
        v104 = 2114;
        v105 = (uint64_t)v80;
        v106 = 2112;
        v107 = v18;
        _os_log_impl(&dword_1C146A000, v34, OS_LOG_TYPE_ERROR, "%s Failed to load local WFWorkflowRecord for WFWorkflowReference, proceeding to save fetched omp without checking for conflicts: %{public}@, localWorkflowReference = %@", buf, 0x20u);
      }

      v29 = v79;
      (*((void (**)(void *, void *))v79 + 2))(v79, v18);
      v30 = (id *)&v93;
      goto LABEL_24;
    }
    if (v100)
    {
      getWFCloudKitSyncLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        v29 = v79;
        (*((void (**)(void *, void *))v79 + 2))(v79, v18);
        v31 = v80;
        v30 = (id *)&v93;
LABEL_24:
        v24 = v82;
LABEL_25:

        v16 = v81;
LABEL_26:

        goto LABEL_27;
      }
      *(_DWORD *)buf = 136315394;
      v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
      v104 = 2114;
      v105 = (uint64_t)v15;
      v26 = "%s Local WFWorkflowRecord with identifier %{public}@ should be marked as tombstone, proceeding to save fetch"
            "ed record as-is.";
      v27 = v25;
      v28 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
      _os_log_impl(&dword_1C146A000, v27, v28, v26, buf, 0x16u);
      goto LABEL_14;
    }
    objc_msgSend(v24, "cloudKitRecordMetadata");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v75 = (void *)v35;
      v36 = (void *)MEMORY[0x1E0DD9C98];
      objc_msgSend(v24, "cloudKitRecordMetadata");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "recordFromSystemFieldsData:error:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "recordChangeTag");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordChangeTag");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v38;
      v41 = v39;
      if (v40 == v41)
      {

        v21 = &v92;
        goto LABEL_35;
      }
      v42 = v41;
      if (v40 && v41)
      {
        v73 = objc_msgSend(v40, "isEqualToString:", v41);

        v21 = &v92;
        v24 = v82;
        if ((v73 & 1) == 0)
          goto LABEL_39;
LABEL_35:
        getWFCloudKitSyncLogObject();
        v43 = objc_claimAutoreleasedReturnValue();
        v31 = v80;
        v30 = (id *)&v93;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
          v104 = 2114;
          v105 = (uint64_t)v15;
          _os_log_impl(&dword_1C146A000, v43, OS_LOG_TYPE_INFO, "%s Local WFWorkflowRecord with identifier %{public}@ has the same recordChangeTag as fetched record, this is likely our own change, discarding it.", buf, 0x16u);
        }

        v29 = v79;
        goto LABEL_24;
      }

      v21 = &v92;
      v24 = v82;
    }
LABEL_39:
    objc_msgSend(v24, "cloudKitRecordMetadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = VCCKCheckRemoteModificationDateNewerThanLocal(v44, v4);

    if (!v45)
    {
      v31 = v80;
      v30 = (id *)&v93;
      v29 = v79;
      goto LABEL_25;
    }
    v78 = v22;
    v46 = v24;
    getWFCloudKitSyncLogObject();
    v47 = objc_claimAutoreleasedReturnValue();
    v76 = v46;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v78, "smartPromptPerWorkflowStates");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v74, "count");
      objc_msgSend(v78, "modificationDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "smartPromptPerWorkflowStates");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");
      objc_msgSend(v76, "modificationDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v103 = "WFMergeSmartPromptPermissionsIntoFetchedRecordIfNeeded";
      v104 = 2048;
      v105 = v72;
      v106 = 2112;
      v107 = v48;
      v108 = 2048;
      v109 = v50;
      v110 = 2112;
      v111 = v51;
      _os_log_impl(&dword_1C146A000, v47, OS_LOG_TYPE_DEFAULT, "%s Syncing smart prompts: %lu in fetchedRecord (modificationDate: %@), %lu in localRecord (modificationDate: %@).", buf, 0x34u);

      v46 = v76;
    }

    objc_msgSend(v78, "modificationDate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "modificationDate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "compare:", v53);

    getWFCloudKitSyncLogObject();
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
    if (v54 == 1)
    {
      if (v56)
      {
        *(_DWORD *)buf = 136315138;
        v103 = "WFMergeSmartPromptPermissionsIntoFetchedRecordIfNeeded";
        _os_log_impl(&dword_1C146A000, v55, OS_LOG_TYPE_DEFAULT, "%s Fetched authorizations are newer than local, they will be used instead of local.", buf, 0xCu);
      }
      v21 = &v92;
      v57 = v76;
    }
    else
    {
      if (v56)
      {
        *(_DWORD *)buf = 136315138;
        v103 = "WFMergeSmartPromptPermissionsIntoFetchedRecordIfNeeded";
        _os_log_impl(&dword_1C146A000, v55, OS_LOG_TYPE_DEFAULT, "%s Fetched authorizations are older than local, will ignore them and overwrite them with local.", buf, 0xCu);
      }

      v57 = v76;
      objc_msgSend(v76, "smartPromptPerWorkflowStates");
      v55 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setSmartPromptPerWorkflowStates:", v55);
      v21 = &v92;
    }

    v58 = objc_msgSend(v57, "syncHash");
    if (v58 != objc_msgSend(v57, "lastSyncedHash"))
    {
      v89 = 0;
      WFAddWatchWorkflowTypeToFetchedRecordIfNeeded(v78, v57, (uint64_t)&v89);
      v59 = v89;
      getWFCloudKitSyncLogObject();
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
      if (!v59)
      {
        if (v61)
        {
          *(_DWORD *)buf = 136315906;
          v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
          v104 = 2114;
          v105 = (uint64_t)v15;
          v106 = 2112;
          v107 = v78;
          v108 = 2112;
          v109 = (uint64_t)v57;
          _os_log_impl(&dword_1C146A000, v60, OS_LOG_TYPE_DEFAULT, "%s Found conflict for workflow with identifier %{public}@: fetched WFRecord = %@, local WFRecord = %@", buf, 0x2Au);
        }

        -[VCCKShortcutSyncService database](self, "database");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "remoteConflictingReferenceForReference:", v18);
        v63 = objc_claimAutoreleasedReturnValue();

        if (v63)
        {
          getWFCloudKitSyncLogObject();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
            v104 = 2112;
            v105 = (uint64_t)v18;
            _os_log_impl(&dword_1C146A000, v64, OS_LOG_TYPE_DEFAULT, "%s WFWorkflowReference %@ is a local counterpart of an existing conflict, updating its remote counterpart", buf, 0x16u);
          }

          v29 = v79;
          (*((void (**)(void *, uint64_t))v79 + 2))(v79, v63);
          v65 = (void *)v63;
          v31 = v80;
          v30 = (id *)&v93;
          v24 = v82;
        }
        else
        {
          -[VCCKShortcutSyncService database](self, "database");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "localConflictingReferenceForReference:", v18);
          v67 = objc_claimAutoreleasedReturnValue();

          v68 = (void *)v67;
          if (v67)
          {
            getWFCloudKitSyncLogObject();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
              v104 = 2112;
              v105 = (uint64_t)v18;
              _os_log_impl(&dword_1C146A000, v69, OS_LOG_TYPE_DEFAULT, "%s WFWorkflowReference %@ is a remote counterpart of an existing conflict, updating it", buf, 0x16u);
            }

            v29 = v79;
            (*((void (**)(void *, void *))v79 + 2))(v79, v18);
            v31 = v80;
            v30 = (id *)&v93;
          }
          else
          {
            -[VCCKShortcutSyncService database](self, "database");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v84[0] = MEMORY[0x1E0C809B0];
            v84[1] = 3221225472;
            v84[2] = __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_186;
            v84[3] = &unk_1E7AA6258;
            v85 = v18;
            v86 = v76;
            v87 = self;
            v88 = v78;
            v83 = v80;
            objc_msgSend(v70, "performTransactionWithReason:block:error:", CFSTR("save fetched workflow record"), v84, &v83);
            v71 = v83;

            v31 = v71;
            v30 = (id *)&v93;
            v29 = v79;
          }

          v24 = v82;
          v65 = 0;
        }

        goto LABEL_25;
      }
      v31 = v80;
      v30 = (id *)&v93;
      if (v61)
      {
        *(_DWORD *)buf = 136315394;
        v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
        v104 = 2114;
        v105 = (uint64_t)v15;
        _os_log_impl(&dword_1C146A000, v60, OS_LOG_TYPE_DEFAULT, "%s Local WFWorkflowRecord with identifier %{public}@ is equivalent to fetched record, proceeding to save fetched record as-is.", buf, 0x16u);
      }

      v29 = v79;
      (*((void (**)(void *, void *))v79 + 2))(v79, v18);
      goto LABEL_24;
    }
    getWFCloudKitSyncLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    *(_DWORD *)buf = 136315394;
    v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
    v104 = 2114;
    v105 = (uint64_t)v15;
    v26 = "%s Local WFWorkflowRecord with identifier %{public}@ has not changed since last sync, proceeding to save fetch"
          "ed record as-is.";
    v27 = v25;
    v28 = OS_LOG_TYPE_INFO;
    goto LABEL_13;
  }
  getWFCloudKitSyncLogObject();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v103 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]";
    v104 = 2114;
    v105 = (uint64_t)v11;
    _os_log_impl(&dword_1C146A000, v32, OS_LOG_TYPE_ERROR, "%s Failed to create WFWorkflowRecord from WFCloudKitWorkflow: %{public}@", buf, 0x16u);
  }

  objc_autoreleasePoolPop(v7);
LABEL_27:

}

- (void)handleFetchedFolderRecord:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t (**v13)(void *, id *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  int v30;
  char v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *oslog;
  id obj;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  _QWORD v72[5];
  id v73;
  uint64_t (**v74)(void *, id *);
  _BYTE *v75;
  id v76;
  _QWORD aBlock[4];
  NSObject *v78;
  VCCKShortcutSyncService *v79;
  id v80;
  _BYTE *v81;
  uint8_t v82[128];
  uint8_t v83[4];
  const char *v84;
  __int16 v85;
  void *v86;
  _BYTE buf[24];
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  getWFCloudKitSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v60, "recordID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v88 = (uint64_t (*)(uint64_t, uint64_t))v60;
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Handling fetched folder CKRecord with CKRecordID %{public}@, CKRecord = %@", buf, 0x20u);

  }
  v5 = (void *)MEMORY[0x1E0DD9C90];
  objc_msgSend(v60, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionIdentifierForRecordID:", v6);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v64)
  {
    getWFCloudKitSyncLogObject();
    oslog = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v60, "recordID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v25;
      _os_log_impl(&dword_1C146A000, oslog, OS_LOG_TYPE_ERROR, "%s Failed to retrieve collection identifier from folder CKRecord, CKRecordID = %{public}@", buf, 0x16u);

    }
    goto LABEL_50;
  }
  v7 = (void *)objc_opt_new();
  v8 = (void *)MEMORY[0x1C3BAFA00](objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v7, v60, 0));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v64, 2);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v88 = __Block_byref_object_copy__1187;
  v89 = __Block_byref_object_dispose__1188;
  -[VCCKShortcutSyncService database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionRecordForCollectionIdentifier:createIfNecessary:", v64, 0);
  v90 = (id)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__VCCKShortcutSyncService_handleFetchedFolderRecord___block_invoke;
  aBlock[3] = &unk_1E7AA6280;
  v81 = buf;
  oslog = v7;
  v78 = oslog;
  v79 = self;
  v12 = v9;
  v80 = v12;
  v13 = (uint64_t (**)(void *, id *))_Block_copy(aBlock);
  v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v14)
  {
    objc_msgSend(v14, "cloudKitFolderRecordMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_19;
    v16 = (void *)MEMORY[0x1E0DD9C98];
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "cloudKitFolderRecordMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordFromSystemFieldsData:error:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recordChangeTag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "recordChangeTag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    v22 = v20;
    if (v21 == v22)
    {

    }
    else
    {
      v23 = v22;
      if (!v21 || !v22)
      {

        goto LABEL_19;
      }
      v24 = objc_msgSend(v21, "isEqualToString:", v22);

      if ((v24 & 1) == 0)
      {
LABEL_19:
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "cloudKitFolderRecordMetadata");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = VCCKCheckRemoteModificationDateNewerThanLocal(v29, v60);

        if (v30)
        {
          v76 = 0;
          v31 = v13[2](v13, &v76);
          v27 = v76;
          if ((v31 & 1) != 0)
            goto LABEL_21;
LABEL_23:
          v32 = 0;
          goto LABEL_24;
        }
LABEL_22:
        v27 = 0;
        goto LABEL_23;
      }
    }
    getWFCloudKitSyncLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v83 = 136315394;
      v84 = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
      v85 = 2114;
      v86 = v64;
      _os_log_impl(&dword_1C146A000, v28, OS_LOG_TYPE_INFO, "%s Local WFWorkflowCollectionRecord with identifier %{public}@ has the same recordChangeTag as fetched folder record, this is likely our own change, discarding it.", v83, 0x16u);
    }

    goto LABEL_22;
  }
  -[VCCKShortcutSyncService database](self, "database");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v11;
  v72[1] = 3221225472;
  v72[2] = __53__VCCKShortcutSyncService_handleFetchedFolderRecord___block_invoke_192;
  v72[3] = &unk_1E7AA62A8;
  v75 = buf;
  v72[4] = self;
  v73 = v64;
  v74 = v13;
  v71 = 0;
  objc_msgSend(v26, "performTransactionWithReason:block:error:", CFSTR("save fetched folder record"), v72, &v71);
  v27 = v71;

LABEL_21:
  v32 = 1;
LABEL_24:

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(v8);
  if (!v32)
    goto LABEL_49;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[VCCKShortcutSyncService database](self, "database");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "allCollections");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "descriptors");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
  if (!v62)
    goto LABEL_48;
  v61 = *(_QWORD *)v68;
  do
  {
    v35 = 0;
    do
    {
      if (*(_QWORD *)v68 != v61)
        objc_enumerationMutation(obj);
      v36 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v35);
      v37 = (void *)MEMORY[0x1C3BAFA00]();
      -[VCCKShortcutSyncService database](self, "database");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "collectionRecordForCollectionIdentifier:createIfNecessary:", v39, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "lastRemoteCollectionOrdering");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "lastRemoteCollectionOrderingSubset");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v41, "containsObject:", v64)
        || (objc_msgSend(v42, "containsObject:", v64) & 1) != 0)
      {
        v43 = 1;
        goto LABEL_33;
      }
      getWFCloudKitSyncLogObject();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v36, "identifier");
        v45 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v64;
        *(_WORD *)&buf[22] = 2114;
        v88 = v45;
        _os_log_impl(&dword_1C146A000, v44, OS_LOG_TYPE_INFO, "%s Merging received collection %{public}@ into collection %{public}@", buf, 0x20u);

      }
      objc_msgSend(v40, "collectionOrdering");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCCKShortcutSyncService mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:](self, "mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:", v46, v42, v41);
      v47 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setCollectionOrdering:", v47);

      -[VCCKShortcutSyncService database](self, "database");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v27;
      LOBYTE(v47) = objc_msgSend(v48, "saveRecord:withDescriptor:error:", v40, v36, &v66);
      v49 = v66;

      if ((v47 & 1) != 0)
      {
        -[VCCKShortcutSyncService database](self, "database");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "identifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "collectionRecordForCollectionIdentifier:createIfNecessary:", v51, 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "collectionOrdering");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCCKShortcutSyncService calculateSubsetForRemoteOrdering:withLocalOrdering:](self, "calculateSubsetForRemoteOrdering:withLocalOrdering:", v41, v53);
        v54 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setLastRemoteCollectionOrderingSubset:", v54);

        -[VCCKShortcutSyncService database](self, "database");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v49;
        LOBYTE(v54) = objc_msgSend(v55, "saveRecord:withDescriptor:error:", v52, v36, &v65);
        v27 = v65;

        if ((v54 & 1) != 0)
        {
          v43 = 1;
          v40 = v52;
          goto LABEL_33;
        }
        getWFCloudKitSyncLogObject();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2114;
          v88 = (uint64_t (*)(uint64_t, uint64_t))v27;
          _os_log_impl(&dword_1C146A000, v56, OS_LOG_TYPE_ERROR, "%s Failed to save potential parent WFWorkflowCollectionRecord with descriptor %@: %{public}@", buf, 0x20u);
        }
        v40 = v52;
        v49 = v27;
      }
      else
      {
        getWFCloudKitSyncLogObject();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2114;
          v88 = (uint64_t (*)(uint64_t, uint64_t))v49;
          _os_log_impl(&dword_1C146A000, v56, OS_LOG_TYPE_ERROR, "%s Failed to save potential parent WFWorkflowCollectionRecord with descriptor %@: %{public}@", buf, 0x20u);
        }
      }

      v43 = 0;
      v27 = v49;
LABEL_33:

      objc_autoreleasePoolPop(v37);
      if (!v43)
        goto LABEL_48;
      ++v35;
    }
    while (v62 != v35);
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    v62 = v57;
  }
  while (v57);
LABEL_48:

LABEL_49:
LABEL_50:

}

- (void)handleFetchedSyncFlagsRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[VCCKShortcutSyncService handleFetchedSyncFlagsRecord:]";
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Handling fetched sync flags CKRecord: %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v6, v4, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__VCCKShortcutSyncService_handleFetchedSyncFlagsRecord___block_invoke;
  v8[3] = &unk_1E7AA60C8;
  v7 = v6;
  v9 = v7;
  -[VCCKShortcutSyncService updateSyncTokenInDatabaseWithBlock:](self, "updateSyncTokenInDatabaseWithBlock:", v8);
  if (objc_msgSend(v7, "migratedVoiceShortcuts"))
    objc_msgSend(MEMORY[0x1E0DD9CC0], "setVoiceShortcutMigrationDidSync:", 1);
  if (objc_msgSend(v7, "defaultShortcutsVersion"))
    objc_msgSend(MEMORY[0x1E0DD9CC0], "setDefaultShortcutsVersion:", objc_msgSend(v7, "defaultShortcutsVersion"));
  objc_msgSend(MEMORY[0x1E0DD9CC0], "setLastSyncedFlagsHash:", objc_msgSend(MEMORY[0x1E0DD9CC0], "syncedFlagsHash"));

}

- (void)handleFetchedAutoShortcutsPreferencesRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[VCCKShortcutSyncService handleFetchedAutoShortcutsPreferencesRecord:]";
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Handling fetched auto shortcuts preferences record: %@", buf, 0x16u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0DD9C80]);
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v6, v4, 0);
  v7 = (void *)MEMORY[0x1E0DD9C80];
  objc_msgSend(v4, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifierForRecordID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCCKShortcutSyncService database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v10, "autoShortcutsPreferencesForIdentifier:error:", v9, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;

  objc_msgSend(v11, "cloudKitMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = VCCKCheckRemoteModificationDateNewerThanLocal(v13, v4);

  getWFCloudKitSyncLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if ((v14 & 1) != 0)
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[VCCKShortcutSyncService handleFetchedAutoShortcutsPreferencesRecord:]";
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_INFO, "%s Remote modification date is newer than the one saved locally, updating local auto shortcuts preferences", buf, 0xCu);
    }

    -[VCCKShortcutSyncService autoShortcutsPreferencesWithCloudKitAutoShortcutsPreferences:](self, "autoShortcutsPreferencesWithCloudKitAutoShortcutsPreferences:", v6);
    v15 = objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncService database](self, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v12;
    objc_msgSend(v17, "updateAutoShortcutsPreferencesWithNewPreferences:error:", v15, &v20);
    v18 = v20;

    if (v18)
    {
      getWFCloudKitSyncLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[VCCKShortcutSyncService handleFetchedAutoShortcutsPreferencesRecord:]";
        v24 = 2114;
        v25 = v18;
        _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_ERROR, "%s Failed to save auto shortcuts preferences with error: %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[VCCKShortcutSyncService handleFetchedAutoShortcutsPreferencesRecord:]";
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_INFO, "%s Remote modification date is older than the one saved locally, skipping updating local auto shortcuts preferences", buf, 0xCu);
    }
    v18 = v12;
  }

}

- (void)handleFetchedDeletionOfRecordWithID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD aBlock[5];
  NSObject *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  NSObject *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
    v45 = 2114;
    v46 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling fetched deleted record with CKRecordID: %{public}@", buf, 0x16u);
  }

  v6 = objc_msgSend(MEMORY[0x1E0DD9C90], "isFolderRecordID:", v4);
  if (!v6)
  {
    objc_msgSend(v4, "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncService database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "referenceForWorkflowID:includingTombstones:", v8, 1);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = (void *)v10;

    if (v11)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__VCCKShortcutSyncService_handleFetchedDeletionOfRecordWithID___block_invoke;
      aBlock[3] = &unk_1E7AA8138;
      aBlock[4] = self;
      v12 = v11;
      v42 = v12;
      v13 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (v6)
      {
        getWFCloudKitSyncLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
          _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEFAULT, "%s Deleting folder since we fetched a deletion for a folder.", buf, 0xCu);
        }

        v13[2](v13);
        goto LABEL_26;
      }
      -[VCCKShortcutSyncService database](self, "database");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      objc_msgSend(v18, "recordWithDescriptor:error:", v12, &v40);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v40;

      if (v19)
      {
        if (!-[NSObject isDeleted](v19, "isDeleted"))
        {
          v24 = -[NSObject syncHash](v19, "syncHash");
          v25 = -[NSObject lastSyncedHash](v19, "lastSyncedHash");
          getWFCloudKitSyncLogObject();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v24 != v25)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject identifier](v12, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
              v45 = 2114;
              v46 = v29;
              v47 = 2112;
              v48 = v19;
              _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_DEFAULT, "%s Found conflict for workflow with identifier %{public}@: remote record deleted, local changed WFRecord = %@", buf, 0x20u);

            }
            v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9F00]), "initWithRecord:", v19);
            objc_msgSend(v30, "setDeleted:", 1);
            -[VCCKShortcutSyncService database](self, "database");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v20;
            objc_msgSend(v31, "createWorkflowWithOptions:error:", v30, &v39);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v39;

            if (v32)
            {
              -[VCCKShortcutSyncService database](self, "database");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject identifier](v12, "identifier");
              v38 = v32;
              v34 = v30;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "referenceForWorkflowID:includingTombstones:", v35, 1);
              v36 = objc_claimAutoreleasedReturnValue();

              v30 = v34;
              v32 = v38;

              -[VCCKShortcutSyncService database](self, "database");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setConflictingReference:forReference:", v36, v38);

            }
            else
            {
              getWFCloudKitSyncLogObject();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
                v45 = 2114;
                v46 = v23;
                v47 = 2112;
                v48 = 0;
                _os_log_impl(&dword_1C146A000, v36, OS_LOG_TYPE_ERROR, "%s Failed to create workflow for WFWorkflowReference: %{public}@, conflictingRemoteReference = %@", buf, 0x20u);
              }
            }

            goto LABEL_25;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            -[NSObject identifier](v12, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
            v45 = 2114;
            v46 = v28;
            _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_INFO, "%s Local WFWorkflowRecord with identifier %{public}@ unchanged since last sync, proceeding to delete local workflow", buf, 0x16u);

          }
LABEL_24:
          v13[2](v13);
          v23 = v20;
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
        getWFCloudKitSyncLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject identifier](v12, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
          v45 = 2114;
          v46 = v22;
          _os_log_impl(&dword_1C146A000, v21, OS_LOG_TYPE_DEFAULT, "%s Local WFWorkflowRecord with identifier %{public}@ is already tombstone, deleting it", buf, 0x16u);

        }
      }
      else
      {
        getWFCloudKitSyncLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
          v45 = 2114;
          v46 = v20;
          v47 = 2112;
          v48 = v12;
          _os_log_impl(&dword_1C146A000, v21, OS_LOG_TYPE_ERROR, "%s Failed to load local WFWorkflowRecord, proceeding to delete local workflow without checking for conflicts: %{public}@, localWorkflowReference = %@", buf, 0x20u);
        }
      }

      goto LABEL_24;
    }
    getWFCloudKitSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
      v45 = 2114;
      v46 = v4;
      v15 = "%s No local descriptor found for fetched workflow or folder deletion with CKRecordID %{public}@";
      v16 = v12;
      v17 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
      _os_log_impl(&dword_1C146A000, v16, v17, v15, buf, 0x16u);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0DD9C90], "collectionIdentifierForRecordID:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[VCCKShortcutSyncService database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionWithIdentifier:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  getWFCloudKitSyncLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]";
    v45 = 2114;
    v46 = v4;
    v15 = "%s Malformed folder identifier: %{public}@";
    v16 = v12;
    v17 = OS_LOG_TYPE_ERROR;
    goto LABEL_20;
  }
LABEL_27:

}

- (void)handleFetchedDeletionOfAutoShortcutsPreferencesWithRecordID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[VCCKShortcutSyncService handleFetchedDeletionOfAutoShortcutsPreferencesWithRecordID:]";
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Handling fetched deleted record with CKRecordID: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0DD9C80], "identifierForRecordID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCKShortcutSyncService database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v7, "deleteAutoShortcutsPreferencesForIdentifier:error:", v6, &v8);

}

- (void)updateSyncTokenInDatabaseWithBlock:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = (void (**)(id, id))a3;
  -[VCCKShortcutSyncService database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newTokenWithCopiedPayload");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new();
  v11 = v9;

  v4[2](v4, v11);
  -[VCCKShortcutSyncService database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSyncToken:", v11);

}

- (void)handleSendWorkflowOrderingConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  getWFCloudKitSyncLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VCCKShortcutSyncService handleSendWorkflowOrderingConflictWithClientRecord:serverRecord:ancestorRecord:]";
    _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent workflow ordering", buf, 0xCu);
  }

  if (-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:](self, "mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:", v6))
  {
    objc_msgSend(v6, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v9, 0);

  }
}

- (void)handleSendSyncFlagsConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  getWFCloudKitSyncLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[VCCKShortcutSyncService handleSendSyncFlagsConflictWithClientRecord:serverRecord:ancestorRecord:]";
    _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent sync flags", buf, 0xCu);
  }

  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v8, v6, 0);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__VCCKShortcutSyncService_handleSendSyncFlagsConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke;
  v10[3] = &unk_1E7AA60C8;
  v11 = v8;
  v9 = v8;
  -[VCCKShortcutSyncService updateSyncTokenInDatabaseWithBlock:](self, "updateSyncTokenInDatabaseWithBlock:", v10);
  -[VCCKShortcutSyncService sendSyncFlagsIfNeeded](self, "sendSyncFlagsIfNeeded");

}

- (void)handleSendAutoShortcutsPreferencesConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  getWFCloudKitSyncLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "recordChangeTag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordChangeTag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordChangeTag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v22 = "-[VCCKShortcutSyncService handleSendAutoShortcutsPreferencesConflictWithClientRecord:serverRecord:ancestorRecord:]";
    v23 = 2114;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    v27 = 2114;
    v28 = v14;
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent auto shortcuts preferences, clientRecord.recordChangeTag = %{public}@, serverRecord.recordChangeTag = %{public}@, ancestorRecord.recordChangeTag = %{public}@", buf, 0x2Au);

  }
  -[VCCKShortcutSyncService syncEngine](self, "syncEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __114__VCCKShortcutSyncService_handleSendAutoShortcutsPreferencesConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke;
  v19[3] = &unk_1E7AA62D0;
  v19[4] = self;
  v20 = v9;
  v18 = v9;
  objc_msgSend(v16, "fetchRecordWithID:completionHandler:", v17, v19);

}

- (void)handleSendLibraryConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  getWFCloudKitSyncLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "recordChangeTag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordChangeTag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordChangeTag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v22 = "-[VCCKShortcutSyncService handleSendLibraryConflictWithClientRecord:serverRecord:ancestorRecord:]";
    v23 = 2114;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    v27 = 2114;
    v28 = v14;
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent library, clientRecord.recordChangeTag = %{public}@, serverRecord.recordChangeTag = %{public}@, ancestorRecord.recordChangeTag = %{public}@", buf, 0x2Au);

  }
  -[VCCKShortcutSyncService syncEngine](self, "syncEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__VCCKShortcutSyncService_handleSendLibraryConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke;
  v19[3] = &unk_1E7AA62D0;
  v19[4] = self;
  v20 = v9;
  v18 = v9;
  objc_msgSend(v16, "fetchRecordWithID:completionHandler:", v17, v19);

}

- (void)handleSendWorkflowConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  NSObject *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  getWFCloudKitSyncLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "recordChangeTag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordChangeTag");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordChangeTag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v41 = "-[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:]";
    v42 = 2114;
    v43 = v12;
    v44 = 2114;
    v45 = v13;
    v46 = 2114;
    v47 = v14;
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent workflow, clientRecord.recordChangeTag = %{public}@, serverRecord.recordChangeTag = %{public}@, ancestorRecord.recordChangeTag = %{public}@", buf, 0x2Au);

  }
  objc_msgSend(v8, "recordChangeTag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    getWFCloudKitSyncLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:]";
      _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_DEFAULT, "%s Server workflow record changed since last sync, trying to fetch changes in Shortcuts zone to handle", buf, 0xCu);
    }

    -[VCCKShortcutSyncService fetchChangesInShortcutsZone](self, "fetchChangesInShortcutsZone");
  }
  else
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v17, v9, 0);
    -[VCCKShortcutSyncService database](self, "database");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recordName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "referenceForWorkflowID:includingTombstones:", v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[VCCKShortcutSyncService workflowRecordForReference:properties:](self, "workflowRecordForReference:properties:", v21, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        getWFCloudKitSyncLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v41 = "-[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:]";
          _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_DEFAULT, "%s Persisting server CKRecord metadata and retrying upload of this change", buf, 0xCu);
        }

        v37 = v17;
        objc_msgSend(v17, "recordSystemFieldsData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setCloudKitRecordMetadata:](v22, "setCloudKitRecordMetadata:", v24);

        -[VCCKShortcutSyncService database](self, "database");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v26 = objc_msgSend(v25, "saveRecord:withDescriptor:error:", v22, v21, &v38);
        v27 = v38;

        if ((v26 & 1) == 0)
        {
          getWFCloudKitSyncLogObject();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v41 = "-[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:]";
            v42 = 2114;
            v43 = v27;
            v44 = 2112;
            v45 = v22;
            _os_log_impl(&dword_1C146A000, v28, OS_LOG_TYPE_ERROR, "%s Failed to save WFWorkflowRecord: %{public}@, localWorkflowRecord = %@", buf, 0x20u);
          }

        }
        v29 = (void *)MEMORY[0x1E0DD9CD0];
        -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identifier");
        v36 = v27;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "recordIDWithZoneID:workflowID:", v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v33, 0);

        v17 = v37;
      }
    }
    else
    {
      getWFCloudKitSyncLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "recordID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "recordName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v41 = "-[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:]";
        v42 = 2114;
        v43 = v35;
        _os_log_impl(&dword_1C146A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to get local WFWorkflowReference for server record identifier %{public}@", buf, 0x16u);

      }
    }

  }
}

- (void)handleSendFolderConflictWithClientRecord:(id)a3 serverRecord:(id)a4 ancestorRecord:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  getWFCloudKitSyncLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[VCCKShortcutSyncService handleSendFolderConflictWithClientRecord:serverRecord:ancestorRecord:]";
    _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorServerRecordChanged error for sent folder", buf, 0xCu);
  }

  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v8, v6, 0);
  v9 = (void *)MEMORY[0x1E0DD9C90];
  objc_msgSend(v6, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionIdentifierForRecordID:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v11, 2);
    -[VCCKShortcutSyncService database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionRecordForCollectionIdentifier:createIfNecessary:", v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "recordSystemFieldsData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCloudKitFolderRecordMetadata:", v15);

      -[VCCKShortcutSyncService database](self, "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v17 = objc_msgSend(v16, "saveRecord:withDescriptor:error:", v14, v12, &v22);
      v18 = v22;

      if ((v17 & 1) != 0)
      {
        objc_msgSend(v6, "recordID");
        v19 = objc_claimAutoreleasedReturnValue();
        v23 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v20, 0);

      }
      else
      {
        getWFCloudKitSyncLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v25 = "-[VCCKShortcutSyncService handleSendFolderConflictWithClientRecord:serverRecord:ancestorRecord:]";
          v26 = 2114;
          v27 = v18;
          _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_ERROR, "%s Unable to save updated metadata to WFWorkflowCollectionRecord. %{public}@", buf, 0x16u);
        }
      }

    }
    else
    {
      getWFCloudKitSyncLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[VCCKShortcutSyncService handleSendFolderConflictWithClientRecord:serverRecord:ancestorRecord:]";
        v26 = 2114;
        v27 = v11;
        _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_ERROR, "%s Unable to find a collection in the database with identifier: %{public}@, so not doing anything.", buf, 0x16u);
      }
    }

  }
  else
  {
    getWFCloudKitSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "recordID");
      v21 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "-[VCCKShortcutSyncService handleSendFolderConflictWithClientRecord:serverRecord:ancestorRecord:]";
      v26 = 2114;
      v27 = v21;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_ERROR, "%s Invalid folder record ID: %{public}@", buf, 0x16u);

    }
  }

}

- (void)handleServerRecordChangedError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  int v37;
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C949B8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v4, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0C949A8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  objc_msgSend(v8, "recordType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9C88], "recordType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if (v19)
  {
    -[VCCKShortcutSyncService handleSendWorkflowOrderingConflictWithClientRecord:serverRecord:ancestorRecord:](self, "handleSendWorkflowOrderingConflictWithClientRecord:serverRecord:ancestorRecord:", v8, v12, v16);
  }
  else
  {
    objc_msgSend(v8, "recordType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD9CB8], "recordType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqualToString:", v21);

    if (v22)
    {
      -[VCCKShortcutSyncService handleSendSyncFlagsConflictWithClientRecord:serverRecord:ancestorRecord:](self, "handleSendSyncFlagsConflictWithClientRecord:serverRecord:ancestorRecord:", v8, v12, v16);
    }
    else
    {
      objc_msgSend(v8, "recordType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DD9CD0], "recordType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

      if (v25)
      {
        -[VCCKShortcutSyncService handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:](self, "handleSendWorkflowConflictWithClientRecord:serverRecord:ancestorRecord:", v8, v12, v16);
      }
      else
      {
        objc_msgSend(v8, "recordType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DD9C90], "recordType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqualToString:", v27);

        if (v28)
        {
          -[VCCKShortcutSyncService handleSendFolderConflictWithClientRecord:serverRecord:ancestorRecord:](self, "handleSendFolderConflictWithClientRecord:serverRecord:ancestorRecord:", v8, v12, v16);
        }
        else
        {
          objc_msgSend(v8, "recordType");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DD9C80], "recordType");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "isEqualToString:", v30);

          if (v31)
          {
            -[VCCKShortcutSyncService handleSendAutoShortcutsPreferencesConflictWithClientRecord:serverRecord:ancestorRecord:](self, "handleSendAutoShortcutsPreferencesConflictWithClientRecord:serverRecord:ancestorRecord:", v8, v12, v16);
          }
          else
          {
            objc_msgSend(v8, "recordType");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DD9CA8], "recordType");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v32, "isEqualToString:", v33))
            {
              v34 = objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence");

              if (v34)
              {
                -[VCCKShortcutSyncService handleSendLibraryConflictWithClientRecord:serverRecord:ancestorRecord:](self, "handleSendLibraryConflictWithClientRecord:serverRecord:ancestorRecord:", v8, v12, v16);
                goto LABEL_33;
              }
            }
            else
            {

            }
            getWFCloudKitSyncLogObject();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v8, "recordType");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = 136315394;
              v38 = "-[VCCKShortcutSyncService handleServerRecordChangedError:]";
              v39 = 2114;
              v40 = v36;
              _os_log_impl(&dword_1C146A000, v35, OS_LOG_TYPE_ERROR, "%s Received record changed error for CKRecord of unexpected type: %{public}@", (uint8_t *)&v37, 0x16u);

            }
          }
        }
      }
    }
  }
LABEL_33:

}

- (void)handleUnknownItemErrorForRecord:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject **v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  char v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  _BOOL4 v62;
  const char *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  NSObject *v81;
  __int16 v82;
  NSObject *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NSObject recordID](v4, "recordID");
    v6 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
    v80 = 2114;
    v81 = v6;
    v82 = 2112;
    v83 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorUnknownItem error for record with identifier %{public}@, record = %@", buf, 0x20u);

  }
  -[NSObject recordType](v4, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9C88], "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {

LABEL_6:
    -[NSObject recordID](v4, "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCCKShortcutSyncService collectionIdentifierForRecordID:](self, "collectionIdentifierForRecordID:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
LABEL_24:

      goto LABEL_25;
    }
    getWFCloudKitSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
      v80 = 2114;
      v81 = v13;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEFAULT, "%s Handling CKErrorUnknownItem for collection with identifier %{public}@", buf, 0x16u);
    }

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v13, 2);
    -[VCCKShortcutSyncService database](self, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collectionRecordForCollectionIdentifier:createIfNecessary:", v13, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[NSObject setCloudKitOrderingRecordMetadata:](v17, "setCloudKitOrderingRecordMetadata:", 0);
      -[VCCKShortcutSyncService database](self, "database");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      v19 = objc_msgSend(v18, "saveRecord:withDescriptor:error:", v17, v15, &v72);
      v20 = v72;

      if ((v19 & 1) == 0)
      {
        getWFCloudKitSyncLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
          v80 = 2114;
          v81 = v20;
          _os_log_impl(&dword_1C146A000, v21, OS_LOG_TYPE_ERROR, "%s Failed to save WFWorkflowCollectionRecord: %{public}@", buf, 0x16u);
        }

      }
      -[NSObject recordID](v4, "recordID");
      v22 = objc_claimAutoreleasedReturnValue();
      v77 = v22;
      v23 = (void *)MEMORY[0x1E0C99D20];
      v24 = &v77;
      goto LABEL_15;
    }
    getWFCloudKitSyncLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
LABEL_20:
    *(_DWORD *)buf = 136315394;
    v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
    v80 = 2114;
    v81 = v13;
    _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_DEFAULT, "%s Cannot load WFWorkflowCollectionRecord for collection identifier %{public}@", buf, 0x16u);
    goto LABEL_21;
  }
  -[NSObject recordType](v4, "recordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9C70], "recordType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
    goto LABEL_6;
  -[NSObject recordType](v4, "recordType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9CB8], "recordType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqualToString:", v27);

  if (!v28)
  {
    -[NSObject recordType](v4, "recordType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD9CD0], "recordType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqualToString:", v30);

    if (v31)
    {
      -[NSObject recordID](v4, "recordID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "recordName");
      v13 = objc_claimAutoreleasedReturnValue();

      -[VCCKShortcutSyncService database](self, "database");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "referenceForWorkflowID:includingTombstones:", v13, 1);
      v15 = objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        getWFCloudKitSyncLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
          v80 = 2114;
          v81 = v13;
          _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_ERROR, "%s Failed to get local workflow reference from workflow CKRecord with identifier: %{public}@", buf, 0x16u);
        }
        goto LABEL_22;
      }
      v34 = (void *)objc_opt_new();
      -[VCCKShortcutSyncService workflowRecordForReference:properties:](self, "workflowRecordForReference:properties:", v15, v34);
      v17 = objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      -[NSObject setCloudKitRecordMetadata:](v17, "setCloudKitRecordMetadata:", 0);
      -[VCCKShortcutSyncService database](self, "database");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0;
      v36 = objc_msgSend(v35, "saveRecord:withDescriptor:error:", v17, v15, &v71);
      v20 = v71;

      if ((v36 & 1) != 0)
      {
        -[NSObject recordID](v4, "recordID");
        v22 = objc_claimAutoreleasedReturnValue();
        v76 = v22;
        v23 = (void *)MEMORY[0x1E0C99D20];
        v24 = &v76;
LABEL_15:
        objc_msgSend(v23, "arrayWithObjects:count:", v24, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v25, 0);

LABEL_16:
LABEL_21:

        goto LABEL_22;
      }
      getWFCloudKitSyncLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      *(_DWORD *)buf = 136315394;
      v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
      v80 = 2114;
      v81 = v20;
      v63 = "%s Failed to save WFWorkflowRecord: %{public}@";
      goto LABEL_59;
    }
    -[NSObject recordType](v4, "recordType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD9C90], "recordType");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqualToString:", v38);

    if (v39)
    {
      v40 = (void *)MEMORY[0x1E0DD9C90];
      -[NSObject recordID](v4, "recordID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "collectionIdentifierForRecordID:", v41);
      v13 = objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        getWFCloudKitSyncLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          -[NSObject recordID](v4, "recordID");
          v64 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
          v80 = 2114;
          v81 = v64;
          _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Failed to get collection identifier from folder CKRecordID %{public}@", buf, 0x16u);

        }
        goto LABEL_23;
      }
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v13, 2);
      -[VCCKShortcutSyncService database](self, "database");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "collectionRecordForCollectionIdentifier:createIfNecessary:", v13, 0);
      v17 = objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        getWFCloudKitSyncLogObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        goto LABEL_20;
      }
      -[NSObject setCloudKitFolderRecordMetadata:](v17, "setCloudKitFolderRecordMetadata:", 0);
      -[VCCKShortcutSyncService database](self, "database");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      v44 = objc_msgSend(v43, "saveRecord:withDescriptor:error:", v17, v15, &v70);
      v20 = v70;

      if ((v44 & 1) != 0)
      {
        -[NSObject recordID](v4, "recordID");
        v22 = objc_claimAutoreleasedReturnValue();
        v75 = v22;
        v23 = (void *)MEMORY[0x1E0C99D20];
        v24 = &v75;
        goto LABEL_15;
      }
      getWFCloudKitSyncLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      *(_DWORD *)buf = 136315394;
      v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
      v80 = 2114;
      v81 = v20;
      v63 = "%s Failed to save WFWorkflowCollectionRecord: %{public}@";
LABEL_59:
      _os_log_impl(&dword_1C146A000, v22, OS_LOG_TYPE_ERROR, v63, buf, 0x16u);
      goto LABEL_16;
    }
    -[NSObject recordType](v4, "recordType");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD9C80], "recordType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqualToString:", v46);

    if (v47)
    {
      v48 = (void *)MEMORY[0x1E0DD9C80];
      -[NSObject recordID](v4, "recordID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "identifierForRecordID:", v49);
      v13 = objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[VCCKShortcutSyncService database](self, "database");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0;
        objc_msgSend(v50, "autoShortcutsPreferencesForIdentifier:error:", v13, &v69);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = v69;

        if (v51)
        {
          -[NSObject setCloudKitMetadata:](v51, "setCloudKitMetadata:", 0);
          -[VCCKShortcutSyncService database](self, "database");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v52;
          v54 = objc_msgSend(v53, "updateAutoShortcutsPreferencesWithNewPreferences:error:", v51, &v68);
          v55 = v68;

          if ((v54 & 1) != 0)
          {
            -[NSObject recordID](v4, "recordID");
            v56 = objc_claimAutoreleasedReturnValue();
            v74 = v56;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v57, 0);

          }
          else
          {
            getWFCloudKitSyncLogObject();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
              v80 = 2112;
              v81 = v51;
              v82 = 2112;
              v83 = v55;
              _os_log_impl(&dword_1C146A000, v56, OS_LOG_TYPE_ERROR, "%s Failed to update Auto Shortcuts Preferences (%@): %@", buf, 0x20u);
            }
          }
          v52 = v55;
        }
        else
        {
          getWFCloudKitSyncLogObject();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
            v80 = 2112;
            v81 = v13;
            v82 = 2112;
            v83 = v52;
            _os_log_impl(&dword_1C146A000, v56, OS_LOG_TYPE_ERROR, "%s Failed to get Auto Shortcuts Preferences from identifier (%@): %@", buf, 0x20u);
          }
        }

      }
      else
      {
        getWFCloudKitSyncLogObject();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          -[NSObject recordID](v4, "recordID");
          v67 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
          v80 = 2114;
          v81 = v67;
          _os_log_impl(&dword_1C146A000, v52, OS_LOG_TYPE_ERROR, "%s Failed to get preferences identifier from Auto Shortcuts Preferences CKRecordID %{public}@", buf, 0x16u);

        }
      }

      goto LABEL_24;
    }
    -[NSObject recordType](v4, "recordType");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD9CA8], "recordType");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v58, "isEqualToString:", v59))
    {
      v60 = objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence");

      if (v60)
      {
        -[VCCKShortcutSyncService database](self, "database");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = +[VCCKLibrarySyncCoordinator handleUnknownItemErrorForRecord:database:error:](_TtC14VoiceShortcuts26VCCKLibrarySyncCoordinator, "handleUnknownItemErrorForRecord:database:error:", v4, v61, 0);

        if (v62)
        {
          -[NSObject recordID](v4, "recordID");
          v13 = objc_claimAutoreleasedReturnValue();
          v73 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
          v15 = objc_claimAutoreleasedReturnValue();
          -[VCCKShortcutSyncService addRecordIDsToSave:recordIDsToDelete:](self, "addRecordIDsToSave:recordIDsToDelete:", v15, 0);
          goto LABEL_23;
        }
        getWFCloudKitSyncLogObject();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
          v80 = 2114;
          v81 = v4;
          _os_log_impl(&dword_1C146A000, v65, OS_LOG_TYPE_ERROR, "%s Failed to handle unknown item error for library record: %{public}@", buf, 0x16u);
        }
LABEL_54:

        goto LABEL_25;
      }
    }
    else
    {

    }
    getWFCloudKitSyncLogObject();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      -[NSObject recordType](v4, "recordType");
      v66 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v79 = "-[VCCKShortcutSyncService handleUnknownItemErrorForRecord:]";
      v80 = 2114;
      v81 = v66;
      _os_log_impl(&dword_1C146A000, v65, OS_LOG_TYPE_ERROR, "%s Received unknown item error for CKRecord of unexpected type: %{public}@", buf, 0x16u);

    }
    goto LABEL_54;
  }
  -[VCCKShortcutSyncService updateSyncTokenInDatabaseWithBlock:](self, "updateSyncTokenInDatabaseWithBlock:", &__block_literal_global_1214);
  -[VCCKShortcutSyncService sendSyncFlagsIfNeeded](self, "sendSyncFlagsIfNeeded");
LABEL_25:

}

- (void)startObservingUserDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  WFUserDefaultsKeysToObserve();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8++), 0, VCCKShortcutSyncServiceUserDefaultsChangedContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  WFSystemUserDefaultsKeysToObserve();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), 0, VCCKShortcutSyncServiceUserDefaultsChangedContext, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)stopObservingUserDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  WFUserDefaultsKeysToObserve();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8++), VCCKShortcutSyncServiceUserDefaultsChangedContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  WFSystemUserDefaultsKeysToObserve();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), VCCKShortcutSyncServiceUserDefaultsChangedContext, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)start
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[VCCKShortcutSyncService database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectObserver:", self);

  -[VCCKShortcutSyncService startObservingUserDefaults](self, "startObservingUserDefaults");
  -[VCCKShortcutSyncService applicationObserver](self, "applicationObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("applicationVisible"), 0, VCCKShortcutSyncServiceApplicationVisibilityChangedContext);

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__VCCKShortcutSyncService_start__block_invoke;
  v5[3] = &unk_1E7AA6338;
  objc_copyWeak(&v6, &location);
  -[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:](self, "fetchChangesInShortcutsZoneWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)VCCKShortcutSyncServiceUserDefaultsChangedContext == a6)
  {
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DDA0B8]) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DD9F78]))
    {
      -[VCCKShortcutSyncService sendSyncFlagsIfNeeded](self, "sendSyncFlagsIfNeeded");
    }
  }
  else if ((void *)VCCKShortcutSyncServiceApplicationVisibilityChangedContext == a6)
  {
    -[VCCKShortcutSyncService applicationObserver](self, "applicationObserver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isApplicationVisible");

    getWFCloudKitSyncLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[VCCKShortcutSyncService observeValueForKeyPath:ofObject:change:context:]";
        _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEFAULT, "%s Application moved to foreground, performing immediate sync", buf, 0xCu);
      }

      -[VCCKShortcutSyncService fetchAndModifyChangesInShortcutsZoneWithCompletion:](self, "fetchAndModifyChangesInShortcutsZoneWithCompletion:", 0);
    }
    else
    {
      if (v16)
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[VCCKShortcutSyncService observeValueForKeyPath:ofObject:change:context:]";
        _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEFAULT, "%s Application no longer in foreground.", buf, 0xCu);
      }

    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VCCKShortcutSyncService;
    -[VCCKShortcutSyncService observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  getWFCloudKitSyncLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v25 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]";
    v26 = 2114;
    v27 = v11;
    v28 = 2114;
    v29 = v12;
    v30 = 2114;
    v31 = v13;
    _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_INFO, "%s Received database change: modified = %{public}@, inserted = %{public}@, removed = %{public}@", buf, 0x2Au);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__VCCKShortcutSyncService_databaseDidChange_modified_inserted_removed___block_invoke;
  v19[3] = &unk_1E7AA6388;
  v19[4] = self;
  v20 = v11;
  v21 = v10;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(CFSTR("VCCKShortcutSyncService.databaseResultChange"), v19);

}

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i2;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t ii;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t jj;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t kk;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t mm;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t nn;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i1;
  uint64_t v95;
  void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  switch(objc_msgSend(v5, "type"))
  {
    case 0:
      v6 = v5;
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
      }
      else
      {
        v7 = 0;
      }
      v30 = v7;

      v31 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v30, "stateSerialization");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "wf_securelyArchivedDataWithRootObject:", v32);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      -[VCCKShortcutSyncService syncEngineDidUpdateMetadata:](self, "syncEngineDidUpdateMetadata:", v16);
      goto LABEL_121;
    case 2:
      v8 = v5;
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
      }
      else
      {
        v9 = 0;
      }
      v16 = v9;

      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      objc_msgSend(v16, "modifications");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v142, v157, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v143;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v143 != v36)
              objc_enumerationMutation(v33);
            objc_msgSend(*(id *)(*((_QWORD *)&v142 + 1) + 8 * i), "zoneID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCCKShortcutSyncService syncEngineZoneWithIDChanged:](self, "syncEngineZoneWithIDChanged:", v38);

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v142, v157, 16);
        }
        while (v35);
      }

      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      objc_msgSend(v16, "deletions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v138, v156, 16);
      if (!v39)
        goto LABEL_120;
      v40 = v39;
      v41 = *(_QWORD *)v139;
      break;
    case 3:
      v10 = v5;
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v16 = v11;

      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
      objc_msgSend(v16, "modifications");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v134, v155, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v135;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v135 != v20)
              objc_enumerationMutation(v17);
            -[VCCKShortcutSyncService syncEngineDidFetchRecord:](self, "syncEngineDidFetchRecord:", *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * j));
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v134, v155, 16);
        }
        while (v19);
      }

      v132 = 0u;
      v133 = 0u;
      v130 = 0u;
      v131 = 0u;
      objc_msgSend(v16, "deletions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v130, v154, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v131;
        do
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v131 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * k);
            objc_msgSend(v27, "recordID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "recordType");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:](self, "syncEngineRecordWithIDWasDeleted:recordType:", v28, v29);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v130, v154, 16);
        }
        while (v24);
      }
      goto LABEL_120;
    case 4:
      v12 = v5;
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
      }
      else
      {
        v13 = 0;
      }
      v16 = v13;

      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      objc_msgSend(v16, "savedZones");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v126, v153, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v127;
        do
        {
          for (m = 0; m != v48; ++m)
          {
            if (*(_QWORD *)v127 != v49)
              objc_enumerationMutation(v46);
            -[VCCKShortcutSyncService syncEngineDidSaveRecordZone:](self, "syncEngineDidSaveRecordZone:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * m));
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v126, v153, 16);
        }
        while (v48);
      }

      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      objc_msgSend(v16, "failedZoneSaves");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v122, v152, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v123;
        do
        {
          for (n = 0; n != v53; ++n)
          {
            if (*(_QWORD *)v123 != v54)
              objc_enumerationMutation(v51);
            v56 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * n);
            objc_msgSend(v56, "recordZone");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "error");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCCKShortcutSyncService syncEngineFailedToSaveRecordZone:error:](self, "syncEngineFailedToSaveRecordZone:error:", v57, v58);

          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v122, v152, 16);
        }
        while (v53);
      }

      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      objc_msgSend(v16, "deletedZoneIDs");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v118, v151, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v119;
        do
        {
          for (ii = 0; ii != v61; ++ii)
          {
            if (*(_QWORD *)v119 != v62)
              objc_enumerationMutation(v59);
            -[VCCKShortcutSyncService syncEngineDidDeleteRecordZoneWithID:](self, "syncEngineDidDeleteRecordZoneWithID:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * ii));
          }
          v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v118, v151, 16);
        }
        while (v61);
      }

      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      objc_msgSend(v16, "failedZoneDeletes");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v114, v150, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v115;
        do
        {
          for (jj = 0; jj != v66; ++jj)
          {
            if (*(_QWORD *)v115 != v67)
              objc_enumerationMutation(v22);
            v69 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * jj);
            objc_msgSend(v16, "failedZoneDeletes");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "objectForKey:", v69);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCCKShortcutSyncService syncEngineFailedToDeleteRecordZoneWithID:error:](self, "syncEngineFailedToDeleteRecordZoneWithID:error:", v69, v71);

          }
          v66 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v114, v150, 16);
        }
        while (v66);
      }
      goto LABEL_120;
    case 5:
      v14 = v5;
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v16 = v15;

      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      objc_msgSend(v16, "savedRecords");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v110, v149, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v111;
        do
        {
          for (kk = 0; kk != v74; ++kk)
          {
            if (*(_QWORD *)v111 != v75)
              objc_enumerationMutation(v72);
            -[VCCKShortcutSyncService syncEngineDidSaveRecord:](self, "syncEngineDidSaveRecord:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * kk));
          }
          v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v110, v149, 16);
        }
        while (v74);
      }

      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      objc_msgSend(v16, "failedRecordSaves");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v106, v148, 16);
      if (v78)
      {
        v79 = v78;
        v80 = *(_QWORD *)v107;
        do
        {
          for (mm = 0; mm != v79; ++mm)
          {
            if (*(_QWORD *)v107 != v80)
              objc_enumerationMutation(v77);
            v82 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * mm);
            objc_msgSend(v82, "record");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "error");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCCKShortcutSyncService syncEngineFailedToSaveRecord:error:](self, "syncEngineFailedToSaveRecord:error:", v83, v84);

          }
          v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v106, v148, 16);
        }
        while (v79);
      }

      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      objc_msgSend(v16, "deletedRecordIDs");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v102, v147, 16);
      if (v86)
      {
        v87 = v86;
        v88 = *(_QWORD *)v103;
        do
        {
          for (nn = 0; nn != v87; ++nn)
          {
            if (*(_QWORD *)v103 != v88)
              objc_enumerationMutation(v85);
            -[VCCKShortcutSyncService syncEngineDidDeleteRecordWithID:](self, "syncEngineDidDeleteRecordWithID:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * nn));
          }
          v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v102, v147, 16);
        }
        while (v87);
      }

      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      objc_msgSend(v16, "failedRecordDeletes", 0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v91 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v98, v146, 16);
      if (v91)
      {
        v92 = v91;
        v93 = *(_QWORD *)v99;
        do
        {
          for (i1 = 0; i1 != v92; ++i1)
          {
            if (*(_QWORD *)v99 != v93)
              objc_enumerationMutation(v22);
            v95 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i1);
            objc_msgSend(v16, "failedRecordDeletes");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "objectForKey:", v95);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCCKShortcutSyncService syncEngineFailedToDeleteRecordWithID:error:](self, "syncEngineFailedToDeleteRecordWithID:error:", v95, v97);

          }
          v92 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v98, v146, 16);
        }
        while (v92);
      }
      goto LABEL_120;
    default:
      goto LABEL_122;
  }
  do
  {
    for (i2 = 0; i2 != v40; ++i2)
    {
      if (*(_QWORD *)v139 != v41)
        objc_enumerationMutation(v22);
      v43 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i2);
      v44 = objc_msgSend(v43, "reason");
      if (v44 == 1)
      {
        objc_msgSend(v43, "zoneID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCCKShortcutSyncService syncEngineZoneWithIDWasPurged:](self, "syncEngineZoneWithIDWasPurged:", v45);
      }
      else
      {
        if (v44)
          continue;
        objc_msgSend(v43, "zoneID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCCKShortcutSyncService syncEngineZoneWithIDWasDeleted:](self, "syncEngineZoneWithIDWasDeleted:", v45);
      }

    }
    v40 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v138, v156, 16);
  }
  while (v40);
LABEL_120:

LABEL_121:
LABEL_122:

}

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[VCCKShortcutSyncService syncEngine](self, "syncEngine");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v28 = v7;
    v29 = v6;
    objc_msgSend(v7, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scope");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[VCCKShortcutSyncService syncEngine](self, "syncEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "state");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pendingRecordZoneChanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v20, "recordID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v11, "containsRecordID:", v21);

          if (v22)
            objc_msgSend(v12, "addObject:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }

    v23 = (void *)objc_opt_new();
    v24 = objc_alloc(MEMORY[0x1E0C95198]);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __74__VCCKShortcutSyncService_syncEngine_nextRecordZoneChangeBatchForContext___block_invoke;
    v30[3] = &unk_1E7AA63B0;
    v30[4] = self;
    v31 = v23;
    v25 = v23;
    v9 = (void *)objc_msgSend(v24, "initWithPendingChanges:recordProvider:", v12, v30);
    v6 = v29;
    objc_msgSend(v29, "state");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removePendingRecordZoneChanges:", v25);

    v7 = v28;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)syncEngineDidSaveRecordZone:(id)a3
{
  id v4;
  NSObject *v5;
  WFCloudKitSyncEventLogger *logger;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[VCCKShortcutSyncService syncEngineDidSaveRecordZone:]";
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Successfully saved CKRecordZone %{public}@", buf, 0x16u);
  }

  logger = self->_logger;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Saved record zone: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger logEvent:](logger, "logEvent:", v9);

  objc_msgSend(v4, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "isEqual:", v11);

  if ((_DWORD)v9)
    objc_msgSend(MEMORY[0x1E0DD9CC0], "setIgnoresUserDeletedZoneErrors:", 0);

}

- (void)syncEngineDidDeleteRecordZoneWithID:(id)a3
{
  id v4;
  NSObject *v5;
  WFCloudKitSyncEventLogger *logger;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[VCCKShortcutSyncService syncEngineDidDeleteRecordZoneWithID:]";
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_FAULT, "%s Sync engine reports successful deletion of CKRecordZone with identifier %{public}@, but we should not be deleting any zones", buf, 0x16u);
  }

  logger = self->_logger;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deleted record zone: %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger logEvent:](logger, "logEvent:", v7);

}

- (void)syncEngineFailedToSaveRecordZone:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  WFCloudKitSyncEventLogger *logger;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFCloudKitSyncLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[VCCKShortcutSyncService syncEngineFailedToSaveRecordZone:error:]";
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to save CKRecordZone: %{public}@, zone = %{public}@", buf, 0x20u);
  }

  logger = self->_logger;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Failed to save record zone: %@. %@"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger logError:](logger, "logError:", v13);

}

- (void)syncEngineFailedToDeleteRecordZoneWithID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  WFCloudKitSyncEventLogger *logger;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFCloudKitSyncLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[VCCKShortcutSyncService syncEngineFailedToDeleteRecordZoneWithID:error:]";
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_FAULT, "%s Sync engine reports failure to delete CKRecordZone: %{public}@, zoneID = %{public}@. This is unexpected, as we should not be deleting any zones", buf, 0x20u);
  }

  logger = self->_logger;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Failed to delete record zone: %@. %@"), v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger logError:](logger, "logError:", v12);

}

- (void)syncEngineZoneWithIDChanged:(id)a3
{
  id v4;
  NSObject *v5;
  WFCloudKitSyncEventLogger *logger;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[VCCKShortcutSyncService syncEngineZoneWithIDChanged:]";
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Sync engine reports that CKRecordZone with identifier %{public}@ changed", buf, 0x16u);
  }

  logger = self->_logger;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zone changed: %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger logEvent:](logger, "logEvent:", v7);

}

- (void)syncEngineZoneWithIDWasDeleted:(id)a3
{
  id v4;
  NSObject *v5;
  WFCloudKitSyncEventLogger *logger;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[VCCKShortcutSyncService syncEngineZoneWithIDWasDeleted:]";
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Sync engine reports that CKRecordZone with identifier %{public}@ was deleted", buf, 0x16u);
  }

  logger = self->_logger;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zone deleted: %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger logEvent:](logger, "logEvent:", v7);

}

- (void)syncEngineZoneWithIDWasPurged:(id)a3
{
  id v4;
  NSObject *v5;
  WFCloudKitSyncEventLogger *logger;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[VCCKShortcutSyncService syncEngineZoneWithIDWasPurged:]";
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Sync engine reports that CKRecordZone with identifier %{public}@ was purged", buf, 0x16u);
  }

  logger = self->_logger;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zone purged: %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger logEvent:](logger, "logEvent:", v7);

  -[VCCKShortcutSyncService shortcutsZoneID](self, "shortcutsZoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(logger) = objc_msgSend(v4, "isEqual:", v8);

  if ((_DWORD)logger)
    objc_msgSend(MEMORY[0x1E0DD9CC0], "setZoneWasPurged:", 1);

}

- (id)recordToSaveForRecordID:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  VCCKShortcutSyncService *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1187;
  v16 = __Block_byref_object_dispose__1188;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__VCCKShortcutSyncService_recordToSaveForRecordID___block_invoke;
  v8[3] = &unk_1E7AA8350;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(CFSTR("VCCKShortcutSyncService.recordToSaveForRecordID"), v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (void)syncEngineDidSaveRecord:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  VCCKShortcutSyncService *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__VCCKShortcutSyncService_syncEngineDidSaveRecord___block_invoke;
  v6[3] = &unk_1E7AA8138;
  v7 = v4;
  v8 = self;
  v5 = v4;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(CFSTR("VCCKShortcutSyncService.didSaveRecord"), v6);

}

- (void)syncEngineFailedToSaveRecord:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  VCCKShortcutSyncService *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__VCCKShortcutSyncService_syncEngineFailedToSaveRecord_error___block_invoke;
  v10[3] = &unk_1E7AA82B0;
  v11 = v7;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v7;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(CFSTR("VCCKShortcutSyncService.failedToSaveRecord"), v10);

}

- (void)syncEngineDidDeleteRecordWithID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  VCCKShortcutSyncService *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__VCCKShortcutSyncService_syncEngineDidDeleteRecordWithID___block_invoke;
  v6[3] = &unk_1E7AA8138;
  v7 = v4;
  v8 = self;
  v5 = v4;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(CFSTR("VCCKShortcutSyncService.didDeleteRecordWithID"), v6);

}

- (void)syncEngineFailedToDeleteRecordWithID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  WFCloudKitSyncEventLogger *logger;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFCloudKitSyncLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136316162;
    v13 = "-[VCCKShortcutSyncService syncEngineFailedToDeleteRecordWithID:error:]";
    v14 = 2114;
    v15 = v9;
    v16 = 2050;
    v17 = objc_msgSend(v7, "code");
    v18 = 2114;
    v19 = v7;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Sync engine failed to delete CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, recordID = %{public}@", (uint8_t *)&v12, 0x34u);

  }
  logger = self->_logger;
  objc_msgSend(v7, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitSyncEventLogger logRecordDeleteFailed:error:](logger, "logRecordDeleteFailed:error:", v6, v11);

}

- (void)syncEngineDidFetchRecord:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  VCCKShortcutSyncService *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__VCCKShortcutSyncService_syncEngineDidFetchRecord___block_invoke;
  v6[3] = &unk_1E7AA8138;
  v7 = v4;
  v8 = self;
  v5 = v4;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(CFSTR("VCCKShortcutSyncService.didFetchRecord"), v6);

}

- (void)syncEngineRecordWithIDWasDeleted:(id)a3 recordType:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  VCCKShortcutSyncService *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__VCCKShortcutSyncService_syncEngineRecordWithIDWasDeleted_recordType___block_invoke;
  v10[3] = &unk_1E7AA82B0;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(CFSTR("VCCKShortcutSyncService.recordWithIDWasDeleted"), v10);

}

- (void)syncEngineDidUpdateMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[VCCKShortcutSyncService syncEngineDidUpdateMetadata:]";
    v11 = 2048;
    v12 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Received updated metadata from sync engine, length = %lu", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__VCCKShortcutSyncService_syncEngineDidUpdateMetadata___block_invoke;
  v7[3] = &unk_1E7AA8138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  VCCKPerformBlockInsideAutoreleasePoolInTransaction(CFSTR("VCCKShortcutSyncService.didUpdateMetadata"), v7);

}

- (WFDatabase)database
{
  return self->_database;
}

- (CKSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (WFCloudKitSyncEventLogger)logger
{
  return self->_logger;
}

- (CKSyncEngineSendChangesOptions)sendChangesOptions
{
  return self->_sendChangesOptions;
}

- (CKSyncEngineFetchChangesOptions)fetchChangesOptions
{
  return self->_fetchChangesOptions;
}

- (VCCKApplicationStateObserver)applicationObserver
{
  return self->_applicationObserver;
}

- (NSMutableDictionary)filesReferencedUntilSaved
{
  return self->_filesReferencedUntilSaved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesReferencedUntilSaved, 0);
  objc_storeStrong((id *)&self->_applicationObserver, 0);
  objc_storeStrong((id *)&self->_fetchChangesOptions, 0);
  objc_storeStrong((id *)&self->_sendChangesOptions, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __55__VCCKShortcutSyncService_syncEngineDidUpdateMetadata___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__VCCKShortcutSyncService_syncEngineDidUpdateMetadata___block_invoke_2;
  v2[3] = &unk_1E7AA60C8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "updateSyncTokenInDatabaseWithBlock:", v2);

}

uint64_t __55__VCCKShortcutSyncService_syncEngineDidUpdateMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSyncEngineMetadata:", *(_QWORD *)(a1 + 32));
}

void __71__VCCKShortcutSyncService_syncEngineRecordWithIDWasDeleted_recordType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v25 = 136315650;
    v26 = "-[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:]_block_invoke";
    v27 = 2114;
    v28 = v3;
    v29 = 2114;
    v30 = v4;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_INFO, "%s Sync engine fetched deletion of CKRecord with CKRecordID %{public}@ of type %{public}@", (uint8_t *)&v25, 0x20u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "logRecordDeleted:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DD9C88], "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

LABEL_6:
    getWFCloudKitSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      return;
    }
    v25 = 136315138;
    v26 = "-[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:]_block_invoke";
    v10 = "%s Fetched record deletion of collection ordering record, not handling";
    goto LABEL_8;
  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DD9C70], "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

  if ((_DWORD)v7)
    goto LABEL_6;
  v13 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DD9CA0], "recordType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v13, "isEqualToString:", v14);

  if ((_DWORD)v13)
  {
    getWFCloudKitSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v25 = 136315138;
    v26 = "-[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:]_block_invoke";
    v10 = "%s Fetched record deletion of legacy workflow ordering record";
    v11 = v9;
    v12 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_9;
  }
  v15 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DD9CD0], "recordType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", v16))
  {

LABEL_18:
    objc_msgSend(*(id *)(a1 + 48), "handleFetchedDeletionOfRecordWithID:", *(_QWORD *)(a1 + 32));
    return;
  }
  v17 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DD9C90], "recordType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v17, "isEqualToString:", v18);

  if ((_DWORD)v17)
    goto LABEL_18;
  v19 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DD9CB8], "recordType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v19, "isEqualToString:", v20);

  if ((_DWORD)v19)
  {
    getWFCloudKitSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v25 = 136315138;
    v26 = "-[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:]_block_invoke";
    v10 = "%s Fetched unexpected record deletion of sync flags record, not handling";
LABEL_8:
    v11 = v9;
    v12 = OS_LOG_TYPE_ERROR;
LABEL_9:
    _os_log_impl(&dword_1C146A000, v11, v12, v10, (uint8_t *)&v25, 0xCu);
    goto LABEL_10;
  }
  v21 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DD9C80], "recordType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v21, "isEqualToString:", v22);

  if ((_DWORD)v21)
  {
    objc_msgSend(*(id *)(a1 + 48), "handleFetchedDeletionOfAutoShortcutsPreferencesWithRecordID:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    getWFCloudKitSyncLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(a1 + 40);
      v25 = 136315394;
      v26 = "-[VCCKShortcutSyncService syncEngineRecordWithIDWasDeleted:recordType:]_block_invoke";
      v27 = 2114;
      v28 = v24;
      _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_ERROR, "%s Fetched record deletion of unexpected type: %{public}@", (uint8_t *)&v25, 0x16u);
    }

  }
}

void __52__VCCKShortcutSyncService_syncEngineDidFetchRecord___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  BOOL v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  char v43;
  int v44;
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "recordID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v44 = 136315650;
    v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
    v46 = 2114;
    v47 = v3;
    v48 = 2112;
    v49 = v4;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_INFO, "%s Sync engine fetched CKRecord with CKRecordID %{public}@, record = %@", (uint8_t *)&v44, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "logRecordFetched:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9C88], "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

LABEL_6:
    if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
    {
      getWFCloudKitSyncLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        return;
      }
      v44 = 136315138;
      v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
      v11 = "%s Skipping fetched collection record because coherence sync is enabled";
LABEL_9:
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v44, 0xCu);
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 40), "handleFetchedCollectionOrderingRecord:", *(_QWORD *)(a1 + 32));
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9C70], "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "recordType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9CA0], "recordType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
  {
    if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
    {
      getWFCloudKitSyncLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_10;
      v44 = 136315138;
      v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
      v11 = "%s Skipping fetched legacy workflow ordering record because coherence sync is enabled";
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 40), "handleFetchedLegacyOrderingRecord:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "recordType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD9CD0], "recordType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 40), "handleFetchedWorkflowRecord:", *(_QWORD *)(a1 + 32));
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "recordType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD9C90], "recordType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToString:", v19);

    if (!v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "recordType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DD9CB8], "recordType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if (v23)
      {
        objc_msgSend(*(id *)(a1 + 40), "handleFetchedSyncFlagsRecord:", *(_QWORD *)(a1 + 32));
        return;
      }
      objc_msgSend(*(id *)(a1 + 32), "recordType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DD9C80], "recordType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      if (v26)
      {
        objc_msgSend(*(id *)(a1 + 40), "handleFetchedAutoShortcutsPreferencesRecord:", *(_QWORD *)(a1 + 32));
        return;
      }
      objc_msgSend(*(id *)(a1 + 32), "recordType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DD9CA8], "recordType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqualToString:", v28);

      if (v29)
      {
        v30 = objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence");
        getWFCloudKitSyncLogObject();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
        if (v30)
        {
          if (v32)
          {
            v33 = *(void **)(a1 + 32);
            v44 = 136315394;
            v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
            v46 = 2112;
            v47 = v33;
            _os_log_impl(&dword_1C146A000, v31, OS_LOG_TYPE_INFO, "%s Handling fetched library record: %@", (uint8_t *)&v44, 0x16u);
          }

          v34 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "database");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "logger");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = +[VCCKLibrarySyncCoordinator handleFetchedLibraryRecord:database:logger:error:](_TtC14VoiceShortcuts26VCCKLibrarySyncCoordinator, "handleFetchedLibraryRecord:database:logger:error:", v34, v35, v36, 0);

          if (v37)
            return;
          getWFCloudKitSyncLogObject();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = *(void **)(a1 + 32);
            v44 = 136315394;
            v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
            v46 = 2114;
            v47 = v39;
            _os_log_impl(&dword_1C146A000, v38, OS_LOG_TYPE_ERROR, "%s Failed to handle fetched library record: %{public}@", (uint8_t *)&v44, 0x16u);
          }
        }
        else
        {
          if (v32)
          {
            v44 = 136315138;
            v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
            _os_log_impl(&dword_1C146A000, v31, OS_LOG_TYPE_INFO, "%s Skipping fetched library record because coherence sync is disabled", (uint8_t *)&v44, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C99EA0], "syncShortcutsUserDefaults");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = *MEMORY[0x1E0DD9F50];
          v43 = objc_msgSend(v41, "BOOLForKey:", *MEMORY[0x1E0DD9F50]);

          if ((v43 & 1) != 0)
            return;
          objc_msgSend(MEMORY[0x1E0C99EA0], "syncShortcutsUserDefaults");
          v38 = objc_claimAutoreleasedReturnValue();
          -[NSObject setBool:forKey:](v38, "setBool:forKey:", 1, v42);
        }
      }
      else
      {
        getWFCloudKitSyncLogObject();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "recordType");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 136315394;
          v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
          v46 = 2114;
          v47 = v40;
          _os_log_impl(&dword_1C146A000, v38, OS_LOG_TYPE_ERROR, "%s Fetched record of unexpected type: %{public}@", (uint8_t *)&v44, 0x16u);

        }
      }

      return;
    }
    if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
    {
      getWFCloudKitSyncLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_10;
      v44 = 136315138;
      v45 = "-[VCCKShortcutSyncService syncEngineDidFetchRecord:]_block_invoke";
      v11 = "%s Skipping fetched folder record because coherence sync is enabled";
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 40), "handleFetchedFolderRecord:", *(_QWORD *)(a1 + 32));
  }
}

uint64_t __59__VCCKShortcutSyncService_syncEngineDidDeleteRecordWithID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[VCCKShortcutSyncService syncEngineDidDeleteRecordWithID:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_INFO, "%s Sync engine deleted CKRecord with CKRecordID %{public}@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "logRecordDeleted:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "handleDeletedRecordWithID:", *(_QWORD *)(a1 + 32));
}

void __62__VCCKShortcutSyncService_syncEngineFailedToSaveRecord_error___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void **v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  getWFCloudKitSyncLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a1[4], "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1[4], "code");
    v9 = a1[4];
    v10 = a1[5];
    *(_DWORD *)buf = 136316418;
    v31 = "-[VCCKShortcutSyncService syncEngineFailedToSaveRecord:error:]_block_invoke";
    v32 = 2114;
    v33 = v7;
    v34 = 2050;
    v35 = v8;
    v36 = 2114;
    v37 = v9;
    v38 = 2112;
    v39 = v10;
    v40 = 2114;
    v41 = v5;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Sync engine failed to save CKRecord: error domain = %{public}@, code = %{public}ld, error = %{public}@, record = %@, partial errors = %{public}@", buf, 0x3Eu);

  }
  v11 = a1[5];
  v12 = (void *)*((_QWORD *)a1[6] + 3);
  objc_msgSend(a1[4], "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logRecordPushFailed:error:", v11, v13);

  objc_msgSend(a1[5], "recordType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9CD0], "recordType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v14, "isEqualToString:", v15);

  if ((_DWORD)v13)
  {
    objc_msgSend(a1[5], "recordID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[6], "filesReferencedUntilSaved");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, v17);

  }
  if (CKErrorIsCode())
  {
    objc_msgSend(a1[6], "handleServerRecordChangedError:", a1[4]);
    goto LABEL_26;
  }
  if (CKErrorIsCode())
  {
    objc_msgSend(a1[6], "handleUnknownItemErrorForRecord:", a1[5]);
    goto LABEL_26;
  }
  if (CKErrorIsCode())
  {
    getWFCloudKitSyncLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "recordID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[VCCKShortcutSyncService syncEngineFailedToSaveRecord:error:]_block_invoke";
      v32 = 2114;
      v33 = v20;
      _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_DEFAULT, "%s Zone not found error encountered, asking sync engine to create the Shortcuts zone, and re-saving record with identifier %{public}@", buf, 0x16u);

    }
    objc_msgSend(a1[6], "createShortcutsZone");
    v21 = a1[6];
    objc_msgSend(a1[5], "recordID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v22;
    v23 = (void *)MEMORY[0x1E0C99D20];
    v24 = &v29;
LABEL_25:
    objc_msgSend(v23, "arrayWithObjects:count:", v24, 1, v28, v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addRecordIDsToSave:recordIDsToDelete:", v27, 0);

    goto LABEL_26;
  }
  if (CKErrorIsCode())
  {
    getWFCloudKitSyncLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[VCCKShortcutSyncService syncEngineFailedToSaveRecord:error:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_DEFAULT, "%s User deleted zone error encountered", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DD9CC0], "setZoneWasPurged:", 1);
    if (objc_msgSend(MEMORY[0x1E0DD9CC0], "ignoresUserDeletedZoneErrors"))
    {
      getWFCloudKitSyncLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[VCCKShortcutSyncService syncEngineFailedToSaveRecord:error:]_block_invoke";
        _os_log_impl(&dword_1C146A000, v26, OS_LOG_TYPE_DEFAULT, "%s User has consented to resuming sync, recreating the zone and retrying record upload", buf, 0xCu);
      }

      objc_msgSend(a1[6], "createShortcutsZone");
      v21 = a1[6];
      objc_msgSend(a1[5], "recordID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v22;
      v23 = (void *)MEMORY[0x1E0C99D20];
      v24 = &v28;
      goto LABEL_25;
    }
  }
LABEL_26:

}

void __51__VCCKShortcutSyncService_syncEngineDidSaveRecord___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  const char *v34;
  __int16 v35;
  NSObject *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "recordID");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v33 = 136315650;
    v34 = "-[VCCKShortcutSyncService syncEngineDidSaveRecord:]_block_invoke";
    v35 = 2114;
    v36 = v3;
    v37 = 2112;
    v38 = v4;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_INFO, "%s Sync engine saved CKRecord with CKRecordID %{public}@, record = %@", (uint8_t *)&v33, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "logRecordPushed:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9C88], "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

LABEL_6:
    if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
    {
      getWFCloudKitSyncLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        return;
      }
      v33 = 136315138;
      v34 = "-[VCCKShortcutSyncService syncEngineDidSaveRecord:]_block_invoke";
      v11 = "%s Saved collection record but skipping handling it because coherence sync is enabled";
      v12 = v10;
      v13 = OS_LOG_TYPE_ERROR;
LABEL_9:
      _os_log_impl(&dword_1C146A000, v12, v13, v11, (uint8_t *)&v33, 0xCu);
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 40), "handleSavedWorkflowOrderingRecord:", *(_QWORD *)(a1 + 32));
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9C70], "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "recordType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9CD0], "recordType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "handleSavedWorkflowRecord:", *(_QWORD *)(a1 + 32));
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "recordType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9CB8], "recordType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if (v19)
  {
    objc_msgSend(*(id *)(a1 + 40), "handleSavedSyncFlagsRecord:", *(_QWORD *)(a1 + 32));
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "recordType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9C90], "recordType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if (!v22)
  {
    objc_msgSend(*(id *)(a1 + 32), "recordType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD9C80], "recordType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqualToString:", v24);

    if (v25)
    {
      objc_msgSend(*(id *)(a1 + 40), "handleSavedAutoShortcutsPreferencesRecord:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "recordID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "recordName");
      v27 = objc_claimAutoreleasedReturnValue();

      getWFCloudKitSyncLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v33 = 136315394;
        v34 = "-[VCCKShortcutSyncService syncEngineDidSaveRecord:]_block_invoke";
        v35 = 2114;
        v36 = v27;
        _os_log_impl(&dword_1C146A000, v28, OS_LOG_TYPE_INFO, "%s Removing file representations for the auto shortcuts preferences record: %{public}@", (uint8_t *)&v33, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "filesReferencedUntilSaved");
      v29 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v29, "removeObjectForKey:", v27);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "recordType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DD9CA8], "recordType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "isEqualToString:", v31))
      {
        v32 = objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence");

        if (v32)
        {
          objc_msgSend(*(id *)(a1 + 40), "handleSavedLibraryRecord:", *(_QWORD *)(a1 + 32));
          return;
        }
      }
      else
      {

      }
      getWFCloudKitSyncLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      objc_msgSend(*(id *)(a1 + 32), "recordType");
      v29 = objc_claimAutoreleasedReturnValue();
      v33 = 136315394;
      v34 = "-[VCCKShortcutSyncService syncEngineDidSaveRecord:]_block_invoke";
      v35 = 2114;
      v36 = v29;
      _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_ERROR, "%s Saved record of unexpected type: %{public}@", (uint8_t *)&v33, 0x16u);
    }

LABEL_32:
    return;
  }
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
  {
    getWFCloudKitSyncLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    v33 = 136315138;
    v34 = "-[VCCKShortcutSyncService syncEngineDidSaveRecord:]_block_invoke";
    v11 = "%s Saved folder record but skipping handling it because coherence sync is enabled";
    v12 = v10;
    v13 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "handleSavedFolderRecord:", *(_QWORD *)(a1 + 32));
}

void __51__VCCKShortcutSyncService_recordToSaveForRecordID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v12 = 136315394;
    v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_INFO, "%s Sync engine is asking for CKRecord with ID %{public}@", (uint8_t *)&v12, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0DD9C88], "isOrderingRecordID:", *(_QWORD *)(a1 + 32)) & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0DD9C70], "isOrderingRecordID:", *(_QWORD *)(a1 + 32)))
  {
    if (objc_msgSend(MEMORY[0x1E0DD9CB8], "isCloudKitSyncFlagsRecordID:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(*(id *)(a1 + 40), "syncFlagsRecord");
      v8 = objc_claimAutoreleasedReturnValue();
      getWFCloudKitSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 136315394;
        v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        v14 = 2114;
        v15 = v8;
        v10 = "%s Returning sync flags CKRecord: %{public}@";
        goto LABEL_29;
      }
    }
    else if (objc_msgSend(MEMORY[0x1E0DD9C90], "isFolderRecordID:", *(_QWORD *)(a1 + 32)))
    {
      if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
      {
        getWFCloudKitSyncLogObject();
        v4 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          goto LABEL_31;
        v12 = 136315138;
        v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        v5 = "%s Asked for a folder record to save but returning nil because coherence sync is enabled";
        v6 = v4;
        v7 = OS_LOG_TYPE_INFO;
        goto LABEL_8;
      }
      objc_msgSend(*(id *)(a1 + 40), "folderRecordForRecordID:", *(_QWORD *)(a1 + 32));
      v8 = objc_claimAutoreleasedReturnValue();
      getWFCloudKitSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 136315394;
        v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        v14 = 2114;
        v15 = v8;
        v10 = "%s Returning folder CKRecord: %{public}@";
        goto LABEL_29;
      }
    }
    else if (objc_msgSend(MEMORY[0x1E0DD9C80], "isAutoShortcutsPreferencesRecordID:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(*(id *)(a1 + 40), "autoShortcutsPreferencesRecordForRecordID:", *(_QWORD *)(a1 + 32));
      v8 = objc_claimAutoreleasedReturnValue();
      getWFCloudKitSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 136315394;
        v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        v14 = 2114;
        v15 = v8;
        v10 = "%s Returning auto shortcuts preferences CKRecord: %{public}@";
        goto LABEL_29;
      }
    }
    else if (objc_msgSend(MEMORY[0x1E0DD9CA8], "isLibraryRecordID:", *(_QWORD *)(a1 + 32))
           && objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
    {
      objc_msgSend(*(id *)(a1 + 40), "libraryRecordForRecordID:", *(_QWORD *)(a1 + 32));
      v8 = objc_claimAutoreleasedReturnValue();
      getWFCloudKitSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 136315394;
        v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        v14 = 2114;
        v15 = v8;
        v10 = "%s Returning library CKRecord: %{public}@";
        goto LABEL_29;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "workflowRecordForRecordID:", *(_QWORD *)(a1 + 32));
      v8 = objc_claimAutoreleasedReturnValue();
      getWFCloudKitSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 136315394;
        v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
        v14 = 2112;
        v15 = v8;
        v10 = "%s Returning workflow CKRecord: %@";
        goto LABEL_29;
      }
    }
LABEL_30:

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(NSObject **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v8;
    goto LABEL_31;
  }
  if (!objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
  {
    objc_msgSend(*(id *)(a1 + 40), "workflowOrderingRecordForRecordID:", *(_QWORD *)(a1 + 32));
    v8 = objc_claimAutoreleasedReturnValue();
    getWFCloudKitSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 136315394;
      v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
      v14 = 2114;
      v15 = v8;
      v10 = "%s Returning workflow ordering CKRecord: %{public}@";
LABEL_29:
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v12, 0x16u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v12 = 136315138;
    v13 = "-[VCCKShortcutSyncService recordToSaveForRecordID:]_block_invoke";
    v5 = "%s Asked for a collection record to save but returning nil because coherence sync is enabled";
    v6 = v4;
    v7 = OS_LOG_TYPE_ERROR;
LABEL_8:
    _os_log_impl(&dword_1C146A000, v6, v7, v5, (uint8_t *)&v12, 0xCu);
  }
LABEL_31:

}

id __74__VCCKShortcutSyncService_syncEngine_nextRecordZoneChangeBatchForContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "recordToSaveForRecordID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95188]), "initWithRecordID:type:", v3, 0);
    objc_msgSend(v5, "addObject:", v6);

  }
  return v4;
}

void __71__VCCKShortcutSyncService_databaseDidChange_modified_inserted_removed___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _BOOL4 v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void **v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  void *v75;
  void *v76;
  NSObject *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t j;
  void *v127;
  void *v128;
  NSObject *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  void *v148;
  void *v149;
  id v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id *v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _QWORD v161[5];
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _BYTE v171[128];
  uint8_t v172[128];
  uint8_t buf[4];
  const char *v174;
  __int16 v175;
  id v176;
  __int16 v177;
  void *v178;
  void *v179;
  _QWORD v180[2];
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  v148 = (void *)objc_opt_new();
  v153 = (void *)objc_opt_new();
  v154 = (void *)objc_opt_new();
  objc_msgSend(a1[4], "shortcutsZoneID");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v2 = a1[5];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v167, v181, 16);
  v156 = a1;
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v168;
    v151 = *(_QWORD *)v168;
    v146 = v2;
    do
    {
      v6 = 0;
      v145 = v4;
      do
      {
        if (*(_QWORD *)v168 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1C3BAFA00]();
        if (!objc_msgSend(v7, "objectType"))
        {
          v10 = a1[6];
          objc_msgSend(v7, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "referenceForWorkflowID:includingTombstones:", v11, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)*((_QWORD *)a1[4] + 3);
          objc_msgSend(v12, "description");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "logDatabaseModify:value:", v7, v14);

          if (v12)
          {
            v15 = a1[4];
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("hiddenFromLibraryAndSync"), CFSTR("syncHash"), CFSTR("lastSyncedHash"), CFSTR("deleted"), 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "workflowRecordForReference:properties:", v7, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              if ((objc_msgSend(v17, "hiddenFromLibraryAndSync") & 1) == 0)
              {
                v18 = objc_msgSend(v17, "syncHash");
                if (v18 != objc_msgSend(v17, "lastSyncedHash"))
                {
                  v19 = (void *)MEMORY[0x1E0DD9CD0];
                  objc_msgSend(v7, "identifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "recordIDWithZoneID:workflowID:", v155, v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(a1[6], "conflictingReferenceForReference:", v12);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v17, "isDeleted"))
                  {
                    v23 = v154;
                    if (v22)
                    {
                      v24 = objc_msgSend(v22, "isDeleted");
                      v23 = v154;
                      if ((v24 & 1) == 0)
                      {
LABEL_56:

                        goto LABEL_57;
                      }
                    }
                  }
                  else
                  {
                    v23 = v148;
                    if (v22)
                      goto LABEL_56;
                  }
                  objc_msgSend(v23, "addObject:", v21);
                  goto LABEL_56;
                }
              }
            }
LABEL_57:

          }
          goto LABEL_59;
        }
        if (objc_msgSend(v7, "objectType") == 2)
        {
          if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
          {
            getWFCloudKitSyncLogObject();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
              _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s Received database change for collections but skipping sync because coherence sync is enabled", buf, 0xCu);
            }

            objc_msgSend(*((id *)a1[4] + 3), "logDatabaseModify:value:", v7, 0);
          }
          else
          {
            v149 = v8;
            v36 = v2;
            objc_msgSend(a1[4], "database");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "identifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "collectionRecordForCollectionIdentifier:createIfNecessary:", v38, 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = (void *)*((_QWORD *)a1[4] + 3);
            v41 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v39, "name");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v39, "isFolder"))
              v43 = CFSTR("yes");
            else
              v43 = CFSTR("no");
            objc_msgSend(v39, "shortcutOrdering");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "collectionOrdering");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR("name: %@, folder: %@, shortcutOrdering: %@, collectionOrdering: %@"), v42, v43, v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "logDatabaseModify:value:", v7, v46);

            v47 = (void *)MEMORY[0x1E0DD9C88];
            objc_msgSend(v7, "identifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "recordIDWithZoneID:collectionIdentifier:", v155, v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            v50 = (void *)MEMORY[0x1E0DD9C90];
            objc_msgSend(v7, "identifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "recordIDWithZoneID:collectionIdentifier:", v155, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v39, "isFolder")
              && (v53 = objc_msgSend(v39, "lastSyncedHash"), v53 != objc_msgSend(v39, "computedSyncHash")))
            {
              v180[0] = v49;
              v180[1] = v52;
              v54 = (void *)MEMORY[0x1E0C99D20];
              v55 = (void **)v180;
              v56 = 2;
            }
            else
            {
              v179 = v49;
              v54 = (void *)MEMORY[0x1E0C99D20];
              v55 = &v179;
              v56 = 1;
            }
            objc_msgSend(v54, "arrayWithObjects:count:", v55, v56);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v2 = v36;
            v8 = v149;
            v5 = v151;
            if (objc_msgSend(v39, "isDeleted"))
              v67 = v154;
            else
              v67 = v148;
            objc_msgSend(v67, "addObjectsFromArray:", v66);

            a1 = v156;
            v4 = v145;
          }
        }
        else
        {
          if (objc_msgSend(v7, "objectType") == 9)
          {
            v25 = v8;
            objc_msgSend(*((id *)a1[4] + 3), "logDatabaseModify:value:", v7, 0);
            v26 = (void *)MEMORY[0x1E0DD9C80];
            objc_msgSend(v7, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "recordIDWithZoneID:identifier:", v155, v27);
            v28 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DD9C80], "identifierForRecordID:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "database");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "autoShortcutsPreferencesForIdentifier:error:", v29, 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = objc_msgSend(v31, "lastSyncedHash");
            v33 = objc_msgSend(v31, "computedSyncHash");
            getWFCloudKitSyncLogObject();
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
            if (v32 == v33)
            {
              if (v35)
              {
                *(_DWORD *)buf = 136315138;
                v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                _os_log_impl(&dword_1C146A000, v34, OS_LOG_TYPE_INFO, "%s Received database change for auto shortcuts preferences but the sync hashes remain the same, skipping sync up", buf, 0xCu);
              }

            }
            else
            {
              if (v35)
              {
                *(_DWORD *)buf = 136315138;
                v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                _os_log_impl(&dword_1C146A000, v34, OS_LOG_TYPE_INFO, "%s Auto shortcuts preferences changed in the database; adding record id to save",
                  buf,
                  0xCu);
              }

              objc_msgSend(v148, "addObject:", v28);
            }
            v5 = v151;
            v8 = v25;

LABEL_53:
            v2 = v146;
            goto LABEL_59;
          }
          if (objc_msgSend(v7, "objectType") == 10)
          {
            v57 = (void *)*((_QWORD *)a1[4] + 3);
            objc_msgSend(a1[6], "libraryDotRepresentation");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "logDatabaseModify:value:", v7, v58);

            if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
            {
              objc_msgSend(a1[4], "database");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v166 = 0;
              objc_msgSend(v59, "recordWithDescriptor:error:", v7, &v166);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v166;

              if (!v29)
              {
                getWFCloudKitSyncLogObject();
                v60 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                  v175 = 2114;
                  v176 = v28;
                  v177 = 2112;
                  v178 = v7;
                  _os_log_impl(&dword_1C146A000, v60, OS_LOG_TYPE_FAULT, "%s Failed to load WFLibraryRecord from descriptor: %{public}@, descriptor = %@", buf, 0x20u);
                }

              }
              v61 = v8;
              v62 = objc_msgSend(v29, "lastSyncedHash");
              v63 = objc_msgSend(v29, "computedSyncHash");
              getWFCloudKitSyncLogObject();
              v64 = objc_claimAutoreleasedReturnValue();
              v65 = os_log_type_enabled(v64, OS_LOG_TYPE_INFO);
              if (v62 == v63)
              {
                if (v65)
                {
                  *(_DWORD *)buf = 136315138;
                  v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                  _os_log_impl(&dword_1C146A000, v64, OS_LOG_TYPE_INFO, "%s Received database change for library but the sync hashes remain the same, skipping sync up", buf, 0xCu);
                }
              }
              else
              {
                if (v65)
                {
                  *(_DWORD *)buf = 136315138;
                  v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                  _os_log_impl(&dword_1C146A000, v64, OS_LOG_TYPE_INFO, "%s Library changed in the database; adding record id to save",
                    buf,
                    0xCu);
                }

                v68 = (void *)MEMORY[0x1E0DD9CA8];
                objc_msgSend(v7, "identifier");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "recordIDWithZoneID:libraryIdentifier:", v155, v69);
                v64 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v148, "addObject:", v64);
              }
              v5 = v151;
              v8 = v61;

              goto LABEL_53;
            }
          }
        }
LABEL_59:
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v167, v181, 16);
    }
    while (v4);
  }

  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v70 = a1[7];
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v162, v172, 16);
  if (!v71)
    goto LABEL_99;
  v72 = v71;
  v73 = *(_QWORD *)v163;
  v150 = v70;
  v147 = *(_QWORD *)v163;
  do
  {
    for (i = 0; i != v72; ++i)
    {
      if (*(_QWORD *)v163 != v73)
        objc_enumerationMutation(v70);
      v75 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * i);
      v76 = (void *)MEMORY[0x1C3BAFA00]();
      if (!objc_msgSend(v75, "objectType"))
      {
        v78 = a1[6];
        objc_msgSend(v75, "identifier");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "referenceForWorkflowID:includingTombstones:", v79, 1);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        v81 = (void *)*((_QWORD *)a1[4] + 3);
        objc_msgSend(v80, "description");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "logDatabaseInsert:value:", v75, v82);

        if (v80 && (objc_msgSend(a1[6], "hasConflictingReferenceForReference:", v80) & 1) == 0)
        {
          v83 = a1[4];
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("hiddenFromLibraryAndSync"), CFSTR("syncHash"), CFSTR("lastSyncedHash"), 0);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "workflowRecordForReference:properties:", v75, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          if (v85)
          {
            if ((objc_msgSend(v85, "hiddenFromLibraryAndSync") & 1) == 0)
            {
              v86 = objc_msgSend(v85, "syncHash");
              if (v86 != objc_msgSend(v85, "lastSyncedHash"))
              {
                v87 = (void *)MEMORY[0x1E0DD9CD0];
                objc_msgSend(v75, "identifier");
                v88 = v76;
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "recordIDWithZoneID:workflowID:", v155, v89);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v153, "addObject:", v90);

                v76 = v88;
              }
            }
          }

        }
        goto LABEL_96;
      }
      if (objc_msgSend(v75, "objectType") == 2)
      {
        if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
        {
          getWFCloudKitSyncLogObject();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
            _os_log_impl(&dword_1C146A000, v77, OS_LOG_TYPE_INFO, "%s Received database change for collections but skipping sync because coherence sync is enabled", buf, 0xCu);
          }

          objc_msgSend(*((id *)a1[4] + 3), "logDatabaseInsert:value:", v75, 0);
        }
        else
        {
          v152 = v76;
          v93 = v72;
          v94 = (void *)MEMORY[0x1E0DD9C88];
          objc_msgSend(v75, "identifier");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "recordIDWithZoneID:collectionIdentifier:", v155, v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "addObject:", v96);

          objc_msgSend(a1[4], "database");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "identifier");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "collectionRecordForCollectionIdentifier:createIfNecessary:", v98, 0);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          v100 = (void *)*((_QWORD *)a1[4] + 3);
          v101 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v99, "name");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v99, "isFolder"))
            v103 = CFSTR("yes");
          else
            v103 = CFSTR("no");
          objc_msgSend(v99, "shortcutOrdering");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "collectionOrdering");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "stringWithFormat:", CFSTR("name: %@, folder: %@, shortcutOrdering: %@, collectionOrdering: %@"), v102, v103, v104, v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "logDatabaseInsert:value:", v75, v106);

          if (objc_msgSend(v99, "isFolder"))
          {
            v107 = objc_msgSend(v99, "lastSyncedHash");
            if (v107 != objc_msgSend(v99, "computedSyncHash"))
            {
              v108 = (void *)MEMORY[0x1E0DD9C90];
              objc_msgSend(v75, "identifier");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "recordIDWithZoneID:collectionIdentifier:", v155, v109);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v153, "addObject:", v110);

            }
          }

          a1 = v156;
          v72 = v93;
          v70 = v150;
          v76 = v152;
          v73 = v147;
        }
      }
      else
      {
        if (objc_msgSend(v75, "objectType") == 9)
        {
          objc_msgSend(*((id *)a1[4] + 3), "logDatabaseInsert:value:", v75, 0);
          v91 = (void *)MEMORY[0x1E0DD9C80];
          objc_msgSend(v75, "identifier");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "recordIDWithZoneID:identifier:", v155, v92);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v153, "addObject:", v80);
LABEL_96:

          goto LABEL_97;
        }
        if (objc_msgSend(v75, "objectType") == 10)
        {
          v111 = (void *)*((_QWORD *)a1[4] + 3);
          objc_msgSend(a1[6], "libraryDotRepresentation");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "logDatabaseInsert:value:", v75, v112);

          if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
          {
            v113 = (void *)MEMORY[0x1E0DD9CA8];
            objc_msgSend(v75, "identifier");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "recordIDWithZoneID:libraryIdentifier:", v155, v114);
            v80 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v153, "addObject:", v80);
            objc_msgSend(a1[4], "database");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "recordWithDescriptor:properties:error:", v75, 0, 0);
            v116 = (void *)objc_claimAutoreleasedReturnValue();

            if (v116)
            {
              objc_msgSend(v116, "cloudKitRecordMetadata");
              v117 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v117)
              {
                getWFCloudKitSyncLogObject();
                v118 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke";
                  _os_log_impl(&dword_1C146A000, v118, OS_LOG_TYPE_INFO, "%s About to upload the library to CloudKit for the first time. Uploading all shortcut records to migrate to the Shortcut_v2 record", buf, 0xCu);
                }

                objc_msgSend(a1[6], "sortedVisibleWorkflowsByName");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "descriptors");
                v120 = (void *)objc_claimAutoreleasedReturnValue();

                v161[0] = MEMORY[0x1E0C809B0];
                v161[1] = 3221225472;
                v161[2] = __71__VCCKShortcutSyncService_databaseDidChange_modified_inserted_removed___block_invoke_215;
                v161[3] = &unk_1E7AA6360;
                v161[4] = a1[4];
                objc_msgSend(v120, "if_map:", v161);
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v153, "addObjectsFromArray:", v121);

              }
            }

            goto LABEL_96;
          }
        }
      }
LABEL_97:
      objc_autoreleasePoolPop(v76);
    }
    v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v162, v172, 16);
  }
  while (v72);
LABEL_99:

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  v122 = a1[8];
  v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v157, v171, 16);
  if (v123)
  {
    v124 = v123;
    v125 = *(_QWORD *)v158;
    do
    {
      for (j = 0; j != v124; ++j)
      {
        if (*(_QWORD *)v158 != v125)
          objc_enumerationMutation(v122);
        v127 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * j);
        v128 = (void *)MEMORY[0x1C3BAFA00]();
        if (!objc_msgSend(v127, "objectType"))
        {
          objc_msgSend(*((id *)v156[4] + 3), "logDatabaseRemove:", v127);
          v130 = (void *)MEMORY[0x1E0DD9CD0];
          objc_msgSend(v156[4], "shortcutsZoneID");
          v129 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "identifier");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "recordIDWithZoneID:workflowID:", v129, v131);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "addObject:", v132);

LABEL_113:
          goto LABEL_118;
        }
        if (objc_msgSend(v127, "objectType") == 2)
        {
          objc_msgSend(*((id *)v156[4] + 3), "logDatabaseRemove:", v127);
          if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
          {
            getWFCloudKitSyncLogObject();
            v129 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v174 = "-[VCCKShortcutSyncService databaseDidChange:modified:inserted:removed:]_block_invoke_2";
              _os_log_impl(&dword_1C146A000, v129, OS_LOG_TYPE_INFO, "%s Received database change for collections but skipping sync because coherence sync is enabled", buf, 0xCu);
            }
            goto LABEL_118;
          }
          v136 = (void *)MEMORY[0x1E0DD9C88];
          objc_msgSend(v127, "identifier");
          v129 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "recordIDWithZoneID:collectionIdentifier:", v155, v129);
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "addObject:", v131);
          goto LABEL_113;
        }
        if (objc_msgSend(v127, "objectType") == 9)
        {
          objc_msgSend(*((id *)v156[4] + 3), "logDatabaseRemove:", v127);
          v133 = (void *)MEMORY[0x1E0DD9C80];
          objc_msgSend(v127, "identifier");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "recordIDWithZoneID:identifier:", v155, v134);
          v135 = objc_claimAutoreleasedReturnValue();
          goto LABEL_117;
        }
        if (objc_msgSend(v127, "objectType") == 10
          && objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
        {
          objc_msgSend(*((id *)v156[4] + 3), "logDatabaseRemove:", v127);
          v137 = (void *)MEMORY[0x1E0DD9CA8];
          objc_msgSend(v127, "identifier");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "recordIDWithZoneID:libraryIdentifier:", v155, v134);
          v135 = objc_claimAutoreleasedReturnValue();
LABEL_117:
          v129 = v135;

          objc_msgSend(v154, "addObject:", v129);
LABEL_118:

        }
        objc_autoreleasePoolPop(v128);
      }
      v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v157, v171, 16);
    }
    while (v124);
  }

  v138 = (void *)objc_msgSend(v153, "mutableCopy");
  objc_msgSend(v138, "intersectOrderedSet:", v154);
  objc_msgSend(v138, "array");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "removeObjectsInArray:", v139);

  objc_msgSend(v138, "array");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "removeObjectsInArray:", v140);

  v141 = v156[4];
  objc_msgSend(v153, "array");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "arrayByAddingObjectsFromArray:", v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "array");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "addRecordIDsToSave:recordIDsToDelete:", v143, v144);

}

id __71__VCCKShortcutSyncService_databaseDidChange_modified_inserted_removed___block_invoke_215(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0DD9CD0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "shortcutsZoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "recordIDWithZoneID:workflowID:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __32__VCCKShortcutSyncService_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1C3BAFA00]();
  objc_msgSend(WeakRetained, "sendChangedWorkflows");
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence"))
  {
    getWFCloudKitSyncLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[VCCKShortcutSyncService start]_block_invoke";
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s Sync service started but skipping sending changed folders & collections because coherence sync is enabled", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    objc_msgSend(WeakRetained, "sendChangedFolders");
    objc_msgSend(WeakRetained, "sendWorkflowOrderingsIfNeeded");
  }
  objc_msgSend(WeakRetained, "sendSyncFlagsIfNeeded");
  objc_msgSend(WeakRetained, "modifyPendingChangesInShortcutsZoneWithCompletion:", 0);
  objc_autoreleasePoolPop(v5);

}

uint64_t __59__VCCKShortcutSyncService_handleUnknownItemErrorForRecord___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSyncFlagsCloudKitRecordMetadata:", 0);
}

void __97__VCCKShortcutSyncService_handleSendLibraryConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    getWFCloudKitSyncLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 136315138;
    v17 = "-[VCCKShortcutSyncService handleSendLibraryConflictWithClientRecord:serverRecord:ancestorRecord:]_block_invoke";
    v14 = "%s Failed to fetch server record for library";
LABEL_10:
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[VCCKLibrarySyncCoordinator handleServerRecordChangedErrorForRecord:database:logger:error:](_TtC14VoiceShortcuts26VCCKLibrarySyncCoordinator, "handleServerRecordChangedErrorForRecord:database:logger:error:", v5, v7, v8, 0);

  getWFCloudKitSyncLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 136315138;
    v17 = "-[VCCKShortcutSyncService handleSendLibraryConflictWithClientRecord:serverRecord:ancestorRecord:]_block_invoke";
    v14 = "%s Failed to handle CKErrorServerRecordChanged error for library";
    goto LABEL_10;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[VCCKShortcutSyncService handleSendLibraryConflictWithClientRecord:serverRecord:ancestorRecord:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEBUG, "%s Successfully handled server record change for library", buf, 0xCu);
  }

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recordID");
  v11 = objc_claimAutoreleasedReturnValue();
  v15 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addRecordIDsToSave:recordIDsToDelete:", v13, 0);

LABEL_11:
}

void __114__VCCKShortcutSyncService_handleSendAutoShortcutsPreferencesConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0DD9C80];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0DD9C98], "hydrateItem:withRecord:setNilValues:", v5, v4, 0);

  objc_msgSend(v5, "appDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "autoShortcutsPreferencesWithCloudKitAutoShortcutsPreferences:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v8, "mergeAutoShortcutsPreferencesWithNewPreferences:error:", v7, &v16);
    v9 = v16;

    if (v9)
    {
      getWFCloudKitSyncLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[VCCKShortcutSyncService handleSendAutoShortcutsPreferencesConflictWithClientRecord:serverRecord:ancestor"
              "Record:]_block_invoke";
        v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to merge auto shortcuts preferences with error: %{public}@", buf, 0x16u);
      }

    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addRecordIDsToSave:recordIDsToDelete:", v13, 0);

  }
  else
  {
    getWFCloudKitSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[VCCKShortcutSyncService handleSendAutoShortcutsPreferencesConflictWithClientRecord:serverRecord:ancestorRe"
            "cord:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_FAULT, "%s Server record for auto shortcuts preferences has a nil app descriptor", buf, 0xCu);
    }

    v15 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addRecordIDsToSave:recordIDsToDelete:", 0, v9);
  }

}

void __99__VCCKShortcutSyncService_handleSendSyncFlagsConflictWithClientRecord_serverRecord_ancestorRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "recordSystemFieldsData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncFlagsCloudKitRecordMetadata:", v4);

}

void __63__VCCKShortcutSyncService_handleFetchedDeletionOfRecordWithID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  v4 = objc_msgSend(v2, "deleteReference:tombstone:deleteConflictIfPresent:error:", v3, 0, 1, &v8);
  v5 = v8;

  if ((v4 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v10 = "-[VCCKShortcutSyncService handleFetchedDeletionOfRecordWithID:]_block_invoke";
      v11 = 2114;
      v12 = v5;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to delete descriptor for fetched deletion: %{public}@, localDescriptor = %@", buf, 0x20u);
    }

  }
}

void __56__VCCKShortcutSyncService_handleFetchedSyncFlagsRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "recordSystemFieldsData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncFlagsCloudKitRecordMetadata:", v4);

}

uint64_t __53__VCCKShortcutSyncService_handleFetchedFolderRecord___block_invoke(uint64_t a1, uint64_t *a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setName:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC7E38]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithBackgroundColorValue:glyphCharacter:customImageData:", objc_msgSend(v6, "backgroundColorValue"), objc_msgSend(*(id *)(a1 + 32), "icon"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIcon:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLastSyncedHash:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "computedSyncHash"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLastSyncedEncryptedSchemaVersion:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "wantedEncryptedSchemaVersion"));
  objc_msgSend(*(id *)(a1 + 32), "recordSystemFieldsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCloudKitFolderRecordMetadata:", v8);

  objc_msgSend(*(id *)(a1 + 40), "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "saveRecord:withDescriptor:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48), a2);

  if ((v10 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *a2;
      v15 = 136315650;
      v16 = "-[VCCKShortcutSyncService handleFetchedFolderRecord:]_block_invoke";
      v17 = 2112;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to save WFWorkflowCollectionRecord with descriptor %@: %{public}@", (uint8_t *)&v15, 0x20u);
    }

  }
  return v10;
}

uint64_t __53__VCCKShortcutSyncService_handleFetchedFolderRecord___block_invoke_192(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionRecordForCollectionIdentifier:createIfNecessary:", *(_QWORD *)(a1 + 40), 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  void *v51;
  void *v52;
  id obj;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (!v7)
  {

    v37 = 0;
    if (a2)
      goto LABEL_28;
    goto LABEL_30;
  }
  v8 = v7;
  v46 = a2;
  v50 = 0;
  v52 = 0;
  v9 = *(_QWORD *)v57;
  v47 = *MEMORY[0x1E0DDA0C8];
  v48 = *(_QWORD *)v57;
  obj = v6;
  do
  {
    v10 = 0;
    v49 = v8;
    do
    {
      if (*(_QWORD *)v57 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1C3BAFA00]();
      objc_msgSend(*(id *)(a1 + 32), "database");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "collectionRecordForCollectionIdentifier:createIfNecessary:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "lastRemoteShortcutOrdering");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastRemoteShortcutOrderingSubset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "containsObject:", *(_QWORD *)(a1 + 40))
        && (objc_msgSend(v17, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
      {
        getWFCloudKitSyncLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = *(void **)(a1 + 40);
          objc_msgSend(v11, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v61 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
          v62 = 2114;
          v63 = v19;
          v64 = 2114;
          v65 = v20;
          _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_INFO, "%s Merging received shortcut %{public}@ into collection %{public}@", buf, 0x20u);

        }
        v51 = v12;
        if ((objc_msgSend(v15, "isFolder") & 1) != 0)
        {
          v50 = 1;
        }
        else
        {
          objc_msgSend(v11, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v50 |= objc_msgSend(v21, "isEqualToString:", v47);

        }
        v22 = *(void **)(a1 + 32);
        objc_msgSend(v15, "shortcutOrdering");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:", v23, v17, v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setShortcutOrdering:", v24);

        objc_msgSend(*(id *)(a1 + 32), "database");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v52;
        v26 = objc_msgSend(v25, "saveRecord:withDescriptor:error:", v15, v11, &v55);
        v27 = v55;

        if (v26)
        {
          objc_msgSend(*(id *)(a1 + 32), "database");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "collectionRecordForCollectionIdentifier:createIfNecessary:", v29, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = *(void **)(a1 + 32);
          objc_msgSend(v30, "shortcutOrdering");
          v32 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "calculateSubsetForRemoteOrdering:withLocalOrdering:", v16, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setLastRemoteShortcutOrderingSubset:", v33);

          objc_msgSend(*(id *)(a1 + 32), "database");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v27;
          LOBYTE(v32) = objc_msgSend(v34, "saveRecord:withDescriptor:error:", v30, v11, &v54);
          v35 = v54;

          if ((v32 & 1) != 0)
          {
            v52 = v35;
            v15 = v30;
            v9 = v48;
            v8 = v49;
            v12 = v51;
            goto LABEL_23;
          }
          getWFCloudKitSyncLogObject();
          v36 = objc_claimAutoreleasedReturnValue();
          v9 = v48;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v61 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
            v62 = 2114;
            v63 = v35;
            _os_log_impl(&dword_1C146A000, v36, OS_LOG_TYPE_ERROR, "%s Failed to save updated shortcut ordering to collection record: %{public}@", buf, 0x16u);
          }
          v27 = v35;
          v15 = v30;
        }
        else
        {
          getWFCloudKitSyncLogObject();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v61 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
            v62 = 2114;
            v63 = v27;
            _os_log_impl(&dword_1C146A000, v36, OS_LOG_TYPE_ERROR, "%s Failed to save updated shortcut ordering to collection record: %{public}@", buf, 0x16u);
          }
          v9 = v48;
        }
        v12 = v51;

        v52 = v27;
        v8 = v49;
      }
LABEL_23:

      objc_autoreleasePoolPop(v12);
      ++v10;
    }
    while (v8 != v10);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  }
  while (v8);

  v37 = v52;
  if (v50 & 1 | ((v46 & 1) == 0))
    goto LABEL_30;
LABEL_28:
  objc_msgSend(*(id *)(a1 + 32), "database");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "syncToken");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "lastOrdering");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v41)
  {
    v42 = *(void **)(a1 + 32);
    objc_msgSend(v42, "database");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "syncToken");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "lastOrdering");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "applyLegacyOrderedWorkflowIDsToRootCollection:", v45);

  }
LABEL_30:

}

void __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_179(uint64_t a1, uint64_t *a2)
{
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "createWorkflowWithIdentifier:record:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);

  if ((v5 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *a2;
      v17 = 136315650;
      v18 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
      v19 = 2112;
      v20 = v7;
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save fetched new WFWorkflowRecord with identifier %@: %{public}@", (uint8_t *)&v17, 0x20u);
    }

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", *(_QWORD *)(a1 + 40), 0);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("syncHash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "workflowRecordForReference:properties:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "setLastSyncedHash:", objc_msgSend(v12, "syncHash"));
    objc_msgSend(*(id *)(a1 + 32), "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "saveRecord:withDescriptor:error:", v12, v9, a2);

    if ((v14 & 1) == 0)
    {
      getWFCloudKitSyncLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = *a2;
        v17 = 136315394;
        v18 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
        v19 = 2114;
        v20 = v16;
        _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Failed to save workflow record with updated lastSyncedHash: %{public}@", (uint8_t *)&v17, 0x16u);
      }

    }
  }

}

void __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_182(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_2;
  v9[3] = &unk_1E7AA6208;
  v5 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v3;
  v8 = 0;
  v6 = v3;
  objc_msgSend(v4, "performTransactionWithReason:block:error:", CFSTR("save fetched workflow record"), v9, &v8);
  v7 = v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_186(id *a1, uint64_t *a2)
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  if (objc_msgSend(a1[5], "isDeleted"))
  {
    objc_msgSend(a1[6], "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "saveRecord:withDescriptor:error:", a1[7], a1[4], a2);

    if ((v6 & 1) != 0)
    {
      v7 = a1[4];
    }
    else
    {
      getWFCloudKitSyncLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *a2;
        v24 = 136315394;
        v25 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
        v26 = 2114;
        v27 = v19;
        _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_ERROR, "%s Failed to save remote WFWorkflowRecord to local WFWorkflowReference: %{public}@", (uint8_t *)&v24, 0x16u);
      }

      v7 = 0;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9F00]), "initWithRecord:", a1[5]);
    objc_msgSend(v8, "setDeleted:", 1);
    objc_msgSend(a1[6], "database");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createWorkflowWithOptions:error:", v8, a2);
    v21 = objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v4 = (id)v21;
      goto LABEL_20;
    }
    getWFCloudKitSyncLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22 = *a2;
      v24 = 136315650;
      v25 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
      v26 = 2114;
      v27 = v22;
      v28 = 2112;
      v29 = 0;
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Failed to create workflow for local WFWorkflowReference: %{public}@, conflictingRemoteReference = %@", (uint8_t *)&v24, 0x20u);
    }
    v4 = 0;
    goto LABEL_19;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9F00]), "initWithRecord:", a1[7]);
  objc_msgSend(a1[6], "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createWorkflowWithOptions:nameCollisionBehavior:error:", v8, 3, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    getWFCloudKitSyncLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *a2;
      v24 = 136315650;
      v25 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
      v26 = 2114;
      v27 = v11;
      v28 = 2112;
      v29 = 0;
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to create workflow for remote WFWorkflowReference: %{public}@, conflictingRemoteReference = %@", (uint8_t *)&v24, 0x20u);
    }

  }
  objc_msgSend(a1[7], "cloudKitRecordMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "setCloudKitRecordMetadata:", v12);

  objc_msgSend(a1[6], "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "saveRecord:withDescriptor:error:", a1[5], a1[4], a2);

  if ((v14 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *a2;
      v17 = a1[5];
      v24 = 136315650;
      v25 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
      v26 = 2114;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Failed to save local WFWorkflowRecord: %{public}@, localWorkflowRecord = %@", (uint8_t *)&v24, 0x20u);
    }
LABEL_19:

  }
LABEL_20:

  if (v7)
  {
    objc_msgSend(a1[6], "database");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setConflictingReference:forReference:", v4, v7);

  }
}

void __55__VCCKShortcutSyncService_handleFetchedWorkflowRecord___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "saveRecord:withDescriptor:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);

  if ((v5 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *a2;
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      v17 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke_2";
      v18 = 2114;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save fetched WFWorkflowRecord for WFWorkflowReference: %{public}@, reference = %@", buf, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("syncHash"), CFSTR("wantedEncryptedSchemaVersion"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workflowRecordForReference:properties:", *(_QWORD *)(a1 + 48), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setLastSyncedHash:", objc_msgSend(v10, "syncHash"));
    objc_msgSend(v11, "setLastSyncedEncryptedSchemaVersion:", objc_msgSend(v11, "wantedEncryptedSchemaVersion"));
    objc_msgSend(*(id *)(a1 + 32), "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "saveRecord:withDescriptor:error:", v11, *(_QWORD *)(a1 + 48), a2);

    if ((v13 & 1) == 0)
    {
      getWFCloudKitSyncLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *a2;
        *(_DWORD *)buf = 136315394;
        v17 = "-[VCCKShortcutSyncService handleFetchedWorkflowRecord:]_block_invoke";
        v18 = 2114;
        v19 = v15;
        _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to save workflow record with updated lastSyncedHash: %{public}@", buf, 0x16u);
      }

    }
  }

}

void __61__VCCKShortcutSyncService_handleFetchedLegacyOrderingRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "orderedWorkflowIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastOrdering:", v4);

}

void __91__VCCKShortcutSyncService_mergedOrderingFromLocalOrdering_previousOrdering_remoteOrdering___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E40], "wf_orderedSetByMergingOrderedSet:withOrderedSet:baseOrderedSet:", a1[4], a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = a1[4];
    v6 = a1[5];
    v8 = a1[6];
    v11 = 136315906;
    v12 = "-[VCCKShortcutSyncService mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:]_block_invoke";
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Merged %{public}@ with %{public}@, base %{public}@", (uint8_t *)&v11, 0x2Au);
  }

  getWFCloudKitSyncLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    v11 = 136315394;
    v12 = "-[VCCKShortcutSyncService mergedOrderingFromLocalOrdering:previousOrdering:remoteOrdering:]_block_invoke";
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s Merge result is %{public}@", (uint8_t *)&v11, 0x16u);
  }

}

id __73__VCCKShortcutSyncService_applyLegacyOrderedWorkflowIDsToRootCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BAFA00]();
  objc_msgSend(*(id *)(a1 + 32), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionRecordForCollectionIdentifier:createIfNecessary:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastRemoteShortcutOrdering");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  objc_autoreleasePoolPop(v4);
  return v12;
}

void __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a1;
  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 40), "collectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionRecordForCollectionIdentifier:createIfNecessary:", v5, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 40), "setLastSyncedHash:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 40), "computedSyncHash"));
  objc_msgSend(*(id *)(v3 + 32), "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v9, "saveRecord:withDescriptor:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 40), *(_QWORD *)(v3 + 48), a2);

  if ((v3 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *a2;
      v12 = 136315394;
      v13 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]_block_invoke";
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to save collection record with updated lasy synced hash: %{public}@", (uint8_t *)&v12, 0x16u);
    }

  }
}

void __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke_165(uint64_t a1, uint64_t *a2)
{
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  _BYTE buf[24];
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "saveRecord:withDescriptor:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), a2);

  if ((v5 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *a2;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecor"
                           "d:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save merged orderings to collection record: %{public}@", buf, 0x16u);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v12 = __Block_byref_object_copy__1187;
  v13 = __Block_byref_object_dispose__1188;
  v14 = 0;
  v8 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke_166;
  v10[3] = &unk_1E7AA6140;
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = buf;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (a2)
  {
    v9 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v9)
      *a2 = (uint64_t)objc_retainAutorelease(v9);
  }
  _Block_object_dispose(buf, 8);

}

void __96__VCCKShortcutSyncService_mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord___block_invoke_166(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = objc_msgSend(v8, "saveRecord:withDescriptor:error:", v6, v7, &v14);

  v10 = v14;
  if ((v9 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[VCCKShortcutSyncService mergeLocalOrderingChangesWithRemoteOrderingChangesFromOrderingRecord:]_block_invoke";
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to save updated ordering to root collection record: %{public}@", buf, 0x16u);
    }

  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v10;

}

void __54__VCCKShortcutSyncService_handleSavedSyncFlagsRecord___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "recordSystemFieldsData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncFlagsCloudKitRecordMetadata:", v4);

}

id __56__VCCKShortcutSyncService_sendWorkflowOrderingsIfNeeded__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[4], "containsObject:", v4) && (objc_msgSend(a1[5], "containsObject:", v4) & 1) == 0)
    v5 = (void *)MEMORY[0x1E0DD9C70];
  else
    v5 = (void *)MEMORY[0x1E0DD9C88];
  objc_msgSend(a1[6], "shortcutsZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordIDWithZoneID:collectionIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __78__VCCKShortcutSyncService_fetchAndModifyChangesInShortcutsZoneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__VCCKShortcutSyncService_fetchAndModifyChangesInShortcutsZoneWithCompletion___block_invoke_2;
  v7[3] = &unk_1E7AA7A38;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "modifyPendingChangesInShortcutsZoneWithCompletion:", v7);

}

uint64_t __78__VCCKShortcutSyncService_fetchAndModifyChangesInShortcutsZoneWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      a2 = v4;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __77__VCCKShortcutSyncService_modifyPendingChangesInShortcutsZoneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v11 = 136315394;
    v12 = "-[VCCKShortcutSyncService modifyPendingChangesInShortcutsZoneWithCompletion:]_block_invoke";
    v13 = 2114;
    v14 = v3;
    v6 = "%s Error modifying changes in the Shortcuts zone: %{public}@";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    v9 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    v11 = 136315138;
    v12 = "-[VCCKShortcutSyncService modifyPendingChangesInShortcutsZoneWithCompletion:]_block_invoke";
    v6 = "%s Finished modifying changes in the Shortcuts zone";
    v7 = v5;
    v8 = OS_LOG_TYPE_INFO;
    v9 = 12;
  }
  _os_log_impl(&dword_1C146A000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

void __69__VCCKShortcutSyncService_fetchChangesInShortcutsZoneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Finished fetching changes in the Shortcuts zone", (uint8_t *)&v10, 0xCu);
    }
    v3 = v5;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v10 = 136315394;
    v11 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]_block_invoke";
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Error fetching changes in the Shortcuts zone: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (VCCloudKitErrorContainsErrorWithCode(v3, 26))
  {
    getWFCloudKitSyncLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:

      objc_msgSend(*(id *)(a1 + 32), "createShortcutsZone");
LABEL_12:

      v3 = 0;
      goto LABEL_13;
    }
    v10 = 136315138;
    v11 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]_block_invoke";
    v7 = "%s Zone not found error encountered, asking sync engine to create the Shortcuts zone";
LABEL_7:
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
    goto LABEL_8;
  }
  if (VCCloudKitErrorContainsErrorWithCode(v3, 28))
  {
    getWFCloudKitSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEFAULT, "%s User deleted zone error encountered", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DD9CC0], "setZoneWasPurged:", 1);
    if (objc_msgSend(MEMORY[0x1E0DD9CC0], "ignoresUserDeletedZoneErrors"))
    {
      getWFCloudKitSyncLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      v10 = 136315138;
      v11 = "-[VCCKShortcutSyncService fetchChangesInShortcutsZoneWithCompletion:]_block_invoke";
      v7 = "%s User has consented to resuming sync, recreating the zone";
      goto LABEL_7;
    }
  }
LABEL_13:
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, NSObject *))(v8 + 16))(v8, v3);

}

uint64_t __102__VCCKShortcutSyncService_initWithContainer_database_applicationObserver_automaticSyncEnabled_logger___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSyncEngineMetadata:", *(_QWORD *)(a1 + 32));
}

@end
