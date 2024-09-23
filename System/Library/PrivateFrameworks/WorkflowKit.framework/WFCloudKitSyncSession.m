@implementation WFCloudKitSyncSession

+ (void)setWalrusEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isWalrusEnabled") != a3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("WFWalrusGroundTruthEnabled"));

    getWFWalrusLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "+[WFCloudKitSyncSession setWalrusEnabled:]";
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s Walrus ground truth status has changed to %d", (uint8_t *)&v7, 0x12u);
    }

    objc_msgSend(a1, "resolveWalrusStatus");
  }
}

void __35__WFCloudKitSyncSession_initialize__block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("WFCloudKitSyncEnabled");
  v3[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v1);

}

+ (BOOL)zoneWasPurged
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFCloudKitSyncZoneWasPurged"));

  return v3;
}

+ (BOOL)isSyncEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFCloudKitSyncEnabled"));

  return v3;
}

+ (BOOL)isWalrusEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFWalrusEnabled"));

  return v3;
}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_949);
}

+ (void)setSyncEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("WFCloudKitSyncEnabled"));

}

+ (void)setZoneWasPurged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("WFCloudKitSyncZoneWasPurged"));

}

+ (BOOL)ignoresUserDeletedZoneErrors
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFCloudKitSyncIgnoresUserDeletedZoneErrors"));

  return v3;
}

+ (void)setIgnoresUserDeletedZoneErrors:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("WFCloudKitSyncIgnoresUserDeletedZoneErrors"));

}

+ (BOOL)voiceShortcutMigrationDidRun
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VCVoiceShortcutMigrationDidRun"));

  return v3;
}

+ (void)setVoiceShortcutMigrationDidRun:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VCVoiceShortcutMigrationDidRun"));

}

+ (BOOL)voiceShortcutMigrationDidSync
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VCVoiceShortcutMigrationDidSync"));

  return v3;
}

+ (void)setVoiceShortcutMigrationDidSync:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("VCVoiceShortcutMigrationDidSync"));

}

+ (int64_t)defaultShortcutsVersion
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("WFDefaultShortcutsVersion"));

  return v3;
}

+ (void)setDefaultShortcutsVersion:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("WFDefaultShortcutsVersion"));

}

+ (BOOL)needsDefaultShortcutUpdate
{
  uint64_t v3;

  v3 = objc_msgSend(a1, "defaultShortcutsVersion");
  return v3 < objc_msgSend(a1, "currentDefaultShortcutsVersion");
}

+ (int64_t)lastSyncedFlagsHash
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("WFLastSyncedFlagsHash"));

  return v3;
}

+ (void)setLastSyncedFlagsHash:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("WFLastSyncedFlagsHash"));

}

+ (int64_t)syncedFlagsHash
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = objc_msgSend(a1, "defaultShortcutsVersion");
  v4 = objc_msgSend(a1, "voiceShortcutMigrationDidRun");
  v5 = 3735928559;
  if (v4)
    v5 = 305419896;
  return v5 ^ v3;
}

+ (void)resolveWalrusStatus
{
  void *v2;
  int v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFWalrusGroundTruthEnabled"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("WFWalrusForcedEnabled"));

  v6 = v3 | v5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v6, CFSTR("WFWalrusEnabled"));

  getWFWalrusLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "+[WFCloudKitSyncSession resolveWalrusStatus]";
    v11 = 1024;
    v12 = v6;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Walrus final status has changed to %d", (uint8_t *)&v9, 0x12u);
  }

}

+ (BOOL)isWalrusForcedEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFWalrusForcedEnabled"));

  return v3;
}

+ (void)setWalrusForcedEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isWalrusForcedEnabled") != a3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("WFWalrusForcedEnabled"));

    getWFWalrusLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "+[WFCloudKitSyncSession setWalrusForcedEnabled:]";
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s Walrus status has been FORCED to %d", (uint8_t *)&v7, 0x12u);
    }

    objc_msgSend(a1, "resolveWalrusStatus");
  }
}

+ (int64_t)currentDefaultShortcutsVersion
{
  return 2;
}

