@implementation UNSNotificationAuthorizationService

void __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  char v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_4;
  v4[3] = &unk_24D6398F8;
  v6 = *(id *)(a1 + 56);
  v7 = *(_BYTE *)(a1 + 64);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_queue_requestCriticalAlertAuthorizationForNotificationSourceDescription:completionHandler:", v3, v4);

}

- (void)_queue_requestCriticalAlertAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, BOOL, _QWORD);
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  char v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  UNSCriticalAlertAuthorizationAlertController *criticalAlertAuthorizationAlertController;
  void *v20;
  _QWORD v21[4];
  id v22;
  UNSNotificationAuthorizationService *v23;
  id v24;
  void (**v25)(id, BOOL, _QWORD);
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, BOOL, _QWORD))a4;
  objc_msgSend(v6, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x24BDF89F8];
  v10 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting critical alert authorization", buf, 0xCu);
  }
  -[UNSDefaultDataProviderFactory notificationSettingsForBundleIdentifier:](self->_dataProviderFactory, "notificationSettingsForBundleIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "criticalAlertSetting"))
  {
    v12 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    v13 = "[%{public}@] Already registered for critical alerts.";
    goto LABEL_16;
  }
  if ((objc_msgSend(v6, "allowCriticalAlerts") & 1) == 0)
  {
    v12 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    v13 = "[%{public}@] Critical alert authorization is not permitted";
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isNotificationsModificationAllowedForBundleID:", v8);

  if ((v15 & 1) == 0)
  {
    v12 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    v13 = "[%{public}@] Suppress critical alert user authorization prompt for restricted application";
LABEL_16:
    _os_log_impl(&dword_216DCB000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
LABEL_17:
    if (v7)
      v7[2](v7, objc_msgSend(v11, "criticalAlertSetting") == 2, 0);
    goto LABEL_19;
  }
  v16 = objc_msgSend(v6, "suppressUserAuthorizationPrompt");
  v17 = *v9;
  v18 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138543362;
      v27 = v8;
      _os_log_impl(&dword_216DCB000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppress critical alert user authorization prompt for system service", buf, 0xCu);
    }
    -[UNSDefaultDataProviderFactory setCriticalAlertAuthorization:forNotificationSourceDescription:completionHandler:](self->_dataProviderFactory, "setCriticalAlertAuthorization:forNotificationSourceDescription:completionHandler:", 1, v6, v7);
  }
  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 138543362;
      v27 = v8;
      _os_log_impl(&dword_216DCB000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request critical alert user authorization prompt", buf, 0xCu);
    }
    criticalAlertAuthorizationAlertController = self->_criticalAlertAuthorizationAlertController;
    objc_msgSend(v6, "displayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __130__UNSNotificationAuthorizationService__queue_requestCriticalAlertAuthorizationForNotificationSourceDescription_completionHandler___block_invoke;
    v21[3] = &unk_24D639A38;
    v22 = v8;
    v23 = self;
    v24 = v6;
    v25 = v7;
    -[UNSAuthorizationAlertController requestAuthorizationForBundleIdentifier:displayName:usageDescription:withResult:](criticalAlertAuthorizationAlertController, "requestAuthorizationForBundleIdentifier:displayName:usageDescription:withResult:", v22, v20, &stru_24D63B158, v21);

  }
LABEL_19:

}

- (void)_didForegroundApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  __CFString *v5;
  int v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  BOOL v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBF420], "sourceDescriptionWithBundleIdentifier:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString isAppClip](v5, "isAppClip");
  v7 = -[__CFString wantsEphemeralNotifications](v5, "wantsEphemeralNotifications");
  v8 = *MEMORY[0x24BDF89F8];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT);
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (v9)
    {
      v11 = CFSTR("NO");
      if (v6)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      v17 = v4;
      v18 = 2114;
      v19 = v12;
      if (v7)
        v11 = CFSTR("YES");
      v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Foreground app will not request ephemeral notifications isAppClip: %{public}@ wantsEphemeral notifications: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543618;
      v17 = v4;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] App clip wants ephemeral notifications for foregrounded application with source description: %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 28800.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __85__UNSNotificationAuthorizationService__didForegroundApplicationWithBundleIdentifier___block_invoke;
    v14[3] = &unk_24D6399C0;
    v15 = v4;
    -[UNSNotificationAuthorizationService requestAuthorizationWithOptions:expirationDate:forNotificationSourceDescription:completionHandler:](self, "requestAuthorizationWithOptions:expirationDate:forNotificationSourceDescription:completionHandler:", 7, v13, v5, v14);

  }
}

