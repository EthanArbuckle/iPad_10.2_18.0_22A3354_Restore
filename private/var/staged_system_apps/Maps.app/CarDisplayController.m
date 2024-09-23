@implementation CarDisplayController

- (void)dealloc
{
  const char *label;
  const char *v4;
  BOOL v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v7 = sub_1004318FC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v14 = "-[CarDisplayController dealloc]";
        v15 = 2080;
        v16 = "CarDisplayController.m";
        v17 = 1024;
        v18 = 269;
        v19 = 2080;
        v20 = "dispatch_get_main_queue()";
        v21 = 2080;
        v22 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v23 = 2080;
        v24 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v9 = sub_1004318FC();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v14 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  -[CarDisplayController _tearDownCarPlayIfNeeded](self, "_tearDownCarPlayIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:", self);

  v12.receiver = self;
  v12.super_class = (Class)CarDisplayController;
  -[CarDisplayController dealloc](&v12, "dealloc");
}

- (CarDisplayController)init
{
  CarDisplayController *v2;
  CarDisplayController *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *signalPackQueue;
  CARSessionStatus *v12;
  CARSessionStatus *carSessionStatus;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CarDisplayController;
  v2 = -[CarDisplayController init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->_hasRunNewScreenRefreshTasks = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_carDisplayDidFinishLaunching:", CFSTR("CarDisplayDidFinishLaunchingNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_carDisplayDidUpdateEnablingState:", CFSTR("CarDisplayDidUpdateEnablingStateNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_externalDeviceUpdated", CFSTR("MapsExternalDeviceUpdated"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_geoServiceDidUpdateCountryConfiguration:", GEOCountryConfigurationProvidersDidChangeNotification, 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_externalNavigationOwnershipUpdated:", CFSTR("MapsExternalNavigationOwnershipUpdatedNotification"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "offlineMapsStateChanged", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

    v6 = off_1014B0350;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarSessionController sharedInstance](CarSessionController, "sharedInstance"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_carSessionControllerObserversDidChange:", v6, v7);

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("MSgSignalPackDonaterQueue", v9);
    signalPackQueue = v3->_signalPackQueue;
    v3->_signalPackQueue = (OS_dispatch_queue *)v10;

    v12 = objc_opt_new(CARSessionStatus);
    carSessionStatus = v3->_carSessionStatus;
    v3->_carSessionStatus = v12;

    -[CARSessionStatus addSessionObserver:](v3->_carSessionStatus, "addSessionObserver:", v3);
    v3->_lastMapTypeFromiOSChrome = 0;

  }
  return v3;
}

- (void)_geoServiceDidUpdateCountryConfiguration:(id)a3
{
  objc_msgSend((id)objc_opt_class(self), "_updateCarIntegrationState");
}

- (void)_externalNavigationOwnershipUpdated:(id)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  BOOL v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  __CFString *v16;
  __int16 v17;
  __CFString *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService", a3));
  v4 = objc_msgSend(v3, "isInNavigatingState");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v6 = objc_msgSend(v5, "externalAccessoryIsNavigating");

  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
    v10 = v4 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (v9)
    {
      if (v6)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = v11;
      if (v4)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v14 = v13;
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Maps external navigation ownership changed but either the external device is not navigating (%{public}@) or we aren't navigating (%{public}@); ignoring",
        (uint8_t *)&v15,
        0x16u);

    }
  }
  else
  {
    if (v9)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will stop iOS navigation because the built-in car system has started its own navigation", (uint8_t *)&v15, 2u);
    }

    v8 = objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    -[NSObject stopNavigationWithReason:](v8, "stopNavigationWithReason:", 2);
  }

}

- (void)_carSessionControllerObserversDidChange:(id)a3
{
  -[CarDisplayController setWasConnectedToAnyCarScene:](self, "setWasConnectedToAnyCarScene:", -[CarDisplayController isCurrentlyConnectedToAnyCarScene](self, "isCurrentlyConnectedToAnyCarScene", a3));
}

- (void)offlineMapsStateChanged
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UsingOfflineMapsStateChangedNotification fired, will reloadStatusBannerAnimated", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "reloadStatusBannerAnimated:", 1);

}

+ (CarDisplayController)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C0E2FC;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D44A8 != -1)
    dispatch_once(&qword_1014D44A8, block);
  return (CarDisplayController *)(id)qword_1014D44A0;
}

+ (BOOL)isCarPlayAvailable
{
  if (qword_1014D44B0 != -1)
    dispatch_once(&qword_1014D44B0, &stru_1011E93C0);
  if (byte_1014D4498)
    return _objc_msgSend(a1, "_isCarIntegrationSupported");
  else
    return 0;
}

+ (BOOL)_isCarIntegrationSupported
{
  uint64_t v2;

  v2 = qword_1014BBB58;
  if (qword_1014BBB58 == -1)
  {
    objc_msgSend(a1, "_updateCarIntegrationState");
    v2 = qword_1014BBB58;
  }
  return v2 == 1;
}

+ (void)_updateCarIntegrationState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  qword_1014BBB58 = objc_msgSend(v2, "currentCountrySupportsCarIntegration");

}

+ (int64_t)enablingState
{
  void *v2;
  void *v3;
  int64_t v4;
  id v5;
  NSObject *v6;
  int v8;
  int64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("StarkDisplayEnablingState")));

  if (v3)
  {
    v4 = (int64_t)objc_msgSend(v3, "integerValue");
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134217984;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Overriding enablingState from defaults (state:%ld)", (uint8_t *)&v8, 0xCu);
    }

  }
  else if (+[CarDisplayController isCarPlayAvailable](CarDisplayController, "isCarPlayAvailable"))
  {
    v4 = 0;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)updateForCurrentEnablingState
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = objc_msgSend((id)objc_opt_class(self), "enablingState");
  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134217984;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Updating for current enabling state (state:%ld)", (uint8_t *)&v7, 0xCu);
  }

  if ((unint64_t)v3 >= 2)
  {
    if (v3 == (id)2)
    {
      -[CarDisplayController _setOverrideShouldSuppressChrome:refreshScreenConnection:](self, "_setOverrideShouldSuppressChrome:refreshScreenConnection:", 0, 0);
      -[CarDisplayController _tearDownCarPlayIfNeeded](self, "_tearDownCarPlayIfNeeded");
      goto LABEL_8;
    }
    if (v3 != (id)3)
      return;
  }
  -[CarDisplayController _setOverrideShouldSuppressChrome:refreshScreenConnection:](self, "_setOverrideShouldSuppressChrome:refreshScreenConnection:", v3 == (id)1, -[CarDisplayController state](self, "state") != 0);
  -[CarDisplayController _setupCarPlayIfNeeded](self, "_setupCarPlayIfNeeded");
LABEL_8:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController delegate](self, "delegate"));
  objc_msgSend(v6, "carDisplayControllerDidUpdateNavigationVisibility:", self);

}

- (void)_sendMapsSuggestionsSignals
{
  double v2;
  MapsSuggestionsDonater *v4;
  MapsSuggestionsDonater *donater;
  MapsSuggestionsMutableSignalPack *v6;
  MapsSuggestionsMutableSignalPack *signalPack;
  uint64_t lastMapTypeFromiOSChrome;
  MapsSuggestionsDonater *v9;
  id v10;
  uint64_t Log;
  NSObject *v12;
  _BOOL4 shouldOverrideMapTypeToStandard;
  void *v14;
  uint8_t buf[4];
  _BOOL4 v16;
  __int16 v17;
  void *v18;

  if (!self->_donater)
  {
    v4 = (MapsSuggestionsDonater *)objc_alloc_init((Class)MapsSuggestionsDonater);
    donater = self->_donater;
    self->_donater = v4;

  }
  if (!self->_signalPack)
  {
    v6 = (MapsSuggestionsMutableSignalPack *)objc_alloc_init((Class)MapsSuggestionsMutableSignalPack);
    signalPack = self->_signalPack;
    self->_signalPack = v6;

  }
  if (self->_shouldOverrideMapTypeToStandard)
    lastMapTypeFromiOSChrome = 1;
  else
    lastMapTypeFromiOSChrome = self->_lastMapTypeFromiOSChrome;
  *(float *)&v2 = (float)(int)lastMapTypeFromiOSChrome;
  -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:](self->_signalPack, "writeSignalValue:forType:", 21, v2);
  v9 = self->_donater;
  v10 = -[MapsSuggestionsMutableSignalPack copy](self->_signalPack, "copy");
  -[MapsSuggestionsDonater donateSignalPack:](v9, "donateSignalPack:", v10);

  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "CarDisplayController");
  v12 = (id)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    shouldOverrideMapTypeToStandard = self->_shouldOverrideMapTypeToStandard;
    if (lastMapTypeFromiOSChrome >= 5)
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), lastMapTypeFromiOSChrome));
    else
      v14 = *(&off_1011E9550 + (int)lastMapTypeFromiOSChrome);
    *(_DWORD *)buf = 67109378;
    v16 = shouldOverrideMapTypeToStandard;
    v17 = 2112;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "_shouldOverrideMapTypeToStandard: %d, sending: %@", buf, 0x12u);

  }
}

- (void)updateMapsSuggestionsSignalForMapType:(int)a3
{
  NSObject *signalPackQueue;
  _QWORD block[4];
  id v7;
  int v8;
  id location;

  objc_initWeak(&location, self);
  signalPackQueue = self->_signalPackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C0E8A0;
  block[3] = &unk_1011B6E80;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(signalPackQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  id v5;
  NSObject *signalPackQueue;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C0EABC;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  signalPackQueue = self->_signalPackQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100C0EC58;
  v7[3] = &unk_1011AD260;
  objc_copyWeak(&v8, &location);
  dispatch_async(signalPackQueue, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *signalPackQueue;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C0EE6C;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  signalPackQueue = self->_signalPackQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100C0F008;
  v7[3] = &unk_1011AD260;
  objc_copyWeak(&v8, &location);
  dispatch_async(signalPackQueue, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)session:(id)a3 didUpdateConfiguration:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "carSession: %@, didUpdateConfiguration: %@", (uint8_t *)&v10, 0x16u);
  }

  -[CarDisplayController _setupClusterSuggestionControllerIfNeeded](self, "_setupClusterSuggestionControllerIfNeeded");
}

- (BOOL)isChromeAvailable
{
  void *v3;
  BOOL v4;

  if ((id)-[CarDisplayController state](self, "state") != (id)2)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_validateTransitionFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  if (a3 == a4 || a3 == 1 && (a4 & 0xFFFFFFFFFFFFFFFDLL) == 0 || a3 == 2 && a4 < 2)
    return 1;
  return !a3 && a4 == 1;
}

- (void)setState:(unint64_t)a3
{
  unint64_t state;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  NSDate *dateOfLastScreenUpdate;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  state = self->_state;
  if (state != a3
    && -[CarDisplayController _validateTransitionFromState:toState:](self, "_validateTransitionFromState:toState:", state, a3))
  {
    self->_state = a3;
    if (a3)
    {
      if (a3 == 2)
      {
        v14 = sub_10043364C();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "CarPlay is running", v18, 2u);
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
        objc_msgSend(v16, "checkForActiveCarPlayConnection");

        -[CarDisplayController _prepareChromeForFirstUse](self, "_prepareChromeForFirstUse");
        -[CarDisplayController _activationDelay](self, "_activationDelay");
        -[CarDisplayController _reactivateChromeAfterDelay:](self, "_reactivateChromeAfterDelay:");
        -[CarDisplayController _setNeedsScreenUpdate](self, "_setNeedsScreenUpdate");
      }
      else if (a3 == 1)
      {
        v6 = sub_10043364C();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will prepare CarPlay", buf, 2u);
        }

        v8 = -[CarDisplayController guidanceObserver](self, "guidanceObserver");
      }
    }
    else
    {
      v9 = sub_10043364C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will tear down the CarPlay stack", v17, 2u);
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_screenUpdateOperation);
      objc_msgSend(WeakRetained, "cancel");

      -[CarDisplayController _destroyChrome](self, "_destroyChrome");
      dateOfLastScreenUpdate = self->_dateOfLastScreenUpdate;
      self->_dateOfLastScreenUpdate = 0;

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController window](self, "window"));
      objc_msgSend(v13, "setRootViewController:", 0);

      -[CarDisplayController setWindow:](self, "setWindow:", 0);
      -[CarDisplayController setScreen:](self, "setScreen:", 0);
    }
  }
}

