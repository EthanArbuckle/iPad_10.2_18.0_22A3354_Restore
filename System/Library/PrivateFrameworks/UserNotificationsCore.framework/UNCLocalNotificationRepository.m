@implementation UNCLocalNotificationRepository

- (int64_t)_maxObjectsPerKey
{
  return 100;
}

- (UNCLocalNotificationRepository)initWithDirectory:(id)a3 librarian:(id)a4 repositoryProtectionStrategy:(id)a5 categoryRepository:(id)a6 badgeService:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  UNCKeyedDataStoreRepository *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  UNCKeyedObservable *v22;
  UNCLocalNotificationRepository *v23;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[UNCKeyedDataStoreRepository initWithDirectory:fileName:pathExtension:librarian:repositoryProtectionStrategy:objectIdentifierKey:maxObjectsPerKey:]([UNCKeyedDataStoreRepository alloc], "initWithDirectory:fileName:pathExtension:librarian:repositoryProtectionStrategy:objectIdentifierKey:maxObjectsPerKey:", v16, CFSTR("DeliveredNotifications"), CFSTR("plist"), v15, v14, CFSTR("AppNotificationIdentifier"), -[UNCLocalNotificationRepository _maxObjectsPerKey](self, "_maxObjectsPerKey"));

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = dispatch_queue_create("com.apple.NotificationRepository.observable", v18);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = dispatch_queue_create("com.apple.NotificationRepository.call-out", v20);

  v22 = -[UNCKeyedObservable initWithQueue:callOutQueue:]([UNCKeyedObservable alloc], "initWithQueue:callOutQueue:", v19, v21);
  v23 = -[UNCLocalNotificationRepository initWithDataStoreRepository:observable:librarian:categoryRepository:badgeService:](self, "initWithDataStoreRepository:observable:librarian:categoryRepository:badgeService:", v17, v22, v15, v13, v12);

  return v23;
}

- (UNCLocalNotificationRepository)initWithDataStoreRepository:(id)a3 observable:(id)a4 librarian:(id)a5 categoryRepository:(id)a6 badgeService:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  UNCLocalNotificationRepository *v17;
  NSMutableSet *v18;
  NSMutableSet *unlimitedBodyBundleIdentifiers;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  id obj;
  id v29;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v29 = a7;
  v30.receiver = self;
  v30.super_class = (Class)UNCLocalNotificationRepository;
  v17 = -[UNCLocalNotificationRepository init](&v30, sel_init);
  if (v17)
  {
    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    unlimitedBodyBundleIdentifiers = v17->_unlimitedBodyBundleIdentifiers;
    v17->_unlimitedBodyBundleIdentifiers = v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    obj = a6;
    v20 = v16;
    v21 = v15;
    v22 = v14;
    v23 = v13;
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.apple.usernotificationsserver.NotificationRepository", v24);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v25;

    v13 = v23;
    v14 = v22;
    v15 = v21;
    v16 = v20;
    objc_storeStrong((id *)&v17->_repository, a3);
    objc_storeStrong((id *)&v17->_observable, a4);
    objc_storeStrong((id *)&v17->_librarian, a5);
    objc_storeStrong((id *)&v17->_badgeService, a7);
    objc_storeStrong((id *)&v17->_categoryRepository, obj);
  }

  return v17;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
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
  block[2] = __66__UNCLocalNotificationRepository_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __66__UNCLocalNotificationRepository_addObserver_forBundleIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "addObserver:forKey:", a1[5], a1[6]);
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
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
  block[2] = __69__UNCLocalNotificationRepository_removeObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __69__UNCLocalNotificationRepository_removeObserver_forBundleIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "removeObserver:forKey:", a1[5], a1[6]);
}

- (id)notificationRecordsForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__UNCLocalNotificationRepository_notificationRecordsForBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0278;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __73__UNCLocalNotificationRepository_notificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_notificationRecordsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__UNCLocalNotificationRepository_notificationRecordForIdentifier_bundleIdentifier___block_invoke;
  v13[3] = &unk_251AE0B48;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __83__UNCLocalNotificationRepository_notificationRecordForIdentifier_bundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_notificationRecordForIdentifier:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)saveNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 forBundleIdentifier:(id)a5 withCompletionHandler:(id)a6
{
  -[UNCLocalNotificationRepository saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:](self, "saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:", a3, 0, a4, a5, a6);
}

- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  NSObject *queue;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  _QWORD aBlock[5];
  id v38;
  id v39;
  id v40;
  void (**v41)(id, _QWORD, void *);
  BOOL v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, void *))a7;
  if (v12)
  {
    if (v14)
    {
      objc_msgSend(v12, "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v25 = (void *)*MEMORY[0x24BDF89B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
        {
          -[UNCLocalNotificationRepository saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:].cold.3((uint64_t)v14, v25, v12);
          if (!v15)
            goto LABEL_19;
        }
        else if (!v15)
        {
          goto LABEL_19;
        }
        v26 = (void *)MEMORY[0x24BDD1540];
        v27 = 1400;
LABEL_18:
        objc_msgSend(v26, "un_errorWithUNErrorCode:userInfo:", v27, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v15[2](v15, 0, v32);

        goto LABEL_19;
      }
      if ((objc_msgSend(v12, "willNotifyUser") & 1) != 0 || (objc_msgSend(v12, "hasBadge") & 1) != 0)
      {
        v17 = MEMORY[0x24BDAC760];
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke;
        aBlock[3] = &unk_251AE0B70;
        aBlock[4] = self;
        v18 = v12;
        v38 = v18;
        v39 = v13;
        v42 = a5;
        v19 = v14;
        v40 = v19;
        v41 = v15;
        v20 = _Block_copy(aBlock);
        queue = self->_queue;
        v33[0] = v17;
        v33[1] = 3221225472;
        v33[2] = __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_2;
        v33[3] = &unk_251AE0BE8;
        v33[4] = self;
        v34 = v19;
        v35 = v18;
        v36 = v20;
        v22 = v20;
        dispatch_async(queue, v33);

        goto LABEL_19;
      }
      v28 = (void *)*MEMORY[0x24BDF89B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        objc_msgSend(v12, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "un_logDigest");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v14;
        v45 = 2114;
        v46 = v31;
        _os_log_impl(&dword_2499A5000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not delivering user visible notification %{public}@ because it has no alert, sound or badge", buf, 0x16u);

      }
      if (v15)
      {
        v26 = (void *)MEMORY[0x24BDD1540];
        v27 = 1401;
        goto LABEL_18;
      }
    }
    else
    {
      v24 = (void *)*MEMORY[0x24BDF89B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
        -[UNCLocalNotificationRepository saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:].cold.2(v24, v12);
    }
  }
  else
  {
    v23 = *MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
      -[UNCLocalNotificationRepository saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:].cold.1(v23);
  }
LABEL_19:

}

void __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_queue_saveNotificationRecord:targetRevisionNumber:shouldRepost:withOptions:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), a2, *(_QWORD *)(a1 + 56));
  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
  {
    v7 = (uint64_t)v8;
    if (v8)
      v5 = 1;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNPrivateErrorCode:userInfo:", 2000, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 64);
    }
    v8 = (id)v7;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }

}

void __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_msgSend(WeakRetained, "isApplicationForeground:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_3;
    v13[3] = &unk_251AE0BC0;
    v5 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v4, "willPresentNotification:forBundleIdentifier:withCompletionHandler:", v6, v5, v13);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 48), "hasSound")
      && (objc_msgSend(*(id *)(a1 + 48), "hasAlertContent") & 1) == 0)
    {
      v7 = (void *)*MEMORY[0x24BDF89B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        v8 = *(void **)(a1 + 48);
        v10 = v7;
        objc_msgSend(v8, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "un_logDigest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v9;
        v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_2499A5000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppressing sound on user visible notification %{public}@ because it has no alert and the app is in the background", buf, 0x16u);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_4;
  block[3] = &unk_251AE0B98;
  v11 = v6;
  v12 = a2;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 withMessage:(id)a5 forBundleIdentifier:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  objc_msgSend(a5, "timestamp");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCLocalNotificationRepository saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:](self, "saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:", v11, v7, v12, v10);

}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  UNSNotificationCategoryRepository *categoryRepository;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  categoryRepository = self->_categoryRepository;
  v13 = a5;
  objc_msgSend(v10, "content");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "categoryIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSNotificationCategoryRepository categoryWithIdentifier:bundleIdentifier:](categoryRepository, "categoryWithIdentifier:bundleIdentifier:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDF8818];
  objc_msgSend(v16, "intentIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "notificationWithRequest:date:sourceIdentifier:intentIdentifiers:", v10, v13, v11, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(uint64_t, void *))UNNotificationToNotificationRecord + 2))((uint64_t)UNNotificationToNotificationRecord, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __111__UNCLocalNotificationRepository_saveNotificationRequest_shouldRepost_apsMessageTimestamp_forBundleIdentifier___block_invoke;
  v23[3] = &unk_251AE0550;
  v24 = v11;
  v25 = v10;
  v21 = v10;
  v22 = v11;
  -[UNCLocalNotificationRepository saveNotificationRecord:shouldRepost:forBundleIdentifier:withCompletionHandler:](self, "saveNotificationRecord:shouldRepost:forBundleIdentifier:withCompletionHandler:", v20, v8, v22, v23);

}

void __111__UNCLocalNotificationRepository_saveNotificationRequest_shouldRepost_apsMessageTimestamp_forBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BDF89E8];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v9 = v5;
      objc_msgSend(v7, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v8;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v4;
      v12 = "[%{public}@] NOT delivering user visible push notification %{public}@ [ error=%{public}@ ]";
      v13 = v9;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2499A5000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);

    }
  }
  else if (v6)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v9 = v5;
    objc_msgSend(v15, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "un_logDigest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v16;
    v19 = 2114;
    v20 = v11;
    v12 = "[%{public}@] Delivered user visible push notification %{public}@";
    v13 = v9;
    v14 = 22;
    goto LABEL_6;
  }

}

- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3
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
  v7[2] = __82__UNCLocalNotificationRepository_removeAllNotificationRecordsForBundleIdentifier___block_invoke;
  v7[3] = &unk_251AE01A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __82__UNCLocalNotificationRepository_removeAllNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllNotificationRecordsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllNotificationRecordsForBundleIdentifierSync:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__UNCLocalNotificationRepository_removeAllNotificationRecordsForBundleIdentifierSync___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __86__UNCLocalNotificationRepository_removeAllNotificationRecordsForBundleIdentifierSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllNotificationRecordsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
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
  v7[2] = __86__UNCLocalNotificationRepository_removeInvalidNotificationRecordsForBundleIdentifier___block_invoke;
  v7[3] = &unk_251AE01A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __86__UNCLocalNotificationRepository_removeInvalidNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeInvalidNotificationRecordsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)removeNotificationRecordsPassingTest:(id)a3 forBundleIdentifier:(id)a4
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
  block[2] = __91__UNCLocalNotificationRepository_removeNotificationRecordsPassingTest_forBundleIdentifier___block_invoke;
  block[3] = &unk_251AE0C10;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __91__UNCLocalNotificationRepository_removeNotificationRecordsPassingTest_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeNotificationRecordsPassingTest:forBundleIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
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
  block[2] = __91__UNCLocalNotificationRepository_removeNotificationRecordsForIdentifiers_bundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __91__UNCLocalNotificationRepository_removeNotificationRecordsForIdentifiers_bundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeNotificationRecordsForIdentifiers:bundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeSimilarNotificationRecords:(id)a3 bundleIdentifier:(id)a4
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
  block[2] = __84__UNCLocalNotificationRepository_removeSimilarNotificationRecords_bundleIdentifier___block_invoke;
  block[3] = &unk_251AE0250;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __84__UNCLocalNotificationRepository_removeSimilarNotificationRecords_bundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeSimilarNotificationRecords:bundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
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
  v7[2] = __97__UNCLocalNotificationRepository_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier___block_invoke;
  v7[3] = &unk_251AE01A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __97__UNCLocalNotificationRepository_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)removeStoreForBundleIdentifier:(id)a3
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
  block[2] = __65__UNCLocalNotificationRepository_removeStoreForBundleIdentifier___block_invoke;
  block[3] = &unk_251AE01A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __65__UNCLocalNotificationRepository_removeStoreForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeStoreForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeNotificationRepository
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__UNCLocalNotificationRepository_removeNotificationRepository__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__UNCLocalNotificationRepository_removeNotificationRepository__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeDataStoreRepository");
}

- (id)allBundleIdentifiers
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__UNCLocalNotificationRepository_allBundleIdentifiers__block_invoke;
  v5[3] = &unk_251AE0178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__UNCLocalNotificationRepository_allBundleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)performMigration
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__UNCLocalNotificationRepository_performMigration__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __50__UNCLocalNotificationRepository_performMigration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performMigration");
}

- (void)performValidation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__UNCLocalNotificationRepository_performValidation__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __51__UNCLocalNotificationRepository_performValidation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performValidation");
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __78__UNCLocalNotificationRepository_contentProtectionStateChangedForFirstUnlock___block_invoke;
  v4[3] = &unk_251AE0C38;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

uint64_t __78__UNCLocalNotificationRepository_contentProtectionStateChangedForFirstUnlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_queue_performMigrationForUserNotificationsStore");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "protectionStateChanged");
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_queue_triggerInvalidationForFirstUnlock");
  return result;
}

- (void)notificationSourcesDidInstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  UNCLocalNotificationRepository *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__UNCLocalNotificationRepository_notificationSourcesDidInstall___block_invoke;
  block[3] = &unk_251AE01A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __64__UNCLocalNotificationRepository_notificationSourcesDidInstall___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "allowUnlimitedContentBody", (_QWORD)v11);
        v9 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
        objc_msgSend(v7, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v9, "addObject:", v10);
        else
          objc_msgSend(v9, "removeObject:", v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  UNCLocalNotificationRepository *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__UNCLocalNotificationRepository_notificationSourcesDidUninstall___block_invoke;
  block[3] = &unk_251AE01A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __66__UNCLocalNotificationRepository_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "bundleIdentifier", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)_notificationsForObjects:(id)a3
{
  return (id)objc_msgSend(a3, "bs_map:", UNSDictionaryToNotificationRecord);
}

- (id)_queue_notificationRecordsForBundleIdentifier:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[UNCKeyedDataStoreRepository objectsForKey:](self->_repository, "objectsForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNCLocalNotificationRepository _notificationsForObjects:](self, "_notificationsForObjects:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (void *)v7;
  else
    v8 = (void *)MEMORY[0x24BDBD1A8];

  return v8;
}

- (id)_queue_notificationRecordForIdentifier:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  UNCKeyedDataStoreRepository *repository;
  id v10;
  void *v11;
  void (**v12)(uint64_t, void *);
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  queue = self->_queue;
  v8 = a4;
  dispatch_assert_queue_V2(queue);
  repository = self->_repository;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __93__UNCLocalNotificationRepository__queue_notificationRecordForIdentifier_forBundleIdentifier___block_invoke;
  v16[3] = &unk_251AE0C60;
  v10 = v6;
  v17 = v10;
  -[UNCKeyedDataStoreRepository objectsPassingTest:forKey:](repository, "objectsPassingTest:forKey:", v16, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    v12 = (void (**)(uint64_t, void *))UNSDictionaryToNotificationRecord;
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2]((uint64_t)v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __93__UNCLocalNotificationRepository__queue_notificationRecordForIdentifier_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", CFSTR("AppNotificationIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (void)_queue_notifyObserversNotificationsDidAddNotifications:(id)a3 replaceNotifications:(id)a4 replacementNotifications:(id)a5 removedNotifications:(id)a6 shouldRepost:(BOOL)a7 shouldSync:(BOOL)a8 forBundleIdentifier:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  UNCKeyedObservable *observable;
  id v35;
  id v36;
  id v37;
  id v38;
  UNCLocalNotificationRepository *v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v9 = a8;
  v10 = a7;
  v54 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v40 = a5;
  v37 = a6;
  v38 = a9;
  v39 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v49 != v21)
          objc_enumerationMutation(v18);
        +[UNSNotificationRecordAddUpdate updateWithNotificationRecord:shouldSync:](UNSNotificationRecordAddUpdate, "updateWithNotificationRecord:shouldSync:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v16, "count"))
  {
    v24 = 0;
    do
    {
      objc_msgSend(v16, "objectAtIndex:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndex:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[UNSNotificationRecordReplaceUpdate updateWithNotificationRecord:replacedNotificationRecord:shouldRepost:](UNSNotificationRecordReplaceUpdate, "updateWithNotificationRecord:replacedNotificationRecord:shouldRepost:", v26, v25, v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v27);

      ++v24;
    }
    while (v24 < objc_msgSend(v16, "count"));
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v28 = v37;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v28);
        +[UNSNotificationRecordRemoveUpdate updateWithNotificationRecord:shouldSync:](UNSNotificationRecordRemoveUpdate, "updateWithNotificationRecord:shouldSync:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j), v9);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v30);
  }

  observable = v39->_observable;
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __200__UNCLocalNotificationRepository__queue_notifyObserversNotificationsDidAddNotifications_replaceNotifications_replacementNotifications_removedNotifications_shouldRepost_shouldSync_forBundleIdentifier___block_invoke;
  v41[3] = &unk_251AE02F0;
  v41[4] = v39;
  v42 = v17;
  v43 = v38;
  v35 = v38;
  v36 = v17;
  -[UNCKeyedObservable notifyObserversKey:usingBlock:](observable, "notifyObserversKey:usingBlock:", v35, v41);

}

uint64_t __200__UNCLocalNotificationRepository__queue_notifyObserversNotificationsDidAddNotifications_replaceNotifications_replacementNotifications_removedNotifications_shouldRepost_shouldSync_forBundleIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "notificationRepository:didPerformUpdates:forBundleIdentifier:", a1[4], a1[5], a1[6]);
}