void __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = v2 & 0xFFFFFFFFFFFFFFEFLL;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_2;
  v7[3] = &unk_24D639948;
  v10 = v2;
  v7[4] = v5;
  v8 = v4;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v5, "_queue_requestAuthorizationWithOptions:forNotificationSourceDescription:withExpirationDate:completionHandler:", v3, v8, v6, v7);

}

- (void)_queue_requestAuthorizationWithOptions:(unint64_t)a3 forNotificationSourceDescription:(id)a4 withExpirationDate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  os_log_t *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  UNSDefaultDataProviderFactory *dataProviderFactory;
  _BOOL8 v28;
  UNSDefaultDataProviderFactory *v29;
  uint64_t v30;
  uint64_t v31;
  UNSDefaultDataProviderFactory *v32;
  NSObject *v33;
  UNSDefaultDataProviderFactory *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  char v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  UNSNotificationAuthorizationService *v48;
  id v49;
  id v50;
  unint64_t v51;
  _QWORD v52[4];
  id v53;
  id v54;
  UNSNotificationAuthorizationService *v55;
  id v56;
  id v57;
  id v58;
  unint64_t v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  unint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (os_log_t *)MEMORY[0x24BDF89F8];
  v15 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v61 = v13;
    v62 = 2048;
    v63 = a3;
    _os_log_impl(&dword_216DCB000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization with options %ld", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 8) != 0
    && !-[UNSNotificationAuthorizationService _queue_isCarPlayAvailableForApplication:](self, "_queue_isCarPlayAvailableForApplication:", v16))
  {
    v17 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v13;
      _os_log_impl(&dword_216DCB000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] CarPlay authorization is not permitted", buf, 0xCu);
    }
    a3 &= ~8uLL;
  }
  -[UNSDefaultDataProviderFactory notificationSettingsForBundleIdentifier:](self->_dataProviderFactory, "notificationSettingsForBundleIdentifier:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((a3 & 0x6F) != 0)
  {
    if (v11)
    {
      v20 = *v14;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        _os_log_impl(&dword_216DCB000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppress user authorization prompt for temporary authorization", buf, 0xCu);
      }
      v21 = (void *)MEMORY[0x24BE16E98];
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke;
      v52[3] = &unk_24D6399E8;
      v53 = v13;
      v54 = v19;
      v55 = self;
      v59 = a3;
      v56 = v11;
      v57 = v10;
      v58 = v12;
      objc_msgSend(v21, "getUserNotificationConsentForBundleID:completion:", v53, v52);

      goto LABEL_40;
    }
    if (objc_msgSend(v18, "authorizationStatus") == 2 || objc_msgSend(v19, "authorizationStatus") == 1)
    {
      v23 = *v14;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v61 = v13;
        v62 = 2048;
        v63 = a3;
        _os_log_impl(&dword_216DCB000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Already registered. Update authorization with options %ld", buf, 0x16u);
      }
      -[UNSDefaultDataProviderFactory updateAuthorizationWithOptions:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:](self->_dataProviderFactory, "updateAuthorizationWithOptions:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:", a3, objc_msgSend(v19, "scheduledDeliverySetting") == 2, v10, v12);
      goto LABEL_40;
    }
    if ((a3 & 0x10000) != 0)
    {
      v26 = *v14;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        _os_log_impl(&dword_216DCB000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppress user authorization prompt for disabled request", buf, 0xCu);
      }
      dataProviderFactory = self->_dataProviderFactory;
      v28 = objc_msgSend(v19, "scheduledDeliverySetting") == 2;
      v29 = dataProviderFactory;
      v30 = 1;
      goto LABEL_39;
    }
    if (objc_msgSend(v10, "suppressUserAuthorizationPrompt"))
    {
      v24 = *v14;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        v25 = "[%{public}@] Suppress user authorization prompt for system service";
LABEL_37:
        _os_log_impl(&dword_216DCB000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
        goto LABEL_38;
      }
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v43, "isNotificationsModificationAllowedForBundleID:", v13);

    if ((v40 & 1) == 0)
    {
      v24 = *v14;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        v25 = "[%{public}@] Suppress user authorization prompt for restricted application";
        goto LABEL_37;
      }
LABEL_38:
      v32 = self->_dataProviderFactory;
      v28 = objc_msgSend(v19, "scheduledDeliverySetting") == 2;
      v29 = v32;
      v30 = 2;
LABEL_39:
      -[UNSDefaultDataProviderFactory requestAuthorizationStatus:withOptions:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:](v29, "requestAuthorizationStatus:withOptions:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:", v30, a3, v28, v10, v12);
      goto LABEL_40;
    }
    if ((a3 & 0x40) != 0)
    {
      v33 = *v14;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        _os_log_impl(&dword_216DCB000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppress user authorization prompt for provisional request", buf, 0xCu);
      }
      v34 = self->_dataProviderFactory;
      v28 = objc_msgSend(v19, "scheduledDeliverySetting") == 2;
      v29 = v34;
      v30 = 3;
      goto LABEL_39;
    }
    if (_os_feature_enabled_impl())
    {
      -[UNSNotificationSettingsService notificationSystemSettings](self->_settingsService, "notificationSystemSettings");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v44, "scheduledDeliverySetting");

      v31 = 32;
      if (v41 == 2)
        v31 = 40;
    }
    else
    {
      v31 = 32;
    }
    v39 = *(id *)((char *)&self->super.isa + v31);
    v35 = *v14;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v13;
      _os_log_impl(&dword_216DCB000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request notification user authorization prompt", buf, 0xCu);
    }
    -[UNCLocalizationService bundleWithIdentifier:](self->_localizationService, "bundleWithIdentifier:", v13);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedInfoDictionary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bs_safeObjectForKey:ofType:", CFSTR("NSUserNotificationsUsageDescription"), objc_opt_class());
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      objc_msgSend(v45, "infoDictionary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bs_safeObjectForKey:ofType:", CFSTR("NSUserNotificationsUsageDescription"), objc_opt_class());
      v42 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v10, "displayName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke_62;
    v46[3] = &unk_24D639A10;
    v47 = v13;
    v48 = self;
    v51 = a3;
    v49 = v10;
    v50 = v12;
    objc_msgSend(v39, "requestAuthorizationForBundleIdentifier:displayName:usageDescription:withResult:", v47, v37, v42, v46);

  }
  else
  {
    v22 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v13;
      _os_log_impl(&dword_216DCB000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] No options requiring notification authorization", buf, 0xCu);
    }
    if (v12)
      (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, objc_msgSend(v19, "hasEnabledSettings"), 0);
  }
