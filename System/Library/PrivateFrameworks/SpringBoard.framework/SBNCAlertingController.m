@implementation SBNCAlertingController

- (SBNCAlertingController)init
{
  -[SBNCAlertingController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (SBNCAlertingController)initWithSoundController:(id)a3 screenController:(id)a4 lockScreenManager:(id)a5 communicationPolicyManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBNCAlertingController *v15;
  SBNCAlertingController *v16;
  uint64_t v17;
  NSMutableSet *realertTimers;
  id v19;
  void *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBNCAlertingController;
  v15 = -[SBNCAlertingController init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_soundController, a3);
    objc_storeStrong((id *)&v16->_screenController, a4);
    objc_storeStrong((id *)&v16->_lockScreenManager, a5);
    objc_storeStrong((id *)&v16->_communicationPolicyManager, a6);
    v17 = objc_opt_new();
    realertTimers = v16->_realertTimers;
    v16->_realertTimers = (NSMutableSet *)v17;

    v19 = (id)objc_msgSend(MEMORY[0x1E0D70A30], "sharedInstance");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v16, sel__hardwareButtonPressed_, *MEMORY[0x1E0DAC380], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v16, sel__hardwareButtonPressed_, *MEMORY[0x1E0DAC378], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v16, sel__hardwareButtonPressed_, *MEMORY[0x1E0DAC350], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v16, sel__hardwareButtonPressed_, *MEMORY[0x1E0DAC358], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v16, sel__hardwareButtonPressed_, *MEMORY[0x1E0DAC3F8], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v16, sel__lockStateChanged, CFSTR("SBAggregateLockStateDidChangeNotification"), 0);

  }
  return v16;
}

- (void)alertOnPostForNotificationRequest:(id)a3 forRequestDestinations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  int v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBNCAlertingController lockScreenManager](self, "lockScreenManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isUILocked");

  objc_msgSend((id)SBApp, "notificationDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCarDestinationActive");

  v12 = -[SBNCAlertingController _activeAlertDestinationsInRequestDestinations:](self, "_activeAlertDestinationsInRequestDestinations:", v7);
  v13 = objc_msgSend(v6, "sb_shouldSuppressAlert");
  v14 = -[SBNCAlertingController _shouldScreenTimeSuppressNotificationRequest:](self, "_shouldScreenTimeSuppressNotificationRequest:", v6);
  v15 = (v9 | ~(v12 | v13)) & ((v11 | v14) ^ 1);
  v16 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v9;
    if (v15)
      v17 = CFSTR("Alerting");
    else
      v17 = CFSTR("Not alerting");
    v18 = v16;
    objc_msgSend(v6, "notificationIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "un_logDigest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v23 = v17;
    v24 = 2114;
    v25 = v20;
    v26 = 1024;
    v27 = v21;
    v28 = 1024;
    v29 = v12;
    v30 = 1024;
    v31 = v13;
    v32 = 1024;
    v33 = v14;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ on post for request %{public}@. uiLocked=%d activeAlertDestinations=%d suppressAlertForContext=%d shouldSuppressForScreenTime=%d", buf, 0x2Eu);

  }
  if (v15)
  {
    -[SBNCAlertingController _alertNowForNotificationRequest:](self, "_alertNowForNotificationRequest:", v6);
    -[SBNCAlertingController _scheduleRealertsForNotificationRequest:](self, "_scheduleRealertsForNotificationRequest:", v6);
  }

}

- (void)alertOnPresentationForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "notificationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "un_logDigest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Alerting on presentation for request %{public}@", (uint8_t *)&v12, 0xCu);

  }
  -[SBNCAlertingController _alertNowForNotificationRequest:presentingDestination:](self, "_alertNowForNotificationRequest:presentingDestination:", v6, v7);

}

- (void)killAlertsForNotificationRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBNCAlertingController soundController](self, "soundController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopSoundForNotificationRequest:", v5);

  -[SBNCAlertingController _killRealertsForNotificationRequest:](self, "_killRealertsForNotificationRequest:", v5);
}

- (void)killRealerts
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SBNCAlertingController activeRequestWithRealerts](self, "activeRequestWithRealerts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0DC5F70];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[SBNCAlertingController activeRequestWithRealerts](self, "activeRequestWithRealerts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "notificationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "un_logDigest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Killing realerts for request %{public}@", (uint8_t *)&v11, 0xCu);

    }
    -[SBNCAlertingController realertTimers](self, "realertTimers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "makeObjectsPerformSelector:", sel_invalidate);

    -[SBNCAlertingController realertTimers](self, "realertTimers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    -[SBNCAlertingController setActiveRequestWithRealerts:](self, "setActiveRequestWithRealerts:", 0);
  }
}

- (void)resetAutomaticLockStateForNotificationRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBNCAlertingController screenController](self, "screenController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetAutomaticLockStateForNotificationRequest:", v4);

}

- (void)_alertNowForNotificationRequest:(id)a3
{
  -[SBNCAlertingController _alertNowForNotificationRequest:presentingDestination:](self, "_alertNowForNotificationRequest:presentingDestination:", a3, 0);
}

- (void)_alertNowForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SBNCAlertingController soundController](self, "soundController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playSoundAndReadOutForNotificationRequest:presentingDestination:", v7, v6);

  -[SBNCAlertingController screenController](self, "screenController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "turnOnScreenIfPossibleForNotificationRequest:", v7);

}

