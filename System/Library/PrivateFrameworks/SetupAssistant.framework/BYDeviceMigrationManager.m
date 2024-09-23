@implementation BYDeviceMigrationManager

- (BYDeviceMigrationManager)initWithFileTranferSession:(id)a3
{
  id v5;
  BYDeviceMigrationManager *v6;
  BYDeviceMigrationManager *v7;
  uint64_t v8;
  NSHashTable *delegates;
  dispatch_queue_t v10;
  OS_dispatch_queue *migrationQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BYDeviceMigrationManager;
  v6 = -[BYDeviceMigrationManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileTransferSession, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v8;

    v10 = dispatch_queue_create("Device Migration Queue", 0);
    migrationQueue = v7->_migrationQueue;
    v7->_migrationQueue = (OS_dispatch_queue *)v10;

    *(_OWORD *)&v7->_bytesTransferred = 0u;
    *(_OWORD *)&v7->_durationOfTransfer = 0u;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (-[BYDeviceMigrationManager deviceLockAssertion](self, "deviceLockAssertion"))
    CFRelease(-[BYDeviceMigrationManager deviceLockAssertion](self, "deviceLockAssertion"));
  v3.receiver = self;
  v3.super_class = (Class)BYDeviceMigrationManager;
  -[BYDeviceMigrationManager dealloc](&v3, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[BYDeviceMigrationManager migrationQueue](self, "migrationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__BYDeviceMigrationManager_start__block_invoke;
  block[3] = &unk_1E4E26958;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __33__BYDeviceMigrationManager_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id buf[2];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Preparing for device to device migration...", (uint8_t *)buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "takeAssertions");
  v3 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "fileTransferSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDeviceTransferTask:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDeviceTransferTask:", v5);

  objc_msgSend(*(id *)(a1 + 32), "migrationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceTransferTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueue:", v6);

  objc_initWeak(buf, *(id *)(a1 + 32));
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __33__BYDeviceMigrationManager_start__block_invoke_4;
  v18[3] = &unk_1E4E27A40;
  objc_copyWeak(&v19, buf);
  objc_msgSend(*(id *)(a1 + 32), "deviceTransferTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConnectionInfoHandler:", v18);

  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __33__BYDeviceMigrationManager_start__block_invoke_6;
  v16[3] = &unk_1E4E27A68;
  objc_copyWeak(&v17, buf);
  objc_msgSend(*(id *)(a1 + 32), "deviceTransferTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProgressHandler:", v16);

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __33__BYDeviceMigrationManager_start__block_invoke_2;
  v14[3] = &unk_1E4E27A90;
  objc_copyWeak(&v15, buf);
  objc_msgSend(*(id *)(a1 + 32), "deviceTransferTask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCompletionHandler:", v14);

  _BYLoggingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A4E92000, v12, OS_LOG_TYPE_DEFAULT, "Starting device to device migration...", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setMigrating:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setComplete:", 0);
  objc_msgSend(*(id *)(a1 + 32), "startDeviceTransferTask");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(buf);
}

void __33__BYDeviceMigrationManager_start__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v18 = objc_msgSend(v3, "connectionState");
    v19 = 2048;
    v20 = objc_msgSend(v3, "connectionType");
    _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Migration connection information updated (state: %ld, type: %ld)", buf, 0x16u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(WeakRetained, "delegates", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "deviceMigrationManager:didChangeConnectionInformation:", WeakRetained, v3);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_msgSend(WeakRetained, "setConnectionInfo:", v3);
}

void __33__BYDeviceMigrationManager_start__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(WeakRetained, "delegates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10++), "deviceMigrationManager:didUpdateProgress:", WeakRetained, v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  objc_msgSend(WeakRetained, "setProgressInfo:", v3);
  objc_msgSend(v3, "progress");
  if (v11 > 0.0)
  {
    objc_msgSend(WeakRetained, "setBytesTransferred:", objc_msgSend(v3, "bytesTransferred"));
    objc_msgSend(WeakRetained, "setFilesTransferred:", objc_msgSend(v3, "filesTransferred"));
    objc_msgSend(v3, "fileTransferStartDate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v3, "restoreStartDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v3, "restoreStartDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fileTransferStartDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceDate:", v16);
        objc_msgSend(WeakRetained, "setDurationOfTransfer:");

        objc_msgSend(v3, "restoreStartDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceNow");
        objc_msgSend(WeakRetained, "setDurationOfRestore:", -v18);

      }
    }
  }

}