LABEL_40:

}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 forNotificationSourceDescription:(id)a4 completionHandler:(id)a5
{
  -[UNSNotificationAuthorizationService requestAuthorizationWithOptions:expirationDate:forNotificationSourceDescription:completionHandler:](self, "requestAuthorizationWithOptions:expirationDate:forNotificationSourceDescription:completionHandler:", a3, 0, a4, a5);
}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 expirationDate:(id)a4 forNotificationSourceDescription:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_24D639970;
  v20 = v12;
  v21 = a3;
  block[4] = self;
  v18 = v11;
  v19 = v10;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(queue, block);

}

void __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  char v14;

  v5 = a3;
  if ((*(_BYTE *)(a1 + 56) & 0x10) != 0)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(v7 + 56);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_3;
    block[3] = &unk_24D639920;
    block[4] = v7;
    v11 = v8;
    v13 = *(id *)(a1 + 48);
    v14 = a2;
    v12 = v5;
    dispatch_async(v9, block);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }

}

- (UNSNotificationAuthorizationService)initWithDataProviderFactory:(id)a3 settingsService:(id)a4 localizationService:(id)a5
{
  id v9;
  id v10;
  id v11;
  UNSNotificationAuthorizationService *v12;
  UNSNotificationAuthorizationService *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  UNSCriticalAlertAuthorizationAlertController *v17;
  UNSCriticalAlertAuthorizationAlertController *criticalAlertAuthorizationAlertController;
  UNSNotificationAuthorizationAlertController *v19;
  UNSNotificationAuthorizationAlertController *notificationAuthorizationAlertController;
  UNSNotificationDeliveryAuthorizationAlertController *v21;
  UNSNotificationDeliveryAuthorizationAlertController *notificationDeliveryAuthorizationAlertController;
  CRCarPlayAppPolicyEvaluator *v23;
  CRCarPlayAppPolicyEvaluator *policyEvaluator;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)UNSNotificationAuthorizationService;
  v12 = -[UNSNotificationAuthorizationService init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataProviderFactory, a3);
    objc_storeStrong((id *)&v13->_settingsService, a4);
    objc_storeStrong((id *)&v13->_localizationService, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.usernotificationsserver.AuthorizationService", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    v17 = -[UNSAuthorizationAlertController initWithQueue:]([UNSCriticalAlertAuthorizationAlertController alloc], "initWithQueue:", v13->_queue);
    criticalAlertAuthorizationAlertController = v13->_criticalAlertAuthorizationAlertController;
    v13->_criticalAlertAuthorizationAlertController = v17;

    v19 = -[UNSAuthorizationAlertController initWithQueue:]([UNSNotificationAuthorizationAlertController alloc], "initWithQueue:", v13->_queue);
    notificationAuthorizationAlertController = v13->_notificationAuthorizationAlertController;
    v13->_notificationAuthorizationAlertController = v19;

    v21 = -[UNSAuthorizationAlertController initWithQueue:]([UNSNotificationDeliveryAuthorizationAlertController alloc], "initWithQueue:", v13->_queue);
    notificationDeliveryAuthorizationAlertController = v13->_notificationDeliveryAuthorizationAlertController;
    v13->_notificationDeliveryAuthorizationAlertController = v21;

    v23 = (CRCarPlayAppPolicyEvaluator *)objc_alloc_init(MEMORY[0x24BE15258]);
    policyEvaluator = v13->_policyEvaluator;
    v13->_policyEvaluator = v23;

  }
  return v13;
}