- (BOOL)_queue_saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 withOptions:(unint64_t)a6 forBundleIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  os_log_t *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id WeakRetained;
  void *v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  int v30;
  os_log_t v31;
  void *v32;
  void *v33;
  UNCLocalNotificationRepository *v34;
  NSObject *v35;
  void *v36;
  int v37;
  int v38;
  os_log_t *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  os_log_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  os_log_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  UNCKeyedDataStoreRepository *repository;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  NSObject *log;
  os_log_t loga;
  _BOOL4 v72;
  id v73;
  id v74;
  void *v75;
  uint8_t buf[4];
  id v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  _BYTE v81[10];
  _WORD v82[15];

  v72 = a5;
  *(_QWORD *)&v82[11] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v11, "setShouldBadgeApplicationIcon:", a6 & 1);
  objc_msgSend(v11, "setShouldPlaySound:", (a6 >> 1) & 1);
  objc_msgSend(v11, "setShouldPresentAlert:", (a6 & 0x1C) != 0);
  objc_msgSend(v11, "setPresentationOptions:", a6);
  -[UNCLocalNotificationRepository _logNotification:forBundleIdentifier:](self, "_logNotification:forBundleIdentifier:", v11, v13);
  objc_msgSend(v11, "badge");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "shouldBadgeApplicationIcon");
  v16 = v15;
  v75 = (void *)v14;
  if (v14)
    v17 = v15;
  else
    v17 = 0;
  v18 = (os_log_t *)MEMORY[0x24BDF89B8];
  v19 = (void *)*MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    objc_msgSend(v11, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "un_logDigest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v77 = v13;
    v78 = 2114;
    v79 = v22;
    v80 = 1024;
    *(_DWORD *)v81 = v17;
    *(_WORD *)&v81[4] = 1024;
    *(_DWORD *)&v81[6] = v16;
    v82[0] = 2114;
    *(_QWORD *)&v82[1] = v75;
    _os_log_impl(&dword_2499A5000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Badge can be set for notification %{public}@: %d [ canBadge: %d badgeNumber: %{public}@ ]", buf, 0x2Cu);

  }
  if (v17)
  {
    objc_msgSend(v11, "badge");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationRepository _setBadgeNumber:forBundleIdentifier:withCompletionHandler:](self, "_setBadgeNumber:forBundleIdentifier:withCompletionHandler:", v23, v13, 0);

  }
  if (objc_msgSend(v11, "hasAlertContent"))
    v24 = objc_msgSend(v11, "shouldPresentAlert");
  else
    v24 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsProvider);
  objc_msgSend(WeakRetained, "notificationSettingsForBundleIdentifier:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_loadWeakRetained((id *)&self->_settingsProvider);
  objc_msgSend(v27, "notificationSettingsForTopicsWithBundleIdentifier:", v13);
  v28 = objc_claimAutoreleasedReturnValue();

  v29 = -[UNCLocalNotificationRepository _shouldPersistNotificationRecord:forBundleSettings:perTopicSettings:](self, "_shouldPersistNotificationRecord:forBundleSettings:perTopicSettings:", v11, v26, v28);
  v30 = v24 & v29;
  v31 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
  {
    log = v31;
    objc_msgSend(v11, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "un_logDigest");
    v73 = v12;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = self;
    v35 = v28;
    v36 = v26;
    v37 = objc_msgSend(v11, "hasAlertContent");
    v38 = objc_msgSend(v11, "shouldPresentAlert");
    *(_DWORD *)buf = 138544642;
    v77 = v13;
    v78 = 2114;
    v79 = v33;
    v80 = 1024;
    *(_DWORD *)v81 = v30;
    *(_WORD *)&v81[4] = 1024;
    *(_DWORD *)&v81[6] = v37;
    v26 = v36;
    v28 = v35;
    self = v34;
    v82[0] = 1024;
    *(_DWORD *)&v82[1] = v38;
    v82[3] = 1024;
    *(_DWORD *)&v82[4] = v29;
    _os_log_impl(&dword_2499A5000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving notification %{public}@: %{BOOL}d [ hasAlertContent: %{BOOL}d, shouldPresentAlert: %{BOOL}d settingsShouldSave: %{BOOL}d]", buf, 0x2Eu);

    v18 = (os_log_t *)MEMORY[0x24BDF89B8];
    v12 = v73;

  }
  if (v30)
  {
    v39 = v18;
    objc_msgSend(v11, "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationRepository _queue_notificationRecordForIdentifier:forBundleIdentifier:](self, "_queue_notificationRecordForIdentifier:forBundleIdentifier:", v40, v13);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      if (!v12 || (v42 = objc_msgSend(v41, "revisionNumber"), v42 == objc_msgSend(v12, "integerValue")))
      {
        v74 = v12;
        v43 = objc_msgSend(v41, "revisionNumber") + 1;
LABEL_31:
        objc_msgSend(v11, "setRevisionNumber:", v43);
        objc_msgSend(v11, "dictionaryRepresentationWithTruncation:", -[NSMutableSet containsObject:](self->_unlimitedBodyBundleIdentifiers, "containsObject:", v13) ^ 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        repository = self->_repository;
        if (v72)
          -[UNCKeyedDataStoreRepository addObject:forKey:](repository, "addObject:forKey:", v56, v13);
        else
          -[UNCKeyedDataStoreRepository replaceObject:forKey:](repository, "replaceObject:forKey:", v56, v13);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v58, "hasChanges"))
        {
          objc_msgSend(v58, "addedObjects");
          v69 = v56;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationRepository _notificationsForObjects:](self, "_notificationsForObjects:", v59);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v58, "replacedObjects");
          loga = v28;
          v60 = v26;
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationRepository _notificationsForObjects:](self, "_notificationsForObjects:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v58, "replacementObjects");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationRepository _notificationsForObjects:](self, "_notificationsForObjects:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v58, "removedObjects");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationRepository _notificationsForObjects:](self, "_notificationsForObjects:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = v60;
          v28 = loga;
          -[UNCLocalNotificationRepository _queue_notifyObserversNotificationsDidAddNotifications:replaceNotifications:replacementNotifications:removedNotifications:shouldRepost:shouldSync:forBundleIdentifier:](self, "_queue_notifyObserversNotificationsDidAddNotifications:replaceNotifications:replacementNotifications:removedNotifications:shouldRepost:shouldSync:forBundleIdentifier:", v68, v62, v64, v66, v72, 1, v13);

          v56 = v69;
        }

        v44 = 1;
        v12 = v74;
        goto LABEL_37;
      }
      v53 = *v39;
      if (!os_log_type_enabled(*v39, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v46 = v53;
      objc_msgSend(v11, "identifier");
      v47 = v26;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "un_logDigest");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v41, "revisionNumber");
      v55 = objc_msgSend(v12, "integerValue");
      *(_DWORD *)buf = 138544130;
      v77 = v13;
      v78 = 2114;
      v79 = v49;
      v80 = 2050;
      *(_QWORD *)v81 = v54;
      *(_WORD *)&v81[8] = 2050;
      *(_QWORD *)v82 = v55;
      v50 = "[%{public}@] Could not save notification %{public}@: Revision number (%{public}ld) is different from the exp"
            "ected value (%{public}ld)";
      v51 = v46;
      v52 = 42;
    }
    else
    {
      if (!v12)
      {
        v74 = 0;
        v43 = 0;
        goto LABEL_31;
      }
      v45 = *v39;
      if (!os_log_type_enabled(*v39, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v46 = v45;
      objc_msgSend(v11, "identifier");
      v47 = v26;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "un_logDigest");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v77 = v13;
      v78 = 2114;
      v79 = v49;
      v50 = "[%{public}@] Could not save notification %{public}@: Already removed!";
      v51 = v46;
      v52 = 22;
    }
    _os_log_impl(&dword_2499A5000, v51, OS_LOG_TYPE_DEFAULT, v50, buf, v52);

    v26 = v47;
LABEL_29:
    v44 = 0;
    goto LABEL_37;
  }
  if ((objc_msgSend(v11, "hasAlertContent") & 1) != 0
    || objc_msgSend(v11, "hasSound") && objc_msgSend(v11, "shouldPlaySound"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v11);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationRepository _queue_notifyObserversNotificationsDidAddNotifications:replaceNotifications:replacementNotifications:removedNotifications:shouldRepost:shouldSync:forBundleIdentifier:](self, "_queue_notifyObserversNotificationsDidAddNotifications:replaceNotifications:replacementNotifications:removedNotifications:shouldRepost:shouldSync:forBundleIdentifier:", v41, 0, 0, 0, 0, 0, v13);
    v44 = 1;
