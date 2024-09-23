@implementation PHALocalNotificationInterface

- (PHALocalNotificationInterface)init
{
  PHALocalNotificationInterface *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHALocalNotificationInterface;
  result = -[PHALocalNotificationInterface init](&v3, sel_init);
  if (result)
    result->_isNotificationRegistered = 0;
  return result;
}

- (void)fireLocalNotificationWithOptions:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((PLIsFeaturedContentAllowed() & 1) != 0 || objc_msgSend(v5, "type"))
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__PHALocalNotificationInterface_fireLocalNotificationWithOptions_completionHandler___block_invoke_23;
    v12[3] = &unk_1E851F978;
    v13 = v5;
    v14 = v6;
    dispatch_async(v7, v12);

    v8 = v13;
LABEL_4:

    goto LABEL_5;
  }
  if (__PXLoggraph_workerOnceToken != -1)
    dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_18_1220);
  v9 = (void *)__PXLoggraph_workerOSLog;
  if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    +[PHANotificationOptions stringFromNotificationType:](PHANotificationOptions, "stringFromNotificationType:", objc_msgSend(v5, "type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v11;
    _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_DEFAULT, "[%@ Notification] Not firing notification because featured content is disabled in settings", buf, 0xCu);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 14, CFSTR("Featured content is disabled in settings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v8);
    goto LABEL_4;
  }
LABEL_5:

}

- (BOOL)isNotificationRegistered
{
  return self->_isNotificationRegistered;
}

- (void)setIsNotificationRegistered:(BOOL)a3
{
  self->_isNotificationRegistered = a3;
}

void __84__PHALocalNotificationInterface_fireLocalNotificationWithOptions_completionHandler___block_invoke_23(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collectionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deliveryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (__PXLoggraph_workerOnceToken != -1)
    dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_24);
  v4 = (void *)__PXLoggraph_workerOSLog;
  if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    +[PHANotificationOptions stringFromNotificationType:](PHANotificationOptions, "stringFromNotificationType:", objc_msgSend(v5, "type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1CAC16000, v6, OS_LOG_TYPE_INFO, "[%@ Notification] Firing notification %@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F8]), "initWithPhotoLibraryURL:", v9);
  if (!objc_msgSend(*(id *)(a1 + 32), "type"))
  {
    objc_msgSend(v10, "assetsdClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asyncNotifyInterestingMemoryNotificationForColletionID:notificationDeliveryDate:", v2, v3);

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v13 + 16))(v13, 1, 0);

}

void __84__PHALocalNotificationInterface_fireLocalNotificationWithOptions_completionHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __84__PHALocalNotificationInterface_fireLocalNotificationWithOptions_completionHandler___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

+ (id)localNotificationInterface
{
  if (localNotificationInterface_onceToken != -1)
    dispatch_once(&localNotificationInterface_onceToken, &__block_literal_global_1229);
  return (id)localNotificationInterface_interface;
}

void __59__PHALocalNotificationInterface_localNotificationInterface__block_invoke()
{
  PHALocalNotificationInterface *v0;
  void *v1;

  v0 = objc_alloc_init(PHALocalNotificationInterface);
  v1 = (void *)localNotificationInterface_interface;
  localNotificationInterface_interface = (uint64_t)v0;

}

@end
