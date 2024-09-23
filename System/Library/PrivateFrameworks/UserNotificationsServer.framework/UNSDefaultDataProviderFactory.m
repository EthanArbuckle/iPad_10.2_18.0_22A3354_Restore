@implementation UNSDefaultDataProviderFactory

- (id)notificationSettingsForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  v5 = *MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__UNSDefaultDataProviderFactory_notificationSettingsForBundleIdentifier___block_invoke;
  block[3] = &unk_24D63A2C0;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)updateAuthorizationWithOptions:(unint64_t)a3 scheduledDeliveryEnabled:(BOOL)a4 forNotificationSourceDescription:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  BOOL v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v12;
    v26 = 2048;
    v27 = a3;
    _os_log_impl(&dword_216DCB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating authorization options: %ld", buf, 0x16u);
  }
  queue = self->_queue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __140__UNSDefaultDataProviderFactory_updateAuthorizationWithOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke;
  v18[3] = &unk_24D63A560;
  v21 = v11;
  v22 = a3;
  v23 = a4;
  v18[4] = self;
  v19 = v10;
  v20 = v12;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  dispatch_async(queue, v18);

}

void __73__UNSDefaultDataProviderFactory_notificationSettingsForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSettingsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_notificationSettingsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UNSDefaultDataProviderFactory _queue_effectiveSectionInfoForBundleIdentifier:](self, "_queue_effectiveSectionInfoForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uns_notificationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDF8868], "emptySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v4;
    v11 = 1024;
    v12 = v6 != 0;
    _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got notification settings [ hasResult: %d ]", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (id)_queue_effectiveSectionInfoForBundleIdentifier:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDF89B0];
  v6 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting effective section info", (uint8_t *)&v10, 0xCu);
  }
  -[UNSSettingsGateway effectiveSectionInfoForSectionID:](self->_settingsGateway, "effectiveSectionInfoForSectionID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v4;
    v12 = 1024;
    v13 = v7 != 0;
    _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got effective section info [ hasResult: %d ]", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

void __195__UNSDefaultDataProviderFactory__queue_updateSettingsWithAuthorizationStatus_options_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_sectionInfoForBundleIdentifier:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v5, "uns_setPropertiesFromAuthorizationOptions:supportsProvisionalAlerts:", *(_QWORD *)(a1 + 80), objc_msgSend(*(id *)(a1 + 48), "supportsProvisionalAlerts"));
    switch(*(_QWORD *)(a1 + 88))
    {
      case 1:
        v6 = v5;
        v7 = 1;
        goto LABEL_10;
      case 2:
        v6 = v5;
        v7 = 2;
        goto LABEL_10;
      case 3:
        v6 = v5;
        v7 = 3;
LABEL_10:
        objc_msgSend(v6, "setAuthorizationStatus:", v7);
        break;
      case 4:
        objc_msgSend(v5, "setAuthorizationStatus:", 4);
        objc_msgSend(v5, "setAuthorizationExpirationDate:", *(_QWORD *)(a1 + 56));
        objc_msgSend(v5, "setLastUserGrantedAuthorizationDate:", *(_QWORD *)(a1 + 64));
        break;
      default:
        break;
    }
    if (objc_msgSend(v4, "authorizationStatus") == 3 && objc_msgSend(v5, "authorizationStatus") == 2)
    {
      v15 = 0;
    }
    else
    {
      if (objc_msgSend(v4, "authorizationStatus")
        || objc_msgSend(v5, "authorizationStatus") != 3
        || (objc_msgSend(*(id *)(a1 + 48), "supportsProvisionalAlerts") & 1) != 0)
      {
LABEL_20:
        if (*(_BYTE *)(a1 + 96))
          v16 = 2;
        else
          v16 = 1;
        objc_msgSend(v5, "setScheduledDeliverySetting:", v16);
        if (objc_msgSend(v4, "isEqual:", v5))
        {
          v17 = *(_QWORD *)(a1 + 72);
          if (v17)
            (*(void (**)(uint64_t, uint64_t, _QWORD))(v17 + 16))(v17, objc_msgSend(v4, "hasEnabledSettings"), 0);
        }
        else
        {
          v18 = *MEMORY[0x24BDF89B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
          {
            v19 = *(_QWORD *)(a1 + 40);
            v21 = 138543362;
            v22 = v19;
            _os_log_impl(&dword_216DCB000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update Section info", (uint8_t *)&v21, 0xCu);
          }
          objc_msgSend(*(id *)(a1 + 32), "_queue_setSectionInfo:forBundleIdentifier:", v5, *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 32), "_queue_sectionInfoForBundleIdentifier:", *(_QWORD *)(a1 + 40));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), objc_msgSend(v20, "hasEnabledSettings"), 0);

        }
        goto LABEL_30;
      }
      v15 = 1;
    }
    objc_msgSend(v5, "deliverQuietly:changeAuthorizationStatus:", v15, 0);
    goto LABEL_20;
  }
  if (*(_QWORD *)(a1 + 72))
  {
    v8 = *MEMORY[0x24BDF89B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_ERROR))
      __195__UNSDefaultDataProviderFactory__queue_updateSettingsWithAuthorizationStatus_options_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
