@implementation UNCRemoteNotificationRepository

- (UNCRemoteNotificationRepository)initWithServiceClient:(id)a3
{
  id v5;
  UNCRemoteNotificationRepository *v6;
  UNCRemoteNotificationRepository *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  UNCKeyedObservable *v12;
  UNCKeyedObservable *observable;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UNCRemoteNotificationRepository;
  v6 = -[UNCRemoteNotificationRepository init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceClient, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.UserNotificationsCore.UNCRemoteNotificationRepository", v8);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.UserNotificationsCore.UNCRemoteNotificationRepository.call-out", v10);

    v12 = -[UNCKeyedObservable initWithQueue:callOutQueue:]([UNCKeyedObservable alloc], "initWithQueue:callOutQueue:", v9, v11);
    observable = v7->_observable;
    v7->_observable = v12;

  }
  return v7;
}

- (void)notifyDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  UNCKeyedObservable *observable;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  observable = self->_observable;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__UNCRemoteNotificationRepository_notifyDidPerformUpdates_forBundleIdentifier___block_invoke;
  v11[3] = &unk_251AE02F0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[UNCKeyedObservable notifyObserversKey:usingBlock:](observable, "notifyObserversKey:usingBlock:", v9, v11);

}

uint64_t __79__UNCRemoteNotificationRepository_notifyDidPerformUpdates_forBundleIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "notificationRepository:didPerformUpdates:forBundleIdentifier:", a1[4], a1[5], a1[6]);
}

- (void)notifyDidDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a3
{
  id v4;
  UNCKeyedObservable *observable;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observable = self->_observable;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __92__UNCRemoteNotificationRepository_notifyDidDiscoverContentOnFirstUnlockForBundleIdentifier___block_invoke;
  v7[3] = &unk_251AE0318;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[UNCKeyedObservable notifyObserversKey:usingBlock:](observable, "notifyObserversKey:usingBlock:", v6, v7);

}

void __92__UNCRemoteNotificationRepository_notifyDidDiscoverContentOnFirstUnlockForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "notificationRepository:didDiscoverContentOnFirstUnlockForBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  -[UNCKeyedObservable addObserver:forKey:](self->_observable, "addObserver:forKey:", a3, a4);
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  -[UNCKeyedObservable removeObserver:forKey:](self->_observable, "removeObserver:forKey:", a3, a4);
}

- (id)allBundleIdentifiers
{
  void *v2;
  void *v3;

  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allBundleIdentifiersForNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)notificationRecordsForBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationRecordsForBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notificationRecordForIdentifier:bundleIdentifier:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)saveNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 forBundleIdentifier:(id)a5 withCompletionHandler:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;

  v7 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:", v13, 0, v7, v12, v11);

}

- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 withCompletionHandler:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v8 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:completionHandler:", v16, v15, v8, v14, v13);

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
  -[UNCRemoteNotificationRepository saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:](self, "saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:", v11, v7, v12, v10);

}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;

  v7 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "saveNotificationRequest:shouldRepost:apsMessageTimestamp:forBundleIdentifier:", v13, v7, v12, v11);

}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  UNCNotificationCommonServiceServerProtocol *serviceClient;
  id v6;
  id v7;

  serviceClient = self->_serviceClient;
  v6 = a4;
  objc_msgSend(a3, "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationCommonServiceServerProtocol removeNotificationRecordsForIdentifiers:bundleIdentifier:](serviceClient, "removeNotificationRecordsForIdentifiers:bundleIdentifier:", v7, v6);

}

- (void)removeSimilarNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeSimilarNotificationRecords:forBundleIdentifier:", v8, v7);

}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:", v5);

}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeInvalidNotificationRecordsForBundleIdentifier:", v5);

}

- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllNotificationRecordsForBundleIdentifier:", v5);

}

- (void)removeStoreForBundleIdentifier:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeStoreForBundleIdentifier:", v5);

}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "badgeNumberForBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBadgeNumber:forBundleIdentifier:completionHandler:", v11, v10, v9);

}

- (void)setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a5;
  v10 = a4;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBadgeCount:forBundleIdentifier:completionHandler:", a3, v10, v9);

}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[UNCRemoteNotificationRepository _coreServiceClientOrNilWithWarningForSelector:](self, "_coreServiceClientOrNilWithWarningForSelector:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBadgeString:forBundleIdentifier:completionHandler:", v11, v10, v9);

}

- (id)_coreServiceClientOrNilWithWarningForSelector:(SEL)a3
{
  UNCNotificationCommonServiceServerProtocol *v5;
  void *v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = self->_serviceClient;
  }
  else
  {
    NSStringFromSelector(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UNLogToDeveloper();

    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_serviceClient, 0);
}

@end