uint64_t __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    if (*(_BYTE *)(a1 + 48))
      a2 = 1;
    else
      a2 = a2;
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, *(_QWORD *)(a1 + 32));
  }
  return result;
}

- (void)requestRemoveAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __116__UNSNotificationAuthorizationService_requestRemoveAuthorizationForNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_24D639998;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __116__UNSNotificationAuthorizationService_requestRemoveAuthorizationForNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestRemoveAuthorizationForNotificationSourceDescription:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)requestCriticalAlertAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __123__UNSNotificationAuthorizationService_requestCriticalAlertAuthorizationForNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_24D639998;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __123__UNSNotificationAuthorizationService_requestCriticalAlertAuthorizationForNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestCriticalAlertAuthorizationForNotificationSourceDescription:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    if (objc_msgSend(v9, "isRunning"))
    {
      objc_msgSend(v9, "endowmentNamespaces");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

      if (v8)
        -[UNSNotificationAuthorizationService _didForegroundApplicationWithBundleIdentifier:](self, "_didForegroundApplicationWithBundleIdentifier:", v6);
    }
  }

}

void __85__UNSNotificationAuthorizationService__didForegroundApplicationWithBundleIdentifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_ERROR))
    __85__UNSNotificationAuthorizationService__didForegroundApplicationWithBundleIdentifier___block_invoke_cold_1();

}