LABEL_30:

}

- (id)_queue_sectionInfoForBundleIdentifier:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDF89B0];
  v6 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting section info", (uint8_t *)&v10, 0xCu);
  }
  -[UNSSettingsGateway sectionInfoForSectionID:](self->_settingsGateway, "sectionInfoForSectionID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v4;
    v12 = 1024;
    v13 = v7 != 0;
    _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got section info [ hasResult: %d ]", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

void __140__UNSDefaultDataProviderFactory_updateAuthorizationWithOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Authorization granted: %d", (uint8_t *)&v9, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

void __140__UNSDefaultDataProviderFactory_updateAuthorizationWithOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(unsigned __int8 *)(a1 + 72);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __140__UNSDefaultDataProviderFactory_updateAuthorizationWithOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke_2;
  v6[3] = &unk_24D63A4E8;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_queue_updateSettingsWithAuthorizationStatus:options:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:", 0, v2, v3, v5, v6);

}

- (void)_queue_updateSettingsWithAuthorizationStatus:(int64_t)a3 options:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 forNotificationSourceDescription:(id)a6 completionHandler:(id)a7
{
  -[UNSDefaultDataProviderFactory _queue_updateSettingsWithAuthorizationStatus:options:scheduledDeliveryEnabled:expirationDate:lastUserGrantDate:forNotificationSourceDescription:completionHandler:](self, "_queue_updateSettingsWithAuthorizationStatus:options:scheduledDeliveryEnabled:expirationDate:lastUserGrantDate:forNotificationSourceDescription:completionHandler:", a3, a4, a5, 0, 0, a6, a7);
}