void __33__BYDeviceMigrationManager_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[8];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setError:", v3);
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __33__BYDeviceMigrationManager_start__block_invoke_2_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Migration completed successfully!", buf, 2u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(WeakRetained, "delegates", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "deviceMigrationManager:didCompleteWithError:", WeakRetained, v3);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v16);
  }

  objc_msgSend(WeakRetained, "didCompleteWithError:", v3);
  objc_msgSend(WeakRetained, "releaseAssertions");
  objc_msgSend(WeakRetained, "setMigrating:", 0);
  objc_msgSend(WeakRetained, "setComplete:", 1);

}

- (void)cancelWithCause:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[BYDeviceMigrationManager migrationQueue](self, "migrationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__BYDeviceMigrationManager_cancelWithCause___block_invoke;
  v6[3] = &unk_1E4E27AB8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

uint64_t __44__BYDeviceMigrationManager_cancelWithCause___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setWillMigrate:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "isMigrating");
  if ((_DWORD)result)
  {
    _BYLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 134217984;
      v6 = v4;
      _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling device to device migration with cancellation cause: %ld...", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "releaseAssertions");
    objc_msgSend(*(id *)(a1 + 32), "cancelDeviceTransferTask");
    objc_msgSend(*(id *)(a1 + 32), "setMigrating:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setCancellationCause:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setError:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "didCancel");
  }
  return result;
}

- (void)restartDeviceTransferTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[BYDeviceMigrationManager migrationQueue](self, "migrationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke;
  block[3] = &unk_1E4E27798;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id buf[2];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Restarting transfer task...", (uint8_t *)buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setFileTransferSession:", *(_QWORD *)(a1 + 40));
  objc_initWeak(buf, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke_10;
  v4[3] = &unk_1E4E27A90;
  objc_copyWeak(&v5, buf);
  objc_msgSend(*(id *)(a1 + 32), "deviceTransferTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletionHandler:", v4);

  objc_msgSend(*(id *)(a1 + 32), "cancelDeviceTransferTask");
  objc_msgSend(*(id *)(a1 + 32), "startDeviceTransferTask");
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MBErrorDomain")) & 1) != 0)
    {
      v6 = objc_msgSend(v3, "code");

      if (v6 == 202)
        goto LABEL_9;
    }
    else
    {

    }
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke_10_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);

  }
LABEL_9:
  objc_msgSend(WeakRetained, "setDeviceTransferTask:", 0);
  objc_msgSend(WeakRetained, "start");

}

- (BOOL)willMigrate
{
  return self->_willMigrate || -[BYDeviceMigrationManager isMigrating](self, "isMigrating");
}

