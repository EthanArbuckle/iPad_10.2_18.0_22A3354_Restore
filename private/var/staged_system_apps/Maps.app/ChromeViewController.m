@implementation ChromeViewController

- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ChromeViewController *v12;
  ChromeViewController *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id v24;
  NSObject *v25;
  ChromeViewController *v26;
  ChromeViewController *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  ChromeViewController *v34;
  id v35;
  NSObject *v36;
  ChromeViewController *v37;
  ChromeViewController *v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  id v45;
  NSObject *v46;
  ChromeViewController *v47;
  ChromeViewController *v48;
  objc_class *v49;
  NSString *v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  uint64_t v58;
  id v60;
  id v61;
  id v62;
  uint8_t buf[4];
  __CFString *v64;
  __int16 v65;
  const __CFString *v66;

  v8 = a4;
  v9 = a5;
  v10 = sub_100949148();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    goto LABEL_14;
  v12 = self;
  v13 = v12;
  if (!v12)
  {
    v19 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v14 = (objc_class *)objc_opt_class(v12);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
    v18 = v17;
    if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
    {
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

      goto LABEL_8;
    }

  }
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_8:

LABEL_10:
  if ((unint64_t)(a3 - 1) > 0x16)
    v20 = CFSTR("kMapsInterruptionNone");
  else
    v20 = *(&off_1011DC8E0 + a3 - 1);
  *(_DWORD *)buf = 138543618;
  v64 = v19;
  v65 = 2112;
  v66 = v20;
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting interruption of kind: %@", buf, 0x16u);

LABEL_14:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v21, "presentInterruptionOfKind:userInfo:completionHandler:") & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;
  if ((objc_opt_respondsToSelector(v23, "canPresentInterruptionOfKind:") & 1) != 0
    && -[__CFString canPresentInterruptionOfKind:](v23, "canPresentInterruptionOfKind:", a3))
  {
    v24 = sub_100949148();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
LABEL_52:

      v58 = objc_claimAutoreleasedReturnValue(-[__CFString presentInterruptionOfKind:userInfo:completionHandler:](v23, "presentInterruptionOfKind:userInfo:completionHandler:", a3, v8, v9));
LABEL_56:
      v55 = (void *)v58;
      goto LABEL_57;
    }
    v26 = self;
    v27 = v26;
    if (!v26)
    {
      v33 = CFSTR("<nil>");
      goto LABEL_51;
    }
    v28 = (objc_class *)objc_opt_class(v26);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if ((objc_opt_respondsToSelector(v27, "accessibilityIdentifier") & 1) != 0)
    {
      v60 = v8;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v27, "performSelector:", "accessibilityIdentifier"));
      v32 = v31;
      if (v31 && !objc_msgSend(v31, "isEqualToString:", v30))
      {
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v30, v27, v32));

        v8 = v60;
        goto LABEL_26;
      }

      v8 = v60;
    }
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v30, v27));
LABEL_26:

LABEL_51:
    *(_DWORD *)buf = 138543618;
    v64 = v33;
    v65 = 2112;
    v66 = v23;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Asking context %@ to present the interruption", buf, 0x16u);

    goto LABEL_52;
  }
  if (-[ChromeViewController conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___InterruptionManagerProtocol))
  {
    v34 = self;
    v35 = sub_100949148();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
LABEL_48:

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController interruptionManager](v34, "interruptionManager"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "presentUnhandledInterruptionOfKind:userInfo:completionHandler:", a3, v8, v9));

      goto LABEL_57;
    }
    v37 = v34;
    v38 = v37;
    v61 = v8;
    if (!v37)
    {
      v44 = CFSTR("<nil>");
      goto LABEL_47;
    }
    v39 = (objc_class *)objc_opt_class(v37);
    v40 = NSStringFromClass(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    if ((objc_opt_respondsToSelector(v38, "accessibilityIdentifier") & 1) != 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v38, "performSelector:", "accessibilityIdentifier"));
      v43 = v42;
      if (v42 && !objc_msgSend(v42, "isEqualToString:", v41))
      {
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v41, v38, v43));

        goto LABEL_35;
      }

    }
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v41, v38));
LABEL_35:

LABEL_47:
    v56 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ChromeViewController interruptionManager](v38, "interruptionManager"));
    *(_DWORD *)buf = 138543618;
    v64 = v44;
    v65 = 2112;
    v66 = v56;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Asking interruption manager %@ to present the interruption", buf, 0x16u);

    v8 = v61;
    goto LABEL_48;
  }
  if ((objc_opt_respondsToSelector(self, "presentUnhandledInterruptionOfKind:userInfo:completionHandler:") & 1) != 0)
  {
    v45 = sub_100949148();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
LABEL_55:

      v58 = objc_claimAutoreleasedReturnValue(-[ChromeViewController presentUnhandledInterruptionOfKind:userInfo:completionHandler:](self, "presentUnhandledInterruptionOfKind:userInfo:completionHandler:", a3, v8, v9));
      goto LABEL_56;
    }
    v47 = self;
    v48 = v47;
    v62 = v8;
    if (!v47)
    {
      v54 = CFSTR("<nil>");
      goto LABEL_54;
    }
    v49 = (objc_class *)objc_opt_class(v47);
    v50 = NSStringFromClass(v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    if ((objc_opt_respondsToSelector(v48, "accessibilityIdentifier") & 1) != 0)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v48, "performSelector:", "accessibilityIdentifier"));
      v53 = v52;
      if (v52 && !objc_msgSend(v52, "isEqualToString:", v51))
      {
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v51, v48, v53));

        goto LABEL_44;
      }

    }
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v51, v48));
LABEL_44:

LABEL_54:
    *(_DWORD *)buf = 138543362;
    v64 = v54;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling the interruption ourselves", buf, 0xCu);

    v8 = v62;
    goto LABEL_55;
  }
  v55 = 0;
LABEL_57:

  return v55;
}

- (id)presentUnhandledInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  return 0;
}

- (BOOL)dismissCurrentInterruptionOfKind:(int64_t)a3
{
  return 1;
}

+ (id)localizedLocationAuthorizationMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("NSLocationWhenInUseUsageDescription")));

  return v3;
}

+ (id)localizedLocationAuthorizationTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Allow '%@' to use your location?"), CFSTR("localized string not found"), 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5));

  return v6;
}

- (ChromeViewController)init
{
  ChromeViewController *v2;
  id v3;
  NSObject *v4;
  ChromeViewController *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *currentMapViewRateLimits;
  uint64_t v14;
  MapsThermalPressureController *thermalPressureController;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BatteryMonitorToken *batteryMonitorToken;
  MapsTokenStorage *v26;
  MapsTokenStorage *deactivationTokens;
  MapsTokenStorage *v28;
  MapsTokenStorage *hikingMapTokens;
  uint64_t v30;
  NSMapTable *hikingCoordinateChecks;
  MapsTokenStorage *v32;
  MapsTokenStorage *mapInsetPropagationSuspensionTokens;
  NSArray *v34;
  NSArray *contexts;
  uint64_t v36;
  NSMapTable *contextsByUniqueIdentifier;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  id debugForceDeactivationToken;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  id v48;
  NSObject *v49;
  id v50;
  NSObject *v51;
  char *v52;
  objc_super v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  const char *v61;

  v53.receiver = self;
  v53.super_class = (Class)ChromeViewController;
  v2 = -[ChromeViewController initWithNibName:bundle:](&v53, "initWithNibName:bundle:", 0, 0);
  if (!v2)
    return v2;
  v3 = sub_10043196C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v2;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v55 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Initializing", buf, 0xCu);

  }
  v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  currentMapViewRateLimits = v2->_currentMapViewRateLimits;
  v2->_currentMapViewRateLimits = v12;

  v14 = objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  thermalPressureController = v2->_thermalPressureController;
  v2->_thermalPressureController = (MapsThermalPressureController *)v14;

  if (!v2->_thermalPressureController)
  {
    v48 = sub_1004318FC();
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v55 = "-[ChromeViewController init]";
      v56 = 2080;
      v57 = "ChromeViewController.m";
      v58 = 1024;
      v59 = 248;
      v60 = 2080;
      v61 = "_thermalPressureController != nil";
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v50 = sub_1004318FC();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v55 = v52;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  -[MapsThermalPressureController addThermalPressureObserver:](v2->_thermalPressureController, "addThermalPressureObserver:", v2);
  v16 = -[ChromeViewController thermalRateLimitsConfigKey](v2, "thermalRateLimitsConfigKey");
  if ((_DWORD)v16 && v17)
    _GEOConfigAddDelegateListenerForKey(v16, v17, &_dispatch_main_q, v2);
  v18 = -[ChromeViewController batteryLevelRateLimitEnabledConfigKey](v2, "batteryLevelRateLimitEnabledConfigKey");
  if ((_DWORD)v18 && v19)
    _GEOConfigAddDelegateListenerForKey(v18, v19, &_dispatch_main_q, v2);
  v20 = -[ChromeViewController lowPowerModeRateLimitEnabledConfigKey](v2, "lowPowerModeRateLimitEnabledConfigKey");
  if ((_DWORD)v20 && v21)
    _GEOConfigAddDelegateListenerForKey(v20, v21, &_dispatch_main_q, v2);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v22, "addObserver:selector:name:object:", v2, "powerStateDidChangeNotification:", NSProcessInfoPowerStateDidChangeNotification, 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[BatteryMonitorController sharedInstance](BatteryMonitorController, "sharedInstance"));
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "beginMonitoringBattery"));
  batteryMonitorToken = v2->_batteryMonitorToken;
  v2->_batteryMonitorToken = (BatteryMonitorToken *)v24;

  -[BatteryMonitorToken setDelegate:](v2->_batteryMonitorToken, "setDelegate:", v2);
  v26 = -[MapsTokenStorage initWithDelegate:tokenGroupName:callbackQueue:]([MapsTokenStorage alloc], "initWithDelegate:tokenGroupName:callbackQueue:", v2, CFSTR("ChromeDeactivation"), &_dispatch_main_q);
  deactivationTokens = v2->_deactivationTokens;
  v2->_deactivationTokens = v26;

  v28 = -[MapsTokenStorage initWithDelegate:tokenGroupName:callbackQueue:]([MapsTokenStorage alloc], "initWithDelegate:tokenGroupName:callbackQueue:", v2, CFSTR("ChromeHiking"), &_dispatch_main_q);
  hikingMapTokens = v2->_hikingMapTokens;
  v2->_hikingMapTokens = v28;

  v30 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  hikingCoordinateChecks = v2->_hikingCoordinateChecks;
  v2->_hikingCoordinateChecks = (NSMapTable *)v30;

  v32 = -[MapsTokenStorage initWithDelegate:tokenGroupName:callbackQueue:]([MapsTokenStorage alloc], "initWithDelegate:tokenGroupName:callbackQueue:", v2, CFSTR("ChromeMapInsetPropagationSuspension"), &_dispatch_main_q);
  mapInsetPropagationSuspensionTokens = v2->_mapInsetPropagationSuspensionTokens;
  v2->_mapInsetPropagationSuspensionTokens = v32;

  v34 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  contexts = v2->_contexts;
  v2->_contexts = v34;

  if (objc_msgSend((id)objc_opt_class(v2), "requiresUniqueContextIdentifiers"))
  {
    v36 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    contextsByUniqueIdentifier = v2->_contextsByUniqueIdentifier;
    v2->_contextsByUniqueIdentifier = (NSMapTable *)v36;

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v39 = objc_msgSend(v38, "BOOLForKey:", CFSTR("__internal_MapsDebugForceChromeMapViewInactive"));

  if (v39)
  {
    v40 = objc_claimAutoreleasedReturnValue(-[ChromeViewController acquireChromeDeactivationTokenForReason:](v2, "acquireChromeDeactivationTokenForReason:", CFSTR("forced")));
    debugForceDeactivationToken = v2->_debugForceDeactivationToken;
    v2->_debugForceDeactivationToken = (id)v40;

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v2->_debugLayoutGuides = objc_msgSend(v42, "BOOLForKey:", CFSTR("__internal_VisualizeChromeLayoutGuidesDebug"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v43, "addObserver:selector:name:object:", v2, "userDefaultsDidChange:", NSUserDefaultsDidChangeNotification, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v45 = objc_msgSend(v44, "isInternalInstall");

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
    objc_msgSend(v46, "addAttachmentProvider:", v2);

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  ChromeViewController *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  __CFString *v20;

  v3 = sub_10043196C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Deallocating", buf, 0xCu);

  }
  if (self->_sceneForegroundingNotificationToken)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "removeObserver:", self->_sceneForegroundingNotificationToken);

  }
  GEOConfigRemoveDelegateListenerForAllKeys(self, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v16 = objc_msgSend(v15, "isInternalInstall");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
    objc_msgSend(v17, "removeAttachmentProvider:", self);

  }
  v18.receiver = self;
  v18.super_class = (Class)ChromeViewController;
  -[ChromeViewController dealloc](&v18, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  PassThroughView *v13;
  void *v14;
  objc_class *v15;
  NSString *v16;
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
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  MapsEdgeConstraints *v36;
  MapsEdgeConstraints *safeAreaMapEdgeInsetsConstraints;
  ChromeOverlayController *v38;
  ChromeOverlayController *overlayController;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id sceneForegroundingNotificationToken;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id obj;
  PassThroughView *v58;
  _QWORD v59[4];
  id v60;
  id location;
  objc_super v62;
  _QWORD v63[4];

  v62.receiver = self;
  v62.super_class = (Class)ChromeViewController;
  -[ChromeViewController viewDidLoad](&v62, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  if (-[ChromeViewController shouldAutomaticallyLoadMapView](self, "shouldAutomaticallyLoadMapView"))
    -[ChromeViewController loadMapViewIfNeeded](self, "loadMapViewIfNeeded");
  if (-[ChromeViewController isInactive](self, "isInactive"))
    -[ChromeViewController _setInactive:](self, "_setInactive:", self->_inactive);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeAreaLayoutGuide"));
  LODWORD(v7) = 1148829696;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_layoutGuideInsideEdgesWithPriority:", v7));

  objc_storeStrong((id *)&self->_viewportLayoutGuide, obj);
  v56 = objc_alloc_init((Class)UILayoutGuide);
  v8 = (objc_class *)objc_opt_class(ChromeViewController);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.mapInsetsLayoutGuide"), v10));
  objc_msgSend(v56, "setIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  objc_msgSend(v12, "addLayoutGuide:", v56);

  objc_storeStrong((id *)&self->_mapInsetsLayoutGuide, v56);
  v13 = [PassThroughView alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  objc_msgSend(v14, "bounds");
  v58 = -[PassThroughView initWithFrame:](v13, "initWithFrame:");

  -[PassThroughView setTranslatesAutoresizingMaskIntoConstraints:](v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (objc_class *)objc_opt_class(ChromeViewController);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.Viewport"), v17));
  -[PassThroughView setAccessibilityIdentifier:](v58, "setAccessibilityIdentifier:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  objc_msgSend(v19, "addSubview:", v58);

  objc_storeStrong((id *)&self->_viewport, v58);
  v55 = objc_alloc_init((Class)NSMutableArray);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughView leadingAnchor](v58, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
  v63[0] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughView topAnchor](v58, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v20));
  v63[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughView trailingAnchor](v58, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v63[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughView bottomAnchor](v58, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  v63[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 4));
  objc_msgSend(v55, "addObjectsFromArray:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  LODWORD(v30) = 1112014848;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v56, v30));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allConstraints"));
  objc_msgSend(v55, "addObjectsFromArray:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "safeAreaLayoutGuide"));
  LODWORD(v35) = 1112276992;
  v36 = (MapsEdgeConstraints *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v56, v35));
  safeAreaMapEdgeInsetsConstraints = self->_safeAreaMapEdgeInsetsConstraints;
  self->_safeAreaMapEdgeInsetsConstraints = v36;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);
  -[ChromeViewController _addWatermarkView](self, "_addWatermarkView");
  v38 = objc_alloc_init(ChromeOverlayController);
  overlayController = self->_overlayController;
  self->_overlayController = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
  objc_msgSend(v40, "setDelegate:", self);

  if (!-[ChromeViewController isSuppressed](self, "isSuppressed"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "safeAreaLayoutGuide"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController viewportLayoutGuide](self, "viewportLayoutGuide"));
    objc_msgSend(v41, "installInView:containingViewController:contentLayoutGuide:mapInsetsLayoutGuide:viewportLayoutGuide:", v42, self, v44, v45, v46);

  }
  objc_initWeak(&location, self);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100AA8D4C;
  v59[3] = &unk_1011AD288;
  objc_copyWeak(&v60, &location);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "addObserverForName:object:queue:usingBlock:", UISceneWillEnterForegroundNotification, 0, v48, v59));
  sceneForegroundingNotificationToken = self->_sceneForegroundingNotificationToken;
  self->_sceneForegroundingNotificationToken = v49;

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double width;
  double height;
  double v7;
  double v8;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)ChromeViewController;
  -[ChromeViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  -[ChromeViewController _updateDebugLayoutGuidesView](self, "_updateDebugLayoutGuidesView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  objc_msgSend(v3, "bringSubviewToFront:", self->_watermarkView);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v12 = CGRectIntegral(v11);
  width = v12.size.width;
  height = v12.size.height;

  v7 = self->_lastLayoutSize.width;
  v8 = self->_lastLayoutSize.height;
  if (v7 != width || v8 != height)
  {
    self->_lastLayoutSize.width = width;
    self->_lastLayoutSize.height = height;
    -[ChromeViewController setNeedsUpdateMapInsets](self, "setNeedsUpdateMapInsets", v7, v8);
  }
}

- (void)_addWatermarkView
{
  void *v3;
  unsigned int v4;
  WatermarkView *watermarkView;
  WatermarkView *v6;
  WatermarkView *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WatermarkView *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
  {
    watermarkView = self->_watermarkView;
    if (!watermarkView)
    {
      v6 = -[WatermarkView initWithFrame:]([WatermarkView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v7 = self->_watermarkView;
      self->_watermarkView = v6;

      -[WatermarkView setTranslatesAutoresizingMaskIntoConstraints:](self->_watermarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v8 = (objc_class *)objc_opt_class(ChromeViewController);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.watermark"), v10));
      -[WatermarkView setAccessibilityIdentifier:](self->_watermarkView, "setAccessibilityIdentifier:", v11);

      watermarkView = self->_watermarkView;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView superview](watermarkView, "superview"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));

    if (v12 != v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
      objc_msgSend(v14, "addSubview:", self->_watermarkView);

      v15 = self->_watermarkView;
      v19 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
      LODWORD(v16) = 1148846080;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView _maps_constraintsEqualToEdgesOfView:priority:](v15, "_maps_constraintsEqualToEdgesOfView:priority:", v19, v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

    }
  }
}

- (void)_removeWatermarkView
{
  WatermarkView *watermarkView;

  -[WatermarkView removeFromSuperview](self->_watermarkView, "removeFromSuperview");
  watermarkView = self->_watermarkView;
  self->_watermarkView = 0;

}

- (void)userDefaultsDidChange:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  id debugForceDeactivationToken;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v4 = objc_msgSend(v8, "BOOLForKey:", CFSTR("__internal_VisualizeChromeLayoutGuidesDebug"));
  if (self->_debugLayoutGuides != v4)
  {
    self->_debugLayoutGuides = v4;
    -[ChromeViewController _updateDebugLayoutGuidesView](self, "_updateDebugLayoutGuidesView");
  }
  v5 = objc_msgSend(v8, "BOOLForKey:", CFSTR("__internal_MapsDebugForceChromeMapViewInactive"));
  debugForceDeactivationToken = self->_debugForceDeactivationToken;
  if (v5)
  {
    if (!debugForceDeactivationToken)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController acquireChromeDeactivationTokenForReason:](self, "acquireChromeDeactivationTokenForReason:", CFSTR("forced")));
      debugForceDeactivationToken = self->_debugForceDeactivationToken;
LABEL_8:
      self->_debugForceDeactivationToken = v7;

    }
  }
  else if (debugForceDeactivationToken)
  {
    v7 = 0;
    goto LABEL_8;
  }

}

- (void)_updateDebugLayoutGuidesView
{
  DebugFramesView *debugLayoutGuidesView;
  DebugFramesView *v4;
  void *v5;
  DebugFramesView *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  DebugFramesView *v12;
  DebugFramesView *v13;
  void *v14;
  DebugFramesView *v15;
  DebugFramesView *v16;
  _QWORD block[5];

  if (-[ChromeViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      debugLayoutGuidesView = self->_debugLayoutGuidesView;
      if (self->_debugLayoutGuides)
      {
        if (!debugLayoutGuidesView)
        {
          v4 = [DebugFramesView alloc];
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
          objc_msgSend(v5, "bounds");
          v6 = -[DebugFramesView initWithFrame:](v4, "initWithFrame:");

          -[DebugFramesView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
          v7 = (objc_class *)objc_opt_class(ChromeViewController);
          v8 = NSStringFromClass(v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.debugFramesView"), v9));
          -[DebugFramesView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", v10);

          v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
          objc_msgSend(v11, "addSubview:", v6);

          v12 = self->_debugLayoutGuidesView;
          self->_debugLayoutGuidesView = v6;
          v13 = v6;

          -[ChromeViewController registerFramesInDebugFramesView:](self, "registerFramesInDebugFramesView:", v13);
          debugLayoutGuidesView = self->_debugLayoutGuidesView;
        }
        -[ChromeViewController updateFramesInDebugFramesView:](self, "updateFramesInDebugFramesView:", debugLayoutGuidesView);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
        objc_msgSend(v14, "bringSubviewToFront:", self->_debugLayoutGuidesView);

        v15 = self->_debugLayoutGuidesView;
        goto LABEL_7;
      }
      if (!debugLayoutGuidesView)
      {
        v15 = 0;
LABEL_7:
        -[DebugFramesView setNeedsDisplay](v15, "setNeedsDisplay");
        return;
      }
      -[DebugFramesView removeFromSuperview](self->_debugLayoutGuidesView, "removeFromSuperview");
      v16 = self->_debugLayoutGuidesView;
      self->_debugLayoutGuidesView = 0;

    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100AA9378;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)registerFramesInDebugFramesView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  objc_msgSend(v3, "registerName:color:weight:edges:", CFSTR("safe area"), v4, 15, 1.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v3, "registerName:color:weight:edges:", CFSTR("viewport"), v5, 15, 1.0);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGreenColor](UIColor, "systemDarkGreenColor"));
  objc_msgSend(v3, "registerName:color:weight:edges:", CFSTR("map insets"), v6, 15, 1.0);

}

- (void)updateFramesInDebugFramesView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeAreaLayoutGuide"));
  objc_msgSend(v4, "setLayoutGuide:forName:", v6, CFSTR("safe area"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController viewportLayoutGuide](self, "viewportLayoutGuide"));
  objc_msgSend(v4, "setLayoutGuide:forName:", v7, CFSTR("viewport"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
  objc_msgSend(v4, "setLayoutGuide:forName:", v8, CFSTR("map insets"));

}

- (id)contextProtocol
{
  return &OBJC_PROTOCOL___ChromeContext;
}

+ (BOOL)requiresUniqueContextIdentifiers
{
  return 0;
}

- (id)uniqueIdentifierForContext:(id)a3
{
  id v3;
  NSString *v4;
  void *v5;

  v3 = a3;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%p"), objc_opt_class(v3), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)contextForUniqueIdentifier:(id)a3
{
  return -[NSMapTable objectForKey:](self->_contextsByUniqueIdentifier, "objectForKey:", a3);
}

- (ChromeContext)topContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return (ChromeContext *)v3;
}

- (ChromeContext)previousTopContext
{
  return -[ChromeContextTransition previousTopContext](self->_currentContextTransition, "previousTopContext");
}

- (ChromeContext)nextTopContext
{
  return -[ChromeContextTransition nextTopContext](self->_currentContextTransition, "nextTopContext");
}

- (NSArray)pendingContexts
{
  return -[ChromeContextTransition pendingContexts](self->_currentContextTransition, "pendingContexts");
}

- (BOOL)isTopContext:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v6 = v5 == v4;

  return v6;
}

- (BOOL)isCurrentContext:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[ChromeViewController isSuppressed](self, "isSuppressed"))
    v5 = 0;
  else
    v5 = -[ChromeViewController isTopContext:](self, "isTopContext:", v4);

  return v5;
}

