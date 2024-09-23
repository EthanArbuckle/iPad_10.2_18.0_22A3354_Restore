@implementation MapsExternalDevice

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class(0x101469000) == a1)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v2, "registerDefaults:", &off_101274750);

  }
}

+ (id)sharedInstance
{
  if (qword_1014D2818 != -1)
    dispatch_once(&qword_1014D2818, &stru_1011BA620);
  return (id)qword_1014D2810;
}

- (MapsExternalDevice)init
{
  MapsExternalDevice *v2;
  unsigned int v3;
  BOOL v4;
  MapsExternalDevice *v5;
  id screenBorrowToken;
  CARSessionStatus *v7;
  CARSessionStatus *carSessionStatus;
  char BOOL;
  id v10;
  void *v11;
  void *v12;
  CARNavigationOwnershipManager *v13;
  CARNavigationOwnershipManager *navigationOwnershipManager;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t v20[16];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MapsExternalDevice;
  v2 = -[MapsExternalDevice init](&v21, "init");
  v3 = +[CarDisplayController isCarPlayAvailable](CarDisplayController, "isCarPlayAvailable");
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v2->_initialising = 1;
    screenBorrowToken = v2->_screenBorrowToken;
    v2->_screenBorrowToken = 0;

    v7 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
    carSessionStatus = v2->_carSessionStatus;
    v2->_carSessionStatus = v7;

    BOOL = GEOConfigGetBOOL(MapsConfig_CarPlayShouldUseCPMetadataSPIs, off_1014B4C48);
    if ((BOOL & 1) == 0)
    {
      v10 = objc_alloc((Class)CARNavigationOwnershipManager);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
      v13 = (CARNavigationOwnershipManager *)objc_msgSend(v10, "initWithIdentifier:delegate:", v12, v2);
      navigationOwnershipManager = v2->_navigationOwnershipManager;
      v2->_navigationOwnershipManager = v13;

    }
    if (-[MapsExternalDevice _isCarPlaySessionActive](v2, "_isCarPlaySessionActive"))
    {
      v15 = sub_10052CF28();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "external accessory already connected, fetch current AVExternalDevice", v20, 2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsCarPlayExternalDeviceMonitor sharedInstance](MapsCarPlayExternalDeviceMonitor, "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "carPlayExternalDevice"));
      -[MapsExternalDevice setExternalDevice:](v2, "setExternalDevice:", v18);

    }
    -[CARSessionStatus addSessionObserver:](v2->_carSessionStatus, "addSessionObserver:", v2);
    -[MapsExternalDevice _setupCarCluster](v2, "_setupCarCluster");
    v2->_initialising = 0;
    v5 = v2;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MapsExternalDevice;
  -[MapsExternalDevice dealloc](&v4, "dealloc");
}

- (BOOL)_isCarPlaySessionActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession"));
  v3 = v2 != 0;

  return v3;
}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD *v7;
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  MapsExternalDevice *v15;

  v4 = a3;
  v5 = &_dispatch_main_q;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_10052D408;
  v14 = &unk_1011AC860;
  v15 = self;
  v6 = &_dispatch_main_q;
  v7 = v12;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (v10 = v9 == 0) : (v10 = 1), !v10 && !strcmp(label, v9)))
  {
    v11 = objc_autoreleasePoolPush();
    v13((uint64_t)v7);
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }

}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD *v7;
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  _QWORD v12[2];
  id (*v13)(uint64_t);
  void *v14;
  MapsExternalDevice *v15;

  v4 = a3;
  v5 = &_dispatch_main_q;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_10052D5B8;
  v14 = &unk_1011AC860;
  v15 = self;
  v6 = &_dispatch_main_q;
  v7 = v12;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label == v9 || (label ? (v10 = v9 == 0) : (v10 = 1), !v10 && !strcmp(label, v9)))
  {
    v11 = objc_autoreleasePoolPush();
    v13((uint64_t)v7);
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }

}

- (void)_registerForAVNotifications
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *notificationObservers;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id location;
  _QWORD v26[7];

  if (!self->_notificationObservers)
  {
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10052D9E4;
    v23[3] = &unk_1011BA648;
    objc_copyWeak(&v24, &location);
    v23[4] = self;
    v3 = objc_retainBlock(v23);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", AVExternalDeviceNightModeChangedNotification, 0, v5, v3));
    v26[0] = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", AVExternalDeviceScreenBecameAvailableNotification, 0, v19, v3));
    v26[1] = v18;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", AVExternalDeviceScreenBecameUnavailableNotification, 0, v17, v3));
    v26[2] = v16;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", AVExternalDeviceLimitedUIChangedNotification, 0, v15, v3));
    v26[3] = v14;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", AVExternalDeviceNavigationAidedDrivingStateChangedNotification, 0, v6, v3));
    v26[4] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", AVExternalDevicePerformanceReportPostedNotification, 0, v8, v3));
    v26[5] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10052DE74;
    v21[3] = &unk_1011AD288;
    objc_copyWeak(&v22, &location);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", UISceneWillEnterForegroundNotification, 0, v10, v21));
    v26[6] = v11;
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 7));
    notificationObservers = self->_notificationObservers;
    self->_notificationObservers = v12;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (void)_unregisterForAVNotifications
{
  id v3;
  NSObject *v4;
  NSArray *v5;
  NSArray *notificationObservers;
  void *v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];

  if (self->_notificationObservers)
  {
    v3 = sub_10052CF28();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "stop observing AV device notifications", buf, 2u);
    }

    v5 = self->_notificationObservers;
    notificationObservers = self->_notificationObservers;
    self->_notificationObservers = 0;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v5;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), (_QWORD)v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)borrowScreenIfNeededForReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[MapsExternalDevice ownsScreen](self, "ownsScreen") && !self->_screenBorrowToken)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice externalDevice](self, "externalDevice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "borrowScreenForClient:reason:", v6, v8));
    -[MapsExternalDevice setScreenBorrowToken:](self, "setScreenBorrowToken:", v7);

  }
}

