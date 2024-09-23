@implementation MagicSwitchManagerCompanion

- (MagicSwitchManagerCompanion)initWithDelegate:(id)a3
{
  id v4;
  MagicSwitchManagerCompanion *v5;
  NSObject *v6;
  InactiveWatchScanner *v7;
  InactiveWatchScanner *inactiveWatchScanner;
  objc_super v10;
  uint8_t buf[4];
  MagicSwitchManagerCompanion *v12;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MagicSwitchManagerCompanion;
  v5 = -[MagicSwitchManagerCompanion init](&v10, "init");
  if (v5)
  {
    v6 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Initializing (%p)", buf, 0xCu);
    }
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = -[InactiveWatchScanner initWithDelegate:]([InactiveWatchScanner alloc], "initWithDelegate:", v5);
    inactiveWatchScanner = v5->_inactiveWatchScanner;
    v5->_inactiveWatchScanner = v7;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[MagicSwitchManagerCompanion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MagicSwitchManagerCompanion;
  -[MagicSwitchManagerCompanion dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSObject *v3;
  InactiveWatchScanner *inactiveWatchScanner;
  InactiveWatchScanner *v5;
  ActiveWatchManager *activeWatchManager;
  ActiveWatchManager *v7;
  AbstractTimer *activeWatchAssertionTimer;
  AbstractTimer *v9;
  int v10;
  MagicSwitchManagerCompanion *v11;

  if (!self->_invalidated)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Invalidating (%p)", (uint8_t *)&v10, 0xCu);
    }
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    inactiveWatchScanner = self->_inactiveWatchScanner;
    if (inactiveWatchScanner)
    {
      -[InactiveWatchScanner invalidate](inactiveWatchScanner, "invalidate");
      v5 = self->_inactiveWatchScanner;
      self->_inactiveWatchScanner = 0;

    }
    activeWatchManager = self->_activeWatchManager;
    if (activeWatchManager)
    {
      -[ActiveWatchManager invalidate](activeWatchManager, "invalidate");
      v7 = self->_activeWatchManager;
      self->_activeWatchManager = 0;

    }
    activeWatchAssertionTimer = self->_activeWatchAssertionTimer;
    if (activeWatchAssertionTimer)
    {
      -[AbstractTimer invalidate](activeWatchAssertionTimer, "invalidate");
      v9 = self->_activeWatchAssertionTimer;
      self->_activeWatchAssertionTimer = 0;

    }
  }
}

- (void)updatePairedDeviceList:(id)a3 activeDevice:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSArray *pairedDevices;
  NSUUID *activeDevice;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (!v7)
    {
      v9 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Empty paired device list but non-nil active device", (uint8_t *)&v14, 2u);
      }
    }
    if ((objc_msgSend(v7, "containsObject:", v8) & 1) == 0)
    {
      v10 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Paired device list not containing the active device", (uint8_t *)&v14, 2u);
      }
    }
  }
  pairedDevices = self->_pairedDevices;
  if (v7 && !pairedDevices
    || pairedDevices && !-[NSArray isEqualToArray:](pairedDevices, "isEqualToArray:", v7)
    || (activeDevice = self->_activeDevice, v8) && !activeDevice
    || activeDevice && (-[NSUUID isEqual:](activeDevice, "isEqual:", v8) & 1) == 0)
  {
    v13 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Updating device list: (%@); Active device: (%@)",
        (uint8_t *)&v14,
        0x16u);
    }
    objc_storeStrong((id *)&self->_pairedDevices, a3);
    objc_storeStrong((id *)&self->_activeDevice, a4);
    -[MagicSwitchManagerCompanion updateState](self, "updateState");
  }

}

