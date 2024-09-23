@implementation WiFiAnalyticsManager

+ (id)sharedWiFiAnalyticsManager
{
  void *v3;

  if (objc_opt_class(WAClient))
  {
    if (qword_10026D560 != -1)
      dispatch_once(&qword_10026D560, &stru_10022EB48);
  }
  else
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed in super-init", "+[WiFiAnalyticsManager sharedWiFiAnalyticsManager]");
    objc_autoreleasePoolPop(v3);
  }
  return (id)qword_10026D558;
}

- (WiFiAnalyticsManager)init
{
  WiFiAnalyticsManager *v2;
  WiFiAnalyticsManager *v3;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WiFiAnalyticsManager;
  v2 = -[WiFiAnalyticsManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_deviceAnalyticsClient = 0;
    v2->_movingNetworkSsidsCache = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->_omnipresentNetworkSsidsCache = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->_historicallyBadLinkQualityNetworkSsidsCache = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->_dateTraitCachesUpdated = 0;
    v3->_traitsCacheUpdateBusy = 0;
    v3->_usageCache = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  else
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed in super-init", "-[WiFiAnalyticsManager init]");
    objc_autoreleasePoolPop(v5);
  }
  return v3;
}

- (void)dealloc
{
  WADeviceAnalyticsClient *deviceAnalyticsClient;
  NSMutableArray *movingNetworkSsidsCache;
  NSMutableArray *omnipresentNetworkSsidsCache;
  NSMutableArray *historicallyBadLinkQualityNetworkSsidsCache;
  NSDate *dateTraitCachesUpdated;
  NSMutableArray *usageCache;
  objc_super v9;

  deviceAnalyticsClient = self->_deviceAnalyticsClient;
  if (deviceAnalyticsClient)
  {

    self->_deviceAnalyticsClient = 0;
  }
  movingNetworkSsidsCache = self->_movingNetworkSsidsCache;
  if (movingNetworkSsidsCache)

  omnipresentNetworkSsidsCache = self->_omnipresentNetworkSsidsCache;
  if (omnipresentNetworkSsidsCache)

  historicallyBadLinkQualityNetworkSsidsCache = self->_historicallyBadLinkQualityNetworkSsidsCache;
  if (historicallyBadLinkQualityNetworkSsidsCache)

  dateTraitCachesUpdated = self->_dateTraitCachesUpdated;
  if (dateTraitCachesUpdated)

  usageCache = self->_usageCache;
  if (usageCache)
  {
    -[NSMutableArray removeAllObjects](usageCache, "removeAllObjects");

  }
  v9.receiver = self;
  v9.super_class = (Class)WiFiAnalyticsManager;
  -[WiFiAnalyticsManager dealloc](&v9, "dealloc");
}

- (void)setWiFiManager:(__WiFiManager *)a3
{
  CFAbsoluteTime Current;
  void *v5;

  if (a3)
  {
    -[WiFiAnalyticsManager setWifiManager:](self, "setWifiManager:");
    Current = CFAbsoluteTimeGetCurrent();
    -[WiFiAnalyticsManager setManagerInitTime:](self, "setManagerInitTime:", Current);
  }
  else
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: NULL WiFiManager", "-[WiFiAnalyticsManager setWiFiManager:]");
    objc_autoreleasePoolPop(v5);
  }
}

- (WADeviceAnalyticsClient)deviceAnalyticsClient
{
  void *v3;
  WADeviceAnalyticsClient *v4;
  void *v5;
  void *v7;

  if (objc_opt_class(WADeviceAnalyticsClient))
  {
    if (!self->_deviceAnalyticsClient)
    {
      v3 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: attempting to initialize deviceAnalyticsClient", "-[WiFiAnalyticsManager deviceAnalyticsClient]");
      objc_autoreleasePoolPop(v3);
      if (_os_feature_enabled_impl("WiFiPolicy", "HND_AnalyticsProcessor"))
        v4 = (WADeviceAnalyticsClient *)+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist](WADeviceAnalyticsClient, "sharedDeviceAnalyticsClientWithPersist");
      else
        v4 = (WADeviceAnalyticsClient *)objc_alloc_init((Class)WADeviceAnalyticsClient);
      self->_deviceAnalyticsClient = v4;
      if (v4)
      {
        -[WiFiAnalyticsManager _cleanupExistingRetiredStores](self, "_cleanupExistingRetiredStores");
        v5 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: deviceAnalyticsClient initialized successfully", "-[WiFiAnalyticsManager deviceAnalyticsClient]");
      }
      else
      {
        v5 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: unable to init deviceAnalyticsClient", "-[WiFiAnalyticsManager deviceAnalyticsClient]");
      }
      objc_autoreleasePoolPop(v5);
      self->_roamParamsQueryPending = 0;
    }
  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: WADeviceAnalyticsClient class not present", "-[WiFiAnalyticsManager deviceAnalyticsClient]");
    objc_autoreleasePoolPop(v7);
  }
  return self->_deviceAnalyticsClient;
}