- (BOOL)hasDuplicatesOfContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100AA9754;
  v9[3] = &unk_1011E1680;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexesOfObjectsPassingTest:", v9));

  LOBYTE(v5) = (unint64_t)objc_msgSend(v7, "count") > 1;
  return (char)v5;
}

- (void)pushContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ChromeViewController *v15;
  BOOL v16;

  v8 = a3;
  v12 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100AA982C;
  v13[3] = &unk_1011E16A8;
  v16 = a4;
  v14 = v8;
  v15 = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100AA9D10;
  v11[3] = &unk_1011E16D0;
  v9 = v12;
  v10 = v8;
  -[ChromeViewController scheduleCoordinatedContextChange:completionHandler:](self, "scheduleCoordinatedContextChange:completionHandler:", v13, v11);

}

- (void)popToContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ChromeViewController *v15;
  BOOL v16;

  v8 = a3;
  v12 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100AA9DEC;
  v13[3] = &unk_1011E16A8;
  v14 = v8;
  v15 = self;
  v16 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100AAA0A4;
  v11[3] = &unk_1011E16D0;
  v9 = v12;
  v10 = v8;
  -[ChromeViewController scheduleCoordinatedContextChange:completionHandler:](self, "scheduleCoordinatedContextChange:completionHandler:", v13, v11);

}

- (void)popToRootContextAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  -[ChromeViewController popToContext:animated:completion:](self, "popToContext:animated:completion:", v7, v4, v6);

}

- (void)popContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  ChromeViewController *v15;
  BOOL v16;

  v8 = a3;
  v12 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100AAA1F4;
  v13[3] = &unk_1011E16A8;
  v14 = v8;
  v15 = self;
  v16 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100AAA51C;
  v11[3] = &unk_1011E16D0;
  v9 = v12;
  v10 = v8;
  -[ChromeViewController scheduleCoordinatedContextChange:completionHandler:](self, "scheduleCoordinatedContextChange:completionHandler:", v13, v11);

}

- (void)popContextAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  -[ChromeViewController popContext:animated:completion:](self, "popContext:animated:completion:", v7, v4, v6);

}

- (void)setContexts:(id)a3
{
  -[ChromeViewController setContexts:animated:](self, "setContexts:animated:", a3, 0);
}

- (void)setContexts:(id)a3 animated:(BOOL)a4
{
  -[ChromeViewController setContexts:animated:completion:](self, "setContexts:animated:completion:", a3, a4, 0);
}

- (void)setContexts:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v8 = a3;
  v12 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100AAA67C;
  v13[3] = &unk_1011E16A8;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100AAA8B8;
  v11[3] = &unk_1011E16D0;
  v9 = v12;
  v10 = v8;
  -[ChromeViewController scheduleCoordinatedContextChange:completionHandler:](self, "scheduleCoordinatedContextChange:completionHandler:", v13, v11);

}

- (void)_setContexts:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSArray *v10;
  id v11;
  void *v12;
  NSArray *v13;
  NSArray *contexts;
  void *v15;
  id v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  ChromeViewController *v21;
  id v22;
  _QWORD *v23;
  BOOL v24;
  _QWORD v25[6];
  _QWORD v26[5];
  id v27;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!-[ChromeViewController isTransitioning](self, "isTransitioning"))
  {
    -[ChromeViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    v10 = self->_contexts;
    v11 = -[ChromeContextTransition initForTransitionFromContexts:toContexts:animated:]([ChromeContextTransition alloc], "initForTransitionFromContexts:toContexts:animated:", v10, v8, v6);
    objc_storeStrong((id *)&self->_currentContextTransition, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leaveAnimation"));
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = sub_100AAAAE8;
    v26[4] = sub_100AAAAF8;
    v27 = 0;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100AAAB00;
    v25[3] = &unk_1011ADF48;
    v25[4] = self;
    v25[5] = v26;
    objc_msgSend(v12, "addPreparation:", v25);
    -[ChromeViewController contextStackWillUpdateFrom:to:withAnimation:](self, "contextStackWillUpdateFrom:to:withAnimation:", v10, v8, v12);
    v13 = (NSArray *)objc_msgSend(v8, "copy");
    contexts = self->_contexts;
    self->_contexts = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enterAnimation"));
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_100AAAB40;
    v20 = &unk_1011E1720;
    v21 = self;
    v16 = v11;
    v22 = v16;
    v23 = v26;
    v24 = v6;
    objc_msgSend(v15, "addCompletion:", &v17);
    -[ChromeViewController contextStackDidUpdateFrom:to:withAnimation:](self, "contextStackDidUpdateFrom:to:withAnimation:", v10, v8, v15, v17, v18, v19, v20, v21);
    objc_msgSend(v16, "runWithCompletion:", v9);

    _Block_object_dispose(v26, 8);
  }

}

- (BOOL)isTransitioning
{
  ChromeContextTransition *currentContextTransition;

  currentContextTransition = self->_currentContextTransition;
  if (currentContextTransition)
    LOBYTE(currentContextTransition) = -[ChromeContextTransition hasStarted](currentContextTransition, "hasStarted");
  return (char)currentContextTransition;
}

- (void)_teardownContextTransition:(id)a3
{
  ChromeContextTransition *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;

  v4 = (ChromeContextTransition *)a3;
  if (self->_currentContextTransition != v4)
  {
    v5 = sub_1004318FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Transition provided is not the same as the current transition")));
      v11 = 136316162;
      v12 = "-[ChromeViewController _teardownContextTransition:]";
      v13 = 2080;
      v14 = "ChromeViewController.m";
      v15 = 1024;
      v16 = 722;
      v17 = 2080;
      v18 = "_currentContextTransition == transition";
      v19 = 2112;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v11, 0x30u);

    }
    if (sub_100A70734())
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v11 = 138412290;
        v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

      }
    }
  }
  if (self->_currentContextTransition == v4)
  {
    self->_currentContextTransition = 0;

  }
}

- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  BOOL v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id location;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v47 = 0;
  v48 = 0;
  -[ChromeViewController _getContextsLeaving:entering:fromPrevious:incoming:](self, "_getContextsLeaving:entering:fromPrevious:incoming:", &v48, &v47, v8, v9);
  v11 = v48;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100AAB208;
  v45[3] = &unk_1011AC8B0;
  v45[4] = self;
  v12 = v47;
  v46 = v12;
  objc_msgSend(v10, "addPreparation:", v45);
  -[GEOObserverHashTable chromeViewController:willMoveFromContextStack:toContextStack:](self->_stackObservers, "chromeViewController:willMoveFromContextStack:toContextStack:", self, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  objc_initWeak(&location, self);
  if ((objc_opt_respondsToSelector(v13, "showsMapView") & 1) != 0
    && (objc_msgSend(v13, "showsMapView") & 1) == 0)
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100AAB344;
    v42[3] = &unk_1011AD4F0;
    objc_copyWeak(&v43, &location);
    objc_msgSend(v10, "addCompletion:", v42);
    objc_destroyWeak(&v43);
  }
  if (v14
    && v14 != v13
    && !-[ChromeViewController isSuppressed](self, "isSuppressed")
    && (objc_opt_respondsToSelector(v14, "resignTopContextInChromeViewController:withAnimation:") & 1) != 0)
  {
    objc_msgSend(v14, "resignTopContextInChromeViewController:withAnimation:", self, v10);
  }
  v31 = v8;
  v32 = v12;
  v28 = v14;
  v29 = v13;
  v30 = v9;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v19, "leaveStackInChromeViewController:withAnimation:") & 1) != 0)
          objc_msgSend(v19, "leaveStackInChromeViewController:withAnimation:", self, v10);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100AAB39C;
        v37[3] = &unk_1011AE8F8;
        v37[4] = v19;
        objc_msgSend(v10, "addCompletion:", v37);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v16);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = v32;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
        if ((objc_opt_respondsToSelector(v24, "setChromeViewController:") & 1) != 0)
          objc_msgSend(v24, "setChromeViewController:", self);
        if ((objc_opt_respondsToSelector(v24, "prepareToEnterStackInChromeViewController:") & 1) != 0)
          objc_msgSend(v24, "prepareToEnterStackInChromeViewController:", self);
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v21);
  }
  v25 = v13;
  v26 = v28 == v13;

  if (v29)
    v27 = v26;
  else
    v27 = 1;
  if ((v27 & 1) == 0)
    -[ChromeViewController _updateComponentsIfNeeded:forTiming:withAnimation:](self, "_updateComponentsIfNeeded:forTiming:withAnimation:", 0, 2, v10);
  objc_destroyWeak(&location);

}

- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  _BYTE v43[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "isAnimated");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  objc_initWeak(&location, self);
  if ((objc_opt_respondsToSelector(v12, "showsMapView") & 1) == 0 || objc_msgSend(v12, "showsMapView"))
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100AAB7CC;
    v40[3] = &unk_1011AD260;
    objc_copyWeak(&v41, &location);
    objc_msgSend(v10, "addPreparation:", v40);
    objc_destroyWeak(&v41);
  }
  v38 = 0;
  v39 = 0;
  -[ChromeViewController _getContextsLeaving:entering:fromPrevious:incoming:](self, "_getContextsLeaving:entering:fromPrevious:incoming:", &v39, &v38, v8, v9);
  v23 = v11;
  v24 = v8;
  v25 = (void *)v13;
  v26 = v39;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = v38;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v18, "enterStackInChromeViewController:withAnimation:") & 1) != 0)
          objc_msgSend(v18, "enterStackInChromeViewController:withAnimation:", self, v10);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v15);
  }

  if (v12 && v12 != v25)
  {
    if (!-[ChromeViewController isSuppressed](self, "isSuppressed")
      && (objc_opt_respondsToSelector(v12, "becomeTopContextInChromeViewController:withAnimation:") & 1) != 0)
    {
      objc_msgSend(v12, "becomeTopContextInChromeViewController:withAnimation:", self, v10);
    }
    -[ChromeViewController _refreshMapInsetsConstraintsForContext:animated:updateIfNeeded:](self, "_refreshMapInsetsConstraintsForContext:animated:updateIfNeeded:", v12, v23, 0);
    -[ChromeViewController _updateComponentsIfNeeded:forTiming:withAnimation:](self, "_updateComponentsIfNeeded:forTiming:withAnimation:", 0, 4, v10);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100AAB814;
    v31[3] = &unk_1011B4060;
    v31[4] = self;
    v32 = v12;
    v33 = v23;
    objc_msgSend(v10, "addAnimations:completion:", 0, v31);

  }
  if (v25)
    v19 = objc_msgSend(v26, "containsObject:", v25);
  else
    v19 = 0;
  -[ChromeViewController _updateFullscreenViewControllerForContext:previousIsLeaving:withAnimation:](self, "_updateFullscreenViewControllerForContext:previousIsLeaving:withAnimation:", v12, v19, v10);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100AABB64;
  v27[3] = &unk_1011BABD8;
  v27[4] = self;
  v20 = v24;
  v28 = v20;
  v21 = v9;
  v29 = v21;
  v22 = v26;
  v30 = v22;
  objc_msgSend(v10, "addAnimations:completion:", 0, v27);

  objc_destroyWeak(&location);
}

- (void)_getContextsLeaving:(id *)a3 entering:(id *)a4 fromPrevious:(id)a5 incoming:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v9 = a5;
  v10 = a6;
  if (a3)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v9);
    if (objc_msgSend(v11, "count"))
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v30;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v30 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v11, "removeObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v16));
            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v14);
      }

    }
    v17 = objc_retainAutorelease(v11);
    *a3 = v17;

  }
  if (a4)
  {
    v18 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v10);
    if (objc_msgSend(v18, "count"))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v19 = v9;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v26;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v26 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(v18, "removeObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v23), (_QWORD)v25);
            v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v21);
      }

    }
    v24 = objc_retainAutorelease(v18);
    *a4 = v24;

  }
}

- (void)addContextStackObserver:(id)a3
{
  id v4;
  GEOObserverHashTable *stackObservers;
  GEOObserverHashTable *v6;
  GEOObserverHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    stackObservers = self->_stackObservers;
    v8 = v4;
    if (!stackObservers)
    {
      v6 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___ChromeContextStackObserver, &_dispatch_main_q);
      v7 = self->_stackObservers;
      self->_stackObservers = v6;

      stackObservers = self->_stackObservers;
    }
    -[GEOObserverHashTable registerObserver:](stackObservers, "registerObserver:", v8);
    v4 = v8;
  }

}

- (void)removeContextStackObserver:(id)a3
{
  if (a3)
    -[GEOObserverHashTable unregisterObserver:](self->_stackObservers, "unregisterObserver:");
}

- (id)_contextCoordinatedScheduler
{
  ChromeContextCoordinationScheduler *contextCoordinatedScheduler;
  ChromeContextCoordinationScheduler *v4;
  ChromeContextCoordinationScheduler *v5;

  contextCoordinatedScheduler = self->_contextCoordinatedScheduler;
  if (!contextCoordinatedScheduler)
  {
    v4 = -[ChromeContextCoordinationScheduler initWithChromeViewController:]([ChromeContextCoordinationScheduler alloc], "initWithChromeViewController:", self);
    v5 = self->_contextCoordinatedScheduler;
    self->_contextCoordinatedScheduler = v4;

    contextCoordinatedScheduler = self->_contextCoordinatedScheduler;
  }
  return contextCoordinatedScheduler;
}

- (void)scheduleCoordinatedContextChange:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController _contextCoordinatedScheduler](self, "_contextCoordinatedScheduler"));
  objc_msgSend(v8, "scheduleBlock:completionHandler:", v7, v6);

}

- (void)setFallbackContextCoordinationBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController _contextCoordinatedScheduler](self, "_contextCoordinatedScheduler"));
  objc_msgSend(v5, "setFallbackBlock:", v4);

}

- (void)commitCoordinatedContextChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController _contextCoordinatedScheduler](self, "_contextCoordinatedScheduler"));
  objc_msgSend(v2, "commit");

}

- (void)whenContextNextBecomesCurrent:(id)a3 performAction:(id)a4 withBlock:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  NSMapTable *deferredActionsByContext;
  NSMapTable *v11;
  NSMapTable *v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (-[ChromeViewController isCurrentContext:](self, "isCurrentContext:", v15))
  {
    v9[2](v9, 1);
  }
  else
  {
    deferredActionsByContext = self->_deferredActionsByContext;
    if (!deferredActionsByContext)
    {
      v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
      v12 = self->_deferredActionsByContext;
      self->_deferredActionsByContext = v11;

      deferredActionsByContext = self->_deferredActionsByContext;
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](deferredActionsByContext, "objectForKey:", v15));
    if (!v13)
    {
      v13 = objc_alloc_init((Class)NSMutableDictionary);
      -[NSMapTable setObject:forKey:](self->_deferredActionsByContext, "setObject:forKey:", v13, v15);
    }
    v14 = objc_msgSend(v9, "copy");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v8);

  }
}

- (BOOL)hasDeferredAction:(id)a3 forContext:(id)a4
{
  NSMapTable *deferredActionsByContext;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  deferredActionsByContext = self->_deferredActionsByContext;
  if (!deferredActionsByContext)
    return 0;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](deferredActionsByContext, "objectForKey:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  v9 = v8 != 0;
  return v9;
}

- (void)cancelDeferredAction:(id)a3 forContext:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_deferredActionsByContext, "objectForKey:", a4));
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "removeObjectForKey:", v8);

}

- (void)setNeedsUpdateComponent:(id)a3 animated:(BOOL)a4
{
  -[ChromeViewController setNeedsUpdateComponent:animated:completion:](self, "setNeedsUpdateComponent:animated:completion:", a3, a4, 0);
}

- (void)setNeedsUpdateComponent:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ChromeViewController *v12;
  ChromeViewController *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *componentsNeedingUpdate;
  BOOL v22;
  id v23;
  ChromeComponentUpdateInfo *v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  id v28;

  v8 = a3;
  v9 = a5;
  v10 = sub_10043196C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = self;
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_8;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v26 = v19;
    v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] Set needs update: %@", buf, 0x16u);

  }
  if (!self->_componentsNeedingUpdate)
  {
    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    componentsNeedingUpdate = self->_componentsNeedingUpdate;
    self->_componentsNeedingUpdate = v20;

  }
  v22 = a4 || self->_componentUpdateIsAnimated;
  self->_componentUpdateIsAnimated = v22;
  v23 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_componentsNeedingUpdate, "objectForKeyedSubscript:", v8));
  if (!v23)
  {
    v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_componentsNeedingUpdate, "setObject:forKeyedSubscript:", v23, v8);
  }
  v24 = -[ChromeComponentUpdateInfo initWithCompletionHandler:]([ChromeComponentUpdateInfo alloc], "initWithCompletionHandler:", v9);

  objc_msgSend(v23, "addObject:", v24);
  -[ChromeViewController _scheduleComponentUpdateTimerIfNeeded](self, "_scheduleComponentUpdateTimerIfNeeded");

}

- (void)_scheduleComponentUpdateTimerIfNeeded
{
  id v3;
  NSObject *v4;
  ChromeViewController *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSTimer *v12;
  NSTimer *scheduledComponentUpdateTimer;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;

  if (!self->_scheduledComponentUpdateTimer)
  {
    v3 = sub_10043196C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      v12 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "updateComponentsIfNeeded", 0, 0, 0.1));
      scheduledComponentUpdateTimer = self->_scheduledComponentUpdateTimer;
      self->_scheduledComponentUpdateTimer = v12;

      return;
    }
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2048;
    v17 = 0x3FB999999999999ALL;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Scheduling coalesced component update in %#.1lfs", buf, 0x16u);

    goto LABEL_9;
  }
}

- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  ChromeViewController *v13;
  ChromeViewController *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  ChromeViewController *v21;
  ChromeViewController *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  const char *v30;
  id v31;
  void *v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  const char *v40;
  __CFString *v41;
  id v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  objc_class *v51;
  NSString *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  float64x2_t v57;
  unsigned int v58;
  __int128 v59;
  __int128 v60;
  void *v61;
  unsigned int v62;
  unsigned int v63;
  char v64;
  void *v65;
  id v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGFloat v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  BOOL v81;
  CGFloat left;
  double bottom;
  double right;
  double v85;
  double MaxY;
  double v87;
  CGFloat *v88;
  double *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  BOOL v94;
  void *v95;
  unsigned int v96;
  void *v97;
  char v98;
  id v99;
  NSObject *v100;
  ChromeViewController *v101;
  ChromeViewController *v102;
  objc_class *v103;
  NSString *v104;
  void *v105;
  void *v106;
  void *v107;
  __CFString *v108;
  id v109;
  NSObject *v110;
  ChromeViewController *v111;
  ChromeViewController *v112;
  objc_class *v113;
  NSString *v114;
  void *v115;
  void *v116;
  void *v117;
  __CFString *v118;
  void *v119;
  void *v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat top;
  CGFloat rect1;
  CGFloat v127;
  const char *v128;
  CGFloat v129;
  void *v130;
  __CFString *v131;
  id v132;
  id v133;
  _QWORD v134[5];
  _QWORD v135[5];
  _QWORD v136[5];
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[5];
  unsigned __int8 v142;
  _QWORD v143[6];
  unsigned __int8 v144;
  _QWORD v145[5];
  id v146;
  _BYTE *v147;
  char v148;
  _BYTE buf[24];
  const char *v150;
  _BYTE v151[32];
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;

  v131 = (__CFString *)a3;
  v132 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController nextTopContext](self, "nextTopContext"));
  v9 = v8;
  if (v8)
    v133 = v8;
  else
    v133 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));

  v130 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v10 = sub_10043196C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if ((a4 & 4) != 0 && v133)
  {
    if (!v12)
    {
LABEL_49:

      goto LABEL_64;
    }
    v13 = self;
    v14 = v13;
    if (!v13)
    {
      v20 = CFSTR("<nil>");
LABEL_23:

      v29 = v20;
      v30 = "unknown";
      if (a4 == 4)
        v30 = "context becoming top";
      if (a4 == 0xFFFFFFFF)
        v30 = "any";
      v128 = v30;
      v31 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](v14, "topContext"));
      v32 = v31;
      if (!v31)
      {
        v38 = CFSTR("<nil>");
LABEL_43:

        v41 = v38;
        v42 = v133;
        v43 = (objc_class *)objc_opt_class(v42);
        v44 = NSStringFromClass(v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        if ((objc_opt_respondsToSelector(v42, "accessibilityIdentifier") & 1) != 0)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "performSelector:", "accessibilityIdentifier"));
          v47 = v46;
          if (v46 && !objc_msgSend(v46, "isEqualToString:", v45))
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v45, v42, v47));

            goto LABEL_48;
          }

        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v45, v42));
LABEL_48:

        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v131;
        *(_WORD *)&buf[22] = 2080;
        v150 = v128;
        *(_WORD *)v151 = 2112;
        *(_QWORD *)&v151[2] = v41;
        *(_WORD *)&v151[10] = 2112;
        *(_QWORD *)&v151[12] = v48;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Update component: %@ with timing %s (outgoing: %@ -> incoming: %@)", buf, 0x34u);

        goto LABEL_49;
      }
      v33 = (objc_class *)objc_opt_class(v31);
      v34 = NSStringFromClass(v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      if ((objc_opt_respondsToSelector(v32, "accessibilityIdentifier") & 1) != 0)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "performSelector:", "accessibilityIdentifier"));
        v37 = v36;
        if (v36 && !objc_msgSend(v36, "isEqualToString:", v35))
        {
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v35, v32, v37));

          goto LABEL_33;
        }

      }
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v35, v32));
LABEL_33:

      goto LABEL_43;
    }
    v15 = (objc_class *)objc_opt_class(v13);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

        goto LABEL_13;
      }

    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_13:

    goto LABEL_23;
  }
  if (v12)
  {
    v21 = self;
    v22 = v21;
    if (!v21)
    {
      v28 = CFSTR("<nil>");
LABEL_35:

      v39 = v28;
      if ((uint64_t)a4 > 3)
      {
        if (a4 == 4)
        {
          v40 = "context becoming top";
          goto LABEL_53;
        }
        if (a4 == 0xFFFFFFFF)
        {
          v40 = "any";
          goto LABEL_53;
        }
      }
      else
      {
        if (a4 == 1)
        {
          v40 = "on-demand";
          goto LABEL_53;
        }
        if (a4 == 2)
        {
          v40 = "context resigning top";
          goto LABEL_53;
        }
      }
      v40 = "unknown";
LABEL_53:
      v49 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](v22, "topContext"));
      v50 = v49;
      if (!v49)
      {
        v56 = CFSTR("<nil>");
        goto LABEL_61;
      }
      v51 = (objc_class *)objc_opt_class(v49);
      v52 = NSStringFromClass(v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      if ((objc_opt_respondsToSelector(v50, "accessibilityIdentifier") & 1) != 0)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "performSelector:", "accessibilityIdentifier"));
        v55 = v54;
        if (v54 && !objc_msgSend(v54, "isEqualToString:", v53))
        {
          v56 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v53, v50, v55));

          goto LABEL_59;
        }

      }
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v53, v50));
LABEL_59:

LABEL_61:
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v131;
      *(_WORD *)&buf[22] = 2080;
      v150 = v40;
      *(_WORD *)v151 = 2112;
      *(_QWORD *)&v151[2] = v56;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Update component: %@ with timing %s (top context: %@)", buf, 0x2Au);

      goto LABEL_62;
    }
    v23 = (objc_class *)objc_opt_class(v21);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
      v27 = v26;
      if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
      {
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

        goto LABEL_21;
      }

    }
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_21:

    goto LABEL_35;
  }
LABEL_62:

  if (!v133)
    v133 = v130;
