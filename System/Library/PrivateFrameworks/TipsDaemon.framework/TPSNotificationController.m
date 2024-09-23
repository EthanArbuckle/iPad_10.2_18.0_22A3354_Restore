@implementation TPSNotificationController

- (BOOL)isNotificationSettingValid
{
  return -[TPSLocalNotificationController isNotificationSettingValid](self->_localNotificationController, "isNotificationSettingValid");
}

+ (BOOL)supportsWelcomeNotification
{
  return 1;
}

- (void)clearNotificationCount
{
  -[TPSNotificationController setNotificationCount:](self, "setNotificationCount:", 0);
  -[TPSNotificationController updateNotificationCount](self, "updateNotificationCount");
}

- (void)setNotificationCount:(int64_t)a3
{
  self->_notificationCount = a3;
}

- (void)clearNotificationCache
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "notificationCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1(&dword_1DAC2F000, a2, v4, "Clear notification cache %@", (uint8_t *)&v5);

}

- (TPSNotificationCache)notificationCache
{
  return self->_notificationCache;
}

+ (BOOL)supportsNotification
{
  return 1;
}

+ (BOOL)isValidNotificationInterval
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[TPSNotificationController standardNotificationInterval](TPSNotificationController, "standardNotificationInterval");
  if (v2 <= 0.0)
    return 1;
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("TPSLastNotificationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;
  v8 = fabs(v6) > v3 || v6 >= 0.0;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "data");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218240;
      v12 = v7;
      v13 = 2048;
      v14 = v3;
      _os_log_impl(&dword_1DAC2F000, v9, OS_LOG_TYPE_DEFAULT, "Last notification interval: %f is less than expected interval %f", (uint8_t *)&v11, 0x16u);
    }

  }
  return v8;
}

- (void)updateNotificationCount
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int64_t v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = -[TPSNotificationController notificationCount](self, "notificationCount");
    _os_log_impl(&dword_1DAC2F000, v4, OS_LOG_TYPE_DEFAULT, "Consecutive notification ignore count %zd", (uint8_t *)&v7, 0xCu);
  }

  if (-[TPSNotificationController isSoftOptedOut](self, "isSoftOptedOut"))
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = +[TPSNotificationController softOptOutNotificationCount](TPSNotificationController, "softOptOutNotificationCount");
      v7 = 134217984;
      v8 = v6;
      _os_log_impl(&dword_1DAC2F000, v5, OS_LOG_TYPE_DEFAULT, "User hasn't launch the app after %ld notifications. Will only look for override opt-out notifications next time.", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(v3, "setInteger:forKey:", -[TPSNotificationController notificationCount](self, "notificationCount"), CFSTR("ConsecutiveNotificationsCount"));
  objc_msgSend(v3, "synchronize");

}

- (int64_t)notificationCount
{
  return self->_notificationCount;
}

+ (double)standardNotificationInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DBF3A0], "standardNotificationInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 259200.0;
  }

  return v5;
}

+ (int64_t)softOptOutNotificationCount
{
  return 3;
}

+ (BOOL)alwaysDisplayCollectionIcon
{
  return 0;
}

+ (BOOL)respectsOptOut
{
  return 1;
}

+ (BOOL)supportsExtension
{
  return 1;
}

+ (BOOL)supportsRemoteIcon
{
  return 0;
}

+ (id)displayDarwinNotificationKey
{
  return CFSTR("com.apple.springboard.lockNotificationListEmptyAtScreenOn");
}

+ (int64_t)remainingCountOfNotificationsUntilOptOut
{
  void *v2;
  void *v3;
  int v4;

  if (!+[TPSNotificationController respectsOptOut](TPSNotificationController, "respectsOptOut"))
    return -1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ConsecutiveNotificationsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return +[TPSNotificationController softOptOutNotificationCount](TPSNotificationController, "softOptOutNotificationCount")- v4;
}

+ (id)cacheDirectoryCreateIfEmpty:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v3 = a3;
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("com.apple.TipsDaemon"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "fileExistsAtPath:", v6) & 1) == 0)
      {
        if (!v3)
        {

          goto LABEL_9;
        }
        v11 = 0;
        objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 0, 0, &v11);
        v8 = v11;
        if (v8)
        {
          v9 = v8;

LABEL_9:
          v6 = 0;
        }
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)removeAssetCacheDirectory
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  +[TPSNotificationController cacheDirectoryCreateIfEmpty:](TPSNotificationController, "cacheDirectoryCreateIfEmpty:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = v2;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enumeratorAtPath:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      do
      {
        objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(v3, "removeItemAtPath:error:", v7, 0);

        objc_msgSend(v4, "nextObject");
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v8;
      }
      while (v8);
    }

    v2 = v9;
  }

}

+ (void)removeNotificationCache
{
  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", 0, CFSTR("NotificationCache"));
  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", 0, CFSTR("RegisteredWakingEventMapKey"));
}