LABEL_37:

    goto LABEL_38;
  }
  v44 = 1;
LABEL_38:

  return v44;
}

- (void)_queue_removeAllNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = *MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove all delivered notifications", (uint8_t *)&v6, 0xCu);
  }
  -[UNCLocalNotificationRepository _queue_removeNotificationRecordsPassingTest:forBundleIdentifier:](self, "_queue_removeNotificationRecordsPassingTest:forBundleIdentifier:", &__block_literal_global_12, v4);

}

uint64_t __89__UNCLocalNotificationRepository__queue_removeAllNotificationRecordsForBundleIdentifier___block_invoke()
{
  return 1;
}

- (void)_queue_removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = *MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove all delivered notifications that are no longer valid", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsProvider);
  objc_msgSend(WeakRetained, "notificationSettingsForBundleIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained((id *)&self->_settingsProvider);
  objc_msgSend(v8, "notificationSettingsForTopicsWithBundleIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __93__UNCLocalNotificationRepository__queue_removeInvalidNotificationRecordsForBundleIdentifier___block_invoke;
  v13[3] = &unk_251AE0CA8;
  v13[4] = self;
  v14 = v7;
  v15 = v9;
  v16 = v4;
  v10 = v4;
  v11 = v9;
  v12 = v7;
  -[UNCLocalNotificationRepository _queue_removeNotificationRecordsPassingTest:forBundleIdentifier:](self, "_queue_removeNotificationRecordsPassingTest:forBundleIdentifier:", v13, v10);

}

uint64_t __93__UNCLocalNotificationRepository__queue_removeInvalidNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_shouldPersistNotificationRecord:forBundleSettings:perTopicSettings:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((v4 & 1) == 0)
  {
    v5 = (void *)*MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 56);
      v7 = v5;
      objc_msgSend(v3, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "un_logDigest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing notification %{public}@ because applicable settings no longer require its persistence", (uint8_t *)&v11, 0x16u);

    }
  }

  return v4 ^ 1u;
}

