@implementation MapsOfflineUIHelper

+ (int64_t)idealDisplayAspectRatio:(id)a3
{
  double v3;
  double v4;
  double v5;

  GEOMapRectForMapRegion(a3, a2);
  v5 = v3 / v4;
  if (v3 / v4 <= GEOConfigGetDouble(MapsConfig_OfflineRegionAspectRatioThresholdWide, off_1014B4FB8))
    return v5 < GEOConfigGetDouble(MapsConfig_OfflineRegionAspectRatioThresholdTall, off_1014B4FC8);
  else
    return 2;
}

+ (MapsOfflineUIHelper)sharedHelper
{
  if (qword_1014D3420 != -1)
    dispatch_once(&qword_1014D3420, &stru_1011C9270);
  return (MapsOfflineUIHelper *)(id)qword_1014D3418;
}

- (MapsOfflineUIHelper)init
{
  MapsOfflineUIHelper *v2;
  MapsOfflineUIHelper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsOfflineUIHelper;
  v2 = -[MapsOfflineUIHelper init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MapsOfflineUIHelper _commonInit](v2, "_commonInit");
  return v3;
}

- (void)_commonInit
{
  GEOObserverHashTable *v3;
  GEOObserverHashTable *observers;
  void *v5;
  id v6;
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD handler[4];
  id v19;
  id location;

  v3 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___MapsOfflineUIObserver, &_dispatch_main_q);
  observers = self->_observers;
  self->_observers = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  self->_usingOfflineMaps = objc_msgSend(v5, "isUsingOffline");

  v6 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
  -[MapsOfflineUIHelper setSubscriptionManager:](self, "setSubscriptionManager:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_offlineServiceStateChanged", GEOOfflineStateChangedNotification, 0);

  objc_initWeak(&location, self);
  v8 = (const char *)GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1007E6F30;
  handler[3] = &unk_1011BCB28;
  objc_copyWeak(&v19, &location);
  notify_register_dispatch(v8, &self->_subscriptionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  -[MapsOfflineUIHelper _reloadSubscriptions](self, "_reloadSubscriptions");
  v9 = (const char *)GEOOfflineDataActiveVersionsDidChangeDarwinNotification;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1007E6F60;
  v16[3] = &unk_1011BCB28;
  objc_copyWeak(&v17, &location);
  notify_register_dispatch(v9, &self->_activeVersionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v16);

  v10 = (const char *)GEOMapDataSubscriptionManagerPairedDeviceOfflineLastUpdatedDateDidChangeDarwinNotification;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1007E6F90;
  v14[3] = &unk_1011BCB28;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch(v10, &self->_pairedDeviceLastUpdatedChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v14);

  -[MapsOfflineUIHelper _reloadLastUpdatedDates](self, "_reloadLastUpdatedDates");
  v11 = (const char *)GEOMapDataSubscriptionManagerPairedDeviceSubscriptionsDidChangeDarwinNotification;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1007E6FC0;
  v12[3] = &unk_1011BCB28;
  objc_copyWeak(&v13, &location);
  notify_register_dispatch(v11, &self->_pairedDeviceSubscriptionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_subscriptionsChangedNotifyToken);
  self->_subscriptionsChangedNotifyToken = -1;
  notify_cancel(self->_activeVersionsChangedNotifyToken);
  self->_activeVersionsChangedNotifyToken = -1;
  notify_cancel(self->_pairedDeviceLastUpdatedChangedNotifyToken);
  self->_pairedDeviceLastUpdatedChangedNotifyToken = -1;
  notify_cancel(self->_pairedDeviceSubscriptionsChangedNotifyToken);
  self->_pairedDeviceSubscriptionsChangedNotifyToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)MapsOfflineUIHelper;
  -[MapsOfflineUIHelper dealloc](&v3, "dealloc");
}

- (void)setUsingOfflineMaps:(BOOL)a3
{
  _BOOL4 usingOfflineMaps;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  __CFString *v15;

  usingOfflineMaps = self->_usingOfflineMaps;
  if (usingOfflineMaps != a3)
  {
    self->_usingOfflineMaps = a3;
    v5 = sub_100431D5C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (usingOfflineMaps)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      if (self->_usingOfflineMaps)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = v9;
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[MapsOfflineUIHelper] posting UsingOfflineMapsStateChangedNotification, wasUsingOfflineMaps: %{public}@, isUsingOfflineMaps: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("UsingOfflineMapsStateChangedNotification"), self);

  }
}

- (void)_updateUsingOfflineMaps
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  v4 = objc_msgSend(v3, "isUsingOffline");

  -[MapsOfflineUIHelper setUsingOfflineMaps:](self, "setUsingOfflineMaps:", v4);
}

- (void)_offlineServiceStateChanged
{
  -[MapsOfflineUIHelper _updateUsingOfflineMaps](self, "_updateUsingOfflineMaps");
}

- (BOOL)isUsingForcedOfflineMaps
{
  void *v2;
  unsigned __int16 v3;
  int v4;
  int v5;
  BOOL v6;
  const char *v8;
  int v10;
  int v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  v3 = (unsigned __int16)objc_msgSend(v2, "state");
  v4 = v3;
  if (v3 < 2u)
    goto LABEL_9;
  if (v3 != 2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    v10 = 67109120;
    v11 = v4;
    v8 = "Unreachable reached: invalid offline mode value %x";
    goto LABEL_12;
  }
  v5 = HIBYTE(v3);
  if (HIBYTE(v3) >= 3u)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
LABEL_9:
      v6 = 0;
      goto LABEL_10;
    }
    v10 = 67109120;
    v11 = v5;
    v8 = "Unreachable reached: invalid offline reason value %x";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 8u);
    goto LABEL_9;
  }
  v6 = (v3 & 0x700) == 512;
LABEL_10:

  return v6;
}

- (void)addObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)addSubscriptionWithRegion:(id)a3 name:(id)a4 completion:(id)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];

  v32 = a3;
  v8 = a4;
  v31 = a5;
  v33 = v8;
  v9 = 1;