- (void)relinquishScreenIfNeeded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice screenBorrowToken](self, "screenBorrowToken"));

  if (v3)
    -[MapsExternalDevice setScreenBorrowToken:](self, "setScreenBorrowToken:", 0);
}

- (BOOL)isConnected
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice externalDevice](self, "externalDevice"));
  v3 = v2 != 0;

  return v3;
}

- (void)checkForActiveCarPlayConnection
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  MapsExternalDevice *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  __CFString *v28;
  id v29;
  NSObject *v30;
  __CFString *v31;
  uint8_t buf[4];
  __CFString *v33;
  __int16 v34;
  id v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsCarPlayExternalDeviceMonitor sharedInstance](MapsCarPlayExternalDeviceMonitor, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "carPlayExternalDevice"));

  if (!-[MapsExternalDevice isConnected](self, "isConnected"))
    goto LABEL_17;
  v5 = sub_10052CF28();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "asked to check for active CarPlay connection, already have one (but will check it's ok)", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice externalDevice](self, "externalDevice"));
  v8 = objc_msgSend(v7, "transportType");

  if (!v4 || !v8)
  {
    v9 = sub_10052CF28();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_16:

LABEL_17:
      v19 = sub_10052CF28();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if (v4)
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "asked to check for active CarPlay connection, found one", buf, 2u);
        }

        v22 = self;
        v23 = v4;
      }
      else
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "asked to check for active CarPlay connection, found none", buf, 2u);
        }

        if (-[MapsExternalDevice isConnected](self, "isConnected"))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalAccessory sharedInstance](MapsExternalAccessory, "sharedInstance"));
          v25 = objc_msgSend(v24, "isConnected");

          if (v25)
          {
            v26 = sub_10052CF28();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MapsExternalAccessory sharedInstance](MapsExternalAccessory, "sharedInstance"));
              *(_DWORD *)buf = 138412290;
              v33 = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "no current CarPlay AV device, but we still have our reference and ExternalAccessory is apparently connected: %@", buf, 0xCu);

            }
          }
        }
        if (-[MapsExternalDevice isConnected](self, "isConnected")
          && -[MapsExternalDevice _isCarPlaySessionActive](self, "_isCarPlaySessionActive"))
        {
          v29 = sub_10052CF28();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession"));
            *(_DWORD *)buf = 138412290;
            v33 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "no current CarPlay AV device, but we still have our reference and a CarPlay session is apparently active: %@", buf, 0xCu);

          }
        }
        v22 = self;
        v23 = 0;
      }
      -[MapsExternalDevice setExternalDevice:](v22, "setExternalDevice:", v23);
      goto LABEL_35;
    }
    v11 = v4;
    v12 = v11;
    if (!v4)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_15;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_13;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_13:

LABEL_15:
    *(_DWORD *)buf = 138412546;
    v33 = v18;
    v34 = 2048;
    v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "something has gone wrong with our externalDevice reference! treating as nil... (device: %@, transportType: %ld)", buf, 0x16u);

    goto LABEL_16;
  }
LABEL_35:

}

- (void)setExternalDevice:(id)a3
{
  id v4;
  AVExternalDevice *externalDevice;
  MapsExternalDeviceState *v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSString *v35;
  NSString *v36;
  NSString *v37;
  unint64_t UInteger;
  id v39;
  NSObject *v40;
  unint64_t screenOwnershipChecksRemaining;
  id v42;
  GCDTimer *v43;
  GCDTimer *screenOwnershipCheckTimer;
  void *v45;
  void *v46;
  NSString *externalDeviceDescription;
  MapsExternalDeviceState *v48;
  _QWORD v49[4];
  id v50;
  uint8_t buf[4];
  unint64_t v52;
  __int16 v53;
  uint64_t v54;

  v4 = a3;
  externalDevice = self->_externalDevice;
  v6 = -[MapsExternalDeviceState initWithExternalDevice:]([MapsExternalDeviceState alloc], "initWithExternalDevice:", v4);
  v7 = v4 != 0;
  v48 = v6;
  if (!v4 || v6)
  {
    if ((v4 != 0) == (externalDevice != 0))
      goto LABEL_19;
    goto LABEL_11;
  }
  v8 = sub_10052CF28();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = v4;
    v11 = objc_opt_class(AVExternalDevice);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      v12 = objc_opt_class(v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p> (ID: %@, name: %@, transportType: %ld)"), v12, v10, v13, v14, objc_msgSend(v10, "transportType")));

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
    }

    *(_DWORD *)buf = 138543362;
    v52 = (unint64_t)v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "no state created for device, treating as nil: %{public}@", buf, 0xCu);

  }
  v7 = 0;
  v4 = 0;
  if (externalDevice)
  {
LABEL_11:
    v16 = sub_10052CF28();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = CFSTR("NO");
      if (externalDevice)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      if (v7)
        v18 = CFSTR("YES");
      *(_DWORD *)buf = 138543618;
      v52 = (unint64_t)v19;
      v53 = 2114;
      v54 = (uint64_t)v18;
      v20 = v18;
      v21 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "connection state changed from: %{public}@ to: %{public}@", buf, 0x16u);

    }
  }