- (void)prepareCarPlay
{
  _QWORD block[5];

  if (!-[CarDisplayController state](self, "state"))
    -[CarDisplayController updateForCurrentEnablingState](self, "updateForCurrentEnablingState");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C0F4C4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_setupCarPlayIfNeeded
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  id v7;
  __int16 v8;
  __int16 v9;

  if (objc_msgSend((id)objc_opt_class(self), "enablingState") == (id)2)
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v9 = 0;
      v5 = "Will not prepare CarPlay, disallowed.";
      v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (-[CarDisplayController state](self, "state"))
  {
    v7 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v8 = 0;
      v5 = "Will not prepare CarPlay, already running/ready.";
      v6 = (uint8_t *)&v8;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  -[CarDisplayController setState:](self, "setState:", 1);
  -[CarDisplayController _setupClusterSuggestionControllerIfNeeded](self, "_setupClusterSuggestionControllerIfNeeded");
}

- (void)_tearDownCarPlayIfNeeded
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[CarDisplayController state](self, "state"))
  {
    -[CarDisplayController setState:](self, "setState:", 0);
    -[CarDisplayController _tearDownClusterSuggestionController](self, "_tearDownClusterSuggestionController");
    -[CarDisplayController _tearDownMapsSuggestionsController](self, "_tearDownMapsSuggestionsController");
  }
  else
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will not tear down CarPlay, already stopped.", v5, 2u);
    }

  }
}

- (double)_activationDelay
{
  double v2;
  double v3;
  id v4;
  NSObject *v5;
  int v7;
  double v8;

  v2 = 0.0;
  if (+[CarDisplayController debugLaunchPerformance](CarDisplayController, "debugLaunchPerformance"))
  {
    +[CarDisplayController debugLaunchPerformanceDelay](CarDisplayController, "debugLaunchPerformanceDelay");
    v2 = v3;
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 134217984;
      v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Overriding activationDelay for debugging (delay:%#.1lfs)", (uint8_t *)&v7, 0xCu);
    }

  }
  return v2;
}

- (void)_prepareChromeForFirstUse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  CarChromeViewController *v14;
  id v15;
  CarChromeViewController *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id chromeDeactivationToken;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  CarCardTestModeController *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  char *v45;
  void **v46;
  uint64_t v47;
  id (*v48)(uint64_t);
  void *v49;
  id v50;
  CarCardTestModeController *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  const char *v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "platformController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSession"));

    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Instantiating and suppressing CarChromeViewController.", buf, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));

    v11 = objc_opt_class(CarSceneDelegate);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    if (!v13)
    {
      v41 = sub_1004318FC();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v53 = "-[CarDisplayController _prepareChromeForFirstUse]";
        v54 = 2080;
        v55 = "CarDisplayController.m";
        v56 = 1024;
        v57 = 592;
        v58 = 2080;
        v59 = "carSceneDelegate != nil";
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v43 = sub_1004318FC();
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v53 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v14 = [CarChromeViewController alloc];
    v15 = objc_msgSend(v13, "sceneType");

    v16 = -[CarChromeViewController initWithCarSceneType:](v14, "initWithCarSceneType:", v15);
    -[CarDisplayController setChromeViewController:](self, "setChromeViewController:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
    v46 = _NSConcreteStackBlock;
    v47 = 3221225472;
    v48 = sub_100C0FD48;
    v49 = &unk_1011BD650;
    v18 = v6;
    v50 = v18;
    objc_msgSend(v17, "setFallbackContextCoordinationBlock:", &v46);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController", v46, v47, v48, v49));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "acquireChromeDeactivationTokenForReason:", CFSTR("CarPlay preparing new chrome for first use")));
    chromeDeactivationToken = self->_chromeDeactivationToken;
    self->_chromeDeactivationToken = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v22, "setSuppressed:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if ((objc_msgSend(v23, "BOOLForKey:", CFSTR("__internal_CarCardTestDebug")) & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
      v25 = objc_msgSend(v24, "isInternalInstall");

      if (v25)
      {
        v26 = objc_alloc_init(CarCardTestModeController);
        v27 = sub_10043364C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Will set CarCardTestModeController as root mode for new CarChromeViewController.", buf, 2u);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
        v51 = v26;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
        objc_msgSend(v29, "setContexts:animated:completion:", v30, 0, 0);

        goto LABEL_17;
      }
    }
    else
    {

    }
    v31 = sub_10043364C();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Will set contextsForCurrentAppState as the new mode stack.", buf, 2u);
    }

    v26 = (CarCardTestModeController *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController contextsForCurrentAppState](self, "contextsForCurrentAppState"));
    -[CarCardTestModeController setContexts:animated:completion:](v26, "setContexts:animated:completion:", v29, 0, 0);
LABEL_17:

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v33, "addChromeViewController:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSession currentSearchSession](SearchSession, "currentSearchSession"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController platformController](self, "platformController"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "currentSession"));
    if (v37 || !v35)
    {

    }
    else
    {
      v38 = objc_msgSend(v35, "origin");

      if (v38 == (id)1)
      {
LABEL_25:
        -[CarDisplayController _startObservingSharedAppState](self, "_startObservingSharedAppState");

        return;
      }
      v39 = sub_10043364C();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Will display current search session.", buf, 2u);
      }

      objc_storeStrong((id *)&self->_searchSession, v35);
      -[SearchSession addObserver:](self->_searchSession, "addObserver:", self);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      objc_msgSend(v36, "displaySearchSession:", v35);
    }

    goto LABEL_25;
  }
}

- (id)contextsForCurrentAppState
{
  CarMapBrowsingModeController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CarRouteGeniusModeController *v9;
  void *v10;
  void *v11;
  CarRouteGeniusModeController *v12;
  uint64_t v13;
  CarRoutePlanningModeController *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  unsigned int v20;
  __objc2_class **v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  void *v34;

  v3 = objc_alloc_init(CarMapBrowsingModeController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSession"));

  v8 = objc_opt_class(RouteGeniusSession);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = [CarRouteGeniusModeController alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suggestion"));
    v12 = -[CarRouteGeniusModeController initWithSuggestion:](v9, "initWithSuggestion:", v11);

  }
  else
  {
    v13 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0)
    {
      v14 = -[CarRoutePlanningModeController initWithExistingRouteLoading]([CarRoutePlanningModeController alloc], "initWithExistingRouteLoading");
    }
    else
    {
      v15 = objc_opt_class(NavigationSession);
      if ((objc_opt_isKindOfClass(v7, v15) & 1) == 0)
        goto LABEL_14;
      v16 = v7;
      v17 = objc_opt_class(NavigationSession);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
        v18 = v16;
      else
        v18 = 0;
      v19 = v18;

      v20 = objc_msgSend(v19, "isCarNavigationCompatible");
      v21 = off_101196098;
      if (!v20)
        v21 = off_101196080;
      v14 = (CarRoutePlanningModeController *)objc_alloc_init(*v21);
    }
    v12 = (CarRouteGeniusModeController *)v14;
  }
  objc_msgSend(v4, "addObject:", v12);

LABEL_14:
  v22 = sub_10043364C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = v4;
    v25 = v24;
    if (v24)
    {
      if (objc_msgSend(v24, "count"))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", ")));
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v25, v26));

      }
      else
      {
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v25));
      }
    }
    else
    {
      v27 = CFSTR("<nil>");
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
    *(_DWORD *)buf = 138412546;
    v32 = v27;
    v33 = 2048;
    v34 = v28;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Recreating current app state with modes: %@ for chrome: %p", buf, 0x16u);

  }
  v29 = objc_msgSend(v4, "copy");

  return v29;
}

- (void)_destroyChrome
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id chromeDeactivationToken;
  uint8_t v8[16];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will tear down and destroy the chrome.", v8, 2u);
  }

  -[CarDisplayController _stopObservingSharedAppState](self, "_stopObservingSharedAppState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setContexts:", &__NSArray0__struct);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v6, "setSuppressed:", 1);

  chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_chromeDeactivationToken = 0;

  -[CarDisplayController setChromeViewController:](self, "setChromeViewController:", 0);
}

- (void)_setChromeSuppressed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  __CFString *v19;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v6, "setSuppressed:", 1);

      self->_isPreparingNavigation = 0;
    }
    else
    {
      v12 = objc_msgSend(v6, "isSuppressed");

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
      v17 = v13;
      if (v12)
      {
        objc_msgSend(v13, "loadViewIfNeeded");

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
        objc_msgSend(v14, "setSuppressed:", 0);

        v15 = sub_10043364C();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Will attempt to run new screen refresh tasks and present queued interruption because we unsuppressed a suppressed chrome", buf, 2u);
        }

        -[CarDisplayController runNewScreenRefreshTasksIfNeeded](self, "runNewScreenRefreshTasksIfNeeded");
        -[CarDisplayController _presentQueuedInterruptionIfNeeded](self, "_presentQueuedInterruptionIfNeeded");
      }
      else
      {
        objc_msgSend(v13, "setSuppressed:", 0);

      }
    }
  }
  else
  {
    v8 = sub_10043364C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = CFSTR("NO");
      if (v3)
        v10 = CFSTR("YES");
      v11 = v10;
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "We don't have a chromeVC yet; ignoring suppression(%{public}@)",
        buf,
        0xCu);

    }
  }
}

- (void)_reactivateChromeAfterDelay:(double)a3
{
  _QWORD *v4;
  id v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9[2];
  id location;
  uint8_t buf[4];
  double v12;

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C105B0;
  v8[3] = &unk_1011B72B0;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&a3;
  v4 = objc_retainBlock(v8);
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Will reactivate chrome after %#.2lfs delay", buf, 0xCu);
  }

  if (a3 == -1.0)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
  else if (a3 == 0.0)
  {
    ((void (*)(_QWORD *))v4[2])(v4);
  }
  else
  {
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v4);
  }

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_tearDownMapsSuggestionsController
{
  -[CarDisplayController setMapsSuggestionsController:](self, "setMapsSuggestionsController:", 0);
}

- (void)_setupClusterSuggestionControllerIfNeeded
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  CarClusterSuggestionController *v8;
  CarClusterSuggestionController *clusterSuggestionController;
  id v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController carSessionStatus](self, "carSessionStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));
  v5 = objc_msgSend(v4, "supportsInstrumentCluster");

  if ((v5 & 1) != 0)
  {
    if (self->_clusterSuggestionController)
      return;
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Car supports instrument cluster. Creating a suggestion controller.", v11, 2u);
    }

    v8 = objc_alloc_init(CarClusterSuggestionController);
    clusterSuggestionController = self->_clusterSuggestionController;
    self->_clusterSuggestionController = v8;
  }
  else
  {
    v10 = sub_10043364C();
    clusterSuggestionController = (CarClusterSuggestionController *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(&clusterSuggestionController->super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &clusterSuggestionController->super, OS_LOG_TYPE_INFO, "Car doesn't support instrument cluster. We're not creating a suggestion controller.", buf, 2u);
    }
  }

}