- (void)_cleanupExistingRetiredStores
{
  id v2;
  NSString *const **v3;
  NSURL *v4;
  NSURL *v5;
  NSURL *v6;
  NSURL *v7;
  NSURL *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSString *const **v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSURL *v33;
  NSURL *v34;
  char v35;
  NSURL *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v2 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v2, "addObject:", +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("/System/Library/PrivateFrameworks/MobileWiFi.framework/WiFiNetworkStoreModel.momd")));
  objc_msgSend(v2, "addObject:", +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("/usr/sbin/WiFiNetworkStoreModel.momd")));
  v3 = &ACAccountStoreDidChangeNotification_ptr;
  v4 = -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 1, 0);
  v36 = -[NSURL URLByAppendingPathComponent:](v4, "URLByAppendingPathComponent:", CFSTR("WiFiNetworkStoreModel.sqlite"));
  if (!v36)
  {
    v32 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Error getting storeURL", "-[WiFiAnalyticsManager _cleanupExistingRetiredStores]");
    goto LABEL_55;
  }
  v5 = -[NSURL URLByAppendingPathComponent:](v4, "URLByAppendingPathComponent:", CFSTR("WiFiNetworkStoreModel.sqlite-wal"));
  if (!v5)
  {
    v32 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Error getting storeWalURL", "-[WiFiAnalyticsManager _cleanupExistingRetiredStores]");
    goto LABEL_55;
  }
  v6 = v5;
  v7 = -[NSURL URLByAppendingPathComponent:](v4, "URLByAppendingPathComponent:", CFSTR("WiFiNetworkStoreModel.sqlite-shm"));
  if (!v7)
  {
    v32 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Error getting storeShmURL", "-[WiFiAnalyticsManager _cleanupExistingRetiredStores]");
LABEL_55:
    objc_autoreleasePoolPop(v32);
    return;
  }
  v8 = v7;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v9)
  {
    v10 = v9;
    v33 = v8;
    v34 = v6;
    v35 = 0;
    v11 = *(_QWORD *)v43;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v2);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v12);
        if (v13
          && objc_msgSend(objc_msgSend((id)v3[422], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v13, "path")))
        {
          v14 = v3;
          v15 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v13);
          if (v15)
          {
            v16 = v15;
            v17 = objc_msgSend(objc_alloc((Class)NSPersistentStoreCoordinator), "initWithManagedObjectModel:", v15);
            if (v17)
            {
              v18 = v17;
              v41 = 0;
              if (objc_msgSend(v17, "destroyPersistentStoreAtURL:withType:options:error:", v36, NSSQLiteStoreType, 0, &v41))v19 = v41 == 0;
              else
                v19 = 0;
              if (v19)
              {
                v35 = 1;
              }
              else
              {
                v20 = objc_autoreleasePoolPush();
                if (qword_10026DD20)
                  objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s failed to destroy store at URL %@ %@", "-[WiFiAnalyticsManager _cleanupExistingRetiredStores]", v13, v41);
                objc_autoreleasePoolPop(v20);
              }

            }
            else
            {
              v22 = objc_autoreleasePoolPush();
              if (qword_10026DD20)
                objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "_persistenceCoordinator is nil");
              objc_autoreleasePoolPop(v22);

            }
          }
          else
          {
            v21 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "failed to create managedObjectModel");
            objc_autoreleasePoolPop(v21);
          }
          v3 = v14;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v23 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      v10 = v23;
    }
    while (v23);
    if ((v35 & 1) != 0)
    {
      v24 = +[NSMutableArray array](NSMutableArray, "array");
      objc_msgSend(v24, "addObject:", v36);
      objc_msgSend(v24, "addObject:", v33);
      objc_msgSend(v24, "addObject:", v34);
      objc_msgSend(v24, "addObjectsFromArray:", v2);
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            if (v29
              && objc_msgSend(objc_msgSend((id)v3[422], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v29, "path")))
            {
              v41 = 0;
              v30 = objc_autoreleasePoolPush();
              if (qword_10026DD20)
                objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "Will remove file at URL %@", v29);
              objc_autoreleasePoolPop(v30);
              objc_msgSend(objc_msgSend((id)v3[422], "defaultManager"), "removeItemAtPath:error:", objc_msgSend(v29, "path"), &v41);
              if (v41)
              {
                v31 = objc_autoreleasePoolPush();
                if (qword_10026DD20)
                  objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "Failed to remove file at URL %@", v29);
                objc_autoreleasePoolPop(v31);
              }
            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        }
        while (v26);
      }
    }
  }
}

