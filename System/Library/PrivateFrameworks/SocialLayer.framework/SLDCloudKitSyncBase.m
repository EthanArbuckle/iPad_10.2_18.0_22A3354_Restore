@implementation SLDCloudKitSyncBase

- (SLDCloudKitSyncBase)initWithConfiguration:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  SLDCloudKitSyncPersistence *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  const __CFString *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _QWORD block[4];
  id v42;
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SLDCloudKitSyncBase;
  v6 = -[SLDCloudKitSyncBase init](&v43, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("SLDCloudKitSync", v8);
    v10 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = v9;

    *((_WORD *)v6 + 28) = 0;
    *((_QWORD *)v6 + 6) = 0;
    objc_storeStrong((id *)v6 + 3, a3);
    v11 = [SLDCloudKitSyncPersistence alloc];
    objc_msgSend(v5, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SLDCloudKitSyncPersistence initWithName:](v11, "initWithName:", v12);
    v14 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v13;

    objc_msgSend(v6, "persistence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("version"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_msgSend(v16, "compare:", &unk_1E37A9F90);
      if (v17 == -1)
      {
        SLDaemonLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v45 = v22;
          v46 = 2112;
          v47 = v16;
          v48 = 2112;
          v49 = &unk_1E37A9F90;
          _os_log_impl(&dword_199EFF000, v21, OS_LOG_TYPE_DEFAULT, "#SLDCK %@ previous version = %@, migrating to new version %@", buf, 0x20u);

        }
        if (objc_msgSend(v16, "compare:", &unk_1E37A9FA8) == -1)
        {
          SLDaemonLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v5, "name");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v45 = v24;
            _os_log_impl(&dword_199EFF000, v23, OS_LOG_TYPE_DEFAULT, "#SLDCK %@ updating to production CK environment", buf, 0xCu);

          }
          objc_msgSend(v6, "persistence");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "reset");

        }
        if (objc_msgSend(v16, "compare:", &unk_1E37A9F90) == -1)
        {
          SLDaemonLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v5, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v45 = v27;
            _os_log_impl(&dword_199EFF000, v26, OS_LOG_TYPE_DEFAULT, "#SLDCK %@ will sync fresh highlights for kPPSHVariantTVSync adoption", buf, 0xCu);

          }
          objc_msgSend(v6, "persistence");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("writerDone"));

        }
        objc_msgSend(v6, "persistence");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", &unk_1E37A9F90, CFSTR("version"));

        objc_msgSend(v6, "persistence");
        v30 = objc_claimAutoreleasedReturnValue();
        v18 = v30;
        v31 = (void *)MEMORY[0x1E0C9AAA0];
        v32 = CFSTR("incompatibleVersion");
        goto LABEL_25;
      }
      if (v17 != 1)
      {
        if (v17)
        {
LABEL_27:
          v34 = (void *)objc_opt_new();
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.SocialLayer"), 1);
          v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v35, v34);
          v37 = (void *)*((_QWORD *)v6 + 1);
          *((_QWORD *)v6 + 1) = v36;

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObserver:selector:name:object:", v6, sel_accountChangedNotification_, *MEMORY[0x1E0C94690], 0);

          v39 = *((_QWORD *)v6 + 5);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __45__SLDCloudKitSyncBase_initWithConfiguration___block_invoke;
          block[3] = &unk_1E3794360;
          v42 = v6;
          dispatch_sync(v39, block);

          goto LABEL_28;
        }
        SLDaemonLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[SLDCloudKitSyncBase initWithConfiguration:].cold.1();
LABEL_26:

        goto LABEL_27;
      }
      SLDaemonLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        -[SLDCloudKitSyncBase initWithConfiguration:].cold.2();

      objc_msgSend(v6, "persistence");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject reset](v19, "reset");
    }
    else
    {
      SLDaemonLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v45 = v20;
        v46 = 2112;
        v47 = &unk_1E37A9F90;
        _os_log_impl(&dword_199EFF000, v19, OS_LOG_TYPE_DEFAULT, "#SLDCK %@ no existing persistence, setting version to %@ for new persistence", buf, 0x16u);

      }
    }

    objc_msgSend(v6, "persistence");
    v30 = objc_claimAutoreleasedReturnValue();
    v18 = v30;
    v31 = &unk_1E37A9F90;
    v32 = CFSTR("version");
LABEL_25:
    -[NSObject setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v31, v32);
    goto LABEL_26;
  }
