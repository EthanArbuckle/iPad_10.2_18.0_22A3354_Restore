@implementation PUILocationServicesListController

- (PUILocationServicesListController)init
{
  PUILocationServicesListController *v2;
  PUILocationServicesListController *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *locationServicesAccessQueue;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUILocationServicesListController;
  v2 = -[PUILocationServicesListController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PUILocationServicesListController updateRecentlyUsedDate](v2, "updateRecentlyUsedDate");
    v4 = dispatch_queue_create("com.apple.settings.PrivacySettingsUI.PUILocationServicesListController.locationServicesAccessQueue", 0);
    locationServicesAccessQueue = v3->locationServicesAccessQueue;
    v3->locationServicesAccessQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_updateForApplicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_profileNotification_, CFSTR("PSProfileConnectionEffectiveSettingsChangedNotification"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4750], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("PSProfileConnectionEffectiveSettingsChangedNotification"), 0);

  -[PUILocationServicesListController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[PUILocationServicesListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  -[PUILocationServicesListController stopLocationStatusUpdates](self, "stopLocationStatusUpdates");
  v7.receiver = self;
  v7.super_class = (Class)PUILocationServicesListController;
  -[PUILocationServicesListController dealloc](&v7, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesListController;
  -[PUILocationServicesListController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUILocationServicesListController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  PUI_BundleForPrivacySettingsFramework();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("LOCATION_SERVICES"), CFSTR("Location Services"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/LOCATION"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationServicesListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.location"), v7, v11, v12);

}

- (void)profileNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PUILocationServicesListController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PUILocationServicesListController_profileNotification___block_invoke;
  v6[3] = &unk_1EA26B438;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __57__PUILocationServicesListController_profileNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D471F8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "intValue");
  if ((_DWORD)v2 != getpid())
    objc_msgSend(*(id *)(a1 + 40), "reloadSpecifiers");

}

- (void)setAuthLevel:(unint64_t)a3 forCell:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v8, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "authLevel") != a3
        || (objc_msgSend(v6, "authLevelString"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
      {
        objc_msgSend(v6, "setAuthLevel:", a3);
        objc_msgSend(v8, "layoutIfNeeded");
      }
    }
  }
  else
  {
    v6 = 0;
  }

}

- (void)setUsage:(int)a3 forCell:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v7, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "usage") != (_DWORD)v4)
    {
      objc_msgSend(v6, "setUsage:", v4);
      objc_msgSend(v7, "setNeedsLayout");
    }
  }
  else
  {
    v6 = 0;
  }

}

- (void)updateLocationUsage
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  NSDictionary *locationEntitiesDetails;
  _QWORD v12[5];
  uint8_t buf[16];

  _PUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "locationManager:updateLocationUsage", buf, 2u);
  }

  v4 = (void *)PSUICLCopyAppsUsingLocation();
  -[NSDictionary allKeys](self->_locationEntitiesDetails, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count")
    && (objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqualToSet:", v9),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    objc_storeStrong((id *)&self->_locationEntitiesDetails, v4);
    locationEntitiesDetails = self->_locationEntitiesDetails;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__PUILocationServicesListController_updateLocationUsage__block_invoke;
    v12[3] = &unk_1EA26C818;
    v12[4] = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](locationEntitiesDetails, "enumerateKeysAndObjectsUsingBlock:", v12);
  }
  else
  {
    -[PUILocationServicesListController reloadSpecifiers](self, "reloadSpecifiers");
  }

}

void __56__PUILocationServicesListController_updateLocationUsage__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id CLLocationManagerClass_0;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;

  v7 = a2;
  v8 = a3;
  v9 = v7;
  v10 = v8;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "specifierForID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = *(void **)(a1 + 32);
      v13 = objc_msgSend(v12, "locationUsageForEntity:", v9);
      v14 = *MEMORY[0x1E0D80940];
      objc_msgSend(v11, "propertyForKey:", *MEMORY[0x1E0D80940]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUsage:forCell:", v13, v15);

      v16 = *(void **)(a1 + 32);
      CLLocationManagerClass_0 = getCLLocationManagerClass_0();
      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 1376);
      objc_msgSend(v11, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(CLLocationManagerClass_0, "entityAuthorizationForLocationDictionary:", v20);
      objc_msgSend(v11, "propertyForKey:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAuthLevel:forCell:", v21, v22);

      v23 = objc_msgSend(getCLLocationManagerClass_0(), "isEntityAuthorizedForLocationDictionary:", v10);
      objc_msgSend(v11, "propertyForKey:", *MEMORY[0x1E0D807D0]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v23 != objc_msgSend(v24, "isOn"))
        objc_msgSend(v24, "setOn:animated:", v23, 1);

    }
    else
    {
      _PUILoggingFacility();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        __56__PUILocationServicesListController_updateLocationUsage__block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
      *a4 = 1;
    }

  }
}

- (void)startLocationStatusUpdates
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;
  __CFNotificationCenter *DistributedCenter;
  __CFNotificationCenter *v6;

  if (!self->_locationNotificationsEnabled)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    getCLAppStatusChangedNotification();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)entityStateCallback, v4, 0, (CFNotificationSuspensionBehavior)0);

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, self, (CFNotificationCallback)appInstallCallback, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)appUninstallCallback, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, (CFNotificationSuspensionBehavior)0);
    self->_locationNotificationsEnabled = 1;
  }
}

- (void)stopLocationStatusUpdates
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;
  __CFNotificationCenter *DistributedCenter;
  __CFNotificationCenter *v6;

  if (self->_locationNotificationsEnabled)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    getCLAppStatusChangedNotification();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterRemoveObserver(DistributedCenter, self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    v6 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterRemoveObserver(v6, self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
    self->_locationNotificationsEnabled = 0;
  }
}