LABEL_19:
  v22 = sub_10052CF28();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    externalDeviceDescription = self->_externalDeviceDescription;
    v24 = v4;
    v25 = objc_opt_class(AVExternalDevice);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
    {
      v26 = objc_opt_class(v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p> (ID: %@, name: %@, transportType: %ld)"), v26, v24, v27, v28, objc_msgSend(v24, "transportType")));

    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description"));
    }

    *(_DWORD *)buf = 138543618;
    v52 = (unint64_t)externalDeviceDescription;
    v53 = 2114;
    v54 = (uint64_t)v29;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "updating external device from %{public}@ to %{public}@", buf, 0x16u);

  }
  if (v7)
  {
    objc_storeStrong((id *)&self->_externalDevice, v4);
    v30 = v4;
    v31 = objc_opt_class(AVExternalDevice);
    if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
    {
      v32 = objc_opt_class(v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
      v35 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p> (ID: %@, name: %@, transportType: %ld)"), v32, v30, v33, v34, objc_msgSend(v30, "transportType")));

    }
    else
    {
      v35 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "description"));
    }

    v37 = self->_externalDeviceDescription;
    self->_externalDeviceDescription = v35;

    -[MapsExternalDevice _registerForAVNotifications](self, "_registerForAVNotifications");
    if (objc_msgSend(v30, "ownsScreen"))
    {
      UInteger = GEOConfigGetUInteger(MapsConfig_CarPlayExternalDeviceMaxScreenOwnershipChecks, off_1014B4A88);
      self->_maxScreenOwnershipChecks = UInteger;
      self->_screenOwnershipChecksRemaining = UInteger;
      v39 = sub_10052CF28();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        screenOwnershipChecksRemaining = self->_screenOwnershipChecksRemaining;
        *(_DWORD *)buf = 134218240;
        v52 = screenOwnershipChecksRemaining;
        v53 = 2048;
        v54 = 0x3FC999999999999ALL;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "scheduling %lu deferred screen ownership checks (every %#.1lfs)...", buf, 0x16u);
      }

      if (self->_maxScreenOwnershipChecks)
      {
        objc_initWeak((id *)buf, self);
        v42 = &_dispatch_main_q;
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10052EBD4;
        v49[3] = &unk_1011AE190;
        objc_copyWeak(&v50, (id *)buf);
        v43 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:repeating:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:repeating:block:", &_dispatch_main_q, 1, v49, 0.2));
        screenOwnershipCheckTimer = self->_screenOwnershipCheckTimer;
        self->_screenOwnershipCheckTimer = v43;

        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    -[MapsExternalDevice _unregisterForAVNotifications](self, "_unregisterForAVNotifications");
    objc_storeStrong((id *)&self->_externalDevice, v4);
    v36 = self->_externalDeviceDescription;
    self->_externalDeviceDescription = 0;

  }
  -[MapsExternalDevice setCurrentState:](self, "setCurrentState:", v48);
  if (self->_carPlayIsNavigating)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationOwnershipManager](self, "navigationOwnershipManager"));
    objc_msgSend(v45, "requestNavigationOwnership");

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice metadataManager](self, "metadataManager"));
    objc_msgSend(v46, "requestNavigationOwnership");

  }
}

- (void)setCurrentState:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;

  v5 = a3;
  objc_storeStrong((id *)&self->_currentState, a3);
  v6 = sub_10052CF28();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice externalDeviceDescription](self, "externalDeviceDescription"));
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "state updated for device: %@\n currentState=%@", (uint8_t *)&v9, 0x16u);

  }
  -[MapsExternalDevice _postNotificationIfNeeded](self, "_postNotificationIfNeeded");

}

- (void)_updateStateForRecievedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  MapsExternalDeviceState *v8;
  void *v9;
  MapsExternalDeviceState *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = sub_10052CF28();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v11 = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "handling notification: %@", (uint8_t *)&v11, 0xCu);

  }
  v8 = [MapsExternalDeviceState alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice externalDevice](self, "externalDevice"));
  v10 = -[MapsExternalDeviceState initWithExternalDevice:](v8, "initWithExternalDevice:", v9);
  -[MapsExternalDevice setCurrentState:](self, "setCurrentState:", v10);

}