- (void)updateState
{
  NSUUID *activeDevice;
  ActiveWatchManager *activeWatchManager;
  void *v5;
  unsigned __int8 v6;
  ActiveWatchManager *v7;
  AbstractTimer *activeWatchAssertionTimer;
  AbstractTimer *v9;
  ActiveWatchManager *v10;
  ActiveWatchManager *v11;
  ActiveWatchManager *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  id v16;

  activeDevice = self->_activeDevice;
  activeWatchManager = self->_activeWatchManager;
  if (activeDevice)
  {
    if (!activeWatchManager)
      goto LABEL_29;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActiveWatchManager deviceID](activeWatchManager, "deviceID"));
    v6 = objc_msgSend(v5, "isEqual:", self->_activeDevice);

    if ((v6 & 1) == 0)
    {
      -[ActiveWatchManager invalidate](self->_activeWatchManager, "invalidate");
      v7 = self->_activeWatchManager;
      self->_activeWatchManager = 0;

      activeWatchAssertionTimer = self->_activeWatchAssertionTimer;
      if (activeWatchAssertionTimer)
      {
        -[AbstractTimer invalidate](activeWatchAssertionTimer, "invalidate");
        v9 = self->_activeWatchAssertionTimer;
        self->_activeWatchAssertionTimer = 0;

      }
    }
    if (!self->_activeWatchManager)
    {
LABEL_29:
      if (-[InactiveWatchScanner isRunning](self->_inactiveWatchScanner, "isRunning"))
        -[InactiveWatchScanner stopRunning](self->_inactiveWatchScanner, "stopRunning");
      v10 = -[ActiveWatchManager initWithDelegate:activeDevice:]([ActiveWatchManager alloc], "initWithDelegate:activeDevice:", self, self->_activeDevice);
      v11 = self->_activeWatchManager;
      self->_activeWatchManager = v10;

      -[MagicSwitchManagerCompanion takeActiveWatchAssertion](self, "takeActiveWatchAssertion");
    }
  }
  else if (activeWatchManager)
  {
    -[ActiveWatchManager invalidate](activeWatchManager, "invalidate");
    v12 = self->_activeWatchManager;
    self->_activeWatchManager = 0;

  }
  v16 = (id)objc_claimAutoreleasedReturnValue(-[MagicSwitchManagerCompanion inactiveWatches](self, "inactiveWatches"));
  if (!objc_msgSend(v16, "count"))
    goto LABEL_22;
  v13 = -[ActiveWatchManager wristState](self->_activeWatchManager, "wristState");
  if (!-[InactiveWatchScanner isRunning](self->_inactiveWatchScanner, "isRunning"))
    goto LABEL_19;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InactiveWatchScanner inactiveWatches](self->_inactiveWatchScanner, "inactiveWatches"));
  if (objc_msgSend(v14, "isEqual:", v16))
  {
    v15 = -[InactiveWatchScanner activeWatchWristState](self->_inactiveWatchScanner, "activeWatchWristState");

    if (v15 == (_DWORD)v13)
      goto LABEL_19;
  }
  else
  {

  }
  -[InactiveWatchScanner stopRunning](self->_inactiveWatchScanner, "stopRunning");
LABEL_19:
  if (self->_activeWatchAssertionTimer
    || -[ActiveWatchManager isConnected](self->_activeWatchManager, "isConnected") && v13 > 0x3E)
  {
LABEL_22:
    if (-[InactiveWatchScanner isRunning](self->_inactiveWatchScanner, "isRunning"))
      -[InactiveWatchScanner stopRunning](self->_inactiveWatchScanner, "stopRunning");
    goto LABEL_24;
  }
  if (!-[InactiveWatchScanner isRunning](self->_inactiveWatchScanner, "isRunning"))
    -[InactiveWatchScanner startRunningWithInactiveWatches:activeWatchWristState:](self->_inactiveWatchScanner, "startRunningWithInactiveWatches:activeWatchWristState:", v16, v13);
LABEL_24:

}

- (id)inactiveWatches
{
  id v3;
  void *v4;

  v3 = -[NSArray mutableCopy](self->_pairedDevices, "mutableCopy");
  v4 = v3;
  if (self->_activeDevice)
    objc_msgSend(v3, "removeObject:");
  return v4;
}