- (void)_queue_updateSettingsWithAuthorizationStatus:(int64_t)a3 options:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 expirationDate:(id)a6 lastUserGrantDate:(id)a7 forNotificationSourceDescription:(id)a8 completionHandler:(id)a9
{
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  int64_t v33;
  BOOL v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  _BOOL4 v44;
  uint64_t v45;

  v11 = a5;
  v45 = *MEMORY[0x24BDAC8D0];
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  objc_msgSend(v17, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v36 = v19;
    v37 = 2048;
    v38 = a3;
    v39 = 2048;
    v40 = a4;
    v41 = 2112;
    v42 = v15;
    v43 = 1024;
    v44 = v11;
    _os_log_impl(&dword_216DCB000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update settings [authorizationStatus: %ld authorizationOptions: %ld authorizationExpirationDate: %@ scheduledDelivery: %{BOOL}d]", buf, 0x30u);
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __195__UNSDefaultDataProviderFactory__queue_updateSettingsWithAuthorizationStatus_options_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke;
  v26[3] = &unk_24D63A5B0;
  v26[4] = self;
  v27 = v19;
  v32 = a4;
  v33 = a3;
  v28 = v17;
  v29 = v15;
  v34 = v11;
  v30 = v16;
  v31 = v18;
  v21 = v18;
  v22 = v16;
  v23 = v15;
  v24 = v17;
  v25 = v19;
  -[UNSDefaultDataProviderFactory _queue_createDataProviderWithNotificationSourceDescription:withCompletion:](self, "_queue_createDataProviderWithNotificationSourceDescription:withCompletion:", v24, v26);

}

- (void)_queue_createDataProviderWithNotificationSourceDescription:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  UNSDefaultDataProvider *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  UNSDefaultDataProvider *v13;
  BBDataProviderConnection *dataProviderConnection;
  void *v15;
  _QWORD v16[4];
  id v17;
  UNSDefaultDataProvider *v18;
  void (**v19)(id, id);
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_msgSend(v6, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToDataProvider, "objectForKey:", v8);
  v9 = (UNSDefaultDataProvider *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v7)
      v7[2](v7, v9);
    goto LABEL_17;
  }
  if (!objc_msgSend(v6, "useDefaultDataProvider"))
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_ERROR))
      -[UNSDefaultDataProviderFactory _queue_createDataProviderWithNotificationSourceDescription:withCompletion:].cold.2();
    if (!v7)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "requiresTopics"))
  {
    objc_msgSend(v6, "defaultTopics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

      goto LABEL_14;
    }
    -[UNCNotificationTopicRepository topicsForBundleIdentifier:](self->_topicRepository, "topicsForBundleIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_14;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_ERROR))
      -[UNSDefaultDataProviderFactory _queue_createDataProviderWithNotificationSourceDescription:withCompletion:].cold.1();
    if (!v7)
    {
LABEL_12:
      v9 = 0;
      goto LABEL_17;
    }
LABEL_11:
    v7[2](v7, 0);
    goto LABEL_12;
  }
LABEL_14:
  v12 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_impl(&dword_216DCB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Create default data provider", buf, 0xCu);
  }
  v13 = -[UNSDefaultDataProvider initWithNotificationSourceDescription:applicationLauncher:daemonLauncher:categoryRepository:notificationRepository:topicRepository:attachmentsService:localizationService:summaryService:queue:]([UNSDefaultDataProvider alloc], "initWithNotificationSourceDescription:applicationLauncher:daemonLauncher:categoryRepository:notificationRepository:topicRepository:attachmentsService:localizationService:summaryService:queue:", v6, self->_appLauncher, self->_daemonLauncher, self->_categoryRepository, self->_notificationRepository, self->_topicRepository, self->_attachmentsService, self->_localizationService, self->_summaryService, self->_queue);
  -[NSMutableDictionary setObject:forKey:](self->_bundleIdentifierToDataProvider, "setObject:forKey:", v13, v8);
  objc_initWeak((id *)buf, self->_notificationRepository);
  dataProviderConnection = self->_dataProviderConnection;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __107__UNSDefaultDataProviderFactory__queue_createDataProviderWithNotificationSourceDescription_withCompletion___block_invoke;
  v16[3] = &unk_24D63A600;
  v17 = v8;
  v19 = v7;
  v9 = v13;
  v18 = v9;
  objc_copyWeak(&v20, (id *)buf);
  -[BBDataProviderConnection addDataProvider:withCompletionHandler:](dataProviderConnection, "addDataProvider:withCompletionHandler:", v9, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProvider setProxy:](v9, "setProxy:", v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
LABEL_17:

}

void __60__UNSDefaultDataProviderFactory_observer_updateSectionInfo___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "sectionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:", v2);
  v4 = *MEMORY[0x24BDF89B0];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v2;
      _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Default data provider section info did change", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BEBF420], "sourceDescriptionWithBundleIdentifier:", v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(*(id *)(a1 + 40), "_queue_createDataProviderWithNotificationSourceDescription:withCompletion:", v6, 0);

    }
    objc_msgSend(*(id *)(a1 + 40), "_queue_sectionInfoDidChange:", *(_QWORD *)(a1 + 32));

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEBUG))
  {
    __60__UNSDefaultDataProviderFactory_observer_updateSectionInfo___block_invoke_cold_1();
  }

}