- (__WiFiNetwork)_copyCreateEquivalentWiFiNetwork:(id)a3 authFlags:(int64_t)a4
{
  char v4;
  __CFDictionary *Mutable;
  __CFDictionary *v7;
  __WiFiNetwork *v8;
  __WiFiNetwork *v9;
  void *v11;

  if (!a3)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null ssid", "-[WiFiAnalyticsManager _copyCreateEquivalentWiFiNetwork:authFlags:]");
    goto LABEL_17;
  }
  v4 = a4;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null networkRecord", "-[WiFiAnalyticsManager _copyCreateEquivalentWiFiNetwork:authFlags:]");
LABEL_17:
    objc_autoreleasePoolPop(v11);
    return 0;
  }
  v7 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("SSID_STR"), a3);
  v8 = (__WiFiNetwork *)sub_10002B314((uint64_t)kCFAllocatorDefault, v7);
  v9 = v8;
  if ((v4 & 8) != 0)
  {
    sub_1000C5774((uint64_t)v8, 1);
  }
  else if ((v4 & 1) != 0)
  {
    sub_1000C563C((uint64_t)v8, 1);
  }
  else if ((v4 & 4) != 0)
  {
    sub_1000C434C((int)v8, 1, v4 & 2);
  }
  else if ((v4 & 2) != 0)
  {
    sub_1000C44C4((uint64_t)v8, 1);
  }
  sub_10002C478((uint64_t)v9, CFSTR("AP_MODE"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
  CFRelease(v7);
  return v9;
}

- (void)getAdaptiveRoamParams:(__CFString *)a3 ssid:(__CFString *)a4
{
  void *v7;
  _QWORD block[8];
  _QWORD v9[4];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  if (-[WiFiAnalyticsManager roamParamsQueryPending](self, "roamParamsQueryPending"))
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: query already pending", "-[WiFiAnalyticsManager getAdaptiveRoamParams:ssid:]");
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    -[WiFiAnalyticsManager setRoamParamsQueryPending:](self, "setRoamParamsQueryPending:", 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100035E90;
    block[3] = &unk_10022EB98;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = v9;
    dispatch_async((dispatch_queue_t)qword_10026DD40, block);
  }
  _Block_object_dispose(v9, 8);
}

- (id)copyStoredNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  signed int v19;
  __WiFiNetwork *v20;
  __WiFiNetwork *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = *(_QWORD *)&a5;
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v23 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]");
    goto LABEL_22;
  }
  if (!a3)
  {
    v23 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: location is nil", "-[WiFiAnalyticsManager copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]");
LABEL_22:
    objc_autoreleasePoolPop(v23);
    v10 = 0;
    return objc_msgSend(v10, "copy");
  }
  v9 = -[WADeviceAnalyticsClient copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:](-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"), "copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:", a3, v5, a4);
  if (objc_msgSend(v9, "count"))
  {
    v10 = +[NSMutableArray array](NSMutableArray, "array");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      v14 = WADeviceAnalyticsNetworkInfo[0];
      v15 = WADeviceAnalyticsNetworkInfo[1];
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v9);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v18 = objc_msgSend(v17, "objectForKey:", v14);
          v19 = objc_msgSend(objc_msgSend(v17, "objectForKey:", v15), "intValue");
          if (v18)
          {
            v20 = -[WiFiAnalyticsManager _copyCreateEquivalentWiFiNetwork:authFlags:](self, "_copyCreateEquivalentWiFiNetwork:authFlags:", v18, v19);
            if (v20)
            {
              v21 = v20;
              objc_msgSend(v10, "addObject:", v20);
              CFRelease(v21);
            }
          }
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }
  }
  else
  {
    v10 = 0;
  }

  return objc_msgSend(v10, "copy");
}