- (int)locationUsageBasedOnDetails:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  v5 = objc_msgSend(getCLLocationManagerClass_0(), "activeLocationServiceTypesForLocationDictionary:", v4);
  if ((v5 & 2) != 0)
  {
    v8 = 3;
  }
  else if ((v5 & 1) != 0)
  {
    v8 = 4;
  }
  else
  {
    objc_msgSend(getCLLocationManagerClass_0(), "dateLocationLastUsedForLocationDictionary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSDate laterDate:](self->_twentyFourHoursAgo, "laterDate:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v6)
        v8 = 2;
      else
        v8 = 1;

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (int)locationUsageForEntity:(id)a3
{
  id v4;
  int v5;
  int v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  void *v36;
  int v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SYSTEM_SERVICES")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("APP_CLIPS")))
    {
      v5 = +[PUILocationServicesClipsListController clipsLocationUsage](PUILocationServicesClipsListController, "clipsLocationUsage");
      goto LABEL_5;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("LOCATION_BASED_ALERTS")))
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v7 = self->_coalescedLocationBasedAlertsSystemServices;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v56;
        v6 = -1;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v56 != v10)
              objc_enumerationMutation(v7);
            -[NSDictionary objectForKey:](self->_locationEntitiesDetails, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[PUILocationServicesListController locationUsageBasedOnDetails:](self, "locationUsageBasedOnDetails:", v12);

            if (v13 > v6)
              v6 = v13;
          }
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v9);
        goto LABEL_62;
      }
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HOMEKIT")))
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v7 = self->_coalescedHomeKitSystemServices;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v52;
        v6 = -1;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v52 != v16)
              objc_enumerationMutation(v7);
            -[NSDictionary objectForKey:](self->_locationEntitiesDetails, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[PUILocationServicesListController locationUsageBasedOnDetails:](self, "locationUsageBasedOnDetails:", v18);

            if (v19 > v6)
              v6 = v19;
          }
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
        }
        while (v15);
        goto LABEL_62;
      }
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("NETWORKING_WIRELESS")))
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v7 = self->_coalescedWirelessSystemServices;
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v48;
        v6 = -1;
        do
        {
          for (k = 0; k != v21; ++k)
          {
            if (*(_QWORD *)v48 != v22)
              objc_enumerationMutation(v7);
            -[NSDictionary objectForKey:](self->_locationEntitiesDetails, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[PUILocationServicesListController locationUsageBasedOnDetails:](self, "locationUsageBasedOnDetails:", v24);

            if (v25 > v6)
              v6 = v25;
          }
          v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
        }
        while (v21);
        goto LABEL_62;
      }
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("ROUTING_AND_TRAFFIC")))
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v7 = self->_coalescedRoutingAndTrafficSystemServices;
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v44;
        v6 = -1;
        do
        {
          for (m = 0; m != v27; ++m)
          {
            if (*(_QWORD *)v44 != v28)
              objc_enumerationMutation(v7);
            -[NSDictionary objectForKey:](self->_locationEntitiesDetails, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[PUILocationServicesListController locationUsageBasedOnDetails:](self, "locationUsageBasedOnDetails:", v30);

            if (v31 > v6)
              v6 = v31;
          }
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
        }
        while (v27);
        goto LABEL_62;
      }
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("POLARIS")))
      {
        -[NSDictionary objectForKey:](self->_locationEntitiesDetails, "objectForKey:", v4);
        v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v6 = -[PUILocationServicesListController locationUsageBasedOnDetails:](self, "locationUsageBasedOnDetails:", v7);
        goto LABEL_62;
      }
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      -[PUILocationServicesListController coalescedImproveMapsServices](self, "coalescedImproveMapsServices", 0);
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v40;
        v6 = -1;
        do
        {
          for (n = 0; n != v33; ++n)
          {
            if (*(_QWORD *)v40 != v34)
              objc_enumerationMutation(v7);
            -[NSDictionary objectForKey:](self->_locationEntitiesDetails, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * n));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = -[PUILocationServicesListController locationUsageBasedOnDetails:](self, "locationUsageBasedOnDetails:", v36);

            if (v37 > v6)
              v6 = v37;
          }
          v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
        }
        while (v33);
        goto LABEL_62;
      }
    }
    v6 = -1;
LABEL_62:

    goto LABEL_63;
  }
  v5 = +[PUILocationSystemServicesListController systemServicesLocationUsage](PUILocationSystemServicesListController, "systemServicesLocationUsage");
LABEL_5:
  v6 = v5;
LABEL_63:

  return v6;
}

+ (BOOL)isCoreRoutineAuthorized
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)PSUICLCopyAppsUsingLocation();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i), (_QWORD)v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(getCLLocationManagerClass_0(), "primaryEntityClassForLocationDictionary:", v6) == 16)
        {
          LOBYTE(v3) = objc_msgSend(getCLLocationManagerClass_0(), "isEntityAuthorizedForLocationDictionary:", v6);

          goto LABEL_11;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (void)setCoreRoutineAuthorized:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)PSUICLCopyAppsUsingLocation();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(getCLLocationManagerClass_0(), "primaryEntityClassForLocationDictionary:", v9) == 16)
        {
          objc_msgSend(getCLLocationManagerClass_0(), "setEntityAuthorized:forLocationDictionary:", v3, v9);

          goto LABEL_11;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)isLocationServicesEnabled:(id)a3
{
  NSNumber *isLocationServicesEnabled;
  NSNumber *v5;
  NSNumber *v6;

  isLocationServicesEnabled = self->_isLocationServicesEnabled;
  if (!isLocationServicesEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(getCLLocationManagerClass_0(), "locationServicesEnabled"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_isLocationServicesEnabled;
    self->_isLocationServicesEnabled = v5;

    isLocationServicesEnabled = self->_isLocationServicesEnabled;
  }
  return isLocationServicesEnabled;
}

- (void)setLocationServicesEnabled:(id)a3 specifier:(id)a4
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_isLocationServicesEnabled, a3);
  v9 = objc_msgSend(v7, "BOOLValue");
  _PUILoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[PUILocationServicesListController setLocationServicesEnabled:specifier:]";
    v38 = 1024;
    v39 = v9;
    _os_log_impl(&dword_1DB1FB000, v10, OS_LOG_TYPE_DEFAULT, "%s - enable: %d", buf, 0x12u);
  }

  if (v9 != objc_msgSend(getCLLocationManagerClass_0(), "locationServicesEnabled"))
  {
    if ((v9 & 1) != 0)
    {
      -[PUILocationServicesListController _setLocationServicesEnabled:](self, "_setLocationServicesEnabled:", 1);
      if ((isModificationAllowedForID(CFSTR("com.apple.findmy")) & 1) != 0)
      {
LABEL_22:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.Maps.LocationAuthorizationChangedNotification"), 0, 0, 1u);
        goto LABEL_23;
      }
      objc_msgSend(v8, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
      objc_msgSend(v8, "propertyForKey:", *MEMORY[0x1E0D80940]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCellEnabled:", 0);
    }
    else
    {
      if (PSIsInEDUMode())
        v13 = CFSTR("CONFIRM_LOCATION_EDU_TITLE");
      else
        v13 = CFSTR("CONFIRM_LOCATION_TITLE");
      PUI_LocalizedStringForLocationServices(v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "userInterfaceIdiom");

      v17 = v16 & 0xFFFFFFFFFFFFFFFBLL;
      v18 = v11;
      if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        objc_msgSend(v8, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "userInterfaceIdiom");

      if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v21 = v11;
      else
        v21 = 0;
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "userInterfaceIdiom");

      objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v18, v21, (v23 & 0xFFFFFFFFFFFFFFFBLL) == 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == 1)

      v25 = (void *)MEMORY[0x1E0DC3448];
      PUI_LocalizedStringForLocationServices(CFSTR("CANCEL"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __74__PUILocationServicesListController_setLocationServicesEnabled_specifier___block_invoke;
      v34[3] = &unk_1EA26B688;
      v34[4] = self;
      v35 = v8;
      objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 1, v34);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addAction:", v28);

      v29 = (void *)MEMORY[0x1E0DC3448];
      PUI_LocalizedStringForLocationServices(CFSTR("CONFIRM_LOCATION_TURN_OFF"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v27;
      v33[1] = 3221225472;
      v33[2] = __74__PUILocationServicesListController_setLocationServicesEnabled_specifier___block_invoke_2;
      v33[3] = &unk_1EA26B568;
      v33[4] = self;
      objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 2, v33);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addAction:", v31);

      -[PUILocationServicesListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);
    }

    goto LABEL_22;
  }
  _PUILoggingFacility();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[PUILocationServicesListController setLocationServicesEnabled:specifier:]";
    _os_log_impl(&dword_1DB1FB000, v12, OS_LOG_TYPE_DEFAULT, "%s - loc services were already enabled.", buf, 0xCu);
  }

LABEL_23:
}

uint64_t __74__PUILocationServicesListController_setLocationServicesEnabled_specifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelConfirmDisableForSpecifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __74__PUILocationServicesListController_setLocationServicesEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLocationServicesEnabled:", 0);
}

- (void)_cancelConfirmDisableForSpecifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PUILocationServicesListController__cancelConfirmDisableForSpecifier___block_invoke;
  v6[3] = &unk_1EA26B438;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __71__PUILocationServicesListController__cancelConfirmDisableForSpecifier___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  id v3;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[1432])
  {
    objc_msgSend(v2, "reloadSpecifiers");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1432) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "propertyForKey:", *MEMORY[0x1E0D807D0]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOn:animated:", 1, 1);

  }
}