LABEL_2:
  if (v9 <= 1)
  {
    v12 = v33;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OFFLINE_REGION_NAME_DUPLICATE_FORMAT"), CFSTR("localized string not found"), CFSTR("Offline")));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v33, v9));

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptions](self, "subscriptions"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayName"));
        if (v19)
        {
          v20 = (void *)v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayName"));
          v22 = objc_msgSend(v21, "isEqualToString:", v12);

          if ((v22 & 1) != 0)
          {

            ++v9;
            goto LABEL_2;
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v15)
        continue;
      break;
    }
  }

  if ((objc_msgSend(v12, "isEqualToString:", v33) & 1) == 0)
  {
    v23 = sub_100431D5C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478083;
      v42 = v33;
      v43 = 2113;
      v44 = v12;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "A region already exists with the name '%{private}@'. Using '%{private}@' instead", buf, 0x16u);
    }

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.Maps.offline."), v26));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1007E76A4;
  v34[3] = &unk_1011BF0D8;
  v35 = v27;
  v36 = v31;
  v29 = v27;
  v30 = v31;
  objc_msgSend(v28, "addSubscriptionWithIdentifier:dataTypes:policy:region:displayName:expirationDate:callbackQueue:completionHandler:", v29, 1024, 1, v32, v12, 0, &_dispatch_main_q, v34);

}

- (void)pauseDownloadForSubscriptionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscription"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  objc_msgSend(v7, "cancelDownloadForSubscriptionIdentifier:", v6);

}

- (void)resumeDownloadForSubscriptionInfo:(id)a3 mode:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscription"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  objc_msgSend(v9, "startDownloadForSubscriptionIdentifier:mode:", v8, a4);

}

- (void)resumeDownloadForSubscriptionWithIdentifier:(id)a3 mode:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  objc_msgSend(v7, "startDownloadForSubscriptionIdentifier:mode:", v6, a4);

}

- (void)restoreExpiredSubscription:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v10 = objc_msgSend(v6, "dataTypes");
  v11 = objc_msgSend(v6, "policy");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "region"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1007E7968;
  v16[3] = &unk_1011B9908;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v8, "addSubscriptionWithIdentifier:dataTypes:policy:region:displayName:expirationDate:callbackQueue:completionHandler:", v9, v10, v11, v12, v13, 0, &_dispatch_main_q, v16);

}

- (void)updateRegion:(id)a3 forSubscriptionInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "subscription"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  v12 = objc_msgSend(v16, "dataTypes");
  v13 = objc_msgSend(v16, "policy");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "expirationDate"));
  objc_msgSend(v10, "addSubscriptionWithIdentifier:dataTypes:policy:region:displayName:expirationDate:callbackQueue:completionHandler:", v11, v12, v13, v9, v14, v15, &_dispatch_main_q, v8);

}

- (void)updateName:(id)a3 forSubscriptionInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "subscription"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  v12 = objc_msgSend(v16, "dataTypes");
  v13 = objc_msgSend(v16, "policy");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "region"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "expirationDate"));
  objc_msgSend(v10, "addSubscriptionWithIdentifier:dataTypes:policy:region:displayName:expirationDate:callbackQueue:completionHandler:", v11, v12, v13, v14, v9, v15, &_dispatch_main_q, v8);

}

- (id)determineEstimatedSizeForSubscriptionWithRegion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "determineEstimatedSizeForSubscriptionWithRegion:dataTypes:queue:completionHandler:", v7, 1024, &_dispatch_main_q, v6));

  return v9;
}

- (void)getAvailableDiskSpaceForPairedDeviceWithCompletionHandler:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  void (**v10)(id, id, _QWORD);
  id v11;
  id location;

  v4 = (void (**)(id, id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper availableDiskSpaceForPairedDevice](self, "availableDiskSpaceForPairedDevice"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper availableDiskSpaceForPairedDevice](self, "availableDiskSpaceForPairedDevice"));
    v4[2](v4, objc_msgSend(v6, "longLongValue"), 0);

  }
  else
  {
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
    v8 = &_dispatch_main_q;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1007E7E28;
    v9[3] = &unk_1011C9298;
    v10 = v4;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v7, "fetchAvailableDiskSpaceForPairedDeviceOfflineSubscriptionsWithQueue:completionHandler:", &_dispatch_main_q, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)_subscriptionsDidChange
{
  GEOObserverHashTable *observers;
  void *v4;

  observers = self->_observers;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionInfos](self, "subscriptionInfos"));
  -[GEOObserverHashTable subscriptionInfosDidChange:](observers, "subscriptionInfosDidChange:", v4);

  -[MapsOfflineUIHelper _postSubscriptionsDidChangeNotification](self, "_postSubscriptionsDidChangeNotification");
}

- (void)_postSubscriptionsDidChangeNotification
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("OfflineMapsSubscriptionsDidChangeNotification"), self);

}

- (void)setOutOfDateSubscriptionsCount:(unint64_t)a3
{
  unint64_t outOfDateSubscriptionsCount;

  outOfDateSubscriptionsCount = self->_outOfDateSubscriptionsCount;
  if (outOfDateSubscriptionsCount != a3)
  {
    self->_outOfDateSubscriptionsCount = a3;
    if ((a3 != 0) == (outOfDateSubscriptionsCount == 0))
      -[GEOObserverHashTable subscriptionsNeedUpdatingDidChange:](self->_observers, "subscriptionsNeedUpdatingDidChange:", a3 != 0);
  }
}

- (void)setFullyLoadedSubscriptionsCount:(unint64_t)a3
{
  unint64_t fullyLoadedSubscriptionsCount;

  fullyLoadedSubscriptionsCount = self->_fullyLoadedSubscriptionsCount;
  if (fullyLoadedSubscriptionsCount != a3)
  {
    self->_fullyLoadedSubscriptionsCount = a3;
    if ((a3 != 0) == (fullyLoadedSubscriptionsCount == 0))
      -[GEOObserverHashTable hasFullyLoadedSubscriptionsDidChange:](self->_observers, "hasFullyLoadedSubscriptionsDidChange:", a3 != 0);
  }
}