- (BOOL)copyHigherBandNetworksAvailableAtLocation:(id)a3 intoArray:(id *)a4
{
  id v7;
  double v8;
  BOOL v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v12 = objc_autoreleasePoolPush();
    v13 = (void *)qword_10026DD20;
    if (!qword_10026DD20)
      goto LABEL_24;
    v14 = "%s: deviceAnalyticsClient is nil";
LABEL_17:
    v15 = 4;
LABEL_23:
    objc_msgSend(v13, "WFLog:message:", v15, v14, "-[WiFiAnalyticsManager copyHigherBandNetworksAvailableAtLocation:intoArray:]");
    goto LABEL_24;
  }
  if (!a3)
  {
    v12 = objc_autoreleasePoolPush();
    v13 = (void *)qword_10026DD20;
    if (!qword_10026DD20)
      goto LABEL_24;
    v14 = "%s: location is nil";
    goto LABEL_17;
  }
  v7 = objc_msgSend(a3, "timestamp");
  if (!v7)
  {
    v12 = objc_autoreleasePoolPush();
    v13 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v14 = "%s: location timestamp is nil";
LABEL_22:
      v15 = 3;
      goto LABEL_23;
    }
LABEL_24:
    objc_autoreleasePoolPop(v12);
    LOBYTE(v11) = 0;
    return (char)v11;
  }
  objc_msgSend(v7, "timeIntervalSinceNow");
  if (v8 <= -120.0)
  {
    v12 = objc_autoreleasePoolPush();
    v13 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v14 = "%s: location is older than 120 secs";
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  v9 = v8 <= -60.0 && v8 <= -30.0;
  v10 = 500.0;
  if (!v9)
    v10 = 300.0;
  v11 = -[WiFiAnalyticsManager copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:](self, "copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:", a3, 2, v10);
  if (v11)
  {
    *a4 = v11;
    LOBYTE(v11) = 1;
  }
  return (char)v11;
}

- (unint64_t)isWithin:(double)a3 fromLocation:(id)a4 forNetwork:(__WiFiNetwork *)a5
{
  const void *v9;
  void *v10;

  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    if (a4)
    {
      v9 = sub_10002B088(a5);
      if (v9)
        return (unint64_t)-[WADeviceAnalyticsClient isNetworkWithinRangeOfLocation:range:location:](-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"), "isNetworkWithinRangeOfLocation:range:location:", v9, a4, a3);
      v10 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: ssid is nil", "-[WiFiAnalyticsManager isWithin:fromLocation:forNetwork:]");
    }
    else
    {
      v10 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: location is nil", "-[WiFiAnalyticsManager isWithin:fromLocation:forNetwork:]");
    }
  }
  else
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager isWithin:fromLocation:forNetwork:]");
  }
  objc_autoreleasePoolPop(v10);
  return 0;
}

