@implementation WLKSettingsCloudUtilities

void __61__WLKSettingsCloudUtilities__cloudSyncEnabledWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  int v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedURLForKey:", kBagKeyGetWatchListSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedURLForKey:", kBagKeyUpdateWatchListSettings);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v6 = v5 == 0;
  else
    v6 = 1;
  v7 = !v6;
  WLKSystemLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v7;
    _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Completed isCloudSyncEnabled fetch with enabled status=%d", (uint8_t *)v9, 8u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__WLKSettingsCloudUtilities_synchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;
  uint8_t v6[16];

  WLKStartupSignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSyncEnabled", ", v6, 2u);
  }

  result = objc_msgSend(*(id *)(a1 + 40), "_shouldContinueWithCloudSyncResult:onDisabledHandler:", a2, *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_runSynchronizeSettingsFromCloudIfNeededWithCompletion:", *(_QWORD *)(a1 + 32));
  return result;
}

+ (BOOL)_shouldContinueWithCloudSyncResult:(BOOL)a3 onDisabledHandler:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  NSObject *v6;
  void *v7;
  uint8_t v9[16];

  if (a4 && !a3)
  {
    v5 = (void (**)(id, _QWORD, void *))a4;
    WLKSystemLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Cloud sync disabled.", v9, 2u);
    }

    WLKError(201, 0, CFSTR("Cloud sync disabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v7);

  }
  return a3;
}

+ (void)_runSynchronizeSettingsFromCloudIfNeededWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke;
  v7[3] = &unk_1E68A8A70;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id buf[2];

  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.ActiveAccount", ", (uint8_t *)buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_activeiTunesAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ams_DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WLKStartupSignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.ActiveAccount", ", (uint8_t *)buf, 2u);
  }

  if (objc_msgSend(v6, "length"))
  {
    WLKStartupSignpostLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.SettingsStoreRefresh", ", (uint8_t *)buf, 2u);
    }

    +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(buf, *(id *)(a1 + 40));
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_47;
    v13[3] = &unk_1E68A8BB0;
    objc_copyWeak(&v16, buf);
    v15 = *(id *)(a1 + 32);
    v10 = v9;
    v14 = v10;
    objc_msgSend(v10, "refreshWithCompletion:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
    goto LABEL_13;
  }
  WLKSystemLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - cannot synchronize from cloud. Not signed in..", (uint8_t *)buf, 2u);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    WLKError(200, 0, CFSTR("Cannot synchronize from cloud. Not signed in..."));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v10);
LABEL_13:

  }
}

+ (void)_cloudSyncEnabledWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WLKSettingsCloudUtilities__cloudSyncEnabledWithCompletion___block_invoke;
  block[3] = &unk_1E68A7DE0;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

+ (id)_queue
{
  if (_queue_onceToken != -1)
    dispatch_once(&_queue_onceToken, &__block_literal_global_83);
  return (id)_queue___queue;
}

+ (void)synchronizeSettingsFromCloudIfNeededWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  v4 = a3;
  WLKStartupSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSyncEnabled", ", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__WLKSettingsCloudUtilities_synchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke;
  v7[3] = &unk_1E68A8A98;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(a1, "_cloudSyncEnabledWithCompletion:", v7);

}

void __35__WLKSettingsCloudUtilities__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.WatchListKit.WLKSettingsCloudUtilities", 0);
  v1 = (void *)_queue___queue;
  _queue___queue = (uint64_t)v0;

}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.SettingsStoreRefresh", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "lastSyncDate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_onceToken == -1)
  {
    if (!v3)
      goto LABEL_6;
  }
  else
  {
    dispatch_once(&WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_onceToken, &__block_literal_global_25);
    if (!v4)
      goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;
  v8 = (double)(unint64_t)WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_maxAge;

  if (v7 <= v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_6:
  WLKStartupSignpostLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync", ", buf, 2u);
  }

  WLKSystemLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Requesting settings sync", buf, 2u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_53;
  v12[3] = &unk_1E68A7DB8;
  v11 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v11, "synchronize:completion:", 1, v12);

LABEL_12:
}

+ (void)updateCloudStoreWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__WLKSettingsCloudUtilities_updateCloudStoreWithCompletion___block_invoke;
  v6[3] = &unk_1E68A8A98;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  objc_msgSend(a1, "_cloudSyncEnabledWithCompletion:", v6);

}