- (void)_setLocationServicesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSDictionary *locationEntitiesDetails;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[PUILocationServicesListController _setLocationServicesEnabled:]";
    v15 = 1024;
    v16 = v3;
    _os_log_impl(&dword_1DB1FB000, v5, OS_LOG_TYPE_DEFAULT, "%s - enable: %d", (uint8_t *)&v13, 0x12u);
  }

  if (!v3)
  {
    -[PUILocationServicesListController stopLocationStatusUpdates](self, "stopLocationStatusUpdates");
    locationEntitiesDetails = self->_locationEntitiesDetails;
    self->_locationEntitiesDetails = 0;

  }
  objc_msgSend(getCLLocationManagerClass_0(), "setLocationServicesEnabled:", v3);
  v7 = -[PUILocationServicesListController rangeOfSpecifiersInGroupID:](self, "rangeOfSpecifiersInGroupID:", CFSTR("LOCATION_SHARING_GROUP"));
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = -[PUILocationServicesListController rangeOfSpecifiersInGroupID:](self, "rangeOfSpecifiersInGroupID:", CFSTR("LOCATION_SERVICES_MASTER"));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      -[PUILocationServicesListController _setLocationServicesEnabled:].cold.1();
  }
  v9 = v7;
  v10 = v8;
  if (v3)
  {
    -[PUILocationServicesListController locationDetailSpecifiersForAppsAndBundles](self, "locationDetailSpecifiersForAppsAndBundles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationServicesListController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v11, v9 + v10, 1);
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), "subarrayWithRange:", v7 + v8, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), "count")- (v7+ v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationServicesListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v11, 1);
  }

  -[PUILocationServicesListController updateLocationSharingSpecifiersWithReload:](self, "updateLocationSharingSpecifiersWithReload:", 1);
  -[PUILocationServicesListController updateFindMyFriendsStateBasedOnRestriction](self, "updateFindMyFriendsStateBasedOnRestriction");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("com.apple.PrivacySettingsUI.LocationServicesStateChanged"), 0);

}

- (BOOL)_isFindMyDeviceSpecifier:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("FindMyDevice.framework"));

  return v4;
}

- (id)isEntityAuthorized:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_locationEntitiesDetails, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(getCLLocationManagerClass_0(), "isEntityAuthorizedForLocationDictionary:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_setEntityAuthorized:(BOOL)a3 specifier:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_locationEntitiesDetails, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _PUILoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136446722;
    v12 = "-[PUILocationServicesListController _setEntityAuthorized:specifier:]";
    v13 = 2114;
    v14 = v9;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: authorized: %{public}@ for location dictionary: %{details}@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("com.apple.PrivacySettingsUI.LocationServicesStateChanged"), 0);

  objc_msgSend(getCLLocationManagerClass_0(), "setEntityAuthorized:forLocationDictionary:", v4, v7);
}

- (void)setEntityAuthorized:(id)a3 specifier:(id)a4
{
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  v9 = a4;
  v6 = objc_msgSend(a3, "BOOLValue");
  if ((v6 & 1) == 0
    && -[PUILocationServicesListController _isFindMyDeviceSpecifier:](self, "_isFindMyDeviceSpecifier:", v9)
    && (objc_msgSend(getPSGFindMyiPhoneControllerClass(), "shared"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isFindMyiPhoneEnabled"),
        v7,
        v8))
  {
    -[PUILocationServicesListController disableAfterLoginConfirmation:](self, "disableAfterLoginConfirmation:", v9);
  }
  else
  {
    -[PUILocationServicesListController _setEntityAuthorized:specifier:](self, "_setEntityAuthorized:specifier:", v6, v9);
  }

}

- (void)setSOSEntityAuthorized:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    -[PUILocationServicesListController setEntityAuthorized:specifier:](self, "setEntityAuthorized:specifier:", v6, v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0DC3450];
    PUI_LocalizedStringForLocationServices(CFSTR("SOS_DISABLE_LOCATION_SERVICES_CONFIRMATION_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForLocationServices(CFSTR("SOS_DISABLE_LOCATION_SERVICES_CONFIRMATION_BODY"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x1E0DC3448];
    PUI_LocalizedStringForLocationServices(CFSTR("SOS_DISABLE_LOCATION_SERVICES_CONFIRMATION_TURN_OFF_BUTTON"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __70__PUILocationServicesListController_setSOSEntityAuthorized_specifier___block_invoke;
    v22[3] = &unk_1EA26C840;
    objc_copyWeak(&v25, &location);
    v23 = v6;
    v15 = v7;
    v24 = v15;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0DC3448];
    PUI_LocalizedStringForLocationServices(CFSTR("SOS_DISABLE_LOCATION_SERVICES_CONFIRMATION_CANCEL_BUTTON"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __70__PUILocationServicesListController_setSOSEntityAuthorized_specifier___block_invoke_2;
    v20[3] = &unk_1EA26B568;
    v21 = v15;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v19);

    if (PSIsiPad())
      objc_msgSend(v11, "setPreferredStyle:", 1);
    -[PUILocationServicesListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
}

void __70__PUILocationServicesListController_setSOSEntityAuthorized_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setEntityAuthorized:specifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __70__PUILocationServicesListController_setSOSEntityAuthorized_specifier___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", *MEMORY[0x1E0D807D0]);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOn:animated:", 1, 1);

}

- (void)disableAfterLoginConfirmation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  objc_msgSend(getPSGFindMyiPhoneControllerClass(), "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredFindMyiPhoneAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PUI_LocalizedStringForLocationServices(CFSTR("CONFIRM_FMIP_LOCATION_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PUI_LocalizedStringForLocationServices(CFSTR("CONFIRM_LOCATION_TURN_OFF"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPSGFindMyiPhoneControllerClass(), "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__PUILocationServicesListController_disableAfterLoginConfirmation___block_invoke;
  v13[3] = &unk_1EA26C868;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v11, "disablePhoneLocatorWithMessageString:buttonTitle:presentingViewController:completion:", v9, v10, self, v13);

}

void __67__PUILocationServicesListController_disableAfterLoginConfirmation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v14 = 0;
    *((_QWORD *)&v14 + 1) = &v14;
    v15 = 0x2020000000;
    v9 = (_QWORD *)getFindMyiPhoneControllerErrorDomainSymbolLoc_ptr;
    v16 = getFindMyiPhoneControllerErrorDomainSymbolLoc_ptr;
    if (!getFindMyiPhoneControllerErrorDomainSymbolLoc_ptr)
    {
      v10 = (void *)GeneralSettingsUILibrary();
      v9 = dlsym(v10, "FindMyiPhoneControllerErrorDomain");
      *(_QWORD *)(*((_QWORD *)&v14 + 1) + 24) = v9;
      getFindMyiPhoneControllerErrorDomainSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v14, 8);
    if (!v9)
    {
      __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
      __break(1u);
    }
    v11 = objc_msgSend(v8, "isEqualToString:", *v9, (_QWORD)v14);

    if (v11)
    {
      switch(objc_msgSend(v5, "code"))
      {
        case 0:
          _PUILoggingFacility();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_1DB1FB000, v12, OS_LOG_TYPE_DEFAULT, "########## User canceled out of disabling FMiP location service", (uint8_t *)&v14, 2u);
          }
          goto LABEL_16;
        case 1:
          _PUILoggingFacility();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_1DB1FB000, v13, OS_LOG_TYPE_DEFAULT, "########## no account - disable FMiP location service", (uint8_t *)&v14, 2u);
          }
          goto LABEL_26;
        case 2:
          _PUILoggingFacility();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_1DB1FB000, v13, OS_LOG_TYPE_DEFAULT, "########## already disabled - disable FMiP location service", (uint8_t *)&v14, 2u);
          }
          goto LABEL_26;
        case 3:
          _PUILoggingFacility();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_1DB1FB000, v12, OS_LOG_TYPE_DEFAULT, "########## FMiP state in flux - canceling out of disabling FMiP location service", (uint8_t *)&v14, 2u);
          }
          goto LABEL_16;
        default:
          break;
      }
    }
    else
    {
      _PUILoggingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v14) = 138412290;
        *(_QWORD *)((char *)&v14 + 4) = v5;
        _os_log_impl(&dword_1DB1FB000, v12, OS_LOG_TYPE_DEFAULT, "*** Unknown error: %@. Cancelling out of disabling FMiP location service", (uint8_t *)&v14, 0xCu);
      }