LABEL_64:
  if (v131 == CFSTR("mapInsets"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x4010000000;
    v150 = "";
    v57 = UIEdgeInsetsNull[1];
    *(float64x2_t *)v151 = UIEdgeInsetsNull[0];
    *(float64x2_t *)&v151[16] = v57;
    if ((objc_opt_respondsToSelector(v133, "showsMapView") & 1) != 0)
      v58 = objc_msgSend(v133, "showsMapView");
    else
      v58 = 1;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints topConstraint](self->_safeAreaMapEdgeInsetsConstraints, "topConstraint"));
    v62 = objc_msgSend(v61, "isActive");

    if (!v58
      || (v63 = -[ChromeViewController contextWantsMapInsetsToRespectSafeAreaInsets:](self, "contextWantsMapInsetsToRespectSafeAreaInsets:", v133), v64 = v63, v62 == v63))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
      objc_msgSend(v67, "layoutFrame");
      v127 = v69;
      v129 = v68;
      rect1 = v70;
      v72 = v71;
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
      objc_msgSend(v73, "bounds");
      v123 = v75;
      v124 = v74;
      v121 = v77;
      v122 = v76;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      v152.origin.y = v127;
      v152.origin.x = v129;
      v152.size.width = rect1;
      v152.size.height = v72;
      v160.origin.x = CGRectZero.origin.x;
      v160.origin.y = y;
      v160.size.width = width;
      v160.size.height = height;
      v81 = CGRectEqualToRect(v152, v160);
      left = UIEdgeInsetsZero.left;
      top = UIEdgeInsetsZero.top;
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
      if (!v81)
      {
        v153.origin.y = v123;
        v153.origin.x = v124;
        v153.size.height = v121;
        v153.size.width = v122;
        v161.origin.x = CGRectZero.origin.x;
        v161.origin.y = y;
        v161.size.width = width;
        v161.size.height = height;
        if (!CGRectEqualToRect(v153, v161))
        {
          v154.origin.y = v127;
          v154.origin.x = v129;
          v154.size.width = rect1;
          v154.size.height = v72;
          top = CGRectGetMinY(v154);
          v155.origin.y = v127;
          v155.origin.x = v129;
          v155.size.width = rect1;
          v155.size.height = v72;
          left = CGRectGetMinX(v155);
          v156.origin.y = v123;
          v156.origin.x = v124;
          v156.size.height = v121;
          v156.size.width = v122;
          v85 = CGRectGetHeight(v156);
          v157.origin.y = v127;
          v157.origin.x = v129;
          v157.size.width = rect1;
          v157.size.height = v72;
          MaxY = CGRectGetMaxY(v157);
          v158.origin.y = v123;
          v158.origin.x = v124;
          v158.size.height = v121;
          v158.size.width = v122;
          v87 = CGRectGetWidth(v158);
          v159.origin.y = v127;
          v159.origin.x = v129;
          v159.size.width = rect1;
          v159.size.height = v72;
          bottom = v85 - MaxY;
          right = v87 - CGRectGetMaxX(v159);
        }
      }
      v88 = *(CGFloat **)&buf[8];
      *(CGFloat *)(*(_QWORD *)&buf[8] + 32) = top;
      v88[5] = left;
      v88[6] = bottom;
      v88[7] = right;

      v89 = *(double **)&buf[8];
      v66 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
      objc_msgSend(v66, "_edgeInsets");
      if (v89[5] == v93 && v89[4] == v90 && v89[7] == v92)
      {
        v94 = v89[6] == v91;

        if (v94)
        {
LABEL_87:
          _Block_object_dispose(buf, 8);
          goto LABEL_127;
        }
LABEL_86:
        objc_msgSend(v132, "setOptions:", (unint64_t)objc_msgSend(v132, "options") | 0x50006);
        -[ChromeViewController mapInsetsUpdateAnimationDuration](self, "mapInsetsUpdateAnimationDuration");
        objc_msgSend(v132, "setDuration:");
        v143[0] = _NSConcreteStackBlock;
        v143[1] = 3221225472;
        v143[2] = sub_100AADB18;
        v143[3] = &unk_1011B0AE8;
        v143[4] = self;
        v143[5] = buf;
        v144 = objc_msgSend(v132, "isAnimated");
        v141[0] = _NSConcreteStackBlock;
        v141[1] = 3221225472;
        v141[2] = sub_100AADF4C;
        v141[3] = &unk_1011AF4D8;
        v141[4] = self;
        v142 = v144;
        objc_msgSend(v132, "addAnimations:completion:", v143, v141);
        goto LABEL_87;
      }
    }
    else
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints allConstraints](self->_safeAreaMapEdgeInsetsConstraints, "allConstraints"));
      v145[0] = _NSConcreteStackBlock;
      v145[1] = 3221225472;
      v145[2] = sub_100AAD550;
      v145[3] = &unk_1011E1770;
      v148 = v64;
      v145[4] = self;
      v66 = v65;
      v146 = v66;
      v147 = buf;
      objc_msgSend(v132, "addPreparation:", v145);

    }
    goto LABEL_86;
  }
  if (v131 == CFSTR("labelInsetsAndWidths"))
  {
    v59 = *(_OWORD *)&self->_labelEdgeInsets.bottom;
    v137 = *(_OWORD *)&self->_labelEdgeInsets.top;
    v138 = v59;
    v60 = *(_OWORD *)&self->_labelEdgeWidths.bottom;
    v139 = *(_OWORD *)&self->_labelEdgeWidths.top;
    v140 = v60;
    v136[0] = _NSConcreteStackBlock;
    v136[1] = 3221225472;
    v136[2] = sub_100AADFF8;
    v136[3] = &unk_1011E17B8;
    v136[4] = self;
    objc_msgSend(v132, "addPreparation:animations:completion:", v136, 0, 0);
    goto LABEL_127;
  }
  if (v131 == CFSTR("personalizedItemSources"))
  {
    v135[0] = _NSConcreteStackBlock;
    v135[1] = 3221225472;
    v135[2] = sub_100AAE3C4;
    v135[3] = &unk_1011AC860;
    v135[4] = self;
    objc_msgSend(v132, "addPreparation:animations:completion:", v135, 0, 0);
    goto LABEL_127;
  }
  if (v131 != CFSTR("navigationDisplay"))
  {
    if (v131 == CFSTR("routeAnnotations"))
    {
      v134[0] = _NSConcreteStackBlock;
      v134[1] = 3221225472;
      v134[2] = sub_100AAE62C;
      v134[3] = &unk_1011AC860;
      v134[4] = self;
      objc_msgSend(v132, "addPreparation:", v134);
    }
    goto LABEL_127;
  }
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController pendingContexts](self, "pendingContexts"));
  if (v95)
  {
    v96 = -[ChromeViewController _shouldEnableNavigationDisplayForContextStack:requestingContext:](self, "_shouldEnableNavigationDisplayForContextStack:requestingContext:", v95, 0);
  }
  else
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
    v96 = -[ChromeViewController _shouldEnableNavigationDisplayForContextStack:requestingContext:](self, "_shouldEnableNavigationDisplayForContextStack:requestingContext:", v97, 0);

  }
  if ((a4 & 2) != 0)
    v98 = v96;
  else
    v98 = 1;
  if ((v98 & 1) == 0)
  {
    v99 = sub_10043196C();
    v100 = objc_claimAutoreleasedReturnValue(v99);
    if (!os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
    {
LABEL_111:

      -[ChromeViewController _teardownNavigationDisplayWithAnimation:](self, "_teardownNavigationDisplayWithAnimation:", v132);
      goto LABEL_112;
    }
    v101 = self;
    v102 = v101;
    if (!v101)
    {
      v108 = CFSTR("<nil>");
      goto LABEL_110;
    }
    v103 = (objc_class *)objc_opt_class(v101);
    v104 = NSStringFromClass(v103);
    v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
    if ((objc_opt_respondsToSelector(v102, "accessibilityIdentifier") & 1) != 0)
    {
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v102, "performSelector:", "accessibilityIdentifier"));
      v107 = v106;
      if (v106 && !objc_msgSend(v106, "isEqualToString:", v105))
      {
        v108 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v105, v102, v107));

        goto LABEL_104;
      }

    }
    v108 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v105, v102));
LABEL_104:

LABEL_110:
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v108;
    _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_INFO, "[%{public}@] - will tear down navigation display", buf, 0xCu);

    goto LABEL_111;
  }
LABEL_112:
  if ((v96 & (a4 >> 2)) != 1)
    goto LABEL_127;
  v109 = sub_10043196C();
  v110 = objc_claimAutoreleasedReturnValue(v109);
  if (!os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
    goto LABEL_123;
  v111 = self;
  v112 = v111;
  if (!v111)
  {
    v118 = CFSTR("<nil>");
    goto LABEL_122;
  }
  v113 = (objc_class *)objc_opt_class(v111);
  v114 = NSStringFromClass(v113);
  v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
  if ((objc_opt_respondsToSelector(v112, "accessibilityIdentifier") & 1) != 0)
  {
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v112, "performSelector:", "accessibilityIdentifier"));
    v117 = v116;
    if (v116 && !objc_msgSend(v116, "isEqualToString:", v115))
    {
      v118 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v115, v112, v117));

      goto LABEL_120;
    }

  }
  v118 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v115, v112));
LABEL_120:

LABEL_122:
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)&buf[4] = v118;
  _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "[%{public}@] - will setup/configure navigation display", buf, 0xCu);

LABEL_123:
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController nextTopContext](self, "nextTopContext"));
  if (v119)
  {
    -[ChromeViewController _setupNavigationDisplayForContext:withAnimation:](self, "_setupNavigationDisplayForContext:withAnimation:", v119, v132);
  }
  else
  {
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    -[ChromeViewController _setupNavigationDisplayForContext:withAnimation:](self, "_setupNavigationDisplayForContext:withAnimation:", v120, v132);

  }
LABEL_127:

}

- (id)allComponents
{
  _QWORD v3[5];

  v3[0] = CFSTR("mapInsets");
  v3[1] = CFSTR("labelInsetsAndWidths");
  v3[2] = CFSTR("personalizedItemSources");
  v3[3] = CFSTR("navigationDisplay");
  v3[4] = CFSTR("routeAnnotations");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 5));
}

- (unint64_t)preferredUpdateTimingForComponent:(id)a3
{
  if (a3 == CFSTR("navigationDisplay"))
    return 6;
  else
    return 4;
}

- (void)updateComponentsIfNeeded
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", self->_componentUpdateIsAnimated));
  -[ChromeViewController updateComponentsIfNeededWithAnimation:](self, "updateComponentsIfNeededWithAnimation:", v3);
  objc_msgSend(v3, "runWithCurrentOptions");

}

- (void)updateComponentsIfNeededWithAnimation:(id)a3
{
  -[ChromeViewController _updateComponentsIfNeeded:withAnimation:](self, "_updateComponentsIfNeeded:withAnimation:", 1, a3);
}

- (void)_updateComponentsIfNeeded:(BOOL)a3 withAnimation:(id)a4
{
  -[ChromeViewController _updateComponentsIfNeeded:forTiming:withAnimation:](self, "_updateComponentsIfNeeded:forTiming:withAnimation:", a3, 0xFFFFFFFFLL, a4);
}

- (void)_updateComponentsIfNeeded:(BOOL)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  -[ChromeViewController _updateComponentsIfNeeded:forceImmediateUpdate:forTiming:withAnimation:](self, "_updateComponentsIfNeeded:forceImmediateUpdate:forTiming:withAnimation:", a3, 0, a4, a5);
}

- (void)_updateComponentsIfNeeded:(BOOL)a3 forceImmediateUpdate:(BOOL)a4 forTiming:(unint64_t)a5 withAnimation:(id)a6
{
  _BOOL4 v7;
  NSTimer *scheduledComponentUpdateTimer;
  id v11;
  NSObject *v12;
  ChromeViewController *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const char *v21;
  id v22;
  void *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  id v30;
  id v31;
  NSObject *v32;
  _BOOL4 v33;
  ChromeViewController *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSMutableSet *componentsBeingUpdated;
  ChromeViewController *v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSMutableSet *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  unint64_t v57;
  ChromeComponentUpdateInfo *v58;
  void *v59;
  uint64_t v60;
  id v61;
  ChromeViewController *v62;
  objc_class *v63;
  NSString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  const char *v69;
  id v70;
  id v71;
  NSMutableDictionary *componentsNeedingUpdate;
  void *v73;
  NSMutableSet *v74;
  NSMutableSet *v75;
  NSMutableSet *v76;
  void *v77;
  id v78;
  NSObject *v79;
  ChromeViewController *v80;
  objc_class *v81;
  NSString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  const char *v87;
  id v88;
  NSObject *v89;
  ChromeViewController *v90;
  objc_class *v91;
  NSString *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  ChromeViewController *v102;
  uint64_t v103;
  id obj;
  _QWORD v105[5];
  id v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  ChromeComponentUpdateInfo *v112;
  uint8_t v113[128];
  uint8_t buf[4];
  id v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  void *v119;

  v7 = a4;
  v100 = a6;
  -[NSTimer invalidate](self->_scheduledComponentUpdateTimer, "invalidate");
  scheduledComponentUpdateTimer = self->_scheduledComponentUpdateTimer;
  self->_scheduledComponentUpdateTimer = 0;

  v11 = sub_10043196C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v102 = self;
  v103 = a5;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = self;
    v14 = (objc_class *)objc_opt_class(v13);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        a5 = v103;
LABEL_7:

        v20 = v19;
        if ((uint64_t)a5 > 3)
        {
          if (a5 == 4)
          {
            v21 = "context becoming top";
            goto LABEL_17;
          }
          if (a5 == 0xFFFFFFFF)
          {
            v21 = "any";
            goto LABEL_17;
          }
        }
        else
        {
          if (a5 == 1)
          {
            v21 = "on-demand";
            goto LABEL_17;
          }
          if (a5 == 2)
          {
            v21 = "context resigning top";
            goto LABEL_17;
          }
        }
        v21 = "unknown";
LABEL_17:
        v22 = v100;
        v23 = v22;
        if (!v22)
        {
          v29 = CFSTR("<nil>");
          goto LABEL_25;
        }
        v24 = (objc_class *)objc_opt_class(v22);
        v25 = NSStringFromClass(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        if ((objc_opt_respondsToSelector(v23, "accessibilityIdentifier") & 1) != 0)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "performSelector:", "accessibilityIdentifier"));
          v28 = v27;
          if (v27 && !objc_msgSend(v27, "isEqualToString:", v26))
          {
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v26, v23, v28));

            goto LABEL_23;
          }

        }
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v26, v23));
LABEL_23:

LABEL_25:
        *(_DWORD *)buf = 138543874;
        v115 = v20;
        v116 = 2080;
        v117 = (void *)v21;
        v118 = 2114;
        v119 = v29;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] Evaluate component update for timing '%s', animation %{public}@...", buf, 0x20u);

        a5 = v103;
        goto LABEL_26;
      }

      a5 = v103;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
    goto LABEL_7;
  }
LABEL_26:

  v30 = -[NSMutableDictionary mutableCopy](self->_componentsNeedingUpdate, "mutableCopy");
  if (-[NSMutableSet count](self->_componentsBeingUpdated, "count"))
  {
    v31 = sub_10043196C();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (!v33)
      {
LABEL_43:

        goto LABEL_44;
      }
      v34 = self;
      v35 = (objc_class *)objc_opt_class(v34);
      v36 = NSStringFromClass(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
        v39 = v38;
        if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

          goto LABEL_34;
        }

      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_34:

      componentsBeingUpdated = self->_componentsBeingUpdated;
      *(_DWORD *)buf = 138543618;
      v115 = v40;
      v116 = 2112;
      v117 = componentsBeingUpdated;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "[%{public}@] - Forcing immediate update, not skipping components in the middle of updates: %@", buf, 0x16u);

      a5 = v103;
      goto LABEL_43;
    }
    if (!v33)
    {
LABEL_42:

      v32 = objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_componentsBeingUpdated, "allObjects"));
      objc_msgSend(v30, "removeObjectsForKeys:", v32);
      goto LABEL_43;
    }
    v42 = self;
    v43 = (objc_class *)objc_opt_class(v42);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    if ((objc_opt_respondsToSelector(v42, "accessibilityIdentifier") & 1) != 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v42, "performSelector:", "accessibilityIdentifier"));
      v47 = v46;
      if (v46 && !objc_msgSend(v46, "isEqualToString:", v45))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v45, v42, v47));

        goto LABEL_41;
      }

    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v45, v42));
LABEL_41:

    v49 = self->_componentsBeingUpdated;
    *(_DWORD *)buf = 138543618;
    v115 = v48;
    v116 = 2112;
    v117 = v49;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "[%{public}@] - Skipping components in the middle of updates (they may update again later): %@", buf, 0x16u);

    a5 = v103;
    goto LABEL_42;
  }
LABEL_44:
  if (a3)
    goto LABEL_77;
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController allComponents](self, "allComponents"));
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
  if (!v50)
    goto LABEL_76;
  v51 = v50;
  v52 = *(_QWORD *)v109;
  do
  {
    v53 = 0;
    do
    {
      if (*(_QWORD *)v109 != v52)
        objc_enumerationMutation(obj);
      v54 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v54));

      if (!v55)
      {
        v56 = v30;
        v57 = -[ChromeViewController preferredUpdateTimingForComponent:](self, "preferredUpdateTimingForComponent:", v54);
        if ((v57 & a5) != 0)
        {
          v58 = objc_alloc_init(ChromeComponentUpdateInfo);
          v112 = v58;
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v112, 1));
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v59, v54);

LABEL_71:
          goto LABEL_72;
        }
        v60 = v57;
        v61 = sub_10043196C();
        v58 = (ChromeComponentUpdateInfo *)objc_claimAutoreleasedReturnValue(v61);
        if (!os_log_type_enabled(&v58->super, OS_LOG_TYPE_DEBUG))
        {
          v30 = v56;
          goto LABEL_71;
        }
        v62 = self;
        v63 = (objc_class *)objc_opt_class(v62);
        v64 = NSStringFromClass(v63);
        v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
        if ((objc_opt_respondsToSelector(v62, "accessibilityIdentifier") & 1) != 0)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v62, "performSelector:", "accessibilityIdentifier"));
          v67 = v66;
          if (!v66 || objc_msgSend(v66, "isEqualToString:", v65))
          {

            goto LABEL_58;
          }
          v101 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v65, v62, v67));

          v68 = (void *)v101;
        }
        else
        {
LABEL_58:
          v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v65, v62));
        }

        if (v60 > 3)
        {
          a5 = v103;
          if (v60 == 4)
          {
            v69 = "context becoming top";
            goto LABEL_70;
          }
          if (v60 == 0xFFFFFFFFLL)
          {
            v69 = "any";
            goto LABEL_70;
          }
        }
        else
        {
          a5 = v103;
          if (v60 == 1)
          {
            v69 = "on-demand";
            goto LABEL_70;
          }
          if (v60 == 2)
          {
            v69 = "context resigning top";
LABEL_70:
            v30 = v56;
            *(_DWORD *)buf = 138543874;
            v115 = v68;
            v116 = 2112;
            v117 = v54;
            v118 = 2080;
            v119 = (void *)v69;
            _os_log_impl((void *)&_mh_execute_header, &v58->super, OS_LOG_TYPE_DEBUG, "[%{public}@] - Skipping component %@, not the right timing (wants '%s')", buf, 0x20u);

            self = v102;
            goto LABEL_71;
          }
        }
        v69 = "unknown";
        goto LABEL_70;
      }
LABEL_72:
      v53 = (char *)v53 + 1;
    }
    while (v51 != v53);
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
    v51 = v70;
  }
  while (v70);
LABEL_76:

LABEL_77:
  v71 = objc_msgSend(v30, "count");
  componentsNeedingUpdate = self->_componentsNeedingUpdate;
  if (!v71)
  {
    if (!-[NSMutableDictionary count](self->_componentsNeedingUpdate, "count"))
      goto LABEL_108;
    v88 = sub_10043196C();
    v89 = objc_claimAutoreleasedReturnValue(v88);
    if (!os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
    {
LABEL_98:

      goto LABEL_108;
    }
    v90 = self;
    v91 = (objc_class *)objc_opt_class(v90);
    v92 = NSStringFromClass(v91);
    v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
    if ((objc_opt_respondsToSelector(v90, "accessibilityIdentifier") & 1) != 0)
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v90, "performSelector:", "accessibilityIdentifier"));
      v95 = v94;
      if (v94 && !objc_msgSend(v94, "isEqualToString:", v93))
      {
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v93, v90, v95));

        goto LABEL_97;
      }

    }
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v93, v90));
LABEL_97:

    *(_DWORD *)buf = 138543362;
    v115 = v96;
    _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "[%{public}@] - No components left to update after skipping those in-flight, returning early", buf, 0xCu);

    goto LABEL_98;
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allKeys"));
  -[NSMutableDictionary removeObjectsForKeys:](componentsNeedingUpdate, "removeObjectsForKeys:", v73);

  self->_componentUpdateIsAnimated = 0;
  v74 = self->_componentsBeingUpdated;
  if (!v74)
  {
    v75 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v76 = self->_componentsBeingUpdated;
    self->_componentsBeingUpdated = v75;

    v74 = self->_componentsBeingUpdated;
  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allKeys"));
  -[NSMutableSet addObjectsFromArray:](v74, "addObjectsFromArray:", v77);

  v78 = sub_10043196C();
  v79 = objc_claimAutoreleasedReturnValue(v78);
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
  {
    v80 = self;
    v81 = (objc_class *)objc_opt_class(v80);
    v82 = NSStringFromClass(v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
    if ((objc_opt_respondsToSelector(v80, "accessibilityIdentifier") & 1) == 0)
      goto LABEL_85;
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v80, "performSelector:", "accessibilityIdentifier"));
    v85 = v84;
    if (v84 && !objc_msgSend(v84, "isEqualToString:", v83))
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v83, v80, v85));

    }
    else
    {

LABEL_85:
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v83, v80));
    }

    if (v103 > 3)
    {
      if (v103 == 4)
      {
        v87 = "context becoming top";
      }
      else
      {
        if (v103 != 0xFFFFFFFFLL)
          goto LABEL_103;
        v87 = "any";
      }
    }
    else if (v103 == 1)
    {
      v87 = "on-demand";
    }
    else
    {
      if (v103 == 2)
      {
        v87 = "context resigning top";
        goto LABEL_106;
      }
LABEL_103:
      v87 = "unknown";
    }
LABEL_106:
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allKeys"));
    *(_DWORD *)buf = 138543874;
    v115 = v86;
    v116 = 2080;
    v117 = (void *)v87;
    v118 = 2112;
    v119 = v97;
    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "[%{public}@] - Commit update for timing '%s' with %@", buf, 0x20u);

    self = v102;
  }

  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allKeys"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v98));
  -[ChromeViewController willUpdateComponents:withAnimation:](self, "willUpdateComponents:withAnimation:", v99, v100);

  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_100AB0314;
  v105[3] = &unk_1011E1848;
  v105[4] = self;
  v107 = v103;
  v106 = v100;
  objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v105);

LABEL_108:
}

- (BOOL)shouldAutomaticallyLoadMapView
{
  return 1;
}

- (void)loadMapViewIfNeeded
{
  MKMapView **p_mapView;
  void *v4;
  id v5;
  NSObject *v6;
  ChromeViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ChromeMapViewDelegateProxy *v15;
  ChromeMapViewDelegateProxy *mapViewDelegateProxy;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  p_mapView = &self->_mapView;
  if (self->_mapView || -[ChromeViewController isSuppressed](self, "isSuppressed"))
    return;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController createMapView](self, "createMapView"));
  v5 = sub_10043196C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_9;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_9:

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapLayer"));
    *(_DWORD *)buf = 138543874;
    v19 = v13;
    v20 = 2114;
    v21 = v4;
    v22 = 2114;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] loadMapViewIfNeeded, mapView: %{public}@, mapLayer: %{public}@", buf, 0x20u);

  }
  v15 = -[ChromeDelegateProxy initWithChromeViewController:]([ChromeMapViewDelegateProxy alloc], "initWithChromeViewController:", self);
  mapViewDelegateProxy = self->_mapViewDelegateProxy;
  self->_mapViewDelegateProxy = v15;

  objc_msgSend(v4, "setDelegate:", self->_mapViewDelegateProxy);
  objc_storeStrong((id *)p_mapView, v4);
  if (v4)
  {
    -[MapCameraController setMapView:](self->_mapCameraController, "setMapView:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapCameraController](self, "mapCameraController"));
    -[SearchPinsManager setMapCameraController:](self->_searchPinsManager, "setMapCameraController:", v17);

    -[CustomPOIsController setMapView:](self->_customPOIsController, "setMapView:", v4);
  }
  -[ChromeViewController prepareMapViewForFirstUse](self, "prepareMapViewForFirstUse");
  if (!-[ChromeViewController isInactive](self, "isInactive")
    || !-[ChromeViewController removesMapViewWhenInactive](self, "removesMapViewWhenInactive"))
  {
    -[ChromeViewController installMapView:](self, "installMapView:", v4);
  }

}

