@implementation HDSPIDSServiceManager

- (HDSPIDSServiceManager)initWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDSPIDSServiceManager *v14;

  v4 = a3;
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "supportsNanoSync"))
  {
    HKSPDispatchQueueName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPSerialQueueBackedScheduler();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSPIDSService localServiceWithScheduler:](HDSPIDSService, "localServiceWithScheduler:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v4, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "features");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "sleepCloudKitSync"))
  {
    HKSPDispatchQueueName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPSerialQueueBackedScheduler();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSPIDSService cloudServiceWithScheduler:](HDSPIDSService, "cloudServiceWithScheduler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  v14 = -[HDSPIDSServiceManager initWithEnvironment:localService:cloudService:](self, "initWithEnvironment:localService:cloudService:", v4, v8, v13);
  return v14;
}

- (HDSPIDSServiceManager)initWithEnvironment:(id)a3 localService:(id)a4 cloudService:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDSPIDSServiceManager *v11;
  HDSPIDSServiceManager *v12;
  HDSPIDSServiceManager *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDSPIDSServiceManager;
  v11 = -[HDSPIDSServiceManager init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_storeStrong((id *)&v12->_localService, a4);
    objc_storeStrong((id *)&v12->_cloudService, a5);
    v13 = v12;
  }

  return v12;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "sleepModeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  objc_msgSend(v4, "actionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEventHandler:", self);

  objc_msgSend(v4, "notificationListener");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObserver:", self);
}

- (void)environmentDidBecomeReady:(id)a3
{
  -[HDSPIDSService setDelegate:](self->_localService, "setDelegate:", self);
  -[HDSPIDSService setDelegate:](self->_cloudService, "setDelegate:", self);
}

- (void)sendNotifiedForEarlyWakeUpMessage
{
  HDSPNotifiedForEarlyWakeUpIDSMessage *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  HDSPNotifiedForEarlyWakeUpIDSMessage *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(HDSPNotifiedForEarlyWakeUpIDSMessage);
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2114;
    v9 = v3;
    v5 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing notifiedForEarlyWakeUpMessage %{public}@", (uint8_t *)&v6, 0x16u);

  }
  -[HDSPIDSServiceManager sendMessage:](self, "sendMessage:", v3);

}

- (void)sendTestIDSMessage
{
  HDSPTestIDSMessage *v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  HDSPTestIDSMessage *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(HDSPTestIDSMessage);
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2114;
    v9 = v3;
    v5 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing testIDSMessage %{public}@", (uint8_t *)&v6, 0x16u);

  }
  -[HDSPIDSServiceManager sendMessage:](self, "sendMessage:", v3);

}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  HDSPSetSleepModeIDSMessage *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  HDSPSetSleepModeIDSMessage *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPIDSServiceManager _shouldSyncSleepModeWithReason:](self, "_shouldSyncSleepModeWithReason:", a5, a4))
  {
    v7 = -[HDSPSetSleepModeIDSMessage initWithSleepModeOn:]([HDSPSetSleepModeIDSMessage alloc], "initWithSleepModeOn:", a3 == 2);
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = (id)objc_opt_class();
      v12 = 2114;
      v13 = v7;
      v9 = v11;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing setSleepModeMessage %{public}@", (uint8_t *)&v10, 0x16u);

    }
    -[HDSPIDSServiceManager sendMessage:](self, "sendMessage:", v7);

  }
}

- (BOOL)_shouldSyncSleepModeWithReason:(unint64_t)a3
{
  int v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = -[HDSPIDSServiceManager _shouldSyncMessage](self, "_shouldSyncMessage");
  if (v4)
  {
    v4 = HKSPSleepModeChangeReasonTreatedAsUserRequested();
    if (v4)
    {
      HKSPLogForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = (id)objc_opt_class();
        v6 = v15;
        _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] checking if paired device supports focus mode", (uint8_t *)&v14, 0xCu);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
      objc_msgSend(WeakRetained, "behavior");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hksp_activePairedDeviceSupportsFocusMode");

      if (v9)
      {
        HKSPLogForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_opt_class();
          v14 = 138543362;
          v15 = v11;
          v12 = v11;
          _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] not syncing because paired device supports focus mode", (uint8_t *)&v14, 0xCu);

        }
        LOBYTE(v4) = 0;
      }
      else
      {
        LOBYTE(v4) = 1;
      }
    }
  }
  return v4;
}