- (BOOL)hasFullyLoadedSubscriptions
{
  return self->_fullyLoadedSubscriptionsCount != 0;
}

- (BOOL)hasSubscriptionsNeedingUpdate
{
  return self->_outOfDateSubscriptionsCount != 0;
}

- (void)_startedUpdatingSubscription:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *updatingSubscriptions;
  unsigned int v6;
  _BOOL8 v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    if (!self->_updatingSubscriptions)
    {
      v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      updatingSubscriptions = self->_updatingSubscriptions;
      self->_updatingSubscriptions = v4;

    }
    v6 = -[MapsOfflineUIHelper hasSubscriptionsBeingUpdated](self, "hasSubscriptionsBeingUpdated");
    -[NSMutableSet addObject:](self->_updatingSubscriptions, "addObject:", v8);
    v7 = -[MapsOfflineUIHelper hasSubscriptionsBeingUpdated](self, "hasSubscriptionsBeingUpdated");
    if (v6 != v7)
      -[GEOObserverHashTable subscriptionsBeingUpdatedDidChange:](self->_observers, "subscriptionsBeingUpdatedDidChange:", v7);
  }

}

- (void)_stoppedUpdatingSubscription:(id)a3
{
  unsigned int v4;
  _BOOL8 v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = -[MapsOfflineUIHelper hasSubscriptionsBeingUpdated](self, "hasSubscriptionsBeingUpdated");
    -[NSMutableSet removeObject:](self->_updatingSubscriptions, "removeObject:", v6);
    v5 = -[MapsOfflineUIHelper hasSubscriptionsBeingUpdated](self, "hasSubscriptionsBeingUpdated");
    if (v4 != v5)
    {
      -[GEOObserverHashTable subscriptionsBeingUpdatedDidChange:](self->_observers, "subscriptionsBeingUpdatedDidChange:", v5);
      -[MapsOfflineUIHelper _updateTotalDataSize](self, "_updateTotalDataSize");
    }
  }

}

- (void)setUpdatingSubscriptions:(id)a3
{
  unsigned int v5;
  _BOOL8 v6;
  NSMutableSet *v7;

  v7 = (NSMutableSet *)a3;
  if (self->_updatingSubscriptions != v7 && (-[NSMutableSet isEqual:](v7, "isEqual:") & 1) == 0)
  {
    v5 = -[MapsOfflineUIHelper hasSubscriptionsBeingUpdated](self, "hasSubscriptionsBeingUpdated");
    objc_storeStrong((id *)&self->_updatingSubscriptions, a3);
    v6 = -[MapsOfflineUIHelper hasSubscriptionsBeingUpdated](self, "hasSubscriptionsBeingUpdated");
    if (v5 != v6)
      -[GEOObserverHashTable subscriptionsBeingUpdatedDidChange:](self->_observers, "subscriptionsBeingUpdatedDidChange:", v6);
  }

}

- (BOOL)hasSubscriptionsBeingUpdated
{
  return -[NSMutableSet count](self->_updatingSubscriptions, "count") != 0;
}

- (void)forceUpdateAllSubscriptionsWithMode:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  objc_msgSend(v4, "forceUpdateForUserInitiatedSubscriptionsForDataType:mode:", 1024, a3);

}

- (void)_reloadLastUpdatedDates
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v4 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007E8350;
  v8[3] = &unk_1011C92C0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v3, "fetchLastUpdatedDateForPairedDeviceOfflineSubscriptionsWithQueue:completionHandler:", &_dispatch_main_q, v8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007E845C;
  v6[3] = &unk_1011C92C0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "fetchLastUpdatedDateForOfflineSubscriptionsWithQueue:completionHandler:", &_dispatch_main_q, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_reloadSubscriptions
{
  -[MapsOfflineUIHelper _reloadSubscriptionInfosWithCompletion:](self, "_reloadSubscriptionInfosWithCompletion:", 0);
  -[MapsOfflineUIHelper _updateExpiredSubscriptionsCount](self, "_updateExpiredSubscriptionsCount");
  -[MapsOfflineUIHelper _updateTotalDataSize](self, "_updateTotalDataSize");
}

- (void)_reloadSubscriptionInfosWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;
  void *v14;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@*"), CFSTR("com.apple.Maps.offline.")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v14 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v8 = &_dispatch_main_q;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007E8734;
  v10[3] = &unk_1011C0B68;
  objc_copyWeak(&v12, &location);
  v9 = v4;
  v10[4] = self;
  v11 = v9;
  objc_msgSend(v6, "fetchSubscriptionsWithIdentifiers:callbackQueue:completionHandler:", v7, &_dispatch_main_q, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_updateExpiredSubscriptionsCount
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007E9168;
  v5[3] = &unk_1011AD9D0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "fetchAllExpiredSubscriptionsWithCallbackQueue:completionHandler:", &_dispatch_main_q, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)hasExpiredSubscriptions
{
  return -[MapsOfflineUIHelper expiredSubscriptionsCount](self, "expiredSubscriptionsCount") != 0;
}

- (void)_updateTotalDataSize
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007E92CC;
  v5[3] = &unk_1011C9350;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:completionHandler:", &_dispatch_main_q, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setSubscriptionInfos:(id)a3
{
  NSArray *v4;
  NSArray *subscriptionInfos;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v4 = (NSArray *)a3;
  subscriptionInfos = self->_subscriptionInfos;
  if (subscriptionInfos != v4)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = subscriptionInfos;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          -[MapsOfflineUIHelper removeKVOForSubscriptionInfo:](self, "removeKVOForSubscriptionInfo:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v10));
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }

    v11 = (NSArray *)-[NSArray copy](v4, "copy");
    v12 = self->_subscriptionInfos;
    self->_subscriptionInfos = v11;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = self->_subscriptionInfos;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          -[MapsOfflineUIHelper addKVOForSubscriptionInfo:](self, "addKVOForSubscriptionInfo:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), (_QWORD)v18);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

  }
}

