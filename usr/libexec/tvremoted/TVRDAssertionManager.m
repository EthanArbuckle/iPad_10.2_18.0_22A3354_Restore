@implementation TVRDAssertionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

void __38__TVRDAssertionManager_sharedInstance__block_invoke(id a1)
{
  TVRDAssertionManager *v1;
  void *v2;

  v1 = objc_alloc_init(TVRDAssertionManager);
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (TVRDAssertionManager)init
{
  TVRDAssertionManager *v2;
  TVRDAssertionManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRDAssertionManager;
  v2 = -[TVRDAssertionManager init](&v5, "init");
  v3 = v2;
  if (v2)
    -[TVRDAssertionManager _setup](v2, "_setup");
  return v3;
}

- (void)_setup
{
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;
  id location;

  if (!self->_systemMonitor)
  {
    v3 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    objc_initWeak(&location, self);
    v5 = self->_systemMonitor;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __30__TVRDAssertionManager__setup__block_invoke;
    v7[3] = &unk_10001C4E0;
    objc_copyWeak(&v8, &location);
    v7[4] = self;
    -[CUSystemMonitor setScreenLockedChangedHandler:](v5, "setScreenLockedChangedHandler:", v7);
    -[CUSystemMonitor activateWithCompletion:](self->_systemMonitor, "activateWithCompletion:", &__block_literal_global_6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __30__TVRDAssertionManager__setup__block_invoke_8;
  v6[3] = &unk_10001C528;
  v6[4] = self;
  _TVRCAddStateHandlerWithName("Assertions", v6);
}

void __30__TVRDAssertionManager__setup__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "systemMonitor"));
    v5 = objc_msgSend(v4, "screenLocked");

    v6 = _TVRDXPCLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("unlocked");
      if (v5)
        v8 = CFSTR("locked");
      v11 = 138412290;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Screen is now %@", (uint8_t *)&v11, 0xCu);
    }

    if (v5 && (objc_msgSend(*(id *)(a1 + 32), "_newLockScreenBehaviour") & 1) == 0)
    {
      v9 = _TVRDXPCLog();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resetting expiration timer", (uint8_t *)&v11, 2u);
      }

      objc_msgSend(v3, "invalidateAssertionExpirationTimer");
      objc_msgSend(v3, "_createAssertionExpirationTimer");
    }
  }

}

void __30__TVRDAssertionManager__setup__block_invoke_5(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = _TVRDXPCLog();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Screen lock monitor activated", v3, 2u);
  }

}

id __30__TVRDAssertionManager__setup__block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assertion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3 != 0));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("lockScreen"));

  return v2;
}

- (BOOL)_newLockScreenBehaviour
{
  return GestaltGetDeviceClass(self, a2) != 3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TVRDAssertionManager releaseLockScreenAssertion](self, "releaseLockScreenAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDAssertionManager systemMonitor](self, "systemMonitor"));
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)TVRDAssertionManager;
  -[TVRDAssertionManager dealloc](&v4, "dealloc");
}

- (void)acquireLockScreenAssertion
{
  unsigned int v3;
  __CFString *v4;
  __CFString *v5;
  SBSLockScreenContentAssertion *assertion;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  SBSLockScreenContentAssertion *v12;
  SBSLockScreenContentAssertion *v13;
  id v14;
  SBSLockScreenContentAssertion *v15;
  SBSLockScreenContentAssertion *v16;
  int v17;
  __CFString *v18;

  v3 = -[TVRDAssertionManager _newLockScreenBehaviour](self, "_newLockScreenBehaviour");
  v4 = CFSTR("SBSWakeToRemoteAlertAssertion");
  if (v3)
    v4 = CFSTR("SBSSecureAppAssertion");
  v5 = v4;
  assertion = self->_assertion;
  v7 = _TVRDXPCLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (assertion)
  {
    if (v9)
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We already have a valid %@", (uint8_t *)&v17, 0xCu);
    }

    if ((v3 & 1) == 0)
    {
      v10 = _TVRDXPCLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Resetting invalidation timer for assertion", (uint8_t *)&v17, 2u);
      }

      -[TVRDAssertionManager _createAssertionExpirationTimer](self, "_createAssertionExpirationTimer");
    }
  }
  else
  {
    if (v9)
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Acquiring %@", (uint8_t *)&v17, 0xCu);
    }

    if (v3)
    {
      v12 = (SBSLockScreenContentAssertion *)objc_claimAutoreleasedReturnValue(+[SBSSecureAppAssertion acquireSecureAppAssertionWithType:errorHandler:](SBSSecureAppAssertion, "acquireSecureAppAssertionWithType:errorHandler:", 12, &__block_literal_global_22));
      v13 = self->_assertion;
      self->_assertion = v12;

    }
    else
    {
      v14 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.TVRemoteUIService"), CFSTR("TVRemoteAlertViewController"));
      v15 = (SBSLockScreenContentAssertion *)objc_claimAutoreleasedReturnValue(+[SBSWakeToRemoteAlertAssertion acquireWakeToRemoteAlertAssertionWithDefinition:errorHandler:](SBSWakeToRemoteAlertAssertion, "acquireWakeToRemoteAlertAssertionWithDefinition:errorHandler:", v14, &__block_literal_global_30));
      v16 = self->_assertion;
      self->_assertion = v15;

      -[TVRDAssertionManager _createAssertionExpirationTimer](self, "_createAssertionExpirationTimer");
    }
  }

}

