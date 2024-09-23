@implementation ICSBackupManager

- (ICSBackupManager)initWithAccount:(id)a3
{
  id v4;
  ICSBackupManager *v5;
  id v6;
  uint64_t v7;
  id v8;
  MBManager *mbManager;
  NSObject *v10;
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICSBackupManager;
  v5 = -[ICSBackupManager init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE66C40]);
    v12 = 0;
    v7 = objc_msgSend(v6, "initWithAccount:delegate:eventQueue:error:", v4, v5, MEMORY[0x24BDAC9B8], &v12);
    v8 = v12;
    mbManager = v5->_mbManager;
    v5->_mbManager = (MBManager *)v7;

    if (v8)
    {
      LogSubsystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ICSBackupManager initWithAccount:].cold.1();

    }
  }

  return v5;
}

- (void)fetchBackupDetailLabelWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke;
  v7[3] = &unk_251C61208;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD block[5];
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "backupState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");

    if ((v5 - 1) > 1)
    {
      objc_msgSend(v3[1], "restoreState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "state");

      if ((v9 - 1) > 1)
      {
        if ((objc_msgSend(v3[1], "isBackupEnabled") & 1) == 0)
        {
          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_4;
          v36[3] = &unk_251C611B8;
          v16 = *(id *)(a1 + 40);
          v36[4] = *(_QWORD *)(a1 + 32);
          v37 = v16;
          dispatch_async(MEMORY[0x24BDAC9B8], v36);
          v7 = v37;
          goto LABEL_22;
        }
        objc_msgSend(v3[1], "backupState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "state") == 6)
        {
          objc_msgSend(v3[1], "backupState");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "error");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v3, "_shouldShowFailedMessageForErrorCode:", objc_msgSend(v13, "code"));

          if (v14)
          {
            v34[0] = MEMORY[0x24BDAC760];
            v34[1] = 3221225472;
            v34[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_5;
            v34[3] = &unk_251C611B8;
            v15 = *(id *)(a1 + 40);
            v34[4] = *(_QWORD *)(a1 + 32);
            v35 = v15;
            dispatch_async(MEMORY[0x24BDAC9B8], v34);
            v7 = v35;
            goto LABEL_22;
          }
        }
        else
        {

        }
        v17 = v3[1];
        v33 = 0;
        objc_msgSend(v17, "dateOfLastBackupWithError:", &v33);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v33;
        if (v7)
        {
          LogSubsystem();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_cold_1();

        }
        LogSubsystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v18;
          _os_log_impl(&dword_24B4C1000, v20, OS_LOG_TYPE_DEFAULT, "Last backup date: %@", buf, 0xCu);
        }

        if (v18)
        {
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2_36;
          v26[3] = &unk_251C611E0;
          v27 = v18;
          v21 = *(id *)(a1 + 40);
          v28 = *(_QWORD *)(a1 + 32);
          v29 = v21;
          dispatch_async(MEMORY[0x24BDAC9B8], v26);

          v22 = v27;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SUBTITLE_ON"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_35;
          v30[3] = &unk_251C611B8;
          v25 = *(id *)(a1 + 40);
          v31 = v24;
          v32 = v25;
          v22 = v24;
          dispatch_async(MEMORY[0x24BDAC9B8], v30);

        }
        goto LABEL_22;
      }
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_3;
      v38[3] = &unk_251C611B8;
      v10 = *(id *)(a1 + 40);
      v38[4] = *(_QWORD *)(a1 + 32);
      v39 = v10;
      dispatch_async(MEMORY[0x24BDAC9B8], v38);
      v7 = v39;
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2;
      block[3] = &unk_251C611B8;
      v6 = *(id *)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      v41 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v7 = v41;
    }
LABEL_22:

  }
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IN_PROGRESS_SUBTITLE"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SUBTITLE_RESTORE_IN_PROGRESS"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SUBTITLE_OFF"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FAILED_SUBTITLE"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

uint64_t __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2_36(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v3 = v2;
  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2_36_cold_1(v4, v3);

  v6 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_localizedHistoricalDurationStringFromDate:toDate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v9);

}

- (void)fetchBackupSubtitleWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke;
  v7[3] = &unk_251C61208;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char v12;
  id v13;
  _QWORD block[5];
  id v15;
  char v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "backupState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "state") == 6)
    {
      objc_msgSend(v3[1], "backupState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "code");

      if (v7 == 303)
      {
        LogSubsystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3[1], "backupState");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "error");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "Last backup was failed due to insufficient quota w/ error: %@", buf, 0xCu);

        }
        if (_silentBackupFailure)
        {
          LogSubsystem();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_24B4C1000, v11, OS_LOG_TYPE_DEFAULT, "_silentBackupFailure is set to YES. Will not show NEXT_BACKUP_TOO_BIG message.", buf, 2u);
          }

        }
        v12 = 1;
        goto LABEL_13;
      }
    }
    else
    {

    }
    v12 = 0;
LABEL_13:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke_38;
    block[3] = &unk_251C60FF8;
    v16 = v12;
    v13 = *(id *)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v15 = v13;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __54__ICSBackupManager_fetchBackupSubtitleWithCompletion___block_invoke_38(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
    v2 = _silentBackupFailure == 0;
  else
    v2 = 0;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NEXT_BACKUP_TOO_BIG"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultSubtitle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }

}

- (void)fetchBackupStatusDotColorWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke;
  block[3] = &unk_251C61230;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  char v4;
  id *v5;
  _QWORD v6[5];
  char v7;
  _QWORD v8[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained[1], "isBackupEnabled") & 1) != 0)
    {
      v4 = objc_msgSend(v3, "_backupDidFail");
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke_3;
      v6[3] = &unk_251C60E18;
      v7 = v4;
      v5 = (id *)v6;
    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke_2;
      v8[3] = &unk_251C60E68;
      v5 = (id *)v8;
    }
    v5[4] = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

void __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __60__ICSBackupManager_fetchBackupStatusDotColorWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)fetchVisibleDomainInfoList:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__ICSBackupManager_fetchVisibleDomainInfoList___block_invoke;
  v7[3] = &unk_251C60E90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __47__ICSBackupManager_fetchVisibleDomainInfoList___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "domainInfoList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
          objc_msgSend(getPSGBackupUtilsClass(), "bundleIdForDomainInfo:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(getPSGBackupUtilsClass(), "shouldIgnoreBundleId:", v10) & 1) == 0)
            objc_msgSend(v2, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (NSString)notificationName
{
  return (NSString *)(id)*MEMORY[0x24BE66C70];
}

+ (NSString)defaultSubtitle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("THIS_DEVICE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v3, &stru_251C6B070, CFSTR("Localizable-iCloud"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)hasBackupError
{
  int v3;

  v3 = -[MBManager isBackupEnabled](self->_mbManager, "isBackupEnabled");
  if (v3)
    LOBYTE(v3) = -[ICSBackupManager _backupDidFail](self, "_backupDidFail");
  return v3;
}

- (BOOL)_backupDidFail
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[MBManager backupState](self->_mbManager, "backupState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "state") == 6)
  {
    -[MBManager backupState](self->_mbManager, "backupState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICSBackupManager _shouldShowFailedMessageForErrorCode:](self, "_shouldShowFailedMessageForErrorCode:", objc_msgSend(v5, "code"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldShowFailedMessageForErrorCode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL result;
  NSObject *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  result = 0;
  if (a3 > 299)
  {
    if ((unint64_t)(a3 - 300) <= 8 && ((1 << (a3 - 44)) & 0x111) != 0)
      return result;
  }
  else if (a3 == 13 || a3 == 202 || a3 == 209)
  {
    return result;
  }
  v8 = v3;
  v9 = v4;
  if (!_silentBackupFailure)
    return 1;
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "_silentBackupFailure is set to YES. Will not show Failed message and red dot.", v7, 2u);
  }

  return 0;
}

+ (BOOL)silentBackupFailure
{
  return _silentBackupFailure;
}

+ (void)setSilentBackupFailure:(BOOL)a3
{
  _silentBackupFailure = a3;
}

+ (id)displayNameFor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getPSGBackupUtilsClass(), "displayNameForDomainInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bundleIDFor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getPSGBackupUtilsClass(), "bundleIdForDomainInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dateOfLastBackup
{
  MBManager *mbManager;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v8;

  mbManager = self->_mbManager;
  v8 = 0;
  -[MBManager dateOfLastBackupWithError:](mbManager, "dateOfLastBackupWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    LogSubsystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICSBackupManager dateOfLastBackup].cold.1();

    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)_localizedHistoricalDurationStringFromDate:(id)a3 toDate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;

  v5 = (void *)MEMORY[0x24BDBCE48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:toDate:options:", 248, v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "month") >= 1)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("X_MONTHS_AGO"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "month");
LABEL_14:
    objc_msgSend(v10, "stringWithFormat:", v12, v13);
    goto LABEL_15;
  }
  if (objc_msgSend(v9, "day") < 1 || objc_msgSend(v9, "day") < 7)
  {
    if (objc_msgSend(v9, "day") < 1)
    {
      if (objc_msgSend(v9, "hour") < 1)
      {
        if (objc_msgSend(v9, "minute") < 1)
        {
          if (objc_msgSend(v9, "second") < 1)
          {
            v15 = &stru_251C6B070;
            goto LABEL_16;
          }
          v10 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("X_SECONDS_AGO"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v9, "second");
        }
        else
        {
          v10 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("X_MINUTES_AGO"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v9, "minute");
        }
      }
      else
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("X_HOURS_AGO"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v9, "hour");
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("X_DAYS_AGO"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "day");
    }
    goto LABEL_14;
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("X_DAYS_AGO"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v12, objc_msgSend(v9, "day") / 7);
LABEL_15:
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mbManager, 0);
}

- (void)initWithAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24B4C1000, v0, v1, "Error initializing MBManager: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24B4C1000, v0, v1, "Failed to fetch last backup date w/ error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57__ICSBackupManager_fetchBackupDetailLabelWithCompletion___block_invoke_2_36_cold_1(NSObject *a1, double a2)
{
  void *v4;
  uint8_t v5[12];
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  v6 = 2048;
  v7 = a2;
  _os_log_debug_impl(&dword_24B4C1000, a1, OS_LOG_TYPE_DEBUG, "NSDate.date: %@, lastBackupInterval: %f", v5, 0x16u);

}

- (void)dateOfLastBackup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24B4C1000, v0, v1, "ICSBackupManager error while fetching date of last backup: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