LABEL_16:

      objc_msgSend(*(id *)(a1 + 32), "_cancelConfirmDisableForSpecifier:", *(_QWORD *)(a1 + 40));
    }
  }
  else if (objc_msgSend(v6, "length"))
  {
    _PUILoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1DB1FB000, v13, OS_LOG_TYPE_DEFAULT, "########## authenticated - disable FMiP location service", (uint8_t *)&v14, 2u);
    }
LABEL_26:

    objc_msgSend(*(id *)(a1 + 32), "_setEntityAuthorized:specifier:", 0, *(_QWORD *)(a1 + 40));
  }

}

- (void)updateMutableStateBasedOnRestriction
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", +[PUILocationServicesListController isLocationRestricted](PUILocationServicesListController, "isLocationRestricted") ^ 1);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = *MEMORY[0x1E0D80808];
    v22 = *MEMORY[0x1E0D80940];
    v8 = (int *)MEMORY[0x1E0D805B0];
    v21 = *MEMORY[0x1E0D80808];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v10 = *(char **)(*((_QWORD *)&v24 + 1) + 8 * v9);
        if (*(_QWORD *)&v10[*v8] == 6
          || (v11 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v9), "detailControllerClass"),
              v11 == objc_opt_class()))
        {
          objc_msgSend(v10, "propertyForKey:", v7);
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
            goto LABEL_10;
          v13 = (void *)v12;
          objc_msgSend(v10, "propertyForKey:", v7);
          v14 = v5;
          v15 = v6;
          v16 = v8;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "BOOLValue");
          v19 = objc_msgSend(v3, "BOOLValue");

          v8 = v16;
          v6 = v15;
          v5 = v14;
          v7 = v21;

          if (v18 != v19)
          {
LABEL_10:
            objc_msgSend(v10, "setProperty:forKey:", v3, v7);
            objc_msgSend(v10, "propertyForKey:", v22);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setCellEnabled:", objc_msgSend(v3, "BOOLValue"));

          }
        }
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

}

