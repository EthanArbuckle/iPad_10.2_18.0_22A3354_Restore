@implementation InactiveWatchScanner

- (InactiveWatchScanner)initWithDelegate:(id)a3
{
  id v4;
  InactiveWatchScanner *v5;
  NSObject *v6;
  WiProxScanner *v7;
  WiProxScanner *wiProxScanner;
  objc_super v10;
  uint8_t buf[4];
  InactiveWatchScanner *v12;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)InactiveWatchScanner;
  v5 = -[InactiveWatchScanner init](&v10, "init");
  if (v5)
  {
    v6 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Initializing (%p)", buf, 0xCu);
    }
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = -[WiProxScanner initWithDelegate:]([WiProxScanner alloc], "initWithDelegate:", v5);
    wiProxScanner = v5->_wiProxScanner;
    v5->_wiProxScanner = v7;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[InactiveWatchScanner invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)InactiveWatchScanner;
  -[InactiveWatchScanner dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSObject *v3;
  WiProxScanner *wiProxScanner;
  int v5;
  InactiveWatchScanner *v6;

  if (!self->_invalidated)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Invalidating (%p)", (uint8_t *)&v5, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    if (self->_isRunning)
      -[InactiveWatchScanner stopRunning](self, "stopRunning");
    -[WiProxScanner invalidate](self->_wiProxScanner, "invalidate");
    wiProxScanner = self->_wiProxScanner;
    self->_wiProxScanner = 0;

  }
}

- (void)startRunningWithInactiveWatches:(id)a3 activeWatchWristState:(unsigned __int8)a4
{
  NSArray *v6;
  NSObject *v7;
  NSObject *v8;
  NSArray *inactiveWatches;
  int v10;
  NSArray *v11;

  v6 = (NSArray *)a3;
  if (self->_isRunning)
  {
    v7 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Already running", (uint8_t *)&v10, 2u);
    }
    if (self->_isRunning)
      -[InactiveWatchScanner stopRunning](self, "stopRunning");
  }
  v8 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Starting scanning for inactive watches: %@", (uint8_t *)&v10, 0xCu);
  }
  self->_isRunning = 1;
  inactiveWatches = self->_inactiveWatches;
  self->_inactiveWatches = v6;

  self->_activeWatchWristState = a4;
  -[InactiveWatchScanner scheduleHighDutyCycleScanningTimer](self, "scheduleHighDutyCycleScanningTimer");
  -[InactiveWatchScanner updateScanningState](self, "updateScanningState");
}

- (void)stopRunning
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_isRunning)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Stopping scanning for inactive watches", v4, 2u);
    }
    self->_isRunning = 0;
    -[InactiveWatchScanner updateScanningState](self, "updateScanningState");
  }
}

- (NSArray)inactiveWatches
{
  NSObject *v3;
  uint8_t v5[16];

  if (!self->_isRunning)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not running", v5, 2u);
    }
  }
  return self->_inactiveWatches;
}

- (unsigned)activeWatchWristState
{
  NSObject *v3;
  uint8_t v5[16];

  if (!self->_isRunning)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not running", v5, 2u);
    }
  }
  return self->_activeWatchWristState;
}

- (void)updateScanningState
{
  unsigned int v3;
  unsigned __int8 v4;
  AdvertisingIdentifierManager *advertisingIdentifierManager;
  AdvertisingIdentifierManager *v6;
  AbstractTimer *highDutyCycleScanningTimer;
  AbstractTimer *v8;

  v3 = -[WiProxScanner isScanning](self->_wiProxScanner, "isScanning");
  v4 = -[WiProxScanner isPoweredOn](self->_wiProxScanner, "isPoweredOn");
  if (self->_isRunning && (v4 & 1) != 0)
  {
    if ((v3 & 1) == 0)
      -[InactiveWatchScanner startScanning](self, "startScanning");
  }
  else
  {
    if (v3)
      -[WiProxScanner stopScanning](self->_wiProxScanner, "stopScanning");
    advertisingIdentifierManager = self->_advertisingIdentifierManager;
    if (advertisingIdentifierManager)
    {
      -[AdvertisingIdentifierManager invalidate](advertisingIdentifierManager, "invalidate");
      v6 = self->_advertisingIdentifierManager;
      self->_advertisingIdentifierManager = 0;

    }
    highDutyCycleScanningTimer = self->_highDutyCycleScanningTimer;
    if (highDutyCycleScanningTimer)
    {
      -[AbstractTimer invalidate](highDutyCycleScanningTimer, "invalidate");
      v8 = self->_highDutyCycleScanningTimer;
      self->_highDutyCycleScanningTimer = 0;

    }
  }
}

- (void)scheduleHighDutyCycleScanningTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  AbstractTimer *v7;
  AbstractTimer *highDutyCycleScanningTimer;
  _QWORD v9[4];
  id v10;
  id buf[2];

  if (self->_highDutyCycleScanningTimer)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer already scheduled", (uint8_t *)buf, 2u);
    }
  }
  if (-[WiProxScanner isScanning](self->_wiProxScanner, "isScanning"))
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already scanning", (uint8_t *)buf, 2u);
    }
  }
  v5 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Scheduling high duty cycle scanning timer", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.magicswitchd.highDutyScanning"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000059D0;
  v9[3] = &unk_1000184D0;
  objc_copyWeak(&v10, buf);
  v7 = (AbstractTimer *)objc_claimAutoreleasedReturnValue(+[TimerFactory timerWithIdentifier:delay:gracePeriod:waking:handlerBlock:](TimerFactory, "timerWithIdentifier:delay:gracePeriod:waking:handlerBlock:", v6, 1, v9, 30.0, 0.0));
  highDutyCycleScanningTimer = self->_highDutyCycleScanningTimer;
  self->_highDutyCycleScanningTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)highDutyCycleTimerFired
{
  NSObject *v3;
  NSObject *v4;
  AbstractTimer *highDutyCycleScanningTimer;
  uint8_t v6[16];
  uint8_t buf[16];

  if (!self->_highDutyCycleScanningTimer)
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
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- High duty cycle scanning timer fired!", v6, 2u);
  }
  highDutyCycleScanningTimer = self->_highDutyCycleScanningTimer;
  self->_highDutyCycleScanningTimer = 0;

  -[WiProxScanner stopScanning](self->_wiProxScanner, "stopScanning");
  -[InactiveWatchScanner updateScanningState](self, "updateScanningState");
}

- (void)startScanning
{
  NSObject *v3;
  NSObject *v4;
  AdvertisingIdentifierManager *advertisingIdentifierManager;
  AdvertisingIdentifierManager *v6;
  void *v7;
  AdvertisingIdentifierManager *v8;
  AdvertisingIdentifierManager *v9;
  char v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  __int16 v15;
  char v16;
  __int16 v17;
  char v18;
  uint8_t v19[16];
  uint8_t buf[16];

  if (-[WiProxScanner isScanning](self->_wiProxScanner, "isScanning"))
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Already scanning", buf, 2u);
    }
  }
  v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Starting scanning", v19, 2u);
  }
  v18 = 0;
  v17 = 0;
  advertisingIdentifierManager = self->_advertisingIdentifierManager;
  if (!advertisingIdentifierManager)
  {
    v6 = [AdvertisingIdentifierManager alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NRMagicSwitchHelper companionSeed](NRMagicSwitchHelper, "companionSeed"));
    v8 = -[AdvertisingIdentifierManager initWithDelegate:seed:](v6, "initWithDelegate:seed:", self, v7);
    v9 = self->_advertisingIdentifierManager;
    self->_advertisingIdentifierManager = v8;

    advertisingIdentifierManager = self->_advertisingIdentifierManager;
  }
  v10 = self->_activeWatchWristState + 1;
  v11 = self->_highDutyCycleScanningTimer != 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AdvertisingIdentifierManager advertisingIdentifier](advertisingIdentifierManager, "advertisingIdentifier"));
  objc_msgSend(v12, "getBytes:length:", &v17, 2);
  LOBYTE(v17) = v17 & 0xFE;
  v18 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v17, 3));
  v15 = -1;
  v16 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v15, 3));
  -[WiProxScanner startScanningWithHighDutyCycle:filteredPeers:filteringBlob:filteringMask:](self->_wiProxScanner, "startScanningWithHighDutyCycle:filteredPeers:filteringBlob:filteringMask:", v11, self->_inactiveWatches, v13, v14);

}

- (void)wiProxScannerFoundDevice:(id)a3 withData:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "length") >= 3)
  {
    v9 = 0;
    objc_msgSend(v7, "getBytes:range:", &v9, 2, 1);
    if (v9 > self->_activeWatchWristState)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "didDiscoverInactiveWatch:withWristState:", v6, v9);

    }
  }

}

- (void)shouldRollAdvertisingIdentifier
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (!-[WiProxScanner isScanning](self->_wiProxScanner, "isScanning"))
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scanning", buf, 2u);
    }
  }
  v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InactiveWatchScanner --- Rolling the advertising identifier", v5, 2u);
  }
  -[WiProxScanner stopScanning](self->_wiProxScanner, "stopScanning");
  -[InactiveWatchScanner updateScanningState](self, "updateScanningState");
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void)setActiveWatchWristState:(unsigned __int8)a3
{
  self->_activeWatchWristState = a3;
}

- (void)setInactiveWatches:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveWatches, a3);
}

- (InactiveWatchScannerDelegate)delegate
{
  return (InactiveWatchScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (WiProxScanner)wiProxScanner
{
  return self->_wiProxScanner;
}

- (void)setWiProxScanner:(id)a3
{
  objc_storeStrong((id *)&self->_wiProxScanner, a3);
}

- (AbstractTimer)highDutyCycleScanningTimer
{
  return self->_highDutyCycleScanningTimer;
}

- (void)setHighDutyCycleScanningTimer:(id)a3
{
  objc_storeStrong((id *)&self->_highDutyCycleScanningTimer, a3);
}

- (AdvertisingIdentifierManager)advertisingIdentifierManager
{
  return self->_advertisingIdentifierManager;
}

- (void)setAdvertisingIdentifierManager:(id)a3
{
  objc_storeStrong((id *)&self->_advertisingIdentifierManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisingIdentifierManager, 0);
  objc_storeStrong((id *)&self->_highDutyCycleScanningTimer, 0);
  objc_storeStrong((id *)&self->_wiProxScanner, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inactiveWatches, 0);
}

@end
