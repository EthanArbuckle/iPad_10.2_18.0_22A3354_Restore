@implementation CRCarPlayAppServiceAgent

- (CRCarPlayAppServiceAgent)initWithSessionStatus:(id)a3
{
  id v4;
  CRCarPlayAppServiceAgent *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  CRCarPlayCapabilitiesManager *v9;
  CRCarPlayCapabilitiesManager *carCapabilitiesManager;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRCarPlayAppServiceAgent;
  v5 = -[CRCarPlayAppServiceAgent init](&v13, "init");
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.carkit.AssetQuery", v7);
    -[CRCarPlayAppServiceAgent setAssetQueue:](v5, "setAssetQueue:", v8);

    -[CRCarPlayAppServiceAgent setAssetQueryInProgress:](v5, "setAssetQueryInProgress:", 0);
    v9 = -[CRCarPlayCapabilitiesManager initWithSessionStatus:]([CRCarPlayCapabilitiesManager alloc], "initWithSessionStatus:", v4);
    carCapabilitiesManager = v5->_carCapabilitiesManager;
    v5->_carCapabilitiesManager = v9;

    if (+[CRVehicleStoreAvailability isVehicleStoreAvailable](CRVehicleStoreAvailability, "isVehicleStoreAvailable"))
    {
      -[CRCarPlayAppServiceAgent _queryForUpdatedAsset](v5, "_queryForUpdatedAsset");
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v11, "addObserver:selector:name:object:", v5, "_queryForUpdatedAsset", CRVehicleStoreAvailabilityDidChangeNotification, 0);

    }
  }

  return v5;
}

- (void)requestCarCapabilitiesUpdate
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10006A8F4(v4, v5, v6, v7, v8, v9, v10, v11);

  -[CRCarPlayAppServiceAgent _queryForUpdatedAsset](self, "_queryForUpdatedAsset");
  -[CRCarPlayCapabilitiesManager reconcileCapabilities](self->_carCapabilitiesManager, "reconcileCapabilities");
}

- (void)requestCarCapabilitiesStatus:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  CRCarPlayCapabilitiesManager *carCapabilitiesManager;
  id v11;
  dispatch_time_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v6 = a3;
  v7 = a4;
  v8 = CarGeneralLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10006A964();

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  carCapabilitiesManager = self->_carCapabilitiesManager;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001E280;
  v17[3] = &unk_1000B5A28;
  v19 = v20;
  v11 = v7;
  v18 = v11;
  -[CRCarPlayCapabilitiesManager plistLookupFinishedCompletionHandler:](carCapabilitiesManager, "plistLookupFinishedCompletionHandler:", v17);
  v12 = dispatch_time(0, 1000000000);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001E338;
  v14[3] = &unk_1000B5A50;
  v15 = v11;
  v16 = v20;
  v13 = v11;
  dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v14);

  _Block_object_dispose(v20, 8);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CRCarPlayAppServiceAgent;
  -[CRCarPlayAppServiceAgent dealloc](&v4, "dealloc");
}

- (id)_denylistPreference
{
  return (id)(id)CFPreferencesCopyAppValue(CRCarPlayAppDenylistPreferenceKey, CRPreferencesNotMigratedDomain);
}

- (void)_setDenylistPreference:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v10[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayAppServiceAgent _denylistPreference](self, "_denylistPreference"));
  CFPreferencesSetAppValue(CRCarPlayAppDenylistPreferenceKey, v4, CRPreferencesNotMigratedDomain);
  if (v4 && !v5 || (v6 = objc_msgSend(v5, "isEqual:", v4), (v6 & 1) == 0))
  {
    v7 = CarGeneralLogging(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Posting denylist changed", v10, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carkit.app.denylist-changed"), 0, 0, 1u);
  }

}

- (void)_requestAssetCatalogDownload
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requesting CarPlay MobileAssets catalog download", buf, 2u);
  }

  v5 = objc_alloc_init((Class)MADownloadOptions);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001E64C;
  v6[3] = &unk_1000B5A78;
  v6[4] = self;
  +[MAAsset startCatalogDownload:options:then:](MAAsset, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.CarExperienceAssets"), v5, v6);

}