+ (id)createDeviceTransferTask:(id)a3
{
  return 0;
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BYDeviceMigrationManager migrationQueue](self, "migrationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__BYDeviceMigrationManager_addDelegate___block_invoke;
  v7[3] = &unk_1E4E27798;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__BYDeviceMigrationManager_addDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
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
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "connectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v5, "connectionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceMigrationManager:didChangeConnectionInformation:", v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "progressInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v9, "progressInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceMigrationManager:didUpdateProgress:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isComplete"))
  {
    v13 = a1 + 32;
    v11 = *(void **)(a1 + 32);
    v12 = *(void **)(v13 + 8);
    objc_msgSend(v11, "error");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceMigrationManager:didCompleteWithError:", v11, v14);

  }
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BYDeviceMigrationManager migrationQueue](self, "migrationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__BYDeviceMigrationManager_removeDelegate___block_invoke;
  v7[3] = &unk_1E4E27798;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __43__BYDeviceMigrationManager_removeDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (BOOL)_hasAssertions
{
  void *v3;
  BOOL v4;

  -[BYDeviceMigrationManager processAssertion](self, "processAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[BYDeviceMigrationManager deviceLockAssertion](self, "deviceLockAssertion") != 0;
  else
    v4 = 0;

  return v4;
}

- (BOOL)requiresProcessAssertion
{
  return 1;
}

- (BOOL)takeAssertions
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  int v21;
  void *v22;
  void *v23;
  _QWORD handler[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[BYDeviceMigrationManager migrationQueue](self, "migrationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)voucher_copy();
  -[BYDeviceMigrationManager setClientVoucher:](self, "setClientVoucher:", v4);

  if (!-[BYDeviceMigrationManager requiresProcessAssertion](self, "requiresProcessAssertion"))
  {
LABEL_6:
    -[BYDeviceMigrationManager setDeviceLockAssertion:](self, "setDeviceLockAssertion:", -[BYDeviceMigrationManager acquireDeviceLockAssertion](self, "acquireDeviceLockAssertion"));
    v16 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D471D8], "cStringUsingEncoding:", 4);
    -[BYDeviceMigrationManager migrationQueue](self, "migrationQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __42__BYDeviceMigrationManager_takeAssertions__block_invoke;
    handler[3] = &unk_1E4E27AE0;
    handler[4] = self;
    v18 = notify_register_dispatch(v16, &self->_passcodeChangeNotificationToken, v17, handler);

    if (v18)
    {
      _BYLoggingFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[BYDeviceMigrationManager takeAssertions].cold.1(v18, v19);

      -[BYDeviceMigrationManager setPasscodeChangeNotificationToken:](self, "setPasscodeChangeNotificationToken:", 0xFFFFFFFFLL);
    }
    return 1;
  }
  -[BYDeviceMigrationManager processAssertion](self, "processAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  v6 = objc_alloc(MEMORY[0x1E0D87C98]);
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", getpid());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.purplebuddy"), CFSTR("Update"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithExplanation:target:attributes:", CFSTR("Device-to-Device Migration"), v7, v9);
  -[BYDeviceMigrationManager setProcessAssertion:](self, "setProcessAssertion:", v10);

  -[BYDeviceMigrationManager processAssertion](self, "processAssertion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v12 = objc_msgSend(v11, "acquireWithError:", &v25);
  v13 = v25;

  _BYLoggingFacility();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v15, OS_LOG_TYPE_DEFAULT, "Process lock assertion successfully taken during migration", buf, 2u);
    }

    goto LABEL_6;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v21 = 0;
      v22 = v13;
    }
    else if (v13)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "domain");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v12, objc_msgSend(v13, "code"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 1;
    }
    else
    {
      v21 = 0;
      v22 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v27 = v22;
    _os_log_error_impl(&dword_1A4E92000, v15, OS_LOG_TYPE_ERROR, "Failed to take process assertion during migration: %{public}@", buf, 0xCu);
    if (v21)
    {

    }
  }

  -[BYDeviceMigrationManager releaseAssertions](self, "releaseAssertions");
  return 0;
}

uint64_t __42__BYDeviceMigrationManager_takeAssertions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reacquireDeviceLockAssertion");
}

- (__MKBAssertion)acquireDeviceLockAssertion
{
  void *v2;
  __MKBAssertion *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("MKBAssertionKey");
  v10[0] = CFSTR("RestoreFromBackup");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__MKBAssertion *)MKBDeviceLockAssertion();
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Device lock assertion successfully taken during migration", buf, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      _BYIsInternalInstall();
      *(_DWORD *)buf = 138543362;
      v8 = 0;
      _os_log_error_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_ERROR, "Failed to take device lock assertion during migration - %{public}@", buf, 0xCu);
    }

    CFRelease(0);
  }

  return v3;
}

- (void)releaseAssertions
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  -[BYDeviceMigrationManager migrationQueue](self, "migrationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[BYDeviceMigrationManager processAssertion](self, "processAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Releasing process assertion", buf, 2u);
    }

    -[BYDeviceMigrationManager processAssertion](self, "processAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[BYDeviceMigrationManager setProcessAssertion:](self, "setProcessAssertion:", 0);
  }
  if (-[BYDeviceMigrationManager deviceLockAssertion](self, "deviceLockAssertion"))
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Releasing device lock assertion taken during restore", v8, 2u);
    }

    CFRelease(-[BYDeviceMigrationManager deviceLockAssertion](self, "deviceLockAssertion"));
    -[BYDeviceMigrationManager setDeviceLockAssertion:](self, "setDeviceLockAssertion:", 0);
  }
  if (-[BYDeviceMigrationManager passcodeChangeNotificationToken](self, "passcodeChangeNotificationToken") != -1)
  {
    notify_cancel(-[BYDeviceMigrationManager passcodeChangeNotificationToken](self, "passcodeChangeNotificationToken"));
    -[BYDeviceMigrationManager setPasscodeChangeNotificationToken:](self, "setPasscodeChangeNotificationToken:", 0xFFFFFFFFLL);
  }
  -[BYDeviceMigrationManager setClientVoucher:](self, "setClientVoucher:", 0);
}