void __60__WLKSettingsCloudUtilities_updateCloudStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  id v4;
  __int128 v5;
  _QWORD block[4];
  __int128 v7;

  if (objc_msgSend(*(id *)(a1 + 40), "_shouldContinueWithCloudSyncResult:onDisabledHandler:", a2, *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "_queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__WLKSettingsCloudUtilities_updateCloudStoreWithCompletion___block_invoke_2;
    block[3] = &unk_1E68A8A70;
    v5 = *(_OWORD *)(a1 + 32);
    v4 = (id)v5;
    v7 = v5;
    dispatch_async(v3, block);

  }
}

void __60__WLKSettingsCloudUtilities_updateCloudStoreWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "_syncDictionaryForLocalStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_postChangeDictionaryToCloud:completion:", v2, *(_QWORD *)(a1 + 32));

}

+ (void)updateCloudStoreAppSettings:(id)a3 deleteHistory:(BOOL)a4 completion:(id)a5
{
  objc_msgSend(a1, "updateCloudStoreAppSettings:deleteHistory:removeEntry:completion:", a3, a4, 0, a5);
}

+ (void)updateCloudStoreAppSettings:(id)a3 deleteHistory:(BOOL)a4 removeEntry:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__WLKSettingsCloudUtilities_updateCloudStoreAppSettings_deleteHistory_removeEntry_completion___block_invoke;
  v14[3] = &unk_1E68A8AC0;
  v16 = v11;
  v17 = a1;
  v15 = v10;
  v18 = a4;
  v19 = a5;
  v12 = v10;
  v13 = v11;
  objc_msgSend(a1, "_cloudSyncEnabledWithCompletion:", v14);

}

uint64_t __94__WLKSettingsCloudUtilities_updateCloudStoreAppSettings_deleteHistory_removeEntry_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 48), "_shouldContinueWithCloudSyncResult:onDisabledHandler:", a2, *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 48), "_runUpdateCloudStoreAppSettings:deleteHistory:removeEntry:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 40));
  return result;
}

+ (void)updateCloudStoreAccountLevelSetting:(id)a3 value:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__WLKSettingsCloudUtilities_updateCloudStoreAccountLevelSetting_value_completion___block_invoke;
  v14[3] = &unk_1E68A8B10;
  v17 = v10;
  v18 = a1;
  v15 = v8;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  objc_msgSend(a1, "_cloudSyncEnabledWithCompletion:", v14);

}

void __82__WLKSettingsCloudUtilities_updateCloudStoreAccountLevelSetting_value_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  id v4;
  __int128 v5;
  _QWORD block[4];
  id v7;
  id v8;
  __int128 v9;

  if (objc_msgSend(*(id *)(a1 + 56), "_shouldContinueWithCloudSyncResult:onDisabledHandler:", a2, *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 56), "_queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__WLKSettingsCloudUtilities_updateCloudStoreAccountLevelSetting_value_completion___block_invoke_2;
    block[3] = &unk_1E68A8AE8;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v5 = *(_OWORD *)(a1 + 48);
    v4 = (id)v5;
    v9 = v5;
    dispatch_async(v3, block);

  }
}

void __82__WLKSettingsCloudUtilities_updateCloudStoreAccountLevelSetting_value_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_postChangeDictionaryToCloud:completion:", v3, *(_QWORD *)(a1 + 48));

}

+ (void)deleteAllHistoryWithCompletion:(id)a3
{
  objc_msgSend(a1, "updateCloudStoreAccountLevelSetting:value:completion:", CFSTR("deleteHistory"), MEMORY[0x1E0C9AAB0], a3);
}

+ (void)forceUpdateWithCompletion:(id)a3
{
  objc_msgSend(a1, "updateCloudStoreAccountLevelSetting:value:completion:", CFSTR("forceUpdate"), MEMORY[0x1E0C9AAB0], a3);
}

+ (void)resetAccountWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__WLKSettingsCloudUtilities_resetAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E68A8A98;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  objc_msgSend(a1, "_cloudSyncEnabledWithCompletion:", v6);

}

uint64_t __56__WLKSettingsCloudUtilities_resetAccountWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "_shouldContinueWithCloudSyncResult:onDisabledHandler:", a2, *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_runResetAccountWithCompletion:", *(_QWORD *)(a1 + 32));
  return result;
}