- (BOOL)_shouldSyncMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HDSPIDSServiceManager environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v3, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dontSync");

  if (!v6)
  {
LABEL_7:
    v11 = 1;
    goto LABEL_8;
  }
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v3, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] not syncing message for source %{public}@", (uint8_t *)&v13, 0x16u);

  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (void)wakeUpWasConfirmed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  HDSPConfirmWakeUpIDSMessage *v8;
  void *v9;
  void *v10;
  HDSPConfirmWakeUpIDSMessage *v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  HDSPConfirmWakeUpIDSMessage *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPIDSServiceManager _shouldSyncMessage](self, "_shouldSyncMessage"))
  {
    -[HDSPIDSServiceManager environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sleepScheduleModelManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sleepEventRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [HDSPConfirmWakeUpIDSMessage alloc];
    objc_msgSend(v7, "wakeUpEarlyNotificationConfirmedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wakeUpConfirmedUntilDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HDSPConfirmWakeUpIDSMessage initWithWasExplicitConfirmation:wakeUpConfirmedDate:wakeUpConfirmedUntilDate:](v8, "initWithWasExplicitConfirmation:wakeUpConfirmedDate:wakeUpConfirmedUntilDate:", v3, v9, v10);

    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v11;
      v13 = v15;
      _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing confirmWakeUpMessage %{public}@", (uint8_t *)&v14, 0x16u);

    }
    -[HDSPIDSServiceManager sendMessage:](self, "sendMessage:", v11);

  }
}

- (BOOL)_shouldSyncAlarmMessageFromSource:(unint64_t)a3
{
  NSObject *v3;
  id v4;
  const char *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a3 == 2)
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = (id)objc_opt_class();
      v4 = v8;
      v5 = "[%{public}@] not syncing alarm message from Cloud";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (a3 == 1)
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = (id)objc_opt_class();
      v4 = v8;
      v5 = "[%{public}@] not syncing alarm message from NanoSync";
LABEL_7:
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (void)wakeUpAlarmWasDismissedFromSource:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  HDSPSleepAlarmDismissedIDSMessage *v8;
  void *v9;
  HDSPSleepAlarmDismissedIDSMessage *v10;
  NSObject *v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  HDSPSleepAlarmDismissedIDSMessage *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPIDSServiceManager _shouldSyncMessage](self, "_shouldSyncMessage")
    && -[HDSPIDSServiceManager _shouldSyncAlarmMessageFromSource:](self, "_shouldSyncAlarmMessageFromSource:", a3))
  {
    -[HDSPIDSServiceManager environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sleepScheduleModelManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sleepEventRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [HDSPSleepAlarmDismissedIDSMessage alloc];
    objc_msgSend(v7, "wakeUpAlarmDismissedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HDSPSleepAlarmDismissedIDSMessage initWithDismissedDate:](v8, "initWithDismissedDate:", v9);

    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = (id)objc_opt_class();
      v15 = 2114;
      v16 = v10;
      v12 = v14;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing wakeUpAlarmWasDismissed %{public}@", (uint8_t *)&v13, 0x16u);

    }
    -[HDSPIDSServiceManager sendMessage:](self, "sendMessage:", v10);

  }
}

- (void)wakeUpAlarmWasSnoozedFromSource:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  HDSPSleepAlarmSnoozedIDSMessage *v8;
  void *v9;
  HDSPSleepAlarmSnoozedIDSMessage *v10;
  NSObject *v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  HDSPSleepAlarmSnoozedIDSMessage *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPIDSServiceManager _shouldSyncMessage](self, "_shouldSyncMessage")
    && -[HDSPIDSServiceManager _shouldSyncAlarmMessageFromSource:](self, "_shouldSyncAlarmMessageFromSource:", a3))
  {
    -[HDSPIDSServiceManager environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sleepScheduleModelManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sleepEventRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [HDSPSleepAlarmSnoozedIDSMessage alloc];
    objc_msgSend(v7, "wakeUpAlarmSnoozedUntilDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HDSPSleepAlarmSnoozedIDSMessage initWithSnoozedUntilDate:](v8, "initWithSnoozedUntilDate:", v9);

    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = (id)objc_opt_class();
      v15 = 2114;
      v16 = v10;
      v12 = v14;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing wakeUpAlarmWasSnoozed %{public}@", (uint8_t *)&v13, 0x16u);

    }
    -[HDSPIDSServiceManager sendMessage:](self, "sendMessage:", v10);

  }
}

- (void)goodMorningWasDismissed
{
  void *v3;
  void *v4;
  void *v5;
  HDSPDismissGoodMorningIDSMessage *v6;
  void *v7;
  HDSPDismissGoodMorningIDSMessage *v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  HDSPDismissGoodMorningIDSMessage *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPIDSServiceManager _shouldSyncMessage](self, "_shouldSyncMessage"))
  {
    -[HDSPIDSServiceManager environment](self, "environment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sleepScheduleModelManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sleepEventRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [HDSPDismissGoodMorningIDSMessage alloc];
    objc_msgSend(v5, "goodMorningDismissedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HDSPDismissGoodMorningIDSMessage initWithGoodMorningDismissedDate:](v6, "initWithGoodMorningDismissedDate:", v7);

    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = (id)objc_opt_class();
      v13 = 2114;
      v14 = v8;
      v10 = v12;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing dismissGoodMorningMessage %{public}@", (uint8_t *)&v11, 0x16u);

    }
    -[HDSPIDSServiceManager sendMessage:](self, "sendMessage:", v8);

  }
}

