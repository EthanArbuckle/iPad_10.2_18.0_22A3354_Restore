@implementation DPCConnectivityPolicy

- (DPCConnectivityPolicy)initWithStateMachine:(id)a3
{
  id v4;
  DPCConnectivityPolicy *v5;
  DPCConnectivityPolicy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DPCConnectivityPolicy;
  v5 = -[DPCBasePolicy init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[DPCBasePolicy setRequireRSSI:](v5, "setRequireRSSI:", 0);
    -[DPCBasePolicy setStateMachine:](v6, "setStateMachine:", v4);
    -[DPCConnectivityPolicy setHasBeenConnected:](v6, "setHasBeenConnected:", 0);
  }

  return v6;
}

- (void)notifyNewEvent:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  __CFString *v20;

  v5 = sub_100002F3C((uint64_t)off_100012CB8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    v8 = (unint64_t)objc_msgSend(v7, "currentWatchWristState");
    if (v8 >= 4)
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Undefined state (%ld)"), v8));
    else
      v9 = off_10000C4A8[v8];
    v10 = v9;
    if (a3 >= 3)
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Undefined state (%ld)"), a3));
    else
      v11 = off_10000C4C8[a3];
    *(_DWORD *)buf = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Current wrist state: %@, checking if need to notify with watch state: %@", buf, 0x16u);

  }
  if (a3 == 2)
  {
    -[DPCBasePolicy scheduleSendAbsenceEvent](self, "scheduleSendAbsenceEvent");
  }
  else
  {
    -[DPCBasePolicy invalidateAbsenceEvent](self, "invalidateAbsenceEvent");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DPCBasePolicy detectedNewEventBlock](self, "detectedNewEventBlock"));
    v12[2](v12, a3);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v13, "timeIntervalSince1970");
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    objc_msgSend(v16, "setLastPresenceEventTimestamp:", v15);

  }
}

- (unint64_t)onRSSIChange:(id)a3
{
  return 0;
}

- (void)onWatchConnectivityChange:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  if (a3)
  {
    -[DPCBasePolicy invalidateAbsenceEvent](self, "invalidateAbsenceEvent");
    -[DPCConnectivityPolicy notifyNewEvent:](self, "notifyNewEvent:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    objc_msgSend(v4, "setIsMonitoringAbsence:", 1);

    -[DPCConnectivityPolicy setHasBeenConnected:](self, "setHasBeenConnected:", 1);
  }
  else if (-[DPCConnectivityPolicy hasBeenConnected](self, "hasBeenConnected"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    v6 = objc_msgSend(v5, "currentWatchWristState");

    if (v6 == (id)3)
    {
      -[DPCBasePolicy scheduleSendAbsenceEvent](self, "scheduleSendAbsenceEvent");
      v9 = (id)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
      objc_msgSend(v9, "setIsMonitoringAbsence:", 0);

    }
  }
  else
  {
    v7 = sub_100002F3C((uint64_t)off_100012CB8);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_100007134(v8);

  }
}

- (BOOL)hasBeenConnected
{
  return self->_hasBeenConnected;
}

- (void)setHasBeenConnected:(BOOL)a3
{
  self->_hasBeenConnected = a3;
}

@end