- (TPSNotificationController)init
{
  TPSNotificationController *v2;
  void *v3;
  uint64_t v4;
  TPSNotificationCache *notificationCache;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *syncQueue;
  uint64_t v10;
  NSMutableDictionary *assetURLSessionMap;
  TPSEventsProviderManager *v12;
  TPSEventsProviderManager *eventsProviderManager;
  TPSUserNotificationController *v14;
  void *v15;
  uint64_t v16;
  TPSLocalNotificationController *localNotificationController;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *registeredWakingEventMap;
  uint64_t v24;
  NSMutableDictionary *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)TPSNotificationController;
  v2 = -[TPSNotificationController init](&v27, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF400], "unarchivedObjectOfClass:forKey:", objc_opt_class(), CFSTR("NotificationCache"));
    v4 = objc_claimAutoreleasedReturnValue();
    notificationCache = v2->_notificationCache;
    v2->_notificationCache = (TPSNotificationCache *)v4;

    objc_msgSend(v3, "objectForKey:", CFSTR("ConsecutiveNotificationsCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_notificationCount = (int)objc_msgSend(v6, "intValue");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.tips.TPSNotificationController", v7);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    assetURLSessionMap = v2->_assetURLSessionMap;
    v2->_assetURLSessionMap = (NSMutableDictionary *)v10;

    v12 = (TPSEventsProviderManager *)objc_alloc_init(MEMORY[0x1E0DBF3B8]);
    eventsProviderManager = v2->_eventsProviderManager;
    v2->_eventsProviderManager = v12;

    -[TPSEventsProviderManager setDelegate:](v2->_eventsProviderManager, "setDelegate:", v2);
    v14 = [TPSUserNotificationController alloc];
    objc_msgSend(MEMORY[0x1E0DBF348], "notificationBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TPSUserNotificationController initWithBundleIdentifier:](v14, "initWithBundleIdentifier:", v15);
    localNotificationController = v2->_localNotificationController;
    v2->_localNotificationController = (TPSLocalNotificationController *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF400], "unarchivedObjectOfClasses:forKey:", v21, CFSTR("RegisteredWakingEventMapKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    registeredWakingEventMap = v2->_registeredWakingEventMap;
    v2->_registeredWakingEventMap = (NSMutableDictionary *)v22;

    if (v2->_registeredWakingEventMap)
    {
      -[TPSNotificationController _registerWakingEvents](v2, "_registerWakingEvents");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v2->_registeredWakingEventMap;
      v2->_registeredWakingEventMap = (NSMutableDictionary *)v24;

    }
    if (objc_msgSend(MEMORY[0x1E0DBF3A0], "resetDaemonData"))
      -[TPSNotificationController clearNotificationCount](v2, "clearNotificationCount");

  }
  return v2;
}

- (NSBundle)frameworkBundle
{
  NSBundle *frameworkBundle;
  NSBundle *v4;
  NSBundle *v5;

  frameworkBundle = self->_frameworkBundle;
  if (!frameworkBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.TipsDaemon"));
    v4 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    v5 = self->_frameworkBundle;
    self->_frameworkBundle = v4;

    frameworkBundle = self->_frameworkBundle;
  }
  return frameworkBundle;
}

- (void)updateDocumentToNotifyWithPreferredIdentifiers:(id)a3 collectionOrder:(id)a4 collectionMap:(id)a5 collectionDeliveryIdentifierMap:(id)a6 tipMap:(id)a7 tipsDeliveryIdentifierMap:(id)a8 deliveryInfoMap:(id)a9 documentDictionaryMap:(id)a10 metadataDictionary:(id)a11 completionHandler:(id)a12
{
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  BOOL v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void (**v57)(id, TPSNotificationCache *);
  id v58;
  id v59;
  _QWORD v61[4];
  id v62;
  TPSNotificationController *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  BOOL v68;
  _QWORD v69[4];
  id v70;
  TPSNotificationController *v71;
  id v72;
  id v73;
  uint64_t *v74;
  uint8_t *v75;
  BOOL v76;
  _QWORD v77[4];
  id v78;
  TPSNotificationController *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t *v85;
  uint8_t *v86;
  uint64_t *v87;
  BOOL v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD aBlock[4];
  id v94;
  id v95;
  id v96;
  uint8_t *v97;
  uint64_t *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  uint8_t buf[8];
  uint8_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  _QWORD v118[3];

  v118[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v59 = a5;
  v52 = a6;
  v58 = a7;
  v53 = a8;
  v19 = v18;
  v54 = a9;
  v55 = a10;
  v56 = a11;
  v57 = (void (**)(id, TPSNotificationCache *))a12;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "data");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAC2F000, v20, OS_LOG_TYPE_DEFAULT, "Checking document to notify.", buf, 2u);
  }

  if (objc_msgSend(v18, "count") && objc_msgSend(v59, "count") || objc_msgSend(v58, "count"))
  {
    *(_QWORD *)buf = 0;
    v113 = buf;
    v114 = 0x3032000000;
    v115 = __Block_byref_object_copy__10;
    v116 = __Block_byref_object_dispose__10;
    v117 = 0;
    v106 = 0;
    v107 = &v106;
    v108 = 0x3032000000;
    v109 = __Block_byref_object_copy__10;
    v110 = __Block_byref_object_dispose__10;
    v111 = 0;
    v100 = 0;
    v101 = &v100;
    v102 = 0x3032000000;
    v103 = __Block_byref_object_copy__10;
    v104 = __Block_byref_object_dispose__10;
    v105 = 0;
    v51 = -[TPSNotificationController isSoftOptedOut](self, "isSoftOptedOut");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke;
    aBlock[3] = &unk_1EA1E0CA0;
    v97 = buf;
    v98 = &v106;
    v99 = &v100;
    v94 = v55;
    v95 = v56;
    v17 = v17;
    v96 = v17;
    v21 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0DBF3A0], "notificationDocument");
    v22 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)v22;
    if (v22)
    {
      v118[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v17);
      v24 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v24;
    }
    v89 = 0;
    v90 = &v89;
    v91 = 0x2020000000;
    v92 = 0;
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_2;
    v77[3] = &unk_1EA1E0CC8;
    v25 = v59;
    v85 = &v106;
    v78 = v25;
    v79 = self;
    v26 = v52;
    v80 = v26;
    v27 = v54;
    v81 = v27;
    v88 = v51;
    v28 = v58;
    v82 = v28;
    v29 = v53;
    v83 = v29;
    v30 = v21;
    v84 = v30;
    v86 = buf;
    v87 = &v89;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v77);
    if (!objc_msgSend(v17, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", CFSTR("LastNotifiedCollectionIdentifier"));
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)*((_QWORD *)v113 + 5);
      *((_QWORD *)v113 + 5) = v32;

      if (!*((_QWORD *)v113 + 5))
        goto LABEL_12;
      v34 = objc_msgSend(v19, "indexOfObject:");
      v35 = objc_msgSend(v19, "count");
      if (v34 >= v35 - 1)
        goto LABEL_12;
      v36 = v34 + 1;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v34 + 1, v35 - (v34 + 1));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectsAtIndexes:", v37);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectsAtIndexes:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v49);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObjectsFromArray:", v39);

      if (!v40)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v19);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_3;
      v69[3] = &unk_1EA1E0CF0;
      v41 = v25;
      v74 = &v106;
      v70 = v41;
      v71 = self;
      v72 = v26;
      v42 = v27;
      v76 = v51;
      v73 = v42;
      v75 = buf;
      objc_msgSend(v40, "enumerateObjectsUsingBlock:", v69);
      if (!v107[5])
      {
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_4;
        v61[3] = &unk_1EA1E0D18;
        v62 = v41;
        v63 = self;
        v64 = v28;
        v65 = v29;
        v66 = v42;
        v68 = v51;
        v67 = v30;
        objc_msgSend(v40, "enumerateObjectsUsingBlock:", v61);

      }
    }
    v43 = *((_QWORD *)v113 + 5);
    v44 = v107[5];
    v45 = v90[3];
    v46 = (void *)objc_msgSend((id)v101[5], "copy");
    v47 = -[TPSNotificationController updateNotificationCacheWithCollectionIdentifier:document:type:extensionPayload:](self, "updateNotificationCacheWithCollectionIdentifier:document:type:extensionPayload:", v43, v44, v45, v46);

    v57[2](v57, self->_notificationCache);
    _Block_object_dispose(&v89, 8);

    _Block_object_dispose(&v100, 8);
    _Block_object_dispose(&v106, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "data");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DAC2F000, v48, OS_LOG_TYPE_DEFAULT, "No collections or tips available.", buf, 2u);
    }

    -[TPSNotificationController clearNotificationCache](self, "clearNotificationCache");
    v57[2](v57, self->_notificationCache);
  }

}