- (id)createMapView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)MKMapView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v3, "_initWithFrame:gestureRecognizerHostView:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 0, 0, 0, 1, 0);

  return v5;
}

- (void)installMapView:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  ChromeViewController *v9;
  ChromeViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  ChromeViewController *v17;
  ChromeViewController *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  UIView *mapReplacementView;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  ChromeViewController *v30;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  UIView *v36;

  v4 = a3;
  v5 = -[ChromeViewController isViewLoaded](self, "isViewLoaded");
  v6 = sub_10043196C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if ((v5 & 1) == 0)
  {
    if (!v8)
      goto LABEL_25;
    v17 = self;
    v18 = v17;
    if (!v17)
    {
      v24 = CFSTR("<nil>");
      goto LABEL_24;
    }
    v19 = (objc_class *)objc_opt_class(v17);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_17;
      }

    }
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_17:

LABEL_24:
    *(_DWORD *)buf = 138543362;
    v32 = v24;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] _installMapView: view not yet loaded", buf, 0xCu);

    goto LABEL_25;
  }
  if (v8)
  {
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_9;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_9:

LABEL_19:
    mapReplacementView = v10->_mapReplacementView;
    *(_DWORD *)buf = 138543874;
    v32 = v16;
    v33 = 2048;
    v34 = v4;
    v35 = 2048;
    v36 = mapReplacementView;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] _installMapView: installing %p (current _mapReplacementView: %p)", buf, 0x20u);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));

  if (v26 != v27)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100AB10F4;
    v28[3] = &unk_1011AC8B0;
    v29 = v4;
    v30 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v28);

  }
  v7 = objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  -[NSObject sendSubviewToBack:](v7, "sendSubviewToBack:", v4);
LABEL_25:

}

- (void)prepareMapViewForFirstUse
{
  id v3;
  NSObject *v4;
  ChromeViewController *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  MKMapView *mapView;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  NSDate *v28;
  NSDate *mapViewEnteredForegroundDate;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;

  if (!self->_mapView)
    return;
  v3 = sub_10043196C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Preparing map view for first use", buf, 0xCu);

  }
  -[MKMapView _setShowsVenues:](self->_mapView, "_setShowsVenues:", 1);
  -[MKMapView _setLoadLookAroundAvailability:](self->_mapView, "_setLoadLookAroundAvailability:", 1);
  -[ChromeViewController _setLocalizedStringsForMapView:](self, "_setLocalizedStringsForMapView:", self->_mapView);
  -[MKMapView setBackdropViewQualityChangingDisabled:](self->_mapView, "setBackdropViewQualityChangingDisabled:", 1);
  -[MKMapView _setInactive:](self->_mapView, "_setInactive:", self->_inactive);
  -[MKMapView _setAllowsPopoverWhenNotInWindow:](self->_mapView, "_setAllowsPopoverWhenNotInWindow:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView preferredConfiguration](self->_mapView, "preferredConfiguration"));
  if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___MKMapConfigurationHiking))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "setShowsHiking:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("MapsLastActivityCamera")));

  if (v16
    || (v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("__internal__LastActivityCamera"))),
        v17,
        v16))
  {
    v18 = objc_msgSend(objc_alloc((Class)GEOURLCamera), "initWithData:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mapCamera"));
    if (_GEOConfigHasValue(MapsConfig_CameraDefaultPitch, off_1014B4DB8))
      objc_msgSend(v19, "setPitch:", GEOConfigGetDouble(MapsConfig_CameraDefaultPitch, off_1014B4DB8));
    objc_msgSend(v19, "centerCoordinate");
    if (v21 >= -180.0 && v21 <= 180.0 && v20 >= -90.0 && v20 <= 90.0)
    {
      -[MKMapView setCamera:](self->_mapView, "setCamera:", v19);
      if (_GEOConfigHasValue(MapsConfig_CameraDefaultZoom, off_1014B4DC8))
      {
        mapView = self->_mapView;
        -[MKMapView centerCoordinate](mapView, "centerCoordinate");
        -[MKMapView setCenterCoordinate:zoomLevel:animated:](mapView, "setCenterCoordinate:zoomLevel:animated:", 0, v23, v24, GEOConfigGetDouble(MapsConfig_CameraDefaultZoom, off_1014B4DC8) + 2.0);
      }
    }

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "window"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "windowScene"));

  if (v27)
  {
    v28 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    mapViewEnteredForegroundDate = self->_mapViewEnteredForegroundDate;
    self->_mapViewEnteredForegroundDate = v28;

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v30, "postNotificationName:object:", CFSTR("ChromeViewControllerDidLoadMapViewNotification"), self);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  objc_msgSend(v31, "registerMapView:withPriority:", self->_mapView, 0.0);

}

- (void)_setLocalizedStringsForMapView:(id)a3
{
  id v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = a3;
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = dispatch_queue_create("ChromeViewController.workerQueue", v5);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AB167C;
  block[3] = &unk_1011AC860;
  v9 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

- (void)setVKApplicationUILayout:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapLayer"));
  v7 = objc_msgSend(v6, "applicationUILayout");

  if (v7 != (id)a3)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapLayer"));
    objc_msgSend(v8, "setApplicationUILayout:", a3);

  }
}

- (BOOL)shouldUseModernMap
{
  return 1;
}

- (int64_t)modernMapTerrainMode
{
  return 0;
}

- (int64_t)modernMapProjectionType
{
  return 0;
}

- (id)mapViewDelegate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v2, "mapViewDelegate") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapViewDelegate"));
    v4 = v3;
    if (v3)
    {
      v5 = v3;

      v2 = v5;
    }

  }
  if ((sub_1007F7BE8((uint64_t)v2, (Protocol *)&OBJC_PROTOCOL___MKMapViewDelegate) & 1) != 0
    || sub_1007F7BE8((uint64_t)v2, (Protocol *)&OBJC_PROTOCOL___MKMapViewDelegatePrivate))
  {
    v6 = v2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mapViewDelegateForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewDelegate](self, "mapViewDelegate"));
  if ((objc_opt_respondsToSelector(v4, a3) & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)registerAdditionalMapViewDelegate:(id)a3
{
  id v4;
  __objc2_prot *v5;
  id v6;
  NSObject *v7;
  ChromeViewController *v8;
  ChromeViewController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  id v36;
  NSObject *v37;
  char *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  void *v48;

  v4 = a3;
  v5 = &OBJC_PROTOCOL___MKMapViewDelegatePrivate;
  if ((sub_1007F7BE8((uint64_t)v4, (Protocol *)v5) & 1) != 0)
    goto LABEL_2;
  v25 = sub_1004318FC();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = v4;
    v28 = v27;
    if (!v27)
    {
      v34 = CFSTR("<nil>");
      goto LABEL_32;
    }
    v29 = (objc_class *)objc_opt_class(v27);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    if ((objc_opt_respondsToSelector(v28, "accessibilityIdentifier") & 1) != 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "performSelector:", "accessibilityIdentifier"));
      v33 = v32;
      if (v32 && !objc_msgSend(v32, "isEqualToString:", v31))
      {
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v31, v28, v33));

        goto LABEL_30;
      }

    }
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v31, v28));
LABEL_30:

LABEL_32:
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Trying to register additional map view delegate %@ but it does not conform to protocol"), v34));
    *(_DWORD *)buf = 136316162;
    v40 = "-[ChromeViewController registerAdditionalMapViewDelegate:]";
    v41 = 2080;
    v42 = "ChromeViewController.m";
    v43 = 1024;
    v44 = 1559;
    v45 = 2080;
    v46 = "MapsCachedConformsToProtocol(delegate, protocol)";
    v47 = 2112;
    v48 = v35;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

  }
  if (sub_100A70734())
  {
    v36 = sub_1004318FC();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v40 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
LABEL_2:
  v6 = sub_10043196C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
LABEL_11:

      v16 = v15;
      v17 = v4;
      v18 = v17;
      if (!v17)
      {
        v24 = CFSTR("<nil>");
        goto LABEL_19;
      }
      v19 = (objc_class *)objc_opt_class(v17);
      v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "performSelector:", "accessibilityIdentifier"));
        v23 = v22;
        if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
        {
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

          goto LABEL_17;
        }

      }
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_17:

LABEL_19:
      *(_DWORD *)buf = 138543618;
      v40 = (const char *)v16;
      v41 = 2112;
      v42 = (const char *)v24;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering additional map view delegate: %@", buf, 0x16u);

      goto LABEL_20;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

    goto LABEL_11;
  }
LABEL_20:

  -[ChromeDelegateProxy addAdditionalDelegate:forProtocol:](self->_mapViewDelegateProxy, "addAdditionalDelegate:forProtocol:", v4, v5);
}

- (void)unregisterAdditionalMapViewDelegate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  ChromeViewController *v7;
  ChromeViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  void *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  __CFString *v27;

  v4 = a3;
  v5 = sub_10043196C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
LABEL_10:

      v15 = v14;
      v16 = v4;
      v17 = v16;
      if (!v16)
      {
        v23 = CFSTR("<nil>");
        goto LABEL_18;
      }
      v18 = (objc_class *)objc_opt_class(v16);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "performSelector:", "accessibilityIdentifier"));
        v22 = v21;
        if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
        {
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

          goto LABEL_16;
        }

      }
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_16:

LABEL_18:
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      v26 = 2112;
      v27 = v23;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unregistering additional map view delegate: %@", buf, 0x16u);

      goto LABEL_19;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

    goto LABEL_10;
  }
LABEL_19:

  -[ChromeDelegateProxy removeAdditionalDelegate:forProtocol:](self->_mapViewDelegateProxy, "removeAdditionalDelegate:forProtocol:", v4, &OBJC_PROTOCOL___MKMapViewDelegatePrivate);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!+[ChromeDelegateProxy selectorIsProxiedDelegateMethod:](ChromeMapViewDelegateProxy, "selectorIsProxiedDelegateMethod:", objc_msgSend(v4, "selector"))|| objc_msgSend((id)objc_opt_class(ChromeViewController), "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
  {
    v5.receiver = self;
    v5.super_class = (Class)ChromeViewController;
    -[ChromeViewController forwardInvocation:](&v5, "forwardInvocation:", v4);
  }

}

+ (BOOL)mapInsetsShouldRespectSafeAreaInsetsByDefault
{
  return 1;
}

- (UIEdgeInsets)mapEdgeInsetsForContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat top;
  void *v8;
  double v9;
  CGFloat left;
  void *v11;
  double v12;
  CGFloat bottom;
  void *v14;
  double v15;
  CGFloat right;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_mapInsetsConstraintsByContext, "objectForKey:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topConstraint"));
    objc_msgSend(v5, "constant");
    top = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftConstraint"));
    objc_msgSend(v8, "constant");
    left = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomConstraint"));
    objc_msgSend(v11, "constant");
    bottom = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightConstraint"));
    objc_msgSend(v14, "constant");
    right = v15;

  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }

  v17 = top;
  v18 = left;
  v19 = bottom;
  v20 = right;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (BOOL)contextWantsMapInsetsToRespectSafeAreaInsets:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "mapInsetsShouldRespectSafeAreaInsetsByDefault");
  if ((objc_opt_respondsToSelector(v4, "wantsMapInsetsToRespectSafeAreaInsets") & 1) != 0)
    v5 = objc_msgSend(v4, "wantsMapInsetsToRespectSafeAreaInsets");

  return v5;
}

- (void)setMapEdgeInsets:(UIEdgeInsets)a3 animated:(BOOL)a4 forContext:(id)a5
{
  _BOOL8 v5;
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSMapTable *mapInsetsConstraintsByContext;
  id v23;
  NSMapTable *v24;
  NSMapTable *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;

  v5 = a4;
  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v11 = a5;
  v14 = left == UIEdgeInsetsZero.left
     && top == UIEdgeInsetsZero.top
     && right == UIEdgeInsetsZero.right
     && bottom == UIEdgeInsetsZero.bottom;
  v54 = v11;
  if (v14)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_mapInsetsConstraintsByContext, "objectForKey:", v11));
    -[NSMapTable removeObjectForKey:](self->_mapInsetsConstraintsByContext, "removeObjectForKey:", v54);
    if (v26)
    {
      -[ChromeViewController _refreshMapInsetsConstraintsForContext:animated:updateIfNeeded:](self, "_refreshMapInsetsConstraintsForContext:animated:updateIfNeeded:", v54, v5, 1);
      -[ChromeViewController updateComponentsIfNeeded](self, "updateComponentsIfNeeded");
    }
    goto LABEL_32;
  }
  -[ChromeViewController mapEdgeInsetsForContext:](self, "mapEdgeInsetsForContext:", v11);
  if (left != v18 || top != v15 || right != v17 || bottom != v16)
  {
    mapInsetsConstraintsByContext = self->_mapInsetsConstraintsByContext;
    v23 = v54;
    if (!mapInsetsConstraintsByContext)
    {
      v24 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
      v25 = self->_mapInsetsConstraintsByContext;
      self->_mapInsetsConstraintsByContext = v24;

      v23 = v54;
      mapInsetsConstraintsByContext = self->_mapInsetsConstraintsByContext;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mapInsetsConstraintsByContext, "objectForKey:", v23));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "owningView"));

    if (v26)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topConstraint"));
      objc_msgSend(v29, "setConstant:", top);

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leftConstraint"));
      objc_msgSend(v30, "setConstant:", left);

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomConstraint"));
      objc_msgSend(v31, "setConstant:", -bottom);

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "rightConstraint"));
      objc_msgSend(v32, "setConstant:", -right);

      if (-[ChromeViewController isTopContext:](self, "isTopContext:", v54))
        -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("mapInsets"), v5);
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
      LODWORD(v36) = 1148846080;
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:constant:priority:", v35, top, v36));

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leftAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leftAnchor"));
      LODWORD(v40) = 1148846080;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:constant:priority:", v39, left, v40));

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
      LODWORD(v45) = 1148846080;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:constant:priority:", v44, -bottom, v45));

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "rightAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "rightAnchor"));
      LODWORD(v50) = 1148846080;
      v51 = v28;
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:constant:priority:", v49, -right, v50));

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:left:bottom:right:](MapsEdgeConstraints, "edgeConstraintsWithTop:left:bottom:right:", v53, v41, v46, v52));
      -[NSMapTable setObject:forKey:](self->_mapInsetsConstraintsByContext, "setObject:forKey:", v26, v54);
      -[ChromeViewController _refreshMapInsetsConstraintsForContext:animated:updateIfNeeded:](self, "_refreshMapInsetsConstraintsForContext:animated:updateIfNeeded:", v54, v5, 1);

      v28 = v51;
    }
    if (!-[ChromeViewController isTransitioning](self, "isTransitioning", v53))
      -[ChromeViewController updateComponentsIfNeeded](self, "updateComponentsIfNeeded");

LABEL_32:
  }

}

- (void)_refreshMapInsetsConstraintsForContext:(id)a3 animated:(BOOL)a4 updateIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  unsigned int v8;
  void *v9;
  MapsEdgeConstraints *v10;
  id *p_currentContextMapInsetsConstraints;
  MapsEdgeConstraints *currentContextMapInsetsConstraints;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  id v17;

  v5 = a5;
  v6 = a4;
  v17 = a3;
  v8 = -[ChromeViewController isTopContext:](self, "isTopContext:", v17);
  v9 = v17;
  if (v8)
  {
    v10 = (MapsEdgeConstraints *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_mapInsetsConstraintsByContext, "objectForKey:", v17));
    p_currentContextMapInsetsConstraints = (id *)&self->_currentContextMapInsetsConstraints;
    currentContextMapInsetsConstraints = self->_currentContextMapInsetsConstraints;
    if (currentContextMapInsetsConstraints != v10)
    {
      if (currentContextMapInsetsConstraints)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints allConstraints](currentContextMapInsetsConstraints, "allConstraints"));
        +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v13);

        v14 = *p_currentContextMapInsetsConstraints == 0;
      }
      else
      {
        v14 = 1;
      }
      if (v10)
        v15 = 0;
      else
        v15 = v14;
      objc_storeStrong(p_currentContextMapInsetsConstraints, v10);
      if (v10)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints allConstraints](v10, "allConstraints"));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

      }
      if (!v15 && v5)
        -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("mapInsets"), v6);
    }

    v9 = v17;
  }

}

- (void)setNeedsUpdateMapInsets
{
  -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("mapInsets"), 1);
}

- (double)mapInsetsUpdateAnimationDuration
{
  double result;

  +[GroupAnimation defaultAnimationDuration](GroupAnimation, "defaultAnimationDuration");
  return result;
}

- (void)setLabelEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v15;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v8, "_labelEdgeInsets");
  if (left == v12 && top == v9 && right == v11)
  {
    v15 = v10;

    if (bottom == v15)
      return;
  }
  else
  {

  }
  self->_labelEdgeInsets.top = top;
  self->_labelEdgeInsets.left = left;
  self->_labelEdgeInsets.bottom = bottom;
  self->_labelEdgeInsets.right = right;
  -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("labelInsetsAndWidths"), 1);
}

- (void)setLabelEdgeWidths:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v15;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (GEOConfigGetBOOL(MapsConfig_StatusBarBackgroundViewUsesFadingLabels, off_1014B4DA8))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v8, "_labelEdgeWidths");
    if (left != v12 || top != v9 || right != v11)
    {

LABEL_12:
      self->_labelEdgeWidths.top = top;
      self->_labelEdgeWidths.left = left;
      self->_labelEdgeWidths.bottom = bottom;
      self->_labelEdgeWidths.right = right;
      -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("labelInsetsAndWidths"), 1);
      return;
    }
    v15 = v10;

    if (bottom != v15)
      goto LABEL_12;
  }
}

- (void)clearMapGesturesAndAnimations
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v2, "_clearGesturesAndAnimations");

}

- (id)acquireMapInsetPropagationSuspensionTokenForReason:(id)a3
{
  return -[MapsTokenStorage tokenWithReason:](self->_mapInsetPropagationSuspensionTokens, "tokenWithReason:", a3);
}

- (id)acquireChromeDeactivationTokenForReason:(id)a3
{
  return -[MapsTokenStorage tokenWithReason:](self->_deactivationTokens, "tokenWithReason:", a3);
}

- (id)acquireHikingMapToken
{
  MapsTokenStorage *hikingMapTokens;
  void *v3;
  void *v4;
  const __CFString *v6;
  const __CFString *v7;

  hikingMapTokens = self->_hikingMapTokens;
  v6 = CFSTR("reason");
  v7 = CFSTR("none");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage tokenWithUserInfo:](hikingMapTokens, "tokenWithUserInfo:", v3));

  return v4;
}

- (id)acquireExploreMapHikingMapToken
{
  MapsTokenStorage *hikingMapTokens;
  void *v3;
  void *v4;
  const __CFString *v6;
  const __CFString *v7;

  hikingMapTokens = self->_hikingMapTokens;
  v6 = CFSTR("reason");
  v7 = CFSTR("mapType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage tokenWithUserInfo:](hikingMapTokens, "tokenWithUserInfo:", v3));

  return v4;
}

- (void)resetForcedExploreModernMapFlag
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_10043196C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing forced Explore + Modern Map flag", v5, 2u);
  }

  self->_hasForcedExploreModernMap = 0;
  -[ChromeViewController didUpdateForcedExploreMapConfiguration:](self, "didUpdateForcedExploreMapConfiguration:", 0);
}

- (BOOL)shouldUseHikingMap
{
  return -[MapsTokenStorage count](self->_hikingMapTokens, "count") != 0;
}

- (BOOL)shouldForceExploreMap
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage allTokenReasons](self->_hikingMapTokens, "allTokenReasons"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("mapType"));

  return v3;
}

- (void)updateHikingMapConfiguration
{
  _BOOL8 v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int64_t style;
  int64_t emphasis;
  int64_t projection;
  int64_t terrainMode;
  id v12;
  NSObject *v13;
  void *v14;
  ChromeViewController *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  __CFString *v30;
  _QWORD v31[4];
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[3];
  uint64_t v37;
  uint8_t buf[32];
  __int128 v39;
  uint64_t v40;

  v3 = -[ChromeViewController shouldUseHikingMap](self, "shouldUseHikingMap");
  if (-[ChromeViewController shouldForceExploreMap](self, "shouldForceExploreMap"))
  {
    if (self->_hasForcedExploreModernMap)
      goto LABEL_16;
    v4 = sub_10043196C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Forcing mapType to Explore + Modern Map", buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "_cartographicConfiguration");
    }
    else
    {
      v40 = 0;
      v39 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    v17 = *(_OWORD *)&buf[16];
    *(_OWORD *)&self->_originalConfiguration.style = *(_OWORD *)buf;
    *(_OWORD *)&self->_originalConfiguration.projection = v17;
    *(_OWORD *)&self->_originalConfiguration.mapkitUsage = v39;
    v18 = v40;
    *(_QWORD *)&self->_originalConfiguration.gridOnly = v40;
    *(_OWORD *)buf = *(_OWORD *)&self->_originalConfiguration.mapkitUsage;
    *(_QWORD *)&buf[16] = v18;

    if (sub_1002A8AA0(self) != 5)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
      objc_msgSend(v19, "setOverrideUserInterfaceStyle:", 0);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));
      objc_msgSend(v21, "setOverrideUserInterfaceStyle:", 0);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v36[0] = xmmword_100E2F4D0;
    v36[1] = xmmword_100E22F40;
    v36[2] = *(_OWORD *)buf;
    v37 = *(_QWORD *)&buf[16];
    objc_msgSend(v22, "_setCartographicConfiguration:", v36);

    self->_hasForcedExploreModernMap = 1;
    v15 = self;
    v16 = 1;
  }
  else
  {
    if (!self->_hasForcedExploreModernMap)
      goto LABEL_16;
    style = self->_originalConfiguration.style;
    emphasis = self->_originalConfiguration.emphasis;
    projection = self->_originalConfiguration.projection;
    terrainMode = self->_originalConfiguration.terrainMode;
    v34 = *(_OWORD *)&self->_originalConfiguration.mapkitUsage;
    v35 = *(_QWORD *)&self->_originalConfiguration.gridOnly;
    v12 = sub_10043196C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = style;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = emphasis;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = projection;
      LOWORD(v39) = 2048;
      *(_QWORD *)((char *)&v39 + 2) = terrainMode;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Restoring configuration, style %ld, emphasis %ld, projection %ld, terrainMode %ld", buf, 0x2Au);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v31[0] = style;
    v31[1] = emphasis;
    v31[2] = projection;
    v31[3] = terrainMode;
    v32 = v34;
    v33 = v35;
    objc_msgSend(v14, "_setCartographicConfiguration:", v31);

    self->_hasForcedExploreModernMap = 0;
    v15 = self;
    v16 = 0;
  }
  -[ChromeViewController didUpdateForcedExploreMapConfiguration:](v15, "didUpdateForcedExploreMapConfiguration:", v16);
LABEL_16:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "preferredConfiguration"));

  if (objc_msgSend(v24, "conformsToProtocol:", &OBJC_PROTOCOL___MKMapConfigurationHiking))
    v25 = v24;
  else
    v25 = 0;
  v26 = v25;

  if (v26)
  {
    v27 = sub_10043196C();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = CFSTR("NO");
      if (v3)
        v29 = CFSTR("YES");
      v30 = v29;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "updateHikingMapConfiguration showsTopographicFeatures: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v26, "setShowsTopographicFeatures:", v3);
  }

}