- (void)startMonitoringPairedDeviceSubscriptionStates
{
  -[MapsOfflineUIHelper setPairedDeviceSubscriptionStatesMonitorCount:](self, "setPairedDeviceSubscriptionStatesMonitorCount:", (char *)-[MapsOfflineUIHelper pairedDeviceSubscriptionStatesMonitorCount](self, "pairedDeviceSubscriptionStatesMonitorCount")+ 1);
}

- (void)stopMonitoringPairedDeviceSubscriptionStates
{
  -[MapsOfflineUIHelper setPairedDeviceSubscriptionStatesMonitorCount:](self, "setPairedDeviceSubscriptionStatesMonitorCount:", (char *)-[MapsOfflineUIHelper pairedDeviceSubscriptionStatesMonitorCount](self, "pairedDeviceSubscriptionStatesMonitorCount")- 1);
}

- (void)setPairedDeviceSubscriptionStatesMonitorCount:(int64_t)a3
{
  int64_t pairedDeviceSubscriptionStatesMonitorCount;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];

  if (a3 < 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: count >= 0", buf, 2u);
    }
  }
  else
  {
    pairedDeviceSubscriptionStatesMonitorCount = self->_pairedDeviceSubscriptionStatesMonitorCount;
    if (pairedDeviceSubscriptionStatesMonitorCount != a3)
    {
      self->_pairedDeviceSubscriptionStatesMonitorCount = a3;
      if ((a3 != 0) == pairedDeviceSubscriptionStatesMonitorCount < 1)
      {
        v6 = sub_100431D5C();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
        if (a3)
        {
          if (v8)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MapsOfflineUIHelper] start monitoring paired device subscription states", buf, 2u);
          }

          -[MapsOfflineUIHelper _reloadPairedDeviceSubscriptionInfos](self, "_reloadPairedDeviceSubscriptionInfos");
        }
        else
        {
          if (v8)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[MapsOfflineUIHelper] stop monitoring paired device subscription states", buf, 2u);
          }

          v16 = 0u;
          v17 = 0u;
          v14 = 0u;
          v15 = 0u;
          v9 = self->_subscriptionInfos;
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v15;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v15 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "setPairedDeviceState:", 0, (_QWORD)v14);
                v13 = (char *)v13 + 1;
              }
              while (v11 != v13);
              v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
            }
            while (v11);
          }

        }
      }
    }
  }
}

- (void)_reloadPairedDeviceSubscriptionInfos
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007E97F4;
  v5[3] = &unk_1011ADF70;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v3, "fetchSubscriptionIdentifiersToSyncToPairedDeviceWithQueue:completionHandler:", &_dispatch_main_q, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setSubscriptionInfo:(id)a3 shouldSyncToPairedDevice:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionManager](self, "subscriptionManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subscription"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  objc_msgSend(v12, "setSubscriptionWithIdentifier:shouldSyncToPairedDevice:callbackQueue:completionHandler:", v11, v5, &_dispatch_main_q, v8);

}

- (void)addKVOForSubscriptionInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  if (qword_1014D3428 != -1)
    dispatch_once(&qword_1014D3428, &stru_1011C9398);
  v5 = (id)qword_1014D3430;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "state", (_QWORD)v12));
        objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, v10, 3, off_1014B20B8);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)removeKVOForSubscriptionInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  if (qword_1014D3428 != -1)
    dispatch_once(&qword_1014D3428, &stru_1011C9398);
  v5 = (id)qword_1014D3430;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "state", (_QWORD)v12));
        objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, v10, off_1014B20B8);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  objc_super v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  MapsOfflineUIHelper *v22;
  id v23;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1014B20B8 != a6)
    goto LABEL_7;
  v13 = objc_opt_class(GEOMapDataSubscriptionState);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0)
    goto LABEL_7;
  if (qword_1014D3428 != -1)
    dispatch_once(&qword_1014D3428, &stru_1011C9398);
  if (objc_msgSend((id)qword_1014D3430, "containsObject:", v10))
  {
    v14 = objc_msgSend(v12, "copy");
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007EA1F0;
    block[3] = &unk_1011C9378;
    objc_copyWeak(&v23, &location);
    v18 = v11;
    v19 = v10;
    v20 = v12;
    v21 = v14;
    v22 = self;
    v15 = v14;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_7:
    v16.receiver = self;
    v16.super_class = (Class)MapsOfflineUIHelper;
    -[MapsOfflineUIHelper observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (BOOL)isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = MapsConfig_OfflineRegionDownloadedAreaCoverageRequirement;
  v7 = off_1014B4F38;
  v8 = a3;
  LOBYTE(v4) = -[MapsOfflineUIHelper isRegionDownloaded:requireFullyDownloaded:coverageRequirement:](self, "isRegionDownloaded:requireFullyDownloaded:coverageRequirement:", v8, v4, GEOConfigGetDouble(v6, v7));

  return v4;
}

- (BOOL)isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4 coverageRequirement:(double)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionInfos](self, "subscriptionInfos"));
  LOBYTE(v6) = -[MapsOfflineUIHelper _isRegionDownloaded:requireFullyDownloaded:coverageRequirement:forSubscriptionInfos:](self, "_isRegionDownloaded:requireFullyDownloaded:coverageRequirement:forSubscriptionInfos:", v8, v6, v9, a5);

  return v6;
}

- (BOOL)_isRegionDownloaded:(id)a3 requireFullyDownloaded:(BOOL)a4 coverageRequirement:(double)a5 forSubscriptionInfos:(id)a6
{
  _BOOL4 v7;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  double *v29;
  unint64_t v30;
  double *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v7 = a4;
  v9 = a6;
  v11 = GEOMapRectForMapRegion(a3, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v40;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v23);
        if (!v7
          || (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1)
                                                                                 + 8 * (_QWORD)v23), "state", (_QWORD)v39)),
              v26 = objc_msgSend(v25, "loadState"),
              v25,
              v26))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subscription", (_QWORD)v39));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "region"));
          objc_msgSend(v18, "addObject:", v28);

        }
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v21);
  }

  v29 = (double *)malloc_type_malloc(32 * (_QWORD)objc_msgSend(v18, "count"), 0x1000040E0EAB150uLL);
  if (objc_msgSend(v18, "count"))
  {
    v30 = 0;
    v31 = v29 + 2;
    do
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v30, (_QWORD)v39));
      *(v31 - 2) = GEOMapRectForMapRegion(v32, v33);
      *((_QWORD *)v31 - 1) = v34;
      *(_QWORD *)v31 = v35;
      *((_QWORD *)v31 + 1) = v36;
      v31 += 4;

      ++v30;
    }
    while (v30 < (unint64_t)objc_msgSend(v18, "count"));
  }
  v37 = GEOMapRectFractionCoveredByMapRects(v29, objc_msgSend(v18, "count", (_QWORD)v39), v11, v13, v15, v17);
  free(v29);

  return v37 >= a5;
}

