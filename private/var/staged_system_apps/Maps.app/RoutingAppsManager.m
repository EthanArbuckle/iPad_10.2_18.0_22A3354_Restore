@implementation RoutingAppsManager

+ (id)defaultManager
{
  if (qword_1014D3528 != -1)
    dispatch_once(&qword_1014D3528, &stru_1011CA110);
  return (id)qword_1014D3520;
}

- (RoutingAppLaunchRecord)routingAppLaunchRecord
{
  RoutingAppLaunchRecord *routingAppLaunchRecord;
  void *v4;
  RoutingAppLaunchRecord *v5;
  RoutingAppLaunchRecord *v6;

  routingAppLaunchRecord = self->_routingAppLaunchRecord;
  if (!routingAppLaunchRecord)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PersistenceManager sharedManager](PersistenceManager, "sharedManager"));
    v5 = (RoutingAppLaunchRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readRoutingAppLaunchRecord"));
    v6 = self->_routingAppLaunchRecord;
    self->_routingAppLaunchRecord = v5;

    routingAppLaunchRecord = self->_routingAppLaunchRecord;
  }
  return routingAppLaunchRecord;
}

- (void)recordAppLaunch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppsManager routingAppLaunchRecord](self, "routingAppLaunchRecord"));
  objc_msgSend(v5, "recordAppLaunch:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PersistenceManager sharedManager](PersistenceManager, "sharedManager"));
  v16 = 0;
  v7 = objc_msgSend(v6, "writeRoutingAppLaunchRecord:error:", v5, &v16);
  v8 = v16;

  if ((v7 & 1) == 0)
    sub_100A133C4(CFSTR("Failed to save routing app updates: %@."), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

}

- (id)_installedApps
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "directionsApplications"));

  return v3;
}

- (id)_appIdsStringWithApplicationProxies:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "bundleIdentifier", (_QWORD)v12));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_updateCoverageFileForAppProxy:(id)a3 libraryItem:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  dispatch_queue_global_t global_queue;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a3;
  v6 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", SSSoftwareLibraryItemPropertyTransitDataURL));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ETagForAssetType:", SSDownloadAssetTypeTransitMapsData));
    global_queue = dispatch_get_global_queue(-32768, 0);
    v17 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10081DBE4;
    block[3] = &unk_1011AF1B0;
    v20 = v14;
    v21 = v15;
    v22 = v5;
    v23 = v6;
    v18 = v15;
    dispatch_async(v17, block);

  }
  else
  {
    sub_100A133C4(CFSTR("Warning: No routing coverage update URL for application: %@."), v7, v8, v9, v10, v11, v12, v13, 0);
  }

}

- (void)updateCoverageFiles
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10081E0F4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)loadRelevantRoutingAppsForSource:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 completion:(id)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLLocationDegrees v7;
  CLLocationDegrees v8;
  id v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  CLLocationDegrees v16;
  CLLocationDegrees v17;
  CLLocationDegrees v18;
  CLLocationDegrees v19;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3.longitude;
  v8 = a3.latitude;
  v10 = a5;
  global_queue = dispatch_get_global_queue(-32768, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10081E528;
  v14[3] = &unk_1011CA138;
  v16 = v8;
  v17 = v7;
  v18 = latitude;
  v19 = longitude;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  dispatch_async(v12, v14);

}

- (void)setRoutingAppLaunchRecord:(id)a3
{
  objc_storeStrong((id *)&self->_routingAppLaunchRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingAppLaunchRecord, 0);
}

@end