- (void)_queryForUpdatedAsset
{
  void *v2;
  NSObject *v3;
  CRCarPlayAppServiceAgent *obj;
  _QWORD block[5];

  obj = self;
  objc_sync_enter(obj);
  if (-[CRCarPlayAppServiceAgent assetQueryInProgress](obj, "assetQueryInProgress"))
  {
    objc_sync_exit(obj);

  }
  else
  {
    -[CRCarPlayAppServiceAgent setAssetQueryInProgress:](obj, "setAssetQueryInProgress:", 1);
    objc_sync_exit(obj);

    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v2, "removeObserver:name:object:", obj, CRVehicleStoreAvailabilityDidChangeNotification, 0);

    v3 = objc_claimAutoreleasedReturnValue(-[CRCarPlayAppServiceAgent assetQueue](obj, "assetQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E7F4;
    block[3] = &unk_1000B51B8;
    block[4] = obj;
    dispatch_async(v3, block);

  }
}

- (void)_reloadWithAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "getLocalFileUrl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("CarPlayAppDenylist.plist")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:](NSArray, "arrayWithContentsOfURL:", v5));
  v20 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarPlayAppServiceAgent _parseDenylistContent:error:](self, "_parseDenylistContent:error:", v6, &v20));
  v8 = v20;
  v9 = v8;
  if (v7)
  {
    v10 = CarGeneralLogging(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetched CarPlay MobileAsset (denylist): %@", buf, 0xCu);
    }

    -[CRCarPlayAppServiceAgent _setDenylistPreference:](self, "_setDenylistPreference:", v7);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("CarPlayCapabilities.plist")));
  v19 = 0;
  v18 = 0;
  objc_msgSend(v12, "getResourceValue:forKey:error:", &v19, NSURLIsRegularFileKey, &v18);
  v13 = v19;
  v14 = v18;

  if (!v14)
  {
    v15 = objc_msgSend(v13, "BOOLValue");
    if ((_DWORD)v15)
    {
      v16 = CarGeneralLogging(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fetched CarPlay MobileAsset (carcapabilities) at %@", buf, 0xCu);
      }

      -[CRCarPlayCapabilitiesManager setCarCapabilitiesURL:](self->_carCapabilitiesManager, "setCarCapabilitiesURL:", v12);
    }
  }

}

- (id)_parseDenylistContent:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t isKindOfClass;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v5 = a3;
  isKindOfClass = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)isKindOfClass;
  if (v5
    && (v8 = objc_opt_class(NSArray),
        isKindOfClass = objc_opt_isKindOfClass(v5, v8),
        (isKindOfClass & 1) != 0))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v15 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
            objc_msgSend(v7, "addObject:", v14, (_QWORD)v27);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v7));
  }
  else
  {
    v17 = CarGeneralLogging(isKindOfClass);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10006AB88(v18, v19, v20, v21, v22, v23, v24, v25);

    v16 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.carkit.app"), 1, 0));
  }

  return v16;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.carkit.app")));
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRCarPlayAppService));
    v10 = objc_opt_class(NSDictionary);
    v11 = objc_opt_class(NSString);
    v12 = objc_opt_class(NSValue);
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, objc_opt_class(CRCarPlayCapabilities), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v14, "requestCarCapabilitiesStatus:withReply:", 0, 1);

    objc_msgSend(v5, "setExportedInterface:", v9);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");

  }
  else
  {
    v15 = CarGeneralLogging(v8);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10006ABB8(v5, v16);

  }
  return v7;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (OS_dispatch_queue)assetQueue
{
  return self->_assetQueue;
}

- (void)setAssetQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetQueue, a3);
}

- (BOOL)assetQueryInProgress
{
  return self->_assetQueryInProgress;
}

- (void)setAssetQueryInProgress:(BOOL)a3
{
  self->_assetQueryInProgress = a3;
}

- (CRCarPlayCapabilitiesManager)carCapabilitiesManager
{
  return self->_carCapabilitiesManager;
}

- (void)setCarCapabilitiesManager:(id)a3
{
  objc_storeStrong((id *)&self->_carCapabilitiesManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carCapabilitiesManager, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end