- (void)checkIfCoordinate:(CLLocationCoordinate2D)a3 isInHikingContextualRegionWithCompletionHandler:(id)a4
{
  double longitude;
  double latitude;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  id v19;
  NSUInteger v20;
  id v21;
  int v22;
  ChromeViewController *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = a4;
  v8 = sub_10043196C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v22 = 134349569;
    v23 = self;
    v24 = 2049;
    v25 = latitude;
    v26 = 2049;
    v27 = longitude;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Queueing up hiking coordinate check for: %{private}f, %{private}f", (uint8_t *)&v22, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_MapsCoordinateKey coordinateKeyFromCoordinate:](_MapsCoordinateKey, "coordinateKeyFromCoordinate:", latitude, longitude));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_hikingCoordinateChecks, "keyEnumerator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
  v13 = objc_msgSend(v12, "containsObject:", v10);

  v14 = sub_10043196C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v16)
    {
      v22 = 134349056;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Existing check for this coordinate is already in flight; adding completion block to the list",
        (uint8_t *)&v22,
        0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_hikingCoordinateChecks, "objectForKey:", v10));
    v18 = objc_msgSend(v7, "copy");
    v19 = objc_retainBlock(v18);
    objc_msgSend(v17, "addObject:", v19);

  }
  else
  {
    if (v16)
    {
      v22 = 134349056;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] There are no existing checks for this coordinate in flight; creating new task",
        (uint8_t *)&v22,
        0xCu);
    }

    v20 = -[NSMapTable count](self->_hikingCoordinateChecks, "count");
    v21 = objc_msgSend(v7, "copy");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v21));

    -[NSMapTable setObject:forKey:](self->_hikingCoordinateChecks, "setObject:forKey:", v17, v10);
    if (!v20)
      -[ChromeViewController _checkHikingCoordinate:](self, "_checkHikingCoordinate:", latitude, longitude);
  }

}

- (void)_checkHikingCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  ChromeViewController *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;

  longitude = a3.longitude;
  latitude = a3.latitude;
  objc_initWeak(&location, self);
  v6 = sub_10043196C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349569;
    v13 = self;
    v14 = 2049;
    v15 = latitude;
    v16 = 2049;
    v17 = longitude;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Checking hiking coordinate: %{private}f, %{private}f", buf, 0x20u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100AB3570;
  v9[3] = &unk_1011E1870;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "checkIfCoordinate:isInHikingContextualRegionWithCompletionHandler:", v9, latitude, longitude);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_setInactive:(BOOL)a3
{
  _BOOL8 v3;
  ChromeViewController *v4;
  _BOOL4 inactive;
  id v6;
  NSObject *v7;
  ChromeViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  __CFString *v15;
  __CFString *v16;
  _BOOL8 v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  id *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char *v32;
  __CFString *v33;
  __CFString *v34;
  id v35;
  void *v36;
  void *v37;
  __CFString *v38;
  id *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  id v47;
  void *v48;
  const char *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  id v56;
  NSObject *v57;
  char *v58;
  _BOOL4 v59;
  ChromeViewController *v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  _BYTE v66[24];

  v3 = a3;
  v4 = self;
  inactive = self->_inactive;
  self->_inactive = a3;
  if (!-[ChromeViewController isViewLoaded](self, "isViewLoaded")
    || -[ChromeViewController isSuppressed](v4, "isSuppressed"))
  {
    v6 = sub_10043196C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_19:

      goto LABEL_20;
    }
    v8 = v4;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v60 = v4;
    v59 = inactive;
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_9;
      }

    }
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

    if (v3)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    v16 = v15;
    v17 = v3;
    if (-[ChromeViewController isViewLoaded](v8, "isViewLoaded"))
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    v19 = v18;
    *(_DWORD *)buf = 138544130;
    if (-[ChromeViewController isSuppressed](v8, "isSuppressed"))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v62 = v14;
    v63 = 2114;
    v64 = (const char *)v15;
    v65 = 2114;
    *(_QWORD *)v66 = v18;
    v3 = v17;
    *(_WORD *)&v66[8] = 2114;
    *(_QWORD *)&v66[10] = v20;
    v21 = v20;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting chrome inactive: %{public}@, but view not loaded (loaded? %{public}@) or suppressed (%{public}@)", buf, 0x2Au);

    v4 = v60;
    inactive = v59;
    goto LABEL_19;
  }
  v22 = sub_10043196C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (inactive != v3)
  {
    if (!v24)
      goto LABEL_54;
    v39 = v4;
    v40 = (objc_class *)objc_opt_class(v39);
    v41 = NSStringFromClass(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    if ((objc_opt_respondsToSelector(v39, "accessibilityIdentifier") & 1) != 0)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "performSelector:", "accessibilityIdentifier"));
      v44 = v43;
      if (v43 && !objc_msgSend(v43, "isEqualToString:", v42))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v42, v39, v44));

        goto LABEL_41;
      }

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v42, v39));
LABEL_41:

    v32 = v45;
    v46 = CFSTR("NO");
    if (v3)
      v46 = CFSTR("YES");
    v34 = v46;
    v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39[37], "allTokenReasons"));
    v36 = v47;
    if (v47)
    {
      if (objc_msgSend(v47, "count"))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "componentsJoinedByString:", CFSTR(", ")));
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v36, v48));

      }
      else
      {
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v36));
      }
    }
    else
    {
      v38 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138543874;
    v62 = v32;
    v63 = 2114;
    v64 = (const char *)v34;
    v65 = 2114;
    *(_QWORD *)v66 = v38;
    v49 = "[%{public}@] Setting chrome inactive: %{public}@ (reasons: %{public}@)";
    goto LABEL_53;
  }
  if (!v24)
    goto LABEL_54;
  v25 = v4;
  v26 = (objc_class *)objc_opt_class(v25);
  v27 = NSStringFromClass(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "performSelector:", "accessibilityIdentifier"));
    v30 = v29;
    if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

      goto LABEL_30;
    }

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_30:

  v32 = v31;
  v33 = CFSTR("NO");
  if (v3)
    v33 = CFSTR("YES");
  v34 = v33;
  v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25[37], "allTokenReasons"));
  v36 = v35;
  if (v35)
  {
    if (objc_msgSend(v35, "count"))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "componentsJoinedByString:", CFSTR(", ")));
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v36, v37));

    }
    else
    {
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v36));
    }
  }
  else
  {
    v38 = CFSTR("<nil>");
  }

  *(_DWORD *)buf = 138543874;
  v62 = v32;
  v63 = 2114;
  v64 = (const char *)v34;
  v65 = 2114;
  *(_QWORD *)v66 = v38;
  v49 = "[%{public}@] Reapplying chrome inactive: %{public}@ (reasons: %{public}@)";
LABEL_53:
  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v49, buf, 0x20u);

LABEL_54:
  if (v4->_inactive)
  {
    if (!-[MapsTokenStorage count](v4->_deactivationTokens, "count"))
    {
      v53 = sub_1004318FC();
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_setInactive:YES was called without having any deactivation tokens! You must deactivate the chrome using tokens.")));
        *(_DWORD *)buf = 136316162;
        v62 = "-[ChromeViewController _setInactive:]";
        v63 = 2080;
        v64 = "ChromeViewController.m";
        v65 = 1024;
        *(_DWORD *)v66 = 1883;
        *(_WORD *)&v66[4] = 2080;
        *(_QWORD *)&v66[6] = "_deactivationTokens.count > 0";
        *(_WORD *)&v66[14] = 2112;
        *(_QWORD *)&v66[16] = v55;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v56 = sub_1004318FC();
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v58 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v62 = v58;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController createMapReplacementView](v4, "createMapReplacementView"));
    -[ChromeViewController _installMapReplacementView:](v4, "_installMapReplacementView:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](v4, "mapView"));
    objc_msgSend(v51, "_setInactive:", 1);

    if (-[ChromeViewController removesMapViewWhenInactive](v4, "removesMapViewWhenInactive"))
      -[ChromeViewController removeMapViewFromViewHierarchy](v4, "removeMapViewFromViewHierarchy");
  }
  else
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](v4, "mapView"));
    objc_msgSend(v52, "_setInactive:", 0);

    -[ChromeViewController restoreMapInViewHierarchy](v4, "restoreMapInViewHierarchy");
  }
LABEL_20:
  if (inactive != v3)
    -[ChromeViewController didBecomeInactive:](v4, "didBecomeInactive:", v3);
}

- (id)deactivationReasons
{
  return -[MapsTokenStorage allTokenReasons](self->_deactivationTokens, "allTokenReasons");
}

- (void)deactivationReasonsDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ChromeViewControllerDidChangeDeactivationReasonsNotification"), self);

}

- (void)removeMapViewFromViewHierarchy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v2, "removeFromSuperview");

}

- (BOOL)removesMapViewWhenInactive
{
  return 1;
}

- (id)createMapReplacementView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc((Class)UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v3, "initWithFrame:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapReplacementColor](self, "mapReplacementColor"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

  v7 = (objc_class *)objc_opt_class(ChromeViewController);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.mapReplacementView"), v9));
  objc_msgSend(v5, "setAccessibilityIdentifier:", v10);

  return v5;
}

- (id)mapReplacementColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _mapkit_colorNamed:compatibleWithTraitCollection:](UIColor, "_mapkit_colorNamed:compatibleWithTraitCollection:", CFSTR("CartographyBackgroundColor"), v2));

  return v3;
}

- (UIEdgeInsets)mapAttributionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)incrementForToken:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  ChromeViewController *v9;
  ChromeViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  ChromeViewController *v21;
  ChromeViewController *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  ChromeViewController *v33;
  ChromeViewController *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  unint64_t v41;
  id v42;
  NSObject *v43;
  ChromeViewController *v44;
  objc_class *v45;
  NSString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char *v51;
  id v52;
  void *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  unint64_t v57;
  id v58;
  NSObject *v59;
  ChromeViewController *v60;
  objc_class *v61;
  NSString *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char *v67;
  id v68;
  void *v69;
  void *v70;
  __CFString *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  id v76;
  NSObject *v77;
  char *v78;
  id v79;
  NSObject *v80;
  void *v81;
  id v82;
  NSObject *v83;
  char *v84;
  uint8_t buf[4];
  const char *v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  void *v94;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokenGroupName"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ChromeDeactivation"));

  if (v6)
  {
    v7 = sub_10043196C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_29;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_9;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_9:

LABEL_29:
    *(_DWORD *)buf = 138543618;
    v86 = (const char *)v16;
    v87 = 2114;
    v88 = (const char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deactivation token added: %{public}@", buf, 0x16u);

LABEL_30:
    v41 = -[MapsTokenStorage count](self->_deactivationTokens, "count");
    if (v41 == 1)
    {
      -[ChromeViewController _setInactive:](self, "_setInactive:", 1);
LABEL_50:
      -[ChromeViewController deactivationReasonsDidChange](self, "deactivationReasonsDidChange");
      goto LABEL_51;
    }
    if (!v41)
    {
      v73 = sub_1004318FC();
      v74 = objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("incremented token, we should have >1 now (actually have %lu)"), 0));
        *(_DWORD *)buf = 136316162;
        v86 = "-[ChromeViewController incrementForToken:]";
        v87 = 2080;
        v88 = "ChromeViewController.m";
        v89 = 1024;
        v90 = 1952;
        v91 = 2080;
        v92 = "count > 0";
        v93 = 2112;
        v94 = v75;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v76 = sub_1004318FC();
        v77 = objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v78 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v86 = v78;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v42 = sub_10043196C();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
LABEL_49:

      goto LABEL_50;
    }
    v44 = self;
    v45 = (objc_class *)objc_opt_class(v44);
    v46 = NSStringFromClass(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    if ((objc_opt_respondsToSelector(v44, "accessibilityIdentifier") & 1) != 0)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v44, "performSelector:", "accessibilityIdentifier"));
      v49 = v48;
      if (v48 && !objc_msgSend(v48, "isEqualToString:", v47))
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v47, v44, v49));

        goto LABEL_38;
      }

    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v47, v44));
LABEL_38:

    v51 = v50;
    v52 = (id)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage allTokenReasons](self->_deactivationTokens, "allTokenReasons"));
    v53 = v52;
    if (v52)
    {
      if (objc_msgSend(v52, "count"))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "componentsJoinedByString:", CFSTR(", ")));
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v53, v54));

      }
      else
      {
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v53));
      }
    }
    else
    {
      v55 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138543618;
    v86 = v51;
    v87 = 2114;
    v88 = (const char *)v55;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[%{public}@] Remaining deactivated for reasons: %{public}@", buf, 0x16u);

    goto LABEL_49;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokenGroupName"));
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("ChromeHiking"));

  if (!v18)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokenGroupName"));
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("ChromeMapInsetPropagationSuspension"));

    if (!v30)
      goto LABEL_51;
    v31 = sub_10043196C();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
LABEL_55:

      v57 = -[MapsTokenStorage count](self->_mapInsetPropagationSuspensionTokens, "count");
      if (v57 == 1)
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
        objc_msgSend(v72, "_suspendPropagatingEdgeInsets");

        goto LABEL_51;
      }
      if (!v57)
      {
        v79 = sub_1004318FC();
        v80 = objc_claimAutoreleasedReturnValue(v79);
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("incremented token, we should have >1 now (actually have %lu)"), 0));
          *(_DWORD *)buf = 136316162;
          v86 = "-[ChromeViewController incrementForToken:]";
          v87 = 2080;
          v88 = "ChromeViewController.m";
          v89 = 1024;
          v90 = 1977;
          v91 = 2080;
          v92 = "count > 0";
          v93 = 2112;
          v94 = v81;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

        }
        if (sub_100A70734())
        {
          v82 = sub_1004318FC();
          v83 = objc_claimAutoreleasedReturnValue(v82);
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          {
            v84 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v86 = v84;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
      v58 = sub_10043196C();
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (!os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
LABEL_72:

        goto LABEL_51;
      }
      v60 = self;
      v61 = (objc_class *)objc_opt_class(v60);
      v62 = NSStringFromClass(v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
      if ((objc_opt_respondsToSelector(v60, "accessibilityIdentifier") & 1) != 0)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v60, "performSelector:", "accessibilityIdentifier"));
        v65 = v64;
        if (v64 && !objc_msgSend(v64, "isEqualToString:", v63))
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v63, v60, v65));

          goto LABEL_63;
        }

      }
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v63, v60));
LABEL_63:

      v67 = v66;
      v68 = (id)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage allTokenReasons](self->_mapInsetPropagationSuspensionTokens, "allTokenReasons"));
      v69 = v68;
      if (v68)
      {
        if (objc_msgSend(v68, "count"))
        {
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "componentsJoinedByString:", CFSTR(", ")));
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v69, v70));

        }
        else
        {
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v69));
        }
      }
      else
      {
        v71 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 138543618;
      v86 = v67;
      v87 = 2114;
      v88 = (const char *)v71;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "[%{public}@] Still suspending map inset propagation for reasons: %{public}@", buf, 0x16u);

      goto LABEL_72;
    }
    v33 = self;
    v34 = v33;
    if (!v33)
    {
      v40 = CFSTR("<nil>");
      goto LABEL_54;
    }
    v35 = (objc_class *)objc_opt_class(v33);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
      v39 = v38;
      if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
      {
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

        goto LABEL_27;
      }

    }
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_27:

LABEL_54:
    *(_DWORD *)buf = 138543618;
    v86 = (const char *)v40;
    v87 = 2114;
    v88 = (const char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Map inset propagation suspension token added: %{public}@", buf, 0x16u);

    goto LABEL_55;
  }
  v19 = sub_10043196C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    goto LABEL_45;
  v21 = self;
  v22 = v21;
  if (!v21)
  {
    v28 = CFSTR("<nil>");
    goto LABEL_44;
  }
  v23 = (objc_class *)objc_opt_class(v21);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
    v27 = v26;
    if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
    {
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

      goto LABEL_18;
    }

  }
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_18:

LABEL_44:
  *(_DWORD *)buf = 138543618;
  v86 = (const char *)v28;
  v87 = 2114;
  v88 = (const char *)v4;
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Hiking token added: %{public}@", buf, 0x16u);

LABEL_45:
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));

  if (v56)
    -[ChromeViewController updateHikingMapConfiguration](self, "updateHikingMapConfiguration");
LABEL_51:

}

- (void)decrementForToken:(id)a3
{
  __CFString *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  ChromeViewController *v9;
  ChromeViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  ChromeViewController *v21;
  ChromeViewController *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  ChromeViewController *v33;
  ChromeViewController *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  id v41;
  NSObject *v42;
  ChromeViewController *v43;
  objc_class *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  id v51;
  void *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  id v56;
  NSObject *v57;
  ChromeViewController *v58;
  objc_class *v59;
  NSString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __CFString *v65;
  id v66;
  void *v67;
  void *v68;
  __CFString *v69;
  void *v70;
  uint8_t buf[4];
  __CFString *v72;
  __int16 v73;
  __CFString *v74;

  v4 = (__CFString *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString tokenGroupName](v4, "tokenGroupName"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ChromeDeactivation"));

  if (v6)
  {
    v7 = sub_10043196C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_29;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_9;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_9:

LABEL_29:
    *(_DWORD *)buf = 138543618;
    v72 = v16;
    v73 = 2114;
    v74 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deactivation token removed: %{public}@", buf, 0x16u);

LABEL_30:
    if (!-[MapsTokenStorage count](self->_deactivationTokens, "count"))
    {
      -[ChromeViewController _setInactive:](self, "_setInactive:", 0);
LABEL_49:
      -[ChromeViewController deactivationReasonsDidChange](self, "deactivationReasonsDidChange");
      goto LABEL_50;
    }
    v41 = sub_10043196C();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
LABEL_48:

      goto LABEL_49;
    }
    v43 = self;
    v44 = (objc_class *)objc_opt_class(v43);
    v45 = NSStringFromClass(v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    if ((objc_opt_respondsToSelector(v43, "accessibilityIdentifier") & 1) != 0)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v43, "performSelector:", "accessibilityIdentifier"));
      v48 = v47;
      if (v47 && !objc_msgSend(v47, "isEqualToString:", v46))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v46, v43, v48));

        goto LABEL_37;
      }

    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v46, v43));
LABEL_37:

    v50 = v49;
    v51 = (id)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage allTokenReasons](self->_deactivationTokens, "allTokenReasons"));
    v52 = v51;
    if (v51)
    {
      if (objc_msgSend(v51, "count"))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "componentsJoinedByString:", CFSTR(", ")));
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v52, v53));

      }
      else
      {
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v52));
      }
    }
    else
    {
      v54 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138543618;
    v72 = v50;
    v73 = 2114;
    v74 = v54;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[%{public}@] Remaining deactivated for reasons: %{public}@", buf, 0x16u);

    goto LABEL_48;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString tokenGroupName](v4, "tokenGroupName"));
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("ChromeHiking"));

  if (!v18)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString tokenGroupName](v4, "tokenGroupName"));
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("ChromeMapInsetPropagationSuspension"));

    if (!v30)
      goto LABEL_50;
    v31 = sub_10043196C();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
LABEL_55:

      if (!-[MapsTokenStorage count](self->_mapInsetPropagationSuspensionTokens, "count"))
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
        objc_msgSend(v70, "_resumePropagatingEdgeInsets");

        goto LABEL_50;
      }
      v56 = sub_10043196C();
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
LABEL_70:

        goto LABEL_50;
      }
      v58 = self;
      v59 = (objc_class *)objc_opt_class(v58);
      v60 = NSStringFromClass(v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      if ((objc_opt_respondsToSelector(v58, "accessibilityIdentifier") & 1) != 0)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v58, "performSelector:", "accessibilityIdentifier"));
        v63 = v62;
        if (v62 && !objc_msgSend(v62, "isEqualToString:", v61))
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v61, v58, v63));

          goto LABEL_62;
        }

      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v61, v58));
LABEL_62:

      v65 = v64;
      v66 = (id)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage allTokenReasons](self->_mapInsetPropagationSuspensionTokens, "allTokenReasons"));
      v67 = v66;
      if (v66)
      {
        if (objc_msgSend(v66, "count"))
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "componentsJoinedByString:", CFSTR(", ")));
          v69 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v67, v68));

        }
        else
        {
          v69 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v67));
        }
      }
      else
      {
        v69 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 138543618;
      v72 = v65;
      v73 = 2114;
      v74 = v69;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "[%{public}@] Still suspending map inset propagation for reasons: %{public}@", buf, 0x16u);

      goto LABEL_70;
    }
    v33 = self;
    v34 = v33;
    if (!v33)
    {
      v40 = CFSTR("<nil>");
      goto LABEL_54;
    }
    v35 = (objc_class *)objc_opt_class(v33);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
      v39 = v38;
      if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
      {
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

        goto LABEL_27;
      }

    }
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_27:

LABEL_54:
    *(_DWORD *)buf = 138543618;
    v72 = v40;
    v73 = 2114;
    v74 = v4;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Map inset propagation suspension removed: %{public}@", buf, 0x16u);

    goto LABEL_55;
  }
  v19 = sub_10043196C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    goto LABEL_44;
  v21 = self;
  v22 = v21;
  if (!v21)
  {
    v28 = CFSTR("<nil>");
    goto LABEL_43;
  }
  v23 = (objc_class *)objc_opt_class(v21);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
    v27 = v26;
    if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
    {
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

      goto LABEL_18;
    }

  }
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_18:

LABEL_43:
  *(_DWORD *)buf = 138543618;
  v72 = v28;
  v73 = 2114;
  v74 = v4;
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Hiking token removed: %{public}@", buf, 0x16u);

LABEL_44:
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));

  if (v55)
    -[ChromeViewController updateHikingMapConfiguration](self, "updateHikingMapConfiguration");
LABEL_50:

}

- (void)restoreMapInViewHierarchy
{
  id v3;
  NSObject *v4;
  ChromeViewController *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  MKMapView *mapView;
  UIView *mapReplacementView;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  MKMapView *v18;
  __int16 v19;
  UIView *v20;

  v3 = sub_10043196C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    mapView = v6->_mapView;
    mapReplacementView = v6->_mapReplacementView;
    *(_DWORD *)buf = 138543874;
    v16 = v12;
    v17 = 2048;
    v18 = mapView;
    v19 = 2048;
    v20 = mapReplacementView;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] restoreMapInViewHierarchy mapView: %p (current _mapReplacementView: %p)", buf, 0x20u);

  }
  if (self->_mapView)
  {
    if (-[ChromeViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[ChromeViewController installMapView:](self, "installMapView:", self->_mapView);
      -[ChromeViewController _removeMapReplacementViewIfNeeded](self, "_removeMapReplacementViewIfNeeded");
      -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("mapInsets"), 0);
      -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("labelInsetsAndWidths"), 0);
      -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("personalizedItemSources"), 0);
      -[ChromeViewController updateComponentsIfNeeded](self, "updateComponentsIfNeeded");
    }
  }
}

- (void)evictMapView
{
  id v3;
  NSObject *v4;
  ChromeViewController *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  MKMapView *mapView;
  UIView *mapReplacementView;
  MKMapView *v15;
  MKMapView *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  MKMapView *v20;
  __int16 v21;
  UIView *v22;

  v3 = sub_10043196C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v5 = self;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

      goto LABEL_8;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
  mapView = v6->_mapView;
  mapReplacementView = v6->_mapReplacementView;
  *(_DWORD *)buf = 138543874;
  v18 = v12;
  v19 = 2048;
  v20 = mapView;
  v21 = 2048;
  v22 = mapReplacementView;
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] evictMapView mapView: %p (current _mapReplacementView: %p)", buf, 0x20u);

LABEL_11:
  v15 = self->_mapView;
  if (v15)
  {
    v16 = v15;
    -[ChromeViewController prepareToRemoveMapView:](self, "prepareToRemoveMapView:", v16);
    -[MKMapView removeFromSuperview](v16, "removeFromSuperview");

  }
}

- (void)prepareToRemoveMapView:(id)a3
{
  CustomPOIsController *customPOIsController;
  MapCameraController *mapCameraController;
  RouteAnnotationsController *routeAnnotationsController;

  customPOIsController = self->_customPOIsController;
  self->_customPOIsController = 0;

  mapCameraController = self->_mapCameraController;
  self->_mapCameraController = 0;

  routeAnnotationsController = self->_routeAnnotationsController;
  self->_routeAnnotationsController = 0;

}

- (UIView)currentMapReplacementView
{
  return self->_mapReplacementView;
}

- (void)_installMapReplacementView:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  ChromeViewController *v8;
  ChromeViewController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  MKMapView *mapView;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  MKMapView *v22;

  v5 = a3;
  -[ChromeViewController _removeMapReplacementViewIfNeeded](self, "_removeMapReplacementViewIfNeeded");
  v6 = sub_10043196C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