void __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(v25, "collectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);
  if (!v8)
  {

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  if ((objc_msgSend(v25, "isIntro") & 1) == 0 && (objc_msgSend(v25, "isOutro") & 1) == 0)
  {
    if (+[TPSNotificationController supportsExtension](TPSNotificationController, "supportsExtension"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v13 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DBF4A0]);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0DBF4C0]);
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count") != 2)
      {
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = 0;

      }
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) != 0
    || +[TPSNotificationController alwaysDisplayCollectionIcon](TPSNotificationController, "alwaysDisplayCollectionIcon"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "notification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "assets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v7, "tileAssets");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "notification");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAssets:", v20);

      if (+[TPSNotificationController supportsRemoteIcon](TPSNotificationController, "supportsRemoteIcon"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "assetFileInfoManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "assetFileInfoManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "fileMap");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addNewAssetInfoFromFileMap:", v24);

      }
    }
  }

}

void __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "documentToNotifyForCollection:collectionDeliveryInfoMap:deliveryInfoMap:overrideOptOutContentOnly:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 112));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    objc_msgSend(v6, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "tipDocumentToNotifyWithIdentifier:tipMap:tipDeliveryInfoMap:deliveryInfoMap:overrideOptOutContentOnly:", v13, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 112));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 2;
    *a4 = 1;
  }

}

void __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "documentToNotifyForCollection:collectionDeliveryInfoMap:deliveryInfoMap:overrideOptOutContentOnly:");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(v12, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

void __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "documentToNotifyForTipsInCollection:tipMap:tipDeliveryInfoMap:deliveryInfoMap:overrideOptOutContentOnly:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    *a4 = 1;
  }

}

- (void)updateNotificationRegistrationEventsWithCollectionDeliveryIdentifierMap:(id)a3 tipsDeliveryIdentifierMap:(id)a4 deliveryInfoMap:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);

  v12 = (void (**)(id, _QWORD))a6;
  v10 = a5;
  v11 = a4;
  -[TPSNotificationController registerWakingEventsForDeliveryIdentifierMap:deliveryInfoMap:](self, "registerWakingEventsForDeliveryIdentifierMap:deliveryInfoMap:", a3, v10);
  -[TPSNotificationController registerWakingEventsForDeliveryIdentifierMap:deliveryInfoMap:](self, "registerWakingEventsForDeliveryIdentifierMap:deliveryInfoMap:", v11, v10);

  v12[2](v12, 0);
}

- (void)registerWakingEventsForDeliveryIdentifierMap:(id)a3 deliveryInfoMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;
  TPSNotificationController *v21;
  _QWORD v22[4];
  id v23;
  TPSNotificationController *v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tipStatusController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[TPSNotificationController isSoftOptedOut](self, "isSoftOptedOut");
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __90__TPSNotificationController_registerWakingEventsForDeliveryIdentifierMap_deliveryInfoMap___block_invoke;
  v22[3] = &unk_1EA1E0D40;
  v14 = v11;
  v23 = v14;
  v24 = self;
  v18 = v6;
  v25 = v18;
  v15 = v7;
  v26 = v15;
  v28 = v12;
  v16 = v9;
  v27 = v16;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v22);
  if (objc_msgSend(v16, "count"))
  {
    -[TPSNotificationController syncQueue](self, "syncQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __90__TPSNotificationController_registerWakingEventsForDeliveryIdentifierMap_deliveryInfoMap___block_invoke_2;
    block[3] = &unk_1EA1E0728;
    v20 = v16;
    v21 = self;
    dispatch_sync(v17, block);

  }
}

