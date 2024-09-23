@implementation WLKOnboarding

+ (BOOL)isOptedIn
{
  void *v2;
  char v3;

  +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "optedIn");

  return v3;
}

+ (void)optInUserIfNeeded:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__WLKOnboarding_optInUserIfNeeded___block_invoke;
  v5[3] = &unk_1E68A7DB8;
  v6 = v3;
  v4 = v3;
  +[WLKSettingsCloudUtilities synchronizeSettingsFromCloudIfNeededWithCompletion:](WLKSettingsCloudUtilities, "synchronizeSettingsFromCloudIfNeededWithCompletion:", v5);

}

void __35__WLKOnboarding_optInUserIfNeeded___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v5 = a3;
  +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) == 0)
  {
    WLKSystemLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKOnboarding - failed to sync settings from cloud", buf, 2u);
    }
    goto LABEL_8;
  }
  v8 = objc_msgSend(v6, "optedIn");
  WLKSystemLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKOnboarding - Account already opted in.", buf, 2u);
    }
LABEL_8:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_12;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKOnboarding - Opting user in.", buf, 2u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__WLKOnboarding_optInUserIfNeeded___block_invoke_2;
  v11[3] = &unk_1E68A90F0;
  v13 = *(id *)(a1 + 32);
  v12 = v7;
  +[WLKSettingsCloudUtilities updateCloudStoreAccountLevelSetting:value:completion:](WLKSettingsCloudUtilities, "updateCloudStoreAccountLevelSetting:value:completion:", CFSTR("isOptedIn"), MEMORY[0x1E0C9AAB0], v11);

LABEL_12:
}

void __35__WLKOnboarding_optInUserIfNeeded___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WLKSystemLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKOnboarding - Finance update success: %@", (uint8_t *)&v8, 0xCu);
  }

  if ((a2 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setOptedIn:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)optInUserIfNeededAndRefreshConfig:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__WLKOnboarding_optInUserIfNeededAndRefreshConfig___block_invoke;
  v6[3] = &unk_1E68A7DB8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "optInUserIfNeeded:", v6);

}

void __51__WLKOnboarding_optInUserIfNeededAndRefreshConfig___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__WLKOnboarding_optInUserIfNeededAndRefreshConfig___block_invoke_2;
    v8[3] = &unk_1E68A7C90;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v6, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, 3, 0, v8);

  }
  else
  {
    WLKSystemLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKOnboarding - Failed to opt in: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __51__WLKOnboarding_optInUserIfNeededAndRefreshConfig___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WLKSystemLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      v8 = "WLKOnboarding - Successfully refreshed config";
      v9 = v6;
      v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    v11 = 138412290;
    v12 = v5;
    v8 = "WLKOnboarding - Error refreshing config; continuing %@";
    v9 = v6;
    v10 = 12;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1);
}

@end