LABEL_10:
    mapView = v9->_mapView;
    *(_DWORD *)buf = 138543874;
    v18 = v15;
    v19 = 2048;
    v20 = v5;
    v21 = 2048;
    v22 = mapView;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] _installMapReplacementView %p (current _mapView: %p)", buf, 0x20u);

  }
  objc_storeStrong((id *)&self->_mapReplacementView, a3);
  if (v5)
    -[ChromeViewController installMapReplacementView:](self, "installMapReplacementView:", v5);

}

- (void)installMapReplacementView:(id)a3
{
  unsigned int v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ChromeViewController *v9;

  v6 = a3;
  v4 = -[ChromeViewController isViewLoaded](self, "isViewLoaded");
  v5 = v6;
  if (v6 && v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100AB5BF4;
    v7[3] = &unk_1011AC8B0;
    v8 = v6;
    v9 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);

    v5 = v6;
  }

}

- (void)_removeMapReplacementViewIfNeeded
{
  id v3;
  NSObject *v4;
  ChromeViewController *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  MKMapView *mapView;
  UIView *mapReplacementView;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  UIView *v18;
  __int16 v19;
  MKMapView *v20;

  if (self->_mapReplacementView)
  {
    v3 = sub_10043196C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      -[ChromeViewController removeMapReplacementView:](self, "removeMapReplacementView:", self->_mapReplacementView);
      mapReplacementView = self->_mapReplacementView;
      self->_mapReplacementView = 0;

      return;
    }
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    v12 = self->_mapReplacementView;
    mapView = v5->_mapView;
    *(_DWORD *)buf = 138543874;
    v16 = v11;
    v17 = 2048;
    v18 = v12;
    v19 = 2048;
    v20 = mapView;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] _removeMapReplacementViewIfNeeded %p (current _mapView: %p)", buf, 0x20u);

    goto LABEL_9;
  }
}

- (void)removeMapReplacementView:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  ChromeViewController *v7;
  ChromeViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = sub_10043196C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v16 = v14;
    v17 = 2048;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] removeMapReplacementView %p", buf, 0x16u);

  }
  objc_msgSend(v4, "removeFromSuperview");

}

+ (Class)userLocationViewClass
{
  return (Class)objc_opt_class(UserLocationView);
}

- (UserLocationView)userLocationView
{
  UserLocationView *userLocationView;
  UserLocationView *v4;
  UserLocationView *v5;

  userLocationView = self->_userLocationView;
  if (!userLocationView)
  {
    v4 = (UserLocationView *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(self), "userLocationViewClass")), "initWithAnnotation:reuseIdentifier:", 0, 0);
    v5 = self->_userLocationView;
    self->_userLocationView = v4;

    userLocationView = self->_userLocationView;
  }
  return userLocationView;
}

- (id)personalizedItemSourcesForCurrentState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController nextTopContext](self, "nextTopContext"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v6 = v5;

  if ((objc_opt_respondsToSelector(v6, "personalizedItemSources") & 1) != 0)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personalizedItemSources"));
  else
    v7 = &__NSArray0__struct;

  return v7;
}

- (CGRect)unobscuredMapContentBoundsInContainingView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
  objc_msgSend(v2, "layoutFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setNeedsUpdateFullscreenViewController
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[GroupAnimation animation](GroupAnimation, "animation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  -[ChromeViewController _updateFullscreenViewControllerForContext:previousIsLeaving:withAnimation:](self, "_updateFullscreenViewControllerForContext:previousIsLeaving:withAnimation:", v3, 0, v4);

  objc_msgSend(v4, "runWithDefaultOptions");
}

- (BOOL)supportsDefaultFullscreenViewControllerPresentation
{
  return 1;
}

- (void)_updateFullscreenViewControllerForContext:(id)a3 previousIsLeaving:(BOOL)a4 withAnimation:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a5;
  if (-[ChromeViewController supportsDefaultFullscreenViewControllerPresentation](self, "supportsDefaultFullscreenViewControllerPresentation"))
  {
    if ((objc_opt_respondsToSelector(v9, "fullscreenViewController") & 1) != 0)
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fullscreenViewController"));
    else
      v8 = 0;
    -[ChromeViewController _transitionToFullscreenViewController:forContext:previousIsLeaving:withAnimation:](self, "_transitionToFullscreenViewController:forContext:previousIsLeaving:withAnimation:", v8, v9, 0, v7);

  }
}

- (void)_transitionToFullscreenViewController:(id)a3 forContext:(id)a4 previousIsLeaving:(BOOL)a5 withAnimation:(id)a6
{
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  ChromeViewController *v16;
  ChromeViewController *v17;
  id v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  UIViewController *v25;
  id v26;
  unint64_t v27;
  unsigned __int8 v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  ChromeViewController *v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  __CFString *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = sub_10043196C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = self;
    v17 = v16;
    if (!v16)
    {
      v24 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v54 = v7;
    v18 = v13;
    v19 = (objc_class *)objc_opt_class(v16);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v17, v23));

        goto LABEL_8;
      }

    }
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v17));
LABEL_8:

    v13 = v18;
    v7 = v54;
LABEL_10:

    *(_DWORD *)buf = 138543874;
    v66 = v24;
    v67 = 2112;
    v68 = v11;
    v69 = 2112;
    v70 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] _transitionToFullscreenViewController %@ for context %@", buf, 0x20u);

  }
  v25 = self->_fullscreenViewController;
  objc_storeStrong((id *)&self->_fullscreenViewController, a3);
  v26 = v25;
  v27 = (unint64_t)v11;
  if (v27 | (unint64_t)v26)
  {
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if ((v28 & 1) == 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v27, "view"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "view"));
      v32 = objc_alloc_init((Class)_UIViewControllerOneToOneTransitionContext);
      v51 = v13;
      objc_msgSend(v32, "_setIsAnimated:", objc_msgSend(v13, "isAnimated"));
      objc_msgSend(v32, "_setContainerView:", v29);
      objc_msgSend(v32, "_setFromViewController:", v26);
      objc_msgSend(v32, "_setFromView:", v31);
      objc_msgSend(v29, "bounds");
      objc_msgSend(v32, "_setFromStartFrame:");
      objc_msgSend(v29, "bounds");
      objc_msgSend(v32, "_setFromEndFrame:");
      objc_msgSend(v32, "_setToViewController:", v27);
      v52 = (void *)v30;
      objc_msgSend(v32, "_setToView:", v30);
      objc_msgSend(v29, "bounds");
      objc_msgSend(v32, "_setToStartFrame:");
      v53 = v29;
      objc_msgSend(v29, "bounds");
      objc_msgSend(v32, "_setToEndFrame:");
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController previousTopContext](self, "previousTopContext"));
      if (((objc_opt_respondsToSelector(v12, "fullscreenViewControllerPresentationTransition") & 1) == 0
         || (v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fullscreenViewControllerPresentationTransition"))) == 0)
        && ((objc_opt_respondsToSelector(v33, "fullscreenViewControllerDismissalTransition") & 1) == 0
         || (v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "fullscreenViewControllerDismissalTransition"))) == 0))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController fullscreenViewControllerTransitionFromController:toController:isDismissTransition:](self, "fullscreenViewControllerTransitionFromController:toController:isDismissTransition:", v26, v27, v7));
      }
      v50 = v33;
      objc_msgSend(v34, "transitionDuration:", v32);
      objc_msgSend(v32, "_setDuration:");
      objc_msgSend(v32, "_setAnimator:", v34);
      v35 = self;
      v36 = (objc_class *)objc_opt_class(v35);
      v37 = NSStringFromClass(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      if ((objc_opt_respondsToSelector(v35, "accessibilityIdentifier") & 1) != 0)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v35, "performSelector:", "accessibilityIdentifier"));
        v40 = v39;
        if (v39 && !objc_msgSend(v39, "isEqualToString:", v38))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v38, v35, v40));

          goto LABEL_23;
        }

      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v38, v35));
LABEL_23:

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: waiting for chrome full-screen view controller transition to complete"), v41));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "addCompletionWaitBlockWithReason:", v42));

      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100AB6840;
      v55[3] = &unk_1011E18C0;
      v55[4] = v35;
      v56 = (id)v27;
      v57 = v12;
      v58 = v52;
      v59 = v53;
      v60 = v26;
      v61 = v31;
      v63 = v34;
      v64 = v43;
      v62 = v32;
      v49 = v34;
      v48 = v32;
      v44 = v43;
      v45 = v31;
      v46 = v53;
      v47 = v52;
      objc_msgSend(v51, "addPreparation:animations:completion:", v55, 0, 0);

      v13 = v51;
    }
  }

}

- (id)fullscreenViewControllerTransitionFromController:(id)a3 toController:(id)a4 isDismissTransition:(BOOL)a5
{
  void *v5;

  if (a5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController defaultFullscreenViewControllerDismissalTransition](self, "defaultFullscreenViewControllerDismissalTransition", a3, a4));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController defaultFullscreenViewControllerPresentationTransition](self, "defaultFullscreenViewControllerPresentationTransition", a3, a4));
  return v5;
}

- (id)defaultFullscreenViewControllerPresentationTransition
{
  return objc_alloc_init(ChromeMapToMapTransition);
}

- (id)defaultFullscreenViewControllerDismissalTransition
{
  return objc_alloc_init(ChromeMapToMapTransition);
}

- (void)setSuppressed:(BOOL)a3
{
  if (self->_suppressed != a3)
    -[ChromeViewController _setSuppressed:](self, "_setSuppressed:");
}

- (void)_setSuppressed:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  ChromeViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ChromeViewController *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;

  v3 = a3;
  self->_suppressed = a3;
  v5 = sub_10043196C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v7)
    {
LABEL_9:

      -[ChromeViewController _suppress](self, "_suppress");
      return;
    }
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] will suppress", buf, 0xCu);

    goto LABEL_9;
  }
  if (v7)
  {
    v15 = self;
    v16 = (objc_class *)objc_opt_class(v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_16;
      }

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_16:

    *(_DWORD *)buf = 138543362;
    v23 = v21;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] will unsuppress", buf, 0xCu);

  }
  -[ChromeViewController _unsuppress](self, "_unsuppress");
}

- (void)_suppress
{
  GroupAnimation **p_suppressionAnimation;
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  ChromeViewController *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  ChromeViewController *v28;
  id v29;
  id location;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;

  p_suppressionAnimation = &self->_suppressionAnimation;
  if (!self->_suppressionAnimation)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    -[NSObject removeObserver:name:object:](v5, "removeObserver:name:object:", self, NSUserDefaultsDidChangeNotification, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    if ((objc_opt_respondsToSelector(v14, "resignTopContextInChromeViewController:withAnimation:") & 1) != 0)
      objc_msgSend(v14, "resignTopContextInChromeViewController:withAnimation:", self, v13);
    objc_initWeak(&location, v13);
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_100AB75C4;
    v27 = &unk_1011AC888;
    objc_copyWeak(&v29, &location);
    v28 = self;
    objc_msgSend(v13, "addAnimations:completion:", 0, &v24);
    objc_storeStrong((id *)p_suppressionAnimation, v13);
    v15 = sub_10043196C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v17 = self;
    v18 = (objc_class *)objc_opt_class(v17);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && (objc_msgSend(v21, "isEqualToString:", v20) & 1) == 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22, v24, v25, v26, v27));

        goto LABEL_17;
      }

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_17:

    *(_DWORD *)buf = 138543618;
    v32 = v23;
    v33 = 2048;
    v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing suppress animation: %p", buf, 0x16u);

LABEL_18:
    objc_msgSend(v13, "runWithCurrentOptions");
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    goto LABEL_19;
  }
  v4 = sub_10043196C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] already in the middle of suppress/unsuppress animation, ignoring _suppress and will check after animation", buf, 0xCu);

  }
LABEL_19:

}

- (void)_unsuppress
{
  GroupAnimation **p_suppressionAnimation;
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  ChromeViewController *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id location;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  NSObject *v30;

  p_suppressionAnimation = &self->_suppressionAnimation;
  if (!self->_suppressionAnimation)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", 0));
    objc_initWeak(&location, v5);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100AB7ED0;
    v25[3] = &unk_1011AC860;
    v25[4] = self;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100AB802C;
    v23[3] = &unk_1011AC888;
    objc_copyWeak(&v24, &location);
    v23[4] = self;
    -[NSObject addPreparation:animations:completion:](v5, "addPreparation:animations:completion:", v25, 0, v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    if ((objc_opt_respondsToSelector(v13, "becomeTopContextInChromeViewController:withAnimation:") & 1) != 0)
      objc_msgSend(v13, "becomeTopContextInChromeViewController:withAnimation:", self, v5);
    objc_storeStrong((id *)p_suppressionAnimation, v5);
    v14 = sub_10043196C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v16 = self;
    v17 = (objc_class *)objc_opt_class(v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && (objc_msgSend(v20, "isEqualToString:", v19) & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_17;
      }

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_17:

    *(_DWORD *)buf = 138543618;
    v28 = v22;
    v29 = 2048;
    v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing unsuppress animation: %p", buf, 0x16u);

LABEL_18:
    -[NSObject runWithCurrentOptions](v5, "runWithCurrentOptions");

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    goto LABEL_19;
  }
  v4 = sub_10043196C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] already in the middle of suppress/unsuppress animation, ignoring _unsuppress and will check after animation", buf, 0xCu);

  }
LABEL_19:

}

- (CustomSearchManager)customSearchManager
{
  return (CustomSearchManager *)+[CustomSearchManager sharedManager](CustomSearchManager, "sharedManager");
}

- (CustomPOIsController)customPOIsController
{
  void *v3;
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CustomPOIsController *v13;
  CustomPOIsController *customPOIsController;
  void *v15;
  void *v16;
  PersonalizedItemManager *personalizedItemManager;
  CustomPOIsController *v18;
  PersonalizedItemManager *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v24;

  if (self->_customPOIsController)
    return self->_customPOIsController;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));

  if (!v3)
    return self->_customPOIsController;
  v4 = sub_10043196C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_9;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_9:

    *(_DWORD *)buf = 138543362;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Creating customPOIsController", buf, 0xCu);

  }
  v13 = objc_alloc_init(CustomPOIsController);
  customPOIsController = self->_customPOIsController;
  self->_customPOIsController = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController traitCollection](self, "traitCollection"));
  -[CustomPOIsController setAllowSingleSearchResult:](self->_customPOIsController, "setAllowSingleSearchResult:", objc_msgSend(v15, "userInterfaceIdiom") == (id)3);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  -[CustomPOIsController setMapView:](self->_customPOIsController, "setMapView:", v16);

  personalizedItemManager = self->_personalizedItemManager;
  if (personalizedItemManager)
  {
    -[PersonalizedItemManager addObserver:](personalizedItemManager, "addObserver:", self->_customPOIsController);
    v18 = self->_customPOIsController;
    v19 = self->_personalizedItemManager;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager allItems](v19, "allItems"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager itemGroups](self->_personalizedItemManager, "itemGroups"));
    -[CustomPOIsController personalizedItemManager:didChangeItems:itemGroups:](v18, "personalizedItemManager:didChangeItems:itemGroups:", v19, v20, v21);

  }
  -[SearchPinsManager setCustomPOIsController:](self->_searchPinsManager, "setCustomPOIsController:", self->_customPOIsController);
  -[MapSelectionManager setCustomPOIsController:](self->_mapSelectionManager, "setCustomPOIsController:", self->_customPOIsController);
  return self->_customPOIsController;
}

- (MapSelectionManager)mapSelectionManager
{
  MapSelectionManager *mapSelectionManager;
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MapSelectionManager *v13;
  void *v14;
  MapSelectionManager *v15;
  MapSelectionManager *v16;
  ChromeMapSelectionHandler *v17;
  ChromeMapSelectionHandler *mapSelectionHandler;
  void *v19;
  uint8_t buf[4];
  void *v22;

  mapSelectionManager = self->_mapSelectionManager;
  if (!mapSelectionManager)
  {
    v4 = sub_10043196C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      v13 = [MapSelectionManager alloc];
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapCameraController](self, "mapCameraController"));
      v15 = -[MapSelectionManager initWithCameraController:](v13, "initWithCameraController:", v14);
      v16 = self->_mapSelectionManager;
      self->_mapSelectionManager = v15;

      v17 = -[ChromeMapSelectionHandler initWithChromeViewController:]([ChromeMapSelectionHandler alloc], "initWithChromeViewController:", self);
      mapSelectionHandler = self->_mapSelectionHandler;
      self->_mapSelectionHandler = v17;

      -[MapSelectionManager setDelegate:](self->_mapSelectionManager, "setDelegate:", self->_mapSelectionHandler);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController customPOIsController](self, "customPOIsController"));
      -[MapSelectionManager setCustomPOIsController:](self->_mapSelectionManager, "setCustomPOIsController:", v19);

      mapSelectionManager = self->_mapSelectionManager;
      return mapSelectionManager;
    }
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Creating mapSelectionManager", buf, 0xCu);

    goto LABEL_9;
  }
  return mapSelectionManager;
}

- (MapCameraController)mapCameraController
{
  void *v3;
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MapCameraController *v13;
  void *v14;
  MapCameraController *v15;
  MapCameraController *mapCameraController;
  uint8_t buf[4];
  void *v19;

  if (!self->_mapCameraController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));

    if (v3)
    {
      v4 = sub_10043196C();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        v13 = [MapCameraController alloc];
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
        v15 = -[MapCameraController initWithMapView:](v13, "initWithMapView:", v14);
        mapCameraController = self->_mapCameraController;
        self->_mapCameraController = v15;

        -[SearchPinsManager setMapCameraController:](self->_searchPinsManager, "setMapCameraController:", self->_mapCameraController);
        return self->_mapCameraController;
      }
      v6 = self;
      v7 = (objc_class *)objc_opt_class(v6);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
        v11 = v10;
        if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

          goto LABEL_9;
        }

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_9:

      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Creating mapCameraController", buf, 0xCu);

      goto LABEL_10;
    }
  }
  return self->_mapCameraController;
}

- (PersonalizedItemManager)personalizedItemManager
{
  PersonalizedItemManager *personalizedItemManager;
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PersonalizedItemManager *v14;
  PersonalizedItemManager *v15;
  PersonalizedItemManager *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;

  personalizedItemManager = self->_personalizedItemManager;
  if (personalizedItemManager)
    return personalizedItemManager;
  v4 = sub_10043196C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Creating personalizedItemManager", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController customPOIsController](self, "customPOIsController"));
  v14 = objc_alloc_init(PersonalizedItemManager);
  v15 = self->_personalizedItemManager;
  self->_personalizedItemManager = v14;

  if (v13)
  {
    -[PersonalizedItemManager addObserver:](self->_personalizedItemManager, "addObserver:", v13);
    v16 = self->_personalizedItemManager;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager allItems](v16, "allItems"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager itemGroups](self->_personalizedItemManager, "itemGroups"));
    objc_msgSend(v13, "personalizedItemManager:didChangeItems:itemGroups:", v16, v17, v18);

  }
  personalizedItemManager = self->_personalizedItemManager;
  return personalizedItemManager;
}

- (RouteAnnotationsController)routeAnnotationsController
{
  void *v3;
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RouteAnnotationsController *v13;
  RouteAnnotationsController *routeAnnotationsController;
  void *v15;
  uint8_t buf[4];
  void *v18;

  if (!self->_routeAnnotationsController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));

    if (v3)
    {
      v4 = sub_10043196C();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        v13 = objc_alloc_init(RouteAnnotationsController);
        routeAnnotationsController = self->_routeAnnotationsController;
        self->_routeAnnotationsController = v13;

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
        -[RouteAnnotationsController setMapView:](self->_routeAnnotationsController, "setMapView:", v15);

        return self->_routeAnnotationsController;
      }
      v6 = self;
      v7 = (objc_class *)objc_opt_class(v6);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
        v11 = v10;
        if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

          goto LABEL_9;
        }

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_9:

      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Creating routeAnnotationsController", buf, 0xCu);

      goto LABEL_10;
    }
  }
  return self->_routeAnnotationsController;
}

- (SearchPinsManager)searchPinsManager
{
  SearchPinsManager *searchPinsManager;
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SearchPinsManager *v13;
  void *v14;
  SearchPinsManager *v15;
  SearchPinsManager *v16;
  void *v17;
  void *v18;
  char v19;
  uint8_t buf[4];
  void *v22;

  searchPinsManager = self->_searchPinsManager;
  if (searchPinsManager)
    return searchPinsManager;
  v4 = sub_10043196C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Creating searchPinsManager", buf, 0xCu);

  }
  v13 = [SearchPinsManager alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapCameraController](self, "mapCameraController"));
  v15 = -[SearchPinsManager initWithMapViewCameraController:](v13, "initWithMapViewCameraController:", v14);
  v16 = self->_searchPinsManager;
  self->_searchPinsManager = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapSelectionManager](self, "mapSelectionManager"));
  -[SearchPinsManager setMapSelectionManager:](self->_searchPinsManager, "setMapSelectionManager:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController customPOIsController](self, "customPOIsController"));
  -[SearchPinsManager setCustomPOIsController:](self->_searchPinsManager, "setCustomPOIsController:", v18);

  v19 = objc_opt_respondsToSelector(self, "setSuggestedApplicationState:");
  searchPinsManager = self->_searchPinsManager;
  if ((v19 & 1) != 0)
  {
    -[SearchPinsManager setDelegate:](searchPinsManager, "setDelegate:", self);
    searchPinsManager = self->_searchPinsManager;
  }
  return searchPinsManager;
}

- (BOOL)wantsNavigationDisplayByDefault
{
  return 0;
}

- (BOOL)isDisplayingNavigation
{
  return 0;
}

- (BOOL)isRunningNavigationDisplay
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
  v3 = v2 != 0;

  return v3;
}

- (GEOMapServiceTraits)navigationAwareTraits
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController currentTraits](self, "currentTraits"));
  if (-[ChromeViewController isDisplayingNavigation](self, "isDisplayingNavigation"))
  {
    objc_msgSend(v3, "setNavigating:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    if (objc_msgSend(v4, "isInNavigatingState"))
      v5 = objc_msgSend(v4, "navigationTransportType");
    else
      v5 = objc_msgSend(v4, "desiredTransportType");
    objc_msgSend(v3, "setNavigationTransportType:", v5);

  }
  return (GEOMapServiceTraits *)v3;
}

- (BOOL)_shouldEnableNavigationDisplayForContextStack:(id)a3 requestingContext:(id *)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  ChromeViewController *v11;
  ChromeViewController *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  id v27;
  NSObject *v28;
  ChromeViewController *v29;
  ChromeViewController *v30;
  char **v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  id v39;
  void *v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  char *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  __CFString *v57;
  __int16 v58;
  __CFString *v59;
  __int16 v60;
  __CFString *v61;
  _BYTE v62[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  v8 = -[ChromeViewController wantsNavigationDisplayByDefault](self, "wantsNavigationDisplayByDefault");
  v9 = sub_10043196C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_8;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_8:

LABEL_10:
    v19 = CFSTR("NO");
    if (v8)
      v19 = CFSTR("YES");
    v20 = v19;
    *(_DWORD *)buf = 138543618;
    v57 = v18;
    v58 = 2114;
    v59 = v20;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] Wants navigation display by default: %{public}@", buf, 0x16u);

  }
  if ((objc_opt_respondsToSelector(v7, "showsMapView") & 1) != 0 && !objc_msgSend(v7, "showsMapView"))
  {
    LOBYTE(v8) = 0;
    goto LABEL_49;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (!v22)
    goto LABEL_48;
  v23 = v22;
  v51 = v8;
  v24 = *(_QWORD *)v53;
  while (2)
  {
    for (i = 0; i != v23; i = (char *)i + 1)
    {
      if (*(_QWORD *)v53 != v24)
        objc_enumerationMutation(v21);
      v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
      if ((objc_opt_respondsToSelector(v26, "wantsNavigationDisplay") & 1) != 0)
      {
        v8 = objc_msgSend(v26, "wantsNavigationDisplay");
        if (a4)
          *a4 = objc_retainAutorelease(v26);
        v27 = sub_10043196C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          goto LABEL_47;
        v29 = self;
        v30 = v29;
        v31 = &selRef__updateNavigationDisplayConfigurationForDisplayedStep_;
        if (!v29)
        {
          v37 = CFSTR("<nil>");
LABEL_36:

          v38 = v37;
          v39 = v26;
          v40 = v39;
          if (!v39)
          {
            v47 = CFSTR("<nil>");
            goto LABEL_44;
          }
          v41 = (objc_class *)objc_opt_class(v39);
          v42 = NSStringFromClass(v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          v44 = v31[486];
          if ((objc_opt_respondsToSelector(v40, v44) & 1) != 0)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "performSelector:", v44));
            v46 = v45;
            if (v45 && !objc_msgSend(v45, "isEqualToString:", v43))
            {
              v47 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v43, v40, v46));

              goto LABEL_42;
            }

          }
          v47 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v43, v40));
