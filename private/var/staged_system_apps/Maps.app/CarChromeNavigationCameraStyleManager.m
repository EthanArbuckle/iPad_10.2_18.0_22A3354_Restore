@implementation CarChromeNavigationCameraStyleManager

+ (CarChromeNavigationCameraStyleManager)sharedInstance
{
  if (qword_1014D3D80 != -1)
    dispatch_once(&qword_1014D3D80, &stru_1011E0DF8);
  return (CarChromeNavigationCameraStyleManager *)(id)qword_1014D3D78;
}

- (CarChromeNavigationCameraStyleManager)init
{
  CarChromeNavigationCameraStyleManager *v2;
  id v3;
  NSObject *v4;
  CarChromeNavigationCameraStyleManager *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CarChromeNavigationCameraStyleManagerObserver *v12;
  CarChromeNavigationCameraStyleManagerObserver *observers;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  CarChromeNavigationCameraStyleManager *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t centerConsoleCameraStyle;
  const __CFString *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const __CFString *v36;

  v32.receiver = self;
  v32.super_class = (Class)CarChromeNavigationCameraStyleManager;
  v2 = -[CarChromeNavigationCameraStyleManager init](&v32, "init");
  if (v2)
  {
    v3 = sub_100A6B8C0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    v5 = v2;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
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
    v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Initializing", buf, 0xCu);

LABEL_9:
    v12 = (CarChromeNavigationCameraStyleManagerObserver *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___CarChromeNavigationCameraStyleManagerObserver, &_dispatch_main_q);
    observers = v2->_observers;
    v2->_observers = v12;

    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("CarNavigationCameraStyle")));

    if (v16)
      v17 = v16;
    else
      v17 = v14;
    v18 = v17;

    v19 = objc_msgSend(v18, "integerValue");
    -[CarChromeNavigationCameraStyleManager setCenterConsoleCameraStyle:](v2, "setCenterConsoleCameraStyle:", v19);
    v20 = sub_100A6B8C0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      goto LABEL_22;
    v22 = v2;
    v23 = (objc_class *)objc_opt_class(v22);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
      v27 = v26;
      if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

        goto LABEL_18;
      }

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_18:

    centerConsoleCameraStyle = v22->_centerConsoleCameraStyle;
    if (centerConsoleCameraStyle > 4)
      v30 = CFSTR(".Unknown");
    else
      v30 = *(&off_1011E0E38 + centerConsoleCameraStyle);
    *(_DWORD *)buf = 138543618;
    v34 = v28;
    v35 = 2112;
    v36 = v30;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}@] Initializing with camera style: %@", buf, 0x16u);

LABEL_22:
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  CarChromeNavigationCameraStyleManager *v5;
  CarChromeNavigationCameraStyleManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  objc_super v13;
  uint8_t buf[4];
  __CFString *v15;

  v3 = sub_100A6B8C0();
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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Deallocating", buf, 0xCu);

  }
  v13.receiver = self;
  v13.super_class = (Class)CarChromeNavigationCameraStyleManager;
  -[CarChromeNavigationCameraStyleManager dealloc](&v13, "dealloc");
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CarChromeNavigationCameraStyleManager *v7;
  CarChromeNavigationCameraStyleManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  CarChromeNavigationCameraStyleManager *v21;
  CarChromeNavigationCameraStyleManager *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  id v32;

  v4 = a3;
  v5 = sub_100A6B8C0();
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
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
    v30 = v14;
    v31 = 2112;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Registering observer: %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager observers](self, "observers"));
  objc_msgSend(v15, "registerObserver:", v4);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager observers](self, "observers"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObservers"));
  v18 = objc_msgSend(v17, "count");

  if (v18 == (id)1)
  {
    v19 = sub_100A6B8C0();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
LABEL_22:

      -[CarChromeNavigationCameraStyleManager _initialize](self, "_initialize");
      goto LABEL_23;
    }
    v21 = self;
    v22 = v21;
    if (!v21)
    {
      v28 = CFSTR("<nil>");
      goto LABEL_21;
    }
    v23 = (objc_class *)objc_opt_class(v21);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
      v27 = v26;
      if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
      {
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

        goto LABEL_19;
      }

    }
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_19:

LABEL_21:
    *(_DWORD *)buf = 138543362;
    v30 = v28;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}@] Got 1st observer; will initialize now",
      buf,
      0xCu);

    goto LABEL_22;
  }
