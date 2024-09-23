@implementation OfflineMapsPairedDeviceDiskSpaceTipSource

- (OfflineMapsPairedDeviceDiskSpaceTipSource)initWithIsActive:(BOOL)a3
{
  _BOOL8 v3;
  OfflineMapsPairedDeviceDiskSpaceTipSource *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OfflineMapsPairedDeviceDiskSpaceTipSource;
  v4 = -[OfflineMapsPairedDeviceDiskSpaceTipSource init](&v8, "init");
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.Maps.Home.OfflineMapsPairedDeviceDiskSpaceTip", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    -[OfflineMapsPairedDeviceDiskSpaceTipSource setActive:](v4, "setActive:", v3);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)OfflineMapsPairedDeviceDiskSpaceTipSource;
  -[OfflineMapsPairedDeviceDiskSpaceTipSource dealloc](&v4, "dealloc");
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  OfflineMapsPairedDeviceDiskSpaceTipSource *v4;
  GEOObserverHashTable *v5;
  GEOObserverHashTable *v6;

  observers = self->_observers;
  if (!observers)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, 0);
    v6 = self->_observers;
    self->_observers = v5;

    objc_sync_exit(v4);
    observers = self->_observers;
  }
  return observers;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  _DWORD v13[2];

  v3 = a3;
  if ((GEOConfigGetBOOL(MapsConfig_MapsHomeOffinePairedDeviceDiskSpaceTipEnabled, off_1014B3EE8) & 1) != 0)
  {
    if (self->_active == v3)
      return;
    v5 = sub_100BE5168();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109120;
      v13[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Becoming active: %d", (uint8_t *)v13, 8u);
    }

    self->_active = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v8 = v7;
    if (v3)
    {
      objc_msgSend(v7, "addObserver:", self);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      objc_msgSend(v9, "startMonitoringPairedDeviceSubscriptionStates");

      v10 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      -[NSObject addObserver:selector:name:object:](v10, "addObserver:selector:name:object:", self, "_updateTipShown", NRPairedDeviceRegistryDevicesDidUpdateNotification, 0);
    }
    else
    {
      objc_msgSend(v7, "removeObserver:", self);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      objc_msgSend(v12, "stopMonitoringPairedDeviceSubscriptionStates");

      v10 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      -[NSObject removeObserver:name:object:](v10, "removeObserver:name:object:", self, NRPairedDeviceRegistryDevicesDidUpdateNotification, 0);
    }
  }
  else
  {
    v11 = sub_100BE5168();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Maps config has disabled the tip, will not activate.", (uint8_t *)v13, 2u);
    }
  }

}

- (id)offlineMapsPairedDeviceDiskSpaceTipModel
{
  return self->_model;
}

- (void)pairedSubscriptionInfosDidChange:(id)a3
{
  -[OfflineMapsPairedDeviceDiskSpaceTipSource _updateTipShown](self, "_updateTipShown", a3);
}

- (void)_notifyObservers
{
  if (-[OfflineMapsPairedDeviceDiskSpaceTipSource active](self, "active"))
    -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
}

- (void)_hideTip
{
  FeatureDiscoveryModel *model;

  self->_showFeature = 0;
  model = self->_model;
  self->_model = 0;

  -[OfflineMapsPairedDeviceDiskSpaceTipSource _notifyObservers](self, "_notifyObservers");
}

- (void)_showTipWithRequiredDiskSpace:(int64_t)a3
{
  id v5;
  void *v6;
  FeatureDiscoveryModel *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  FeatureDiscoveryModel *v17;
  FeatureDiscoveryModel *model;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  self->_showFeature = 1;
  v5 = objc_msgSend((id)objc_opt_class(self), "openManageWatchStorageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_initWeak(&location, self);
  v7 = [FeatureDiscoveryModel alloc];
  v8 = objc_msgSend((id)objc_opt_class(self), "_icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend((id)objc_opt_class(self), "_title");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend((id)objc_opt_class(self), "_subtitleWithRequiredDiskSpace:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend((id)objc_opt_class(self), "_actionTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100BE53F0;
  v22[3] = &unk_1011AC860;
  v16 = v6;
  v23 = v16;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100BE5440;
  v20[3] = &unk_1011AD260;
  objc_copyWeak(&v21, &location);
  LOBYTE(v19) = 0;
  v17 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v7, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v9, v11, v13, v15, v22, 0, 0, v20, v19);
  model = self->_model;
  self->_model = v17;

  -[OfflineMapsPairedDeviceDiskSpaceTipSource _notifyObservers](self, "_notifyObservers");
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

- (void)_updateTipShown
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v19;
  double Double;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25[2];
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[5];
  _BYTE v32[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("OfflineMapsPairedDeviceDiskSpaceLastCheckedUUIDKey")));

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsPairedDeviceDiskSpaceTipSource _activePairedDeviceID](self, "_activePairedDeviceID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = objc_msgSend(v23, "isEqual:", v4);

  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BE57B4;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("OfflineMapsPairedDeviceDiskSpaceLastCheckedUUIDKey"));

    if (v3)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subscriptionInfos"));

      v10 = 0;
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pairedDeviceState"));
            if (v15)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pairedDeviceState"));
              v17 = objc_msgSend(v16, "downloadState") == 0;

              if (!v17)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "state"));
                v19 = objc_msgSend(v18, "downloadedDataSize");

                v10 += (uint64_t)v19;
              }
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v11);
      }

      Double = GEOConfigGetDouble(GeoOfflineConfig_DownloadAvailableDiskCapacityAdditionalMultiplier[0], GeoOfflineConfig_DownloadAvailableDiskCapacityAdditionalMultiplier[1]);
      objc_initWeak(&location, self);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100BE57BC;
      v24[3] = &unk_1011B9A08;
      objc_copyWeak(v25, &location);
      v25[1] = (id)(v10 + (uint64_t)(Double * (double)v10));
      objc_msgSend(v21, "getAvailableDiskSpaceForPairedDeviceWithCompletionHandler:", v24);

      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
  }

}

- (id)_activePairedDeviceID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getActivePairedDeviceExcludingAltAccount"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pairingID"));
  return v4;
}

+ (id)_icon
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 64.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.down.applewatch")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageByApplyingSymbolConfiguration:", v2));

  return v4;
}

+ (id)_title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PAIRED_DEVICE_DISK_SPACE_TIP_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

  return v3;
}

+ (id)_subtitleWithRequiredDiskSpace:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", (unint64_t)((double)(uint64_t)llround((double)a3 / 1000000.0) * 1000000.0), 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PAIRED_DEVICE_DISK_SPACE_TIP_SUBTITLE"), CFSTR("localized string not found"), CFSTR("Offline")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v3));

  return v6;
}

+ (id)_actionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PAIRED_DEVICE_DISK_SPACE_TIP_ACTION_TITLE"), CFSTR("localized string not found"), CFSTR("Offline")));

  return v3;
}

+ (id)openManageWatchStorageURL
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("bridge:tab=SETTINGS&root=GENERAL_LINK&path=USAGE_LINK"));
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (BOOL)showFeature
{
  return self->_showFeature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