LABEL_42:

LABEL_44:
          v48 = CFSTR("NO");
          if (v8)
            v48 = CFSTR("YES");
          v49 = v48;
          *(_DWORD *)buf = 138543874;
          v57 = v38;
          v58 = 2112;
          v59 = v47;
          v60 = 2114;
          v61 = v49;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}@] context %@ responded %{public}@ to wantsNavigationDisplay", buf, 0x20u);

LABEL_47:
          goto LABEL_48;
        }
        v32 = (objc_class *)objc_opt_class(v29);
        v33 = NSStringFromClass(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        if ((objc_opt_respondsToSelector(v30, "accessibilityIdentifier") & 1) != 0)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v30, "performSelector:", "accessibilityIdentifier"));
          v36 = v35;
          if (v35 && !objc_msgSend(v35, "isEqualToString:", v34))
          {
            v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v34, v30, v36));

            goto LABEL_33;
          }

        }
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v34, v30));
LABEL_33:

        v31 = &selRef__updateNavigationDisplayConfigurationForDisplayedStep_;
        goto LABEL_36;
      }
    }
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v23)
      continue;
    break;
  }
  LOBYTE(v8) = v51;
LABEL_48:

LABEL_49:
  return v8;
}

- (void)_teardownNavigationDisplayWithAnimation:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AB96A8;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  objc_msgSend(v3, "addPreparation:", v4);

}

- (void)_setupNavigationDisplayForContext:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[ChromeViewController loadMapViewIfNeeded](self, "loadMapViewIfNeeded");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100AB9AF4;
  v10[3] = &unk_1011AD238;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, "addPreparation:", v10);

}

- (GEOMapServiceTraits)currentTraits
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultTraits"));

  v5 = objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = +[NSThread isMainThread](NSThread, "isMainThread");

    if (v7)
      -[ChromeViewController _fillNewTraitsWithMapViewRelatedData:](self, "_fillNewTraitsWithMapViewRelatedData:", v4);
  }
  return (GEOMapServiceTraits *)v4;
}

- (void)_fillNewTraitsWithMapViewRelatedData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v6 = objc_msgSend(v5, "mapType");
    v7 = 1;
    switch((unint64_t)v6)
    {
      case 0uLL:
        goto LABEL_8;
      case 1uLL:
      case 3uLL:
        v7 = 2;
        goto LABEL_8;
      case 2uLL:
      case 4uLL:
        v7 = 3;
        goto LABEL_8;
      default:
        if (v6 == (id)102)
          goto LABEL_8;
        if (v6 == (id)104)
        {
          v7 = 4;
LABEL_8:

          objc_msgSend(v17, "setMode:", v7);
        }
        else
        {

        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
        objc_msgSend(v8, "visibleMapRect");
        v13 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v9, v10, v11, v12);
        objc_msgSend(v17, "setMapRegion:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
        objc_msgSend(v14, "_zoomLevel");
        v16 = v15;

        if (v16 > 0.0)
          objc_msgSend(v17, "setMapZoomLevel:", v16);
        break;
    }
  }

}

- (id)mapViewEnteredForegroundDate
{
  NSDate *mapViewEnteredForegroundDate;
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;

  mapViewEnteredForegroundDate = self->_mapViewEnteredForegroundDate;
  if (!mapViewEnteredForegroundDate)
  {
    v4 = sub_100ABA8C0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      mapViewEnteredForegroundDate = self->_mapViewEnteredForegroundDate;
      return mapViewEnteredForegroundDate;
    }
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] mapViewEnteredForegroundDate is nil when requested", buf, 0xCu);

    goto LABEL_9;
  }
  return mapViewEnteredForegroundDate;
}

- (id)lastMapViewportChangedDate
{
  NSDate *lastViewportChangeDate;
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDate *v13;
  NSDate *v14;
  uint8_t buf[4];
  void *v17;

  lastViewportChangeDate = self->_lastViewportChangeDate;
  if (!lastViewportChangeDate)
  {
    v4 = sub_100ABA8C0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      v13 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v14 = self->_lastViewportChangeDate;
      self->_lastViewportChangeDate = v13;

      lastViewportChangeDate = self->_lastViewportChangeDate;
      return lastViewportChangeDate;
    }
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] lastViewportChangeDate is nil. Setting current date for now.", buf, 0xCu);

    goto LABEL_9;
  }
  return lastViewportChangeDate;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  ChromeViewController *v9;
  ChromeViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  NSDate *v41;
  ChromeViewController *v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  id v49;
  NSObject *v50;
  char *v51;
  ChromeViewController *v52;
  objc_class *v53;
  NSString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  NSDate *v78;
  NSDate *v79;
  id v80;
  NSObject *v81;
  ChromeViewController *v82;
  objc_class *v83;
  NSString *v84;
  void *v85;
  void *v86;
  void *v87;
  __CFString *v88;
  NSDate *lastViewportChangeDate;
  const char *v90;
  NSObject *v91;
  uint32_t v92;
  id v93;
  ChromeViewController *v94;
  objc_class *v95;
  NSString *v96;
  void *v97;
  void *v98;
  void *v99;
  __CFString *v100;
  __CFString *v101;
  uint8_t buf[4];
  __CFString *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  NSDate *v107;

  v4 = a4;
  v6 = a3;
  v7 = sub_100432D8C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    goto LABEL_21;
  v9 = self;
  v10 = v9;
  if (v9)
  {
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_8;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

    goto LABEL_10;
  }
  v16 = CFSTR("<nil>");
LABEL_10:

  v17 = v16;
  v18 = v6;
  v19 = v18;
  if (!v18)
  {
    v25 = CFSTR("<nil>");
    goto LABEL_18;
  }
  v20 = (objc_class *)objc_opt_class(v18);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if ((objc_opt_respondsToSelector(v19, "accessibilityIdentifier") & 1) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "performSelector:", "accessibilityIdentifier"));
    v24 = v23;
    if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
    {
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v19, v24));

      goto LABEL_16;
    }

  }
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, v19));
LABEL_16:

LABEL_18:
  v26 = CFSTR("NO");
  if (v4)
    v26 = CFSTR("YES");
  v27 = v26;
  *(_DWORD *)buf = 138543874;
  v103 = v17;
  v104 = 2112;
  v105 = v25;
  v106 = 2112;
  v107 = (NSDate *)v27;
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] mapView: (%@) regionDidChangeAnimated: (%@)", buf, 0x20u);

LABEL_21:
  if (!self->_lastViewportChangeDate)
  {
    v79 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v93 = sub_100ABA8C0();
    v81 = objc_claimAutoreleasedReturnValue(v93);
    if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
      goto LABEL_55;
    v94 = self;
    v95 = (objc_class *)objc_opt_class(v94);
    v96 = NSStringFromClass(v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue(v96);
    if ((objc_opt_respondsToSelector(v94, "accessibilityIdentifier") & 1) != 0)
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v94, "performSelector:", "accessibilityIdentifier"));
      v99 = v98;
      if (v98 && !objc_msgSend(v98, "isEqualToString:", v97))
      {
        v88 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v97, v94, v99));

        goto LABEL_53;
      }

    }
    v88 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v97, v94));
LABEL_53:

    *(_DWORD *)buf = 138543618;
    v103 = v88;
    v104 = 2112;
    v105 = v79;
    v90 = "[%{public}@] No value found for lastViewportChangeDate in mapView:regionDidChangeAnimated. This will only happ"
          "en once as all other changes would happen in mapViewDidStartUserInteraction. Setting lastViewportChangeDate to %@. ";
    v91 = v81;
    v92 = 22;
    goto LABEL_54;
  }
  objc_msgSend(v6, "visibleMapRect");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[ChromeViewController visibleMapRect](self, "visibleMapRect");
  if (v29 != v39 || v31 != v36 || v33 != v37 || v35 != v38)
  {
    v49 = sub_100ABA8C0();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    v51 = "HomeListSectionControllerSubclassing" + 32;
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      goto LABEL_40;
    v52 = self;
    v53 = (objc_class *)objc_opt_class(v52);
    v54 = NSStringFromClass(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    if ((objc_opt_respondsToSelector(v52, "accessibilityIdentifier") & 1) != 0)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v52, "performSelector:", "accessibilityIdentifier"));
      v57 = v56;
      if (v56 && !objc_msgSend(v56, "isEqualToString:", v55))
      {
        v58 = v6;
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v55, v52, v57));

        goto LABEL_39;
      }

    }
    v58 = v6;
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v55, v52));
LABEL_39:
    v100 = v59;

    v101 = v59;
    -[ChromeViewController visibleMapRect](v52, "visibleMapRect");
    v61 = v60;
    v63 = v62;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), v64, v65));
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), v61, v63));
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v66, v67));

    v69 = v68;
    objc_msgSend(v58, "visibleMapRect");
    v71 = v70;
    v73 = v72;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), v74, v75));
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), v71, v73));
    v78 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v76, v77));

    v51 = "sing";
    *(_DWORD *)buf = 138543874;
    v103 = v100;
    v104 = 2112;
    v105 = v68;
    v106 = 2112;
    v107 = v78;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "[%{public}@] Got a new region (%@ -> %@)", buf, 0x20u);

    v6 = v58;
LABEL_40:

    objc_msgSend(v6, "visibleMapRect");
    -[ChromeViewController setVisibleMapRect:](self, "setVisibleMapRect:");
    v79 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v80 = sub_100ABA8C0();
    v81 = objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
    {
      v82 = self;
      v83 = (objc_class *)objc_opt_class(v82);
      v84 = NSStringFromClass(v83);
      v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
      if ((objc_opt_respondsToSelector(v82, "accessibilityIdentifier") & 1) != 0)
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v82, "performSelector:", "accessibilityIdentifier"));
        v87 = v86;
        if (v86 && !objc_msgSend(v86, "isEqualToString:", v85))
        {
          v88 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v85, v82, v87));

          goto LABEL_46;
        }

      }
      v88 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v85, v82));
LABEL_46:

      lastViewportChangeDate = self->_lastViewportChangeDate;
      *(_DWORD *)buf = *((_QWORD *)v51 + 253);
      v103 = v88;
      v104 = 2112;
      v105 = lastViewportChangeDate;
      v106 = 2112;
      v107 = v79;
      v90 = "[%{public}@] Changing the view port last change date (%@ -> %@)";
      v91 = v81;
      v92 = 32;
LABEL_54:
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, v90, buf, v92);

    }
LABEL_55:

    v41 = self->_lastViewportChangeDate;
    self->_lastViewportChangeDate = v79;
    goto LABEL_56;
  }
  v40 = sub_100ABA8C0();
  v41 = (NSDate *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(&v41->super, OS_LOG_TYPE_DEBUG))
  {
    v42 = self;
    v43 = (objc_class *)objc_opt_class(v42);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    if ((objc_opt_respondsToSelector(v42, "accessibilityIdentifier") & 1) != 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v42, "performSelector:", "accessibilityIdentifier"));
      v47 = v46;
      if (v46 && !objc_msgSend(v46, "isEqualToString:", v45))
      {
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v45, v42, v47));

        goto LABEL_32;
      }

    }
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v45, v42));
LABEL_32:

    *(_DWORD *)buf = 138543362;
    v103 = v48;
    _os_log_impl((void *)&_mh_execute_header, &v41->super, OS_LOG_TYPE_DEBUG, "[%{public}@] Requested region is equal to existing region, ignoring.", buf, 0xCu);

  }
LABEL_56:

}

- (BOOL)_shouldSaveLastViewportChangeDateInDefaults
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController searchContextDefaultsKeysPrefix](self, "searchContextDefaultsKeysPrefix"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userLocation"));

  if (v9 == v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController userLocationView](self, "userLocationView"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewDelegateForSelector:](self, "mapViewDelegateForSelector:", a2));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView:viewForAnnotation:", v7, v8));

  }
  return v11;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  return 0;
}

- (BOOL)_mapViewCanChangeUserTrackingModeWhenRegionDidChange:(id)a3
{
  return 1;
}

- (BOOL)mapView:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapSelectionManager](self, "mapSelectionManager"));
  v7 = objc_msgSend(v6, "mapShouldSelectLabelMarker:", v5);

  return v7;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v6, "mapDidSelectLabelMarker:", v5);

}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapSelectionManager](self, "mapSelectionManager", a3, a4));
  objc_msgSend(v4, "mapDidSelectLabelMarker:", 0);

}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v6, "mapDidSelectAnnotationView:", v5);

}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapSelectionManager](self, "mapSelectionManager", a3, a4));
  objc_msgSend(v4, "mapDidSelectAnnotationView:", 0);

}

- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3
{
  return 1;
}

- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectLabelMarker:(id)a3
{
  return 0;
}

- (BOOL)chromeShouldAllowSelectingAnnotationView:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectAnnotationView:(id)a3
{
  return 0;
}

- (BOOL)chromeDidClearMapSelection
{
  return 0;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  void *var1;
  unsigned int var0;
  void *v6;
  id v7;
  NSObject *v8;
  ChromeViewController *v9;
  ChromeViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;
  ChromeViewController *v19;
  ChromeViewController *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  ChromeViewController *v28;
  ChromeViewController *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint8_t buf[4];
  __CFString *v37;

  var1 = a3.var1;
  var0 = a3.var0;
  if (a3.var0 == -[ChromeViewController thermalRateLimitsConfigKey](self, "thermalRateLimitsConfigKey")
    && var1 == v6)
  {
    v7 = sub_10043196C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self;
      v10 = v9;
      if (!v9)
      {
        v16 = CFSTR("<nil>");
        goto LABEL_32;
      }
      v11 = (objc_class *)objc_opt_class(v9);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
        v15 = v14;
        if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
        {
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

          goto LABEL_10;
        }

      }
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_10:

LABEL_32:
      *(_DWORD *)buf = 138543362;
      v37 = v16;
      v35 = "[%{public}@] Thermal rate limit dictionary config updated";
LABEL_38:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v35, buf, 0xCu);

    }
LABEL_39:

    -[ChromeViewController updateMapViewFrameRate](self, "updateMapViewFrameRate");
    return;
  }
  if (var0 == -[ChromeViewController batteryLevelRateLimitEnabledConfigKey](self, "batteryLevelRateLimitEnabledConfigKey")&& var1 == v17)
  {
    v18 = sub_10043196C();
    v8 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_39;
    v19 = self;
    v20 = v19;
    if (!v19)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_34;
    }
    v21 = (objc_class *)objc_opt_class(v19);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

        goto LABEL_20;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_20:

LABEL_34:
    *(_DWORD *)buf = 138543362;
    v37 = v16;
    v35 = "[%{public}@] Battery level rate limit enabled config updated";
    goto LABEL_38;
  }
  if (var0 == -[ChromeViewController lowPowerModeRateLimitEnabledConfigKey](self, "lowPowerModeRateLimitEnabledConfigKey")&& var1 == v26)
  {
    v27 = sub_10043196C();
    v8 = objc_claimAutoreleasedReturnValue(v27);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_39;
    v28 = self;
    v29 = v28;
    if (!v28)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_37;
    }
    v30 = (objc_class *)objc_opt_class(v28);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) != 0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
      v34 = v33;
      if (v33 && !objc_msgSend(v33, "isEqualToString:", v32))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v34));

        goto LABEL_30;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
LABEL_30:

LABEL_37:
    *(_DWORD *)buf = 138543362;
    v37 = v16;
    v35 = "[%{public}@] Low power mode rate limit enabled config updated";
    goto LABEL_38;
  }
}

- (void)batteryMonitorTokenWitnessedChangeInBatteryLevel:(id)a3
{
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  ChromeViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  __CFString *v17;

  v4 = sub_10043196C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Battery level changed", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100ABBB6C;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v15, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)didUpdateThermalPressureLevel:(int)a3
{
  id v4;
  NSObject *v5;
  ChromeViewController *v6;
  ChromeViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  __CFString *v17;

  v4 = sub_10043196C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Thermal pressure level changed", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100ABBD80;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v15, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- ($6E15C01CA1BE37A4936191A84F7075E2)thermalRateLimitsConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = GEOConfigKey_InvalidDictionary[0];
  v3 = (void *)GEOConfigKey_InvalidDictionary[1];
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (NSDictionary)thermalRateLimits
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t Dictionary;

  v3 = -[ChromeViewController thermalRateLimitsConfigKey](self, "thermalRateLimitsConfigKey");
  v4 = 0;
  if ((_DWORD)v3 && v2)
  {
    Dictionary = GEOConfigGetDictionary(v3, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(Dictionary);
  }
  return (NSDictionary *)v4;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)batteryLevelRateLimitEnabledConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = GEOConfigKey_InvalidBOOL[0];
  v3 = (void *)GEOConfigKey_InvalidBOOL[1];
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (BOOL)isBatteryLevelFrameRateLimitingEnabled
{
  id v2;
  uint64_t v3;

  v2 = -[ChromeViewController batteryLevelRateLimitEnabledConfigKey](self, "batteryLevelRateLimitEnabledConfigKey");
  if ((_DWORD)v2 && v3)
    return GEOConfigGetBOOL(v2, v3);
  else
    return 0;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)lowPowerModeRateLimitEnabledConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = GEOConfigKey_InvalidBOOL[0];
  v3 = (void *)GEOConfigKey_InvalidBOOL[1];
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (BOOL)isLowPowerModeFrameRateLimitingEnabled
{
  id v2;
  uint64_t v3;

  v2 = -[ChromeViewController lowPowerModeRateLimitEnabledConfigKey](self, "lowPowerModeRateLimitEnabledConfigKey");
  if ((_DWORD)v2 && v3)
    return GEOConfigGetBOOL(v2, v3);
  else
    return 0;
}

- (BOOL)isEligibleForMapViewFrameRateLimiting
{
  return 0;
}

- (void)updateMapViewFrameRate
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  ChromeViewController *v9;
  ChromeViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  ChromeViewController *v17;
  ChromeViewController *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  id v26;
  NSObject *v27;
  ChromeViewController *v28;
  ChromeViewController *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  id v41;
  NSObject *v42;
  ChromeViewController *v43;
  objc_class *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  id v51;
  NSObject *v52;
  ChromeViewController *v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  unsigned int v61;
  void *v62;
  unsigned int v63;
  uint64_t Integer;
  id v65;
  NSObject *v66;
  ChromeViewController *v67;
  objc_class *v68;
  NSString *v69;
  void *v70;
  void *v71;
  void *v72;
  __CFString *v73;
  id v74;
  NSObject *v75;
  ChromeViewController *v76;
  objc_class *v77;
  NSString *v78;
  void *v79;
  void *v80;
  void *v81;
  __CFString *v82;
  __CFString *v83;
  __CFString *v84;
  __CFString *v85;
  __CFString *v86;
  __CFString *v87;
  unsigned int v88;
  double Double;
  float v90;
  double v91;
  uint64_t v92;
  id v93;
  NSObject *v94;
  ChromeViewController *v95;
  objc_class *v96;
  NSString *v97;
  void *v98;
  void *v99;
  void *v100;
  __CFString *v101;
  id v102;
  NSObject *v103;
  ChromeViewController *v104;
  objc_class *v105;
  NSString *v106;
  void *v107;
  void *v108;
  void *v109;
  __CFString *v110;
  __CFString *v111;
  __CFString *v112;
  __CFString *v113;
  __CFString *v114;
  int64_t v115;
  void *v116;
  __CFString *v117;
  id v118;
  NSObject *v119;
  ChromeViewController *v120;
  ChromeViewController *v121;
  objc_class *v122;
  NSString *v123;
  void *v124;
  void *v125;
  void *v126;
  __CFString *v127;
  void *v128;
  void *v129;
  void *v130;
  uint8_t buf[4];
  __CFString *v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  unint64_t v136;
  __int16 v137;
  double v138;
  __int16 v139;
  double v140;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sceneIdentifierForLogging"));

  v5 = -[ChromeViewController isEligibleForMapViewFrameRateLimiting](self, "isEligibleForMapViewFrameRateLimiting");
  v6 = sub_10043196C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (!v8)
    {
LABEL_30:

      -[ChromeViewController _clearFrameRateLimits](self, "_clearFrameRateLimits");
      goto LABEL_99;
    }
    v17 = self;
    v18 = v17;
    if (!v17)
    {
      v24 = CFSTR("<nil>");
      goto LABEL_29;
    }
    v19 = (objc_class *)objc_opt_class(v17);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_17;
      }

    }
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_17:

LABEL_29:
    *(_DWORD *)buf = 138543618;
    v132 = v24;
    v133 = 2112;
    v134 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Not eligible for map view frame rate limiting", buf, 0x16u);

    goto LABEL_30;
  }
  if (!v8)
    goto LABEL_20;
  v9 = self;
  v10 = v9;
  if (!v9)
  {
    v16 = CFSTR("<nil>");
    goto LABEL_19;
  }
  v11 = (objc_class *)objc_opt_class(v9);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
    v15 = v14;
    if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

      goto LABEL_9;
    }

  }
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_9:

LABEL_19:
  *(_DWORD *)buf = 138543618;
  v132 = v16;
  v133 = 2112;
  v134 = v4;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Eligible for map view frame rate limiting", buf, 0x16u);

LABEL_20:
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[ChromeViewController thermalRateLimits](self, "thermalRateLimits"));
  v26 = sub_10043196C();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    goto LABEL_33;
  v28 = self;
  v29 = v28;
  if (!v28)
  {
    v35 = CFSTR("<nil>");
    goto LABEL_32;
  }
  v30 = (objc_class *)objc_opt_class(v28);
  v31 = NSStringFromClass(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
    v34 = v33;
    if (v33 && !objc_msgSend(v33, "isEqualToString:", v32))
    {
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v34));

      goto LABEL_27;
    }

  }
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
LABEL_27:

LABEL_32:
  *(_DWORD *)buf = 138543874;
  v132 = v35;
  v133 = 2112;
  v134 = v4;
  v135 = 2112;
  v136 = (unint64_t)v25;
  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Checking thermal rate limit config dictionary: %@", buf, 0x20u);

LABEL_33:
  v36 = -[MapsThermalPressureController currentThermalPressureLevel](self->_thermalPressureController, "currentThermalPressureLevel");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v36));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringValue"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKey:](v25, "objectForKey:", v38));

  if (!v39)
  {
    v51 = sub_10043196C();
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
LABEL_49:

      -[ChromeViewController _removeFrameRateLimitForReason:](self, "_removeFrameRateLimitForReason:", 0);
      goto LABEL_50;
    }
    v53 = self;
    v54 = (objc_class *)objc_opt_class(v53);
    v55 = NSStringFromClass(v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    if ((objc_opt_respondsToSelector(v53, "accessibilityIdentifier") & 1) != 0)
    {
      v57 = v25;
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v53, "performSelector:", "accessibilityIdentifier"));
      v59 = v58;
      if (v58 && !objc_msgSend(v58, "isEqualToString:", v56))
      {
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v56, v53, v59));

        v25 = v57;
        v39 = 0;
        goto LABEL_48;
      }

      v25 = v57;
      v39 = 0;
    }
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v56, v53));
LABEL_48:

    *(_DWORD *)buf = 138543874;
    v132 = v60;
    v133 = 2112;
    v134 = v4;
    v135 = 2048;
    v136 = v36;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Thermal pressure level (%ld) is not present in rate limit dictionary", buf, 0x20u);

    goto LABEL_49;
  }
  v40 = (__CFString *)objc_msgSend(v39, "integerValue");
  v41 = sub_10043196C();
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = self;
    v44 = (objc_class *)objc_opt_class(v43);
    v45 = NSStringFromClass(v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v129 = v39;
    if ((objc_opt_respondsToSelector(v43, "accessibilityIdentifier") & 1) != 0)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v43, "performSelector:", "accessibilityIdentifier"));
      v48 = v47;
      if (v47 && !objc_msgSend(v47, "isEqualToString:", v46))
      {
        v49 = v25;
        v50 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v46, v43, v48));

        goto LABEL_40;
      }

    }
    v49 = v25;
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v46, v43));
LABEL_40:

    *(_DWORD *)buf = 138544130;
    v132 = v50;
    v133 = 2112;
    v134 = v4;
    v135 = 2048;
    v136 = (unint64_t)v40;
    v137 = 2048;
    *(_QWORD *)&v138 = v36;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Found display rate (%ld) for thermal pressure level (%ld) in rate limit dictionary", buf, 0x2Au);

    v25 = v49;
    v39 = v129;
  }

  -[ChromeViewController _limitFrameRate:forReason:](self, "_limitFrameRate:forReason:", v40, 0);