- (void)_tearDownClusterSuggestionController
{
  id v3;
  NSObject *v4;
  CarClusterSuggestionController *clusterSuggestionController;
  uint8_t v6[16];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Tearing down clusterSuggestionController", v6, 2u);
  }

  clusterSuggestionController = self->_clusterSuggestionController;
  self->_clusterSuggestionController = 0;

}

- (void)_carDisplayDidFinishLaunching:(id)a3
{
  if ((id)-[CarDisplayController state](self, "state", a3) == (id)1)
    -[CarDisplayController setState:](self, "setState:", 2);
}

- (void)_willResignActive
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));

  if (v3)
  {
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Notified main CarPlay scene will resign active", buf, 2u);
    }

    if ((id)-[CarDisplayController state](self, "state") != (id)2)
    {
      v6 = sub_10043364C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Chrome is not running, do nothing", v8, 2u);
      }

    }
  }
}

- (void)_didEnterBackground
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));

  if (v3)
  {
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Notified main CarPlay scene did enter background", (uint8_t *)&v14, 2u);
    }

    if ((id)-[CarDisplayController state](self, "state") == (id)2)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
      v7 = objc_msgSend(v6, "isAutohidingContentHiddenForCurrentContext");

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        -[CarDisplayController setBackgroundAutoHideStateTrackingDate:](self, "setBackgroundAutoHideStateTrackingDate:", v8);

        v9 = sub_10043364C();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController backgroundAutoHideStateTrackingDate](self, "backgroundAutoHideStateTrackingDate"));
          v14 = 138412290;
          v15 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Recorded background autohide state tracking date as %@", (uint8_t *)&v14, 0xCu);

        }
      }
      -[CarDisplayController _registerCarInfoForGEOLogging](self, "_registerCarInfoForGEOLogging");
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2197, 0, 0);
      -[CarDisplayController _updateForCurrentScreen](self, "_updateForCurrentScreen");
    }
    else
    {
      v12 = sub_10043364C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Chrome is not running, do nothing", (uint8_t *)&v14, 2u);
      }

    }
  }
}

- (void)_willEnterForeground
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint8_t v12[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));

  if (v3)
  {
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Notified main CarPlay scene will enter foreground", v12, 2u);
    }

    -[CarDisplayController _registerCarInfoForGEOLogging](self, "_registerCarInfoForGEOLogging");
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2196, 0, 0);
    if ((id)-[CarDisplayController state](self, "state") == (id)2)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[CarDisplayController backgroundAutoHideStateTrackingDate](self, "backgroundAutoHideStateTrackingDate"));
      if (!v6
        || (v7 = (void *)v6,
            v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController backgroundAutoHideStateTrackingDate](self, "backgroundAutoHideStateTrackingDate")), objc_msgSend(v8, "timeIntervalSinceNow"), v10 = fabs(v9), v8, v7, v10 > 480.0))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
        objc_msgSend(v11, "interruptAutohideForIncidentalInteraction");

      }
      -[CarDisplayController setBackgroundAutoHideStateTrackingDate:](self, "setBackgroundAutoHideStateTrackingDate:", 0);
    }
    -[CarDisplayController _updateForCurrentScreen](self, "_updateForCurrentScreen");
  }
}

- (void)_didBecomeActive
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));

  if (v3)
  {
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Notified main CarPlay scene did become active", buf, 2u);
    }

    if ((id)-[CarDisplayController state](self, "state") != (id)2)
    {
      v6 = sub_10043364C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Chrome is not running, do nothing", v8, 2u);
      }

    }
  }
}

- (void)_externalDeviceUpdated
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  uint8_t v7[16];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[CarDisplayController] - External device is updated.", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v6 = objc_msgSend(v5, "ownsScreen");

  if (v6)
    -[CarDisplayController _setNeedsScreenUpdate](self, "_setNeedsScreenUpdate");
  else
    -[CarDisplayController _updateForCurrentScreen](self, "_updateForCurrentScreen");
  -[CarDisplayController _updateLowFuelSuggestionState](self, "_updateLowFuelSuggestionState");
}

- (void)_updateLowFuelSuggestionState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v11 = 134218240;
    v12 = objc_msgSend(v5, "hasEngineType");
    v13 = 2048;
    v14 = -[CarDisplayController state](self, "state");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[CarDisplayController] - Update low fuel suggestion state with Engine type availability: %ld, And state is: %ld", (uint8_t *)&v11, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v7 = objc_msgSend(v6, "hasEngineType");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController mapsSuggestionsController](self, "mapsSuggestionsController"));
  objc_msgSend(v8, "setMonitorLowFuel:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  LOBYTE(v7) = objc_msgSend(v9, "needsFuel");

  if ((v7 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController mapsSuggestionsController](self, "mapsSuggestionsController"));
    objc_msgSend(v10, "setAllowLowFuelAlert:", 1);

  }
}

- (void)runNewScreenRefreshTasksIfNeeded
{
  id v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  __int16 v16;
  uint8_t buf[2];
  uint8_t v18[16];

  if (self->_hasRunNewScreenRefreshTasks)
    goto LABEL_2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
  v8 = objc_msgSend(v7, "isSuppressed");

  if ((v8 & 1) != 0)
  {
    if (self->_hasRunNewScreenRefreshTasks)
    {
LABEL_2:
      v2 = sub_10043364C();
      v3 = objc_claimAutoreleasedReturnValue(v2);
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
LABEL_5:

        return;
      }
      *(_WORD *)buf = 0;
      v4 = "Not running new screen refresh tasks because we've already run them";
      v5 = buf;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
      goto LABEL_5;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
    v10 = objc_msgSend(v9, "isSuppressed");

    if (v10)
    {
      v11 = sub_10043364C();
      v3 = objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        goto LABEL_5;
      v16 = 0;
      v4 = "Not running new screen refresh tasks because the chrome VC is suppressed";
      v5 = (uint8_t *)&v16;
      goto LABEL_4;
    }
  }
  else
  {
    v12 = sub_10043364C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Running new screen refresh tasks", v18, 2u);
    }

    -[CarDisplayController _prepareNearby](self, "_prepareNearby");
    v14 = +[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance");
    -[CarDisplayController _registerCarInfoForGEOLogging](self, "_registerCarInfoForGEOLogging");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController mapsSuggestionsController](self, "mapsSuggestionsController"));
    objc_msgSend(v15, "setAllowLowFuelAlert:", 1);

    self->_hasRunNewScreenRefreshTasks = 1;
  }
}

- (void)_startTimingIdleTimeout
{
  NSTimer *idleTimeoutTimer;
  double Double;
  id v5;
  NSObject *v6;
  double v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  BKSProcessAssertion *v12;
  BKSProcessAssertion *idleTimeoutAssertion;
  unsigned int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  BKSProcessAssertion *v18;
  BKSProcessAssertion *v19;
  id v20;
  NSObject *v21;
  NSTimer *v22;
  NSTimer *v23;
  int v24;
  double v25;

  -[NSTimer invalidate](self->_idleTimeoutTimer, "invalidate");
  idleTimeoutTimer = self->_idleTimeoutTimer;
  self->_idleTimeoutTimer = 0;

  -[CarDisplayController _clearExistingTimeoutAssertionIfNeededAfterDelay:](self, "_clearExistingTimeoutAssertionIfNeededAfterDelay:", 1.0);
  Double = GEOConfigGetDouble(MapsConfig_CarDisconnectedAndIdleTimeout, off_1014B5008);
  if (Double == 0.0)
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CarDisplayController will not track disconnected and idle timeout, will fire immediately", (uint8_t *)&v24, 2u);
    }

    -[CarDisplayController _idleTimeoutFired:](self, "_idleTimeoutFired:", 0);
  }
  else
  {
    v7 = Double;
    if (Double == -1.0)
    {
      v8 = sub_10043364C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CarDisplayController will not track disconnected and idle timeout, will keep chrome alive", (uint8_t *)&v24, 2u);
      }

    }
    else
    {
      if (GEOConfigGetBOOL(MapsConfig_CarDisconnectedAndIdleTimeoutShouldTakeAssertion, off_1014B5018))
      {
        -[CarDisplayController _clearExistingTimeoutAssertionIfNeededAfterDelay:](self, "_clearExistingTimeoutAssertionIfNeededAfterDelay:", 1.0);
        v10 = sub_10043364C();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CarDisplayController will take assertion for idle timeout timer", (uint8_t *)&v24, 2u);
        }

        v12 = (BKSProcessAssertion *)objc_msgSend(objc_alloc((Class)BKSProcessAssertion), "initWithBundleIdentifier:flags:reason:name:", CFSTR("com.apple.Maps"), 1, 7, CFSTR("recent CarPlay disconnection"));
        idleTimeoutAssertion = self->_idleTimeoutAssertion;
        self->_idleTimeoutAssertion = v12;

        v14 = -[BKSProcessAssertion acquire](self->_idleTimeoutAssertion, "acquire");
        v15 = sub_10043364C();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (v14)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v18 = self->_idleTimeoutAssertion;
            v24 = 134217984;
            v25 = *(double *)&v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Acquired idle timeout assertion %p", (uint8_t *)&v24, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v19 = self->_idleTimeoutAssertion;
            v24 = 134217984;
            v25 = *(double *)&v19;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to acquire idle timeout assertion %p, clearing ivar", (uint8_t *)&v24, 0xCu);
          }

          v17 = self->_idleTimeoutAssertion;
          self->_idleTimeoutAssertion = 0;
        }

      }
      v20 = sub_10043364C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 134217984;
        v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "CarDisplayController started tracking idle timeout: %lfs", (uint8_t *)&v24, 0xCu);
      }

      v22 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_idleTimeoutFired:", 0, 0, v7));
      v23 = self->_idleTimeoutTimer;
      self->_idleTimeoutTimer = v22;

    }
  }
}

- (void)_stopTimingIdleTimout
{
  NSTimer *idleTimeoutTimer;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSTimer *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  idleTimeoutTimer = self->_idleTimeoutTimer;
  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (idleTimeoutTimer)
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CarDisplayController stopped tracking idle timeout", v8, 2u);
    }

    -[NSTimer invalidate](self->_idleTimeoutTimer, "invalidate");
    v7 = self->_idleTimeoutTimer;
    self->_idleTimeoutTimer = 0;

    -[CarDisplayController _clearExistingTimeoutAssertionIfNeededAfterDelay:](self, "_clearExistingTimeoutAssertionIfNeededAfterDelay:", 1.0);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CarDisplayController asked to stop tracking idle timeout, but no timer", buf, 2u);
    }

  }
}

- (void)_idleTimeoutFired:(id)a3
{
  id v4;
  NSObject *v5;
  NSTimer *idleTimeoutTimer;
  void *v7;
  id v8;
  NSObject *v9;
  double v10;
  id v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CarDisplayController notified idle timeout fired", (uint8_t *)&v13, 2u);
  }

  -[NSTimer invalidate](self->_idleTimeoutTimer, "invalidate");
  idleTimeoutTimer = self->_idleTimeoutTimer;
  self->_idleTimeoutTimer = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));
  if (v7)
  {
    v8 = sub_10043364C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = 1.0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "CarDisplayController tried to destroy chrome with active screen, aborting.", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    -[CarDisplayController _destroyChrome](self, "_destroyChrome");
    v11 = sub_10043364C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = CFSTR("CarDisplayIsDisconnectedAndIdle");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Post notification (%@)", (uint8_t *)&v13, 0xCu);
    }

    v9 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    -[NSObject postNotificationName:object:](v9, "postNotificationName:object:", CFSTR("CarDisplayIsDisconnectedAndIdle"), self);
    v10 = 3.0;
  }

  -[CarDisplayController _clearExistingTimeoutAssertionIfNeededAfterDelay:](self, "_clearExistingTimeoutAssertionIfNeededAfterDelay:", v10);
}