+ (void)updateLocalStoreWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  v4 = a3;
  WLKStartupSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.CloudSyncEnabled", ", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke;
  v7[3] = &unk_1E68A8A98;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(a1, "_cloudSyncEnabledWithCompletion:", v7);

}

void __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  __int128 v9;
  uint8_t buf[16];

  WLKStartupSignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.CloudSyncEnabled", ", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "_shouldContinueWithCloudSyncResult:onDisabledHandler:", a2, *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "_queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke_37;
    block[3] = &unk_1E68A8A70;
    v7 = *(_OWORD *)(a1 + 32);
    v6 = (id)v7;
    v9 = v7;
    dispatch_async(v5, block);

  }
}

void __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke_37(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke_2;
  v2[3] = &unk_1E68A8B38;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "_fetchSyncDictionary:", v2);

}

uint64_t __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

+ (BOOL)synchronizeSettingsFromCloudIfNeeded:(id *)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  char v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__WLKSettingsCloudUtilities_synchronizeSettingsFromCloudIfNeeded___block_invoke;
  v9[3] = &unk_1E68A7CB8;
  v11 = &v19;
  v12 = &v13;
  v6 = v5;
  v10 = v6;
  objc_msgSend(a1, "synchronizeSettingsFromCloudIfNeededWithCompletion:", v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v7 = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v7;
}

void __66__WLKSettingsCloudUtilities_synchronizeSettingsFromCloudIfNeeded___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)_runUpdateCloudStoreAppSettings:(id)a3 deleteHistory:(BOOL)a4 removeEntry:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;
  BOOL v20;

  v10 = a3;
  v11 = a6;
  objc_msgSend(a1, "_queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__WLKSettingsCloudUtilities__runUpdateCloudStoreAppSettings_deleteHistory_removeEntry_completion___block_invoke;
  v15[3] = &unk_1E68A8B60;
  v17 = v11;
  v18 = a1;
  v19 = a4;
  v20 = a5;
  v16 = v10;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, v15);

}

void __98__WLKSettingsCloudUtilities__runUpdateCloudStoreAppSettings_deleteHistory_removeEntry_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "_syncDictionaryForAppSettings:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (v3)
  {
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("deleteHistory"));
    if (*(_BYTE *)(a1 + 57))
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("removeEntry"));
    v9 = v3;
    v10 = CFSTR("watchListSettingsEntries");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "_postChangeDictionaryToCloud:completion:", v5, *(_QWORD *)(a1 + 40));
LABEL_11:

    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    WLKSystemLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Warning: app dictionary is nil.", v8, 2u);
    }

    v7 = *(_QWORD *)(a1 + 40);
    WLKError(200, 0, CFSTR("app dictionary is nil"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v5);
    goto LABEL_11;
  }
LABEL_12:

}

+ (void)_runResetAccountWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke;
  v7[3] = &unk_1E68A8A70;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("doResetAccount");
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke_2;
  v4[3] = &unk_1E68A8B88;
  v3 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v6, "_postChangeDictionaryToCloud:completion:", v2, v4);

}

void __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "deleteAllHistoryWithCompletion:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    WLKSystemLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke_2_cold_1();

    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
  }

}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_47(id *a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void (**v5)(id, _QWORD, void *);
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_2;
    v7[3] = &unk_1E68A8258;
    v8 = a1[4];
    v9 = a1[5];
    dispatch_async(v4, v7);

  }
  else
  {
    v5 = (void (**)(id, _QWORD, void *))a1[5];
    WLKError(-1, 0, CFSTR("Nil Self"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v6);

  }
}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_50()
{
  NSObject *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WLKStartupSignpostLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.BagMaxLocalAge", ", (uint8_t *)&v12, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cachedIntegerForKey:", kBagKeyUVSearchMaxLocalSettingsAgeSeconds);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_maxAge = objc_msgSend(v2, "unsignedIntegerValue");
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_maxAge;
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - SettingStore maxAge=%lu", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_maxAge = 604800;
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_50_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  WLKStartupSignpostLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.BagMaxLocalAge", ", (uint8_t *)&v12, 2u);
  }

}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_53(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "description");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E68AA228;
  }
  WLKSystemLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (a2)
      v9 = CFSTR("YES");
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - settings sync from cloud success: %@ %@", (uint8_t *)&v11, 0x16u);
  }

  WLKStartupSignpostLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync", ", (uint8_t *)&v11, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_syncDictionaryForLocalStore
{
  void *v3;
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "watchListApps", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_syncDictionaryForAppSettings:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("watchListSettingsEntries"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "optedIn"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isOptedIn"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "migratedtvOS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isTvOSMigrated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "migratediOS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isIOSMigrated"));

  return v3;
}