- (void)updateFindMyFriendsStateBasedOnRestriction
{
  void *v3;
  void *v4;
  id v5;

  if ((isModificationAllowedForID(CFSTR("com.apple.findmy")) & 1) == 0)
  {
    -[PUILocationServicesListController specifierForID:](self, "specifierForID:", CFSTR("com.apple.findmy"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", v3, *MEMORY[0x1E0D80808]);

    objc_msgSend(v5, "propertyForKey:", *MEMORY[0x1E0D80940]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCellEnabled:", 0);

  }
}

- (void)updateSpecifiersForImposedSettings
{
  -[PUILocationServicesListController updateSpecifiersForImposedSettingsWithReload:](self, "updateSpecifiersForImposedSettingsWithReload:", 1);
}

- (void)updateSpecifiersForImposedSettingsWithReload:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PUILocationServicesListController updateMutableStateBasedOnRestriction](self, "updateMutableStateBasedOnRestriction");
  -[PUILocationServicesListController updateLocationSharingSpecifiersWithReload:](self, "updateLocationSharingSpecifiersWithReload:", v3);
  -[PUILocationServicesListController updateMutableStateForLocationSharing](self, "updateMutableStateForLocationSharing");
  -[PUILocationServicesListController updateFindMyFriendsStateBasedOnRestriction](self, "updateFindMyFriendsStateBasedOnRestriction");
}

- (void)updateMutableStateForLocationSharing
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  if ((isModificationAllowedForID(CFSTR("com.apple.findmy")) & 1) == 0)
  {
    -[PUILocationServicesListController isLocationServicesEnabled:](self, "isLocationServicesEnabled:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    if (v4)
    {
      -[PUILocationServicesListController specifierForID:](self, "specifierForID:", CFSTR("LOCATION_SERVICES_MASTER"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
      objc_msgSend(v6, "propertyForKey:", *MEMORY[0x1E0D80940]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCellEnabled:", 0);

    }
  }
}

- (void)updateRecentlyUsedDate
{
  id v3;
  id v4;
  void *v5;
  NSDate *v6;
  NSDate *twentyFourHoursAgo;
  id v8;

  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v8 = (id)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setHour:", -24);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v4, v5, 0);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  twentyFourHoursAgo = self->_twentyFourHoursAgo;
  self->_twentyFourHoursAgo = v6;

}

- (void)updateForApplicationDidBecomeActive:(id)a3
{
  id v4;

  -[PUILocationServicesListController updateRecentlyUsedDate](self, "updateRecentlyUsedDate", a3);
  -[PUILocationServicesListController table](self, "table");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesListController;
  -[PUILocationServicesListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PUILocationServicesListController updateSpecifiersForImposedSettings](self, "updateSpecifiersForImposedSettings");
}

- (void)willBecomeActive
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesListController;
  -[PUILocationServicesListController willBecomeActive](&v4, sel_willBecomeActive);
  -[PUILocationServicesListController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PUILocationServicesListController reloadSpecifiers](self, "reloadSpecifiers");
  else
    self->_deferredRefreshDueToConfirm = 1;
}

- (void)showLocationPrivacyPage
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.locationservices"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (id)hiddenBundleIdentifiers
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.siri"), CFSTR("/System/Library/LocationBundles/ClipServicesLocation.bundle"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (PSIsInEDUMode())
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("/System/Library/PrivateFrameworks/FMF.framework"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setByAddingObjectsFromSet:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = v2;
  }

  return v4;
}

- (id)localizedDisplayNameForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
  {
    PUI_LocalizedStringForLocationServices(CFSTR("SAFARI_WEBSITES"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)_isBundleBlacklisted:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = a3;
  if (_isBundleBlacklisted__onceToken != -1)
    dispatch_once(&_isBundleBlacklisted__onceToken, &__block_literal_global_284);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveBlacklistedAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_isBundleBlacklisted__appForBundle, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    v9 = objc_msgSend(v5, "containsObject:", v8);
  else
    v9 = 0;

  return v9;
}

void __58__PUILocationServicesListController__isBundleBlacklisted___block_invoke()
{
  void *v0;

  v0 = (void *)_isBundleBlacklisted__appForBundle;
  _isBundleBlacklisted__appForBundle = (uint64_t)&unk_1EA27EAD0;

}

- (id)locationDetailSpecifiersForAppsAndBundles
{
  void *v3;
  void *v4;
  int v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SRRelatedSettingsProvider *v18;
  SRRelatedSettingsProvider *sensorKitSpecifiersProvider;
  void *v20;

  v3 = (void *)objc_opt_new();
  -[PUILocationServicesListController locationDetailSpecifiersWithDetailsMatching:](self, "locationDetailSpecifiersWithDetailsMatching:", &__block_literal_global_297);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = _os_feature_enabled_impl();
  v6 = (_QWORD *)MEMORY[0x1E0D80780];
  v7 = (_QWORD *)MEMORY[0x1E0D808D0];
  v8 = (_QWORD *)MEMORY[0x1E0D80880];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isAppClipsAllowed");

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForDimSum(CFSTR("APP_CLIPS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, objc_opt_class(), 2, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setIdentifier:", CFSTR("APP_CLIPS"));
      objc_msgSend(v13, "setProperty:forKey:", objc_opt_class(), *v6);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v7);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.app-clips"), *v8);
      objc_msgSend(v3, "insertObject:atIndex:", v13, 1);

    }
  }
  v14 = (void *)MEMORY[0x1E0D804E8];
  PUI_LocalizedStringForLocationServices(CFSTR("SYSTEM_SERVICES"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setIdentifier:", CFSTR("SYSTEM_SERVICES"));
  objc_msgSend(v16, "setProperty:forKey:", objc_opt_class(), *v6);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v7);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.gear"), *v8);
  objc_msgSend(v3, "addObject:", v16);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v17, "sf_isiPhone");

  if ((_DWORD)v15)
  {
    -[PUILocationServicesListController loadSensorKitSpecifiersProvider](self, "loadSensorKitSpecifiersProvider");
    v18 = (SRRelatedSettingsProvider *)objc_claimAutoreleasedReturnValue();
    sensorKitSpecifiersProvider = self->_sensorKitSpecifiersProvider;
    self->_sensorKitSpecifiersProvider = v18;

    -[SRRelatedSettingsProvider specifiersForRelatedSettings:](self->_sensorKitSpecifiersProvider, "specifiersForRelatedSettings:", CFSTR("Location"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v3, "addObjectsFromArray:", v20);

  }
  return v3;
}

BOOL __78__PUILocationServicesListController_locationDetailSpecifiersForAppsAndBundles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL4 v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PUIIsAppClip(v2);

  return !v3;
}

- (id)locationDetailSpecifiersWithDetailsMatching:(id)a3
{
  uint64_t (**v3)(id, void *);
  NSObject *v4;
  double v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  NSArray *ignoredLocationEntities;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  id obj;
  uint64_t v54;
  unsigned int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  unsigned int v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v72;
  NSArray *v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  id v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t (**)(id, void *))a3;
  obj = (id)PSUICLCopyAppsUsingLocation();
  _PUILoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v83 = obj;
    _os_log_impl(&dword_1DB1FB000, v4, OS_LOG_TYPE_DEFAULT, "specifiers -- CLCopyAppsUsingLocation:\n%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_locationEntitiesDetails, obj);
  PUIGetActivePairedDevice();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51858], "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  ScreenScale();
  if ((int)v5 == 2)
    v6 = 47;
  else
    v6 = 48;
  v55 = v6;
  v73 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(obj, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectiveBlacklistedAppBundleIDs");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C99E60];
    -[PUILocationServicesListController hiddenBundleIdentifiers](self, "hiddenBundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithSet:", v9);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v10 = obj;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    if (!v11)
      goto LABEL_66;
    v74 = *(_QWORD *)v79;
    v51 = *MEMORY[0x1E0C9AAC8];
    v52 = *MEMORY[0x1E0D808D0];
    v49 = *MEMORY[0x1E0D808C0];
    v54 = *MEMORY[0x1E0D80870];
    v58 = *MEMORY[0x1E0D80868];
    v57 = *MEMORY[0x1E0D80780];
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v79 != v74)
          objc_enumerationMutation(v10);
        v13 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v12);
        objc_msgSend(v10, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3 && (v3[2](v3, v14) & 1) == 0)
          goto LABEL_20;
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BundleId"));
        v15 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v72, "containsObject:", v15))
        {
LABEL_15:

LABEL_20:
          -[NSArray addObject:](v73, "addObject:", v13);
          goto LABEL_60;
        }
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BundlePath"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PUILocationServicesListController _isBundleBlacklisted:](self, "_isBundleBlacklisted:", v16);

        if (v17 || objc_msgSend(v69, "containsObject:", v13))
          goto LABEL_20;
        v18 = objc_msgSend(getCLLocationManagerClass_0(), "primaryEntityClassForLocationDictionary:", v14);
        v19 = v18;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v70 = 0;
        switch(v18)
        {
          case 0:
            _PUILoggingFacility();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v83 = v13;
              v84 = 2112;
              v85 = v14;
              _os_log_impl(&dword_1DB1FB000, v15, OS_LOG_TYPE_DEFAULT, "EntityClassUnknown:\n%@\n%@", buf, 0x16u);
            }
            goto LABEL_15;
          case 1:
            objc_msgSend(v14, "objectForKey:", CFSTR("BundleId"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(MEMORY[0x1E0DC3F68], "bundleIdentifierContainsWebClipIdentifier:", v70);
            if (v65)
            {
              -[PUILocationServicesListController localizedDisplayNameForBundleID:](self, "localizedDisplayNameForBundleID:", v70);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v21, "length"))
                goto LABEL_30;
              goto LABEL_35;
            }
            objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v70);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "appState");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isInstalled");

            if (v30)
            {
              -[PUILocationServicesListController localizedDisplayNameForBundleID:](self, "localizedDisplayNameForBundleID:", v70);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
              v59 = 0;
              v67 = 0;
              goto LABEL_36;
            }
            if (!v48)
            {
              -[NSArray addObject:](v73, "addObject:", v13);

              break;
            }
            PUIDisplayNameForWatchApp(v70);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              v33 = v70;
              if (!v33)
                goto LABEL_30;
            }
            else
            {
              PUIWatchBundleIDForBundleID(v70);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              PUIDisplayNameForWatchApp(v40);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v40;
              if (!v40)
              {
LABEL_30:
                -[NSArray addObject:](v73, "addObject:", v13);

                break;
              }
            }
            v67 = v33;
            v59 = 1;
LABEL_36:
            if (objc_msgSend(v21, "length"))
            {
              v22 = 0;
              v25 = 0;
              v20 = v65;
            }
            else
            {
              v34 = v70;
              if (v67)
                v34 = v67;
              v27 = v34;

              _PUILoggingFacility();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v83 = v27;
                _os_log_impl(&dword_1DB1FB000, v26, OS_LOG_TYPE_DEFAULT, "No display name found for application: %@", buf, 0xCu);
              }
              v61 = 0;
              v63 = 0;
LABEL_50:

              v21 = v27;
              v20 = v65;
              v22 = (void *)v61;
              v25 = v63;
            }
            v24 = v67;
            v23 = v59;
LABEL_52:
            v62 = v22;
            v64 = v25;
            v68 = v24;
            v66 = v20;
            objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, 0, 0, objc_opt_class(), 1, 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              PSBlankIconImage();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setProperty:forKey:", v36, v54);

              objc_initWeak((id *)buf, self);
              v75[0] = MEMORY[0x1E0C809B0];
              v75[1] = 3221225472;
              v75[2] = __81__PUILocationServicesListController_locationDetailSpecifiersWithDetailsMatching___block_invoke;
              v75[3] = &unk_1EA26B5F0;
              v76 = v35;
              objc_copyWeak(&v77, (id *)buf);
              objc_msgSend(v56, "getIconForBundleID:iconVariant:block:timeout:", v68, v55, v75, -1.0);
              objc_destroyWeak(&v77);

              objc_destroyWeak((id *)buf);
            }
            else if (v19 == 1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setProperty:forKey:", v37, v52);

              objc_msgSend(v35, "setProperty:forKey:", v70, v49);
            }
            else if (v19 == 2 && v62)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setProperty:forKey:", v38, v52);

              objc_msgSend(v35, "setProperty:forKey:", v62, CFSTR("_BundleUrl_"));
            }
            objc_msgSend(v35, "setProperty:forKey:", v13, v58);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v66);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setProperty:forKey:", v39, CFSTR("WebApp"));

            objc_msgSend(v35, "setProperty:forKey:", objc_opt_class(), v57);
            objc_msgSend(v60, "addObject:", v35);

            break;
          case 2:
            objc_msgSend(v14, "objectForKey:", CFSTR("BundlePath"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", v63);
            -[NSObject objectForInfoDictionaryKey:](v26, "objectForInfoDictionaryKey:", v51);
            v27 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "length"))
            {
              -[NSObject bundleURL](v26, "bundleURL");
              v61 = objc_claimAutoreleasedReturnValue();
              v65 = 0;
              v59 = 0;
              v67 = 0;
              v70 = 0;
            }
            else
            {
              objc_msgSend(v63, "lastPathComponent");
              v31 = objc_claimAutoreleasedReturnValue();

              _PUILoggingFacility();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v83 = v63;
                _os_log_impl(&dword_1DB1FB000, v32, OS_LOG_TYPE_DEFAULT, "No display name found for bundle: %@", buf, 0xCu);
              }

              v61 = 0;
              v65 = 0;
              v59 = 0;
              v67 = 0;
              v70 = 0;
              v27 = (id)v31;
            }
            goto LABEL_50;
          case 3:
            goto LABEL_52;
          case 4:
            goto LABEL_20;
          default:
            if (v18 == 16)
              goto LABEL_20;
            v22 = 0;
            v23 = 0;
            v24 = 0;
            v25 = 0;
            v70 = 0;
            if (v18 == 32)
              goto LABEL_20;
            goto LABEL_52;
        }