- (id)subscriptionInfoForRegion:(id)a3
{
  return -[MapsOfflineUIHelper subscriptionInfoForRegion:requireContainment:](self, "subscriptionInfoForRegion:requireContainment:", a3, 0);
}

- (id)subscriptionInfoForRegion:(id)a3 requireContainment:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (-[MapsOfflineUIHelper isRegionDownloaded:requireFullyDownloaded:](self, "isRegionDownloaded:requireFullyDownloaded:", v6, 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionInfos](self, "subscriptionInfos"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper _subscriptionInfoForRegion:requireContainment:fromSubscriptionInfos:](self, "_subscriptionInfoForRegion:requireContainment:fromSubscriptionInfos:", v6, v4, v7));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_subscriptionInfoForRegion:(id)a3 requireContainment:(BOOL)a4 fromSubscriptionInfos:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v6 = a3;
  v7 = a5;
  v9 = GEOMapRectForMapRegion(v6, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v43;
    v41 = 0.0;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "subscription"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "region"));
        v26 = GEOMapRectForMapRegion(v24, v25);
        v28 = v27;
        v30 = v29;
        v32 = v31;

        v33 = GEOMapRectIntersection(v9, v11, v13, v15, v26, v28, v30, v32);
        v35 = v34;
        v37 = v36;
        if ((GEOMapRectIsNull(v33) & 1) == 0)
        {
          if (GEOMapRectIsEmpty(v9, v11, v13, v15))
            v38 = 1.0;
          else
            v38 = v35 * v37;
          if (v38 > v41)
          {
            v39 = v22;

            v19 = v39;
            v41 = v38;
          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (int64_t)cellularBehaviorForDownloadOfSize:(int64_t)a3 forForcedDownload:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  unsigned int v8;
  unsigned __int8 v9;
  int64_t result;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
  v8 = objc_msgSend(v7, "isCellConnection");

  if (!v8)
    return 0;
  if ((GEOConfigGetBOOL(MapsConfig_OfflineMapDownloadsAllowCellular, off_1014B4F48) & 1) == 0)
    return v4;
  v9 = -[MapsOfflineUIHelper hasSubscriptionsNeedingUpdate](self, "hasSubscriptionsNeedingUpdate");
  result = 1;
  if ((a3 & 0x8000000000000000) == 0 && (v9 & 1) == 0)
  {
    if (GEOConfigGetUInteger(MapsConfig_OfflineMapCellularDownloadPromptSizeThreshold, off_1014B4F58) <= (unint64_t)a3)
      return 1;
    else
      return 2;
  }
  return result;
}

- (BOOL)isUsingOfflineMaps
{
  return self->_usingOfflineMaps;
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)subscriptionInfos
{
  return self->_subscriptionInfos;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSDate)lastUpdatedDateForPairedDevice
{
  return self->_lastUpdatedDateForPairedDevice;
}

- (unint64_t)totalOfflineDataSize
{
  return self->_totalOfflineDataSize;
}

- (void)setTotalOfflineDataSize:(unint64_t)a3
{
  self->_totalOfflineDataSize = a3;
}

- (GEOMapDataSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionManager, a3);
}

- (unint64_t)outOfDateSubscriptionsCount
{
  return self->_outOfDateSubscriptionsCount;
}

- (unint64_t)fullyLoadedSubscriptionsCount
{
  return self->_fullyLoadedSubscriptionsCount;
}

- (NSMutableSet)updatingSubscriptions
{
  return self->_updatingSubscriptions;
}

- (unint64_t)expiredSubscriptionsCount
{
  return self->_expiredSubscriptionsCount;
}

- (void)setExpiredSubscriptionsCount:(unint64_t)a3
{
  self->_expiredSubscriptionsCount = a3;
}

- (NSNumber)availableDiskSpaceForPairedDevice
{
  return self->_availableDiskSpaceForPairedDevice;
}

- (void)setAvailableDiskSpaceForPairedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_availableDiskSpaceForPairedDevice, a3);
}

- (int64_t)pairedDeviceSubscriptionStatesMonitorCount
{
  return self->_pairedDeviceSubscriptionStatesMonitorCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableDiskSpaceForPairedDevice, 0);
  objc_storeStrong((id *)&self->_updatingSubscriptions, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDateForPairedDevice, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_subscriptionInfos, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (id)_osUpdateRequiredAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_SOFTWARE_UPDATE_REQUIRED_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_SOFTWARE_UPDATE_REQUIRED_ALERT_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, v5, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_SOFTWARE_UPDATE_REQUIRED_NOT_NOW_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 1, 0));
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_SOFTWARE_UPDATE_REQUIRED_UPDATE_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, &stru_1011E1E90));

  objc_msgSend(v6, "addAction:", v12);
  objc_msgSend(v6, "setPreferredAction:", v12);

  return v6;
}

- (id)alertControllerForAttemptedDataManagementDisplay
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if ((GEOSupportsOfflineMaps(self, a2) & 1) != 0
    || -[MapsOfflineUIHelper hasExpiredSubscriptions](self, "hasExpiredSubscriptions"))
  {
    v3 = 0;
  }
  else if (GEOConfigGetBOOL(GeoOfflineConfig_OfflineSupportDeprecated[0], GeoOfflineConfig_OfflineSupportDeprecated[1]))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper _osUpdateRequiredAlert](self, "_osUpdateRequiredAlert"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_NOT_AVAILABLE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_NOT_AVAILABLE_ALERT_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_NOT_AVAILABLE_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, 0));
    objc_msgSend(v3, "addAction:", v11);

  }
  return v3;
}