+ (void)fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler:(id)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  WFCloudKitItemRequest *v13;
  void *v14;
  WFCloudKitItemRequest *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a1, "needsDefaultShortcutUpdate");
  v7 = objc_msgSend(a1, "voiceShortcutMigrationDidSync");
  v8 = v7;
  if ((v6 & 1) != 0 || !v7)
  {
    getWFCloudKitSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "+[WFCloudKitSyncSession fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler:]";
      v25 = 1026;
      v26 = v6;
      v27 = 1026;
      v28 = v8;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Fetching sync flags record from CloudKit, needsDefaultShortcutUpdate = %{public}d, voiceShortcutMigrationDidSync = %{public}d", buf, 0x18u);
    }

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCloudKitSyncSession.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    }
    objc_msgSend(MEMORY[0x1E0C94C28], "wf_shortcutsContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0C95098]);
    v12 = (void *)objc_msgSend(v11, "initWithZoneName:ownerName:", CFSTR("Shortcuts"), *MEMORY[0x1E0C94730]);
    v13 = [WFCloudKitItemRequest alloc];
    objc_msgSend(v10, "privateCloudDatabase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WFCloudKitItemRequest initWithContainer:database:](v13, "initWithContainer:database:", v10, v14);

    +[WFCloudKitSyncFlags recordIDWithZoneID:](WFCloudKitSyncFlags, "recordIDWithZoneID:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __80__WFCloudKitSyncSession_fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler___block_invoke;
    v20[3] = &unk_1E7AEA6F8;
    v21 = v5;
    v22 = a1;
    v18 = -[WFCloudKitItemRequest fetchItemWithID:itemType:groupName:properties:completionHandler:](v15, "fetchItemWithID:itemType:groupName:properties:completionHandler:", v16, v17, CFSTR("InitialSetup"), 0, v20);

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

void __80__WFCloudKitSyncSession_fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFCloudKitSyncLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315906;
    v10 = "+[WFCloudKitSyncSession fetchCloudKitSyncFlagsIfNecessaryWithCompletionHandler:]_block_invoke";
    v11 = 2050;
    v12 = objc_msgSend(v5, "defaultShortcutsVersion");
    v13 = 1026;
    v14 = objc_msgSend(v5, "migratedVoiceShortcuts");
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Finished fetching sync flags record from CloudKit, item.defaultShortcutsVersion = %{public}ld, item.migratedVoiceShortcuts = %{public}d, error = %{public}@", (uint8_t *)&v9, 0x26u);
  }

  if (v5)
  {
    if (objc_msgSend(v5, "defaultShortcutsVersion"))
      objc_msgSend(*(id *)(a1 + 40), "setDefaultShortcutsVersion:", objc_msgSend(v5, "defaultShortcutsVersion"));
    if (objc_msgSend(v5, "migratedVoiceShortcuts"))
    {
      objc_msgSend(*(id *)(a1 + 40), "setVoiceShortcutMigrationDidSync:", 1);
      objc_msgSend(*(id *)(a1 + 40), "setVoiceShortcutMigrationDidRun:", 1);
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

- (id)applyConflictResolution:(id)a3 inDatabase:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _BYTE *v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  getWFCloudKitSyncLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_INFO, "%s applying conflict resolution: %@", buf, 0x16u);
  }

  objc_msgSend(v5, "localWorkflowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "referenceForWorkflowID:includingTombstones:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "recordWithDescriptor:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteWorkflowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "referenceForWorkflowID:includingTombstones:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "recordWithDescriptor:error:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__954;
  v32 = __Block_byref_object_dispose__955;
  v33 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__WFCloudKitSyncSession_applyConflictResolution_inDatabase___block_invoke;
  v22[3] = &unk_1E7AEA6D0;
  v14 = v13;
  v23 = v14;
  v15 = v10;
  v24 = v15;
  v16 = v6;
  v25 = v16;
  v17 = v9;
  v26 = v17;
  v18 = v12;
  v27 = v18;
  v29 = buf;
  v19 = v5;
  v28 = v19;
  objc_msgSend(v16, "performTransactionWithReason:block:error:", CFSTR("conflict resolution"), v22, 0);
  v20 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v20;
}

void __60__WFCloudKitSyncSession_applyConflictResolution_inDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v2 = MEMORY[0x1E0C809B0];
  v44 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__WFCloudKitSyncSession_applyConflictResolution_inDatabase___block_invoke_2;
  aBlock[3] = &unk_1E7AF5640;
  v34 = *(id *)(a1 + 32);
  v35 = *(id *)(a1 + 40);
  v36 = *(id *)(a1 + 48);
  v37 = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 80);
  v38 = v3;
  v39 = v4;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  v26[0] = v2;
  v26[1] = 3221225472;
  v26[2] = __60__WFCloudKitSyncSession_applyConflictResolution_inDatabase___block_invoke_128;
  v26[3] = &unk_1E7AF5640;
  v27 = *(id *)(a1 + 40);
  v28 = *(id *)(a1 + 48);
  v29 = *(id *)(a1 + 56);
  v30 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 80);
  v31 = v6;
  v32 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(v26);
  if (!objc_msgSend(*(id *)(a1 + 72), "keepLocal")
    || !objc_msgSend(*(id *)(a1 + 72), "keepRemote"))
  {
    if (!objc_msgSend(*(id *)(a1 + 72), "keepRemote"))
    {
      if (!objc_msgSend(*(id *)(a1 + 72), "keepLocal"))
        goto LABEL_20;
LABEL_19:
      v8[2](v8);
      goto LABEL_20;
    }
LABEL_17:
    v5[2](v5);
    goto LABEL_20;
  }
  getWFCloudKitSyncLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_INFO, "%s Conflict resolution: keeping both local and remote change", buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "isDeleted"))
    goto LABEL_17;
  if (objc_msgSend(*(id *)(a1 + 32), "isDeleted"))
    goto LABEL_19;
  objc_msgSend(*(id *)(a1 + 48), "setConflictingReference:forReference:", 0, *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setLastSyncedHash:", 0);
  v10 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestedWorkflowNameForName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setName:", v12);

  v13 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 64);
  v25 = 0;
  LOBYTE(v11) = objc_msgSend(v13, "saveRecord:withDescriptor:error:", v14, v15, &v25);
  v16 = v25;
  if ((v11 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
      v42 = 2114;
      v43 = v16;
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_ERROR, "%s Failed to save remoteWorkflow: %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "setLastSyncedHash:", 0);
  v19 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 56);
  v24 = v16;
  v21 = objc_msgSend(v18, "saveRecord:withDescriptor:error:", v19, v20, &v24);
  v22 = v24;

  if ((v21 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
      v42 = 2114;
      v43 = v22;
      _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_ERROR, "%s Failed to save localWorkflow: %{public}@", buf, 0x16u);
    }

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(a1 + 56));