- (BOOL)_checkScreenOwnershipIfNeeded:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  unint64_t maxScreenOwnershipChecks;
  unint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  MapsExternalDeviceState *v17;
  void *v18;
  MapsExternalDeviceState *v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  unint64_t screenOwnershipChecksRemaining;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  GCDTimer *screenOwnershipCheckTimer;
  int v29;
  unint64_t v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  void *v34;

  v4 = a3;
  if (!self->_screenOwnershipCheckTimer)
    goto LABEL_26;
  v5 = sub_10052CF28();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      maxScreenOwnershipChecks = self->_maxScreenOwnershipChecks;
      v9 = maxScreenOwnershipChecks - self->_screenOwnershipChecksRemaining + 1;
      v29 = 134218240;
      v30 = v9;
      v31 = 2048;
      v32 = (__CFString *)maxScreenOwnershipChecks;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "screen ownership check %lu/%lu...", (uint8_t *)&v29, 0x16u);
    }

    --self->_screenOwnershipChecksRemaining;
  }
  else
  {
    if (v7)
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "screen ownership check (not scheduled)...", (uint8_t *)&v29, 2u);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice externalDevice](self, "externalDevice"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice externalDevice](self, "externalDevice"));
    v12 = objc_msgSend(v11, "ownsScreen") ^ 1;

  }
  else
  {
    v12 = 0;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice externalDevice](self, "externalDevice"));
  v14 = v13 ? v12 : 1;

  if (self->_screenOwnershipChecksRemaining)
  {
    if (!v14)
      goto LABEL_26;
  }
  v21 = sub_10052CF28();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    screenOwnershipChecksRemaining = self->_screenOwnershipChecksRemaining;
    v24 = CFSTR("NO");
    if (v12)
      v24 = CFSTR("YES");
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice externalDeviceDescription](self, "externalDeviceDescription"));
    v29 = 134218498;
    v30 = screenOwnershipChecksRemaining;
    v31 = 2112;
    v32 = v25;
    v33 = 2112;
    v34 = v26;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "cancelling screen ownership checks (remaining: %lu, we own screen: %@, device: %@)", (uint8_t *)&v29, 0x20u);

  }
  -[GCDTimer invalidate](self->_screenOwnershipCheckTimer, "invalidate");
  screenOwnershipCheckTimer = self->_screenOwnershipCheckTimer;
  self->_screenOwnershipCheckTimer = 0;

  if (v14)
  {
    v15 = sub_10052CF28();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "screen ownership changed to us (or device disappeared), update state and schedule notification", (uint8_t *)&v29, 2u);
    }

    v17 = [MapsExternalDeviceState alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice externalDevice](self, "externalDevice"));
    v19 = -[MapsExternalDeviceState initWithExternalDevice:](v17, "initWithExternalDevice:", v18);
    -[MapsExternalDevice setCurrentState:](self, "setCurrentState:", v19);

    v20 = 1;
  }
  else
  {
LABEL_26:
    v20 = 0;
  }

  return v20;
}

- (BOOL)_isCurrentStateEqualLastPostedState
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = objc_claimAutoreleasedReturnValue(-[MapsExternalDevice lastPostedState](self, "lastPostedState"));
  v4 = objc_claimAutoreleasedReturnValue(-[MapsExternalDevice currentState](self, "currentState"));
  if (v3 | v4)
    v5 = objc_msgSend((id)v3, "isEqual:", v4);
  else
    v5 = 1;

  return v5;
}

- (void)_postNotificationIfNeeded
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  const char *label;
  const char *v11;
  void *v12;
  _QWORD v13[2];
  void (*v14)(uint64_t);
  void *v15;
  MapsExternalDevice *v16;
  uint8_t buf[16];

  if (self->_initialising)
  {
    v3 = sub_10052CF28();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "suppressing notification while initialising MapsExternalDevice", buf, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice currentState](self, "currentState"));
    v6 = objc_msgSend(v5, "copy");
    -[MapsExternalDevice setLastPostedState:](self, "setLastPostedState:", v6);

  }
  else
  {
    v7 = &_dispatch_main_q;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v14 = sub_10052F2C8;
    v15 = &unk_1011AC860;
    v16 = self;
    v8 = &_dispatch_main_q;
    v9 = v13;
    label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
    v11 = dispatch_queue_get_label(0);
    if (label == v11 || label && v11 && !strcmp(label, v11))
    {
      v12 = objc_autoreleasePoolPush();
      v14((uint64_t)v9);
      objc_autoreleasePoolPop(v12);
    }
    else
    {
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);
    }

  }
}

- (BOOL)externalAccessoryIsNavigating
{
  void *v4;
  BOOL v5;

  if (GEOConfigGetBOOL(MapsConfig_CarPlayShouldUseCPMetadataSPIs, off_1014B4C48))
    return -[CarMetadataConnectionManager externalAccessoryIsNavigating](self->_metadataManager, "externalAccessoryIsNavigating");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationOwnershipManager](self, "navigationOwnershipManager"));
  v5 = objc_msgSend(v4, "owner") == (id)2;

  return v5;
}