LABEL_60:

        ++v12;
      }
      while (v11 != v12);
      v41 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
      v11 = v41;
      if (!v41)
      {
LABEL_66:

        objc_msgSend(v60, "sortUsingFunction:context:", PUICompareSpecifiersByName, 0);
        break;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationServicesListController specifier](self, "specifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "isEqualToString:", CFSTR("APP_CLIPS")))
    v45 = CFSTR("PUIClipLocationIndicatorExplanationView");
  else
    v45 = CFSTR("PUILocationIndicatorExplanationView");
  objc_msgSend(v42, "setProperty:forKey:", v45, *MEMORY[0x1E0D80818]);

  objc_msgSend(v42, "setProperty:forKey:", CFSTR("APP"), CFSTR("_ExplanationIdSuffix_"));
  objc_msgSend(v50, "addObject:", v42);
  objc_msgSend(v50, "addObjectsFromArray:", v60);
  ignoredLocationEntities = self->_ignoredLocationEntities;
  self->_ignoredLocationEntities = v73;

  -[PUILocationServicesListController startLocationStatusUpdates](self, "startLocationStatusUpdates");
  return v50;
}

void __81__PUILocationServicesListController_locationDetailSpecifiersWithDetailsMatching___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PUILocationServicesListController_locationDetailSpecifiersWithDetailsMatching___block_invoke_2;
  block[3] = &unk_1EA26B5C8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

}

void __81__PUILocationServicesListController_locationDetailSpecifiersWithDetailsMatching___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80870]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));

}

- (id)loadSensorKitSpecifiersProvider
{
  void *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  id v7;

  PSBundlePathForPreferenceBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = (objc_class *)objc_msgSend(v3, "classNamed:", CFSTR("SRRelatedSpecifiers"))) != 0)
  {
    v6 = objc_alloc_init(v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x1E0D80990]);
}

- (void)_locationSharingSpecifierWasTapped:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0D20660];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  objc_msgSend(v7, "setSpecifier:", v5);

  objc_msgSend(v7, "setParentController:", self);
  -[PUILocationServicesListController rootController](self, "rootController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRootController:", v6);

  -[PUILocationServicesListController showController:animate:](self, "showController:animate:", v7, 1);
}