- (id)eventIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BEA95C0]);
}

- (void)sleepEventIsDue:(id)a3
{
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEA95C0]);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSPIDSServiceManager.m"), 196, CFSTR("Unexpected event received"));

  }
  -[HDSPIDSServiceManager sendNotifiedForEarlyWakeUpMessage](self, "sendNotifiedForEarlyWakeUpMessage");
}

- (void)sendMessage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  id v8;

  v4 = a3;
  v5 = v4;
  v8 = v4;
  if (self->_localService)
  {
    v6 = objc_msgSend(v4, "destinations");
    v5 = v8;
    if ((v6 & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "_sendMessage:onService:", v8, self->_localService);
      v5 = v8;
    }
  }
  if (self->_cloudService)
  {
    v7 = -[HDSPIDSServiceManager _shouldSendCloudMessage:](self, "_shouldSendCloudMessage:", v8);
    v5 = v8;
    if (v7)
    {
      objc_msgSend((id)objc_opt_class(), "_sendMessage:onService:", v8, self->_cloudService);
      v5 = v8;
    }
  }

}

- (BOOL)_shouldSendCloudMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPIDSServiceManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepScheduleModelManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "shareAcrossDevices") & 1) != 0)
  {
    v8 = ((unint64_t)objc_msgSend(v4, "destinations") >> 1) & 1;
  }
  else
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = (id)objc_opt_class();
      v10 = v13;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] not sending cloud message because share across devices is disabled", (uint8_t *)&v12, 0xCu);

    }
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (void)_sendMessage:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = (id)objc_opt_class();
    v18 = 2114;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    v9 = v17;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sending message %{public}@ on service %{public}@", buf, 0x20u);

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__HDSPIDSServiceManager__sendMessage_onService___block_invoke;
  v12[3] = &unk_24D4E53B8;
  v14 = v7;
  v15 = a1;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v10, "sendMessage:completion:", v11, v12);

}

void __48__HDSPIDSServiceManager__sendMessage_onService___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v12 = (void *)objc_opt_class();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138544130;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    v19 = 2114;
    v20 = v5;
    v21 = 2114;
    v22 = v14;
    v11 = v12;
    _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to send message %{public}@ with error %{public}@ on service %{public}@", (uint8_t *)&v15, 0x2Au);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v15 = 138543874;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    v11 = v8;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sent message %{public}@ on service %{public}@", (uint8_t *)&v15, 0x20u);
LABEL_4:

  }
LABEL_6:

}

+ (id)_allowedMessageClasses
{
  if (qword_253DE8F18 != -1)
    dispatch_once(&qword_253DE8F18, &__block_literal_global_14);
  return (id)_MergedGlobals_17;
}

void __47__HDSPIDSServiceManager__allowedMessageClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_17;
  _MergedGlobals_17 = v2;

}

- (void)service:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543874;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v6;
    v9 = v11;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] received message %{public}@ from service %{public}@", (uint8_t *)&v10, 0x20u);

  }
  if (-[HDSPIDSServiceManager _shouldHandleMessageFromService:](self, "_shouldHandleMessageFromService:", v6))
    -[HDSPIDSServiceManager _handleReceivedMessage:](self, "_handleReceivedMessage:", v7);

}