void __90__TPSNotificationController_registerWakingEventsForDeliveryIdentifierMap_deliveryInfoMap___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  TPSDeliveryPrecondition *v6;
  void *v7;
  BOOL v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isContentNeverVisibleForIdentifier:", v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "notificationDeliveryInfoForIdentifier:documentDeliveryIdentifierMap:deliveryInfoMap:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "TPSSafeBoolForKey:", CFSTR("immediate"))
      || *(_BYTE *)(a1 + 72) && !objc_msgSend(v4, "TPSSafeBoolForKey:", CFSTR("overrideOptOut")))
    {
      goto LABEL_23;
    }
    objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("preconditions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = -[TPSDeliveryPrecondition initWithDictionary:]([TPSDeliveryPrecondition alloc], "initWithDictionary:", v5);
      -[TPSDeliveryPrecondition conditionsForType:](v6, "conditionsForType:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "count"))
      {
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      v8 = +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:error:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:error:", v7, -[TPSDeliveryPrecondition joinType](v6, "joinType"), v3, 0, 0, 0);

      if (!v8)
      {
        -[TPSDeliveryPrecondition conditionsForType:](v6, "conditionsForType:", 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "count"))
        {

LABEL_26:
          -[TPSDeliveryPrecondition registrableEvents](v6, "registrableEvents");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
          if (objc_msgSend(v7, "count"))
          {
            v18 = 0u;
            v19 = 0u;
            v16 = 0u;
            v17 = 0u;
            v11 = v7;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v17;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v17 != v14)
                    objc_enumerationMutation(v11);
                  objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "addObserverIdentifier:", v3, (_QWORD)v16);
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
              }
              while (v13);
            }

            objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", v11);
          }
          goto LABEL_22;
        }
        v10 = +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:error:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:error:", v9, -[TPSDeliveryPrecondition joinType](v6, "joinType"), v3, 0, 0, 0);

        if (v10)
          goto LABEL_26;
      }
    }
    else
    {
      v6 = 0;
    }
    v7 = 0;
    goto LABEL_13;
  }
LABEL_24:

}

uint64_t __90__TPSNotificationController_registerWakingEventsForDeliveryIdentifierMap_deliveryInfoMap___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "registeredWakingEventMap", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "_updateWakingEventMapCache");
  return objc_msgSend(*(id *)(a1 + 40), "_registerWakingEvents");
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  -[TPSNotificationController localNotificationController](self, "localNotificationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeNotificationWithIdentifier:", v4);

  -[TPSNotificationController notificationCache](self, "notificationCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v4);

  if (v9)
    -[TPSNotificationController clearNotificationCache](self, "clearNotificationCache");
}

- (void)removeAllNotifications
{
  void *v3;

  -[TPSNotificationController localNotificationController](self, "localNotificationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllNotifications");

  -[TPSNotificationController clearNotificationCache](self, "clearNotificationCache");
  -[TPSNotificationController clearNotificationCount](self, "clearNotificationCount");
}

- (void)_registerWakingEvents
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_1DAC2F000, a2, a3, "Re-registering notification for waking events: %@", (uint8_t *)&v3);
}

- (void)_unregisterAllWakingEvents
{
  id v2;

  -[TPSNotificationController eventsProviderManager](self, "eventsProviderManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterAllWakingEvents");

}

- (void)_updateWakingEventMapCache
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0DBF400];
  -[TPSNotificationController registeredWakingEventMap](self, "registeredWakingEventMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "archivedDataWithRootObject:forKey:", v3, CFSTR("RegisteredWakingEventMapKey"));

}

- (void)_updateNotificationCache
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0DBF400];
  -[TPSNotificationController notificationCache](self, "notificationCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "archivedDataWithRootObject:forKey:", v3, CFSTR("NotificationCache"));

}