LABEL_20:
}

void __60__WFCloudKitSyncSession_applyConflictResolution_inDatabase___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char v33;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  char v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke_2";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_INFO, "%s Conflict resolution: keeping remote change", buf, 0xCu);
  }

  v3 = *(void **)(a1 + 32);
  if (v3 && (objc_msgSend(v3, "isDeleted") & 1) == 0)
  {
    v15 = objc_msgSend(*(id *)(a1 + 40), "isDeleted");
    getWFCloudKitSyncLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v17)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_INFO, "%s Conflict being resolved is 'local deleted - remote changed'", buf, 0xCu);
      }

      v18 = *(void **)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 56);
      v48 = 0;
      v20 = objc_msgSend(v18, "deleteReference:tombstone:deleteConflictIfPresent:error:", v19, 0, 0, &v48);
      v21 = v48;
      if ((v20 & 1) == 0)
      {
        getWFCloudKitSyncLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
          v51 = 2114;
          v52 = v21;
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Failed to delete localWorkflowReference: %{public}@", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "setLastSyncedHash:", 0);
      v23 = *(void **)(a1 + 48);
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 64);
      v47 = v21;
      v26 = objc_msgSend(v23, "saveRecord:withDescriptor:error:", v24, v25, &v47);
      v13 = v47;

      if ((v26 & 1) == 0)
      {
        getWFCloudKitSyncLogObject();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
          v51 = 2114;
          v52 = v13;
          _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_ERROR, "%s Failed to save remoteWorkflow: %{public}@", buf, 0x16u);
        }

      }
      v28 = *(void **)(a1 + 48);
      v29 = *(void **)(a1 + 64);
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_INFO, "%s Conflict being resolved is 'local changed - remote changed'", buf, 0xCu);
      }

      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(void **)(a1 + 48);
      v32 = *(_QWORD *)(a1 + 56);
      v46 = 0;
      v33 = objc_msgSend(v31, "saveRecord:withDescriptor:error:", v30, v32, &v46);
      v34 = v46;
      if ((v33 & 1) == 0)
      {
        getWFCloudKitSyncLogObject();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
          v51 = 2114;
          v52 = v34;
          _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_ERROR, "%s Failed to save remoteWorkflow into localWorkflowReference: %{public}@", buf, 0x16u);
        }

      }
      v36 = *(void **)(a1 + 48);
      v37 = *(_QWORD *)(a1 + 64);
      v45 = v34;
      v38 = objc_msgSend(v36, "deleteReference:tombstone:deleteConflictIfPresent:error:", v37, 0, 0, &v45);
      v13 = v45;

      if ((v38 & 1) == 0)
      {
        getWFCloudKitSyncLogObject();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
          v51 = 2114;
          v52 = v13;
          _os_log_impl(&dword_1C15B3000, v39, OS_LOG_TYPE_ERROR, "%s Failed to delete remoteWorkflowReference: %{public}@", buf, 0x16u);
        }

      }
      v28 = *(void **)(a1 + 48);
      v29 = *(void **)(a1 + 56);
    }
    objc_msgSend(v29, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "referenceForWorkflowID:includingTombstones:", v14, 1);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v42 = *(void **)(v41 + 40);
    *(_QWORD *)(v41 + 40) = v40;

    goto LABEL_38;
  }
  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Conflict being resolved is 'local changed - remote deleted'", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v44 = 0;
  v7 = objc_msgSend(v5, "deleteReference:tombstone:deleteConflictIfPresent:error:", v6, 0, 0, &v44);
  v8 = v44;
  if ((v7 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
      v51 = 2114;
      v52 = v8;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to delete localWorkflowReference: %{public}@", buf, 0x16u);
    }

  }
  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 64);
  v43 = v8;
  v12 = objc_msgSend(v10, "deleteReference:tombstone:deleteConflictIfPresent:error:", v11, 0, 0, &v43);
  v13 = v43;

  if ((v12 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
      v51 = 2114;
      v52 = v13;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Failed to delete remoteWorkflowReference: %{public}@", buf, 0x16u);
    }
LABEL_38:

  }
}