- (id)copyScoreSortedNetworksAvailableAtLocation:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  __WiFiNetwork *v17;
  __WiFiNetwork *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyScoreSortedNetworksAvailableAtLocation:]");
    goto LABEL_25;
  }
  if (!a3)
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: location is nil", "-[WiFiAnalyticsManager copyScoreSortedNetworksAvailableAtLocation:]");
LABEL_25:
    objc_autoreleasePoolPop(v20);
    v6 = 0;
    return objc_msgSend(v6, "copy");
  }
  v5 = -[WADeviceAnalyticsClient copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:](-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"), "copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:", a3, &stru_10022EBD8, 300.0);
  if (objc_msgSend(v5, "count"))
  {
    v6 = +[NSMutableArray array](NSMutableArray, "array");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      v10 = WADeviceAnalyticsNetworkInfo[0];
      v11 = WADeviceAnalyticsNetworkInfo[1];
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v5);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v14 = objc_msgSend(v13, "objectForKey:", v10);
          v15 = objc_msgSend(v13, "objectForKey:", v11);
          if (v14)
            v16 = v15 == 0;
          else
            v16 = 1;
          if (!v16)
          {
            v17 = -[WiFiAnalyticsManager _copyCreateEquivalentWiFiNetwork:authFlags:](self, "_copyCreateEquivalentWiFiNetwork:authFlags:", v14, v15);
            if (v17)
            {
              v18 = v17;
              objc_msgSend(v6, "addObject:", v17);
              CFRelease(v18);
            }
          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }
  }
  else
  {
    v6 = 0;
  }

  return objc_msgSend(v6, "copy");
}

- (id)copyPreferenceScoreDictionaryForNetwork:(__WiFiNetwork *)a3
{
  WADeviceAnalyticsClient *v5;
  const void *v6;

  v5 = -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient");
  if (a3 && v5 && (v6 = sub_10002B088(a3)) != 0)
    return -[WADeviceAnalyticsClient copyPreferenceScoreDictionaryForNetwork:](-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"), "copyPreferenceScoreDictionaryForNetwork:", v6);
  else
    return 0;
}

- (unsigned)getColocatedStateFromPreferenceScoreDictionary:(id)a3
{
  uint64_t v4;
  unsigned int v5;
  const void *v6;
  int valuePtr;
  void *value;

  v4 = 0;
  v5 = 0;
  do
  {
    value = 0;
    valuePtr = -1;
    if (v4 <= 4)
    {
      v6 = *(const void **)*(&off_10022EC48 + v4);
      if (v6)
      {
        CFDictionaryGetValueIfPresent((CFDictionaryRef)a3, v6, (const void **)&value);
        if (value)
        {
          CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
          if ((valuePtr + 1) >= 2)
            v5 |= 1 << v4;
        }
      }
    }
    ++v4;
  }
  while ((_DWORD)v4 != 5);
  return v5;
}

- (id)copyNetworksAvailableAtLocation:(id)a3
{
  void *v6;

  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    if (a3)
      return -[WiFiAnalyticsManager copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:](self, "copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:", a3, 0, 300.0);
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: location is nil", "-[WiFiAnalyticsManager copyNetworksAvailableAtLocation:]");
  }
  else
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyNetworksAvailableAtLocation:]");
  }
  objc_autoreleasePoolPop(v6);
  return 0;
}

- (id)copyGeoTagsForNetworkAtLocation:(__WiFiNetwork *)a3 location:(id)a4
{
  const void *v7;
  void *v8;

  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    if (a3)
    {
      if (a4)
      {
        v7 = sub_10002B088(a3);
        if (v7)
          return -[WADeviceAnalyticsClient copyGeoTagsForNetwork:location:](-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"), "copyGeoTagsForNetwork:location:", v7, a4);
        v8 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: ssid is nil", "-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]");
      }
      else
      {
        v8 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: location is nil", "-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]");
      }
    }
    else
    {
      v8 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: network is nil", "-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]");
    }
  }
  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]");
  }
  objc_autoreleasePoolPop(v8);
  return 0;
}

