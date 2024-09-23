@implementation OfflineMapsDownloadFeatureTipSource

- (OfflineMapsDownloadFeatureTipSource)initWithIsActive:(BOOL)a3
{
  _BOOL8 v3;
  OfflineMapsDownloadFeatureTipSource *v4;
  OfflineMapsDownloadFeatureTipSource *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsDownloadFeatureTipSource;
  v4 = -[OfflineMapsDownloadFeatureTipSource init](&v7, "init");
  v5 = v4;
  if (v4)
    -[OfflineMapsDownloadFeatureTipSource setActive:](v4, "setActive:", v3);
  return v5;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "addObserver:", self);

      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v7, "addObserver:selector:name:object:", self, "_didOpenUserProfile:", CFSTR("UserProfileDidOpenProfilePageNotification"), 0);
    }
    else
    {
      objc_msgSend(v5, "removeObserver:", self);

      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v7, "removeObserver:", self);
    }

  }
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  OfflineMapsDownloadFeatureTipSource *v4;
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

- (void)_notifyObservers
{
  if (self->_active)
    -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
}

- (id)offlineMapsDownloadTipModel
{
  return self->_model;
}

- (void)_dismissTip
{
  -[OfflineMapsDownloadFeatureTipSource setShowFeature:](self, "setShowFeature:", 0);
  -[OfflineMapsDownloadFeatureTipSource _notifyObservers](self, "_notifyObservers");
}

- (BOOL)_allowToShowTip
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  void *v9;
  id v10;
  uint64_t UInteger;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  uint64_t v19;
  id v20;
  int v22;
  uint64_t v23;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("OfflineMapsUserHasOpenedOfflineManagementScreenKey"));

  if (v3)
  {
    v4 = sub_1006F02E8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      v6 = "already opened the OfflineScreen, won't show the tip";
      v7 = v5;
      v8 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v22, v8);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = objc_msgSend(v9, "integerForKey:", CFSTR("OfflineMapsDownloadingTipDisplayedCountKey"));

  UInteger = GEOConfigGetUInteger(MapsConfig_OfflineMapsDownloadingTipMaximumDisplayCount, off_1014B4598);
  if ((uint64_t)v10 >= UInteger)
  {
    v19 = UInteger;
    v20 = sub_1006F02E8();
    v5 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v22 = 134217984;
      v23 = v19;
      v6 = "already displayed maximum number of time, won't show the tip. The maximum is %ld";
      v7 = v5;
      v8 = 12;
      goto LABEL_12;
    }
LABEL_13:
    v18 = 0;
    goto LABEL_16;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("OfflineMapsDownloadingTipLastDisplayedTimeKey")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = v13;
  if (v5 && (objc_msgSend(v13, "timeIntervalSinceDate:", v5), v15 < 86400.0))
  {
    v16 = sub_1006F02E8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "already displayed tip today, won't show the tip", (uint8_t *)&v22, 2u);
    }

    v18 = 0;
  }
  else
  {
    v18 = 1;
  }

LABEL_16:
  return v18;
}

- (void)_markAsShown
{
  void *v2;
  void *v3;
  char *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("OfflineMapsDownloadingTipLastDisplayedTimeKey"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (char *)objc_msgSend(v3, "integerForKey:", CFSTR("OfflineMapsDownloadingTipDisplayedCountKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setInteger:forKey:", v4 + 1, CFSTR("OfflineMapsDownloadingTipDisplayedCountKey"));

}

- (void)_showDownloadTipModelWithDisplayName:(id)a3
{
  id v4;
  ImageIconWithBackgroundConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FeatureDiscoveryModel *v14;
  FeatureDiscoveryModel *v15;
  FeatureDiscoveryModel *model;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location[2];

  v4 = a3;
  v5 = objc_alloc_init(ImageIconWithBackgroundConfiguration);
  -[ImageIconWithBackgroundConfiguration setIconSize:](v5, "setIconSize:", 35.0, 35.0);
  -[ImageIconWithBackgroundConfiguration setCornerRadius:](v5, "setCornerRadius:", 17.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[ImageIconWithBackgroundConfiguration setTintColor:](v5, "setTintColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("ProfileGrayColor")));
  -[ImageIconWithBackgroundConfiguration setBackgroundColor:](v5, "setBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("icloud.slash.fill")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_imageIconWithBackgroundConfiguration:", v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Offline] download tip title"), CFSTR("localized string not found"), CFSTR("Offline")));
  v18 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v4));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Offline] download tip subtitle"), CFSTR("localized string not found"), CFSTR("Offline")));

  objc_initWeak(location, self);
  v14 = [FeatureDiscoveryModel alloc];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1006F06E8;
  v24[3] = &unk_1011AD260;
  objc_copyWeak(&v25, location);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1006F0718;
  v22[3] = &unk_1011AD260;
  objc_copyWeak(&v23, location);
  LOBYTE(v17) = 1;
  v15 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v14, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v19, v11, v13, 0, 0, 0, v24, v22, v17);
  model = self->_model;
  self->_model = v15;

  -[FeatureDiscoveryModel setIsTipMode:](self->_model, "setIsTipMode:", 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006F0748;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v21, location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(location);

}

- (void)subscriptionInfosDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[OfflineMapsDownloadFeatureTipSource showFeature](self, "showFeature")
    && -[OfflineMapsDownloadFeatureTipSource _allowToShowTip](self, "_allowToShowTip"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "state"));
    v6 = objc_msgSend(v5, "downloadState");

    if (v6 == (id)2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscription"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
      -[OfflineMapsDownloadFeatureTipSource _showDownloadTipModelWithDisplayName:](self, "_showDownloadTipModelWithDisplayName:", v8);

    }
  }

}

- (void)_didOpenUserProfile:(id)a3
{
  if (-[OfflineMapsDownloadFeatureTipSource showFeature](self, "showFeature", a3))
    -[OfflineMapsDownloadFeatureTipSource _dismissTip](self, "_dismissTip");
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)hasInitialData
{
  return self->hasInitialData;
}

- (BOOL)showFeature
{
  return self->_showFeature;
}

- (void)setShowFeature:(BOOL)a3
{
  self->_showFeature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