- (void)_queue_sectionInfoDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  os_log_t *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(v4, "uns_notificationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasEnabledSettings");
  v8 = -[NSMutableSet containsObject:](self->_authorizedBundleIdentifiers, "containsObject:", v5);
  v9 = (os_log_t *)MEMORY[0x24BDF89B0];
  if (v7 != v8)
  {
    v10 = *MEMORY[0x24BDF89B0];
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543362;
        v27 = v5;
        _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] User notification settings were enabled", buf, 0xCu);
      }
      -[NSMutableSet addObject:](self->_authorizedBundleIdentifiers, "addObject:", v5);
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543362;
        v27 = v5;
        _os_log_impl(&dword_216DCB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] User notification settings were disabled", buf, 0xCu);
      }
      -[NSMutableSet removeObject:](self->_authorizedBundleIdentifiers, "removeObject:", v5);
    }
  }
  v12 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v5;
    _os_log_impl(&dword_216DCB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notify observers that user notifications settings were updated", buf, 0xCu);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = self->_observers;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "didChangeNotificationSettings:forBundleIdentifier:", v6, v5);
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToDataProvider, "objectForKey:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setEffectiveSectionInfo:", v20);

}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  UNSDefaultDataProviderFactory *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__UNSDefaultDataProviderFactory_observer_updateSectionInfo___block_invoke;
  v8[3] = &unk_24D639C20;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)_queue_setSectionInfo:(id)a3 forBundleIdentifier:(id)a4
{
  -[UNSSettingsGateway setSectionInfo:forSectionID:](self->_settingsGateway, "setSectionInfo:forSectionID:", a3, a4);
}

- (UNSDefaultDataProviderFactory)initWithApplicationLauncher:(id)a3 daemonLauncher:(id)a4 categoryRepository:(id)a5 notificationRepository:(id)a6 attachmentsService:(id)a7 topicRepository:(id)a8 localizationService:(id)a9 summaryService:(id)a10 settingsGateway:(id)a11
{
  UNSDefaultDataProviderFactory *v18;
  UNSDefaultDataProviderFactory *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *bundleIdentifierToDataProvider;
  NSMutableSet *v22;
  NSMutableSet *authorizedBundleIdentifiers;
  NSMutableSet *v24;
  NSMutableSet *supportedBundleIdentifiers;
  NSMutableArray *v26;
  NSMutableArray *observers;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *queue;
  uint64_t v31;
  BBDataProviderConnection *dataProviderConnection;
  uint64_t v33;
  BBObserver *settingsObserver;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v43 = a4;
  v42 = a5;
  v41 = a6;
  v40 = a7;
  v39 = a8;
  v38 = a9;
  v37 = a10;
  v36 = a11;
  v45.receiver = self;
  v45.super_class = (Class)UNSDefaultDataProviderFactory;
  v18 = -[UNSDefaultDataProviderFactory init](&v45, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_appLauncher, a3);
    objc_storeStrong((id *)&v19->_daemonLauncher, a4);
    objc_storeStrong((id *)&v19->_categoryRepository, a5);
    objc_storeStrong((id *)&v19->_notificationRepository, a6);
    objc_storeStrong((id *)&v19->_topicRepository, a8);
    objc_storeStrong((id *)&v19->_localizationService, a9);
    objc_storeStrong((id *)&v19->_summaryService, a10);
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bundleIdentifierToDataProvider = v19->_bundleIdentifierToDataProvider;
    v19->_bundleIdentifierToDataProvider = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    authorizedBundleIdentifiers = v19->_authorizedBundleIdentifiers;
    v19->_authorizedBundleIdentifiers = v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    supportedBundleIdentifiers = v19->_supportedBundleIdentifiers;
    v19->_supportedBundleIdentifiers = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observers = v19->_observers;
    v19->_observers = v26;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create("com.apple.usernotificationsserver.DefaultDataProviderFactory", v28);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v29;

    objc_storeStrong((id *)&v19->_attachmentsService, a7);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FE48]), "initWithServiceName:onQueue:", CFSTR("com.apple.usernotificationsserver.DefaultDataProviderFactory"), v19->_queue);
    dataProviderConnection = v19->_dataProviderConnection;
    v19->_dataProviderConnection = (BBDataProviderConnection *)v31;

    objc_storeStrong((id *)&v19->_settingsGateway, a11);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FE68]), "initWithQueue:", v19->_queue);
    settingsObserver = v19->_settingsObserver;
    v19->_settingsObserver = (BBObserver *)v33;

    -[BBObserver setObserverFeed:](v19->_settingsObserver, "setObserverFeed:", 512);
    -[BBObserver setDelegate:](v19->_settingsObserver, "setDelegate:", v19);
  }

  return v19;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BBDataProviderConnection invalidate](self->_dataProviderConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)UNSDefaultDataProviderFactory;
  -[UNSDefaultDataProviderFactory dealloc](&v4, sel_dealloc);
}

- (id)notificationSettingsForTopicsWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  v5 = *MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings for topics", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__UNSDefaultDataProviderFactory_notificationSettingsForTopicsWithBundleIdentifier___block_invoke;
  block[3] = &unk_24D63A2C0;
  v11 = v4;
  v12 = &v13;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __83__UNSDefaultDataProviderFactory_notificationSettingsForTopicsWithBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSettingsForTopicsWithBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)requestAuthorizationStatus:(int64_t)a3 withOptions:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 forNotificationSourceDescription:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  unint64_t v25;
  BOOL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v8 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  v13 = a7;
  objc_msgSend(v12, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v28 = v14;
    v29 = 2048;
    v30 = a3;
    v31 = 2048;
    v32 = a4;
    v33 = 1024;
    v34 = v8;
    _os_log_impl(&dword_216DCB000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization status: %ld options: %ld scheduledDelivery: %{BOOL}d", buf, 0x26u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __148__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_24D63A510;
  v24 = a3;
  v25 = a4;
  v26 = v8;
  block[4] = self;
  v21 = v12;
  v22 = v14;
  v23 = v13;
  v17 = v13;
  v18 = v14;
  v19 = v12;
  dispatch_async(queue, block);

}

void __148__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(unsigned __int8 *)(a1 + 80);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __148__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke_2;
  v7[3] = &unk_24D63A4E8;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v5, "_queue_updateSettingsWithAuthorizationStatus:options:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:", v2, v3, v4, v6, v7);

}

void __148__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_forNotificationSourceDescription_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Authorization granted: %d", (uint8_t *)&v9, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)requestAuthorizationStatus:(int64_t)a3 withOptions:(unint64_t)a4 scheduledDeliveryEnabled:(BOOL)a5 expirationDate:(id)a6 lastUserGrantDate:(id)a7 forNotificationSourceDescription:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *queue;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  unint64_t v34;
  BOOL v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  objc_msgSend(v17, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BDF89A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89A8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v37 = v19;
    v38 = 2048;
    v39 = a3;
    v40 = 2048;
    v41 = a4;
    v42 = 2112;
    v43 = v15;
    _os_log_impl(&dword_216DCB000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization status: %ld options: %ld expiration: %@", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __181__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_24D63A538;
  v33 = a3;
  v34 = a4;
  v35 = a5;
  block[4] = self;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  v31 = v19;
  v32 = v18;
  v22 = v18;
  v23 = v19;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  dispatch_async(queue, block);

}

void __181__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 88);
  v4 = *(unsigned __int8 *)(a1 + 96);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __181__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke_2;
  v9[3] = &unk_24D63A4E8;
  v10 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  objc_msgSend(v5, "_queue_updateSettingsWithAuthorizationStatus:options:scheduledDeliveryEnabled:expirationDate:lastUserGrantDate:forNotificationSourceDescription:completionHandler:", v2, v3, v4, v6, v7, v8, v9);

}

void __181__UNSDefaultDataProviderFactory_requestAuthorizationStatus_withOptions_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Authorization granted: %d", (uint8_t *)&v9, 0x12u);
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)requestRemoveAuthorizationforNotificationSourceDescription:(id)a3 completionHandler:(id)a4
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
  block[2] = __110__UNSDefaultDataProviderFactory_requestRemoveAuthorizationforNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_24D639998;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __110__UNSDefaultDataProviderFactory_requestRemoveAuthorizationforNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_removeDataProviderWithBundleIdentifier:completionHandler:", v3, *(_QWORD *)(a1 + 48));

}