- (void)updateNetworkTraitsCache
{
  void *v3;
  _QWORD block[6];
  _QWORD v5[6];

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = sub_10002FA38;
  v5[4] = sub_10002F958;
  v5[5] = self;
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager updateNetworkTraitsCache]");
    goto LABEL_9;
  }
  if (-[WiFiAnalyticsManager traitsCacheUpdateBusy](self, "traitsCacheUpdateBusy"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: cache updates already in progress", "-[WiFiAnalyticsManager updateNetworkTraitsCache]");
LABEL_9:
    objc_autoreleasePoolPop(v3);
    goto LABEL_4;
  }
  -[WiFiAnalyticsManager setTraitsCacheUpdateBusy:](self, "setTraitsCacheUpdateBusy:", 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036D44;
  block[3] = &unk_10022EC00;
  block[4] = self;
  block[5] = v5;
  dispatch_async((dispatch_queue_t)qword_10026DD40, block);
LABEL_4:
  _Block_object_dispose(v5, 8);
}

- (BOOL)isNetworkTraitsCacheValid
{
  double v3;
  double v4;
  void *v5;
  const char *v6;
  char v7;

  if (!-[WiFiAnalyticsManager dateTraitCachesUpdated](self, "dateTraitCachesUpdated"))
    goto LABEL_8;
  -[NSDate timeIntervalSinceDate:](+[NSDate date](NSDate, "date"), "timeIntervalSinceDate:", -[WiFiAnalyticsManager dateTraitCachesUpdated](self, "dateTraitCachesUpdated"));
  v4 = v3;
  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
  {
    v6 = "No";
    if (v4 > 600.0)
      v6 = "Yes";
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Cache needs update: %s. Time difference %.2f", "-[WiFiAnalyticsManager isNetworkTraitsCacheValid]", v6, *(_QWORD *)&v4);
  }
  objc_autoreleasePoolPop(v5);
  if (v4 <= 600.0)
  {
    v7 = 1;
  }
  else
  {
LABEL_8:
    -[WiFiAnalyticsManager updateNetworkTraitsCache](self, "updateNetworkTraitsCache");
    v7 = 0;
  }
  return v7 & !-[WiFiAnalyticsManager traitsCacheUpdateBusy](self, "traitsCacheUpdateBusy");
}

- (BOOL)isMovingNetwork:(__WiFiNetwork *)a3
{
  const void *v5;
  void *v7;

  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager isMovingNetwork:]");
    goto LABEL_9;
  }
  if (!a3)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: network is nil", "-[WiFiAnalyticsManager isMovingNetwork:]");
LABEL_9:
    objc_autoreleasePoolPop(v7);
    return 0;
  }
  v5 = sub_10002B088(a3);
  if (-[WiFiAnalyticsManager isNetworkTraitsCacheValid](self, "isNetworkTraitsCacheValid"))
    return -[NSMutableArray containsObject:](-[WiFiAnalyticsManager movingNetworkSsidsCache](self, "movingNetworkSsidsCache"), "containsObject:", v5);
  return 0;
}

- (BOOL)isOmnipresentNetwork:(__WiFiNetwork *)a3
{
  const void *v5;
  void *v7;

  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager isOmnipresentNetwork:]");
    goto LABEL_9;
  }
  if (!a3)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: network is nil", "-[WiFiAnalyticsManager isOmnipresentNetwork:]");
LABEL_9:
    objc_autoreleasePoolPop(v7);
    return 0;
  }
  v5 = sub_10002B088(a3);
  if (-[WiFiAnalyticsManager isNetworkTraitsCacheValid](self, "isNetworkTraitsCacheValid"))
    return -[NSMutableArray containsObject:](-[WiFiAnalyticsManager omnipresentNetworkSsidsCache](self, "omnipresentNetworkSsidsCache"), "containsObject:", v5);
  return 0;
}

- (BOOL)isHistoricallyBadLinkQualityNetwork:(__WiFiNetwork *)a3
{
  const void *v5;
  void *v7;

  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager isHistoricallyBadLinkQualityNetwork:]");
    goto LABEL_9;
  }
  if (!a3)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: network is nil", "-[WiFiAnalyticsManager isHistoricallyBadLinkQualityNetwork:]");
LABEL_9:
    objc_autoreleasePoolPop(v7);
    return 0;
  }
  v5 = sub_10002B088(a3);
  if (-[WiFiAnalyticsManager isNetworkTraitsCacheValid](self, "isNetworkTraitsCacheValid"))
    return -[NSMutableArray containsObject:](-[WiFiAnalyticsManager historicallyBadLinkQualityNetworkSsidsCache](self, "historicallyBadLinkQualityNetworkSsidsCache"), "containsObject:", v5);
  return 0;
}

- (id)copyAllStoredNetworkSsids
{
  void *v4;

  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
    return -[WADeviceAnalyticsClient copyAllStoredNetworkSsids](-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"), "copyAllStoredNetworkSsids");
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyAllStoredNetworkSsids]");
  objc_autoreleasePoolPop(v4);
  return 0;
}

- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3
{
  void *v6;

  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    if (a3)
      return -[WADeviceAnalyticsClient copyAllStoredNetworkSsidsWithColocatedScopeId:](-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"), "copyAllStoredNetworkSsidsWithColocatedScopeId:", a3);
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: colocatedScopeIdStr is nil", "-[WiFiAnalyticsManager copyAllStoredNetworkSsidsWithColocatedScopeId:]");
  }
  else
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyAllStoredNetworkSsidsWithColocatedScopeId:]");
  }
  objc_autoreleasePoolPop(v6);
  return 0;
}

- (id)copyColocatedScopeIdForNetwork:(__WiFiNetwork *)a3
{
  const void *v5;
  void *v6;

  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v5 = sub_10002B088(a3);
    if (a3)
      return -[WADeviceAnalyticsClient copyColocatedScopeIdForSsid:](-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"), "copyColocatedScopeIdForSsid:", v5);
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: ssid is nil", "-[WiFiAnalyticsManager copyColocatedScopeIdForNetwork:]");
  }
  else
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyColocatedScopeIdForNetwork:]");
  }
  objc_autoreleasePoolPop(v6);
  return 0;
}

- (__WiFiNetwork)copyColocatedScopeTransitionNetwork:(__WiFiNetwork *)a3 minRssi:(int)a4 maxRssi:(int)a5 band:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v11;
  const void *v12;
  const void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __WiFiNetwork *v19;
  void *v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v23, v24, v25, v26);
    goto LABEL_23;
  }
  if (!a3)
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: network is nil", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v23, v24, v25, v26);
    goto LABEL_23;
  }
  v11 = sub_10002B088(a3);
  v12 = sub_10002BE64((uint64_t)a3, CFSTR("BSSID"));
  if (!v12)
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: bssid is nil", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v23, v24, v25, v26);
    goto LABEL_23;
  }
  v13 = v12;
  v14 = -[WADeviceAnalyticsClient copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:](-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"), "copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:", v11, v12, v8, v7, v6);
  if (!v14)
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: No transition info for %@[%@] in [%d,%d)", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v11, v13, v7, v8);
LABEL_23:
    objc_autoreleasePoolPop(v22);
    return 0;
  }
  v15 = v14;
  v16 = WADeviceAnalyticsNetworkTransitionInfo[0];
  if (objc_msgSend(v14, "objectForKey:", WADeviceAnalyticsNetworkTransitionInfo[0]))
  {
    v17 = WADeviceAnalyticsNetworkTransitionInfo[1];
    if (objc_msgSend(v15, "objectForKey:", v17))
    {
      v18 = WADeviceAnalyticsNetworkTransitionInfo[2];
      if (objc_msgSend(v15, "objectForKey:", v18))
      {
        if (objc_msgSend(v15, "objectForKey:", v16))
          v19 = -[WiFiAnalyticsManager _copyCreateEquivalentWiFiNetwork:authFlags:](self, "_copyCreateEquivalentWiFiNetwork:authFlags:", objc_msgSend(v15, "objectForKey:", v16), (int)objc_msgSend(objc_msgSend(v15, "objectForKey:", v18), "intValue"));
        else
          v19 = 0;
        sub_10002C478((uint64_t)v19, CFSTR("BSSID"), objc_msgSend(v15, "objectForKey:", v17));
        v20 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Received %@", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v19);
        goto LABEL_13;
      }
      v20 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: No authFlags in transition info for %@[%@] in [%d,%d)", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v11, v13, v8, v7);
    }
    else
    {
      v20 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: No BSSID in transition info for %@[%@] in [%d,%d)", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v11, v13, v8, v7);
    }
  }
  else
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: No SSID in transition info for %@[%@] in [%d,%d)", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v11, v13, v8, v7);
  }
  v19 = 0;
LABEL_13:
  objc_autoreleasePoolPop(v20);
  CFRelease(v15);
  return v19;
}

- (id)getNetworkUsageDictionary:(__WiFiNetwork *)a3
{
  const void *v5;
  id v6;
  id v7;
  NSDate *v8;
  uint64_t v9;
  NSDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[11];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  _QWORD v31[4];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _QWORD v40[3];
  _QWORD v41[3];

  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = sub_10002FA38;
  v29 = sub_10002F958;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = sub_10002FA38;
  v23 = sub_10002F958;
  v24 = 0;
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v17 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: deviceAnalyticsClient is nil", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]");
    goto LABEL_29;
  }
  if (!a3)
  {
    v17 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: network is nil", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]");
    goto LABEL_29;
  }
  v5 = sub_10002B088(a3);
  if (!v5)
  {
    v17 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: givenSsid is nil", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]");