- (void)_queue_removeNotificationRecordsPassingTest:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  UNCKeyedDataStoreRepository *repository;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  queue = self->_queue;
  v8 = a4;
  dispatch_assert_queue_V2(queue);
  repository = self->_repository;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __98__UNCLocalNotificationRepository__queue_removeNotificationRecordsPassingTest_forBundleIdentifier___block_invoke;
  v12[3] = &unk_251AE0CD0;
  v13 = v6;
  v10 = v6;
  -[UNCKeyedDataStoreRepository removeObjectsPassingTest:forKey:](repository, "removeObjectsPassingTest:forKey:", v12, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCLocalNotificationRepository _queue_notifyObserversWithReceipt:bundleIdentifier:](self, "_queue_notifyObserversWithReceipt:bundleIdentifier:", v11, v8);

}

uint64_t __98__UNCLocalNotificationRepository__queue_removeNotificationRecordsPassingTest_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  (*((void (**)(uint64_t, void *))UNSDictionaryToNotificationRecord + 2))((uint64_t)UNSDictionaryToNotificationRecord, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v4;
}

- (void)_queue_removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  UNCKeyedDataStoreRepository *repository;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  queue = self->_queue;
  v8 = a4;
  dispatch_assert_queue_V2(queue);
  repository = self->_repository;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __98__UNCLocalNotificationRepository__queue_removeNotificationRecordsForIdentifiers_bundleIdentifier___block_invoke;
  v12[3] = &unk_251AE0C60;
  v13 = v6;
  v10 = v6;
  -[UNCKeyedDataStoreRepository removeObjectsPassingTest:forKey:](repository, "removeObjectsPassingTest:forKey:", v12, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCLocalNotificationRepository _queue_notifyObserversWithReceipt:bundleIdentifier:](self, "_queue_notifyObserversWithReceipt:bundleIdentifier:", v11, v8);

}

uint64_t __98__UNCLocalNotificationRepository__queue_removeNotificationRecordsForIdentifiers_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  (*((void (**)(uint64_t, void *))UNSDictionaryToNotificationRecord + 2))((uint64_t)UNSDictionaryToNotificationRecord, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (void)_queue_removeSimilarNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  UNCKeyedDataStoreRepository *repository;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  queue = self->_queue;
  v8 = a4;
  dispatch_assert_queue_V2(queue);
  repository = self->_repository;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__UNCLocalNotificationRepository__queue_removeSimilarNotificationRecords_bundleIdentifier___block_invoke;
  v12[3] = &unk_251AE0C60;
  v13 = v6;
  v10 = v6;
  -[UNCKeyedDataStoreRepository removeObjectsPassingTest:forKey:](repository, "removeObjectsPassingTest:forKey:", v12, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCLocalNotificationRepository _queue_notifyObserversWithReceipt:bundleIdentifier:](self, "_queue_notifyObserversWithReceipt:bundleIdentifier:", v11, v8);

}

uint64_t __91__UNCLocalNotificationRepository__queue_removeSimilarNotificationRecords_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  (*((void (**)(uint64_t, void *))UNSDictionaryToNotificationRecord + 2))((uint64_t)UNSDictionaryToNotificationRecord, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isSimilar:", v3, (_QWORD)v9) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_queue_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
{
  NSObject *queue;
  id v5;
  id v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[UNCKeyedDataStoreRepository removeObjectsPassingTest:forKey:](self->_repository, "removeObjectsPassingTest:forKey:", &__block_literal_global_20, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCLocalNotificationRepository _queue_notifyObserversWithReceipt:bundleIdentifier:](self, "_queue_notifyObserversWithReceipt:bundleIdentifier:", v6, v5);

}

uint64_t __104__UNCLocalNotificationRepository__queue_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  (*((void (**)(uint64_t, void *))UNSDictionaryToNotificationRecord + 2))((uint64_t)UNSDictionaryToNotificationRecord, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("Push")) ^ 1;
  else
    v5 = 0;

  return v5;
}

- (void)_queue_notifyObserversWithReceipt:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v15, "hasChanges"))
  {
    objc_msgSend(v15, "addedObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationRepository _notificationsForObjects:](self, "_notificationsForObjects:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "replacedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationRepository _notificationsForObjects:](self, "_notificationsForObjects:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "replacementObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationRepository _notificationsForObjects:](self, "_notificationsForObjects:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "removedObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCLocalNotificationRepository _notificationsForObjects:](self, "_notificationsForObjects:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UNCLocalNotificationRepository _queue_notifyObserversNotificationsDidAddNotifications:replaceNotifications:replacementNotifications:removedNotifications:shouldRepost:shouldSync:forBundleIdentifier:](self, "_queue_notifyObserversNotificationsDidAddNotifications:replaceNotifications:replacementNotifications:removedNotifications:shouldRepost:shouldSync:forBundleIdentifier:", v8, v10, v12, v14, 1, 1, v6);
  }

}