- (void)setCriticalAlertAuthorization:(BOOL)a3 forNotificationSourceDescription:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __114__UNSDefaultDataProviderFactory_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke;
  v13[3] = &unk_24D63A588;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __114__UNSDefaultDataProviderFactory_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __114__UNSDefaultDataProviderFactory_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke_2;
  v5[3] = &unk_24D63A4E8;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_queue_setCriticalAlertAuthorization:forNotificationSourceDescription:completionHandler:", v2, v6, v5);

}

void __114__UNSDefaultDataProviderFactory_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)*MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 1024;
    v14 = a2;
    _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Authorization granted: %d", (uint8_t *)&v11, 0x12u);

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__UNSDefaultDataProviderFactory_addObserver___block_invoke;
  v7[3] = &unk_24D639C20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __45__UNSDefaultDataProviderFactory_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__UNSDefaultDataProviderFactory_removeObserver___block_invoke;
  v7[3] = &unk_24D639C20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __48__UNSDefaultDataProviderFactory_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addObserver:(id)a3
{
  -[NSMutableArray addObject:](self->_observers, "addObject:", a3);
}

- (void)_queue_removeObserver:(id)a3
{
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", a3);
}

- (id)_queue_notificationSettingsForTopicsWithBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  _BOOL4 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[UNSDefaultDataProviderFactory _queue_sectionInfoForBundleIdentifier:](self, "_queue_sectionInfoForBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "subsections", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "subsectionID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uns_notificationSettings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v14, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v9);
  }

  v15 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v4;
    v23 = 1024;
    v24 = v5 != 0;
    _os_log_impl(&dword_216DCB000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got notification settings for topics [ hasResult: %d ]", buf, 0x12u);
  }

  return v5;
}

- (void)_queue_setCriticalAlertAuthorization:(BOOL)a3 forNotificationSourceDescription:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  UNSDefaultDataProviderFactory *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __121__UNSDefaultDataProviderFactory__queue_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke;
  v12[3] = &unk_24D63A5D8;
  v13 = v8;
  v14 = self;
  v16 = a3;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[UNSDefaultDataProviderFactory _queue_createDataProviderWithNotificationSourceDescription:withCompletion:](self, "_queue_createDataProviderWithNotificationSourceDescription:withCompletion:", v11, v12);

}

void __121__UNSDefaultDataProviderFactory__queue_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_queue_sectionInfoForBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDF89B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(a1 + 56);
      v12 = 138543618;
      v13 = v4;
      v14 = 1024;
      v15 = v7;
      _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set criticalAlert to %d", (uint8_t *)&v12, 0x12u);
    }
    v8 = (void *)objc_msgSend(v5, "copy");
    v9 = v8;
    if (*(_BYTE *)(a1 + 56))
      v10 = 2;
    else
      v10 = 1;
    objc_msgSend(v8, "setCriticalAlertSetting:", v10);
    objc_msgSend(*(id *)(a1 + 40), "_queue_setSectionInfo:forBundleIdentifier:", v9, v4);
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
      (*(void (**)(uint64_t, BOOL, _QWORD))(v11 + 16))(v11, objc_msgSend(v9, "criticalAlertSetting") == 2, 0);

  }
  else if (*(_QWORD *)(a1 + 48))
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_ERROR))
      __121__UNSDefaultDataProviderFactory__queue_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __107__UNSDefaultDataProviderFactory__queue_createDataProviderWithNotificationSourceDescription_withCompletion___block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (NSObject **)MEMORY[0x24BDF89B0];
  v3 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_216DCB000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did create default data provider", (uint8_t *)&v9, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = *v2;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Purging invalid notification records", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(WeakRetained, "removeInvalidNotificationRecordsForBundleIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)_queue_removeDataProviderWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, BOOL, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, BOOL, _QWORD))a4;
  v8 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_216DCB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove data provider", (uint8_t *)&v11, 0xCu);
  }
  -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToDataProvider, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "uninstall");
    -[BBDataProviderConnection removeDataProviderWithSectionID:](self->_dataProviderConnection, "removeDataProviderWithSectionID:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_bundleIdentifierToDataProvider, "removeObjectForKey:", v6);
    -[NSMutableSet removeObject:](self->_authorizedBundleIdentifiers, "removeObject:", v6);
  }
  if (v7)
    v7[2](v7, v10 != 0, 0);

}