- (void)setCarPlayIsNavigating:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 carPlayIsNavigating;
  void *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];

  if (self->_carPlayIsNavigating != a3)
  {
    v3 = a3;
    self->_carPlayIsNavigating = a3;
    v5 = sub_10052CF28();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      carPlayIsNavigating = self->_carPlayIsNavigating;
      v11[0] = 67109120;
      v11[1] = carPlayIsNavigating;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "iOS navigation state became %d", (uint8_t *)v11, 8u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationOwnershipManager](self, "navigationOwnershipManager"));
    v9 = v8;
    if (v3)
    {
      objc_msgSend(v8, "requestNavigationOwnership");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice metadataManager](self, "metadataManager"));
      objc_msgSend(v10, "requestNavigationOwnership");
    }
    else
    {
      objc_msgSend(v8, "releaseNavigationOwnership");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice metadataManager](self, "metadataManager"));
      objc_msgSend(v10, "releaseNavigationOwnership");
    }

  }
}

- (void)navigationOwnershipChangedToOwner:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v9;

  v4 = sub_10052CF28();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("none");
    if (a3 == 2)
      v6 = CFSTR("car");
    if (a3 == 1)
      v6 = CFSTR("iOS");
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Navigation owner changed to %{public}@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10052F7AC;
  block[3] = &unk_1011ACF48;
  block[4] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)destinationHandoffEnabled
{
  void *v2;
  id v3;
  NSObject *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalAccessory sharedInstance](MapsExternalAccessory, "sharedInstance"));
  if ((objc_msgSend(v2, "isConnected") & 1) == 0)
  {
    v3 = sub_10052CF28();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Checking if destination handoff is enabled, but accessory not connected", v9, 2u);
    }

  }
  if ((objc_msgSend(v2, "destinationHandoffEnabled") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    if (objc_msgSend(v6, "isInternalInstall"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v5 = objc_msgSend(v7, "BOOLForKey:", CFSTR("StarkDestinationSharingEnableKey"));

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)_destinationHandoffTestingEnabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (objc_msgSend(v2, "isInternalInstall"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("StarkDestinationSharingTestKey"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)handoffDestination:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  MapsExternalDevice *v46;
  id v47;
  _BYTE *v48;
  double v49;
  _QWORD v50[4];
  id v51;
  MapsExternalDevice *v52;
  id v53;
  uint64_t *v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[4];
  id v63;
  _BYTE buf[24];
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;

  v6 = a3;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10052FEBC;
  v62[3] = &unk_1011BA670;
  v7 = a4;
  v63 = v7;
  v8 = objc_retainBlock(v62);
  if (-[MapsExternalDevice destinationHandoffEnabled](self, "destinationHandoffEnabled"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult carSearchResultFromDestination:](SearchResult, "carSearchResultFromDestination:", v6));
    v10 = v9;
    if (v9)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_externalDeviceDictionaryRepresentation"));
      if (-[MapsExternalDevice _destinationHandoffTestingEnabled](self, "_destinationHandoffTestingEnabled"))
      {
        v11 = sub_10043364C();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Destination hand-off testing enabled, will present activity controller instead.", buf, 2u);
        }

        objc_msgSend((id)objc_opt_class(self), "_presentActivityControllerForDestination:searchResult:dictionary:completion:", v6, v10, v42, v7);
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v22, "doubleForKey:", CFSTR("__internal__CarDestinationHandoffTimeoutInterval"));
        v24 = v23;

        if (v7)
        {
          v41 = v21;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v65 = sub_10052FF74;
          v66 = sub_10052FF84;
          v67 = 0;
          v56 = 0;
          v57 = &v56;
          v58 = 0x3032000000;
          v59 = sub_10052FF74;
          v60 = sub_10052FF84;
          v61 = 0;
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
          v27 = EAAccessoryDestinationStatusNotification;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_10052FF8C;
          v50[3] = &unk_1011BA698;
          v28 = v41;
          v54 = &v56;
          v55 = buf;
          v51 = v28;
          v52 = self;
          v53 = v7;
          v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "addObserverForName:object:queue:usingBlock:", v27, 0, v26, v50));
          v30 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v29;

          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_1005301A8;
          v44[3] = &unk_1011BA6C0;
          v31 = v28;
          v49 = v24;
          v45 = v31;
          v48 = buf;
          v32 = v8;
          v46 = self;
          v47 = v32;
          v33 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v44, v24));
          v34 = (void *)v57[5];
          v57[5] = v33;

          v21 = v41;
          _Block_object_dispose(&v56, 8);

          _Block_object_dispose(buf, 8);
        }
        v35 = sub_10043364C();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v24));
          v38 = objc_msgSend((id)objc_opt_class(self), "_stringRepresentationOfDictionary:", v42);
          v39 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(v38);
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v37;
          *(_WORD *)&buf[22] = 2112;
          v65 = v39;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Sending destination to the car (identifier:%@, timeout:%@s, destination:{%@})", buf, 0x20u);

        }
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalAccessory sharedInstance](MapsExternalAccessory, "sharedInstance"));
        objc_msgSend(v40, "sendDestinationInformation:identifier:", v42, v21);

      }
    }
    else
    {
      v14 = sub_10043364C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class(v6);
        v17 = NSStringFromClass(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to convert destination to a SearchResult (destination:%@)", buf, 0xCu);

      }
      v19 = objc_msgSend((id)objc_opt_class(self), "_destinationHandoffErrorWithReason:", 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v19);
      ((void (*)(_QWORD *, _QWORD, void *))v8[2])(v8, 0, v43);

    }
  }
  else
  {
    v13 = objc_msgSend((id)objc_opt_class(self), "_destinationHandoffErrorWithReason:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v13);
    ((void (*)(_QWORD *, _QWORD, void *))v8[2])(v8, 0, v10);
  }

}