- (id)updateNotificationCacheWithCollectionIdentifier:(id)a3 document:(id)a4 type:(unint64_t)a5 extensionPayload:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  void *v19;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = v11;
    v28 = 2112;
    v29 = v10;
    v30 = 2048;
    v31 = a5;
    _os_log_impl(&dword_1DAC2F000, v13, OS_LOG_TYPE_DEFAULT, "Update notification cache for document %@, collectionIdentifier %@, type %lu", buf, 0x20u);
  }

  if (v10 && v11)
  {
    -[TPSNotificationController notificationCache](self, "notificationCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "type");

    if (v15 == 1)
    {
      if (a5 != 1)
      {
        objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v17 = "Cannot update notification document due to a welcome type in progress.";
LABEL_14:
          _os_log_impl(&dword_1DAC2F000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else if (a5 != 2 && v15 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v17 = "Cannot update notification document due to a immediate type in progress.";
        goto LABEL_14;
      }
LABEL_15:

      goto LABEL_17;
    }
    -[TPSNotificationController syncQueue](self, "syncQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__TPSNotificationController_updateNotificationCacheWithCollectionIdentifier_document_type_extensionPayload___block_invoke;
    block[3] = &unk_1EA1E0D68;
    block[4] = self;
    v22 = v10;
    v23 = v11;
    v25 = a5;
    v24 = v12;
    dispatch_sync(v18, block);

    goto LABEL_17;
  }
  -[TPSNotificationController clearNotificationCache](self, "clearNotificationCache");
LABEL_17:
  -[TPSNotificationController notificationCache](self, "notificationCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __108__TPSNotificationController_updateNotificationCacheWithCollectionIdentifier_document_type_extensionPayload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "notificationCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {

    v9 = 0;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "notificationCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "notificationCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attachmentURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  +[TPSNotificationCache notificationCacheWithCollectionIdentifier:document:type:](TPSNotificationCache, "notificationCacheWithCollectionIdentifier:document:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNotificationCache:", v10);

  v11 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "notificationCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExtensionPayload:", v11);

  objc_msgSend(*(id *)(a1 + 32), "notificationCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttachmentURL:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_updateNotificationCache");
  objc_msgSend(*(id *)(a1 + 48), "notification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v16;
    _os_log_impl(&dword_1DAC2F000, v15, OS_LOG_TYPE_DEFAULT, "Tip found to notify user about %@", (uint8_t *)&v17, 0xCu);

  }
}

- (id)notificationDeliveryInfoForIdentifier:(id)a3 documentDeliveryIdentifierMap:(id)a4 deliveryInfoMap:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a5;
  objc_msgSend(a4, "TPSSafeStringForKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "TPSSafeDictionaryForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("notification"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)documentToNotifyForCollection:(id)a3 collectionDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 overrideOptOutContentOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TPSNotificationController collectionEligibleForNotification:](self, "collectionEligibleForNotification:", v13))
    {
      objc_msgSend(v10, "notification");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[TPSNotificationController notificationDeliveryInfoForIdentifier:documentDeliveryIdentifierMap:deliveryInfoMap:](self, "notificationDeliveryInfoForIdentifier:documentDeliveryIdentifierMap:deliveryInfoMap:", v13, v11, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[TPSNotificationController isNotificationDeliveryInfoValid:identifier:overrideOptOutContentOnly:ignoreSuppressContent:](self, "isNotificationDeliveryInfoValid:identifier:overrideOptOutContentOnly:ignoreSuppressContent:", v15, v13, v6, 0);

        if (v16)
        {
          if (!-[TPSNotificationController isDocumentHintDisplayedOnOtherDevices:](self, "isDocumentHintDisplayedOnOtherDevices:", v10))
          {
LABEL_8:

            goto LABEL_9;
          }
          -[TPSNotificationController delegate](self, "delegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "notificationController:markIdentifier:type:ineligibleWithReason:", self, v13, 2, 5);

        }
      }
    }

    v10 = 0;
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (id)documentToNotifyForTipsInCollection:(id)a3 tipMap:(id)a4 tipDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 overrideOptOutContentOnly:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__10;
  v32 = __Block_byref_object_dispose__10;
  v33 = 0;
  objc_msgSend(v12, "tipIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __133__TPSNotificationController_documentToNotifyForTipsInCollection_tipMap_tipDeliveryInfoMap_deliveryInfoMap_overrideOptOutContentOnly___block_invoke;
  v22[3] = &unk_1EA1E0D90;
  v26 = &v28;
  v22[4] = self;
  v17 = v13;
  v23 = v17;
  v18 = v14;
  v24 = v18;
  v19 = v15;
  v25 = v19;
  v27 = a7;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v22);

  v20 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v20;
}

void __133__TPSNotificationController_documentToNotifyForTipsInCollection_tipMap_tipDeliveryInfoMap_deliveryInfoMap_overrideOptOutContentOnly___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "tipDocumentToNotifyWithIdentifier:tipMap:tipDeliveryInfoMap:deliveryInfoMap:overrideOptOutContentOnly:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
}

- (id)tipDocumentToNotifyWithIdentifier:(id)a3 tipMap:(id)a4 tipDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 overrideOptOutContentOnly:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!-[TPSNotificationController canUpdateHintEligibilityForIdentifier:](self, "canUpdateHintEligibilityForIdentifier:", v12))goto LABEL_7;
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16
    || (objc_msgSend(v16, "notification"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, !v18)
    || !-[TPSNotificationController preconditionValidForIdentifier:documentDeliveryInfoMap:deliveryInfoMap:overrideOptOutContentOnly:ignoreSuppressContent:](self, "preconditionValidForIdentifier:documentDeliveryInfoMap:deliveryInfoMap:overrideOptOutContentOnly:ignoreSuppressContent:", v12, v14, v15, v7, 0)|| !-[TPSNotificationController updateHintEligibleForTip:isValid:](self, "updateHintEligibleForTip:isValid:", v17, 1))
  {

LABEL_7:
    v17 = 0;
  }

  return v17;
}

- (BOOL)canUpdateHintEligibilityForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tipStatusController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isContentNeverVisibleForIdentifier:", v3)
    && (objc_msgSend(v5, "isHintInelgibileForIdentifier:", v3) & 1) == 0)
  {
    if (objc_msgSend(v5, "displayTypeForIdentifier:", v3) == 1)
    {
      objc_msgSend(v5, "hintEligibleDateForIdentifier:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8 != 0;

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)preconditionValidForIdentifier:(id)a3 documentDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 overrideOptOutContentOnly:(BOOL)a6 ignoreSuppressContent:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  void *v13;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  -[TPSNotificationController notificationDeliveryInfoForIdentifier:documentDeliveryIdentifierMap:deliveryInfoMap:](self, "notificationDeliveryInfoForIdentifier:documentDeliveryIdentifierMap:deliveryInfoMap:", v12, a4, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = -[TPSNotificationController isNotificationDeliveryInfoValid:identifier:overrideOptOutContentOnly:ignoreSuppressContent:](self, "isNotificationDeliveryInfoValid:identifier:overrideOptOutContentOnly:ignoreSuppressContent:", v13, v12, v8, v7);

  return v7;
}

- (BOOL)updateHintEligibleForTip:(id)a3 isValid:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TPSNotificationController isDocumentHintDisplayedOnOtherDevices:](self, "isDocumentHintDisplayedOnOtherDevices:", v6);

  if (v8)
  {
    -[TPSNotificationController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notificationController:markIdentifier:type:ineligibleWithReason:", self, v7, 1, 5);

    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tipStatusController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !objc_msgSend(v11, "displayTypeForIdentifier:", v7))
  {
    objc_msgSend(v11, "hintEligibleDateForIdentifier:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      objc_msgSend(v11, "updateHintEligibleDateForIdentifier:value:", v7, 1);
  }

  return v4;
}

- (BOOL)isNotificationDeliveryInfoValid:(id)a3 identifier:(id)a4 overrideOptOutContentOnly:(BOOL)a5 ignoreSuppressContent:(BOOL)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  TPSDeliveryPrecondition *v12;
  TPSDeliveryPrecondition *v13;
  void *v14;
  _BOOL4 v15;
  int v16;
  BOOL v17;
  uint64_t v19;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  if (!a6 && (objc_msgSend(v9, "TPSSafeBoolForKey:", CFSTR("suppress")) & 1) != 0
    || v7 && !objc_msgSend(v9, "TPSSafeBoolForKey:", CFSTR("overrideOptOut")))
  {
    v17 = 0;
  }
  else if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "TPSSafeDictionaryForKey:", CFSTR("preconditions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = -[TPSDeliveryPrecondition initWithDictionary:]([TPSDeliveryPrecondition alloc], "initWithDictionary:", v11);
      v13 = v12;
      if (v12)
      {
        -[TPSDeliveryPrecondition conditionsForType:](v12, "conditionsForType:", 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        v15 = +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:error:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:error:", v14, -[TPSDeliveryPrecondition joinType](v13, "joinType"), v10, 0, 0, &v19);
        if (v19)
          v16 = 0;
        else
          v16 = v15;

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 1;
    }

    v17 = v16 != 0;
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (void)showNotificationWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, uint64_t, void *);
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, uint64_t, void *))a3;
  -[TPSNotificationController notificationCache](self, "notificationCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSNotificationController notificationCache](self, "notificationCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasLocaleChanged");

    v9 = v8 ^ 1;
    if (v8)
      v10 = 2;
    else
      v10 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 1;
  }
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tipStatusController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = 1;
      if ((objc_msgSend(v13, "isLockScreenHintDisplayEligibleForIdentifier:", v11) & 1) == 0)
        goto LABEL_21;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      v16 = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0 && (v16 & 1) == 0)
      {
        v14 = 0;
LABEL_21:
        v10 = 3;
LABEL_22:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.TipsDaemon.notificationController"), v10, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 138412546;
          v27 = (int64_t)v11;
          v28 = 2112;
          v29 = v17;
          _os_log_impl(&dword_1DAC2F000, v18, OS_LOG_TYPE_DEFAULT, "Notification for %@ is no longer eligible due to error %@.", (uint8_t *)&v26, 0x16u);
        }
        goto LABEL_27;
      }
      if ((isKindOfClass & 1) != 0)
        v14 = 2;
      else
        v14 = 3;
      if (!-[TPSNotificationController collectionEligibleForNotification:](self, "collectionEligibleForNotification:", v11))goto LABEL_21;
    }
  }
  else
  {
    v14 = 0;
    if (v10)
      goto LABEL_22;
  }
  if (-[TPSNotificationController isDocumentHintDisplayedOnOtherDevices:](self, "isDocumentHintDisplayedOnOtherDevices:", v6))
  {
    v10 = 4;
    goto LABEL_22;
  }
  -[TPSNotificationController notificationCache](self, "notificationCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attachmentURL");
  v18 = objc_claimAutoreleasedReturnValue();

  -[TPSNotificationController localNotificationController](self, "localNotificationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSNotificationController notificationCache](self, "notificationCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "showNotificationForNotificationCache:attachmentURL:", v21, v18);

  -[TPSNotificationController increaseUserNotificationCount](self, "increaseUserNotificationCount");
  -[TPSNotificationController updateLastNotificationDate](self, "updateLastNotificationDate");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 134217984;
    v27 = -[TPSNotificationController notificationCount](self, "notificationCount");
    _os_log_impl(&dword_1DAC2F000, v22, OS_LOG_TYPE_DEFAULT, "Consecutive notification count %ld", (uint8_t *)&v26, 0xCu);
  }

  v17 = 0;
LABEL_27:

  objc_msgSend(MEMORY[0x1E0DBF348], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSNotificationController notificationCache](self, "notificationCache");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "collectionIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "notifiedCollection:", v25);

  -[TPSNotificationController clearNotificationCache](self, "clearNotificationCache");
  v4[2](v4, v6, v14, v17);

}

- (void)increaseUserNotificationCount
{
  -[TPSNotificationController setNotificationCount:](self, "setNotificationCount:", -[TPSNotificationController notificationCount](self, "notificationCount") + 1);
  -[TPSNotificationController updateNotificationCount](self, "updateNotificationCount");
}

- (BOOL)isSoftOptedOut
{
  int64_t v2;

  v2 = -[TPSNotificationController notificationCount](self, "notificationCount");
  return v2 >= +[TPSNotificationController softOptOutNotificationCount](TPSNotificationController, "softOptOutNotificationCount")&& +[TPSNotificationController respectsOptOut](TPSNotificationController, "respectsOptOut");
}