LABEL_50:
  v61 = -[ChromeViewController isLowPowerModeFrameRateLimitingEnabled](self, "isLowPowerModeFrameRateLimitingEnabled");
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v63 = objc_msgSend(v62, "isLowPowerModeEnabled");

  if (!v63 || (v61 & 1) == 0)
  {
    v74 = sub_10043196C();
    v75 = objc_claimAutoreleasedReturnValue(v74);
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
    {
LABEL_73:

      -[ChromeViewController _removeFrameRateLimitForReason:](self, "_removeFrameRateLimitForReason:", 2);
      goto LABEL_74;
    }
    v76 = self;
    v77 = (objc_class *)objc_opt_class(v76);
    v78 = NSStringFromClass(v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
    v130 = v39;
    if ((objc_opt_respondsToSelector(v76, "accessibilityIdentifier") & 1) != 0)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v76, "performSelector:", "accessibilityIdentifier"));
      v81 = v80;
      if (v80 && !objc_msgSend(v80, "isEqualToString:", v79))
      {
        v82 = v25;
        v83 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v79, v76, v81));

        goto LABEL_66;
      }

    }
    v82 = v25;
    v83 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v79, v76));
LABEL_66:

    if (v63)
      v84 = CFSTR("YES");
    else
      v84 = CFSTR("NO");
    v85 = v84;
    if (v61)
      v86 = CFSTR("YES");
    else
      v86 = CFSTR("NO");
    v87 = v86;
    *(_DWORD *)buf = 138544130;
    v132 = v83;
    v133 = 2112;
    v134 = v4;
    v135 = 2114;
    v136 = (unint64_t)v85;
    v137 = 2114;
    v138 = *(double *)&v87;
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Low power mode is either off (%{public}@) or the network default is disabled (%{public}@)", buf, 0x2Au);

    v25 = v82;
    v39 = v130;
    goto LABEL_73;
  }
  Integer = GEOConfigGetInteger(MapsConfig_LowPowerNavigationRateLimit, off_1014B4848);
  v65 = sub_10043196C();
  v66 = objc_claimAutoreleasedReturnValue(v65);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    v67 = self;
    v68 = (objc_class *)objc_opt_class(v67);
    v69 = NSStringFromClass(v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
    if ((objc_opt_respondsToSelector(v67, "accessibilityIdentifier") & 1) != 0)
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v67, "performSelector:", "accessibilityIdentifier"));
      v72 = v71;
      if (v71 && !objc_msgSend(v71, "isEqualToString:", v70))
      {
        v73 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v70, v67, v72));

        goto LABEL_58;
      }

    }
    v73 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v70, v67));
LABEL_58:

    *(_DWORD *)buf = 138543874;
    v132 = v73;
    v133 = 2112;
    v134 = v4;
    v135 = 2048;
    v136 = Integer;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Limiting map view display rate for low power mode: %ld", buf, 0x20u);

  }
  -[ChromeViewController _limitFrameRate:forReason:](self, "_limitFrameRate:forReason:", Integer, 2);
LABEL_74:
  v88 = -[ChromeViewController isBatteryLevelFrameRateLimitingEnabled](self, "isBatteryLevelFrameRateLimitingEnabled");
  Double = GEOConfigGetDouble(MapsConfig_BatteryLevelNavigationRateLimitThreshold, off_1014B4808);
  -[BatteryMonitorToken currentBatteryLevel](self->_batteryMonitorToken, "currentBatteryLevel");
  v91 = v90;
  if (!v88 || Double < v91)
  {
    v102 = sub_10043196C();
    v103 = objc_claimAutoreleasedReturnValue(v102);
    if (!os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
    {
LABEL_97:

      -[ChromeViewController _removeFrameRateLimitForReason:](self, "_removeFrameRateLimitForReason:", 1);
      goto LABEL_98;
    }
    v104 = self;
    v105 = (objc_class *)objc_opt_class(v104);
    v106 = NSStringFromClass(v105);
    v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
    if ((objc_opt_respondsToSelector(v104, "accessibilityIdentifier") & 1) != 0)
    {
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v104, "performSelector:", "accessibilityIdentifier"));
      v109 = v108;
      if (v108 && !objc_msgSend(v108, "isEqualToString:", v107))
      {
        v110 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v107, v104, v109));

        goto LABEL_90;
      }

    }
    v110 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v107, v104));
LABEL_90:

    if (Double < v91)
      v111 = CFSTR("YES");
    else
      v111 = CFSTR("NO");
    v112 = v111;
    if (v88)
      v113 = CFSTR("YES");
    else
      v113 = CFSTR("NO");
    v114 = v113;
    *(_DWORD *)buf = 138544130;
    v132 = v110;
    v133 = 2112;
    v134 = v4;
    v135 = 2114;
    v136 = (unint64_t)v112;
    v137 = 2114;
    v138 = *(double *)&v114;
    _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Battery level is either too high (%{public}@) or the network default is disabled (%{public}@)", buf, 0x2Au);

    goto LABEL_97;
  }
  v92 = GEOConfigGetInteger(MapsConfig_BatteryLevelNavigationRateLimit, off_1014B4818);
  v93 = sub_10043196C();
  v94 = objc_claimAutoreleasedReturnValue(v93);
  if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
  {
    v95 = self;
    v96 = (objc_class *)objc_opt_class(v95);
    v97 = NSStringFromClass(v96);
    v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
    if ((objc_opt_respondsToSelector(v95, "accessibilityIdentifier") & 1) != 0)
    {
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v95, "performSelector:", "accessibilityIdentifier"));
      v100 = v99;
      if (v99 && !objc_msgSend(v99, "isEqualToString:", v98))
      {
        v101 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v98, v95, v100));

        goto LABEL_82;
      }

    }
    v101 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v98, v95));
LABEL_82:

    *(_DWORD *)buf = 138544386;
    v132 = v101;
    v133 = 2112;
    v134 = v4;
    v135 = 2048;
    v136 = v92;
    v137 = 2048;
    v138 = v91;
    v139 = 2048;
    v140 = Double;
    _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Limiting map view display rate (%ld) for battery level (%f) and threshold (%f)", buf, 0x34u);

  }
  -[ChromeViewController _limitFrameRate:forReason:](self, "_limitFrameRate:forReason:", v92, 1);
LABEL_98:

LABEL_99:
  v115 = -[ChromeViewController _currentFrameRateLimit](self, "_currentFrameRateLimit");
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v117 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "_mapLayer"));

  v118 = sub_10043196C();
  v119 = objc_claimAutoreleasedReturnValue(v118);
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    v120 = self;
    v121 = v120;
    if (!v120)
    {
      v127 = CFSTR("<nil>");
      goto LABEL_108;
    }
    v122 = (objc_class *)objc_opt_class(v120);
    v123 = NSStringFromClass(v122);
    v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
    if ((objc_opt_respondsToSelector(v121, "accessibilityIdentifier") & 1) != 0)
    {
      v125 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v121, "performSelector:", "accessibilityIdentifier"));
      v126 = v125;
      if (v125 && !objc_msgSend(v125, "isEqualToString:", v124))
      {
        v127 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v124, v121, v126));

        goto LABEL_106;
      }

    }
    v127 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v124, v121));
LABEL_106:

LABEL_108:
    *(_DWORD *)buf = 138544130;
    v132 = v127;
    v133 = 2112;
    v134 = v4;
    v135 = 2048;
    v136 = v115;
    v137 = 2048;
    v138 = *(double *)&v117;
    _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_INFO, "[%{public}@] [%@] Updating nav display rate: %ld on map view: %p", buf, 0x2Au);

  }
  -[__CFString setNavigationDisplayRate:](v117, "setNavigationDisplayRate:", v115);
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
  objc_msgSend(v128, "updateDisplayRate");

}

- (BOOL)isThrottlingMapViewFrameRate
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController currentMapViewRateLimits](self, "currentMapViewRateLimits"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_clearFrameRateLimits
{
  id v3;
  NSObject *v4;
  ChromeViewController *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  void *v19;

  v3 = sub_10043196C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](v6, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sceneIdentifierForLogging"));
    *(_DWORD *)buf = 138543618;
    v17 = v12;
    v18 = 2112;
    v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] [%@] Clearing frame rate limits", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController currentMapViewRateLimits](self, "currentMapViewRateLimits"));
  objc_msgSend(v15, "removeAllObjects");

}

- (void)_removeFrameRateLimitForReason:(int64_t)a3
{
  id v5;
  NSObject *v6;
  ChromeViewController *v7;
  ChromeViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;

  v5 = sub_10043196C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    goto LABEL_15;
  v7 = self;
  v8 = v7;
  if (!v7)
  {
    v14 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v9 = (objc_class *)objc_opt_class(v7);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_8;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](v8, "view"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sceneIdentifierForLogging"));
  v17 = (void *)v16;
  v18 = CFSTR("ThermalPressure");
  if (a3 == 1)
    v18 = CFSTR("BatteryLevel");
  *(_DWORD *)buf = 138543874;
  v22 = v14;
  if (a3 == 2)
    v18 = CFSTR("LowPowerMode");
  v23 = 2112;
  v24 = v16;
  v25 = 2112;
  v26 = v18;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] [%@] Removing map view frame rate limit for reason: %@", buf, 0x20u);

LABEL_15:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController currentMapViewRateLimits](self, "currentMapViewRateLimits"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v19, "removeObjectForKey:", v20);

}

- (void)_limitFrameRate:(int64_t)a3 forReason:(int64_t)a4
{
  id v7;
  NSObject *v8;
  ChromeViewController *v9;
  ChromeViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  const __CFString *v31;

  v7 = sub_10043196C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    goto LABEL_15;
  v9 = self;
  v10 = v9;
  if (!v9)
  {
    v16 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v11 = (objc_class *)objc_opt_class(v9);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
    v15 = v14;
    if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

      goto LABEL_8;
    }

  }
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](v10, "view"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sceneIdentifierForLogging"));
  v19 = (void *)v18;
  v20 = CFSTR("ThermalPressure");
  if (a4 == 1)
    v20 = CFSTR("BatteryLevel");
  *(_DWORD *)buf = 138544130;
  v25 = v16;
  v28 = 2048;
  v26 = 2112;
  v27 = v18;
  v29 = a3;
  if (a4 == 2)
    v20 = CFSTR("LowPowerMode");
  v30 = 2112;
  v31 = v20;
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] [%@] Updating map view frame rate to: %ld for reason: %@", buf, 0x2Au);

LABEL_15:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController currentMapViewRateLimits](self, "currentMapViewRateLimits"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  objc_msgSend(v21, "setObject:forKey:", v22, v23);

}

- (int64_t)_currentFrameRateLimit
{
  id v3;
  NSObject *v4;
  ChromeViewController *v5;
  ChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  id v23;
  id v24;
  NSObject *v25;
  ChromeViewController *v26;
  ChromeViewController *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  __CFString *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int64_t v47;

  if (-[ChromeViewController isThrottlingMapViewFrameRate](self, "isThrottlingMapViewFrameRate"))
  {
    v3 = sub_10043196C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_9;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_9:

LABEL_12:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](v6, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sceneIdentifierForLogging"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController currentMapViewRateLimits](v6, "currentMapViewRateLimits"));
    *(_DWORD *)buf = 138543874;
    v43 = v12;
    v44 = 2112;
    v45 = v15;
    v46 = 2112;
    v47 = (int64_t)v16;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] [%@] Will check map view rate limit dictionary to determine the current frame rate limit: %@", buf, 0x20u);

LABEL_13:
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController currentMapViewRateLimits](self, "currentMapViewRateLimits"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allValues"));

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v38;
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(v18);
          v23 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "integerValue");
          if ((uint64_t)v23 < v13)
            v13 = (int64_t)v23;
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v20);
    }
    else
    {
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    }

    v24 = sub_10043196C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      goto LABEL_34;
    v26 = self;
    v27 = v26;
    if (!v26)
    {
      v33 = CFSTR("<nil>");
      goto LABEL_33;
    }
    v28 = (objc_class *)objc_opt_class(v26);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if ((objc_opt_respondsToSelector(v27, "accessibilityIdentifier") & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v27, "performSelector:", "accessibilityIdentifier"));
      v32 = v31;
      if (v31 && !objc_msgSend(v31, "isEqualToString:", v30))
      {
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v30, v27, v32));

        goto LABEL_31;
      }

    }
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v30, v27));
LABEL_31:

LABEL_33:
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](v27, "view"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sceneIdentifierForLogging"));
    *(_DWORD *)buf = 138543874;
    v43 = v33;
    v44 = 2112;
    v45 = v35;
    v46 = 2048;
    v47 = v13;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "[%{public}@] [%@] Got new map view rate limit: %ld", buf, 0x20u);

LABEL_34:
    return v13;
  }
  return 0;
}

- (void)powerStateDidChangeNotification:(id)a3
{
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100ABD7FC;
  block[3] = &unk_1011AEAA0;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (unint64_t)desiredRadarScreenshotTypes
{
  return 7;
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  ChromeViewController *v24;
  ChromeViewController *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  id v32;
  ChromeViewController *v33;
  ChromeViewController *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  ChromeViewController *v41;
  ChromeViewController *v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  ChromeViewController *v50;
  ChromeViewController *v51;
  objc_class *v52;
  NSString *v53;
  void *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  const char *v58;
  id v59;
  NSObject *v60;
  const char *v61;
  const char *v62;
  id v63;
  NSObject *v64;
  char *v65;
  id v66;
  NSObject *v67;
  id v68;
  NSObject *v69;
  char *v70;
  _QWORD block[5];
  id v72;
  void (**v73)(_QWORD);
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  const char *v85;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!v7)
  {
    v66 = sub_1004318FC();
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v75 = "-[ChromeViewController generateAttachmentsForRadarDraft:withCompletion:]";
      v76 = 2080;
      v77 = "ChromeViewController.m";
      v78 = 1024;
      v79 = 3094;
      v80 = 2080;
      v81 = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v68 = sub_1004318FC();
      v69 = objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        v70 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v75 = v70;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v59 = sub_1004318FC();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v61 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v62 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        v75 = "-[ChromeViewController generateAttachmentsForRadarDraft:withCompletion:]";
        v76 = 2080;
        v77 = "ChromeViewController.m";
        v78 = 1024;
        v79 = 3095;
        v80 = 2080;
        v81 = "dispatch_get_main_queue()";
        v82 = 2080;
        v83 = v61;
        v84 = 2080;
        v85 = v62;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v63 = sub_1004318FC();
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v65 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v75 = v65;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController viewIfLoaded](self, "viewIfLoaded"));

  if (!v11)
  {
    v32 = sub_10043196C();
    v23 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      goto LABEL_55;
    v33 = self;
    v34 = v33;
    if (!v33)
    {
      v31 = CFSTR("<nil>");
      goto LABEL_46;
    }
    v35 = (objc_class *)objc_opt_class(v33);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
      v39 = v38;
      if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
      {
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

        goto LABEL_27;
      }

    }
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_27:

LABEL_46:
    *(_DWORD *)buf = 138543362;
    v75 = (const char *)v31;
    v58 = "[%{public}@] View is not loaded yet; not generating radar attachments";
LABEL_54:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, v58, buf, 0xCu);

    goto LABEL_55;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "windowScene"));

  if (!v14)
  {
    v40 = sub_10043196C();
    v23 = objc_claimAutoreleasedReturnValue(v40);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      goto LABEL_55;
    v41 = self;
    v42 = v41;
    if (!v41)
    {
      v31 = CFSTR("<nil>");
      goto LABEL_51;
    }
    v43 = (objc_class *)objc_opt_class(v41);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    if ((objc_opt_respondsToSelector(v42, "accessibilityIdentifier") & 1) != 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v42, "performSelector:", "accessibilityIdentifier"));
      v47 = v46;
      if (v46 && !objc_msgSend(v46, "isEqualToString:", v45))
      {
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v45, v42, v47));

        goto LABEL_35;
      }

    }
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v45, v42));
LABEL_35:

LABEL_51:
    *(_DWORD *)buf = 138543362;
    v75 = (const char *)v31;
    v58 = "[%{public}@] No window scene; not generating radar attachments";
    goto LABEL_54;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windowScene"));
  if (objc_msgSend(v17, "activationState"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "windowScene"));
    v21 = objc_msgSend(v20, "activationState");

    if (v21 != (id)1)
    {
      v22 = sub_10043196C();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = self;
        v25 = v24;
        if (!v24)
        {
          v31 = CFSTR("<nil>");
          goto LABEL_53;
        }
        v26 = (objc_class *)objc_opt_class(v24);
        v27 = NSStringFromClass(v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
          v30 = v29;
          if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
          {
            v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

            goto LABEL_19;
          }

        }
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_19:

LABEL_53:
        *(_DWORD *)buf = 138543362;
        v75 = (const char *)v31;
        v58 = "[%{public}@] Activation state is not foreground; not generating radar attachments";
        goto LABEL_54;
      }
LABEL_55:

      v7[2](v7);
      goto LABEL_56;
    }
  }
  else
  {

  }
  v48 = sub_10043196C();
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    v50 = self;
    v51 = v50;
    if (!v50)
    {
      v57 = CFSTR("<nil>");
      goto LABEL_48;
    }
    v52 = (objc_class *)objc_opt_class(v50);
    v53 = NSStringFromClass(v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    if ((objc_opt_respondsToSelector(v51, "accessibilityIdentifier") & 1) != 0)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController performSelector:](v51, "performSelector:", "accessibilityIdentifier"));
      v56 = v55;
      if (v55 && !objc_msgSend(v55, "isEqualToString:", v54))
      {
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v54, v51, v56));

        goto LABEL_44;
      }

    }
    v57 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v54, v51));
LABEL_44:

LABEL_48:
    *(_DWORD *)buf = 138543362;
    v75 = (const char *)v57;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "[%{public}@] Start generating radar attachments", buf, 0xCu);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100ABE244;
  block[3] = &unk_1011AECC0;
  block[4] = self;
  v72 = v6;
  v73 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_56:
}

- (ChromeOverlayController)overlayController
{
  return self->_overlayController;
}

- (NSArray)contexts
{
  return self->_contexts;
}

- (ChromeContextTransition)currentContextTransition
{
  return self->_currentContextTransition;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (UIEdgeInsets)labelEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_labelEdgeInsets.top;
  left = self->_labelEdgeInsets.left;
  bottom = self->_labelEdgeInsets.bottom;
  right = self->_labelEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)labelEdgeWidths
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_labelEdgeWidths.top;
  left = self->_labelEdgeWidths.left;
  bottom = self->_labelEdgeWidths.bottom;
  right = self->_labelEdgeWidths.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UILayoutGuide)mapInsetsLayoutGuide
{
  return self->_mapInsetsLayoutGuide;
}

- (UIView)viewport
{
  return self->_viewport;
}

- (UILayoutGuide)viewportLayoutGuide
{
  return self->_viewportLayoutGuide;
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (BOOL)isInactive
{
  return self->_inactive;
}

- (ChromeNavigationDisplay)navigationDisplay
{
  return self->_navigationDisplay;
}

- (void)setNavigationDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_navigationDisplay, a3);
}

- (NSString)searchContextDefaultsKeysPrefix
{
  return self->_searchContextDefaultsKeysPrefix;
}

- (void)setSearchContextDefaultsKeysPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_searchContextDefaultsKeysPrefix, a3);
}

- (NSMutableDictionary)currentMapViewRateLimits
{
  return self->_currentMapViewRateLimits;
}

- (void)setCurrentMapViewRateLimits:(id)a3
{
  objc_storeStrong((id *)&self->_currentMapViewRateLimits, a3);
}

- (BatteryMonitorToken)batteryMonitorToken
{
  return self->_batteryMonitorToken;
}

- (void)setBatteryMonitorToken:(id)a3
{
  objc_storeStrong((id *)&self->_batteryMonitorToken, a3);
}

- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect
{
  double x;
  double y;
  double width;
  double height;
  $C79183323B9A0D5602617FF3BE5395AC result;

  x = self->_visibleMapRect.origin.x;
  y = self->_visibleMapRect.origin.y;
  width = self->_visibleMapRect.size.width;
  height = self->_visibleMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setVisibleMapRect:(id)a3
{
  self->_visibleMapRect = ($99E9129AA7BA404914A9E870D54E0AD8)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryMonitorToken, 0);
  objc_storeStrong((id *)&self->_currentMapViewRateLimits, 0);
  objc_storeStrong((id *)&self->_searchContextDefaultsKeysPrefix, 0);
  objc_storeStrong((id *)&self->_navigationDisplay, 0);
  objc_storeStrong((id *)&self->_viewportLayoutGuide, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_mapInsetsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_currentContextTransition, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_routeAnnotationsController, 0);
  objc_storeStrong((id *)&self->_searchPinsManager, 0);
  objc_storeStrong((id *)&self->_personalizedItemManager, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_mapSelectionManager, 0);
  objc_storeStrong((id *)&self->_mapCameraController, 0);
  objc_storeStrong((id *)&self->_customPOIsController, 0);
  objc_storeStrong((id *)&self->_hikingCoordinateChecks, 0);
  objc_storeStrong((id *)&self->_hikingMapTokens, 0);
  objc_storeStrong(&self->_contextNotShowingMapDeactivatingToken, 0);
  objc_storeStrong(&self->_forceDeactivationToken, 0);
  objc_storeStrong(&self->_debugForceDeactivationToken, 0);
  objc_storeStrong((id *)&self->_deactivationTokens, 0);
  objc_storeStrong(&self->_sceneForegroundingNotificationToken, 0);
  objc_storeStrong((id *)&self->_mapViewEnteredForegroundDate, 0);
  objc_storeStrong((id *)&self->_lastViewportChangeDate, 0);
  objc_storeStrong((id *)&self->_watermarkView, 0);
  objc_storeStrong((id *)&self->_debugLayoutGuidesView, 0);
  objc_storeStrong((id *)&self->_mapSelectionHandler, 0);
  objc_storeStrong((id *)&self->_mapInsetPropagationSuspensionTokens, 0);
  objc_storeStrong((id *)&self->_mapReplacementView, 0);
  objc_storeStrong((id *)&self->_mapInsetsConstraintsByContext, 0);
  objc_storeStrong((id *)&self->_safeAreaMapEdgeInsetsConstraints, 0);
  objc_storeStrong((id *)&self->_currentContextMapInsetsConstraints, 0);
  objc_storeStrong((id *)&self->_fullscreenViewController, 0);
  objc_storeStrong((id *)&self->_componentsBeingUpdated, 0);
  objc_storeStrong((id *)&self->_componentsNeedingUpdate, 0);
  objc_storeStrong((id *)&self->_scheduledComponentUpdateTimer, 0);
  objc_storeStrong((id *)&self->_suppressionAnimation, 0);
  objc_storeStrong((id *)&self->_stackObservers, 0);
  objc_storeStrong((id *)&self->_deferredActionsByContext, 0);
  objc_storeStrong((id *)&self->_contextCoordinatedScheduler, 0);
  objc_storeStrong((id *)&self->_contextsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_thermalPressureController, 0);
  objc_storeStrong((id *)&self->_navigationDisplayDelegateProxy, 0);
  objc_storeStrong((id *)&self->_mapViewDelegateProxy, 0);
  objc_storeStrong((id *)&self->_userLocationView, 0);
}

@end
