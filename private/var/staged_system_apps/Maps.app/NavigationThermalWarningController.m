@implementation NavigationThermalWarningController

- (NavigationThermalWarningController)init
{
  NavigationThermalWarningController *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  NavigationThermalWarningController *v10;

  v8.receiver = self;
  v8.super_class = (Class)NavigationThermalWarningController;
  v2 = -[NavigationThermalWarningController init](&v8, "init");
  if (v2)
  {
    v3 = sub_10024FFC0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Enabling thermal level monitoring", buf, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
    objc_msgSend(v5, "addObserver:forMitigationNamed:", v2, CFSTR("NavigationDisableLockScreen"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
    objc_msgSend(v6, "startMonitoringWithObserver:", v2);

    -[NavigationThermalWarningController _checkIfLockScreenMitigationShouldActivate](v2, "_checkIfLockScreenMitigationShouldActivate");
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  NavigationThermalWarningController *v8;

  v3 = sub_10024FFC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Disabling thermal level monitoring", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  objc_msgSend(v5, "stopMonitoringWithObserver:", self);

  -[NavigationThermalWarningController _tearDownNotificationIfNeeded](self, "_tearDownNotificationIfNeeded");
  -[NavigationThermalWarningController _clearIdleTimerIfNeeded](self, "_clearIdleTimerIfNeeded");
  v6.receiver = self;
  v6.super_class = (Class)NavigationThermalWarningController;
  -[NavigationThermalWarningController dealloc](&v6, "dealloc");
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  _BOOL4 active;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  NavigationThermalWarningController *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;

  if (self->_active != a3)
  {
    v3 = a3;
    v5 = sub_10024FFC0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      active = self->_active;
      v13 = 134349568;
      v14 = self;
      v15 = 1024;
      v16 = active;
      v17 = 1024;
      v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Active state changed: %d => %d", (uint8_t *)&v13, 0x18u);
    }

    self->_active = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationThermalWarningController changeHandler](self, "changeHandler"));

    if (v8)
    {
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NavigationThermalWarningController changeHandler](self, "changeHandler"));
      v9[2](v9, v3);

    }
    v10 = sub_10024FFC0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v12)
      {
        v13 = 134349056;
        v14 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Thermal level is dangerous", (uint8_t *)&v13, 0xCu);
      }

      -[NavigationThermalWarningController _lockAndStartIdleTimer](self, "_lockAndStartIdleTimer");
      -[NavigationThermalWarningController _sendNotificationIfNeccessary](self, "_sendNotificationIfNeccessary");
    }
    else
    {
      if (v12)
      {
        v13 = 134349056;
        v14 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Thermal level is normal", (uint8_t *)&v13, 0xCu);
      }

      -[NavigationThermalWarningController _clearIdleTimerIfNeeded](self, "_clearIdleTimerIfNeeded");
      -[NavigationThermalWarningController _tearDownNotificationIfNeeded](self, "_tearDownNotificationIfNeeded");
    }
  }
}

- (void)_lockAndStartIdleTimer
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  BSInvalidatable *idleTimerAssertion;
  BSInvalidatable *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  BSInvalidatable *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  uint8_t buf[4];
  NavigationThermalWarningController *v22;
  __int16 v23;
  BSInvalidatable *v24;

  v3 = sub_10024FFC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Force lock the screen", buf, 0xCu);
  }

  SBSLockDevice(0, 0);
  if (!self->_idleTimerAssertion)
  {
    v5 = sub_10024FFC0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Taking timer assertion", buf, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SBIdleTimerRequestConfiguration configurationWithMinimumExpirationTimeout:maximumExpirationTimeout:](SBIdleTimerRequestConfiguration, "configurationWithMinimumExpirationTimeout:maximumExpirationTimeout:", 5.0, 60.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ITIdleTimerState sharedInstance](ITIdleTimerState, "sharedInstance"));
    v20 = 0;
    v9 = (BSInvalidatable *)objc_msgSend(v8, "newIdleTimerAssertionWithConfiguration:forReason:error:", v7, CFSTR("high thermal level during navigation"), &v20);
    v10 = (BSInvalidatable *)v20;
    idleTimerAssertion = self->_idleTimerAssertion;
    self->_idleTimerAssertion = v9;

    v12 = self->_idleTimerAssertion;
    v13 = sub_10024FFC0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = self->_idleTimerAssertion;
        *(_DWORD *)buf = 134349314;
        v22 = self;
        v23 = 2112;
        v24 = v16;
        v17 = "[%{public}p] Successfully acquired idle time assertion: %@";
        v18 = v15;
        v19 = OS_LOG_TYPE_INFO;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349314;
      v22 = self;
      v23 = 2112;
      v24 = v10;
      v17 = "[%{public}p] Error acquiring idle timer assertion: %@";
      v18 = v15;
      v19 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }

  }
}

