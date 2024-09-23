@implementation VSMultiAppInstallUtility

+ (void)determineMultiAppEnabledForProvider:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDF8B38];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[VSMultiAppInstallUtility determineMultiAppEnabledForProvider:withAccount:completion:](VSMultiAppInstallUtility, "determineMultiAppEnabledForProvider:withAccount:completion:", v7, v8, v6);

}

+ (void)determineMultiAppEnabledForProvider:(id)a3 withAccount:(id)a4 completion:(id)a5
{
  +[VSMultiAppInstallUtility determineMultiAppEnabledForProvider:withAccount:withBagLoadOperation:completion:](VSMultiAppInstallUtility, "determineMultiAppEnabledForProvider:withAccount:withBagLoadOperation:completion:", a3, a4, 0, a5);
}

+ (void)determineMultiAppEnabledForProvider:(id)a3 withAccount:(id)a4 withBagLoadOperation:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  char v13;
  char v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[4];
  void (**v23)(id, _QWORD);
  BOOL v24;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  v13 = objc_msgSend(v9, "shouldShowChannelApps");
  v14 = objc_msgSend(v9, "shouldShowSubscriptionApps");
  if ((v13 & 1) == 0 && (v14 & 1) == 0)
  {
    VSDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Provider is not configured to show Channel or Subscription apps. MAI disabled.";
LABEL_16:
      _os_log_impl(&dword_2303C5000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  objc_msgSend(v9, "allPersonalizedAppDescriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    VSDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Provider does not actually have any Personalized apps. MAI disabled.";
      goto LABEL_16;
    }
LABEL_17:

    v12[2](v12, 0);
    goto LABEL_18;
  }
  v19 = objc_msgSend(v10, "hasAccount");
  v20 = objc_msgSend(v10, "freeAppPasswordPromptSetting");
  if ((v19 & 1) == 0)
  {
    VSDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "User does not have an active iTunes Account. MAI disabled.";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if ((v20 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    VSDefaultLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v21, OS_LOG_TYPE_DEFAULT, "User has selected Never or Require After 15Min. No need to Check for Skip Bag Key. MAI is enabled.", buf, 2u);
    }

    v12[2](v12, 1);
  }
  else
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __108__VSMultiAppInstallUtility_determineMultiAppEnabledForProvider_withAccount_withBagLoadOperation_completion___block_invoke;
    v22[3] = &unk_24FE1A1A8;
    v24 = (v20 & 0xFFFFFFFFFFFFFFFELL) == 2;
    v23 = v12;
    +[VSMultiAppInstallUtility isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabledWithBagLoadOperation:completion:](VSMultiAppInstallUtility, "isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabledWithBagLoadOperation:completion:", v11, v22);

  }
LABEL_18:

}

void __108__VSMultiAppInstallUtility_determineMultiAppEnabledForProvider_withAccount_withBagLoadOperation_completion___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  VSPerformBlockOnMainThread();

}

uint64_t __108__VSMultiAppInstallUtility_determineMultiAppEnabledForProvider_withAccount_withBagLoadOperation_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t (*v3)(void);
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (*(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41))
  {
    VSDefaultLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2303C5000, v2, OS_LOG_TYPE_DEFAULT, "MAI is enabled.", v6, 2u);
    }

    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Skipping MAI on AlwaysRequirePassword Option is Enabled and User has selected AlwaysRequirePassword. MAI disabled.", buf, 2u);
    }

    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  return v3();
}

+ (void)isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabledWithBagLoadOperation:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDF8B40]);
  objc_msgSend(v7, "setBagKey:", *MEMORY[0x24BDF8D10]);
  objc_initWeak(&location, v7);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __116__VSMultiAppInstallUtility_isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabledWithBagLoadOperation_completion___block_invoke;
  v9[3] = &unk_24FE1A1D0;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "setCompletionBlock:", v9);
  VSEnqueueCompletionOperation();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __116__VSMultiAppInstallUtility_isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabledWithBagLoadOperation_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "isShowMultiAppInstallForCaseAlwaysRequirePasswordEnabled: %d", (uint8_t *)v6, 8u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)getPendingConsentBundleIDsFromSelectedAppDescriptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "bundleID", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  objc_msgSend(a1, "filterBundleIDsByPendingConsent:completionHandler:", v8, v7);
}

+ (id)getDecidedNonChannelAppsForProvider:(id)a3 account:(id)a4 device:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  VSNonChannelAppDecider *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "nonChannelAppDescriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [provider nonChannelAppDescriptions] parameter must not be nil."));
  objc_msgSend(v7, "nonChannelAppDescriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredAppID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(VSNonChannelAppDecider);
  -[VSNonChannelAppDecider setAppDescriptions:](v13, "setAppDescriptions:", v11);
  -[VSNonChannelAppDecider setPreferredAppBundleOrAdamID:](v13, "setPreferredAppBundleOrAdamID:", v12);
  objc_msgSend(v8, "stringForAMSDeviceFamilies");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSNonChannelAppDecider setPreferredDeviceFamily:](v13, "setPreferredDeviceFamily:", v14);
  -[VSNonChannelAppDecider decidedNonChannelApps](v13, "decidedNonChannelApps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (void)filterBundleIDsByPendingConsent:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = (void *)MEMORY[0x24BEBFEC0];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__VSMultiAppInstallUtility_filterBundleIDsByPendingConsent_completionHandler___block_invoke;
  v12[3] = &unk_24FE1A1F8;
  v13 = v5;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  v11 = v5;
  objc_msgSend(v8, "resolveBundleIDs:completionHandler:", v11, v12);

}

void __78__VSMultiAppInstallUtility_filterBundleIDsByPendingConsent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__VSMultiAppInstallUtility_filterBundleIDsByPendingConsent_completionHandler___block_invoke_cold_1(a1, (uint64_t)v6, v7);

  }
  if (v5)
  {
    v8 = v5;
    VSDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_2303C5000, v9, OS_LOG_TYPE_DEFAULT, "Received final bundle IDs: %@", (uint8_t *)&v12, 0xCu);
    }

    v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v10, "removeObjectsInArray:", v8);
    VSDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "Omitted bundle IDs: %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __78__VSMultiAppInstallUtility_filterBundleIDsByPendingConsent_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2303C5000, log, OS_LOG_TYPE_ERROR, "Error filtering out consented candidateBundleIDs %@: %@", (uint8_t *)&v4, 0x16u);
}

@end
