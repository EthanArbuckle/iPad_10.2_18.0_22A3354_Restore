@implementation APTelephony

- (int64_t)networkType
{
  return self->_networkType;
}

- (BOOL)networkDataValid
{
  APTelephony *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony lock](self, "lock"));
  objc_msgSend(v3, "lock");
  LOBYTE(v2) = v2->_networkError == 0;
  objc_msgSend(v3, "unlock");

  return (char)v2;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

+ (id)telephony
{
  if (qword_1002695E0 != -1)
    dispatch_once(&qword_1002695E0, &stru_100213EC8);
  return (id)qword_1002695D8;
}

- (APTelephony)init
{
  APTelephony *v2;
  APTelephony *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  APTelephony *v9;
  uint32_t v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  APUnfairLock *v16;
  APUnfairLock *lock;
  APReachability *v18;
  APReachability *reachability;
  void *v20;
  _QWORD handler[4];
  APTelephony *v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint32_t v28;

  v24.receiver = self;
  v24.super_class = (Class)APTelephony;
  v2 = -[APTelephony init](&v24, "init");
  v3 = v2;
  if (v2)
  {
    v2->_networkType = -1;
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.ap.promotedcontentd.telephony-networking", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    dword_1002695E8 = -1;
    v3->_deviceIsLocked = MKBGetDeviceLockState(0) != 0;
    v8 = v3->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000AE070;
    handler[3] = &unk_100213EF0;
    v9 = v3;
    v23 = v9;
    v10 = notify_register_dispatch("com.apple.springboard.lockstate", &dword_1002695E8, v8, handler);
    if (v10)
    {
      v11 = v10;
      v12 = APLogForCategory(47);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_opt_class(v9);
        *(_DWORD *)buf = 138478083;
        v26 = v14;
        v27 = 1026;
        v28 = v11;
        v15 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed to register for lockstate notification - error %{public}d", buf, 0x12u);

      }
    }
    v16 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    lock = v9->_lock;
    v9->_lock = v16;

    v18 = -[APReachability initWithDelegate:]([APReachability alloc], "initWithDelegate:", v9);
    reachability = v9->_reachability;
    v9->_reachability = v18;

    -[APTelephony _startMonitoringTelephony](v9, "_startMonitoringTelephony");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony reachability](v9, "reachability"));
    objc_msgSend(v20, "startMonitoring");

  }
  return v3;
}

- (NSNumber)signalStrength
{
  void *v3;
  _UNKNOWN **v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony lock](self, "lock"));
  objc_msgSend(v3, "lock");
  if ((id)-[APTelephony networkType](self, "networkType") == (id)1)
  {
    objc_msgSend(v3, "unlock");
    v4 = &off_100228DF0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony ctClient](self, "ctClient"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony latestCellularSignalStrength](self, "latestCellularSignalStrength"));
      objc_msgSend(v3, "unlock");
      if (!v6)
        -[APTelephony updateCellularSignalStrength](self, "updateCellularSignalStrength");
      v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[APTelephony latestCellularSignalStrength](self, "latestCellularSignalStrength"));

    }
    else
    {
      objc_msgSend(v3, "unlock");
      v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[APTelephony latestCellularSignalStrength](self, "latestCellularSignalStrength"));
    }
  }

  return (NSNumber *)v4;
}

- (BOOL)telephonyDataValid
{
  APTelephony *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony lock](self, "lock"));
  objc_msgSend(v3, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony telephonyError](v2, "telephonyError"));
  LOBYTE(v2) = v4 == 0;

  objc_msgSend(v3, "unlock");
  return (char)v2;
}

