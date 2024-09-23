@implementation MapsDebugController

+ (void)applyAllPendingDebugSettings
{
  id v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v2 = objc_msgSend(v4, "BOOLForKey:", CFSTR("LogLocationStartStop"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v3, "setLogStartStopLocationUpdates:", v2);

}

- (MapsDebugController)init
{
  MapsDebugController *v2;
  void *v3;
  void *v4;
  MapsDebugController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsDebugController;
  v2 = -[MapsDebugValuesViewController init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    objc_msgSend(v3, "addTileGroupObserver:queue:", v2, &_dispatch_main_q);

    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_MapsAuthToken[0], GeoServicesConfig_MapsAuthToken[1], &_dispatch_main_q, v2);
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_MapsRefreshToken[0], GeoServicesConfig_MapsRefreshToken[1], &_dispatch_main_q, v2);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "_rebuildOfflineSections", GEOOfflineStateChangedNotification, 0);

    MapsFeature_AddDelegateListener(MapsFeaturesConfig_StandaloneWatchOffline[0], MapsFeaturesConfig_StandaloneWatchOffline[1], &_dispatch_main_q, v2);
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  GEOConfigRemoveDelegateListenerForAllKeys(self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)MapsDebugController;
  -[MapsDebugValuesViewController dealloc](&v6, "dealloc");
}