LABEL_28:

  return (SLDCloudKitSyncBase *)v6;
}

uint64_t __45__SLDCloudKitSyncBase_initWithConfiguration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "checkForAccountChanges");
  objc_msgSend(*(id *)(a1 + 32), "createSyncEngine");
  return objc_msgSend(*(id *)(a1 + 32), "initializeState");
}

- (id)configuration
{
  return self->_configuration;
}

- (void)checkForAccountChanges
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  id location;

  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_accountChangesCheckScheduled)
  {
    self->_accountChangesCheckScheduled = 1;
    objc_initWeak(&location, self);
    v4 = dispatch_time(0, 5000000000);
    -[SLDCloudKitSyncBase queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__SLDCloudKitSyncBase_checkForAccountChanges__block_invoke;
    block[3] = &unk_1E37941D0;
    objc_copyWeak(&v7, &location);
    block[4] = self;
    dispatch_after(v4, v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __45__SLDCloudKitSyncBase_checkForAccountChanges__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[56] = 0;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__SLDCloudKitSyncBase_checkForAccountChanges__block_invoke_2;
    v4[3] = &unk_1E3794360;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "checkForAccountChangesNowWithCompletion:", v4);
  }

}

void __45__SLDCloudKitSyncBase_checkForAccountChanges__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v1);

  SLDaemonLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199EFF000, v2, OS_LOG_TYPE_DEFAULT, "#SLDCK Finished checking for account changes.", v3, 2u);
  }

}

- (void)fetchContainerInformationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  CKContainer *v7;
  CKContainer *v8;
  id v9;
  _QWORD v10[4];
  CKContainer *v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "#SLDCK Fetching container information", buf, 2u);
  }

  v7 = self->_container;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke;
  v10[3] = &unk_1E37959F8;
  v11 = v7;
  v12 = v4;
  v8 = v7;
  v9 = v4;
  -[CKContainer accountStatusWithCompletionHandler:](v8, "accountStatusWithCompletionHandler:", v10);

}

void __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "#SLDCK Received accountStatus: %@, error: %@", buf, 0x16u);

  }
  if (v5)
  {
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  if (a2 != 1)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_12:
    v9();
    goto LABEL_13;
  }
  SLDaemonLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_DEFAULT, "#SLDCK Fetching userRecordID", buf, 2u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_153;
  v12[3] = &unk_1E37959D0;
  v11 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = 1;
  objc_msgSend(v11, "fetchUserRecordIDWithCompletionHandler:", v12);

LABEL_13:
}

void __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SLDaemonLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_DEFAULT, "#SLDCK Received userRecordID: %@, error: %@", (uint8_t *)&v10, 0x16u);
  }

  if (v6)
  {
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_153_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

- (void)checkForAccountChangesNowWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  SLDaemonLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "#SLDCK Checking for account changed.", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke;
  v8[3] = &unk_1E3795A48;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SLDCloudKitSyncBase fetchContainerInformationWithCompletion:](self, "fetchContainerInformationWithCompletion:", v8);

}

void __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    SLDaemonLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_156;
    block[3] = &unk_1E3794800;
    v18 = *(id *)(a1 + 40);
    dispatch_async(v10, block);

    v11 = v18;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_2;
    v13[3] = &unk_1E3795A20;
    v13[4] = *(_QWORD *)(a1 + 32);
    v16 = a2;
    v14 = v7;
    v15 = *(id *)(a1 + 40);
    dispatch_async(v12, v13);

    v11 = v14;
  }

}

uint64_t __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_156(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE v20[22];
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("accountAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accountLastKnownUserRecordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SLDaemonLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    *(_DWORD *)v20 = 138413058;
    if (v4)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    *(_QWORD *)&v20[4] = v11;
    *(_WORD *)&v20[12] = 2112;
    if (v5 == 1)
      v10 = CFSTR("YES");
    *(_QWORD *)&v20[14] = v10;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_199EFF000, v9, OS_LOG_TYPE_DEFAULT, "#SLDCK account status: availability %@ -> %@, user record id %@ -> %@", v20, 0x2Au);
  }

  if (!v4 || v5 == 1)
  {
    if ((objc_msgSend(v7, "isEqualToString:", v8, *(_OWORD *)v20) & 1) != 0)
    {
      v13 = 0;
      goto LABEL_19;
    }
    SLDaemonLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v20 = 138412546;
      *(_QWORD *)&v20[4] = v7;
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v8;
      _os_log_impl(&dword_199EFF000, v12, OS_LOG_TYPE_DEFAULT, "#SLDCK user record id changed (last known user record id: %@, new user record id: %@)", v20, 0x16u);
    }
    v13 = v4;
  }
  else
  {
    SLDaemonLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v20 = 138412290;
      *(_QWORD *)&v20[4] = v7;
      _os_log_impl(&dword_199EFF000, v12, OS_LOG_TYPE_DEFAULT, "#SLDCK account no longer available (last known user record id: %@)", v20, 0xCu);
    }
    v13 = 1;
  }

LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("accountLastKnownUserRecordID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 == 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("accountAvailable"));

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "reset", *(_QWORD *)v20);
    objc_msgSend(*(id *)(a1 + 32), "persistence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v8, CFSTR("accountLastKnownUserRecordID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 == 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "persistence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("accountAvailable"));

  }
  else if (((v4 ^ (v5 == 1)) & 1) != 0 || (objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountStatusChanged", *(_QWORD *)v20);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)accountChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[SLDCloudKitSyncBase queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SLDCloudKitSyncBase_accountChangedNotification___block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __50__SLDCloudKitSyncBase_accountChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkForAccountChanges");
}

- (BOOL)recordSupportsOurVersion:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "compare:", &unk_1E37A9F90) != 1;
  }
  else
  {
    SLDaemonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SLDCloudKitSyncBase recordSupportsOurVersion:].cold.1();

    v5 = 0;
  }

  return v5;
}

- (void)createSyncEngine
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CKSyncEngine *v7;
  CKSyncEngine *syncEngine;
  id v9;

  v3 = objc_alloc(MEMORY[0x1E0C95160]);
  -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("syncEngineMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "initWithDatabase:dataSource:metadata:", v4, self, v6);

  objc_msgSend(v9, "setApsMachServiceName:", CFSTR("com.apple.aps.sociallayerd"));
  v7 = (CKSyncEngine *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95158]), "initWithConfiguration:", v9);
  syncEngine = self->_syncEngine;
  self->_syncEngine = v7;

}

- (void)reset
{
  void *v3;

  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  -[SLDCloudKitSyncBase createSyncEngine](self, "createSyncEngine");
  -[SLDCloudKitSyncBase initializeState](self, "initializeState");
}

- (id)persistence
{
  return self->_persistence;
}

- (id)queue
{
  return self->_queue;
}

- (id)syncEngine
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_syncEngine;
}

- (id)container
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_container;
}

- (id)database
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase");
}

- (id)salt
{
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *queue;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("saltData"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v4;
  if (self->_saltLocked)
  {
    if (v4)
      goto LABEL_3;
LABEL_10:
    v5 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32));
    arc4random_buf((void *)objc_msgSend(v5, "mutableBytes"), 0x20uLL);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("saltData"));
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    objc_msgSend(v12, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("saltDataCreated"));

    goto LABEL_3;
  }
  self->_saltLocked = 1;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __27__SLDCloudKitSyncBase_salt__block_invoke;
  v18 = &unk_1E3794220;
  objc_copyWeak(&v19, &location);
  dispatch_async(queue, &v15);
  if (v5)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("saltDataCreated"), v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v10 = (void *)objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");

    objc_msgSend(v10, "timeIntervalSinceNow");
    if (v11 > 0.0 || v11 < -2592000.0)
    {

      v5 = 0;
    }

  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  if (!v5)
    goto LABEL_10;
LABEL_3:

  return v5;
}

void __27__SLDCloudKitSyncBase_salt__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[57] = 0;

}

- (id)idStringForType:(id)a3 uniqueString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = (void *)MEMORY[0x19AEC48EC]();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCloudKitSyncBase idStringForType:uniqueData:](self, "idStringForType:uniqueData:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v10;
}