- (BOOL)_shouldHandleMessageFromService:(id)a3
{
  HDSPIDSService *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  id v12;
  const char *v13;
  BOOL v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (HDSPIDSService *)a3;
  -[HDSPIDSServiceManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepScheduleModelManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPIDSServiceManager environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isAppleWatch"))
  {
    v10 = objc_msgSend(v7, "watchSleepFeaturesEnabled");

    if ((v10 & 1) == 0)
    {
      HKSPLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138543362;
        v17 = (id)objc_opt_class();
        v12 = v17;
        v13 = "[%{public}@] ignoring message because watch sleep features are disabled";
LABEL_11:
        _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0xCu);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {

  }
  if (self->_cloudService == v4 && (objc_msgSend(v7, "shareAcrossDevices") & 1) == 0)
  {
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = (id)objc_opt_class();
      v12 = v17;
      v13 = "[%{public}@] ignoring cloud message because share across devices is disabled";
      goto LABEL_11;
    }
LABEL_12:

    v14 = 0;
    goto LABEL_13;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (void)_handleReceivedMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HDSPIDSServiceManager *v9;

  v4 = a3;
  -[HDSPIDSServiceManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HDSPIDSServiceManager__handleReceivedMessage___block_invoke;
  v7[3] = &unk_24D4E3680;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "perform:withSource:", v7, self);

}

void __48__HDSPIDSServiceManager__handleReceivedMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleSetSleepModeMessage:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_handleConfirmWakeUpMessage:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "_handleDismissGoodMorningMessage:", *(_QWORD *)(a1 + 32));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "_handleNotifiedForEarlyWakeUpMessage:", *(_QWORD *)(a1 + 32));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "_handleSleepAlarmDismissedMessage:", *(_QWORD *)(a1 + 32));
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 40), "_handleSleepAlarmSnoozedMessage:", *(_QWORD *)(a1 + 32));
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(*(id *)(a1 + 40), "_handleTestMessage:", *(_QWORD *)(a1 + 32));
              }
              else
              {
                HKSPLogForCategory();
                v2 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
                {
                  v3 = (void *)objc_opt_class();
                  v4 = *(_QWORD *)(a1 + 32);
                  v6 = 138543618;
                  v7 = v3;
                  v8 = 2114;
                  v9 = v4;
                  v5 = v3;
                  _os_log_error_impl(&dword_21610C000, v2, OS_LOG_TYPE_ERROR, "[%{public}@] unexpected message received %{public}@", (uint8_t *)&v6, 0x16u);

                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_handleSetSleepModeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 138543618;
    *(_QWORD *)&v10[4] = objc_opt_class();
    *(_WORD *)&v10[12] = 2114;
    *(_QWORD *)&v10[14] = v4;
    v6 = *(id *)&v10[4];
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleSetSleepModeMessage: %{public}@", v10, 0x16u);

  }
  -[HDSPIDSServiceManager environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepModeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "sleepModeOn"))
    v9 = 2;
  else
    v9 = 0;
  objc_msgSend(v8, "setSleepMode:reason:", v9, 5, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);

}

- (void)_handleConfirmWakeUpMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v4;
    v6 = v13;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleConfirmWakeUpMessage: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  -[HDSPIDSServiceManager environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "wasExplicitConfirmation");
  objc_msgSend(v4, "wakeUpConfirmedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wakeUpConfirmedUntilDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "confirmWakeUp:date:confirmUntilDate:", v9, v10, v11);

}

- (void)_handleDismissGoodMorningMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v4;
    v6 = v11;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleDismissGoodMorningMessage: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[HDSPIDSServiceManager environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "goodMorningDismissed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissGoodMorningOnDate:", v9);

}

- (void)_handleNotifiedForEarlyWakeUpMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2114;
    v12 = v4;
    v6 = v10;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleNotifiedForEarlyWakeUpMessage: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[HDSPIDSServiceManager environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wakeDetectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "earlyWakeUpWasNotifiedRemotely");

}

- (void)_handleSleepAlarmDismissedMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPIDSServiceManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hksp_supportsSleepAlarms");

  if ((v7 & 1) == 0)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = (id)objc_opt_class();
      v15 = 2114;
      v16 = v4;
      v9 = v14;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleSleepAlarmDismissedMessage: %{public}@", (uint8_t *)&v13, 0x16u);

    }
    -[HDSPIDSServiceManager environment](self, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sleepAlarmDismissedOnDate:source:", v12, 2);

  }
}

- (void)_handleSleepAlarmSnoozedMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPIDSServiceManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hksp_supportsSleepAlarms");

  if ((v7 & 1) == 0)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = (id)objc_opt_class();
      v15 = 2114;
      v16 = v4;
      v9 = v14;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleSleepAlarmSnoozedMessage: %{public}@", (uint8_t *)&v13, 0x16u);

    }
    -[HDSPIDSServiceManager environment](self, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snoozedUntilDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sleepAlarmSnoozedUntilDate:source:", v12, 2);

  }
}

- (void)_handleTestMessage:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2114;
    v9 = v3;
    v5 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleTestMessage: %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

- (NSString)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)dontSync
{
  return 1;
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.sleepd.ids.test")))
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 138543618;
      *(_QWORD *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(_QWORD *)&v10[14] = v5;
      v7 = *(id *)&v10[4];
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v10, 0x16u);

    }
    -[HDSPIDSServiceManager sendTestIDSMessage](self, "sendTestIDSMessage");
  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPIDSService)localService
{
  return self->_localService;
}

- (HDSPIDSService)cloudService
{
  return self->_cloudService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudService, 0);
  objc_storeStrong((id *)&self->_localService, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