void __60__WFCloudKitSyncSession_applyConflictResolution_inDatabase___block_invoke_128(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  getWFCloudKitSyncLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_INFO, "%s Conflict resolution: keeping local change", buf, 0xCu);
  }

  v3 = objc_msgSend(*(id *)(a1 + 32), "isDeleted");
  getWFCloudKitSyncLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Conflict being resolved is 'local changed - remote changed or deleted'", buf, 0xCu);
    }

    v22 = *(void **)(a1 + 40);
    v23 = *(_QWORD *)(a1 + 56);
    v35 = 0;
    v24 = objc_msgSend(v22, "deleteReference:tombstone:deleteConflictIfPresent:error:", v23, 0, 0, &v35);
    v25 = v35;
    if ((v24 & 1) == 0)
    {
      getWFCloudKitSyncLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
        v41 = 2114;
        v42 = v25;
        _os_log_impl(&dword_1C15B3000, v26, OS_LOG_TYPE_ERROR, "%s Failed to delete remoteWorkflowReference: %{public}@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "setLastSyncedHash:", 0);
    v28 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(a1 + 40);
    v29 = *(_QWORD *)(a1 + 48);
    v34 = v25;
    v30 = objc_msgSend(v27, "saveRecord:withDescriptor:error:", v28, v29, &v34);
    v20 = v34;

    if ((v30 & 1) == 0)
    {
      getWFCloudKitSyncLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
        v41 = 2114;
        v42 = v20;
        _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_ERROR, "%s Failed to save localWorkflow: %{public}@", buf, 0x16u);
      }

    }
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v33 = *(id *)(a1 + 48);
    v21 = *(NSObject **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v33;
    goto LABEL_28;
  }
  if (v5)
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Conflict being resolved is 'local deleted - remote changed'", buf, 0xCu);
  }

  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v38 = 0;
  v8 = objc_msgSend(v6, "deleteReference:tombstone:deleteConflictIfPresent:error:", v7, 0, 0, &v38);
  v9 = v38;
  if ((v8 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
      v41 = 2114;
      v42 = v9;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to delete localWorkflowReference: %{public}@", buf, 0x16u);
    }

  }
  v11 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 56);
  v37 = v9;
  v13 = objc_msgSend(v11, "deleteReference:tombstone:deleteConflictIfPresent:error:", v12, 1, 0, &v37);
  v14 = v37;

  if ((v13 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
      v41 = 2114;
      v42 = v14;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Failed to tombstone remoteWorkflowReference: %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 64), "setLastSyncedHash:", 0);
  v16 = *(void **)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 56);
  v17 = *(_QWORD *)(a1 + 64);
  v36 = v14;
  v19 = objc_msgSend(v16, "saveRecord:withDescriptor:error:", v17, v18, &v36);
  v20 = v36;

  if ((v19 & 1) == 0)
  {
    getWFCloudKitSyncLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[WFCloudKitSyncSession applyConflictResolution:inDatabase:]_block_invoke";
      v41 = 2114;
      v42 = v20;
      _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_ERROR, "%s Failed to save remoteWorkflow: %{public}@", buf, 0x16u);
    }
LABEL_28:

  }
}

@end