- (id)_badgeNumberForBundleIdentifier:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_not_V2(queue);
  -[UNCBadgeService badgeNumberForBundleIdentifier:](self->_badgeService, "badgeNumberForBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v11, "isEqual:", &unk_251B127A0))
  {

    v10 = 0;
  }
  else
  {
    v10 = v11;
  }
  v12 = v10;
  -[UNCLocalNotificationRepository _setBadgeValue:forBundleIdentifier:withCompletionHandler:](self, "_setBadgeValue:forBundleIdentifier:withCompletionHandler:", v10, v8, v9);

}

- (void)_setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "numberWithInteger:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCLocalNotificationRepository _setBadgeValue:forBundleIdentifier:withCompletionHandler:](self, "_setBadgeValue:forBundleIdentifier:withCompletionHandler:", v11, v10, v9);

}

- (void)_setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v11, "isEqual:", &stru_251AE68F0))
  {

    v10 = 0;
  }
  else
  {
    v10 = v11;
  }
  v12 = v10;
  -[UNCLocalNotificationRepository _setBadgeValue:forBundleIdentifier:withCompletionHandler:](self, "_setBadgeValue:forBundleIdentifier:withCompletionHandler:", v10, v8, v9);

}

- (void)_setBadgeValue:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __91__UNCLocalNotificationRepository__setBadgeValue_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_251AE0BE8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __91__UNCLocalNotificationRepository__setBadgeValue_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_global_queue_setBadgeValue:forBundleIdentifier:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_global_queue_setBadgeValue:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  _QWORD block[5];
  id v12;
  id v13;

  v8 = a4;
  v9 = a5;
  if (-[UNCBadgeService setBadgeValue:forBundleIdentifier:](self->_badgeService, "setBadgeValue:forBundleIdentifier:", a3, v8))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__UNCLocalNotificationRepository__global_queue_setBadgeValue_forBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_251AE0698;
    block[4] = self;
    v12 = v8;
    v13 = v9;
    dispatch_async(queue, block);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

uint64_t __104__UNCLocalNotificationRepository__global_queue_setBadgeValue_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllNotificationRecordsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_logNotification:(id)a3 forBundleIdentifier:(id)a4
{
  __CFString *v5;
  unsigned int v6;
  id v7;

  v7 = a3;
  v5 = (__CFString *)a4;
  if (objc_msgSend(v7, "shouldBadgeApplicationIcon"))
    v6 = objc_msgSend(v7, "hasBadge");
  else
    v6 = 0;
  if (objc_msgSend(v7, "shouldPlaySound") && objc_msgSend(v7, "hasSound"))
    v6 |= 2u;
  if (objc_msgSend(v7, "shouldPresentAlert") && objc_msgSend(v7, "hasAlertContent"))
    v6 |= 4u;
  UNCPowerLogUserNotificationRequestEvent(v5, v6);

}

- (void)_queue_performMigration
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNCLocalNotificationRepository _queue_performMigrationForUserNotificationsStore](self, "_queue_performMigrationForUserNotificationsStore");
  -[UNCLocalNotificationRepository _queue_performMigrationForPushStore](self, "_queue_performMigrationForPushStore");
}

- (void)_queue_performMigrationForUserNotificationsStore
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x24BCFE9BC]();
  -[UNCKeyedDataStoreRepository allKeys](self->_repository, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x24BCFE9BC](v6);
        -[UNCLocalNotificationRepository _queue_performMigrationForBundleIdentifier:](self, "_queue_performMigrationForBundleIdentifier:", v10, (_QWORD)v12);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v6;
    }
    while (v6);
  }

}

- (void)_queue_triggerInvalidationForFirstUnlock
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x24BCFE9BC]();
  -[UNCKeyedDataStoreRepository allKeys](self->_repository, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[UNCKeyedObservable notifyObserversKey:usingBlock:](self->_observable, "notifyObserversKey:usingBlock:", v9, 3221225472, __74__UNCLocalNotificationRepository__queue_triggerInvalidationForFirstUnlock__block_invoke, &unk_251AE0318, self, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

void __74__UNCLocalNotificationRepository__queue_triggerInvalidationForFirstUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "notificationRepository:didDiscoverContentOnFirstUnlockForBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_queue_performMigrationForPushStore
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[5];

  v25[3] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = objc_claimAutoreleasedReturnValue();

  v19 = (void *)v4;
  v25[0] = v4;
  v25[1] = CFSTR("SpringBoard");
  v25[2] = CFSTR("PushStore");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "pathExtension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("pushstore"));

        if (v15)
        {
          v16 = (void *)MEMORY[0x24BCFE9BC]();
          objc_msgSend(v5, "stringByAppendingPathComponent:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCLocalNotificationRepository _queue_performMigrationForPushStoreAtPath:](self, "_queue_performMigrationForPushStoreAtPath:", v17);

          objc_autoreleasePoolPop(v16);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

}

- (void)_queue_performMigrationForPushStoreAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v7 = *MEMORY[0x24BDF89D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_2499A5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating notification repository", (uint8_t *)&v8, 0xCu);
    }
    -[UNCKeyedDataStoreRepository migrateStoreAtPath:forKey:](self->_repository, "migrateStoreAtPath:forKey:", v4, v6);
  }
  -[UNCLocalNotificationRepository _queue_performMigrationForBundleIdentifier:](self, "_queue_performMigrationForBundleIdentifier:", v6);

}

- (void)_queue_performMigrationForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNCKeyedDataStoreRepository objectsForKey:](self->_repository, "objectsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "unc_map:usingLibrarian:", UNSNotificationRecordDictionaryMigration, self->_librarian);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToArray:", v7) & 1) == 0)
    {
      v8 = (void *)*MEMORY[0x24BDF89D0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D0], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v10 = 138543618;
        v11 = v4;
        v12 = 2048;
        v13 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating notification repository (%ld)", (uint8_t *)&v10, 0x16u);

      }
      -[UNCKeyedDataStoreRepository setObjects:forKey:](self->_repository, "setObjects:forKey:", v7, v4);
    }

  }
}