LABEL_23:

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CarChromeNavigationCameraStyleManager *v7;
  CarChromeNavigationCameraStyleManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  CarChromeNavigationCameraStyleManager *v21;
  CarChromeNavigationCameraStyleManager *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  id v32;

  v4 = a3;
  v5 = sub_100A6B8C0();
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
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
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
    v30 = v14;
    v31 = 2112;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Unregistering observer: %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager observers](self, "observers"));
  objc_msgSend(v15, "unregisterObserver:", v4);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager observers](self, "observers"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObservers"));
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    v19 = sub_100A6B8C0();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
LABEL_22:

      -[CarChromeNavigationCameraStyleManager _teardown](self, "_teardown");
      goto LABEL_23;
    }
    v21 = self;
    v22 = v21;
    if (!v21)
    {
      v28 = CFSTR("<nil>");
      goto LABEL_21;
    }
    v23 = (objc_class *)objc_opt_class(v21);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
      v27 = v26;
      if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
      {
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

        goto LABEL_19;
      }

    }
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_19:

LABEL_21:
    *(_DWORD *)buf = 138543362;
    v30 = v28;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}@] Lost last observer; will tear down now",
      buf,
      0xCu);

    goto LABEL_22;
  }
LABEL_23:

}

- (void)toggleCameraStyle
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  id v6;

  -[CarChromeNavigationCameraStyleManager _toggleCameraStyle](self, "_toggleCameraStyle");
  if (!self->_instrumentClusterSceneCount)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_centerConsoleCameraStyle));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (v6)
    {
      v4 = CFSTR("CarNavigationCameraStyle");
      goto LABEL_7;
    }
    v5 = CFSTR("CarNavigationCameraStyle");
LABEL_11:
    objc_msgSend(v3, "removeObjectForKey:", v5);
    v6 = 0;
    goto LABEL_12;
  }
  if (self->_centerConsoleSceneCount)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_centerConsoleCameraStyle));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (v6)
    {
      v4 = CFSTR("CarNavigationDualDisplayCameraStyle");
LABEL_7:
      objc_msgSend(v3, "setObject:forKey:", v6, v4);
LABEL_12:

      return;
    }
    v5 = CFSTR("CarNavigationDualDisplayCameraStyle");
    goto LABEL_11;
  }
}

- (void)_initialize
{
  void *v3;
  id v4;
  NSObject *v5;
  CarChromeNavigationCameraStyleManager *v6;
  CarChromeNavigationCameraStyleManager *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  unint64_t instrumentClusterSceneCount;
  unint64_t centerConsoleSceneCount;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;

  if (GEOConfigGetBOOL(MapsConfig_InstrumentClusterConnectionCameraStyleToggleEnabled, off_1014B4D48))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "carDisplayConfigDidChangeNotification:", CFSTR("CarDisplayConfigDidChangeNotification"), 0);

    -[CarChromeNavigationCameraStyleManager _updateSceneCounts](self, "_updateSceneCounts");
    v4 = sub_100A6B8C0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      return;
    }
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_9;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_9:

LABEL_11:
    instrumentClusterSceneCount = v7->_instrumentClusterSceneCount;
    centerConsoleSceneCount = v7->_centerConsoleSceneCount;
    *(_DWORD *)buf = 138543874;
    v17 = v13;
    v18 = 2048;
    v19 = instrumentClusterSceneCount;
    v20 = 2048;
    v21 = centerConsoleSceneCount;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Initializing with %lu IC screens & %lu CC screens", buf, 0x20u);

    goto LABEL_12;
  }
}

- (void)_teardown
{
  id v3;
  NSObject *v4;
  CarChromeNavigationCameraStyleManager *v5;
  CarChromeNavigationCameraStyleManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint8_t buf[4];
  __CFString *v15;

  v3 = sub_100A6B8C0();
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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Tearing down", buf, 0xCu);

  }
  self->_hasHadDualDisplayConnected = 0;
  self->_instrumentClusterSceneCount = 0;
  self->_centerConsoleSceneCount = 0;
  self->_centerConsoleDualDisplayCameraStyle = self->_centerConsoleCameraStyle;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "removeObserver:", self);

}