- (void)_reacquireDeviceLockAssertion
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[BYDeviceMigrationManager _hasAssertions](self, "_hasAssertions"))
  {
    _BYLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Requiring device lock assertion as passcode changed...", v4, 2u);
    }

    if (-[BYDeviceMigrationManager deviceLockAssertion](self, "deviceLockAssertion"))
      CFRelease(-[BYDeviceMigrationManager deviceLockAssertion](self, "deviceLockAssertion"));
    -[BYDeviceMigrationManager setDeviceLockAssertion:](self, "setDeviceLockAssertion:", -[BYDeviceMigrationManager acquireDeviceLockAssertion](self, "acquireDeviceLockAssertion"));
  }
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setWillMigrate:(BOOL)a3
{
  self->_willMigrate = a3;
}

- (BOOL)isMigrating
{
  return self->_migrating;
}

- (void)setMigrating:(BOOL)a3
{
  self->_migrating = a3;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (RPFileTransferSession)fileTransferSession
{
  return self->_fileTransferSession;
}

- (void)setFileTransferSession:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferSession, a3);
}

- (MBDeviceTransferTask)deviceTransferTask
{
  return self->_deviceTransferTask;
}

- (void)setDeviceTransferTask:(id)a3
{
  objc_storeStrong((id *)&self->_deviceTransferTask, a3);
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_processAssertion, a3);
}

- (__MKBAssertion)deviceLockAssertion
{
  return self->_deviceLockAssertion;
}

- (void)setDeviceLockAssertion:(__MKBAssertion *)a3
{
  self->_deviceLockAssertion = a3;
}

- (int)passcodeChangeNotificationToken
{
  return self->_passcodeChangeNotificationToken;
}

- (void)setPasscodeChangeNotificationToken:(int)a3
{
  self->_passcodeChangeNotificationToken = a3;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (MBDeviceTransferConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInfo, a3);
}

- (MBDeviceTransferProgress)progressInfo
{
  return self->_progressInfo;
}

- (void)setProgressInfo:(id)a3
{
  objc_storeStrong((id *)&self->_progressInfo, a3);
}

- (unint64_t)bytesTransferred
{
  return self->_bytesTransferred;
}

- (void)setBytesTransferred:(unint64_t)a3
{
  self->_bytesTransferred = a3;
}

- (unint64_t)filesTransferred
{
  return self->_filesTransferred;
}

- (void)setFilesTransferred:(unint64_t)a3
{
  self->_filesTransferred = a3;
}

- (double)durationOfTransfer
{
  return self->_durationOfTransfer;
}

- (void)setDurationOfTransfer:(double)a3
{
  self->_durationOfTransfer = a3;
}

- (double)durationOfRestore
{
  return self->_durationOfRestore;
}

- (void)setDurationOfRestore:(double)a3
{
  self->_durationOfRestore = a3;
}

- (int64_t)cancellationCause
{
  return self->_cancellationCause;
}

- (void)setCancellationCause:(int64_t)a3
{
  self->_cancellationCause = a3;
}

- (OS_dispatch_queue)migrationQueue
{
  return self->_migrationQueue;
}

- (void)setMigrationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_migrationQueue, a3);
}

- (OS_voucher)clientVoucher
{
  return self->_clientVoucher;
}

- (void)setClientVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_clientVoucher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVoucher, 0);
  objc_storeStrong((id *)&self->_migrationQueue, 0);
  objc_storeStrong((id *)&self->_progressInfo, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_deviceTransferTask, 0);
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

void __33__BYDeviceMigrationManager_start__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1A4E92000, a2, a3, "Migration completed with error: %@", a5, a6, a7, a8, 2u);
}

void __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke_10_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1A4E92000, a2, a3, "Migration completed with non-cancel error during restart: %@", a5, a6, a7, a8, 2u);
}

- (void)takeAssertions
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4E92000, a2, OS_LOG_TYPE_ERROR, "Failed to register for passcode change notification to refresh device lock assertion: %d", (uint8_t *)v2, 8u);
}

@end