- (void)takeActiveWatchAssertion
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  AbstractTimer *v7;
  AbstractTimer *activeWatchAssertionTimer;
  _QWORD v9[4];
  id v10;
  id buf[2];

  if (self->_activeWatchAssertionTimer)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timer already scheduled", (uint8_t *)buf, 2u);
    }
  }
  if (-[InactiveWatchScanner isRunning](self->_inactiveWatchScanner, "isRunning"))
  {
    v4 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already scanning for inactive watches", (uint8_t *)buf, 2u);
    }
  }
  v5 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Taking an active Watch assertion", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.magicswitchd.activeWatchAssertion"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007E58;
  v9[3] = &unk_1000184D0;
  objc_copyWeak(&v10, buf);
  v7 = (AbstractTimer *)objc_claimAutoreleasedReturnValue(+[TimerFactory timerWithIdentifier:delay:gracePeriod:waking:handlerBlock:](TimerFactory, "timerWithIdentifier:delay:gracePeriod:waking:handlerBlock:", v6, 1, v9, 10.0, 0.0));
  activeWatchAssertionTimer = self->_activeWatchAssertionTimer;
  self->_activeWatchAssertionTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)activeWatchAssertionTimerFired
{
  NSObject *v3;
  NSObject *v4;
  AbstractTimer *activeWatchAssertionTimer;
  uint8_t v6[16];
  uint8_t buf[16];

  if (!self->_activeWatchAssertionTimer)
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Active Watch assertion timer fired!", v6, 2u);
  }
  activeWatchAssertionTimer = self->_activeWatchAssertionTimer;
  self->_activeWatchAssertionTimer = 0;

  -[MagicSwitchManagerCompanion updateState](self, "updateState");
}

- (void)activeWatchDidChangeWristStateWithPreviousWristState:(unsigned __int8)a3
{
  AbstractTimer *activeWatchAssertionTimer;
  AbstractTimer *v5;

  activeWatchAssertionTimer = self->_activeWatchAssertionTimer;
  if (activeWatchAssertionTimer)
  {
    -[AbstractTimer invalidate](activeWatchAssertionTimer, "invalidate", a3);
    v5 = self->_activeWatchAssertionTimer;
    self->_activeWatchAssertionTimer = 0;

  }
  -[MagicSwitchManagerCompanion updateState](self, "updateState", a3);
}

- (void)didDiscoverInactiveWatch:(id)a3 withWristState:(unsigned __int8)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  int v11;
  void *v12;
  __int16 v13;
  unsigned int v14;

  v4 = a4;
  v6 = a3;
  if (!-[ActiveWatchManager isConnected](self->_activeWatchManager, "isConnected")
    || -[ActiveWatchManager wristState](self->_activeWatchManager, "wristState") < v4)
  {
    v7 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
      v11 = 138412546;
      v12 = v9;
      v13 = 1024;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CompanionManager --- Scanning found device: (%@) with wrist state: (%d)", (uint8_t *)&v11, 0x12u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "magicSwitchManager:requestActiveDeviceSwitch:", self, v6);

  }
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (MagicSwitchManagerCompanionDelegate)delegate
{
  return (MagicSwitchManagerCompanionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ActiveWatchManager)activeWatchManager
{
  return self->_activeWatchManager;
}

- (void)setActiveWatchManager:(id)a3
{
  objc_storeStrong((id *)&self->_activeWatchManager, a3);
}

- (InactiveWatchScanner)inactiveWatchScanner
{
  return self->_inactiveWatchScanner;
}

- (void)setInactiveWatchScanner:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveWatchScanner, a3);
}

- (NSUUID)advertisingIdentifierSeed
{
  return self->_advertisingIdentifierSeed;
}

- (void)setAdvertisingIdentifierSeed:(id)a3
{
  objc_storeStrong((id *)&self->_advertisingIdentifierSeed, a3);
}

- (NSUUID)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
  objc_storeStrong((id *)&self->_activeDevice, a3);
}

- (NSArray)pairedDevices
{
  return self->_pairedDevices;
}

- (void)setPairedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDevices, a3);
}

- (AbstractTimer)activeWatchAssertionTimer
{
  return self->_activeWatchAssertionTimer;
}

- (void)setActiveWatchAssertionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_activeWatchAssertionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeWatchAssertionTimer, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_advertisingIdentifierSeed, 0);
  objc_storeStrong((id *)&self->_inactiveWatchScanner, 0);
  objc_storeStrong((id *)&self->_activeWatchManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