- (void)_startMonitoringTelephony
{
  NSObject *queue;
  void **v4;
  uint64_t v5;
  void (*v6)(id *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1000AE254;
  v7 = &unk_100213F18;
  objc_copyWeak(&v8, &location);
  dispatch_async(queue, &v4);
  -[APTelephony updateTelephonyProperties](self, "updateTelephonyProperties", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)reachabilityChanged:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  int64_t v14;

  v5 = APLogForCategory(12);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "APTelephony notification from reachability: new network type = %ld", buf, 0xCu);
  }

  v7 = -1;
  if ((a3 & 2) != 0)
    v7 = 1;
  if ((a3 & 1) != 0)
    v8 = 0;
  else
    v8 = v7;
  -[APTelephony setNetworkType:](self, "setNetworkType:", v8);
  if (!-[APTelephony networkInfoUpdatingInProgress](self, "networkInfoUpdatingInProgress"))
  {
    -[APTelephony setNetworkInfoUpdatingInProgress:](self, "setNetworkInfoUpdatingInProgress:", 1);
    objc_initWeak((id *)buf, self);
    v9 = dispatch_time(0, 10000000000);
    v10 = objc_claimAutoreleasedReturnValue(-[APTelephony queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AE4B8;
    block[3] = &unk_100213F18;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_after(v9, v10, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[APTelephony queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE5F4;
  block[3] = &unk_100213F40;
  objc_copyWeak(&v12, &location);
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)preferredDataSimChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[APTelephony lock](self, "lock"));
  objc_msgSend(v5, "lock");
  -[APTelephony setCtSubscriptionContext:](self, "setCtSubscriptionContext:", v4);

  objc_msgSend(v5, "unlock");
}

- (void)updateCellularSignalStrength
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony lock](self, "lock"));
  objc_msgSend(v3, "lock");
  v4 = objc_claimAutoreleasedReturnValue(-[APTelephony ctClient](self, "ctClient"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony ctSubscriptionContext](self, "ctSubscriptionContext"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony ctClient](self, "ctClient"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony ctSubscriptionContext](self, "ctSubscriptionContext"));
      v26 = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getSignalStrengthInfo:error:", v8, &v26));
      v10 = v26;

      if (v10)
      {
        v11 = APLogForCategory(47);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v13 = "Unable to retrieve CT signal strength.";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
        }
      }
      else
      {
        -[APTelephony setTelephonyError:](self, "setTelephonyError:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "maxDisplayBars"));
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bars"));
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

        if (v18 > 0.0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", vcvtad_u64_f64(v21 / v18 * 100.0)));
          -[APTelephony setLatestCellularSignalStrength:](self, "setLatestCellularSignalStrength:", v22);

          v23 = APLogForCategory(47);
          v12 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony latestCellularSignalStrength](self, "latestCellularSignalStrength"));
            *(_DWORD *)buf = 138543362;
            v28 = v24;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Update latest signal strength to %{public}@.", buf, 0xCu);

          }
          goto LABEL_15;
        }
        v25 = APLogForCategory(47);
        v12 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v13 = "Unable to retrieve CT signal strength because maxBars is 0.";
          goto LABEL_14;
        }
      }
LABEL_15:

      objc_msgSend(v3, "unlock");
      goto LABEL_16;
    }
  }
  v14 = APLogForCategory(47);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CoreTelephony client or CoreTelephonySubScriptionContext is not created.", buf, 2u);
  }

  objc_msgSend(v3, "unlock");
LABEL_16:

}

- (void)updateTelephonyProperties
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[APTelephony queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AEB88;
  v4[3] = &unk_100213F18;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (int64_t)dataIndicatorToConnectionType:(int)a3
{
  if (a3 > 0xF)
    return -1;
  else
    return qword_1001B7C98[a3];
}

+ (id)connectionTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return CFSTR("Unknown");
  else
    return off_100213F60[a3];
}