+ (void)_presentActivityControllerForDestination:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD block[4];
  id v19;
  void (**v20)(id, _QWORD, void *);
  id v21;
  uint8_t buf[4];
  void *v23;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult carSearchResultFromDestination:](SearchResult, "carSearchResultFromDestination:", v6));
    if (v8)
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_externalDeviceDictionaryRepresentation"));
      objc_msgSend(a1, "_presentActivityControllerForDestination:searchResult:dictionary:completion:", v6, v9, v10, v7);

    }
    else
    {
      v11 = sub_10043364C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class(v6);
        v14 = NSStringFromClass(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to convert destination to a SearchResult (destination:%@)", buf, 0xCu);

      }
      if (v7)
      {
        v16 = objc_msgSend((id)objc_opt_class(a1), "_destinationHandoffErrorWithReason:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v7[2](v7, 0, v17);

      }
      v9 = 0;
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005304AC;
    block[3] = &unk_1011B2188;
    v21 = a1;
    v19 = v6;
    v20 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v9 = v19;
  }

}

+ (void)_presentActivityControllerForDestination:(id)a3 searchResult:(id)a4 dictionary:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  objc_class *v18;
  NSString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD block[4];
  id v53;
  id v54;
  __CFString *v55;
  id v56;
  id v57;
  _QWORD v58[7];
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;

  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v13 = a6;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("timestamp"));

    if (v12)
      v17 = v12;
    else
      v17 = CFSTR("n/a");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("serialized"));
    v18 = (objc_class *)objc_opt_class(v10);
    v19 = NSStringFromClass(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)v20;
    if (v20)
      v22 = (const __CFString *)v20;
    else
      v22 = CFSTR("n/a");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("type"));

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = CFSTR("n/a");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, CFSTR("name"));

    v51 = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v14, 1, &v51));
    v27 = v51;
    v28 = v27;
    v45 = v10;
    if (v26)
    {
      v29 = objc_alloc((Class)UIActivityViewController);
      v59 = v26;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
      v31 = objc_msgSend(v29, "initWithActivityItems:applicationActivities:", v30, 0);

      v58[0] = UIActivityTypePostToVimeo;
      v58[1] = UIActivityTypePostToWeibo;
      v58[2] = UIActivityTypePostToFacebook;
      v58[3] = UIActivityTypePostToVimeo;
      v58[4] = UIActivityTypePostToTencentWeibo;
      v58[5] = UIActivityTypeAddToReadingList;
      v58[6] = UIActivityTypePostToFlickr;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 7));
      objc_msgSend(v31, "setExcludedActivityTypes:", v32);

      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100530A18;
      v46[3] = &unk_1011BA710;
      v33 = &v47;
      v47 = v13;
      objc_msgSend(v31, "setCompletionWithItemsHandler:", v46);
      v34 = v28;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "chromeViewController"));

      objc_msgSend(v36, "presentViewController:animated:completion:", v31, 1, 0);
    }
    else
    {
      v44 = v27;
      v37 = sub_10043364C();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedDescription"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedFailureReason"));
        *(_DWORD *)buf = 138412546;
        v61 = v39;
        v62 = 2112;
        v63 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Error serializing debug JSON (%@, %@)", buf, 0x16u);

      }
      v31 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error serializing destination"), CFSTR("There was an error serializing the destination."), 1));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0));
      objc_msgSend(v31, "addAction:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "chromeViewController"));
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1005309F8;
      v48[3] = &unk_1011ACAD0;
      v33 = &v50;
      v50 = v13;
      v34 = v44;
      v49 = v44;
      objc_msgSend(v43, "presentViewController:animated:completion:", v31, 1, v48);

      v36 = v49;
      v26 = 0;
    }

    v10 = v45;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005309E4;
    block[3] = &unk_1011BA6E8;
    v57 = a1;
    v53 = v10;
    v54 = v11;
    v55 = v12;
    v56 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v14 = v53;
  }

}

+ (id)_destinationHandoffErrorWithReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Destination handoff failure alert title [CarPlay]"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v6, NSLocalizedDescriptionKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_localizedReasonForHandoffError:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("__handoff_error_key"));

  if (v8)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, NSLocalizedFailureReasonErrorKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_errorWithCode:userInfo:", 1, v7));

  return v10;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.externaldevice"), a3, a4);
}