- (void)updateLastNotificationDate
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, CFSTR("TPSLastNotificationDate"));

  objc_msgSend(v3, "synchronize");
}

- (BOOL)collectionEligibleForNotification:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = (void *)MEMORY[0x1E0DBF348];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionStatusForCollectionIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "canNotify"))
  {
    objc_msgSend(v6, "firstViewedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isDocumentHintDisplayedOnOtherDevices:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "correlationID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v6);

    objc_msgSend(v3, "clonedFromID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v7);

    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v8);

    objc_msgSend(MEMORY[0x1E0DBF330], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__TPSNotificationController_isDocumentHintDisplayedOnOtherDevices___block_invoke;
    v16[3] = &unk_1EA1E0DB8;
    v10 = v9;
    v17 = v10;
    if (objc_msgSend(v5, "na_any:", v16))
    {
      if (!objc_msgSend(MEMORY[0x1E0DBF3A0], "ignoreCloud"))
      {
        v4 = 1;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "correlationID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "clonedFromID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v19 = v12;
        v20 = 2112;
        v21 = v13;
        v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_1DAC2F000, v11, OS_LOG_TYPE_DEFAULT, "Overriding ineligibility due to content %@ already seen on other devices (correlationId: %@, cloneFromID: %@)", buf, 0x20u);

      }
    }
    v4 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

uint64_t __67__TPSNotificationController_isDocumentHintDisplayedOnOtherDevices___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isHintDisplayedForContentID:", a2);
}

- (BOOL)shouldDisplayCollectionIcon
{
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;

  if (+[TPSNotificationController alwaysDisplayCollectionIcon](TPSNotificationController, "alwaysDisplayCollectionIcon"))
  {
    isKindOfClass = 1;
  }
  else
  {
    -[TPSNotificationController notificationCache](self, "notificationCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[TPSNotificationController notificationCache](self, "notificationCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "type") == 2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }

  }
  return isKindOfClass & 1;
}

- (void)fetchNotificationAssetIfNeededCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  double v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  void (**v37)(id, void *);
  uint64_t *v38;
  id v39;
  id location;
  _QWORD block[5];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[TPSNotificationController notificationCache](self, "notificationCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[TPSNotificationController shouldDisplayCollectionIcon](self, "shouldDisplayCollectionIcon"))
    goto LABEL_22;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__10;
  v54 = __Block_byref_object_dispose__10;
  -[TPSNotificationController notificationCache](self, "notificationCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentURL");
  v55 = (id)objc_claimAutoreleasedReturnValue();

  -[TPSNotificationController cacheAssetFileURLForDocument:](self, "cacheAssetFileURLForDocument:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v51[5];
  if (v8)
  {
    if ((objc_msgSend(v9, "isEqual:", v8) & 1) == 0)
    {
      -[TPSNotificationController notificationCache](self, "notificationCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttachmentURL:", v8);

      -[TPSNotificationController _updateNotificationCache](self, "_updateNotificationCache");
    }
    v4[2](v4, v8);
    goto LABEL_6;
  }
  v51[5] = 0;

  if (v51[5])
  {
    -[TPSNotificationController notificationCache](self, "notificationCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttachmentURL:", 0);

    -[TPSNotificationController _updateNotificationCache](self, "_updateNotificationCache");
    if (v51[5])
    {
LABEL_6:
      LOBYTE(v11) = 0;
      goto LABEL_21;
    }
  }
  objc_msgSend(v6, "notification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "imageIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v14, "baseURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (v16)
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      -[TPSNotificationController assetsConfigurationForDocument:](self, "assetsConfigurationForDocument:", v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "cacheIdentifierForType:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      v45 = &v44;
      v46 = 0x3032000000;
      v47 = __Block_byref_object_copy__10;
      v48 = __Block_byref_object_dispose__10;
      v49 = 0;
      -[TPSNotificationController syncQueue](self, "syncQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke;
      block[3] = &unk_1EA1E0DE0;
      v43 = &v44;
      block[4] = self;
      v19 = v17;
      v42 = v19;
      dispatch_sync(v18, block);

      LOBYTE(v11) = 0;
      if (!v45[5] && v19)
      {
        objc_msgSend(MEMORY[0x1E0DBF368], "assetPathFromAssetConfiguration:type:", v30, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = v20 != 0;
        if (v20)
        {
          objc_initWeak(&location, self);
          objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v57 = v22;
            v58 = 2112;
            v59 = v19;
            v60 = 2112;
            v61 = v20;
            _os_log_impl(&dword_1DAC2F000, v21, OS_LOG_TYPE_DEFAULT, "Attempt to cache asset for document id %@ with asset identifier %@ at %@", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x1E0DBF308], "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_57;
          v34[3] = &unk_1EA1E0E08;
          objc_copyWeak(&v39, &location);
          v24 = *MEMORY[0x1E0CB3338];
          v34[4] = self;
          v25 = v19;
          v35 = v25;
          v38 = &v50;
          v36 = v6;
          v37 = v4;
          LODWORD(v26) = v24;
          objc_msgSend(v23, "formattedDataForPath:identifier:attributionIdentifier:priority:completionHandler:", v20, v25, 0, v34, v26);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v45[5];
          v45[5] = v27;

          -[TPSNotificationController syncQueue](self, "syncQueue");
          v29 = objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_59;
          v31[3] = &unk_1EA1E0E30;
          v31[4] = self;
          v32 = v25;
          v33 = &v44;
          dispatch_async(v29, v31);

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);
        }

      }
      _Block_object_dispose(&v44, 8);

    }
  }

LABEL_21:
  _Block_object_dispose(&v50, 8);

  if (!((v8 != 0) | v11 & 1))
LABEL_22:
    v4[2](v4, 0);

}

void __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "assetURLSessionMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 72);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(*(id *)(a1 + 32), "cacheFilePathForFile:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(WeakRetained, "copyFileURL:cachePath:", v5, v7);

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(WeakRetained, "syncQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_2;
  v27 = &unk_1EA1E0728;
  v28 = WeakRetained;
  v29 = *(id *)(a1 + 40);
  dispatch_async(v11, &v24);

  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0DBF3D0], "daemon", v24, v25, v26, v27, v28);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      v18 = "Asset cached for document id %@ with asset identifier %@ to %@";
      v19 = v13;
      v20 = 32;
LABEL_6:
      _os_log_impl(&dword_1DAC2F000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);

    }
  }
  else if (v14)
  {
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v31 = v15;
    v32 = 2112;
    v33 = v21;
    v18 = "Unable to cache asset for document id %@ with asset identifier %@";
    v19 = v13;
    v20 = 22;
    goto LABEL_6;
  }

  v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(WeakRetained, "notificationCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAttachmentURL:", v22);

  objc_msgSend(WeakRetained, "_updateNotificationCache");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "assetURLSessionMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