void __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_ERROR))
      __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke_cold_1();
  }
  else if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "authorizationStatus") == 2
      || objc_msgSend(*(id *)(a1 + 40), "authorizationStatus") == 3)
    {
      v9 = (void *)*MEMORY[0x24BDF89F8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(a1 + 40);
        v12 = v9;
        objc_msgSend(v10, "authorizationStatus");
        UNAuthorizationStatusString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v11;
        v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_216DCB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Already authorized with %{public}@. Not requesting ephemeral authorization.", buf, 0x16u);

      }
    }
    else
    {
      v16 = *MEMORY[0x24BDF89F8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v19 = v17;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_216DCB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting temporary authorization with user consent with last grant date %@", buf, 0x16u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "requestAuthorizationStatus:withOptions:scheduledDeliveryEnabled:expirationDate:lastUserGrantDate:forNotificationSourceDescription:completionHandler:", 4, *(_QWORD *)(a1 + 80), objc_msgSend(*(id *)(a1 + 40), "scheduledDeliverySetting") == 2, *(_QWORD *)(a1 + 56), v7, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    }
  }
  else
  {
    v14 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl(&dword_216DCB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization denial due to user response", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "requestAuthorizationStatus:withOptions:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:", 1, *(_QWORD *)(a1 + 80), 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }

}

uint64_t __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke_62(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a2 - 1) <= 1)
  {
    v4 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v17 = 138543362;
      v18 = v5;
      _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Approved by user", (uint8_t *)&v17, 0xCu);
    }
    v6 = a2 == 2;
    v7 = a1[6];
    v8 = *(void **)(a1[5] + 8);
    v10 = a1[7];
    v9 = a1[8];
    v11 = 2;
    return objc_msgSend(v8, "requestAuthorizationStatus:withOptions:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:", v11, v9, v6, v7, v10);
  }
  v12 = *MEMORY[0x24BDF89F8];
  v13 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT);
  if (!a2)
  {
    if (v13)
    {
      v16 = a1[4];
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_216DCB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Denied by user", (uint8_t *)&v17, 0xCu);
    }
    v7 = a1[6];
    v8 = *(void **)(a1[5] + 8);
    v10 = a1[7];
    v9 = a1[8];
    v11 = 1;
    v6 = 0;
    return objc_msgSend(v8, "requestAuthorizationStatus:withOptions:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:", v11, v9, v6, v7, v10);
  }
  if (v13)
  {
    v14 = a1[4];
    v17 = 138543362;
    v18 = v14;
    _os_log_impl(&dword_216DCB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] No response by user", (uint8_t *)&v17, 0xCu);
  }
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __130__UNSNotificationAuthorizationService__queue_requestCriticalAlertAuthorizationForNotificationSourceDescription_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("denied");
    v6 = a1[4];
    if (a2 == 1)
      v5 = CFSTR("approved");
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Critical alert %{public}@ by user", (uint8_t *)&v8, 0x16u);
  }
  return objc_msgSend(*(id *)(a1[5] + 8), "setCriticalAlertAuthorization:forNotificationSourceDescription:completionHandler:", a2 == 1, a1[6], a1[7]);
}

- (BOOL)_queue_isCarPlayAvailableForApplication:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BE15250], "declarationForAppProxy:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCarPlayAppPolicyEvaluator effectivePolicyForAppDeclaration:](self->_policyEvaluator, "effectivePolicyForAppDeclaration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsNotifications");

  return v6;
}

- (void)_queue_requestRemoveAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting remove authorization", (uint8_t *)&v11, 0xCu);

  }
  -[UNSDefaultDataProviderFactory requestRemoveAuthorizationforNotificationSourceDescription:completionHandler:](self->_dataProviderFactory, "requestRemoveAuthorizationforNotificationSourceDescription:completionHandler:", v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyEvaluator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_notificationDeliveryAuthorizationAlertController, 0);
  objc_storeStrong((id *)&self->_notificationAuthorizationAlertController, 0);
  objc_storeStrong((id *)&self->_criticalAlertAuthorizationAlertController, 0);
  objc_storeStrong((id *)&self->_settingsService, 0);
  objc_storeStrong((id *)&self->_dataProviderFactory, 0);
}

void __85__UNSNotificationAuthorizationService__didForegroundApplicationWithBundleIdentifier___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "Request for temporary authorization for bundleId: %{public}@ failed with error: %{public}@");
}

void __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_216DCB000, v0, v1, "[%{public}@] Retrieving user notifications consent for ephemeral notifications failed with error %{public}@");
}

@end