- (id)accountStore
{
  ACAccountStore *accountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (id)primaryAccount
{
  ACAccount *primaryAccount;
  void *v4;
  ACAccount *v5;
  ACAccount *v6;

  primaryAccount = self->_primaryAccount;
  if (!primaryAccount)
  {
    -[PUILocationServicesListController accountStore](self, "accountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_primaryAppleAccount");
    v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v6 = self->_primaryAccount;
    self->_primaryAccount = v5;

    primaryAccount = self->_primaryAccount;
  }
  return primaryAccount;
}

- (BOOL)_shouldEnableLocationSharingSpecifier
{
  int v3;
  void *v4;
  void *v5;

  if ((objc_msgSend((id)objc_opt_class(), "isLocationRestricted") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[PUILocationServicesListController primaryAccount](self, "primaryAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "aa_isPrimaryEmailVerified"))
    {
      -[PUILocationServicesListController primaryAccount](self, "primaryAccount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "aa_needsToVerifyTerms") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (BOOL)isLocationSharingModificationAllowed
{
  return isModificationAllowedForID(CFSTR("com.apple.findmy"));
}

- (id)locationSharingSpecifiers
{
  NSObject *v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[16];

  if (!PSIsInEDUMode())
  {
    v5 = -[PUILocationServicesListController _shouldEnableLocationSharingSpecifier](self, "_shouldEnableLocationSharingSpecifier");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", CFSTR("LOCATION_SHARING_GROUP"), *MEMORY[0x1E0D80868]);
    objc_msgSend(v6, "addObject:", v7);
    v8 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServices(CFSTR("LOCATION_SHARING"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setControllerLoadAction:", sel__locationSharingSpecifierWasTapped_);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v11, *MEMORY[0x1E0D80808]);

    objc_msgSend(v10, "setIdentifier:", CFSTR("LOCATION_SHARING"));
    objc_msgSend(v6, "addObject:", v10);
    if (!v5 || !-[PUILocationServicesListController isLocationSharingEnabled](self, "isLocationSharingEnabled"))
      goto LABEL_16;
    -[PUILocationServicesListController locationSharingDevice](self, "locationSharingDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isThisDevice"))
    {
      if (objc_msgSend(getCLLocationManagerClass_0(), "locationServicesEnabled"))
        v13 = CFSTR("LOCATION_SHARING_FOOTER");
      else
        v13 = CFSTR("LOCATION_SHARING_DISABLED_FOOTER");
      PUI_LocalizedStringForLocationServices(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "deviceName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
LABEL_15:

LABEL_16:
        return v6;
      }
      v16 = (void *)MEMORY[0x1E0CB3940];
      PUI_LocalizedStringForLocationServices(CFSTR("LOCATION_SHARING_FOOTER"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v17, v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "setProperty:forKey:", v14, *MEMORY[0x1E0D80848]);

    goto LABEL_15;
  }
  _PUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB1FB000, v3, OS_LOG_TYPE_DEFAULT, "Configuration does not want location sharing specifiers.", buf, 2u);
  }

  return 0;
}

- (void)updateLocationSharingSpecifiersWithReload:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *locationSharingAppList;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  id v18;

  v3 = a3;
  self->receivedAppListFromCoreLocation = 0;
  locationSharingAppList = self->locationSharingAppList;
  self->locationSharingAppList = 0;

  if (v3)
  {
    v6 = -[PUILocationServicesListController indexOfSpecifierID:](self, "indexOfSpecifierID:", CFSTR("LOCATION_SHARING_GROUP"));
    -[PUILocationServicesListController locationSharingSpecifiers](self, "locationSharingSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7)
    {
      v9 = objc_msgSend(v7, "count");
      if (v9 >= 1)
      {
        v10 = 0;
        v11 = *MEMORY[0x1E0D80868];
        do
        {
          -[PUILocationServicesListController specifierAtIndex:](self, "specifierAtIndex:", v6 + v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "propertyForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setProperty:forKey:", v13, v11);

          }
          ++v10;
        }
        while (v9 != v10);
      }
      -[PUILocationServicesListController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", v6, v9, v8);
    }

  }
  -[PUILocationServicesListController specifierForID:](self, "specifierForID:", CFSTR("/System/Library/PrivateFrameworks/FMF.framework"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v18 = v15;
    v16 = !+[PUILocationServicesListController isLocationRestricted](PUILocationServicesListController, "isLocationRestricted")&& -[PUILocationServicesListController isLocationSharingModificationAllowed](self, "isLocationSharingModificationAllowed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setProperty:forKey:", v17, *MEMORY[0x1E0D80808]);

    v15 = v18;
    if (v3)
    {
      -[PUILocationServicesListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v18, 1);
      v15 = v18;
    }
  }

}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  return 1;
}

- (id)specifiers
{
  id *v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *locationServicesAccessQueue;
  id v36;
  void *v38;
  _QWORD block[5];
  id v40;
  id v41;
  id location;
  NSRange v43;

  v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  v4 = *v3;
  if (!*v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MGGetBoolAnswer();
    PUI_LocalizedStringForLocationServices(CFSTR("ABOUT_LOCATION_AND_PRIVACY"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    SFLocalizableWAPIStringKeyForKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForLocationServices(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@"), v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v7 & 1) == 0 && (objc_msgSend(MEMORY[0x1E0D80508], "wifiEnabled") & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      SFLocalizableWAPIStringKeyForKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PUI_LocalizedStringForLocationServices(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@\n\n%@"), v15, v12);
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v16;
    }
    v17 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isPaired");

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      PUI_LocalizedStringForLocationServices(CFSTR("DESCRIPTION_WATCH"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@\n\n%@"), v12, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v22;
    }
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v24, *MEMORY[0x1E0D80818]);

    objc_msgSend(v6, "setProperty:forKey:", v12, *MEMORY[0x1E0D80838]);
    v43.location = objc_msgSend(v12, "rangeOfString:", v8);
    NSStringFromRange(v43);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v25, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v26, *MEMORY[0x1E0D80830]);

    objc_msgSend(v6, "setProperty:forKey:", CFSTR("showLocationPrivacyPage"), *MEMORY[0x1E0D80820]);
    objc_msgSend(v5, "addObject:", v6);
    v27 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServices(CFSTR("LOCATION_SERVICES"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, self, sel_setLocationServicesEnabled_specifier_, sel_isLocationServicesEnabled_, 0, 6, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v29);
    v30 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServices(CFSTR("PRIVACY_ALERTS"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v31, self, 0, 0, objc_opt_class(), 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "setIdentifier:", CFSTR("LOCATION_ALERTS"));
    objc_msgSend(v5, "addObject:", v32);
    objc_msgSend(v5, "lastObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setProperty:forKey:", CFSTR("LOCATION_SERVICES_MASTER"), *MEMORY[0x1E0D80868]);
    objc_initWeak(&location, self);
    if (self->receivedAppListFromCoreLocation)
    {
      objc_msgSend(v5, "addObjectsFromArray:", self->locationSharingAppList);
    }
    else
    {
      v38 = v29;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      locationServicesAccessQueue = self->locationServicesAccessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__PUILocationServicesListController_specifiers__block_invoke;
      block[3] = &unk_1EA26B5C8;
      block[4] = self;
      v40 = v34;
      v36 = v34;
      objc_copyWeak(&v41, &location);
      dispatch_async(locationServicesAccessQueue, block);
      objc_destroyWeak(&v41);

      v29 = v38;
      v17 = (void *)v8;
    }
    objc_storeStrong(v3, v5);
    -[PUILocationServicesListController updateSpecifiersForImposedSettingsWithReload:](self, "updateSpecifiersForImposedSettingsWithReload:", 0);
    -[PUILocationServicesListController updateLocationSharing](self, "updateLocationSharing");
    -[PUILocationServicesListController updateTribecaText](self, "updateTribecaText");
    objc_destroyWeak(&location);

    v4 = *v3;
  }
  return v4;
}

void __47__PUILocationServicesListController_specifiers__block_invoke(id *a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = objc_msgSend(getCLLocationManagerClass_0(), "locationServicesEnabled");
  objc_msgSend(a1[4], "locationSharingSpecifiers");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v2)
  {
    v5 = 0;
    if (!v3)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(a1[4], "locationDetailSpecifiersForAppsAndBundles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
LABEL_5:
    objc_msgSend(a1[5], "addObjectsFromArray:", v4);
LABEL_6:
  if (v5)
    objc_msgSend(a1[5], "addObjectsFromArray:", v5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PUILocationServicesListController_specifiers__block_invoke_2;
  v6[3] = &unk_1EA26B410;
  objc_copyWeak(&v8, a1 + 6);
  v7 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v8);
}

void __47__PUILocationServicesListController_specifiers__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = (void *)WeakRetained[188];
    WeakRetained[188] = v2;

    *((_BYTE *)WeakRetained + 1496) = 1;
  }
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id CLLocationManagerClass_0;
  NSDictionary *locationEntitiesDetails;
  void *v17;
  objc_super v19;

  v6 = a4;
  v7 = a3;
  v8 = -[PUILocationServicesListController indexForIndexPath:](self, "indexForIndexPath:", v6);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)PUILocationServicesListController;
  -[PUILocationServicesListController tableView:cellForRowAtIndexPath:](&v19, sel_tableView_cellForRowAtIndexPath_, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationServicesListController setUsage:forCell:](self, "setUsage:forCell:", -[PUILocationServicesListController locationUsageForEntity:](self, "locationUsageForEntity:", v11), v10);

  if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("SYSTEM_SERVICES")) & 1) != 0)
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("APP_CLIPS"));

    if ((v14 & 1) == 0)
    {
      CLLocationManagerClass_0 = getCLLocationManagerClass_0();
      locationEntitiesDetails = self->_locationEntitiesDetails;
      objc_msgSend(v9, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](locationEntitiesDetails, "objectForKey:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUILocationServicesListController setAuthLevel:forCell:](self, "setAuthLevel:forCell:", objc_msgSend(CLLocationManagerClass_0, "entityAuthorizationForLocationDictionary:", v17), v10);

      goto LABEL_5;
    }
  }
LABEL_6:

  return v10;
}

- (NSOperationQueue)locationSharingOperationQueue
{
  NSOperationQueue *locationSharingOperationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  locationSharingOperationQueue = self->_locationSharingOperationQueue;
  if (!locationSharingOperationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = self->_locationSharingOperationQueue;
    self->_locationSharingOperationQueue = v4;

    -[NSOperationQueue setName:](self->_locationSharingOperationQueue, "setName:", CFSTR("location sharing operation queue"));
    locationSharingOperationQueue = self->_locationSharingOperationQueue;
  }
  return locationSharingOperationQueue;
}

- (FMFSession)locationSharingSession
{
  FMFSession *locationSharingSession;
  id v4;
  void *v5;
  FMFSession *v6;
  FMFSession *v7;

  locationSharingSession = self->_locationSharingSession;
  if (!locationSharingSession)
  {
    v4 = objc_alloc(MEMORY[0x1E0D20260]);
    -[PUILocationServicesListController locationSharingOperationQueue](self, "locationSharingOperationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (FMFSession *)objc_msgSend(v4, "initWithDelegate:delegateQueue:", self, v5);
    v7 = self->_locationSharingSession;
    self->_locationSharingSession = v6;

    locationSharingSession = self->_locationSharingSession;
  }
  return locationSharingSession;
}

- (void)updateLocationSharing
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[PUILocationServicesListController locationSharingSession](self, "locationSharingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PUILocationServicesListController_updateLocationSharing__block_invoke;
  v8[3] = &unk_1EA26C8D0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "isMyLocationEnabled:", v8);

  -[PUILocationServicesListController locationSharingSession](self, "locationSharingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __58__PUILocationServicesListController_updateLocationSharing__block_invoke_369;
  v6[3] = &unk_1EA26C8F8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "getActiveLocationSharingDevice:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__PUILocationServicesListController_updateLocationSharing__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _PUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, "locationSharingEnabled error %@", (uint8_t *)&v8, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didUpdateHidingStatus:", a2 ^ 1u);

}

void __58__PUILocationServicesListController_updateLocationSharing__block_invoke_369(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _PUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "locationSharingDevice error %@", (uint8_t *)&v9, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didChangeActiveLocationSharingDevice:", v5);

}

- (BOOL)isLocationSharingEnabled
{
  return -[NSNumber BOOLValue](self->_locationSharingEnabled, "BOOLValue");
}

- (void)mainThreadConnectionError:(id)a3
{
  FMFSession *locationSharingSession;

  locationSharingSession = self->_locationSharingSession;
  self->_locationSharingSession = 0;

  -[PUILocationServicesListController mainThreadDidChangeActiveLocationSharingDevice:](self, "mainThreadDidChangeActiveLocationSharingDevice:", 0);
}

- (void)mainThreadDidChangeActiveLocationSharingDevice:(id)a3
{
  FMFDevice *v5;
  FMFDevice *v6;

  v5 = (FMFDevice *)a3;
  if (self->_locationSharingDevice != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_locationSharingDevice, a3);
    -[PUILocationServicesListController updateLocationSharingSpecifiersWithReload:](self, "updateLocationSharingSpecifiersWithReload:", 1);
    v5 = v6;
  }

}

- (void)mainThreadDidUpdateHidingStatus:(BOOL)a3
{
  _BOOL4 v3;
  NSNumber *locationSharingEnabled;
  NSNumber *v6;
  NSNumber *v7;

  v3 = a3;
  locationSharingEnabled = self->_locationSharingEnabled;
  if (!locationSharingEnabled || -[NSNumber BOOLValue](locationSharingEnabled, "BOOLValue") == a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v3);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_locationSharingEnabled;
    self->_locationSharingEnabled = v6;

    -[PUILocationServicesListController updateLocationSharingSpecifiersWithReload:](self, "updateLocationSharingSpecifiersWithReload:", 1);
  }
}

- (void)connectionError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PUILocationServicesListController_connectionError___block_invoke;
  v6[3] = &unk_1EA26B438;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __53__PUILocationServicesListController_connectionError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mainThreadConnectionError:", *(_QWORD *)(a1 + 40));
}

- (void)didChangeActiveLocationSharingDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__PUILocationServicesListController_didChangeActiveLocationSharingDevice___block_invoke;
  v6[3] = &unk_1EA26B438;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __74__PUILocationServicesListController_didChangeActiveLocationSharingDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mainThreadDidChangeActiveLocationSharingDevice:", *(_QWORD *)(a1 + 40));
}

- (void)didUpdateHidingStatus:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PUILocationServicesListController_didUpdateHidingStatus___block_invoke;
  v3[3] = &unk_1EA26C920;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

uint64_t __59__PUILocationServicesListController_didUpdateHidingStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mainThreadDidUpdateHidingStatus:", *(unsigned __int8 *)(a1 + 40));
}

- (void)updateTribecaText
{
  void *v3;
  int v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isInternalInstall");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__PUILocationServicesListController_updateTribecaText__block_invoke;
    v6[3] = &unk_1EA26C948;
    v6[4] = self;
    objc_msgSend(v5, "fmipStateWithCompletion:", v6);

  }
}

void __54__PUILocationServicesListController_updateTribecaText__block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    if (a2 >= 3)
    {
      _PUILoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[PUILocationServicesListController updateTribecaText]_block_invoke";
        _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "%s: FMIP state is off or unknown.", buf, 0xCu);
      }

      PUITribecaSupportedText();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__PUILocationServicesListController_updateTribecaText__block_invoke_372;
    v9[3] = &unk_1EA26B438;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

void __54__PUILocationServicesListController_updateTribecaText__block_invoke_372(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tribecaSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "tribecaSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeSpecifier:animated:", v4, 1);

  }
  v5 = *(_QWORD *)(a1 + 40);
  _PUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[PUILocationServicesListController updateTribecaText]_block_invoke";
      _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "%s: showing tribeca text", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("TRIBECA_GROUP"));
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D80848]);
    objc_msgSend(*(id *)(a1 + 32), "setTribecaSpecifier:", v7);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "tribecaSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "specifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSpecifier:afterSpecifier:", v9, v11);

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __54__PUILocationServicesListController_updateTribecaText__block_invoke_372_cold_1(v7);
  }

}

- (NSMutableArray)coalescedImproveMapsServices
{
  return self->_coalescedImproveMapsServices;
}

- (void)setCoalescedImproveMapsServices:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedImproveMapsServices, a3);
}

- (void)setLocationSharingOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_locationSharingOperationQueue, a3);
}

- (void)setLocationSharingSession:(id)a3
{
  objc_storeStrong((id *)&self->_locationSharingSession, a3);
}

- (FMFDevice)locationSharingDevice
{
  return self->_locationSharingDevice;
}

- (void)setLocationSharingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_locationSharingDevice, a3);
}

- (NSNumber)locationSharingEnabled
{
  return self->_locationSharingEnabled;
}

- (void)setLocationSharingEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_locationSharingEnabled, a3);
}

- (PSSpecifier)tribecaSpecifier
{
  return self->_tribecaSpecifier;
}

- (void)setTribecaSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_tribecaSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tribecaSpecifier, 0);
  objc_storeStrong((id *)&self->_locationSharingEnabled, 0);
  objc_storeStrong((id *)&self->_locationSharingDevice, 0);
  objc_storeStrong((id *)&self->_locationSharingSession, 0);
  objc_storeStrong((id *)&self->_locationSharingOperationQueue, 0);
  objc_storeStrong((id *)&self->_coalescedImproveMapsServices, 0);
  objc_storeStrong((id *)&self->locationSharingAppList, 0);
  objc_storeStrong((id *)&self->locationServicesAccessQueue, 0);
  objc_storeStrong((id *)&self->_sensorKitSpecifiersProvider, 0);
  objc_storeStrong((id *)&self->_isLocationServicesEnabled, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_twentyFourHoursAgo, 0);
  objc_storeStrong((id *)&self->_coalesceAppKeys, 0);
  objc_storeStrong((id *)&self->_ignoredLocationEntities, 0);
  objc_storeStrong((id *)&self->_coalescedSystemCutomizationSystemServices, 0);
  objc_storeStrong((id *)&self->_coalescedWirelessSystemServices, 0);
  objc_storeStrong((id *)&self->_coalescedRoutingAndTrafficSystemServices, 0);
  objc_storeStrong((id *)&self->_coalescedHomeKitSystemServices, 0);
  objc_storeStrong((id *)&self->_coalescedLocationBasedAlertsSystemServices, 0);
  objc_storeStrong((id *)&self->_locationEntitiesDetails, 0);
}

void __56__PUILocationServicesListController_updateLocationUsage__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[PUILocationServicesListController updateLocationUsage]_block_invoke";
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1DB1FB000, v0, v1, "%s: No specifier found for key: %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setLocationServicesEnabled:.cold.1()
{
  __assert_rtn("-[PUILocationServicesListController _setLocationServicesEnabled:]", "PUILocationServicesListController.m", 1239, "sharingRange.location != NSNotFound");
}

void __54__PUILocationServicesListController_updateTribecaText__block_invoke_372_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[PUILocationServicesListController updateTribecaText]_block_invoke";
  _os_log_error_impl(&dword_1DB1FB000, log, OS_LOG_TYPE_ERROR, "%s: should show tribeca text, but text was nil!", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