- (void)_toggleCameraStyle
{
  id v3;
  NSObject *v4;
  CarChromeNavigationCameraStyleManager *v5;
  CarChromeNavigationCameraStyleManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  unint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  const __CFString *v18;

  v3 = sub_100A6B8C0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    goto LABEL_14;
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  v13 = -[CarChromeNavigationCameraStyleManager centerConsoleCameraStyle](v6, "centerConsoleCameraStyle");
  if (v13 > 4)
    v14 = CFSTR(".Unknown");
  else
    v14 = *(&off_1011E0E38 + v13);
  *(_DWORD *)buf = 138543618;
  v16 = v12;
  v17 = 2112;
  v18 = v14;
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Toggling camera style from existing style: %@", buf, 0x16u);

LABEL_14:
  -[CarChromeNavigationCameraStyleManager setCenterConsoleCameraStyle:](self, "setCenterConsoleCameraStyle:", -[CarChromeNavigationCameraStyleManager _oppositeCameraStyle:](self, "_oppositeCameraStyle:", -[CarChromeNavigationCameraStyleManager centerConsoleCameraStyle](self, "centerConsoleCameraStyle")));
}

- (int64_t)_oppositeCameraStyle:(int64_t)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2;
}

- (void)setCenterConsoleCameraStyle:(int64_t)a3
{
  id v5;
  NSObject *v6;
  CarChromeNavigationCameraStyleManager *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  NSObject *v16;
  CarChromeNavigationCameraStyleManager *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;

  if (self->_centerConsoleSceneCount && self->_instrumentClusterSceneCount)
  {
    v5 = sub_100A6B8C0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_13:

      self->_centerConsoleDualDisplayCameraStyle = a3;
      goto LABEL_14;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_9;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_9:

    if ((unint64_t)a3 > 4)
      v14 = CFSTR(".Unknown");
    else
      v14 = *(&off_1011E0E38 + a3);
    *(_DWORD *)buf = 138543618;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Updating dual display camera style: %@", buf, 0x16u);

    goto LABEL_13;
  }
LABEL_14:
  if (self->_centerConsoleCameraStyle == a3)
    return;
  v15 = sub_100A6B8C0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = self;
    v18 = (objc_class *)objc_opt_class(v17);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_21;
      }

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_21:

    if ((unint64_t)a3 > 4)
      v24 = CFSTR(".Unknown");
    else
      v24 = *(&off_1011E0E38 + a3);
    *(_DWORD *)buf = 138543618;
    v27 = v23;
    v28 = 2112;
    v29 = v24;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Got new CS camera style style: %@", buf, 0x16u);

  }
  self->_centerConsoleCameraStyle = a3;
  -[CarChromeNavigationCameraStyleManager setInstrumentClusterCameraStyle:](self, "setInstrumentClusterCameraStyle:", -[CarChromeNavigationCameraStyleManager _oppositeCameraStyle:](self, "_oppositeCameraStyle:", a3));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager observers](self, "observers"));
  objc_msgSend(v25, "carChromeNavigationCameraStyleManager:didChangeCenterConsoleCameraStyle:", self, self->_centerConsoleCameraStyle);

}

- (void)setInstrumentClusterCameraStyle:(int64_t)a3
{
  id v5;
  NSObject *v6;
  CarChromeNavigationCameraStyleManager *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;

  if (self->_instrumentClusterCameraStyle != a3)
  {
    v5 = sub_100A6B8C0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      self->_instrumentClusterCameraStyle = a3;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager observers](self, "observers"));
      objc_msgSend(v15, "carChromeNavigationCameraStyleManager:didChangeInstrumentClusterCameraStyle:", self, self->_instrumentClusterCameraStyle);

      return;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    if ((unint64_t)a3 > 4)
      v14 = CFSTR(".Unknown");
    else
      v14 = *(&off_1011E0E38 + a3);
    *(_DWORD *)buf = 138543618;
    v17 = v13;
    v18 = 2112;
    v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Got new IC camera style style: %@", buf, 0x16u);

    goto LABEL_12;
  }
}