- (void)_lockStateChanged
{
  void *v3;
  char v4;

  -[SBNCAlertingController lockScreenManager](self, "lockScreenManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");

  if ((v4 & 1) == 0)
    -[SBNCAlertingController killRealerts](self, "killRealerts");
}

- (BOOL)_activeAlertDestinationsInRequestDestinations:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0DC60B8]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0DC60C0]);

  return v4;
}

- (BOOL)_shouldScreenTimeSuppressNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "overridesDowntime") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBNCAlertingController _shouldScreenTimeSuppressNotificationsForBundleIdentifier:](self, "_shouldScreenTimeSuppressNotificationsForBundleIdentifier:", v7);

  }
  return v6;
}

- (BOOL)_shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[SBNCAlertingController _isBundleIdentifierBlockedForScreenTimeExpiration:](self, "_isBundleIdentifierBlockedForScreenTimeExpiration:", v4)|| -[SBNCAlertingController _isBundleIdentifierBlockedForCommunicationPolicy:](self, "_isBundleIdentifierBlockedForCommunicationPolicy:", v4);

  return v5;
}

- (BOOL)_isBundleIdentifierBlockedForScreenTimeExpiration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "isBlockedForScreenTimeExpiration");

  return (char)v3;
}

- (BOOL)_isBundleIdentifierBlockedForCommunicationPolicy:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[SBCommunicationPolicyManager sharedInstance](SBCommunicationPolicyManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldScreenTimeSuppressNotificationsForBundleIdentifier:", v3);

  return v5;
}

- (BOOL)_shouldRealert
{
  void *v3;
  void *v4;
  int v5;

  -[SBNCAlertingController lockScreenManager](self, "lockScreenManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isUILocked"))
  {
    -[SBNCAlertingController lockScreenManager](self, "lockScreenManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInLostMode") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_killRealertsForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBNCAlertingController activeRequestWithRealerts](self, "activeRequestWithRealerts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((_DWORD)v4)
    -[SBNCAlertingController killRealerts](self, "killRealerts");
}

- (void)_realertTimerFired:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[SBNCAlertingController _shouldRealert](self, "_shouldRealert"))
  {
    -[SBNCAlertingController realertTimers](self, "realertTimers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "containsObject:", v7))
    {
LABEL_5:

      goto LABEL_6;
    }
    -[SBNCAlertingController activeRequestWithRealerts](self, "activeRequestWithRealerts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SBNCAlertingController activeRequestWithRealerts](self, "activeRequestWithRealerts");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBNCAlertingController _alertNowForNotificationRequest:](self, "_alertNowForNotificationRequest:", v4);
      goto LABEL_5;
    }
  }
LABEL_6:
  -[SBNCAlertingController realertTimers](self, "realertTimers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

}

- (void)_scheduleRealertsForNotificationRequest:(id)a3
{
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "realertCount");

  v6 = -[SBNCAlertingController _shouldRealert](self, "_shouldRealert");
  if (v15 && v6 && v5)
  {
    -[SBNCAlertingController killRealerts](self, "killRealerts");
    -[SBNCAlertingController setActiveRequestWithRealerts:](self, "setActiveRequestWithRealerts:", v15);
    v7 = 0;
    v8 = 120;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.springboard.alertingcontroller.realert-%ld"), ++v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0D70A38]);
      objc_msgSend(v15, "notificationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", v9, self, sel__realertTimerFired_, v11, (double)v8);

      objc_msgSend(v12, "setUserVisible:", 1);
      objc_msgSend(v12, "setMinimumEarlyFireProportion:", 1.0);
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scheduleInRunLoop:", v13);

      -[SBNCAlertingController realertTimers](self, "realertTimers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v12);

      v8 += 120;
    }
    while (v5 != v7);
  }

}

- (SBNCSoundController)soundController
{
  return self->_soundController;
}

- (void)setSoundController:(id)a3
{
  objc_storeStrong((id *)&self->_soundController, a3);
}

- (SBNCScreenController)screenController
{
  return self->_screenController;
}

- (void)setScreenController:(id)a3
{
  objc_storeStrong((id *)&self->_screenController, a3);
}

- (SBLockScreenManager)lockScreenManager
{
  return self->_lockScreenManager;
}

- (void)setLockScreenManager:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenManager, a3);
}

- (SBCommunicationPolicyManager)communicationPolicyManager
{
  return self->_communicationPolicyManager;
}

- (void)setCommunicationPolicyManager:(id)a3
{
  objc_storeStrong((id *)&self->_communicationPolicyManager, a3);
}

- (NCNotificationRequest)activeRequestWithRealerts
{
  return self->_activeRequestWithRealerts;
}

- (void)setActiveRequestWithRealerts:(id)a3
{
  objc_storeStrong((id *)&self->_activeRequestWithRealerts, a3);
}

- (NSMutableSet)realertTimers
{
  return self->_realertTimers;
}

- (void)setRealertTimers:(id)a3
{
  objc_storeStrong((id *)&self->_realertTimers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realertTimers, 0);
  objc_storeStrong((id *)&self->_activeRequestWithRealerts, 0);
  objc_storeStrong((id *)&self->_communicationPolicyManager, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_screenController, 0);
  objc_storeStrong((id *)&self->_soundController, 0);
}

@end