+ (id)_localizedReasonForHandoffError:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Destination hand-off is not enabled [CarPlay]");
      goto LABEL_7;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("No usable map item provided");
      goto LABEL_7;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Car did not accept destination hand-off");
      goto LABEL_7;
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Destination hand-off timed out [CarPlay]");
LABEL_7:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)_stringRepresentationOfDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100530CF8;
  v7[3] = &unk_1011BA738;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v4 = v8;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", ")));
  return v5;
}

- (void)_handleIOHIDEvent:(__IOHIDEvent *)a3
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id buf;

  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = IOHIDEventGetType(a3);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "event=%d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100530F0C;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v8, &buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&buf);
}

- (void)startMonitoringIOHIDRepeatCurrentGuidance
{
  __IOHIDEventSystemClient *v3;
  CFDictionaryRef v4;
  __IOHIDEventSystemClient *client;
  CFRunLoopRef Main;
  int v7;
  int valuePtr;
  void *values;
  CFTypeRef cf;
  void *keys[2];

  if (!-[MapsExternalDevice monitoringIOHID](self, "monitoringIOHID"))
  {
    v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0);
    self->_client = v3;
    if (v3)
    {
      *(_OWORD *)keys = *(_OWORD *)off_1011BA758;
      v7 = 1;
      valuePtr = 12;
      values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      cf = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v7);
      v4 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)&values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFRelease(values);
      CFRelease(cf);
      IOHIDEventSystemClientSetMatching(self->_client, v4);
      CFRelease(v4);
      client = self->_client;
      Main = CFRunLoopGetMain();
      IOHIDEventSystemClientScheduleWithRunLoop(client, Main, kCFRunLoopDefaultMode);
      IOHIDEventSystemClientRegisterEventCallback(self->_client, sub_100530D4C, self, 0);
      -[MapsExternalDevice setMonitoringIOHID:](self, "setMonitoringIOHID:", 1);
    }
  }
}

- (void)stopMonitoringIOHIDRepeatCurrentGuidance
{
  __IOHIDEventSystemClient *client;
  CFRunLoopRef Main;

  client = self->_client;
  if (client)
  {
    Main = CFRunLoopGetMain();
    IOHIDEventSystemClientUnscheduleWithRunLoop(client, Main, kCFRunLoopDefaultMode);
    IOHIDEventSystemClientUnregisterEventCallback(self->_client, sub_100530D4C, self, 0);
    CFRelease(self->_client);
    self->_client = 0;
  }
  -[MapsExternalDevice setMonitoringIOHID:](self, "setMonitoringIOHID:", 0);
}

- (void)setRouteGuidanceBeingShownInApp:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationAccessories](self, "navigationAccessories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectEnumerator"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v9);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectEnumerator", 0));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v17;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v17 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "setRouteGuidanceBeingShownInApp:", v3);
              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v13);
        }

        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

}

- (void)_setupCarCluster
{
  CarMetadataConnectionManager *v3;
  CarMetadataConnectionManager *metadataManager;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  id v13;
  void *v14;
  id v15;
  ACCNavigationAccessoryComponent *v16;
  void *v17;
  void *v18;
  ACCNavigationAccessoryComponent *v19;

  if (GEOConfigGetBOOL(MapsConfig_CarPlayShouldUseCPMetadataSPIs, off_1014B4C48))
  {
    v3 = objc_alloc_init(CarMetadataConnectionManager);
    metadataManager = self->_metadataManager;
    self->_metadataManager = v3;

  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)ACCNavigationProvider), "initWithDelegate:", self);
    -[MapsExternalDevice setNavigationProvider:](self, "setNavigationProvider:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    -[MapsExternalDevice setNavigationAccessories:](self, "setNavigationAccessories:", v6);

    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("CarInstrumentClusterDebugNavigationAccessory")));

    if (v9)
      v10 = v9;
    else
      v10 = v7;
    v11 = v10;

    v12 = objc_msgSend(v11, "BOOLValue");
    if (v12)
    {
      v13 = objc_alloc((Class)ACCNavigationAccessory);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationProvider](self, "navigationProvider"));
      v15 = objc_msgSend(v13, "initWithAccessoryUID:provider:", CFSTR("1124"), v14);

      v16 = objc_opt_new(ACCNavigationAccessoryComponent);
      -[ACCNavigationAccessoryComponent setMaxCapacity_GuidanceManeuver:](v16, "setMaxCapacity_GuidanceManeuver:", 4);
      -[ACCNavigationAccessoryComponent setIdentifier:](v16, "setIdentifier:", 713);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationProvider](self, "navigationProvider"));
      v19 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      -[MapsExternalDevice navigation:startRouteGuidance:componentList:](self, "navigation:startRouteGuidance:componentList:", v17, v15, v18);

    }
  }
}

- (void)navigation:(id)a3 accessoryAttached:(id)a4
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v5 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "CarCluster");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "accessory=%@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationAccessories](self, "navigationAccessories"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  objc_msgSend(v8, "setObject:forKey:", v9, v5);

}

- (void)navigation:(id)a3 accessoryDetached:(id)a4
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;

  v5 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "CarCluster");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "accessory=%@", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationAccessories](self, "navigationAccessories"));
  objc_msgSend(v8, "removeObjectForKey:", v5);

}