- (void)_clearExistingTimeoutAssertionIfNeededAfterDelay:(double)a3
{
  BKSProcessAssertion *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  BKSProcessAssertion *idleTimeoutAssertion;
  dispatch_time_t v10;
  _QWORD block[4];
  BKSProcessAssertion *v12;
  uint8_t buf[4];
  BKSProcessAssertion *v14;
  __int16 v15;
  double v16;

  v5 = self->_idleTimeoutAssertion;
  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134218240;
      v14 = v5;
      v15 = 2048;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will invalidate idle timeout assertion %p after %#.1lfs", buf, 0x16u);
    }

    idleTimeoutAssertion = self->_idleTimeoutAssertion;
    self->_idleTimeoutAssertion = 0;

    v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C11760;
    block[3] = &unk_1011AC860;
    v12 = v5;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    v7 = v12;
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No timeout assertion to invalidate", buf, 2u);
  }

}

- (void)_popIfTopModeIsInvalidAfterReconnection:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance", a3));
  objc_msgSend(v3, "cleanupForDisconnect");

}

- (UITraitCollection)screenTraitCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));

  return (UITraitCollection *)v6;
}

- (GEOCarInfo)connectedCarMainScreenInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController carSessionStatus](self, "carSessionStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_primaryScreen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController carInfoForScreen:](self, "carInfoForScreen:", v6));

  return (GEOCarInfo *)v7;
}

- (NSMapTable)connectedCarScreenInfos
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController carSessionStatus](self, "carSessionStatus", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screens"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController carInfoForScreen:](self, "carInfoForScreen:", v12));
        objc_msgSend(v3, "setObject:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return (NSMapTable *)v3;
}

- (id)carInfoForScreen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  GEOCarInfo *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  _QWORD v27[2];
  char v28;
  _BYTE v29[7];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController carSessionStatus](self, "carSessionStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));

  v8 = -[CarDisplayController isCurrentlyConnectedToAnyCarScene](self, "isCurrentlyConnectedToAnyCarScene");
  v9 = 0;
  if (v8 && v7)
  {
    v9 = objc_opt_new(GEOCarInfo);
    v10 = objc_msgSend(v7, "transportType");
    if (v10 == (id)1)
      v11 = 1;
    else
      v11 = 2 * (v10 == (id)3);
    -[GEOCarInfo setDeviceConnection:](v9, "setDeviceConnection:", v11);
    if ((objc_msgSend(v4, "availableInteractionModels") & 2) != 0)
    {
      if (objc_msgSend(v4, "supportsHighFidelityTouch"))
        v12 = 3;
      else
        v12 = 4;
      -[GEOCarInfo addInputMethod:](v9, "addInputMethod:", v12);
    }
    if ((objc_msgSend(v4, "availableInteractionModels") & 4) != 0)
      -[GEOCarInfo addInputMethod:](v9, "addInputMethod:", 1);
    if ((objc_msgSend(v4, "availableInteractionModels") & 8) != 0)
      -[GEOCarInfo addInputMethod:](v9, "addInputMethod:", 2);
    if ((objc_msgSend(v4, "availableInteractionModels") & 1) != 0)
      -[GEOCarInfo addInputMethod:](v9, "addInputMethod:", 0);
    memset(v29, 0, sizeof(v29));
    objc_msgSend(v4, "pixelSize");
    v14 = v13;
    objc_msgSend(v4, "pixelSize");
    v27[0] = v14;
    v27[1] = v15;
    v28 = 3;
    -[GEOCarInfo setScreenResolution:](v9, "setScreenResolution:", v27);
    v16 = (void *)objc_opt_new(GEOScreenDimension);
    objc_msgSend(v4, "physicalSize");
    objc_msgSend(v16, "setWidth:");
    objc_msgSend(v4, "physicalSize");
    objc_msgSend(v16, "setHeight:", v17);
    -[GEOCarInfo setScreenDimension:](v9, "setScreenDimension:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    -[GEOCarInfo setDestinationSharingEnabled:](v9, "setDestinationSharingEnabled:", objc_msgSend(v18, "destinationHandoffEnabled"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v20 = objc_msgSend(v19, "supportsNavigationAidedDriving");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
      v22 = objc_msgSend(v21, "isNavigationAidedDrivingEnabled");

      if (v22)
        v23 = 3;
      else
        v23 = 2;
    }
    else
    {
      v23 = 1;
    }
    -[GEOCarInfo setNavAidedDrivingStatus:](v9, "setNavAidedDrivingStatus:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v25 = objc_msgSend(v24, "engineTypes");

    if ((v25 & 1) != 0)
    {
      -[GEOCarInfo addEngineType:](v9, "addEngineType:", 1);
      if ((v25 & 0x10000) == 0)
      {
LABEL_24:
        if ((v25 & 0x1000000) == 0)
          goto LABEL_25;
        goto LABEL_31;
      }
    }
    else if ((v25 & 0x10000) == 0)
    {
      goto LABEL_24;
    }
    -[GEOCarInfo addEngineType:](v9, "addEngineType:", 3);
    if ((v25 & 0x1000000) == 0)
    {
LABEL_25:
      if ((v25 & 0x100) == 0)
      {
LABEL_27:

        goto LABEL_28;
      }
LABEL_26:
      -[GEOCarInfo addEngineType:](v9, "addEngineType:", 2);
      goto LABEL_27;
    }
LABEL_31:
    -[GEOCarInfo addEngineType:](v9, "addEngineType:", 4);
    if ((v25 & 0x100) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_28:

  return v9;
}

- (id)availableCarPlayScreen
{
  void *v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Did find connected CarPlay screen", buf, 2u);
    }

    v6 = v2;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Did not find any connected CarPlay screens", v8, 2u);
    }

  }
  return v2;
}

- (void)_screenDidConnect:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));

  if (v5 != v4)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notified of incoming CarPlay screen", v8, 2u);
    }

    -[CarDisplayController setScreen:](self, "setScreen:", v4);
  }

}

- (void)_screenDidDisconnect:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));

  if (v5 == v4)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notified its CarPlay screen was disconnected", v8, 2u);
    }

    -[CarDisplayController setScreen:](self, "setScreen:", 0);
  }
}

- (void)setScreen:(id)a3
{
  UIScreen *v4;
  id v5;
  NSObject *v6;
  UIScreen *screen;
  int v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  BKSHIDEventDeliveryPolicyObserver *HIDEventObserver;
  void *v14;
  void *v15;
  void *v16;
  BKSHIDEventDeliveryPolicyObserver *v17;
  BKSHIDEventDeliveryPolicyObserver *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  const __CFString *v23;

  v4 = (UIScreen *)a3;
  if (-[CarDisplayController overrideShouldSuppressChrome](self, "overrideShouldSuppressChrome"))
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Overriding screen to nil", (uint8_t *)&v22, 2u);
    }

    v4 = 0;
  }
  screen = self->_screen;
  if (screen != v4)
  {
    v8 = (v4 != 0) ^ (screen != 0);
    objc_storeStrong((id *)&self->_screen, v4);
    v9 = sub_10043364C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v11)
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will attach to a new screen", (uint8_t *)&v22, 2u);
      }

      -[CarDisplayController _stopTimingIdleTimout](self, "_stopTimingIdleTimout");
      if (!self->_HIDEventObserver)
      {
        v12 = objc_alloc_init((Class)BKSHIDEventDeliveryPolicyObserver);
        objc_msgSend(v12, "addObserver:", self);
        HIDEventObserver = self->_HIDEventObserver;
        self->_HIDEventObserver = (BKSHIDEventDeliveryPolicyObserver *)v12;

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIScreen displayConfiguration](v4, "displayConfiguration"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hardwareIdentifier"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventDisplay displayWithHardwareIdentifier:](BKSHIDEventDisplay, "displayWithHardwareIdentifier:", v15));
      -[BKSHIDEventDeliveryPolicyObserver setDisplay:](self->_HIDEventObserver, "setDisplay:", v16);

    }
    else
    {
      if (v11)
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will detach from its screen", (uint8_t *)&v22, 2u);
      }

      self->_hasRunNewScreenRefreshTasks = 0;
      v17 = self->_HIDEventObserver;
      if (v17)
      {
        -[BKSHIDEventDeliveryPolicyObserver removeObserver:](v17, "removeObserver:", self);
        v18 = self->_HIDEventObserver;
        self->_HIDEventObserver = 0;

      }
      -[CarDisplayController _startTimingIdleTimeout](self, "_startTimingIdleTimeout");
      -[CarDisplayController _registerCarInfoForGEOLogging](self, "_registerCarInfoForGEOLogging");
      -[CarDisplayController _popIfTopModeIsInvalidAfterReconnection:](self, "_popIfTopModeIsInvalidAfterReconnection:", 0);
    }
    -[CarDisplayController _setNeedsScreenUpdate](self, "_setNeedsScreenUpdate");
    if (v8)
    {
      v19 = sub_10043364C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v22 = 138412290;
        v23 = CFSTR("CarDisplayDidChangeConnectedNotification");
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Post notification (%@)", (uint8_t *)&v22, 0xCu);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v21, "postNotificationName:object:", CFSTR("CarDisplayDidChangeConnectedNotification"), self);

    }
  }

}

- (BOOL)activelyOnScreen:(id *)a3
{
  int BOOL;
  __CFString *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;

  if (GEOConfigGetBOOL(MapsConfig_CarAvoidAllMapDeactivation, off_1014B5028))
  {
    LOBYTE(BOOL) = 1;
    if (a3)
    {
      v6 = CFSTR("deactivation has been overridden, will report we're actively on-screen");
LABEL_14:
      *a3 = v6;
    }
  }
  else if (self->_screen)
  {
    if (objc_msgSend((id)objc_opt_class(self), "enablingState") == (id)3)
    {
      LOBYTE(BOOL) = 0;
      if (a3)
      {
        v6 = CFSTR("simulated no screen ownership");
        goto LABEL_14;
      }
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
      v8 = objc_msgSend(v7, "ownsScreen");

      if (v8)
      {
        BOOL = GEOConfigGetBOOL(MapsConfig_CarPlayAllowActiveChromeWithoutScreenOwnership, off_1014B4AF8);
        v6 = CFSTR("device owns screen");
        if (BOOL)
          v6 = CFSTR("device owns screen, but override default allows it");
        if (a3)
          goto LABEL_14;
      }
      else
      {
        v9 = -[CarDisplayController isCarAppSceneHostingNavigation](self, "isCarAppSceneHostingNavigation");
        v6 = CFSTR("hosting navigation");
        if (!v9)
          v6 = 0;
        LOBYTE(BOOL) = 1;
        if (a3)
          goto LABEL_14;
      }
    }
  }
  else
  {
    LOBYTE(BOOL) = 0;
    if (a3)
    {
      v6 = CFSTR("no screen");
      goto LABEL_14;
    }
  }
  return BOOL;
}

- (CarMapsSuggestionsController)mapsSuggestionsController
{
  CarDisplayController *v2;
  CarMapsSuggestionsController *mapsSuggestionsController;
  id v4;
  NSObject *v5;
  CarMapsSuggestionsController *v6;
  CarMapsSuggestionsController *v7;
  CarMapsSuggestionsController *v8;
  int v10;
  unint64_t v11;

  v2 = self;
  objc_sync_enter(v2);
  mapsSuggestionsController = v2->_mapsSuggestionsController;
  if (!mapsSuggestionsController)
  {
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = -[CarDisplayController state](v2, "state");
    }

    v6 = objc_opt_new(CarMapsSuggestionsController);
    v7 = v2->_mapsSuggestionsController;
    v2->_mapsSuggestionsController = v6;

    mapsSuggestionsController = v2->_mapsSuggestionsController;
  }
  v8 = mapsSuggestionsController;
  objc_sync_exit(v2);

  return v8;
}

