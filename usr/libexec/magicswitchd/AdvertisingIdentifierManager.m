@implementation AdvertisingIdentifierManager

- (AdvertisingIdentifierManager)initWithDelegate:(id)a3 seed:(id)a4
{
  id v6;
  id v7;
  AdvertisingIdentifierManager *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  AdvertisingIdentifierManager *v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AdvertisingIdentifierManager;
  v8 = -[AdvertisingIdentifierManager init](&v13, "init");
  if (v8)
  {
    v9 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      *(_DWORD *)buf = 134218242;
      v15 = v8;
      v16 = 2112;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Initializing (%p); Seed: (%@)",
        buf,
        0x16u);

    }
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_seed, a4);
    v8->_significantTimeChangeNotifyToken = -1;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[AdvertisingIdentifierManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AdvertisingIdentifierManager;
  -[AdvertisingIdentifierManager dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSObject *v3;
  NSData *advertisingIdentifier;
  AbstractTimer *rollingTimer;
  AbstractTimer *v6;
  int significantTimeChangeNotifyToken;
  uint32_t v8;
  uint32_t v9;
  NSObject *v10;
  int v11;
  AdvertisingIdentifierManager *v12;

  if (!self->_invalidated)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Invalidating (%p)", (uint8_t *)&v11, 0xCu);
    }
    self->_invalidated = 1;
    advertisingIdentifier = self->_advertisingIdentifier;
    self->_advertisingIdentifier = 0;

    self->_currentTimeSlice = 0;
    rollingTimer = self->_rollingTimer;
    if (rollingTimer)
    {
      -[AbstractTimer invalidate](rollingTimer, "invalidate");
      v6 = self->_rollingTimer;
      self->_rollingTimer = 0;

    }
    significantTimeChangeNotifyToken = self->_significantTimeChangeNotifyToken;
    if (significantTimeChangeNotifyToken != -1)
    {
      v8 = notify_cancel(significantTimeChangeNotifyToken);
      if (v8)
      {
        v9 = v8;
        v10 = qword_100021A50;
        if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 67109120;
          LODWORD(v12) = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Failed to unregister observer for significiant time change notification with status: (%u)", (uint8_t *)&v11, 8u);
        }
      }
      self->_significantTimeChangeNotifyToken = -1;
    }
  }
}

- (NSData)advertisingIdentifier
{
  NSObject *v3;
  NSData *advertisingIdentifier;
  uint8_t v6[16];

  if (self->_invalidated)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidated", v6, 2u);
    }
  }
  advertisingIdentifier = self->_advertisingIdentifier;
  if (!advertisingIdentifier)
  {
    -[AdvertisingIdentifierManager updateAdvertisingIdentifier](self, "updateAdvertisingIdentifier");
    advertisingIdentifier = self->_advertisingIdentifier;
  }
  return advertisingIdentifier;
}

+ (unint64_t)computeCurrentTimeSlice
{
  double v2;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  return (unint64_t)(v2 / 900.0);
}

- (void)updateAdvertisingIdentifier
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  NSData *v7;
  NSData *advertisingIdentifier;
  NSObject *v9;
  NSData *v10;
  void *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  _QWORD handler[4];
  id v16;
  uint8_t v17[4];
  uint32_t v18;
  uint8_t buf[4];
  NSData *v20;
  __int16 v21;
  unint64_t v22;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "computeCurrentTimeSlice");
  v5 = (unint64_t)v3;
  if (!self->_advertisingIdentifier || (id)self->_currentTimeSlice != v3)
  {
    v6 = objc_msgSend((id)objc_opt_class(self, v4), "HMACWithSeed:timeSlice:", self->_seed, v3);
    v7 = (NSData *)objc_claimAutoreleasedReturnValue(v6);
    advertisingIdentifier = self->_advertisingIdentifier;
    self->_advertisingIdentifier = v7;

    self->_currentTimeSlice = v5;
    v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_advertisingIdentifier;
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2048;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Computed new identifier: (%@) for time slice: (%llu)", buf, 0x16u);
    }
  }
  if (!self->_rollingTimer)
    -[AdvertisingIdentifierManager scheduleRollingTimer](self, "scheduleRollingTimer");
  if (self->_significantTimeChangeNotifyToken == -1)
  {
    objc_initWeak((id *)buf, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "workQueue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000EB50;
    handler[3] = &unk_100018720;
    objc_copyWeak(&v16, (id *)buf);
    v13 = notify_register_dispatch("SignificantTimeChangeNotification", &self->_significantTimeChangeNotifyToken, v12, handler);

    if (v13)
    {
      v14 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v17 = 67109120;
        v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Failed to register observer for significiant time change notification with status: (%u)", v17, 8u);
      }
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)significantTimeChangeHandler
{
  NSObject *v3;
  NSObject *v4;
  NSData *advertisingIdentifier;
  AbstractTimer *rollingTimer;
  AbstractTimer *v7;
  id WeakRetained;
  uint8_t v9[16];
  uint8_t buf[16];

  if (self->_invalidated)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidated", buf, 2u);
    }
  }
  if (self->_currentTimeSlice
    && objc_msgSend((id)objc_opt_class(self, a2), "computeCurrentTimeSlice") != (id)self->_currentTimeSlice)
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Invalidating current advertising identifier due to significant time change", v9, 2u);
    }
    advertisingIdentifier = self->_advertisingIdentifier;
    self->_advertisingIdentifier = 0;

    rollingTimer = self->_rollingTimer;
    if (rollingTimer)
    {
      -[AbstractTimer invalidate](rollingTimer, "invalidate");
      v7 = self->_rollingTimer;
      self->_rollingTimer = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "shouldRollAdvertisingIdentifier");

  }
}