- (id)idStringForType:(id)a3 uniqueData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  const void *v13;
  size_t v14;
  id v15;
  const void *v16;
  size_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _BYTE macOut[32];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = (void *)MEMORY[0x19AEC48EC]();
  -[SLDCloudKitSyncBase salt](self, "salt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v7;
    v13 = (const void *)objc_msgSend(v11, "bytes");
    v14 = objc_msgSend(v11, "length");
    v15 = objc_retainAutorelease(v12);
    v16 = (const void *)objc_msgSend(v15, "bytes");
    v17 = objc_msgSend(v15, "length");

    CCHmac(2u, v13, v14, v16, v17, macOut);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", macOut, 32);
  }
  else
  {
    v18 = 0;
  }

  objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "length");
  do
  {
    v22 = v21;
    if (!v21)
      break;
    --v21;
  }
  while (objc_msgSend(v20, "characterAtIndex:", v22 - 1) == 61);
  objc_msgSend(v20, "substringToIndex:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = v6;
  v27[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "componentsJoinedByString:", CFSTR("!"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v25;
}

- (double)currentTimestamp
{
  NSObject *v3;
  double result;
  void *v5;
  void *v6;
  double v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  result = self->_timestamp;
  if (result == 0.0)
  {
    v5 = (void *)MEMORY[0x19AEC48EC]();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    self->_timestamp = v7;

    objc_initWeak(&location, self);
    -[SLDCloudKitSyncBase queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__SLDCloudKitSyncBase_currentTimestamp__block_invoke;
    v9[3] = &unk_1E3794220;
    objc_copyWeak(&v10, &location);
    dispatch_async(v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    objc_autoreleasePoolPop(v5);
    return self->_timestamp;
  }
  return result;
}

void __39__SLDCloudKitSyncBase_currentTimestamp__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[6] = 0;

}

- (unint64_t)getIncrementedBatchNumber
{
  NSObject *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;

  -[SLDCloudKitSyncBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLDCloudKitSyncBase persistence](self, "persistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("batchNumber"));

  SLDaemonLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SLDCloudKitSyncBase getIncrementedBatchNumber].cold.1();

  return v6;
}

- (void)addMetadataToRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E37A9F90, CFSTR("version"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E37A9FC0, CFSTR("minVersion"));
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SLDCloudKitSyncBase currentTimestamp](self, "currentTimestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("recordTimestamp"));

}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SLDCloudKitSyncBase *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SLDCloudKitSyncBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SLDCloudKitSyncBase_syncEngine_didUpdateMetadata___block_invoke;
  block[3] = &unk_1E3795A70;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __52__SLDCloudKitSyncBase_syncEngine_didUpdateMetadata___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "persistence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syncEngineMetadata"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "persistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("syncEngineMetadata"));

    SLDaemonLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __52__SLDCloudKitSyncBase_syncEngine_didUpdateMetadata___block_invoke_cold_1();

    if (v6 > 0x80000 && (unint64_t)objc_msgSend(*(id *)(a1 + 48), "length") <= 0x80000)
      objc_msgSend(*(id *)(a1 + 40), "handleMetadataSizeBecomingEligibleForSync");
  }
}

- (void)handleMetadataSizeBecomingEligibleForSync
{
  NSObject *v2;

  -[SLDCloudKitSyncBase queue](self, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v5;
  id result;

  v5 = a3;
  result = a4;
  __break(1u);
  return result;
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __break(1u);
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  __break(1u);
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __break(1u);
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  __break(1u);
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __break(1u);
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  __break(1u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (void)initWithConfiguration:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_24();
  objc_msgSend(v0, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v2, v3, "#SLDCK %@ previous version = %@, no change", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)initWithConfiguration:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  __int16 v3;
  uint8_t v4[22];
  __int16 v5;
  void *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_24();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  v5 = v3;
  v6 = &unk_1E37A9F90;
  _os_log_fault_impl(&dword_199EFF000, v0, OS_LOG_TYPE_FAULT, "#SLDCK %@ previous version = %@, downgrading to version %@", v4, 0x20u);

}

void __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "#SLDCK account status fetch error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __63__SLDCloudKitSyncBase_fetchContainerInformationWithCompletion___block_invoke_153_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "#SLDCK user record id fetch error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __63__SLDCloudKitSyncBase_checkForAccountChangesNowWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "#SLDCK Failed to fetch container information: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)recordSupportsOurVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "#SLDCK record missing minVersion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getIncrementedBatchNumber
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "#SLDCK using batch number %tu", v2);
  OUTLINED_FUNCTION_5();
}

void __52__SLDCloudKitSyncBase_syncEngine_didUpdateMetadata___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_24();
  objc_msgSend((id)OUTLINED_FUNCTION_18(v0), "length");
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v1, v2, "#SLDCK updating sync engine metadata (length: %tu --> %tu)", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_6();
}

@end