- (void)setMapsSuggestionsController:(id)a3
{
  CarMapsSuggestionsController *v5;
  CarDisplayController *v6;
  CarMapsSuggestionsController *mapsSuggestionsController;
  void **p_mapsSuggestionsController;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  CarMapsSuggestionsController *v16;

  v5 = (CarMapsSuggestionsController *)a3;
  v6 = self;
  objc_sync_enter(v6);
  p_mapsSuggestionsController = (void **)&v6->_mapsSuggestionsController;
  mapsSuggestionsController = v6->_mapsSuggestionsController;
  if (mapsSuggestionsController != v5)
  {
    if (mapsSuggestionsController)
    {
      -[CarMapsSuggestionsController setSinkAttached:](mapsSuggestionsController, "setSinkAttached:", 0);
      v9 = *p_mapsSuggestionsController;
      *p_mapsSuggestionsController = 0;

    }
    v10 = sub_10043364C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *p_mapsSuggestionsController;
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v5;
    }

    objc_storeStrong((id *)&v6->_mapsSuggestionsController, a3);
    -[CarDisplayController _updateLowFuelSuggestionState](v6, "_updateLowFuelSuggestionState");
  }
  objc_sync_exit(v6);

}

- (BOOL)hasMapsSuggestionsController
{
  return self->_mapsSuggestionsController != 0;
}

- (void)_setNeedsScreenUpdate
{
  id v3;
  NSObject *v4;
  NSNumber *v5;
  void *v6;
  NSOperation **p_screenUpdateOperation;
  id WeakRetained;
  id v9;
  NSObject *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;

  if (objc_msgSend((id)objc_opt_class(self), "enablingState") == (id)2)
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(self), "enablingState"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will not schedule screen update (enablingState:%@)", buf, 0xCu);

    }
  }
  else
  {
    p_screenUpdateOperation = &self->_screenUpdateOperation;
    WeakRetained = objc_loadWeakRetained((id *)&self->_screenUpdateOperation);

    if (!WeakRetained)
    {
      v9 = sub_10043364C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will schedule a screen update", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100C127F0;
      v17[3] = &unk_1011AD260;
      objc_copyWeak(&v18, (id *)buf);
      v11 = objc_retainBlock(v17);
      if (self->_updatingScreen || self->_dateOfLastScreenUpdate && self->_screen)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v11));
        objc_storeWeak((id *)p_screenUpdateOperation, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
        objc_msgSend(v13, "addOperation:", v12);

      }
      else
      {
        v14 = sub_10043364C();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Will perform first screen update immediately", v16, 2u);
        }

        ((void (*)(_QWORD *))v11[2])(v11);
      }

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_updateForCurrentScreen
{
  id WeakRetained;
  void *v4;
  CarDisplayWindow *v5;
  void *v6;
  CarDisplayWindow *v7;
  CarDisplayWindow *window;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  CarLaunchLoadingViewController *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  unsigned int v23;
  __CFString *v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  const __CFString *v28;
  id chromeDeactivationToken;
  CarDisplayWindow *v30;
  id v31;
  NSObject *v32;
  CarDisplayWindow *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  CGFloat v43;
  CGFloat v44;
  void *v45;
  unsigned int v46;
  _BOOL8 v47;
  void *v48;
  void *v49;
  NSDate *v50;
  NSDate *dateOfLastScreenUpdate;
  NSDate **p_dateOfLastScreenUpdate;
  id v53;
  NSObject *v54;
  NSDate *v55;
  id v56;
  NSObject *v57;
  void *v58;
  id v59;
  NSObject *v60;
  char *v61;
  id v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  void *v72;

  if (!self->_updatingScreen)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_screenUpdateOperation);
      objc_msgSend(WeakRetained, "cancel");

      objc_storeWeak((id *)&self->_screenUpdateOperation, 0);
      self->_updatingScreen = 1;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));
      if (-[CarDisplayController state](self, "state") && v4)
      {
        if (!self->_window)
        {
          v5 = [CarDisplayWindow alloc];
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));
          v7 = -[CarDisplayWindow initWithWindowScene:](v5, "initWithWindowScene:", v6);
          window = self->_window;
          self->_window = v7;

          -[CarDisplayWindow setAccessibilityIdentifier:](self->_window, "setAccessibilityIdentifier:", CFSTR("Maps.CarPlayApplication"));
        }
      }
      else if (!v4)
      {
        goto LABEL_10;
      }
      if (self->_window)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "coordinateSpace"));
        objc_msgSend(v10, "bounds");
        -[CarDisplayWindow setFrame:](self->_window, "setFrame:");

      }
LABEL_10:
      v11 = -[CarDisplayController state](self, "state");
      if (v11 != 2)
      {
        if (v11 != 1)
        {
          -[CarDisplayWindow setHidden:](self->_window, "setHidden:", 1);
          -[CarDisplayWindow setRootViewController:](self->_window, "setRootViewController:", 0);
          v30 = self->_window;
          self->_window = 0;

          self->_updatingScreen = 0;
LABEL_53:

          return;
        }
        v12 = sub_10043364C();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Will show launch screen, in prepare state", buf, 2u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow rootViewController](self->_window, "rootViewController"));
        v15 = objc_opt_class(CarLaunchLoadingViewController);
        isKindOfClass = objc_opt_isKindOfClass(v14, v15);

        if ((isKindOfClass & 1) == 0)
        {
          v17 = objc_alloc_init(CarLaunchLoadingViewController);
          -[CarDisplayWindow setRootViewController:](self->_window, "setRootViewController:", v17);

        }
        -[CarDisplayWindow setHidden:](self->_window, "setHidden:", 0);
LABEL_45:
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController carSessionStatus](self, "carSessionStatus"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "currentSession"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "configuration"));

        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "_maps_primaryScreen"));
        objc_msgSend(v42, "pixelSize");
        self->_screenSize.width = v43;
        self->_screenSize.height = v44;
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
        v46 = objc_msgSend(v45, "isInNavigatingState");

        if (v46)
        {
          v47 = -[CarDisplayController isCurrentlyConnectedToCarAppScene](self, "isCurrentlyConnectedToCarAppScene");
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
          objc_msgSend(v48, "setIsConnectedToCarplay:", v47);

          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
          objc_msgSend(v49, "setIsConnectedToCarplay:", v47);

          -[CarDisplayController _carSessionController_updateNavigationHostingState](self, "_carSessionController_updateNavigationHostingState");
        }
        if (self->_window)
        {
          v50 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          p_dateOfLastScreenUpdate = &self->_dateOfLastScreenUpdate;
          dateOfLastScreenUpdate = self->_dateOfLastScreenUpdate;
          self->_dateOfLastScreenUpdate = v50;
        }
        else
        {
          p_dateOfLastScreenUpdate = &self->_dateOfLastScreenUpdate;
          dateOfLastScreenUpdate = self->_dateOfLastScreenUpdate;
          self->_dateOfLastScreenUpdate = 0;
        }

        v53 = sub_10043364C();
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = *p_dateOfLastScreenUpdate;
          *(_DWORD *)buf = 138412290;
          v64 = (const char *)v55;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Recorded date of last screen update: %@", buf, 0xCu);
        }

        self->_updatingScreen = 0;
        goto LABEL_53;
      }
      if (!v4)
      {
        -[CarDisplayController _setChromeSuppressed:](self, "_setChromeSuppressed:", 1);
        if (self->_window)
        {
          v31 = sub_10043364C();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Will suppress CarChromeViewController and tear down the window", buf, 2u);
          }

          -[CarDisplayWindow setHidden:](self->_window, "setHidden:", 1);
          -[CarDisplayWindow setRootViewController:](self->_window, "setRootViewController:", 0);
          v33 = self->_window;
          self->_window = 0;

        }
        -[CarDisplayController setState:](self, "setState:", 1);
        goto LABEL_45;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayWindow rootViewController](self->_window, "rootViewController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));

      if (v18 != v19)
      {
        v20 = sub_10043364C();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Will attach CarChromeViewController to window and unsuppress it", buf, 2u);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
        -[CarDisplayWindow setRootViewController:](self->_window, "setRootViewController:", v22);

        -[CarDisplayWindow setHidden:](self->_window, "setHidden:", 0);
      }
      -[CarDisplayController _setChromeSuppressed:](self, "_setChromeSuppressed:", 0);
      v62 = 0;
      v23 = -[CarDisplayController activelyOnScreen:](self, "activelyOnScreen:", &v62);
      v24 = (__CFString *)v62;
      v25 = sub_10043364C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v23)
      {
        if (v27)
        {
          v28 = &stru_1011EB268;
          if (v24)
            v28 = v24;
          *(_DWORD *)buf = 138412290;
          v64 = (const char *)v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "CarChromeViewController should be active, we are on-screen (%@)", buf, 0xCu);
        }

        chromeDeactivationToken = self->_chromeDeactivationToken;
        self->_chromeDeactivationToken = 0;
      }
      else
      {
        if (v27)
        {
          v34 = &stru_1011EB268;
          if (v24)
            v34 = v24;
          *(_DWORD *)buf = 138412290;
          v64 = (const char *)v34;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "CarChromeViewController should be inactive, we are not on-screen (%@)", buf, 0xCu);
        }

        if (self->_chromeDeactivationToken)
          goto LABEL_44;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
        chromeDeactivationToken = v35;
        if (v24)
          v36 = v24;
        else
          v36 = CFSTR("(not actively on screen))");
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "acquireChromeDeactivationTokenForReason:", v36));
        v38 = self->_chromeDeactivationToken;
        self->_chromeDeactivationToken = v37;

      }
LABEL_44:

      goto LABEL_45;
    }
    v56 = sub_1004318FC();
    v57 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("updateForCurrentScreen called off main thread, will attempt to reroute")));
      *(_DWORD *)buf = 136316162;
      v64 = "-[CarDisplayController _updateForCurrentScreen]";
      v65 = 2080;
      v66 = "CarDisplayController.m";
      v67 = 1024;
      v68 = 1276;
      v69 = 2080;
      v70 = "isMainThread";
      v71 = 2112;
      v72 = v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v59 = sub_1004318FC();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v61 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v64 = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    -[CarDisplayController _setNeedsScreenUpdate](self, "_setNeedsScreenUpdate");
  }
}

- (BOOL)isCurrentlyConnectedToAnyCarScene
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarSessionController sharedInstance](CarSessionController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sessionObservers"));
  v5 = objc_msgSend(v4, "count");

  return (v5 != (id)1 || (id)-[CarDisplayController state](self, "state") != (id)1) && v5 != 0;
}

- (BOOL)isCurrentlyConnectedToCarAppScene
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));
  v3 = v2 != 0;

  return v3;
}

- (void)setWasConnectedToAnyCarScene:(BOOL)a3
{
  id v4;

  if (self->_wasConnectedToAnyCarScene != a3)
  {
    self->_wasConnectedToAnyCarScene = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarDisplayController delegate](self, "delegate"));
    objc_msgSend(v4, "carDisplayControllerDidUpdateNavigationVisibility:", self);

  }
}

- (void)_carSessionController_updateNavigationHostingState
{
  _BOOL8 v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = -[CarDisplayController isAnyCarSceneHostingNavigation](self, "isAnyCarSceneHostingNavigation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  if (v3 != objc_msgSend(v4, "carPlayIsNavigating"))
  {
    objc_msgSend(v4, "setCarPlayIsNavigating:", v3);
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notify delegate: didUpdateNavigationVisibility", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController delegate](self, "delegate"));
    objc_msgSend(v7, "carDisplayControllerDidUpdateNavigationVisibility:", self);

  }
  -[CarDisplayController _updateIOHIDMonitoringAndNotification](self, "_updateIOHIDMonitoringAndNotification");

}

- (void)_mapsCar_scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  -[CarDisplayController setWindowScene:](self, "setWindowScene:", v6);
  -[CarDisplayController prepareCarPlay](self, "prepareCarPlay");
  -[CarDisplayController _prepareChromeForFirstUse](self, "_prepareChromeForFirstUse");
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));

  -[CarDisplayController _screenDidConnect:](self, "_screenDidConnect:", v7);
}