- (void)_updateSceneCounts
{
  -[CarChromeNavigationCameraStyleManager setInstrumentClusterSceneCount:](self, "setInstrumentClusterSceneCount:", +[CarDisplayConfigAuxiliaryTask instrumentClusterSceneCount](CarDisplayConfigAuxiliaryTask, "instrumentClusterSceneCount"));
  -[CarChromeNavigationCameraStyleManager setCenterConsoleSceneCount:](self, "setCenterConsoleSceneCount:", +[CarDisplayConfigAuxiliaryTask centerConsoleSceneCount](CarDisplayConfigAuxiliaryTask, "centerConsoleSceneCount"));
  -[CarChromeNavigationCameraStyleManager _updateCameraStyles](self, "_updateCameraStyles");
}

- (void)_updateCameraStyles
{
  unint64_t instrumentClusterSceneCount;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  CarChromeNavigationCameraStyleManager *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  CarChromeNavigationCameraStyleManager *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  const __CFString *v24;
  id v25;
  NSObject *v26;
  CarChromeNavigationCameraStyleManager *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  CarChromeNavigationCameraStyleManager *v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  CarChromeNavigationCameraStyleManager *v52;
  objc_class *v53;
  NSString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  uint64_t Integer;
  id v61;
  NSObject *v62;
  CarChromeNavigationCameraStyleManager *v63;
  objc_class *v64;
  NSString *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  uint64_t v73;

  instrumentClusterSceneCount = self->_instrumentClusterSceneCount;
  if (!self->_centerConsoleSceneCount)
  {
    if (!instrumentClusterSceneCount)
      return;
    v25 = sub_100A6B8C0();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      goto LABEL_27;
    v27 = self;
    v28 = (objc_class *)objc_opt_class(v27);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if ((objc_opt_respondsToSelector(v27, "accessibilityIdentifier") & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v27, "performSelector:", "accessibilityIdentifier"));
      v32 = v31;
      if (v31 && !objc_msgSend(v31, "isEqualToString:", v30))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v30, v27, v32));

        goto LABEL_26;
      }

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v30, v27));
LABEL_26:

    *(_DWORD *)buf = 138543362;
    v71 = v33;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}@] Updating camera style with only IC", buf, 0xCu);

LABEL_27:
    v34 = GEOConfigGetInteger(MapsConfig_CarPlayHybridInstrumentClusterCameraStyleSingleScreenBehavior, off_1014B52B8) == 1;
    goto LABEL_56;
  }
  v4 = sub_100A6B8C0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (!instrumentClusterSceneCount)
  {
    if (!v6)
    {
LABEL_35:

      v42 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("CarNavigationCameraStyle")));

      if (v44)
        v45 = v44;
      else
        v45 = v42;
      v46 = v45;

      v47 = (unint64_t)-[NSObject integerValue](v46, "integerValue");
      goto LABEL_65;
    }
    v35 = self;
    v36 = (objc_class *)objc_opt_class(v35);
    v37 = NSStringFromClass(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    if ((objc_opt_respondsToSelector(v35, "accessibilityIdentifier") & 1) != 0)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v35, "performSelector:", "accessibilityIdentifier"));
      v40 = v39;
      if (v39 && !objc_msgSend(v39, "isEqualToString:", v38))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v38, v35, v40));

        goto LABEL_34;
      }

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v38, v35));
LABEL_34:

    *(_DWORD *)buf = 138543362;
    v71 = v41;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Updating camera style with only CS", buf, 0xCu);

    goto LABEL_35;
  }
  if (!v6)
    goto LABEL_10;
  v7 = self;
  v8 = (objc_class *)objc_opt_class(v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
    v12 = v11;
    if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

      goto LABEL_9;
    }

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_9:

  *(_DWORD *)buf = 138543362;
  v71 = v13;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Updating camera style with dual displays", buf, 0xCu);

LABEL_10:
  if (!-[CarChromeNavigationCameraStyleManager hasHadDualDisplayConnected](self, "hasHadDualDisplayConnected"))
  {
    -[CarChromeNavigationCameraStyleManager setHasHadDualDisplayConnected:](self, "setHasHadDualDisplayConnected:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKey:", CFSTR("CarNavigationDualDisplayCameraStyle")));

    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v47 = (unint64_t)objc_msgSend(v50, "integerForKey:", CFSTR("CarNavigationDualDisplayCameraStyle"));

      v51 = sub_100A6B8C0();
      v42 = objc_claimAutoreleasedReturnValue(v51);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