void __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_59(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "assetURLSessionMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (id)assetsConfigurationForDocument:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC5BA0]);
    v7 = objc_msgSend(v6, "userInterfaceStyle") == 2;
    v8 = objc_alloc(MEMORY[0x1E0DBF310]);
    objc_msgSend(v3, "language");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetFileInfoManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithAssets:language:userInterfaceStyle:assetFileInfoManager:", v5, v9, v7, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)cacheFilePathForFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[TPSNotificationController cacheDirectoryCreateIfEmpty:](TPSNotificationController, "cacheDirectoryCreateIfEmpty:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)cacheAssetFileURLForDocument:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[TPSNotificationController assetsConfigurationForDocument:](self, "assetsConfigurationForDocument:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheIdentifierForType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSNotificationController cacheFilePathForFile:](self, "cacheFilePathForFile:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_12;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "fileExistsAtPath:", v7) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_12;
    }
    else
    {

    }
  }
  -[TPSNotificationController frameworkBundle](self, "frameworkBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLForResource:withExtension:", v5, &stru_1EA1E3770);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v9 = -[TPSNotificationController copyFileURL:cachePath:](self, "copyFileURL:cachePath:", v11, v7);
  else
    v9 = 0;

LABEL_12:
  return v9;
}

- (id)copyFileURL:(id)a3 cachePath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  int v11;
  id v12;
  void *v13;
  id v15;

  v5 = a3;
  v6 = 0;
  if (v5 && a4)
  {
    v7 = (void *)MEMORY[0x1E0CB3620];
    v8 = a4;
    objc_msgSend(v7, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

    if ((v10 & 1) == 0)
    {
      if (v6)
      {
        v15 = 0;
        v11 = objc_msgSend(v9, "copyItemAtURL:toURL:error:", v5, v6, &v15);
        v12 = v15;
        v13 = v12;
        if (v11 && !v12)
          goto LABEL_10;
      }
      else
      {
        v13 = 0;
      }

      v6 = 0;
    }
LABEL_10:

  }
  return v6;
}

- (void)dataProviderManager:(id)a3 didReceiveCallbackWithResult:(id)a4 type:(int64_t)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v6 = a4;
  -[TPSNotificationController syncQueue](self, "syncQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__TPSNotificationController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke;
  block[3] = &unk_1EA1E0728;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(v7, block);

}

void __83__TPSNotificationController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "registeredWakingEventMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "observerIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationController:registrableEventReceivedForDocumentIdentifier:", v5, v7);

    objc_msgSend(*(id *)(a1 + 32), "registeredWakingEventMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v9);

    objc_msgSend(*(id *)(a1 + 32), "_updateWakingEventMapCache");
  }

}

- (TPSNotificationControllerDelegate)delegate
{
  return (TPSNotificationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setNotificationCache:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCache, a3);
}

- (NSMutableDictionary)assetURLSessionMap
{
  return self->_assetURLSessionMap;
}

- (void)setAssetURLSessionMap:(id)a3
{
  objc_storeStrong((id *)&self->_assetURLSessionMap, a3);
}

- (TPSEventsProviderManager)eventsProviderManager
{
  return self->_eventsProviderManager;
}

- (void)setEventsProviderManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventsProviderManager, a3);
}

- (void)setFrameworkBundle:(id)a3
{
  objc_storeStrong((id *)&self->_frameworkBundle, a3);
}

- (TPSLocalNotificationController)localNotificationController
{
  return self->_localNotificationController;
}

- (void)setLocalNotificationController:(id)a3
{
  objc_storeStrong((id *)&self->_localNotificationController, a3);
}

- (NSMutableDictionary)registeredWakingEventMap
{
  return self->_registeredWakingEventMap;
}

- (void)setRegisteredWakingEventMap:(id)a3
{
  objc_storeStrong((id *)&self->_registeredWakingEventMap, a3);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_registeredWakingEventMap, 0);
  objc_storeStrong((id *)&self->_localNotificationController, 0);
  objc_storeStrong((id *)&self->_frameworkBundle, 0);
  objc_storeStrong((id *)&self->_eventsProviderManager, 0);
  objc_storeStrong((id *)&self->_assetURLSessionMap, 0);
  objc_storeStrong((id *)&self->_notificationCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