- (void)_mapsCar_rebuildContextsForCurrentAppState
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController contextsForCurrentAppState](self, "contextsForCurrentAppState"));
  objc_msgSend(v3, "setContexts:animated:completion:", v4, 0, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateComponent:animated:", CFSTR("accessories"), 0);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint8_t buf[4];
  __CFString *v17;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));

  if (v5 != v4)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    v8 = v4;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] will enter foreground", buf, 0xCu);

    goto LABEL_13;
  }
  -[CarDisplayController _willEnterForeground](self, "_willEnterForeground");
LABEL_14:

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint8_t buf[4];
  __CFString *v17;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));

  if (v5 != v4)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    v8 = v4;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] did become active", buf, 0xCu);

    goto LABEL_13;
  }
  -[CarDisplayController _didBecomeActive](self, "_didBecomeActive");
LABEL_14:

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint8_t buf[4];
  __CFString *v17;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));

  if (v5 != v4)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    v8 = v4;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] will resign active", buf, 0xCu);

    goto LABEL_13;
  }
  -[CarDisplayController _willResignActive](self, "_willResignActive");
LABEL_14:

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint8_t buf[4];
  __CFString *v17;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarDisplayController windowScene](self, "windowScene"));

  if (v5 != v4)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    v8 = v4;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] did enter background", buf, 0xCu);

    goto LABEL_13;
  }
  -[CarDisplayController _didEnterBackground](self, "_didEnterBackground");
LABEL_14:

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CarDisplayController setWindowScene:](self, "setWindowScene:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));

  -[CarDisplayController _screenDidDisconnect:](self, "_screenDidDisconnect:", v5);
}

- (BOOL)supportsInteractionModels:(unint64_t)a3
{
  return (-[CarDisplayController supportedInteractionModels](self, "supportedInteractionModels") & a3) != 0;
}

- (int64_t)interactionModel
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  id v8;
  int64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));
  v4 = -[CarDisplayController primaryInteractionModel](self, "primaryInteractionModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_capabilityForKey:", _UIScreenCapabilityTouchLevelsKey));
  v6 = objc_msgSend(v5, "integerValue");

  if (v4 <= 1)
    v7 = 1;
  else
    v7 = v4;
  if (v4)
    v8 = v6;
  else
    v8 = 0;
  if ((v7 & 1) == 0 || v8)
  {
    if ((v7 & 1) != 0 && v8 == (id)1)
    {
      v9 = 2;
    }
    else if ((v7 & 2) != 0)
    {
      v9 = 3;
    }
    else
    {
      v9 = (v7 >> 1) & 4;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (unint64_t)primaryInteractionModel
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = objc_msgSend(v3, "primaryInteractionModel");

  return (unint64_t)v4;
}

- (unint64_t)supportedInteractionModels
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = objc_msgSend(v3, "interactionModel");

  return (unint64_t)v4;
}

- (BOOL)supportsTouchInteractionModel
{
  return -[CarDisplayController supportsInteractionModels:](self, "supportsInteractionModels:", 1);
}

- (BOOL)supportsFocusInteractionModel
{
  return -[CarDisplayController supportsInteractionModels:](self, "supportsInteractionModels:", 10);
}

- (int64_t)touchscreenFidelity
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController screen](self, "screen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_capabilityForKey:", _UIScreenCapabilityTouchLevelsKey));
  v4 = objc_msgSend(v3, "integerValue");

  return (int64_t)v4;
}

+ (unint64_t)maximumListLength
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v3 = objc_msgSend(v2, "limitLongLists");

  if (v3)
    return 12;
  else
    return -1;
}

- (int64_t)connectionType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v3 = objc_msgSend(v2, "connectionType");

  return (int64_t)v3;
}

- (BOOL)_shouldSendEvent:(id)a3 toCarDisplayWindow:(id)a4
{
  id v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v5 = a3;
  v6 = 1;
  switch((unint64_t)objc_msgSend(v5, "type"))
  {
    case 0uLL:
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allTouches"));
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (!v8)
        goto LABEL_28;
      v9 = v8;
      v10 = *(_QWORD *)v28;
      while (1)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "type") == (id)1)
            goto LABEL_26;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        v6 = 1;
        if (!v9)
          goto LABEL_28;
      }
    case 3uLL:
      v12 = v5;
      v13 = objc_opt_class(UIPressesEvent);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        v14 = v12;
      else
        v14 = 0;
      v7 = v14;

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allPresses", 0));
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (!v16)
        goto LABEL_22;
      v17 = v16;
      v18 = *(_QWORD *)v24;
      break;
    case 6uLL:
      goto LABEL_27;
    case 7uLL:
      if (((unint64_t)objc_msgSend(v5, "subtype") & 0xFFFFFFFFFFFFFFFELL) != 0xC8)
        goto LABEL_29;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
      v6 = objc_msgSend(v20, "_shouldAllowKnobFocusMovement");

      goto LABEL_27;
    default:
      goto LABEL_29;
  }
  while (2)
  {
    for (j = 0; j != v17; j = (char *)j + 1)
    {
      if (*(_QWORD *)v24 != v18)
        objc_enumerationMutation(v15);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j), "type") == (id)4)
      {

LABEL_26:
        v6 = 1;
LABEL_27:
        v7 = (id)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
        objc_msgSend(v7, "interruptAutohideForIncidentalInteraction");
        goto LABEL_28;
      }
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
      continue;
    break;
  }
LABEL_22:

  v6 = 1;
LABEL_28:

LABEL_29:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v21, "restartAutohideIdleTimerIfStarted");

  return v6;
}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C13ECC;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)processItem:(id)a3 userInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  v20 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v20));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completion"));

    if (v8)
      v9 = 12;
    else
      v9 = 6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v10, CFSTR("Source")));

    v12 = objc_opt_class(AddressBookAddress);
    if ((objc_opt_isKindOfClass(v20, v12) & 1) != 0)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("CreateHistoryEntry"));
    }
    else
    {
      v13 = objc_opt_class(CRRecentContact);
      if ((objc_opt_isKindOfClass(v20, v13) & 1) != 0)
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("CreateHistoryEntry"));
        v14 = v20;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
        objc_msgSend(v15, "recordCoreRecentContact:", v14);

      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userTypedSearchString")));
    objc_msgSend(v7, "setUserTypedStringForRAP:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v18 = objc_msgSend(v11, "copy");
    v19 = objc_msgSend(v17, "processSearchFieldItem:searchInfo:userInfo:", v7, 0, v18);

  }
}

- (id)processSearchFieldItem:(id)a3 searchInfo:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  SearchSession *searchSession;
  id v12;
  uint64_t v13;
  SearchSession *v14;
  SearchSession *v15;
  void *v16;
  SearchSession *v17;
  SearchSession *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  SearchSession *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  SearchSession *v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  searchSession = self->_searchSession;
  if (!searchSession
    || (id)-[SearchSession origin](searchSession, "origin") != (id)1
    || (v12 = objc_msgSend(v9, "shouldPreserveResults"), (v12 & 1) == 0))
  {
    -[SearchSession removeObserver:](self->_searchSession, "removeObserver:", self);
    -[SearchSession invalidate](self->_searchSession, "invalidate");
    v14 = self->_searchSession;
    self->_searchSession = 0;

  }
  if (v8)
  {
    if (!self->_searchSession)
    {
      v15 = [SearchSession alloc];
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LowFuel")));
      v17 = -[SearchSession initWithOrigin:options:](v15, "initWithOrigin:options:", 1, v16 != 0);
      v18 = self->_searchSession;
      self->_searchSession = v17;

      -[SearchSession addObserver:](self->_searchSession, "addObserver:", self);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentTraits"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v22 = objc_msgSend(v21, "isInNavigatingState");

      if (v22)
        v23 = 2;
      else
        v23 = 0;
      objc_msgSend(v20, "setSearchOriginationType:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SAROtherEVStationRequest")));

      if (v24)
      {
        objc_msgSend(v20, "setSearchOriginationType:", 3);
        v25 = objc_alloc_init((Class)GEOSearchImplicitFilterInfo);
        objc_msgSend(v25, "setSearchImplicitType:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SARImplicitRequestMUID")));
        objc_msgSend(v25, "setSearchAlongRouteMuid:", objc_msgSend(v26, "unsignedLongLongValue"));

        objc_msgSend(v20, "setSearchImplicitFilterInfo:", v25);
      }
      objc_msgSend(v20, "useOnlineToOfflineFailoverRequestModeIfAllowed");
      -[SearchSession setTraits:](self->_searchSession, "setTraits:", v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Source")));
      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Source")));
        v29 = (uint64_t)objc_msgSend(v28, "integerValue");

      }
      else
      {
        v29 = 6;
      }

      -[SearchSession setSource:](self->_searchSession, "setSource:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CreateHistoryEntry")));
      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CreateHistoryEntry")));
        v33 = (uint64_t)objc_msgSend(v32, "BOOLValue");

      }
      else
      {
        v33 = 1;
      }

      -[SearchSession setShouldCreateHistoryEntry:](self->_searchSession, "setShouldCreateHistoryEntry:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ShouldBroadcast")));

      if (v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ShouldBroadcast")));
        -[SearchSession setShouldBroadcast:](self->_searchSession, "setShouldBroadcast:", objc_msgSend(v35, "BOOLValue"));

      }
    }
    if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v12, v13))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v37 = objc_msgSend(v36, "isInNavigatingState");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession traits](self->_searchSession, "traits"));
      objc_msgSend(v38, "setNavigating:", v37);

    }
    v39 = self->_searchSession;
    if (v9)
      -[SearchSession restoreSearchForItem:withResults:](v39, "restoreSearchForItem:withResults:", v8, v9);
    else
      -[SearchSession startSearch:](v39, "startSearch:", v8);
    v30 = self->_searchSession;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (void)_searchSessionWillStart:(id)a3
{
  SearchSession *v4;
  SearchSession *v5;
  id v6;
  NSObject *v7;
  SearchSession *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;

  v4 = (SearchSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = v4;
  if (v4 && self->_searchSession != v4 && (id)-[SearchSession origin](v4, "origin") != (id)1)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      -[SearchSession addObserver:](v5, "addObserver:", self);
      objc_storeStrong((id *)&self->_searchSession, v5);
      goto LABEL_12;
    }
    v8 = v5;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

    *(_DWORD *)buf = 138412290;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    goto LABEL_11;
  }
LABEL_12:

}

- (void)searchSessionDidChangeSearchFieldItem:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSString *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v4;
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
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
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138412546;
    v18 = v14;
    v19 = 2112;
    v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);

  }
}

- (void)searchSessionWillPerformSearch:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSString *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v4;
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
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
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138412546;
    v18 = v14;
    v19 = 2112;
    v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);

  }
}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentResultsSearchInfo"));
  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v4;
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
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performSelector:", "accessibilityIdentifier"));
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
    v16 = NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
    *(_DWORD *)buf = 138412802;
    v21 = v15;
    v22 = 2112;
    v23 = v17;
    v24 = 2048;
    v25 = objc_msgSend(v18, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ %@ Did receive %lu search results", buf, 0x20u);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v19, "displaySearchSession:", v4);

}

- (void)refreshedEVChargersReceieved:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Did receive the search results to update the ev charger information. Results: %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contexts"));
  objc_msgSend(v7, "refreshSessionWithEVResults:contexts:", v4, v9);

}