- (id)alertControllerForAttemptedRegionDownload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (!GEOConfigGetBOOL(GeoOfflineConfig_OfflineSupportDeprecated[0], GeoOfflineConfig_OfflineSupportDeprecated[1]))
  {
    if (-[MapsOfflineUIHelper isUsingForcedOfflineMaps](self, "isUsingForcedOfflineMaps"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_MAP_FORCED_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("DOWNLOAD_MAP_FORCED_OFFLINE_ALERT_MESSAGE");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
      v10 = objc_msgSend(v9, "isNetworkReachable");

      if ((v10 & 1) != 0)
      {
        v3 = 0;
        return v3;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_MAP_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("DOWNLOAD_MAP_OFFLINE_ALERT_MESSAGE");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), CFSTR("Offline")));

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v12, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_MAP_OFFLINE_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, 0));
    objc_msgSend(v3, "addAction:", v15);

    -[MapsOfflineUIHelper _captureDisplayDownloadMapsAlertWithType:](self, "_captureDisplayDownloadMapsAlertWithType:", 1);
    return v3;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper _osUpdateRequiredAlert](self, "_osUpdateRequiredAlert"));
  return v3;
}

- (id)alertControllerForAttemptedShowMyShortcut
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
  v4 = objc_msgSend(v3, "isNetworkReachable");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EDIT_SHORTCUT_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

    LODWORD(v7) = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if ((_DWORD)v7)
      v10 = CFSTR("EDIT_PIN_OFFLINE_ALERT_MESSAGE");
    else
      v10 = CFSTR("EDIT_SHORTCUT_OFFLINE_ALERT_MESSAGE");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), CFSTR("Offline")));

  }
  if (-[MapsOfflineUIHelper isUsingForcedOfflineMaps](self, "isUsingForcedOfflineMaps"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EDIT_SHORTCUT_FORCED_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v13 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    if (v13)
      v16 = CFSTR("EDIT_PIN_FORCED_OFFLINE_ALERT_MESSAGE");
    else
      v16 = CFSTR("EDIT_SHORTCUT_FORCED_OFFLINE_ALERT_MESSAGE");
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), CFSTR("Offline")));

    v5 = (void *)v12;
    v6 = (void *)v17;
  }
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("EDIT_SHORTCUT_OFFLINE_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, 0));
    objc_msgSend(v18, "addAction:", v21);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)alertControllerForAttemptedAddShortcut
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
  v4 = objc_msgSend(v3, "isNetworkReachable");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADD_SHORTCUT_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

    LODWORD(v7) = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    if ((_DWORD)v7)
      v10 = CFSTR("ADD_PIN_OFFLINE_ALERT_MESSAGE");
    else
      v10 = CFSTR("ADD_SHORTCUT_OFFLINE_ALERT_MESSAGE");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), CFSTR("Offline")));

  }
  if (-[MapsOfflineUIHelper isUsingForcedOfflineMaps](self, "isUsingForcedOfflineMaps"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ADD_SHORTCUT_FORCED_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v13 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    if (v13)
      v16 = CFSTR("ADD_PIN_FORCED_OFFLINE_ALERT_MESSAGE");
    else
      v16 = CFSTR("ADD_SHORTCUT_FORCED_OFFLINE_ALERT_MESSAGE");
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), CFSTR("Offline")));

    v5 = (void *)v12;
    v6 = (void *)v17;
  }
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ADD_SHORTCUT_OFFLINE_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, 0));
    objc_msgSend(v18, "addAction:", v21);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)alertControllerForAttemptedAddCollection
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
  v4 = objc_msgSend(v3, "isNetworkReachable");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADD_COLLECTION_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ADD_COLLECTION_OFFLINE_ALERT_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));

  }
  if (-[MapsOfflineUIHelper isUsingForcedOfflineMaps](self, "isUsingForcedOfflineMaps"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ADD_COLLECTION_FORCED_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ADD_COLLECTION_FORCED_OFFLINE_ALERT_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v5 = (void *)v10;
    v6 = (void *)v12;
  }
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ADD_COLLECTION_OFFLINE_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, 0));
    objc_msgSend(v13, "addAction:", v16);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)alertControllerForAttemptedAddNote
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
    v4 = objc_msgSend(v3, "isNetworkReachable");

    if ((v4 & 1) != 0)
    {
      v5 = 0;
      v6 = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ADD_NOTE_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ADD_NOTE_OFFLINE_ALERT_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));

    }
    if (-[MapsOfflineUIHelper isUsingForcedOfflineMaps](self, "isUsingForcedOfflineMaps"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ADD_NOTE_FORCED_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ADD_NOTE_FORCED_OFFLINE_ALERT_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));

      v5 = (void *)v11;
      v6 = (void *)v13;
    }
    if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ADD_NOTE_OFFLINE_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, 0));
      objc_msgSend(v7, "addAction:", v16);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)alertControllerForCellularDownloadConfirmationForRegionName:(id)a3 size:(int64_t)a4 actionHandler:(id)a5
{
  id v8;
  unsigned int v9;
  unsigned int v10;
  int64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  int v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  unsigned int v50;
  int64_t v51;
  id v52;
  MapsOfflineUIHelper *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];

  v8 = a3;
  v52 = a5;
  v53 = self;
  v9 = -[MapsOfflineUIHelper hasSubscriptionsNeedingUpdate](self, "hasSubscriptionsNeedingUpdate");
  v10 = v9;
  v11 = a4;
  v54 = v8;
  if (a4 < 0)
    goto LABEL_19;
  v11 = a4;
  if (!v9)
    goto LABEL_19;
  v50 = v9;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionInfos](v53, "subscriptionInfos"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  v51 = a4;
  v11 = a4;
  if (!v13)
    goto LABEL_18;
  v14 = v13;
  v15 = *(_QWORD *)v60;
  v11 = v51;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v60 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "state"));
      if (objc_msgSend(v18, "loadState") == (id)1)
        goto LABEL_11;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "state"));
      if (objc_msgSend(v19, "loadState") == (id)2)
      {

LABEL_11:
LABEL_12:
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "state"));
        v11 += (int64_t)objc_msgSend(v20, "downloadedDataSize");

        goto LABEL_13;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "state"));
      v22 = objc_msgSend(v21, "loadState");

      if (v22 == (id)3)
        goto LABEL_12;