void __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v2 = a2;
  v3 = -[NSError code](v2, "code");
  v4 = _TVRDXPCLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3 == (id)5)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully invalidated lock screen assertion", v13, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke_cold_1((uint64_t)v2, v6, v7, v8, v9, v10, v11, v12);
  }

}

void __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke_29(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke_29_cold_1((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

}

- (void)releaseLockScreenAssertion
{
  id v3;
  NSObject *v4;
  SBSLockScreenContentAssertion *assertion;
  uint8_t v6[16];

  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing lock screen assertion", v6, 2u);
  }

  -[SBSLockScreenContentAssertion invalidate](self->_assertion, "invalidate");
  assertion = self->_assertion;
  self->_assertion = 0;

  -[TVRDAssertionManager invalidateAssertionExpirationTimer](self, "invalidateAssertionExpirationTimer");
}

- (BOOL)isLockScreenAssertionActive
{
  return self->_assertion != 0;
}

- (void)_createAssertionExpirationTimer
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  NSTimer *v7;
  NSTimer *expirationTimer;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  id location[2];

  if (+[TVRCFeatures isPersistOnLockScreenEnabled](TVRCFeatures, "isPersistOnLockScreenEnabled"))
  {
    v3 = _TVRDXPCLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      v5 = "Persist On LockScreen Internal flag is enabled. Ignoring creating the timer.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)location, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDAssertionManager assertion](self, "assertion"));

  if (!v6)
  {
    v12 = _TVRDXPCLog();
    v4 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      v5 = "Lock Screen Assertion is nil. Skipping creating the expiration timer";
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  -[TVRDAssertionManager invalidateAssertionExpirationTimer](self, "invalidateAssertionExpirationTimer");
  objc_initWeak(location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __55__TVRDAssertionManager__createAssertionExpirationTimer__block_invoke;
  v14[3] = &unk_10001C5B0;
  objc_copyWeak(&v15, location);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:repeats:block:](NSTimer, "timerWithTimeInterval:repeats:block:", 0, v14, 480.0));
  expirationTimer = self->_expirationTimer;
  self->_expirationTimer = v7;

  v9 = _TVRDXPCLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting Lock Screen Assertion Timer", v13, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v11, "addTimer:forMode:", self->_expirationTimer, NSRunLoopCommonModes);

  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
}

void __55__TVRDAssertionManager__createAssertionExpirationTimer__block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  v2 = _TVRDXPCLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Lock Screen Assertion expiration timer fired", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "releaseLockScreenAssertion");

}

- (void)startAssertionExpirationTimer
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  if (self->_expirationTimer)
  {
    v2 = _TVRDXPCLog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Lock Screen Assertion Timer already exists", v4, 2u);
    }

  }
  else
  {
    -[TVRDAssertionManager _createAssertionExpirationTimer](self, "_createAssertionExpirationTimer");
  }
}

- (void)invalidateAssertionExpirationTimer
{
  id v3;
  NSObject *v4;
  NSTimer *expirationTimer;
  uint8_t v6[16];

  if (self->_expirationTimer)
  {
    v3 = _TVRDXPCLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating Lock Screen Assertion Timer", v6, 2u);
    }

    -[NSTimer invalidate](self->_expirationTimer, "invalidate");
    expirationTimer = self->_expirationTimer;
    self->_expirationTimer = 0;

  }
}

- (SBSLockScreenContentAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (NSTimer)expirationTimer
{
  return self->_expirationTimer;
}

- (void)setExpirationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_expirationTimer, a3);
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

void __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Error acquiring SBSSecureAppAssertion %{public}@", a5, a6, a7, a8, 2u);
}

void __50__TVRDAssertionManager_acquireLockScreenAssertion__block_invoke_29_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Error acquiring SBSWakeToRemoteAlertAssertion %{public}@", a5, a6, a7, a8, 2u);
}

@end