+ (id)_syncDictionaryForAppSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("searchBrandId"));
  objc_msgSend(v3, "externalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("externalAccountId"));
  if (objc_msgSend(v3, "accessStatus") == 1)
  {
    v7 = MEMORY[0x1E0C9AAB0];
LABEL_9:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("enabled"));
    goto LABEL_11;
  }
  if (objc_msgSend(v3, "accessStatus") == 2)
  {
    v7 = MEMORY[0x1E0C9AAA0];
    goto LABEL_9;
  }

  v4 = 0;
LABEL_11:
  if (objc_msgSend(v3, "obsolete"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("removeEntry"));
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

+ (void)_fetchSyncDictionary:(id)a3
{
  id v3;
  NSObject *v4;
  WLKSettingsRequestOperation *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  WLKSettingsRequestOperation *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  WLKSettingsRequestOperation *v14;
  _QWORD v15[4];
  WLKSettingsRequestOperation *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id buf[2];

  v3 = a3;
  if (WLKShouldRunInProcess())
  {
    WLKSystemLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Fetching settings in WLKProcess", (uint8_t *)buf, 2u);
    }

    v5 = objc_alloc_init(WLKSettingsRequestOperation);
    objc_initWeak(buf, v5);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke;
    v17[3] = &unk_1E68A7A28;
    objc_copyWeak(&v19, buf);
    v18 = v3;
    -[WLKSettingsRequestOperation setCompletionBlock:](v5, "setCompletionBlock:", v17);
    objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultConcurrentQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addOperation:", v5);

    objc_destroyWeak(&v19);
    objc_destroyWeak(buf);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_68;
    v15[3] = &unk_1E68A7E88;
    v9 = (WLKSettingsRequestOperation *)v3;
    v16 = v9;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    WLKStartupSignpostLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.NetworkRequest", ", (uint8_t *)buf, 2u);
    }

    WLKSystemLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B515A000, v12, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - calling out to daemon to fetch settings", (uint8_t *)buf, 2u);
    }

    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_70;
    v13[3] = &unk_1E68A8B38;
    v14 = v9;
    objc_msgSend(v10, "fetchSettings:", v13);

    v5 = v16;
  }

}

void __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id obj;
  id obja;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v1 = a1;
  v49 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WLKSystemLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_cold_1(WeakRetained, v4);

    v5 = *(_QWORD *)(v1 + 32);
    objc_msgSend(WeakRetained, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
  }
  else
  {
    objc_msgSend(WeakRetained, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v35 = v1;
      v36 = WeakRetained;
      +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "beginIgnoringChanges");
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v34 = v6;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("watchListSettingsEntries"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v44 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("enabled"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "BOOLValue");

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("searchBrandId"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              v17 = 1;
            else
              v17 = 2;
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("externalAccountId"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setStatus:forChannelID:externalID:", v17, v16, v18);
            objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(":%@"), v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v19);

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        }
        while (v10);
      }

      objc_msgSend(v7, "watchListApps");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      obja = v21;
      v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v40 != v24)
              objc_enumerationMutation(obja);
            v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
            objc_msgSend(v26, "channelID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "externalID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringByAppendingFormat:", CFSTR(":%@"), v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v8, "containsObject:", v29) & 1) == 0)
              objc_msgSend(v7, "_removeWatchListApp:", v26);

          }
          v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        }
        while (v23);
      }

      v6 = v34;
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("isOptedIn"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setOptedIn:", objc_msgSend(v30, "BOOLValue"));

      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("isTvOSMigrated"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMigratedtvOS:", objc_msgSend(v31, "BOOLValue"));

      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("isIOSMigrated"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMigratediOS:", objc_msgSend(v32, "BOOLValue"));

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLastSyncDate:", v33);

      objc_msgSend(v7, "endIgnoringChanges");
      v1 = v35;
      WeakRetained = v36;
    }
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(v1 + 32) + 16))(*(_QWORD *)(v1 + 32), v6, 0);
  }

}