LABEL_65:

        goto LABEL_66;
      }
      v52 = self;
      v53 = (objc_class *)objc_opt_class(v52);
      v54 = NSStringFromClass(v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      if ((objc_opt_respondsToSelector(v52, "accessibilityIdentifier") & 1) != 0)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v52, "performSelector:", "accessibilityIdentifier"));
        v57 = v56;
        if (v56 && !objc_msgSend(v56, "isEqualToString:", v55))
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v55, v52, v57));

          goto LABEL_46;
        }

      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v55, v52));
LABEL_46:

      if (v47 > 4)
        v59 = CFSTR(".Unknown");
      else
        v59 = *(&off_1011E0E38 + v47);
      *(_DWORD *)buf = 138543618;
      v71 = v58;
      v72 = 2112;
      v73 = (uint64_t)v59;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[%{public}@] This is the first time dual displays have been connected; using saved camera style default: %@",
        buf,
        0x16u);

      goto LABEL_65;
    }
    Integer = GEOConfigGetInteger(MapsConfig_CarPlayHybridInstrumentClusterCameraStyleDualScreenBehavior, off_1014B52A8);
    v61 = sub_100A6B8C0();
    v62 = objc_claimAutoreleasedReturnValue(v61);
    if (!os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      goto LABEL_55;
    v63 = self;
    v64 = (objc_class *)objc_opt_class(v63);
    v65 = NSStringFromClass(v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    if ((objc_opt_respondsToSelector(v63, "accessibilityIdentifier") & 1) != 0)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v63, "performSelector:", "accessibilityIdentifier"));
      v68 = v67;
      if (v67 && !objc_msgSend(v67, "isEqualToString:", v66))
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v66, v63, v68));

        goto LABEL_54;
      }

    }
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v66, v63));
LABEL_54:

    *(_DWORD *)buf = 138543618;
    v71 = v69;
    v72 = 2048;
    v73 = Integer;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "[%{public}@] This is the first time dual displays have been connected; use behavior %ld",
      buf,
      0x16u);

LABEL_55:
    v34 = Integer == 1;
LABEL_56:
    if (v34)
      v47 = 1;
    else
      v47 = 2;
    goto LABEL_66;
  }
  v14 = sub_100A6B8C0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = self;
    v17 = (objc_class *)objc_opt_class(v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeNavigationCameraStyleManager performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_17;
      }

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_17:

    v23 = -[CarChromeNavigationCameraStyleManager centerConsoleDualDisplayCameraStyle](v16, "centerConsoleDualDisplayCameraStyle");
    if (v23 > 4)
      v24 = CFSTR(".Unknown");
    else
      v24 = *(&off_1011E0E38 + v23);
    *(_DWORD *)buf = 138543618;
    v71 = v22;
    v72 = 2112;
    v73 = (uint64_t)v24;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] Dual displays have been connected more than once; use the last saved camera style: %@",
      buf,
      0x16u);

  }
  v47 = -[CarChromeNavigationCameraStyleManager centerConsoleDualDisplayCameraStyle](self, "centerConsoleDualDisplayCameraStyle");
LABEL_66:
  -[CarChromeNavigationCameraStyleManager setCenterConsoleCameraStyle:](self, "setCenterConsoleCameraStyle:", v47);
}

- (int64_t)centerConsoleCameraStyle
{
  return self->_centerConsoleCameraStyle;
}

- (int64_t)instrumentClusterCameraStyle
{
  return self->_instrumentClusterCameraStyle;
}

- (CarChromeNavigationCameraStyleManagerObserver)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (int64_t)centerConsoleDualDisplayCameraStyle
{
  return self->_centerConsoleDualDisplayCameraStyle;
}

- (void)setCenterConsoleDualDisplayCameraStyle:(int64_t)a3
{
  self->_centerConsoleDualDisplayCameraStyle = a3;
}

- (unint64_t)instrumentClusterSceneCount
{
  return self->_instrumentClusterSceneCount;
}

- (void)setInstrumentClusterSceneCount:(unint64_t)a3
{
  self->_instrumentClusterSceneCount = a3;
}

- (unint64_t)centerConsoleSceneCount
{
  return self->_centerConsoleSceneCount;
}

- (void)setCenterConsoleSceneCount:(unint64_t)a3
{
  self->_centerConsoleSceneCount = a3;
}

- (BOOL)hasHadDualDisplayConnected
{
  return self->_hasHadDualDisplayConnected;
}

- (void)setHasHadDualDisplayConnected:(BOOL)a3
{
  self->_hasHadDualDisplayConnected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
