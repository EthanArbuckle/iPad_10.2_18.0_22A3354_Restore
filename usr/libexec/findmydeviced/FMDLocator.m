@implementation FMDLocator

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100225550(self, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator locManager](self, "locManager"));
  objc_msgSend(v5, "setDelegate:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator locManager](self, "locManager"));
  objc_msgSend(v6, "stopUpdatingLocation");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator finishedTimer](self, "finishedTimer"));
  objc_msgSend(v7, "invalidate");

  v8.receiver = self;
  v8.super_class = (Class)FMDLocator;
  -[FMDLocator dealloc](&v8, "dealloc");
}

- (FMDLocator)initWithLocationManager:(id)a3
{
  id v5;
  FMDLocator *v6;
  FMDLocator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDLocator;
  v6 = -[FMDLocator init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    *(_OWORD *)&v6->_desiredAccuracy = xmmword_100253790;
    objc_storeStrong((id *)&v6->_locManager, a3);
    -[FMDLocationManaging setDelegate:](v7->_locManager, "setDelegate:", v7);
    -[FMDLocationManaging setDesiredAccuracy:](v7->_locManager, "setDesiredAccuracy:", v7->_desiredAccuracy);
    -[FMDLocationManaging setDistanceFilter:](v7->_locManager, "setDistanceFilter:", kCLDistanceFilterNone);
  }

  return v7;
}

- (id)powerAssertionName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%lX"), CFSTR("Locating"), self);
}

- (id)xpcTransactionName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Locating-%lX"), self);
}

- (void)startLocator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;

  if (!-[FMDLocator locatorRunning](self, "locatorRunning"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPowerMgr sharedInstance](FMDPowerMgr, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator powerAssertionName](self, "powerAssertionName"));
    objc_msgSend(v3, "powerAssertionEnableWithReason:timeout:", v4, (uint64_t)(self->_duration + 2.0));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator xpcTransactionName](self, "xpcTransactionName"));
    objc_msgSend(v5, "beginTransaction:", v6);

    -[FMDLocator setLocatorRunning:](self, "setLocatorRunning:", 1);
    self->_launchTime = CFAbsoluteTimeGetCurrent();
    -[FMDLocationManaging setDesiredAccuracy:](self->_locManager, "setDesiredAccuracy:", self->_desiredAccuracy);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_processStopTimeout:", 0, 0, self->_duration));
    -[FMDLocator setFinishedTimer:](self, "setFinishedTimer:", v7);

    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator fm_logID](self, "fm_logID"));
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Starting location service now", (uint8_t *)&v11, 0xCu);

    }
    -[FMDLocationManaging startUpdatingLocation](self->_locManager, "startUpdatingLocation");
  }
}

- (void)stopLocator
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator fm_logID](self, "fm_logID"));
    v15 = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Stopping location service now", (uint8_t *)&v15, 0xCu);

  }
  -[FMDLocator setLocatorRunning:](self, "setLocatorRunning:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator locManager](self, "locManager"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator locManager](self, "locManager"));
    objc_msgSend(v7, "setDelegate:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator locManager](self, "locManager"));
    objc_msgSend(v8, "stopUpdatingLocation");

    -[FMDLocator setLocManager:](self, "setLocManager:", 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator finishedTimer](self, "finishedTimer"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator finishedTimer](self, "finishedTimer"));
    objc_msgSend(v10, "invalidate");

    -[FMDLocator setFinishedTimer:](self, "setFinishedTimer:", 0);
  }
  if (self->_stoppedLocatorBlock)
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, self->_stoppedLocatorBlock);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator xpcTransactionName](self, "xpcTransactionName"));
  objc_msgSend(v11, "endTransaction:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPowerMgr sharedInstance](FMDPowerMgr, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator powerAssertionName](self, "powerAssertionName"));
  objc_msgSend(v13, "powerAssertionDisableWithReason:", v14);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator locatorPublisher](self, "locatorPublisher"));

    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100031FEC;
      v11[3] = &unk_1002C2BF8;
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v7 = v12;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator locatorPublisher](self, "locatorPublisher"));
      objc_msgSend(v8, "updatedLocations:", v7);

    }
    else
    {
      v9 = sub_1000031B8();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1002276AC(v10);

    }
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;

  v5 = a4;
  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator fm_logID](self, "fm_logID"));
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Location updates failed with error: %@", (uint8_t *)&v13, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (!objc_msgSend(v9, "isEqualToString:", kCLErrorDomain))
  {

    goto LABEL_9;
  }
  v10 = objc_msgSend(v5, "code");

  if (v10)
  {
LABEL_9:
    -[FMDLocator stopLocator](self, "stopLocator");
    goto LABEL_10;
  }
  v11 = sub_1000031B8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not stopping the locator service because the error is temporary.", (uint8_t *)&v13, 2u);
  }

LABEL_10:
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  _DWORD v6[2];

  v3 = a3;
  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = objc_msgSend(v3, "authorizationStatus");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDLocator: Location Manager auth status %d", (uint8_t *)v6, 8u);
  }

}

- (void)_processStopTimeout:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocator fm_logID](self, "fm_logID"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Location Services ending now after timeout", (uint8_t *)&v7, 0xCu);

  }
  -[FMDLocator setLocatorRunning:](self, "setLocatorRunning:", 0);
  -[FMDLocator stopLocator](self, "stopLocator");
}

- (double)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (void)setDesiredAccuracy:(double)a3
{
  self->_desiredAccuracy = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)stoppedLocatorBlock
{
  return self->_stoppedLocatorBlock;
}

- (void)setStoppedLocatorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)locatorRunning
{
  return self->_locatorRunning;
}

- (void)setLocatorRunning:(BOOL)a3
{
  self->_locatorRunning = a3;
}

- (FMLocatorPublishing)locatorPublisher
{
  return self->_locatorPublisher;
}

- (void)setLocatorPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_locatorPublisher, a3);
}

- (double)launchTime
{
  return self->_launchTime;
}

- (void)setLaunchTime:(double)a3
{
  self->_launchTime = a3;
}

- (FMDLocationManaging)locManager
{
  return self->_locManager;
}

- (void)setLocManager:(id)a3
{
  objc_storeStrong((id *)&self->_locManager, a3);
}

- (NSTimer)finishedTimer
{
  return self->_finishedTimer;
}

- (void)setFinishedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_finishedTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedTimer, 0);
  objc_storeStrong((id *)&self->_locManager, 0);
  objc_storeStrong((id *)&self->_locatorPublisher, 0);
  objc_storeStrong(&self->_stoppedLocatorBlock, 0);
}

@end