- (void)navigation:(id)a3 startRouteGuidance:(id)a4 componentList:(id)a5
{
  id v7;
  id v8;
  uint64_t Log;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  id v23;
  CarClusterNavigationController *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;

  v7 = a4;
  v8 = a5;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "CarCluster");
  v10 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v44 = v7;
    v45 = 2112;
    v46 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "StartRouteGuidance accessory=%@ components=%@", buf, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationAccessories](self, "navigationAccessories"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v7));

  v30 = (void *)v12;
  if (!v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationAccessories](self, "navigationAccessories"));
    v30 = (void *)v13;
    objc_msgSend(v14, "setObject:forKey:", v13, v7);

  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100531A38;
  v39[3] = &unk_1011BA770;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v40 = v15;
  v16 = objc_retainBlock(v39);
  if (v8)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v18)
    {
      v19 = v18;
      v29 = v8;
      v20 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v23 = v7;
          v24 = -[CarClusterNavigationController initWithAccessory:component:]([CarClusterNavigationController alloc], "initWithAccessory:component:", v7, v22);
          objc_msgSend(v30, "setObject:forKey:", v24, v22);
          if (objc_msgSend(v15, "isInNavigatingState"))
            ((void (*)(_QWORD *, CarClusterNavigationController *))v16[2])(v16, v24);

          v7 = v23;
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v19);
      v8 = v29;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (objc_msgSend(v15, "isInNavigatingState"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectEnumerator"));
    v25 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v17);
          ((void (*)(_QWORD *, _QWORD))v16[2])(v16, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j));
        }
        v26 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v26);
    }
    goto LABEL_24;
  }
LABEL_25:

}

- (void)navigation:(id)a3 stopRouteGuidance:(id)a4 componentList:(id)a5
{
  id v7;
  id v8;
  uint64_t Log;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;

  v7 = a4;
  v8 = a5;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "CarCluster");
  v10 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "StopRouteGuidance accessory=%@ components=%@", buf, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDevice navigationAccessories](self, "navigationAccessories"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v7));

  if (v8)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
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
          objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), (_QWORD)v18);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

  }
  else
  {
    objc_msgSend(v12, "removeAllObjects");
  }

}

- (void)forwardInvocation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(MapsExternalDeviceState), "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[MapsExternalDevice currentState](self, "currentState"));
  }
  else
  {
    if (!objc_msgSend((id)objc_opt_class(MapsExternalAccessory), "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
    {
      v7.receiver = self;
      v7.super_class = (Class)MapsExternalDevice;
      -[MapsExternalDevice forwardInvocation:](&v7, "forwardInvocation:", v4);
      goto LABEL_7;
    }
    v5 = objc_claimAutoreleasedReturnValue(+[MapsExternalAccessory sharedInstance](MapsExternalAccessory, "sharedInstance"));
  }
  v6 = (void *)v5;
  objc_msgSend(v4, "invokeWithTarget:", v5);

LABEL_7:
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsExternalDevice;
  v4 = -[MapsExternalDevice methodSignatureForSelector:](&v9, "methodSignatureForSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(MapsExternalDeviceState), "instanceMethodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (!v5)
    {
      v7 = objc_msgSend((id)objc_opt_class(MapsExternalAccessory), "instanceMethodSignatureForSelector:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v7);
    }
  }
  return v5;
}

- (BOOL)carPlayIsNavigating
{
  return self->_carPlayIsNavigating;
}

- (AVExternalDevice)externalDevice
{
  return self->_externalDevice;
}

- (NSString)externalDeviceDescription
{
  return self->_externalDeviceDescription;
}

- (MapsExternalDeviceState)currentState
{
  return self->_currentState;
}

- (MapsExternalDeviceState)lastPostedState
{
  return (MapsExternalDeviceState *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastPostedState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (id)screenBorrowToken
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setScreenBorrowToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)monitoringIOHID
{
  return self->_monitoringIOHID;
}

- (void)setMonitoringIOHID:(BOOL)a3
{
  self->_monitoringIOHID = a3;
}

- (ACCNavigationProvider)navigationProvider
{
  return (ACCNavigationProvider *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNavigationProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CarMetadataConnectionManager)metadataManager
{
  return self->_metadataManager;
}

- (void)setMetadataManager:(id)a3
{
  objc_storeStrong((id *)&self->_metadataManager, a3);
}

- (NSMapTable)navigationAccessories
{
  return (NSMapTable *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNavigationAccessories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (CARNavigationOwnershipManager)navigationOwnershipManager
{
  return self->_navigationOwnershipManager;
}

- (void)setNavigationOwnershipManager:(id)a3
{
  objc_storeStrong((id *)&self->_navigationOwnershipManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationOwnershipManager, 0);
  objc_storeStrong((id *)&self->_navigationAccessories, 0);
  objc_storeStrong((id *)&self->_metadataManager, 0);
  objc_storeStrong((id *)&self->_navigationProvider, 0);
  objc_storeStrong(&self->_screenBorrowToken, 0);
  objc_storeStrong((id *)&self->_lastPostedState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_externalDeviceDescription, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_screenOwnershipCheckTimer, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
}

@end