LABEL_13:
      v16 = (char *)v16 + 1;
    }
    while (v14 != v16);
    v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    v14 = v23;
  }
  while (v23);
LABEL_18:

  v8 = v54;
  a4 = v51;
  v10 = v50;
LABEL_19:
  if (a4 < 1)
    v24 = 0;
  else
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MKRoundingByteCountFormatter stringFromByteCountWithRoundingTo1MB:](MKRoundingByteCountFormatter, "stringFromByteCountWithRoundingTo1MB:", v11));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = v25;
  if (v10)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_AND_UPDATE_MAP_CELLULAR_CONFIRMATION_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v8));

    if (a4 >= 1)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = v29;
      v31 = CFSTR("DOWNLOAD_AND_UPDATE_MAP_CELLULAR_CONFIRMATION_ALERT_MESSAGE");
      goto LABEL_27;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = v35;
    v36 = CFSTR("DOWNLOAD_AND_UPDATE_MAP_CELLULAR_CONFIRMATION_ALERT_MESSAGE_NO_SIZE");
LABEL_30:
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", v36, CFSTR("localized string not found"), CFSTR("Offline")));
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v32, v8));

    if (a4 < 1)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = v35;
      v36 = CFSTR("DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_MESSAGE_NO_SIZE");
      goto LABEL_30;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = v29;
    v31 = CFSTR("DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_MESSAGE");
LABEL_27:
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", v31, CFSTR("localized string not found"), CFSTR("Offline")));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v33, v24));

  }
  v37 = MGGetBoolAnswer(CFSTR("wapi"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v39 = v38;
  if (v37)
    v40 = CFSTR("DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_LATER_WLAN");
  else
    v40 = CFSTR("DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_LATER");
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", v40, CFSTR("localized string not found"), CFSTR("Offline")));

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_DOWNLOAD"), CFSTR("localized string not found"), CFSTR("Offline")));

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v28, v34, 1));
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100AD24B4;
  v57[3] = &unk_1011AD960;
  v45 = v52;
  v58 = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v41, 1, v57));
  objc_msgSend(v44, "addAction:", v46);

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100AD24C4;
  v55[3] = &unk_1011AD960;
  v56 = v45;
  v47 = v45;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v43, 0, v55));
  objc_msgSend(v44, "addAction:", v48);
  objc_msgSend(v44, "setPreferredAction:", v48);
  -[MapsOfflineUIHelper _captureDisplayDownloadMapsAlertWithType:](v53, "_captureDisplayDownloadMapsAlertWithType:", 2);

  return v44;
}

- (id)alertControllerForCellularUpdateConfirmationForSize:(int64_t)a3 actionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v5 = a4;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MKRoundingByteCountFormatter stringFromByteCountWithRoundingTo1MB:](MKRoundingByteCountFormatter, "stringFromByteCountWithRoundingTo1MB:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UPDATE_OFFLINE_MAPS_CELLULAR_CONFIRMATION_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UPDATE_OFFLINE_MAPS_CELLULAR_CONFIRMATION_ALERT_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v23));

  LODWORD(v8) = MGGetBoolAnswer(CFSTR("wapi"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = v11;
  if ((_DWORD)v8)
    v13 = CFSTR("DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_LATER_WLAN");
  else
    v13 = CFSTR("DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_LATER");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, CFSTR("localized string not found"), CFSTR("Offline")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_MAP_CELLULAR_CONFIRMATION_ALERT_ACTION_DOWNLOAD"), CFSTR("localized string not found"), CFSTR("Offline")));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v10, 1));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100AD2784;
  v27[3] = &unk_1011AD960;
  v18 = v5;
  v28 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, v27));
  objc_msgSend(v17, "addAction:", v19);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100AD2794;
  v25[3] = &unk_1011AD960;
  v26 = v18;
  v20 = v18;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, v25));
  objc_msgSend(v17, "addAction:", v21);
  objc_msgSend(v17, "setPreferredAction:", v21);
  -[MapsOfflineUIHelper _captureDisplayDownloadMapsAlertWithType:](self, "_captureDisplayDownloadMapsAlertWithType:", 2);

  return v17;
}