- (void)_sendNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  __CFUserNotification *notification;
  SInt32 error;
  uint8_t buf[4];
  NavigationThermalWarningController *v18;
  __int16 v19;
  const __CFDictionary *v20;
  __int16 v21;
  SInt32 v22;
  _QWORD v23[12];
  _QWORD v24[12];

  -[NavigationThermalWarningController _tearDownNotificationIfNeeded](self, "_tearDownNotificationIfNeeded");
  v23[0] = kCFUserNotificationAlertHeaderKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationThermalWarningController _localizedTitle](self, "_localizedTitle"));
  v24[0] = v3;
  v23[1] = kCFUserNotificationAlertMessageKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationThermalWarningController _localizedMessage](self, "_localizedMessage"));
  v24[1] = v4;
  v24[2] = &__kCFBooleanTrue;
  v23[2] = kCFUserNotificationAlertTopMostKey;
  v23[3] = SBUserNotificationLockScreenAlertHeaderKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationThermalWarningController _localizedTitle](self, "_localizedTitle"));
  v24[3] = v5;
  v23[4] = SBUserNotificationLockScreenAlertMessageKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationThermalWarningController _localizedMessage](self, "_localizedMessage"));
  v24[4] = v6;
  v24[5] = &__kCFBooleanTrue;
  v23[5] = SBUserNotificationAllowInSetupKey;
  v23[6] = SBUserNotificationAllowInLoginWindow;
  v24[6] = &__kCFBooleanTrue;
  v24[7] = &__kCFBooleanFalse;
  v23[7] = SBUserNotificationDismissOnLock;
  v23[8] = SBUserNotificationDontDismissOnUnlock;
  v24[8] = &__kCFBooleanFalse;
  v24[9] = &__kCFBooleanFalse;
  v23[9] = SBUserNotificationForcesModalAlertAppearance;
  v23[10] = SBUserNotificationIgnoresQuietMode;
  v23[11] = SBUserNotificationWakeDisplay;
  v24[10] = &__kCFBooleanTrue;
  v24[11] = &__kCFBooleanFalse;
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 12));

  error = 0;
  self->_notification = CFUserNotificationCreate(0, 0.0, 0x20uLL, &error, v7);
  LODWORD(v4) = error;
  v8 = sub_10024FFC0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349570;
      v18 = self;
      v19 = 2112;
      v20 = v7;
      v21 = 1024;
      v22 = error;
      v11 = "[%{public}p] Unable to create notification: %@ error: %d";
      v12 = v10;
      v13 = OS_LOG_TYPE_FAULT;
      v14 = 28;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, v14);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    notification = self->_notification;
    *(_DWORD *)buf = 134349314;
    v18 = self;
    v19 = 2112;
    v20 = notification;
    v11 = "[%{public}p] Successfully created notification: %@";
    v12 = v10;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 22;
    goto LABEL_6;
  }

}

- (void)_clearIdleTimerIfNeeded
{
  id v3;
  NSObject *v4;
  BSInvalidatable *idleTimerAssertion;
  BSInvalidatable *v6;
  int v7;
  NavigationThermalWarningController *v8;
  __int16 v9;
  BSInvalidatable *v10;

  if (self->_idleTimerAssertion)
  {
    v3 = sub_10024FFC0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      idleTimerAssertion = self->_idleTimerAssertion;
      v7 = 134349314;
      v8 = self;
      v9 = 2112;
      v10 = idleTimerAssertion;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Clearing previous idle timer assertion: %@", (uint8_t *)&v7, 0x16u);
    }

    -[BSInvalidatable invalidate](self->_idleTimerAssertion, "invalidate");
    v6 = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0;

  }
}