LABEL_29:
    objc_autoreleasePoolPop(v17);
    goto LABEL_22;
  }
  v6 = +[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100037CE0;
  v18[3] = &unk_10022EC28;
  v18[6] = v31;
  v18[7] = &v32;
  v18[4] = v6;
  v18[5] = v5;
  v18[8] = &v19;
  v18[9] = &v36;
  v18[10] = &v25;
  -[NSMutableArray enumerateObjectsUsingBlock:](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "enumerateObjectsUsingBlock:", v18);
  if (!*((_BYTE *)v37 + 24))
  {
    v7 = -[WADeviceAnalyticsClient copyNetworkUsageDictionary:](-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"), "copyNetworkUsageDictionary:", sub_10002B088(a3));
    v26[5] = (uint64_t)v7;
    if (v7)
    {
      v41[0] = v5;
      v40[0] = CFSTR("cachedSsid");
      v40[1] = CFSTR("cachedDate");
      v8 = +[NSDate now](NSDate, "now");
      v40[2] = CFSTR("cachedUsageDict");
      v9 = v26[5];
      v41[1] = v8;
      v41[2] = v9;
      v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
      if ((unint64_t)-[NSMutableArray count](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "count") >= 5)
      {
        if ((objc_msgSend(v6, "containsIndex:", v33[3]) & 1) == 0)
        {
          v11 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Will remove object from usageCache for ssid %@", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]", v20[5]);
          objc_autoreleasePoolPop(v11);
          objc_msgSend(v6, "addIndex:", v33[3]);
        }
        if (!objc_msgSend(v6, "count"))
        {
          v12 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: No objects to remove from full usageCache!?", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]");
          objc_autoreleasePoolPop(v12);
        }
        if (objc_msgSend(v6, "count"))
        {
          -[NSMutableArray removeObjectsAtIndexes:](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "removeObjectsAtIndexes:", v6);
          v13 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Removed %u objects from usageCache. CurrSize: %u ", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]", objc_msgSend(v6, "count"), -[NSMutableArray count](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "count"));
          objc_autoreleasePoolPop(v13);
        }
      }
      -[NSMutableArray addObject:](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "addObject:", v10);
      v14 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Added usage for %@ to usageCache. CurrSize: %u", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]", v5, -[NSMutableArray count](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "count"));
      objc_autoreleasePoolPop(v14);

    }
  }
LABEL_22:
  v15 = (void *)v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  return v15;
}

- (BOOL)roamParamsQueryPending
{
  return self->_roamParamsQueryPending;
}

- (void)setRoamParamsQueryPending:(BOOL)a3
{
  self->_roamParamsQueryPending = a3;
}

- (__WiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManager *)a3
{
  self->_wifiManager = a3;
}

- (double)managerInitTime
{
  return self->_managerInitTime;
}

- (void)setManagerInitTime:(double)a3
{
  self->_managerInitTime = a3;
}

- (void)setDeviceAnalyticsClient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)movingNetworkSsidsCache
{
  return self->_movingNetworkSsidsCache;
}

- (void)setMovingNetworkSsidsCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)omnipresentNetworkSsidsCache
{
  return self->_omnipresentNetworkSsidsCache;
}

- (void)setOmnipresentNetworkSsidsCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)historicallyBadLinkQualityNetworkSsidsCache
{
  return self->_historicallyBadLinkQualityNetworkSsidsCache;
}

- (void)setHistoricallyBadLinkQualityNetworkSsidsCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)usageCache
{
  return self->_usageCache;
}

- (void)setUsageCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSDate)dateTraitCachesUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDateTraitCachesUpdated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)traitsCacheUpdateBusy
{
  return self->_traitsCacheUpdateBusy;
}

- (void)setTraitsCacheUpdateBusy:(BOOL)a3
{
  self->_traitsCacheUpdateBusy = a3;
}

@end