void __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_68_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WLKStartupSignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.NetworkRequest.Refresh", ", buf, 2u);
  }

  +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_71;
  v12[3] = &unk_1E68A8BD8;
  v9 = *(id *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v13 = v5;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "refreshWithCompletion:", v12);

}

uint64_t __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_71(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t result;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t buf[16];

  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.NetworkRequest.Refresh", ", buf, 2u);
  }

  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - WLKSettingsCloudUtilities - daemon callback for fetch settings", v7, 2u);
  }

  WLKStartupSignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.NetworkRequest", ", v6, 2u);
  }

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

+ (void)_postChangeDictionaryToCloud:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  WLKSettingsModificationRequestOperation *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location[2];

  v5 = a3;
  v6 = a4;
  if (WLKShouldRunInProcess())
  {
    +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("fromPushToken"));
      v10 = objc_msgSend(v9, "copy");

      v5 = (id)v10;
    }
    v11 = -[WLKSettingsModificationRequestOperation initWithModifications:]([WLKSettingsModificationRequestOperation alloc], "initWithModifications:", v5);
    objc_initWeak(location, v11);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke;
    v22[3] = &unk_1E68A7A28;
    objc_copyWeak(&v24, location);
    v23 = v6;
    -[WLKSettingsModificationRequestOperation setCompletionBlock:](v11, "setCompletionBlock:", v22);
    objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addOperation:", v11);

    objc_destroyWeak(&v24);
    objc_destroyWeak(location);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_2;
    v20[3] = &unk_1E68A7E88;
    v15 = v6;
    v21 = v15;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    WLKSystemLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - calling out to daemon to post settings", (uint8_t *)location, 2u);
    }

    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_74;
    v18[3] = &unk_1E68A7DB8;
    v19 = v15;
    objc_msgSend(v16, "postSettings:replyHandler:", v5, v18);

    v8 = v21;
  }

}

void __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  BOOL v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (!v4)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Updated cloud settings success: %@", buf, 0xCu);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      WLKSystemLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Updating lastSyncToCloud date %@", buf, 0xCu);
      }

      +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLastSyncToCloudDate:", v7);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_73;
    block[3] = &unk_1E68A8C00;
    v12 = *(id *)(a1 + 32);
    v13 = v4 == 0;
    v11 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_68_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_74(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];

  v5 = a3;
  WLKSystemLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - daemon callback for post settings", v8, 2u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

+ (id)_connection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)_connection___connection;
  if (!_connection___connection)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    v5 = (void *)_connection___connection;
    _connection___connection = v4;

    v6 = (void *)_connection___connection;
    WLKConnectionClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v7);

    objc_msgSend((id)_connection___connection, "setExportedObject:", a1);
    v8 = (void *)_connection___connection;
    WLKConnectionServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v9);

    objc_msgSend((id)_connection___connection, "setInterruptionHandler:", &__block_literal_global_78);
    objc_msgSend((id)_connection___connection, "setInvalidationHandler:", &__block_literal_global_80);
    objc_msgSend((id)_connection___connection, "resume");
    v3 = (void *)_connection___connection;
  }
  return v3;
}

void __40__WLKSettingsCloudUtilities__connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKSystemLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Connection interrupted.", v1, 2u);
  }

}

void __40__WLKSettingsCloudUtilities__connection__block_invoke_79()
{
  NSObject *v0;

  +[WLKSettingsCloudUtilities _queue](WLKSettingsCloudUtilities, "_queue");
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_82);

}

void __40__WLKSettingsCloudUtilities__connection__block_invoke_2()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  WLKSystemLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Connection invalidated.", v2, 2u);
  }

  v1 = (void *)_connection___connection;
  _connection___connection = 0;

}

void __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B515A000, v0, v1, "WLKSettingsCloudUtilities - resetAccount failed, not attempting play history deletion. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_50_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B515A000, a1, a3, "WLKSettingsCloudUtilities - SettingStore maxAge configuration is nil, use default value=%lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B515A000, a2, OS_LOG_TYPE_ERROR, "WLKSettingsCloudUtilities - Failed to fetch settings with error: %@", v4, 0xCu);

}

void __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_68_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B515A000, v0, v1, "WLKSettingsCloudUtilities - Unable to communicate with the remote object proxy (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