- (id)alertControllerForInsufficientDiskSpaceForDownloadSize:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  uint8_t buf[8];
  id v33;
  NSURLResourceKey v34;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "homeDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));

  v33 = 0;
  LOBYTE(v5) = objc_msgSend(v6, "getResourceValue:forKey:error:", &v33, NSURLVolumeURLKey, 0);
  v7 = v33;
  if ((v5 & 1) != 0)
  {
    v34 = NSURLVolumeAvailableCapacityForImportantUsageKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
    v31 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resourceValuesForKeys:error:", v8, &v31));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NSURLVolumeAvailableCapacityForImportantUsageKey));
    v11 = v10;
    if (!v10)
      goto LABEL_12;
    v12 = objc_msgSend(v10, "longLongValue");
    v13 = (double)a3;
    v14 = (uint64_t)((GEOConfigGetDouble(MapsConfig_OfflineDownloadAvailableDiskCapacityAdditionalMultiplier, off_1014B5138)+ 1.0)* (double)a3);
    v15 = a3
        + 1000000 * GEOConfigGetUInteger(MapsConfig_OfflineDownloadAvailableDiskCapacityAdditionalBuffer, off_1014B5148) >= v14
        ? a3
        + 1000000 * GEOConfigGetUInteger(MapsConfig_OfflineDownloadAvailableDiskCapacityAdditionalBuffer, off_1014B5148)
        : (uint64_t)((GEOConfigGetDouble(MapsConfig_OfflineDownloadAvailableDiskCapacityAdditionalMultiplier, off_1014B5138)+ 1.0)* v13);
    if (v15 > a3)
    {
      v16 = (uint64_t)((GEOConfigGetDouble(MapsConfig_OfflineDownloadAvailableDiskCapacityAdditionalMultiplier, off_1014B5138)+ 1.0)* v13);
      if (a3
         + 1000000
         * GEOConfigGetUInteger(MapsConfig_OfflineDownloadAvailableDiskCapacityAdditionalBuffer, off_1014B5148) >= v16)
        a3 += 1000000
            * GEOConfigGetUInteger(MapsConfig_OfflineDownloadAvailableDiskCapacityAdditionalBuffer, off_1014B5148);
      else
        a3 = (uint64_t)((GEOConfigGetDouble(MapsConfig_OfflineDownloadAvailableDiskCapacityAdditionalMultiplier, off_1014B5138)+ 1.0)* v13);
    }
    if (a3 > (uint64_t)v12)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[MKRoundingByteCountFormatter stringFromByteCountWithRoundingTo10MB:](MKRoundingByteCountFormatter, "stringFromByteCountWithRoundingTo10MB:", a3 - (_QWORD)v12));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_INSUFFICIENT_DISK_SPACE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v30));

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_INSUFFICIENT_DISK_SPACE_ALERT_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v29, v20, 1));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_INSUFFICIENT_DISK_SPACE_NOT_NOW_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v23, 1, 0));
      objc_msgSend(v21, "addAction:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MAPS_INSUFFICIENT_DISK_SPACE_MANAGE_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v26, 0, &stru_1011E1EB0));

      objc_msgSend(v21, "addAction:", v27);
      objc_msgSend(v21, "setPreferredAction:", v27);

    }
    else
    {
LABEL_12:
      v21 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: [homeDirectoryURL getResourceValue:&volumeURL forKey:NSURLVolumeURLKey error:((void *)0)]", buf, 2u);
    }
    v21 = 0;
  }

  return v21;
}

- (id)alertControllerForAttemptedUpdateAll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (GEOConfigGetBOOL(GeoOfflineConfig_OfflineSupportDeprecated[0], GeoOfflineConfig_OfflineSupportDeprecated[1]))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper _osUpdateRequiredAlert](self, "_osUpdateRequiredAlert"));
    v4 = 0;
    v5 = 0;
    goto LABEL_13;
  }
  if (-[MapsOfflineUIHelper isUsingForcedOfflineMaps](self, "isUsingForcedOfflineMaps"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UPDATE_ALL_MAP_FORCED_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("UPDATE_ALL_MAP_FORCED_OFFLINE_ALERT_MESSAGE");
LABEL_8:
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), CFSTR("Offline")));

    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
  v11 = objc_msgSend(v10, "isNetworkReachable");

  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("UPDATE_ALL_MAP_OFFLINE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("UPDATE_ALL_MAP_OFFLINE_ALERT_MESSAGE");
    goto LABEL_8;
  }
  v4 = 0;
  v5 = 0;
LABEL_9:
  if (objc_msgSend(v4, "length") && objc_msgSend(v5, "length"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UPDATE_ALL_MAP_OFFLINE_ALERT_ACTION"), CFSTR("localized string not found"), CFSTR("Offline")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, 0));
    objc_msgSend(v3, "addAction:", v15);

  }
  else
  {
    v3 = 0;
  }
LABEL_13:

  return v3;
}

- (id)alertControllerForDisableSyncToWatchWithActionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v4 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsOfflineUIHelper subscriptionInfos](self, "subscriptionInfos"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "pairedDeviceState"));

        if (v10)
          ++v7;
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v6);

    if (!v7)
    {
      v6 = 0;
      goto LABEL_14;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DISABLE_SYNC_TO_WATCH_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DISABLE_SYNC_TO_WATCH_ALERT_MESSAGE"), CFSTR("localized string not found"), CFSTR("Offline")));

    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v25, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DISABLE_SYNC_TO_WATCH_ALERT_ACTION_KEEP"), CFSTR("localized string not found"), CFSTR("Offline")));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100AD327C;
    v30[3] = &unk_1011AD960;
    v15 = v4;
    v31 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v30));
    objc_msgSend(v6, "addAction:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DISABLE_SYNC_TO_WATCH_ALERT_ACTION_REMOVE"), CFSTR("localized string not found"), CFSTR("Offline")));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100AD3290;
    v28[3] = &unk_1011AD960;
    v19 = v15;
    v29 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 2, v28));
    objc_msgSend(v6, "addAction:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("DISABLE_SYNC_TO_WATCH_ALERT_ACTION_CANCEL"), CFSTR("localized string not found"), CFSTR("Offline")));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100AD32A4;
    v26[3] = &unk_1011AD960;
    v27 = v19;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, 1, v26));
    objc_msgSend(v6, "addAction:", v23);

  }
LABEL_14:

  return v6;
}

- (id)alertControllerForInsufficientDiskSpaceOnPairedDeviceForDownloadSize:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", (unint64_t)((double)(uint64_t)llround((double)a3 / 1000000.0) * 1000000.0), 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MANAGEMENT_PAIRED_DEVICE_DISK_SPACE_ALERT_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MANAGEMENT_PAIRED_DEVICE_DISK_SPACE_ALERT_BODY"), CFSTR("localized string not found"), CFSTR("Offline")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v8, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MANAGE_WATCH_STORAGE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, &stru_1011E1ED0));
  objc_msgSend(v9, "addAction:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), CFSTR("localized string not found"), CFSTR("Offline")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, &stru_1011E1EF0));
  objc_msgSend(v9, "addAction:", v15);

  return v9;
}

- (void)_captureDisplayDownloadMapsAlertWithType:(int64_t)a3
{
  const __CFString *v3;

  if (a3 == 1)
    v3 = CFSTR("maps is offline");
  else
    v3 = CFSTR("use cellular data");
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 369, 0, v3);
}

@end
