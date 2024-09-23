@implementation RTBatteryManager

- (RTBatteryManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_notificationHelper_);
}

- (RTBatteryManager)initWithQueue:(id)a3
{
  id v4;
  void *v5;
  RTBatteryManager *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[RTBatteryManager initWithQueue:notificationHelper:](self, "initWithQueue:notificationHelper:", v4, v5);

  return v6;
}

- (RTBatteryManager)initWithQueue:(id)a3 notificationHelper:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RTBatteryManager *v9;
  RTBatteryManager *v10;
  RTBatteryManager *v11;
  NSObject *v12;
  const char *v13;
  objc_super v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v11 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: queue";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: notificationHelper";
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)RTBatteryManager;
  v9 = -[RTNotifier initWithQueue:](&v15, sel_initWithQueue_, v6);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationHelper, a4);
    v10->_externalConnectionState = objc_msgSend((id)objc_opt_class(), "currentExternalConnectionState");
  }
  self = v10;
  v11 = self;
LABEL_10:

  return v11;
}

+ (id)externalConnectionStateToString:(int64_t)a3
{
  if (a3)
    return CFSTR("Connected");
  else
    return CFSTR("Disconnected");
}

- (void)dealloc
{
  objc_super v3;

  -[RTBatteryManager _unregisterForNotifications](self, "_unregisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)RTBatteryManager;
  -[RTBatteryManager dealloc](&v3, sel_dealloc);
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[RTBatteryManager _unregisterForNotifications](self, "_unregisterForNotifications");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)_unregisterForNotifications
{
  -[RTDarwinNotificationHelper removeObserverForNotificationName:](self->_notificationHelper, "removeObserverForNotificationName:", CFSTR("com.apple.system.powermanagement.poweradapter"));
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  int v8;
  RTBatteryManagerNotificationChargerConnected *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  +[RTNotification notificationName](RTBatteryManagerNotificationChargerConnected, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v6) == 1)
      -[RTBatteryManager setMonitorBatteryStatusChanges:](self, "setMonitorBatteryStatusChanges:", 1);
    v9 = -[RTBatteryManagerNotificationChargerConnected initWithChargerConnected:]([RTBatteryManagerNotificationChargerConnected alloc], "initWithChargerConnected:", self->_externalConnectionState == 1);
    if (v9)
      -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v9, v10);

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  void *v5;
  int v6;
  id v7;

  v7 = a4;
  +[RTNotification notificationName](RTBatteryManagerNotificationChargerConnected, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if (v6 && !-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v7))
    -[RTBatteryManager setMonitorBatteryStatusChanges:](self, "setMonitorBatteryStatusChanges:", 0);

}

- (void)setMonitorBatteryStatusChanges:(BOOL)a3
{
  if (self->_monitorBatteryStatusChanges != a3)
  {
    self->_monitorBatteryStatusChanges = a3;
    if (a3)
      -[RTBatteryManager startMonitoringBatteryStatusChanges](self, "startMonitoringBatteryStatusChanges");
    else
      -[RTBatteryManager stopMonitoringBatteryStatusChanges](self, "stopMonitoringBatteryStatusChanges");
  }
}

- (void)startMonitoringBatteryStatusChanges
{
  NSObject *v3;
  RTDarwinNotificationHelper *notificationHelper;
  _QWORD v5[4];
  id v6;
  id buf[2];

  _rt_log_facility_get_os_log(RTLogFacilityBattery);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "start monitoring battery status changes", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  notificationHelper = self->_notificationHelper;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__RTBatteryManager_startMonitoringBatteryStatusChanges__block_invoke;
  v5[3] = &unk_1E92983E8;
  objc_copyWeak(&v6, buf);
  -[RTDarwinNotificationHelper addObserverForNotificationName:handler:](notificationHelper, "addObserverForNotificationName:handler:", CFSTR("com.apple.system.powermanagement.poweradapter"), v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __55__RTBatteryManager_startMonitoringBatteryStatusChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__RTBatteryManager_startMonitoringBatteryStatusChanges__block_invoke_2;
    block[3] = &unk_1E92977B8;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __55__RTBatteryManager_startMonitoringBatteryStatusChanges__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBatteryStatus:", objc_msgSend((id)objc_opt_class(), "currentExternalConnectionState"));
}

- (void)stopMonitoringBatteryStatusChanges
{
  NSObject *v3;
  uint8_t v4[16];

  _rt_log_facility_get_os_log(RTLogFacilityBattery);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "stop monitoring battery status changes", v4, 2u);
  }

  -[RTDarwinNotificationHelper removeObserverForNotificationName:](self->_notificationHelper, "removeObserverForNotificationName:", CFSTR("com.apple.system.powermanagement.poweradapter"));
}

+ (int64_t)currentExternalConnectionState
{
  return objc_msgSend((id)objc_opt_class(), "_ioDrawingUnlimitedPower");
}

- (void)updateBatteryStatus:(int64_t)a3
{
  int64_t externalConnectionState;
  NSObject *v5;
  void *v6;
  void *v7;
  int64_t v8;
  RTBatteryManagerNotificationChargerConnected *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  externalConnectionState = self->_externalConnectionState;
  self->_externalConnectionState = a3;
  _rt_log_facility_get_os_log(RTLogFacilityBattery);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    +[RTBatteryManager externalConnectionStateToString:](RTBatteryManager, "externalConnectionStateToString:", externalConnectionState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTBatteryManager externalConnectionStateToString:](RTBatteryManager, "externalConnectionStateToString:", self->_externalConnectionState);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "charger connected state changed from, %{public}@, to, %{public}@", (uint8_t *)&v10, 0x16u);

  }
  v8 = self->_externalConnectionState;
  if (externalConnectionState != v8)
  {
    v9 = -[RTBatteryManagerNotificationChargerConnected initWithChargerConnected:]([RTBatteryManagerNotificationChargerConnected alloc], "initWithChargerConnected:", v8 == 1);
    if (v9)
      -[RTNotifier postNotification:](self, "postNotification:", v9);

  }
}

- (void)fetchCurrentChargerConnectionState:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__RTBatteryManager_fetchCurrentChargerConnectionState___block_invoke;
    v7[3] = &unk_1E9297678;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

    v6 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[RTBatteryManager fetchCurrentChargerConnectionState:]";
      v11 = 1024;
      v12 = 199;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

uint64_t __55__RTBatteryManager_fetchCurrentChargerConnectionState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0);
}

- (void)fetchCurrentBatteryPercent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _BYTE location[12];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[RTBatteryManager fetchCurrentBatteryPercent:]";
      v13 = 1024;
      v14 = 212;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", location, 0x12u);
    }

  }
  v6 = objc_initWeak((id *)location, self);
  -[RTNotifier queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__RTBatteryManager_fetchCurrentBatteryPercent___block_invoke;
  v9[3] = &unk_1E929C678;
  v10 = v4;
  v8 = v4;
  objc_copyWeak(&v11, (id *)location);
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)location);
}

void __47__RTBatteryManager_fetchCurrentBatteryPercent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_msgSend((id)objc_opt_class(), "_ioGetCurrentBatteryPercent");
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, v2);

}

- (BOOL)monitorBatteryStatusChanges
{
  return self->_monitorBatteryStatusChanges;
}

- (int64_t)externalConnectionState
{
  return self->_externalConnectionState;
}

- (void)setExternalConnectionState:(int64_t)a3
{
  self->_externalConnectionState = a3;
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
}

+ (int)_ioGetCurrentBatteryPercent
{
  IOPSGetPercentRemaining();
  return 0;
}

@end