- (void)_queue_createNewDefaultDataProviders:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  int v15;
  int v16;
  UNSSettingsGateway *settingsGateway;
  void *v18;
  id obj;
  _QWORD v21[4];
  id v22;
  UNSDefaultDataProviderFactory *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "Getting all section infos possible default data providers", buf, 2u);
  }
  v18 = v3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v3;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v10, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v10, v11);
          if (objc_msgSend(v10, "useDefaultDataProvider")
            && objc_msgSend(v10, "suppressUserAuthorizationPrompt")
            && ((objc_msgSend(v10, "hideSettings") & 1) != 0
             || objc_msgSend(v10, "automaticallyShowSettings")))
          {
            v12 = (void *)*MEMORY[0x24BDF89B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
            {
              v13 = v12;
              v14 = objc_msgSend(v10, "useDefaultDataProvider");
              v15 = objc_msgSend(v10, "suppressUserAuthorizationPrompt");
              v16 = objc_msgSend(v10, "hideSettings");
              *(_DWORD *)buf = 138544130;
              v30 = v11;
              v31 = 1024;
              v32 = v14;
              v33 = 1024;
              v34 = v15;
              v35 = 1024;
              v36 = v16;
              _os_log_impl(&dword_216DCB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Automatically create data provider [ useDefaultDataProvider: %d suppressUserAuthorizationPrompt: %d hideSettings: %d]", buf, 0x1Eu);

            }
            -[UNSDefaultDataProviderFactory _queue_createDataProviderWithNotificationSourceDescription:withCompletion:](self, "_queue_createDataProviderWithNotificationSourceDescription:withCompletion:", v10, 0);
          }
          else
          {
            objc_msgSend(v6, "addObject:", v11);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v6, "count"))
    {
      objc_initWeak((id *)buf, self->_queue);
      settingsGateway = self->_settingsGateway;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __70__UNSDefaultDataProviderFactory__queue_createNewDefaultDataProviders___block_invoke;
      v21[3] = &unk_24D63A628;
      objc_copyWeak(&v24, (id *)buf);
      v22 = v5;
      v23 = self;
      -[UNSSettingsGateway getSectionInfoForSectionIDs:withCompletion:](settingsGateway, "getSectionInfoForSectionIDs:withCompletion:", v6, v21);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __70__UNSDefaultDataProviderFactory__queue_createNewDefaultDataProviders___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__UNSDefaultDataProviderFactory__queue_createNewDefaultDataProviders___block_invoke_2;
    block[3] = &unk_24D639EA8;
    v8 = v3;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(WeakRetained, block);

  }
}

void __70__UNSDefaultDataProviderFactory__queue_createNewDefaultDataProviders___block_invoke_2(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BDF89B0];
  v3 = (void *)*MEMORY[0x24BDF89B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    *(_DWORD *)buf = 134217984;
    v26 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "Got %ld section infos for default data providers with visible settings", buf, 0xCu);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v22;
    *(_QWORD *)&v8 = 138543618;
    v20 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          objc_msgSend(v12, "sectionID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v12, "hasEnabledSettings");
          *(_DWORD *)buf = v20;
          v26 = (uint64_t)v15;
          v27 = 1024;
          v28 = v16;
          _os_log_impl(&dword_216DCB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got section info [ enabled: %d ]", buf, 0x12u);

        }
        v17 = *(void **)(a1 + 40);
        objc_msgSend(v12, "sectionID", v20, (_QWORD)v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "_queue_createDataProviderWithNotificationSourceDescription:withCompletion:", v19, 0);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v9);
  }

}

- (void)_queue_notificationSourcesDidInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[UNSDefaultDataProviderFactory _queue_notificationSourceDidInstall:](self, "_queue_notificationSourceDidInstall:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSDefaultDataProviderFactory _queue_createNewDefaultDataProviders:](self, "_queue_createNewDefaultDataProviders:", v9);

}