- (void)_deviceLockStateChanged
{
  _BOOL4 v3;
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  dispatch_block_t v10;
  uint64_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[5];
  uint64_t state64;
  uint8_t buf[4];
  const __CFString *v21;

  if (dword_1002695E8 == -1)
  {
    v16 = APLogForCategory(47);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Device lock notify token is invalid (expected if running in the simulator)", buf, 2u);
    }

  }
  else
  {
    state64 = 0;
    notify_get_state(dword_1002695E8, &state64);
    v3 = state64 == 0;
    if (((v3 ^ -[APTelephony deviceIsLocked](self, "deviceIsLocked")) & 1) == 0)
    {
      -[APTelephony setDeviceIsLocked:](self, "setDeviceIsLocked:", state64 != 0);
      v4 = APLogForCategory(47);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = -[APTelephony deviceIsLocked](self, "deviceIsLocked");
        v7 = CFSTR("unlocked");
        if (v6)
          v7 = CFSTR("locked");
        *(_DWORD *)buf = 138543362;
        v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Device lock state changed to %{public}@. Queuing attempt to toggle Telephony and Reachability.", buf, 0xCu);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony disableTelephonyMethod](self, "disableTelephonyMethod"));
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony disableTelephonyMethod](self, "disableTelephonyMethod"));
        dispatch_block_cancel(v9);

      }
      if (-[APTelephony deviceIsLocked](self, "deviceIsLocked"))
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000AF228;
        v18[3] = &unk_100212FE0;
        v18[4] = self;
        v10 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v18);
        -[APTelephony setDisableTelephonyMethod:](self, "setDisableTelephonyMethod:", v10);

        v11 = APLogForCategory(47);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67240192;
          LODWORD(v21) = 30;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Disabling telephony and reachability in %{public}d seconds", buf, 8u);
        }

        v13 = dispatch_time(0, 30000000000);
        v14 = objc_claimAutoreleasedReturnValue(-[APTelephony queue](self, "queue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony disableTelephonyMethod](self, "disableTelephonyMethod"));
        dispatch_after(v13, v14, v15);

      }
      else
      {
        -[APTelephony _resumeTelephonyAndReachability](self, "_resumeTelephonyAndReachability");
      }
    }
  }
}

- (void)_suspendTelephonyAndReachability
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = APLogForCategory(47);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Suspending Telephony and Reachability callbacks", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony ctClient](self, "ctClient"));
  objc_msgSend(v5, "setDelegate:", 0);

  -[APTelephony setCtClient:](self, "setCtClient:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony reachability](self, "reachability"));
  objc_msgSend(v6, "stopMonitoring");

}

- (void)_resumeTelephonyAndReachability
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = APLogForCategory(47);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Resuming Telephony and Reachability.", v6, 2u);
  }

  -[APTelephony _startMonitoringTelephony](self, "_startMonitoringTelephony");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APTelephony reachability](self, "reachability"));
  objc_msgSend(v5, "startMonitoring");

}

- (void)setNetworkType:(int64_t)a3
{
  self->_networkType = a3;
}

- (NSNumber)latestCellularSignalStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLatestCellularSignalStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CoreTelephonyClient)ctClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCtClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CTXPCServiceSubscriptionContext)ctSubscriptionContext
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCtSubscriptionContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSError)networkError
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNetworkError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSError)telephonyError
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTelephonyError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)networkInfoUpdatingInProgress
{
  return self->_networkInfoUpdatingInProgress;
}

- (void)setNetworkInfoUpdatingInProgress:(BOOL)a3
{
  self->_networkInfoUpdatingInProgress = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (BOOL)deviceIsLocked
{
  return self->_deviceIsLocked;
}

- (void)setDeviceIsLocked:(BOOL)a3
{
  self->_deviceIsLocked = a3;
}

- (id)disableTelephonyMethod
{
  return self->_disableTelephonyMethod;
}

- (void)setDisableTelephonyMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (APReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
  objc_storeStrong((id *)&self->_reachability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong(&self->_disableTelephonyMethod, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_telephonyError, 0);
  objc_storeStrong((id *)&self->_networkError, 0);
  objc_storeStrong((id *)&self->_ctSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_latestCellularSignalStrength, 0);
}

@end
