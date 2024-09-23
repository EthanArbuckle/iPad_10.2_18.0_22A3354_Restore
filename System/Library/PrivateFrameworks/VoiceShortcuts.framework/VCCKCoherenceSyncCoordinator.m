@implementation VCCKCoherenceSyncCoordinator

- (VCCKCoherenceSyncCoordinator)initWithContainer:(id)a3 applicationObserver:(id)a4
{
  id v7;
  id v8;
  VCCKCoherenceSyncCoordinator *v9;
  VCCKCoherenceSyncCoordinator *v10;
  VCCKCoherenceSyncCoordinator *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VCCKCoherenceSyncCoordinator;
  v9 = -[VCCKCoherenceSyncCoordinator init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_applicationObserver, a4);
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[VCCKCoherenceSyncCoordinator isStarted](self, "isStarted"))
  {
    -[VCCKCoherenceSyncCoordinator applicationObserver](self, "applicationObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("applicationVisible"), VCCKCoherenceSyncCoordinatorObserverContext);

  }
  v4.receiver = self;
  v4.super_class = (Class)VCCKCoherenceSyncCoordinator;
  -[VCCKCoherenceSyncCoordinator dealloc](&v4, sel_dealloc);
}

- (void)start
{
  void *v3;

  if (!-[VCCKCoherenceSyncCoordinator isStarted](self, "isStarted"))
  {
    -[VCCKCoherenceSyncCoordinator setStarted:](self, "setStarted:", 1);
    -[VCCKCoherenceSyncCoordinator applicationObserver](self, "applicationObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("applicationVisible"), 0, VCCKCoherenceSyncCoordinatorObserverContext);

    -[VCCKCoherenceSyncCoordinator checkDeviceRecords](self, "checkDeviceRecords");
  }
}

- (void)checkDeviceRecords
{
  if ((objc_msgSend(MEMORY[0x1E0C99EA0], "shouldSyncCoherence") & 1) == 0)
    -[VCCKCoherenceSyncCoordinator recordsContainIncompatibleDevice:](self, "recordsContainIncompatibleDevice:", &__block_literal_global_2587);
}

- (void)recordsContainIncompatibleDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VCCKCoherenceSyncCoordinator recordsContainIncompatibleDevice:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Fetching device records", buf, 0xCu);
  }

  -[VCCKCoherenceSyncCoordinator container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__VCCKCoherenceSyncCoordinator_recordsContainIncompatibleDevice___block_invoke;
  v8[3] = &unk_1E7AA6820;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "wf_fetchDeviceRecords:", v8);

}

- (BOOL)deviceOSVersionNumber:(id)a3 isGreaterThanOrEqualTo:(id)a4
{
  id v5;
  _OWORD v7[2];
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, sizeof(v8));
  v5 = a4;
  MEMORY[0x1C3BAF658](v8, a3);
  memset(v7, 0, sizeof(v7));
  MEMORY[0x1C3BAF658](v7, v5);

  return _LSVersionNumberCompare() != -1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  int v8;

  if ((void *)VCCKCoherenceSyncCoordinatorObserverContext == a6)
  {
    -[VCCKCoherenceSyncCoordinator applicationObserver](self, "applicationObserver", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isApplicationVisible");

    if (v8)
      -[VCCKCoherenceSyncCoordinator checkDeviceRecords](self, "checkDeviceRecords");
  }
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (VCCKApplicationStateObserver)applicationObserver
{
  return self->_applicationObserver;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationObserver, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

void __65__VCCKCoherenceSyncCoordinator_recordsContainIncompatibleDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[3];
  char v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v9 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__VCCKCoherenceSyncCoordinator_recordsContainIncompatibleDevice___block_invoke_2;
    v7[3] = &unk_1E7AA67F8;
    v7[4] = *(_QWORD *)(a1 + 32);
    v7[5] = v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    _Block_object_dispose(v8, 8);
  }

}

void __65__VCCKCoherenceSyncCoordinator_recordsContainIncompatibleDevice___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DD9F90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DD9F98]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getWFCloudKitSyncLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "-[VCCKCoherenceSyncCoordinator recordsContainIncompatibleDevice:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Device record doesn't contain OS type and/or OS version number, skipping record", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "modifiedByDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modificationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136316162;
      v18 = "-[VCCKCoherenceSyncCoordinator recordsContainIncompatibleDevice:]_block_invoke_2";
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_INFO, "%s Found device record: name: %@, os type: %@, os version: %@, modification date: %@", (uint8_t *)&v17, 0x34u);

    }
    objc_msgSend(&unk_1E7ABF738, "objectForKeyedSubscript:", v7);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v10 = v15;
      if ((objc_msgSend(*(id *)(a1 + 32), "deviceOSVersionNumber:isGreaterThanOrEqualTo:", v8, v15) & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
    else
    {
      getWFCloudKitSyncLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = 136315138;
        v18 = "-[VCCKCoherenceSyncCoordinator recordsContainIncompatibleDevice:]_block_invoke";
        _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_ERROR, "%s Device record contains unknown OS type, skipping record", (uint8_t *)&v17, 0xCu);
      }

      v10 = 0;
    }
  }

}

void __50__VCCKCoherenceSyncCoordinator_checkDeviceRecords__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  _BOOL4 v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    getWFCloudKitSyncLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[VCCKCoherenceSyncCoordinator checkDeviceRecords]_block_invoke";
      v14 = 2114;
      v15 = v4;
      v6 = "%s Failed to fetch device records: %{public}@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 22;
LABEL_14:
      _os_log_impl(&dword_1C146A000, v7, v8, v6, (uint8_t *)&v12, v9);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (a2)
  {
    getWFCloudKitSyncLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
    v12 = 136315138;
    v13 = "-[VCCKCoherenceSyncCoordinator checkDeviceRecords]_block_invoke";
    v6 = "%s Incompatible devices found, not enabling coherence sync";
LABEL_13:
    v7 = v5;
    v8 = OS_LOG_TYPE_DEBUG;
    v9 = 12;
    goto LABEL_14;
  }
  v10 = objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled");
  getWFCloudKitSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (!v10)
  {
    if (!v11)
      goto LABEL_15;
    v12 = 136315138;
    v13 = "-[VCCKCoherenceSyncCoordinator checkDeviceRecords]_block_invoke";
    v6 = "%s All devices in user's sync circle have updated but coherence migration is disabled, not enabling coherence sync";
    goto LABEL_13;
  }
  if (v11)
  {
    v12 = 136315138;
    v13 = "-[VCCKCoherenceSyncCoordinator checkDeviceRecords]_block_invoke";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEBUG, "%s All devices in user's sync circle have updated, enabling coherence sync", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "setShouldSyncCoherence:", 1);
LABEL_16:

}

@end