- (void)_addGeoServicesSettingsToSection:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1009B7E84;
  v18[3] = &unk_1011AD260;
  objc_copyWeak(&v19, &location);
  v5 = objc_msgSend(v4, "addNavigationRowWithTitle:action:", CFSTR("Cell Data Saver"), v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1009B7EE8;
  v16[3] = &unk_1011AD260;
  objc_copyWeak(&v17, &location);
  v6 = objc_msgSend(v4, "addNavigationRowWithTitle:action:", CFSTR("geod Request Counters"), v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1009B7F54;
  v14[3] = &unk_1011AD260;
  objc_copyWeak(&v15, &location);
  v7 = objc_msgSend(v4, "addNavigationRowWithTitle:action:", CFSTR("Request Response Logs"), v14);
  v8 = objc_msgSend(v4, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Placedata Cache"), &stru_1011DDCC0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009B8084;
  v12[3] = &unk_1011AD260;
  objc_copyWeak(&v13, &location);
  v9 = objc_msgSend(v4, "addNavigationRowWithTitle:action:", CFSTR("Data Subscriptions"), v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009B80F0;
  v11[3] = &unk_1011B7F10;
  v11[4] = self;
  v10 = objc_msgSend(v4, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Offline"), v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)_addAuthTokenSectionTo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009B889C;
  v6[3] = &unk_1011AEAC8;
  objc_copyWeak(&v7, &location);
  v5 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("Maps Auth Service Tokens"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_addFeatureFlagsSettingsToSection:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  GEOFeaturesController *featuresController;
  GEOFeaturesController *v8;
  GEOFeaturesController *v9;
  GEOFeaturesController *v10;
  NSMutableSet *v11;
  NSMutableSet *v12;
  GEOFeaturesController *v13;
  id v14;
  uint64_t v15;
  id v16;
  void **v17;
  uint64_t v18;
  void (*v19)(id *, void *);
  void *v20;
  NSMutableSet *v21;
  NSMutableSet *v22;
  GEOFeaturesController *v23;
  MapsDebugController *v24;
  id v25;
  id location;

  v4 = a3;
  v5 = self->_viewControllersToReloadOnAuthFinish;
  v6 = self->_viewControllersToReloadOnTileGroupChange;
  featuresController = self->_featuresController;
  if (!featuresController)
  {
    v8 = (GEOFeaturesController *)objc_alloc_init((Class)GEOFeaturesController);
    v9 = self->_featuresController;
    self->_featuresController = v8;

    -[GEOFeaturesController setDelegate:](self->_featuresController, "setDelegate:", self);
    featuresController = self->_featuresController;
  }
  v10 = featuresController;
  objc_initWeak(&location, self);
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_1009B8D88;
  v20 = &unk_1011DDEB8;
  v11 = v6;
  v21 = v11;
  v12 = v5;
  v22 = v12;
  objc_copyWeak(&v25, &location);
  v13 = v10;
  v23 = v13;
  v24 = self;
  v14 = objc_msgSend(v4, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Authenticated Feature Flags"), &v17);
  v15 = objc_opt_class(MapsFeatureFlagsDebugController);
  v16 = objc_msgSend(v4, "addNavigationRowForViewControllerClass:", v15, v17, v18, v19, v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)_addServerConfigSettingsToSection:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;
  NSMutableSet *viewControllersToReloadOnTileGroupChange;
  NSMutableSet *v11;
  _QWORD v12[4];
  NSMutableSet *v13;
  NSMutableSet *v14;
  MapsDebugController *v15;
  id v16;
  id location;

  v4 = a3;
  v5 = self->_viewControllersToReloadOnTileGroupChange;
  v6 = self->_viewControllersToReloadOnAuthFinish;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009B9388;
  v12[3] = &unk_1011DE300;
  v7 = v6;
  v13 = v7;
  v8 = v5;
  v14 = v8;
  objc_copyWeak(&v16, &location);
  v15 = self;
  v9 = objc_msgSend(v4, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Server Config"), v12);
  viewControllersToReloadOnTileGroupChange = self->_viewControllersToReloadOnTileGroupChange;
  self->_viewControllersToReloadOnTileGroupChange = v8;
  v11 = v8;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_addMiscellaneousSection
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getDevices"));

  if (objc_msgSend(v5, "count"))
    v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Miscellaneous"), &stru_1011DE320);

}

- (void)_addStateSnapshotToSection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009BAFC0;
  v6[3] = &unk_1011AD260;
  objc_copyWeak(&v7, &location);
  v5 = objc_msgSend(v4, "addButtonRowWithTitle:action:", CFSTR("Capture State Snapshot"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_addCopyDiagnosticsToSection:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009BB1F0;
  v6[3] = &unk_1011AD1E8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addButtonRowWithTitle:action:", CFSTR("Copy Diagnostics"), v6));
  objc_msgSend(v5, "setSubtitle:", CFSTR("Copy diagnostic information to the pasteboard."));

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_addTapToRadarAllowAttachmentsOptionToSection:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Tap-To-Radar"), &stru_1011DE360);
}

- (void)_addRadarEntriesToSection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  Class v8;
  id v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1009BB948;
  v13 = &unk_1011AD260;
  objc_copyWeak(&v14, &location);
  v5 = objc_msgSend(v4, "addButtonRowWithTitle:action:", CFSTR("File a Radar"), &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform", v10, v11, v12, v13));
  v7 = objc_msgSend(v6, "isInternalInstall");

  if (v7)
  {
    v8 = NSClassFromString(CFSTR("MapsRecordAnIssueDebugController"));
    v9 = objc_msgSend(v4, "addNavigationRowForViewControllerClass:", objc_opt_class(v8));
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_addLoggingEntriesToSection:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addNavigationRowWithTitle:viewControllerContent:", CFSTR("Logging"), &stru_1011DE3C0);
}

- (void)_addMapsBundleInfoSection
{
  id v3;
  id v4;

  v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Maps Bundle Paths"), &stru_1011DE400);
  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Bundle Versions"), &stru_1011DE480);
}

- (void)prepareContent
{
  NSMutableSet *v3;
  NSMutableSet *viewControllersToReloadOnOfflineChange;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *viewControllersToReloadOnAuthFinish;
  NSMutableSet *v10;
  NSMutableSet *viewControllersToReloadOnTileGroupChange;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  NSMutableSet *v19;
  id v20;
  id location;

  objc_initWeak(&location, self);
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  viewControllersToReloadOnOfflineChange = self->_viewControllersToReloadOnOfflineChange;
  self->_viewControllersToReloadOnOfflineChange = v3;

  v5 = self->_viewControllersToReloadOnOfflineChange;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1009BC404;
  v18[3] = &unk_1011DE5F0;
  v6 = v5;
  v19 = v6;
  objc_copyWeak(&v20, &location);
  v7 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Main Components"), v18);
  v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  viewControllersToReloadOnAuthFinish = self->_viewControllersToReloadOnAuthFinish;
  self->_viewControllersToReloadOnAuthFinish = v8;

  v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  viewControllersToReloadOnTileGroupChange = self->_viewControllersToReloadOnTileGroupChange;
  self->_viewControllersToReloadOnTileGroupChange = v10;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1009BC888;
  v16[3] = &unk_1011AEAC8;
  objc_copyWeak(&v17, &location);
  v12 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Configuration"), v16);
  -[MapsDebugController _addMiscellaneousSection](self, "_addMiscellaneousSection");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1009BC90C;
  v14[3] = &unk_1011AEAC8;
  objc_copyWeak(&v15, &location);
  v13 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Diagnostics"), v14);
  -[MapsDebugController _addBuildInfoSection](self, "_addBuildInfoSection");
  -[MapsDebugController _addMapsBundleInfoSection](self, "_addMapsBundleInfoSection");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSMutableSet copy](self->_viewControllersToReloadOnTileGroupChange, "copy", a3, 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "rebuildSections");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)mapsAuthTokenRequestDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper"));
  objc_msgSend(v5, "removeMapsAuthDidFinishObserver:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", GEOMapsAuthRequestTypeKey));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("success")));
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((objc_msgSend(v7, "isEqualToString:", GEOMapsAuthEnvironmentSwitch) & 1) != 0)
    goto LABEL_17;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", GEOMapsAuthFailReasonKey));
  v13 = objc_msgSend(v12, "integerValue");

  if ((v10 & 1) != 0)
  {
    v14 = CFSTR("Successful Auth Request");
    v15 = CFSTR("Your auth request succeeded.");
    goto LABEL_8;
  }
  if ((unint64_t)v13 + 1 > 7)
  {
    v15 = 0;
    goto LABEL_7;
  }
  if (((1 << (v13 + 1)) & 0xB7) != 0)
  {
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Your auth request failed for an unexpected reason (%d)."), v13));
LABEL_7:
    v14 = CFSTR("Failed Auth Request");
    goto LABEL_8;
  }
  v14 = CFSTR("Failed Auth Request");
  if (v13 == (id)2)
    v15 = CFSTR("Could not renew a non-existent token. Try performing an Apple Connect auth first.");
  else
    v15 = CFSTR("Your auth request failed. Make sure your environment has the proper URL(s) for authentication.");
LABEL_8:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, &stru_1011DE610));
  objc_msgSend(v16, "addAction:", v17);
  if ((v10 & 1) == 0
    && ((objc_msgSend(v7, "isEqualToString:", GEOMapsAuthMRT) & 1) != 0
     || objc_msgSend(v7, "isEqualToString:", GEOMapsAuthFeatureFlags))
    && v13 != (id)5)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1009BCDF4;
    v23[3] = &unk_1011AD938;
    v23[4] = self;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Try with AppleConnect"), 0, v23));
    objc_msgSend(v16, "addAction:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugController presentedViewController](self, "presentedViewController"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugController presentedViewController](self, "presentedViewController"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1009BCE4C;
    v21[3] = &unk_1011AC8B0;
    v21[4] = self;
    v22 = v16;
    objc_msgSend(v20, "dismissViewControllerAnimated:completion:", 1, v21);

  }
  else
  {
    -[MapsDebugController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
  }

LABEL_17:
  -[MapsDebugController _rebuildAuthSections](self, "_rebuildAuthSections");

}

- (void)_rebuildAuthSections
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[NSMutableSet copy](self->_viewControllersToReloadOnAuthFinish, "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "rebuildSections");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_rebuildOfflineSections
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[NSMutableSet copy](self->_viewControllersToReloadOnOfflineChange, "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "rebuildSections");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  BOOL v3;
  BOOL v4;

  v3 = LODWORD(GeoServicesConfig_MapsAuthToken[0]) == a3.var0 && (void *)GeoServicesConfig_MapsAuthToken[1] == a3.var1;
  if (v3
    || (LODWORD(GeoServicesConfig_MapsRefreshToken[0]) == a3.var0
      ? (v4 = (void *)GeoServicesConfig_MapsRefreshToken[1] == a3.var1)
      : (v4 = 0),
        v4))
  {
    -[MapsDebugController _rebuildAuthSections](self, "_rebuildAuthSections");
  }
}

- (void)valueChangedForMapsFeature:(id)a3 enabled:(BOOL)a4
{
  if (a3.var0.var0 == MapsFeaturesConfig_StandaloneWatchOffline
    && a3.var0.var1 == (void *)*((_QWORD *)&MapsFeaturesConfig_StandaloneWatchOffline + 1))
  {
    -[MapsDebugController _rebuildOfflineSections](self, "_rebuildOfflineSections");
  }
}

+ (id)debug_createGEODaemonToMapsPushDaemonConnection
{
  if (qword_1014D3BE0 != -1)
    dispatch_once(&qword_1014D3BE0, &stru_1011DE630);
  return (id)qword_1014D3BD8;
}

+ (void)debug_withMapsPushDaemon:(id)a3 errorHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = (void (**)(id, void *))a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "debug_createGEODaemonToMapsPushDaemonConnection"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009BD260;
  v11[3] = &unk_1011AE218;
  v12 = v6;
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11));
  v7[2](v7, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresController, 0);
  objc_storeStrong((id *)&self->_offlineVersionMetadata, 0);
  objc_storeStrong((id *)&self->_viewControllersToReloadOnOfflineChange, 0);
  objc_storeStrong((id *)&self->_viewControllersToReloadOnAuthFinish, 0);
  objc_storeStrong((id *)&self->_viewControllersToReloadOnTileGroupChange, 0);
}

@end