- (void)scheduleRollingTimer
{
  NSObject *v3;
  NSObject *v4;
  double v5;
  double v6;
  unint64_t currentTimeSlice;
  void *v8;
  uint64_t v9;
  double v10;
  AbstractTimer *v11;
  AbstractTimer *rollingTimer;
  _QWORD v13[4];
  id v14;
  id buf[2];

  if (self->_invalidated)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidated", (uint8_t *)buf, 2u);
    }
  }
  if (self->_rollingTimer)
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Timer already scheduled", (uint8_t *)buf, 2u);
    }
  }
  objc_initWeak(buf, self);
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  currentTimeSlice = self->_currentTimeSlice;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.magicswitchd.advIdRolling"));
  v9 = 900 * currentTimeSlice + 900;
  if ((double)(unint64_t)v9 - v6 >= 0.0)
    v10 = (double)(unint64_t)v9 - v6;
  else
    v10 = 0.0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000EE58;
  v13[3] = &unk_1000184D0;
  objc_copyWeak(&v14, buf);
  v11 = (AbstractTimer *)objc_claimAutoreleasedReturnValue(+[TimerFactory timerWithIdentifier:delay:gracePeriod:waking:handlerBlock:](TimerFactory, "timerWithIdentifier:delay:gracePeriod:waking:handlerBlock:", v8, 1, v13, v10, 0.0));
  rollingTimer = self->_rollingTimer;
  self->_rollingTimer = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

- (void)rollingTimerFired
{
  NSObject *v3;
  NSObject *v4;
  AbstractTimer *rollingTimer;
  NSData *advertisingIdentifier;
  id WeakRetained;
  uint8_t v8[16];
  uint8_t buf[16];

  if (!self->_rollingTimer)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer not scheduled", buf, 2u);
    }
  }
  v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AdvertisingIdentifierManager --- Rolling timer fired!", v8, 2u);
  }
  rollingTimer = self->_rollingTimer;
  self->_rollingTimer = 0;

  advertisingIdentifier = self->_advertisingIdentifier;
  self->_advertisingIdentifier = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shouldRollAdvertisingIdentifier");

}

+ (id)HMACWithSeed:(id)a3 timeSlice:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  unint64_t v10;
  _QWORD v11[2];

  v10 = a4;
  v11[0] = 0;
  v11[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11, 16));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v10, 8));
  v7 = 0;
  if (v5)
    v8 = v10 == 0;
  else
    v8 = 1;
  if (!v8)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "HMACWithKey:data:", v5, v6));

  return v7;
}

+ (id)HMACWithKey:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _BYTE macOut[32];

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v7 = v5;
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  v10 = objc_retainAutorelease(v6);
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  CCHmac(2u, v8, (size_t)v9, v11, (size_t)v12, macOut);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", macOut, 32));
}

- (NSUUID)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
  objc_storeStrong((id *)&self->_seed, a3);
}

- (void)setAdvertisingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_advertisingIdentifier, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (AdvertisingIdentifierManagerDelegate)delegate
{
  return (AdvertisingIdentifierManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AbstractTimer)rollingTimer
{
  return self->_rollingTimer;
}

- (void)setRollingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_rollingTimer, a3);
}

- (unint64_t)currentTimeSlice
{
  return self->_currentTimeSlice;
}

- (void)setCurrentTimeSlice:(unint64_t)a3
{
  self->_currentTimeSlice = a3;
}

- (int)significantTimeChangeNotifyToken
{
  return self->_significantTimeChangeNotifyToken;
}

- (void)setSignificantTimeChangeNotifyToken:(int)a3
{
  self->_significantTimeChangeNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollingTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advertisingIdentifier, 0);
  objc_storeStrong((id *)&self->_seed, 0);
}

@end