- (void)_tearDownNotificationIfNeeded
{
  id v3;
  NSObject *v4;
  __CFUserNotification *notification;
  SInt32 v6;
  SInt32 v7;
  id v8;
  NSObject *v9;
  __CFUserNotification *v10;
  int v11;
  NavigationThermalWarningController *v12;
  __int16 v13;
  __CFUserNotification *v14;
  __int16 v15;
  SInt32 v16;

  if (self->_notification)
  {
    v3 = sub_10024FFC0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      notification = self->_notification;
      v11 = 134349314;
      v12 = self;
      v13 = 2112;
      v14 = notification;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Cancelling notification: %@", (uint8_t *)&v11, 0x16u);
    }

    v6 = CFUserNotificationCancel(self->_notification);
    if (v6)
    {
      v7 = v6;
      v8 = sub_10024FFC0();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v10 = self->_notification;
        v11 = 134349570;
        v12 = self;
        v13 = 2112;
        v14 = v10;
        v15 = 1024;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "[%{public}p] Unable to cancel notification: %@ statusCode: %d", (uint8_t *)&v11, 0x1Cu);
      }

    }
    CFRelease(self->_notification);
    self->_notification = 0;
  }
}

- (id)_localizedMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("unknown_device_cooldown"), CFSTR("localized string not found"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3));

  return v6;
}

- (id)_localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("temperature_title"), CFSTR("localized string not found"), 0));

  return v3;
}

- (void)_sendNotificationIfNeccessary
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  const char *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  id v12;
  _BOOL4 v13;
  int v14;
  NavigationThermalWarningController *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "isLocked");

  if (v4)
  {
    if (!-[NavigationThermalWarningController isActive](self, "isActive") || self->_notification)
    {
      v5 = sub_10024FFC0();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
LABEL_7:

        return;
      }
      v14 = 134349056;
      v15 = self;
      v7 = "[%{public}p] Screen is locked";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v14, 0xCu);
      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v11 = objc_msgSend(v10, "isCurrentlyConnectedToAnyCarScene");

    v12 = sub_10024FFC0();
    v6 = objc_claimAutoreleasedReturnValue(v12);
    v13 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (!v13)
        goto LABEL_7;
      v14 = 134349056;
      v15 = self;
      v7 = "[%{public}p] Screen is locked and the phone is still hot but CarPlay is connected; not showing notification";
      goto LABEL_6;
    }
    if (v13)
    {
      v14 = 134349056;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Screen is locked and the phone is still hot; showing notification",
        (uint8_t *)&v14,
        0xCu);
    }

    -[NavigationThermalWarningController _sendNotification](self, "_sendNotification");
  }
  else
  {
    v8 = sub_10024FFC0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = 134349056;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Device is unlocked; tearing down notification",
        (uint8_t *)&v14,
        0xCu);
    }

    -[NavigationThermalWarningController _tearDownNotificationIfNeeded](self, "_tearDownNotificationIfNeeded");
  }
}

- (void)didUpdateMitigationNamed:(id)a3
{
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NavigationDisableLockScreen")))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100250D08;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_checkIfLockScreenMitigationShouldActivate
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  NavigationThermalWarningController *v7;
  __int16 v8;
  const char *v9;

  v3 = sub_10024FFC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134349314;
    v7 = self;
    v8 = 2080;
    v9 = "-[NavigationThermalWarningController _checkIfLockScreenMitigationShouldActivate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] %s", (uint8_t *)&v6, 0x16u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  -[NavigationThermalWarningController setActive:](self, "setActive:", objc_msgSend(v5, "shouldActivateMitigationNamed:", CFSTR("NavigationDisableLockScreen")));

}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
}

@end