uint64_t __70__UNSDefaultDataProviderFactory__queue_notificationSourcesDidInstall___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "useDefaultDataProvider");
}

- (void)_queue_notificationSourceDidInstall:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "useDefaultDataProvider");
  v7 = *MEMORY[0x24BDF89B0];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application installed using default data provider", (uint8_t *)&v9, 0xCu);
    }
    -[NSMutableSet addObject:](self->_supportedBundleIdentifiers, "addObject:", v5);
    -[NSMutableDictionary objectForKey:](self->_bundleIdentifierToDataProvider, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNotificationSourceDescription:", v4);

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B0], OS_LOG_TYPE_DEBUG))
  {
    -[UNSDefaultDataProviderFactory _queue_notificationSourceDidInstall:].cold.1();
  }

}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[UNSDefaultDataProviderFactory _queue_notificationSourceDidUninstall:](self, "_queue_notificationSourceDidUninstall:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_queue_notificationSourceDidUninstall:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "useDefaultDataProvider");

  v7 = *MEMORY[0x24BDF89B0];
  v8 = *MEMORY[0x24BDF89B0];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application uninstalled using default data provider", (uint8_t *)&v9, 0xCu);
    }
    -[NSMutableSet removeObject:](self->_supportedBundleIdentifiers, "removeObject:", v5);
    -[UNSDefaultDataProviderFactory _queue_removeDataProviderWithBundleIdentifier:completionHandler:](self, "_queue_removeDataProviderWithBundleIdentifier:completionHandler:", v5, 0);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[UNSDefaultDataProviderFactory _queue_notificationSourceDidUninstall:].cold.1();
  }

}

- (void)notificationSourcesDidInstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__UNSDefaultDataProviderFactory_notificationSourcesDidInstall___block_invoke;
  block[3] = &unk_24D639C20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __63__UNSDefaultDataProviderFactory_notificationSourcesDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidInstall:", *(_QWORD *)(a1 + 40));
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__UNSDefaultDataProviderFactory_notificationSourcesDidUninstall___block_invoke;
  block[3] = &unk_24D639C20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __65__UNSDefaultDataProviderFactory_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(_QWORD *)(a1 + 40));
}

- (void)observer:(id)a3 removeSection:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__UNSDefaultDataProviderFactory_observer_removeSection___block_invoke;
  v8[3] = &unk_24D639C20;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __56__UNSDefaultDataProviderFactory_observer_removeSection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeDataProviderWithBundleIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), 0);
}

- (NSMutableDictionary)bundleIdentifierToDataProvider
{
  return self->_bundleIdentifierToDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_summaryService, 0);
  objc_storeStrong((id *)&self->_settingsObserver, 0);
  objc_storeStrong((id *)&self->_dataProviderConnection, 0);
  objc_storeStrong((id *)&self->_attachmentsService, 0);
  objc_storeStrong((id *)&self->_topicRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_daemonLauncher, 0);
  objc_storeStrong((id *)&self->_appLauncher, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_supportedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_authorizedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToDataProvider, 0);
}

void __195__UNSDefaultDataProviderFactory__queue_updateSettingsWithAuthorizationStatus_options_scheduledDeliveryEnabled_expirationDate_lastUserGrantDate_forNotificationSourceDescription_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, a2, a3, "[%{public}@] No data provider", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __121__UNSDefaultDataProviderFactory__queue_setCriticalAlertAuthorization_forNotificationSourceDescription_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] No data provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_createDataProviderWithNotificationSourceDescription:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Do not register notification settings for an app requires topics but does not have them defined", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_createDataProviderWithNotificationSourceDescription:withCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, v0, v1, "[%{public}@] Do not register notification settings for an app that is using a custom data provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_notificationSourceDidInstall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_4(&dword_216DCB000, v0, v1, "[%{public}@] Application installed using custom data provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_notificationSourceDidUninstall:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_4(&dword_216DCB000, v0, v1, "[%{public}@] Application uninstalled using custom data provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__UNSDefaultDataProviderFactory_observer_updateSectionInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_4(&dword_216DCB000, v0, v1, "[%{public}@] Section info updated for custom data provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