- (void)searchSessionDidFail:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v4 = a3;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    goto LABEL_11;
  v7 = v4;
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
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
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
  v15 = NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastError"));
  *(_DWORD *)buf = 138412802;
  v28 = v14;
  v29 = 2112;
  v30 = v16;
  v31 = 2112;
  v32 = v17;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ error=(%@)", buf, 0x20u);

LABEL_11:
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "domain"));
  v20 = GEOErrorDomain(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = objc_msgSend(v19, "isEqualToString:", v21);

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v23, "displaySearchSession:", v4);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));
    v25 = sub_100C150AC(v24, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    objc_msgSend(v23, "interruptApplicationWithKind:userInfo:completionHandler:", 3, v26, 0);

  }
}

- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4
{
  SearchSession *v5;
  id v6;
  NSObject *v7;
  SearchSession *v8;
  SearchSession *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  SearchSession *searchSession;
  uint8_t buf[4];
  __CFString *v21;

  v5 = (SearchSession *)a3;
  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v5;
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
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
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
    *(_DWORD *)buf = 138412290;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  if (self->_searchSession == v5)
  {
    if ((id)-[SearchSession origin](v5, "origin") != (id)1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v17 = objc_msgSend(v16, "isInNavigatingState");

      if ((v17 & 1) == 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
        objc_msgSend(v18, "endSearchSession:", v5);

      }
    }
    searchSession = self->_searchSession;
    self->_searchSession = 0;

  }
}

- (CarRouteGeniusManager)routeGeniusManager
{
  CarRouteGeniusManager *routeGeniusManager;
  CarRouteGeniusManager *v4;
  CarRouteGeniusManager *v5;

  routeGeniusManager = self->_routeGeniusManager;
  if (!routeGeniusManager)
  {
    v4 = objc_alloc_init(CarRouteGeniusManager);
    v5 = self->_routeGeniusManager;
    self->_routeGeniusManager = v4;

    routeGeniusManager = self->_routeGeniusManager;
  }
  return routeGeniusManager;
}

- (GuidanceObserver)guidanceObserver
{
  GuidanceObserver *guidanceObserver;
  GuidanceObserver *v4;
  GuidanceObserver *v5;

  guidanceObserver = self->_guidanceObserver;
  if (!guidanceObserver)
  {
    v4 = objc_alloc_init(GuidanceObserver);
    v5 = self->_guidanceObserver;
    self->_guidanceObserver = v4;

    guidanceObserver = self->_guidanceObserver;
  }
  return guidanceObserver;
}

- (void)_updateIOHIDMonitoringAndNotification
{
  unsigned int v3;
  id externalDeviceRepeatGuidanceObserver;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];
  id location[2];

  v3 = -[CarDisplayController isAnyCarSceneHostingNavigation](self, "isAnyCarSceneHostingNavigation");
  externalDeviceRepeatGuidanceObserver = self->_externalDeviceRepeatGuidanceObserver;
  if (v3)
  {
    if (!externalDeviceRepeatGuidanceObserver)
    {
      objc_initWeak(location, self);
      v5 = sub_10043364C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registering for External Device notifications to repeat current guidance", buf, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100C15CD8;
      v18[3] = &unk_1011AD288;
      objc_copyWeak(&v19, location);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", CFSTR("MapsExternalDeviceRepeatNavigationInstructionNotification"), v8, v9, v18));
      v11 = self->_externalDeviceRepeatGuidanceObserver;
      self->_externalDeviceRepeatGuidanceObserver = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
      objc_msgSend(v12, "startMonitoringIOHIDRepeatCurrentGuidance");

      objc_destroyWeak(&v19);
      objc_destroyWeak(location);
    }
  }
  else if (externalDeviceRepeatGuidanceObserver)
  {
    v13 = sub_10043364C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unregistering from External Device notifications to repeat current guidance", (uint8_t *)location, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    objc_msgSend(v15, "stopMonitoringIOHIDRepeatCurrentGuidance");

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "removeObserver:", self->_externalDeviceRepeatGuidanceObserver);

    v17 = self->_externalDeviceRepeatGuidanceObserver;
    self->_externalDeviceRepeatGuidanceObserver = 0;

  }
}

- (void)_repeatGuidanceForExternalDevice
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v2, "isInNavigatingState");

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Repeating current guidance for external device", buf, 2u);
    }

    v6 = objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    -[NSObject repeatCurrentGuidance:](v6, "repeatCurrentGuidance:", 0);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Asked to repeat current guidance, but guidance is not running", v7, 2u);
  }

}

- (void)detourToMapItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
  v16 = (id)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v5));

  v6 = objc_msgSend(objc_alloc((Class)GEOComposedWaypoint), "initWithMapItem:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrivalInfo"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "route"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v8, "legIndex")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pointOfInterestCategory"));
  if (!objc_msgSend(v13, "isEqualToString:", MKPointOfInterestCategoryEVCharger)
    || (objc_msgSend(v8, "isInArrivalState") & 1) == 0
    && (objc_msgSend(v8, "isInParkingState") & 1) == 0)
  {

    goto LABEL_7;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chargingStationInfo"));

  if (!v14)
  {
LABEL_7:
    -[CarDisplayController detourToWaypoint:](self, "detourToWaypoint:", v6);
    goto LABEL_8;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destination"));
  -[CarDisplayController detourToWaypoint:replacingWaypoint:](self, "detourToWaypoint:replacingWaypoint:", v6, v15);

LABEL_8:
}

- (void)detourToWaypoint:(id)a3
{
  -[CarDisplayController detourToWaypoint:replacingWaypoint:](self, "detourToWaypoint:replacingWaypoint:", a3, 0);
}

- (void)detourToWaypoint:(id)a3 replacingWaypoint:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;

  v6 = a3;
  v7 = a4;
  if (-[CarDisplayController isCarAppSceneHostingNavigation](self, "isCarAppSceneHostingNavigation"))
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100C164E0;
    v39[3] = &unk_1011AC860;
    v39[4] = self;
    v8 = objc_retainBlock(v39);
    if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v8, v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController platformController](self, "platformController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentNavigationSession"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "waypointController"));

      if (v12)
      {
        v13 = sub_10043364C();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
        if (v7)
        {
          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
            *(_DWORD *)buf = 138412546;
            v41 = v16;
            v42 = 2112;
            v43 = v17;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[MPR] replacing waypoint %@ with %@", buf, 0x16u);

          }
          objc_msgSend(v12, "replaceWaypoint:with:", v7, v6);
        }
        else
        {
          if (v15)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
            *(_DWORD *)buf = 138412290;
            v41 = v36;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[MPR] inserting new waypoint %@", buf, 0xCu);

          }
          objc_msgSend(v12, "insertWaypoint:", v6);
        }
      }
      else
      {
        v34 = sub_10043364C();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "Failed to access nav waypoint controller in CarDisplayController", buf, 2u);
        }

      }
      ((void (*)(_QWORD *))v8[2])(v8);
    }
    else
    {
      v21 = sub_10043364C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
        *(_DWORD *)buf = 138412290;
        v41 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "MPR is not enabled, will replace destination with %@", buf, 0xCu);

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      objc_msgSend(v24, "updateDestination:", v6);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController platformController](self, "platformController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "auxiliaryTasksManager"));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "routePlanningSessionRouteLoadedNotifier"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "currentRouteHistoryEntry"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "historyEntry"));
      v29 = v28 == 0;

      v30 = sub_10043364C();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      v32 = v31;
      if (v29)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to interrupt route, because the history was nil", buf, 2u);
        }

      }
      else
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController mapsSuggestionsController](self, "mapsSuggestionsController"));
          *(_DWORD *)buf = 138412546;
          v41 = v27;
          v42 = 2112;
          v43 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Will interrupt route with history entry: %@, hinting refresh on engine: %@.", buf, 0x16u);

        }
        objc_initWeak((id *)buf, self);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100C16604;
        v37[3] = &unk_1011E0558;
        objc_copyWeak(&v38, (id *)buf);
        objc_msgSend(v27, "setNavigationInterrupted:completion:", 1, v37);
        objc_destroyWeak(&v38);
        objc_destroyWeak((id *)buf);
      }
      ((void (*)(_QWORD *))v8[2])(v8);

    }
  }
  else
  {
    v18 = sub_10043364C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortDescription"));
      *(_DWORD *)buf = 138412290;
      v41 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Dropping detour request to mapItem: %@", buf, 0xCu);

    }
  }

}

- (BOOL)isCarAppSceneHostingNavigation
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = -[CarDisplayController isCurrentlyConnectedToCarAppScene](self, "isCurrentlyConnectedToCarAppScene");
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CarDisplayController platformController](self, "platformController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4, "currentSession"));

    v6 = objc_opt_class(NavigationSession);
    LOBYTE(v4) = objc_opt_isKindOfClass(v5, v6);

    LOBYTE(v3) = v4 & (v5 != 0);
  }
  return v3;
}

- (BOOL)isAnyCarSceneHostingNavigation
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = -[CarDisplayController isCurrentlyConnectedToAnyCarScene](self, "isCurrentlyConnectedToAnyCarScene");
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CarDisplayController platformController](self, "platformController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4, "currentSession"));

    v6 = objc_opt_class(NavigationSession);
    LOBYTE(v4) = objc_opt_isKindOfClass(v5, v6);

    LOBYTE(v3) = v4 & (v5 != 0);
  }
  return v3;
}

- (BOOL)isAnyCarSceneHostingDrivingNavigation
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v3 = -[CarDisplayController isAnyCarSceneHostingNavigation](self, "isAnyCarSceneHostingNavigation");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController platformController](self, "platformController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));

    v6 = objc_opt_class(NavigationSession);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

    v9 = objc_msgSend(v8, "currentTransportType");
    LOBYTE(v3) = v9 == (id)1;
  }
  return v3;
}

- (void)_startObservingSharedAppState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t v9[16];

  if (!self->_observingMapsAppState)
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will start observing shared app state (SearchSession, PlatformController)", v9, 2u);
    }

    self->_observingMapsAppState = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarSessionController sharedInstance](CarSessionController, "sharedInstance"));
    objc_msgSend(v5, "addObserver:", self);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
    objc_msgSend(v6, "addAttachmentProvider:", self);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "_searchSessionWillStart:", CFSTR("SearchSessionWillStart"), 0);

    v8 = -[CarDisplayController guidanceObserver](self, "guidanceObserver");
  }
}

- (void)_stopObservingSharedAppState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  SearchSession *searchSession;
  void *v8;
  uint8_t v9[16];

  if (self->_observingMapsAppState)
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will stop observing shared app state (SearchSession, PlatformController)", v9, 2u);
    }

    self->_observingMapsAppState = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SearchSessionWillStart"), 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
    objc_msgSend(v6, "removeAttachmentProvider:", self);

    -[SearchSession removeObserver:](self->_searchSession, "removeObserver:", self);
    searchSession = self->_searchSession;
    self->_searchSession = 0;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarSessionController sharedInstance](CarSessionController, "sharedInstance"));
    objc_msgSend(v8, "removeObserver:", self);

  }
}

- (void)_prepareNearby
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));

  if (!v2)
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will prepare Nearby for CarPlay", v5, 2u);
    }

    +[CarSearchCategoriesModeController prepareNearby](CarSearchCategoriesModeController, "prepareNearby");
  }
}

- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD *v13;
  id v14;
  id queuedInterruptionHandler;
  NSDictionary *v16;
  NSDictionary *queuedInterruptionUserInfo;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;

  v8 = a4;
  v9 = a5;
  if (-[CarDisplayController isCurrentlyConnectedToCarAppScene](self, "isCurrentlyConnectedToCarAppScene")
    && -[CarDisplayController isChromeAvailable](self, "isChromeAvailable"))
  {
    v10 = sub_10043364C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will present interruption immediately in CarChromeViewController", buf, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController"));
    v13 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentInterruptionOfKind:userInfo:completionHandler:", a3, v8, v9));

  }
  else
  {
    v14 = objc_msgSend(v9, "copy");
    queuedInterruptionHandler = self->_queuedInterruptionHandler;
    self->_queuedInterruptionHandler = v14;

    v16 = (NSDictionary *)objc_msgSend(v8, "copy");
    queuedInterruptionUserInfo = self->_queuedInterruptionUserInfo;
    self->_queuedInterruptionUserInfo = v16;

    self->_queuedInterruptionKind = a3;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    objc_storeStrong((id *)&self->_queuedInterruptionKey, v18);
    v19 = sub_10043364C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will queue interruption, chrome not available (key:%@)", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100C16C58;
    v23[3] = &unk_1011C1868;
    v24 = v18;
    v21 = v18;
    objc_copyWeak(&v25, (id *)buf);
    v13 = objc_retainBlock(v23);
    objc_destroyWeak(&v25);

    objc_destroyWeak((id *)buf);
  }

  return v13;
}

- (void)_presentQueuedInterruptionIfNeeded
{
  int64_t queuedInterruptionKind;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSUUID *v7;
  NSUUID *v8;
  id v9;
  id v10;
  void ***v11;
  void *v12;
  void *v13;
  id v14;
  id queuedInterruptionDismissalBlock;
  id queuedInterruptionHandler;
  NSDictionary *queuedInterruptionUserInfo;
  id v18;
  const char *v19;
  id v20;
  NSObject *v21;
  uint32_t v22;
  NSUUID *queuedInterruptionKey;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  CarDisplayController *v28;
  NSObject *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  NSUUID *v33;

  if (!self->_queuedInterruptionKey)
  {
    v18 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v19 = "Will not present queued interruption, we don't have one";
    goto LABEL_11;
  }
  if (!-[CarDisplayController isChromeAvailable](self, "isChromeAvailable"))
  {
    v20 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v19 = "Will not present queued interruption, no chrome available";
LABEL_11:
    v21 = v5;
    v22 = 2;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v19, buf, v22);
    goto LABEL_13;
  }
  queuedInterruptionKind = self->_queuedInterruptionKind;
  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!queuedInterruptionKind)
  {
    if (!v6)
      goto LABEL_13;
    queuedInterruptionKey = self->_queuedInterruptionKey;
    *(_DWORD *)buf = 138412290;
    v33 = queuedInterruptionKey;
    v19 = "Will not present queued interruption, it's already been presented (key:%@)";
    v21 = v5;
    v22 = 12;
    goto LABEL_12;
  }
  if (v6)
  {
    v7 = self->_queuedInterruptionKey;
    *(_DWORD *)buf = 138412290;
    v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will present queued interruption (key:%@)", buf, 0xCu);
  }

  v8 = self->_queuedInterruptionKey;
  objc_initWeak((id *)buf, self);
  v9 = objc_msgSend(self->_queuedInterruptionHandler, "copy");
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_100C16FE0;
  v27 = &unk_1011E9408;
  v10 = v9;
  v30 = v10;
  v28 = self;
  objc_copyWeak(&v31, (id *)buf);
  v5 = v8;
  v29 = v5;
  v11 = objc_retainBlock(&v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController chromeViewController](self, "chromeViewController", v24, v25, v26, v27, v28));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentInterruptionOfKind:userInfo:completionHandler:", self->_queuedInterruptionKind, self->_queuedInterruptionUserInfo, v11));
  v14 = objc_msgSend(v13, "copy");
  queuedInterruptionDismissalBlock = self->_queuedInterruptionDismissalBlock;
  self->_queuedInterruptionDismissalBlock = v14;

  self->_queuedInterruptionKind = 0;
  queuedInterruptionHandler = self->_queuedInterruptionHandler;
  self->_queuedInterruptionHandler = 0;

  queuedInterruptionUserInfo = self->_queuedInterruptionUserInfo;
  self->_queuedInterruptionUserInfo = 0;

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
LABEL_13:

}

- (void)_removeQueuedInterruptionWithKey:(id)a3
{
  -[CarDisplayController _removeQueuedInterruptionWithKey:animated:](self, "_removeQueuedInterruptionWithKey:animated:", a3, 1);
}

- (void)_removeQueuedInterruptionWithKey:(id)a3 animated:(BOOL)a4
{
  NSUUID *v5;
  unsigned int v6;
  id v7;
  NSObject *queuedInterruptionDismissalBlock;
  _BOOL4 v9;
  NSUUID *queuedInterruptionKey;
  id queuedInterruptionHandler;
  NSDictionary *queuedInterruptionUserInfo;
  id v13;
  NSObject *v14;
  NSUUID *v15;
  int v16;
  NSUUID *v17;
  __int16 v18;
  NSUUID *v19;

  v5 = (NSUUID *)a3;
  v6 = -[NSUUID isEqual:](self->_queuedInterruptionKey, "isEqual:", v5);
  v7 = sub_10043364C();
  queuedInterruptionDismissalBlock = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(queuedInterruptionDismissalBlock, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, queuedInterruptionDismissalBlock, OS_LOG_TYPE_DEFAULT, "Will remove queued interruption (key:%@)", (uint8_t *)&v16, 0xCu);
    }

    queuedInterruptionKey = self->_queuedInterruptionKey;
    self->_queuedInterruptionKey = 0;

    queuedInterruptionHandler = self->_queuedInterruptionHandler;
    self->_queuedInterruptionHandler = 0;

    queuedInterruptionUserInfo = self->_queuedInterruptionUserInfo;
    self->_queuedInterruptionKind = 0;
    self->_queuedInterruptionUserInfo = 0;

    if (self->_queuedInterruptionDismissalBlock)
    {
      v13 = sub_10043364C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Will fire interruption's dismissal block (key:%@)", (uint8_t *)&v16, 0xCu);
      }

      (*((void (**)(void))self->_queuedInterruptionDismissalBlock + 2))();
      queuedInterruptionDismissalBlock = self->_queuedInterruptionDismissalBlock;
    }
    else
    {
      queuedInterruptionDismissalBlock = 0;
    }
    self->_queuedInterruptionDismissalBlock = 0;
  }
  else if (v9)
  {
    v15 = self->_queuedInterruptionKey;
    v16 = 138412546;
    v17 = v15;
    v18 = 2112;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, queuedInterruptionDismissalBlock, OS_LOG_TYPE_DEFAULT, "Will not remove queued interruption, (current key:%@, passed key:%@)", (uint8_t *)&v16, 0x16u);
  }

}

- (void)didFinishLaunchingSuspendedWithOptions:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  __CFString *v12;

  if (-[CarDisplayController hasMapsSuggestionsController](self, "hasMapsSuggestionsController", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v5 = objc_msgSend(v4, "needsFuel");

    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = CFSTR("NO");
      if (v5)
        v8 = CFSTR("YES");
      v9 = v8;
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "launched suspended, needsFuel=%@", (uint8_t *)&v11, 0xCu);

    }
    if (v5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController mapsSuggestionsController](self, "mapsSuggestionsController"));
      objc_msgSend(v10, "setHoldProcessAssertion:", 1);

    }
  }
}

+ (void)launchPerformanceSetup
{
  if (qword_1014D4488 != -1)
    dispatch_once(&qword_1014D4488, &stru_1011E9428);
}

+ (BOOL)debugLaunchPerformance
{
  +[CarDisplayController launchPerformanceSetup](CarDisplayController, "launchPerformanceSetup");
  return byte_1014D4490;
}

+ (double)debugLaunchPerformanceDelay
{
  +[CarDisplayController launchPerformanceSetup](CarDisplayController, "launchPerformanceSetup");
  return *(double *)&qword_1014BBB60;
}

- (BOOL)overrideShouldSuppressChrome
{
  return byte_1014D4491;
}

- (void)setOverrideShouldSuppressChrome:(BOOL)a3
{
  -[CarDisplayController _setOverrideShouldSuppressChrome:refreshScreenConnection:](self, "_setOverrideShouldSuppressChrome:refreshScreenConnection:", a3, 1);
}

- (void)_setOverrideShouldSuppressChrome:(BOOL)a3 refreshScreenConnection:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;

  v4 = a4;
  v5 = a3;
  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    v10 = v9;
    v11 = 138412290;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v11, 0xCu);

  }
  byte_1014D4491 = v5;
  if (v4)
    -[CarDisplayController _setNeedsScreenUpdate](self, "_setNeedsScreenUpdate");
}

- (void)_registerCarInfoForGEOLogging
{
  void *v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  void *v8;
  __int16 v9;
  uint8_t buf[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarDisplayController connectedCarMainScreenInfo](self, "connectedCarMainScreenInfo"));
  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v5)
    {
      v9 = 0;
      v6 = "Will register all CarPlay screen traits for analytics";
      v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v6 = "Will register for analytics that we do not have a current CarPlay screen";
    v7 = buf;
    goto LABEL_6;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v8, "setCarPlayInfo:", v2);

}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C177FC;
  block[3] = &unk_1011AECC0;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (void)setGuidanceObserver:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceObserver, a3);
}

- (void)setRouteGeniusManager:(id)a3
{
  objc_storeStrong((id *)&self->_routeGeniusManager, a3);
}

- (CarDisplayDelegate)delegate
{
  return (CarDisplayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (CarDisplayWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (CGSize)screenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_screenSize.width;
  height = self->_screenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (SearchSession)searchSession
{
  return self->_searchSession;
}

- (CarChromeViewController)chromeViewController
{
  return self->_chromeViewController;
}

- (void)setChromeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_chromeViewController, a3);
}

- (CarClusterSuggestionController)clusterSuggestionController
{
  return self->_clusterSuggestionController;
}

- (void)setClusterSuggestionController:(id)a3
{
  objc_storeStrong((id *)&self->_clusterSuggestionController, a3);
}

- (CARSessionStatus)carSessionStatus
{
  return self->_carSessionStatus;
}

- (void)setCarSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_carSessionStatus, a3);
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_windowScene, a3);
}

- (NSDate)backgroundAutoHideStateTrackingDate
{
  return self->_backgroundAutoHideStateTrackingDate;
}

- (void)setBackgroundAutoHideStateTrackingDate:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundAutoHideStateTrackingDate, a3);
}

- (BOOL)wasConnectedToAnyCarScene
{
  return self->_wasConnectedToAnyCarScene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAutoHideStateTrackingDate, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_clusterSuggestionController, 0);
  objc_storeStrong((id *)&self->_chromeViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeGeniusManager, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsController, 0);
  objc_storeStrong((id *)&self->_signalPackQueue, 0);
  objc_storeStrong((id *)&self->_signalPack, 0);
  objc_storeStrong((id *)&self->_donater, 0);
  objc_storeStrong((id *)&self->_queuedInterruptionKey, 0);
  objc_storeStrong(&self->_queuedInterruptionDismissalBlock, 0);
  objc_storeStrong(&self->_queuedInterruptionHandler, 0);
  objc_storeStrong((id *)&self->_queuedInterruptionUserInfo, 0);
  objc_storeStrong((id *)&self->_nightModeToggleGesture, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_arrivalResetTimer, 0);
  objc_storeStrong((id *)&self->_simulationAlertController, 0);
  objc_storeStrong(&self->_externalDeviceRepeatGuidanceObserver, 0);
  objc_storeStrong((id *)&self->_dateOfLastScreenUpdate, 0);
  objc_destroyWeak((id *)&self->_screenUpdateOperation);
  objc_storeStrong(&self->_chromeDeactivationToken, 0);
  objc_storeStrong((id *)&self->_idleTimeoutAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_HIDEventObserver, 0);
}

@end