- (void)_queue_performValidation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x24BCFE9BC]();
  -[UNCKeyedDataStoreRepository allKeys](self->_repository, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 138543362;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[UNCKeyedDataStoreRepository objectsForKey:](self->_repository, "objectsForKey:", v11, v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "bs_filter:", UNSNotificationRecordDictionaryValidation);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqualToArray:", v14) & 1) == 0)
          {
            v15 = (void *)*MEMORY[0x24BDF89D0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D0], OS_LOG_TYPE_DEFAULT))
            {
              v16 = v15;
              v17 = objc_msgSend(v14, "count");
              *(_DWORD *)buf = 138543618;
              v25 = v11;
              v26 = 2048;
              v27 = v17;
              _os_log_impl(&dword_2499A5000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Filtering notification repository (%ld)", buf, 0x16u);

            }
            -[UNCKeyedDataStoreRepository setObjects:forKey:](self->_repository, "setObjects:forKey:", v14, v11);
          }

        }
        else
        {
          v18 = *MEMORY[0x24BDF89D0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v25 = v11;
            _os_log_error_impl(&dword_2499A5000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Error reading notification repository. Deleting file.", buf, 0xCu);
          }
          -[UNCKeyedDataStoreRepository removeStoreForKey:](self->_repository, "removeStoreForKey:", v11);
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }

}

- (BOOL)_shouldPersistNotificationRecord:(id)a3 forBundleSettings:(id)a4 perTopicSettings:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "authorizationStatus"))
  {
    if (objc_msgSend(v8, "authorizationStatus") == 2 || objc_msgSend(v8, "authorizationStatus") == 3)
    {
      objc_msgSend(v7, "topicIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v11;
      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(v7, "topicIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF8868], "emptySettings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectsForKeys:notFoundMarker:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else if (v8)
      {
        v53[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      v41 = v9;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v24 = v15;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v25)
      {
        v26 = v25;
        LOBYTE(v20) = 0;
        v27 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v43 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            v30 = objc_msgSend(v29, "authorizationStatus") == 2 || objc_msgSend(v8, "authorizationStatus") == 3;
            v31 = objc_msgSend(v29, "notificationCenterSetting");
            v32 = objc_msgSend(v29, "lockScreenSetting");
            LODWORD(v20) = (v20 & 1) != 0 || (v31 == 2 || v32 == 2) && v30;
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        }
        while (v26);
      }
      else
      {
        LODWORD(v20) = 0;
      }

      v34 = (void *)*MEMORY[0x24BDF89B8];
      v9 = v41;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
      {
        v35 = v34;
        objc_msgSend(v7, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "un_logDigest");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v24, "count");
        *(_DWORD *)buf = 138543874;
        v47 = v37;
        v48 = 1024;
        v49 = v20;
        v50 = 2048;
        v51 = v38;
        _os_log_impl(&dword_2499A5000, v35, OS_LOG_TYPE_DEFAULT, "[Persisting notification %{public}@: %d [applicableSettings: %lu]", buf, 0x1Cu);

      }
    }
    else
    {
      v21 = (void *)*MEMORY[0x24BDF89B8];
      LOBYTE(v20) = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        objc_msgSend(v7, "identifier");
        v20 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v20, "un_logDigest");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v23;
        _os_log_impl(&dword_2499A5000, v22, OS_LOG_TYPE_DEFAULT, "[Not persisting notification %{public}@ because bundle is not authorized", buf, 0xCu);

        LOBYTE(v20) = 0;
      }
    }
  }
  else
  {
    v16 = (void *)*MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      objc_msgSend(v7, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "un_logDigest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v19;
      _os_log_impl(&dword_2499A5000, v17, OS_LOG_TYPE_DEFAULT, "[Provisionally allowing persisting notification %{public}@ because bundle settings are not available", buf, 0xCu);

    }
    LOBYTE(v20) = 1;
  }

  return v20;
}

- (UNCNotificationRepositoryDelegate)delegate
{
  return (UNCNotificationRepositoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UNCNotificationRepositorySettingsProvider)settingsProvider
{
  return (UNCNotificationRepositorySettingsProvider *)objc_loadWeakRetained((id *)&self->_settingsProvider);
}

- (void)setSettingsProvider:(id)a3
{
  objc_storeWeak((id *)&self->_settingsProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_badgeService, 0);
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_unlimitedBodyBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

- (void)saveNotificationRecord:(os_log_t)log targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2499A5000, log, OS_LOG_TYPE_ERROR, "Not delivering user visible notification because notification is nil", v1, 2u);
}

- (void)saveNotificationRecord:(void *)a1 targetRevisionNumber:(void *)a2 shouldRepost:forBundleIdentifier:withCompletionHandler:.cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v5;
  _os_log_error_impl(&dword_2499A5000, v3, OS_LOG_TYPE_ERROR, "Not delivering user visible notification %{public}@ because bundleID is nil", (uint8_t *)&v6, 0xCu);

  OUTLINED_FUNCTION_1();
}

- (void)saveNotificationRecord:(void *)a3 targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:.cold.3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "un_logDigest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_2499A5000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Not delivering user visible notification %{public}@ because date is nil", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_1();
}

@end
