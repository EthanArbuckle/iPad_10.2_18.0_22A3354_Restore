@implementation CARAnalytics

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D5B0;
  block[3] = &unk_1000B7700;
  block[4] = a1;
  if (qword_1000DB920 != -1)
    dispatch_once(&qword_1000DB920, block);
  return (id)qword_1000DB918;
}

- (CARAnalytics)init
{
  CARAnalytics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CARAnalytics;
  result = -[CARAnalytics init](&v3, "init");
  if (result)
    result->_driveStartTimeInterval = 0.0;
  return result;
}

- (void)DNDStartedWithTrigger:(int)a3 vehicleHints:(unint64_t)a4
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  double v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint8_t v16[8];
  _QWORD v17[2];
  _QWORD v18[2];

  v7 = -[CARAnalytics isCurrentlyDriving](self, "isCurrentlyDriving");
  if (v7)
  {
    v9 = CarDNDWDLogging(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not recording start event - we were already driving?", v16, 2u);
    }
    goto LABEL_25;
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_driveStartTimeInterval = v11;
  self->_isCurrentlyDriving = 1;
  if (a4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = v12;
    if ((a4 & 1) != 0)
    {
      objc_msgSend(v12, "addObject:", CFSTR("Motion"));
      if ((a4 & 2) == 0)
      {
LABEL_7:
        if ((a4 & 4) == 0)
          goto LABEL_8;
        goto LABEL_16;
      }
    }
    else if ((a4 & 2) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v13, "addObject:", CFSTR("GPS"));
    if ((a4 & 4) == 0)
    {
LABEL_8:
      if ((a4 & 8) == 0)
        goto LABEL_9;
      goto LABEL_17;
    }
LABEL_16:
    objc_msgSend(v13, "addObject:", CFSTR("Baseband"));
    if ((a4 & 8) == 0)
    {
LABEL_9:
      if ((a4 & 0x10) == 0)
      {
LABEL_11:
        if (objc_msgSend(v13, "count"))
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR(";")));
        else
          v10 = CFSTR("None");

        goto LABEL_21;
      }
LABEL_10:
      objc_msgSend(v13, "addObject:", CFSTR("Bluetooth"));
      goto LABEL_11;
    }
LABEL_17:
    objc_msgSend(v13, "addObject:", CFSTR("Wi-Fi"));
    if ((a4 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v10 = CFSTR("None");
LABEL_21:
  v17[0] = CFSTR("Trigger");
  if ((a3 - 1) > 5)
    v14 = CFSTR("Unknown");
  else
    v14 = *(&off_1000B7858 + a3 - 1);
  v17[1] = CFSTR("Hints");
  v18[0] = v14;
  v18[1] = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  -[CARAnalytics sendEvent:withDictionary:](self, "sendEvent:withDictionary:", 0, v15);

LABEL_25:
}

- (void)DNDEndedWithTrigger:(int)a3 vehicleHints:(unint64_t)a4 context:(id)a5
{
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint8_t v25[16];

  v8 = a5;
  v9 = -[CARAnalytics isCurrentlyDriving](self, "isCurrentlyDriving");
  if (v9)
  {
    if (!a4)
    {
      v13 = CFSTR("None");
LABEL_22:
      self->_isCurrentlyDriving = 0;
      -[CARAnalytics driveStartTimeInterval](self, "driveStartTimeInterval");
      v16 = 0.0;
      if (v17 >= 1.0)
      {
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        v19 = v18;
        -[CARAnalytics driveStartTimeInterval](self, "driveStartTimeInterval");
        v16 = v19 - v20;
      }
      -[CARAnalytics setDriveStartTimeInterval:](self, "setDriveStartTimeInterval:", 0.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v22 = v21;
      if ((a3 - 1) > 5)
        v23 = CFSTR("Unknown");
      else
        v23 = *(&off_1000B7858 + a3 - 1);
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("Trigger"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("Duration"));

      objc_msgSend(v22, "setObject:forKeyedSubscript:", v13, CFSTR("Hints"));
      if (v8)
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, CFSTR("Context"));
      -[CARAnalytics sendEvent:withDictionary:](self, "sendEvent:withDictionary:", 1, v22);

      goto LABEL_30;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = v11;
    if ((a4 & 1) != 0)
    {
      objc_msgSend(v11, "addObject:", CFSTR("Motion"));
      if ((a4 & 2) == 0)
      {
LABEL_5:
        if ((a4 & 4) == 0)
          goto LABEL_6;
        goto LABEL_17;
      }
    }
    else if ((a4 & 2) == 0)
    {
      goto LABEL_5;
    }
    objc_msgSend(v12, "addObject:", CFSTR("GPS"));
    if ((a4 & 4) == 0)
    {
LABEL_6:
      if ((a4 & 8) == 0)
        goto LABEL_7;
      goto LABEL_18;
    }
LABEL_17:
    objc_msgSend(v12, "addObject:", CFSTR("Baseband"));
    if ((a4 & 8) == 0)
    {
LABEL_7:
      if ((a4 & 0x10) == 0)
      {
LABEL_9:
        if (objc_msgSend(v12, "count"))
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(";")));
        else
          v13 = CFSTR("None");

        goto LABEL_22;
      }
LABEL_8:
      objc_msgSend(v12, "addObject:", CFSTR("Bluetooth"));
      goto LABEL_9;
    }
LABEL_18:
    objc_msgSend(v12, "addObject:", CFSTR("Wi-Fi"));
    if ((a4 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v14 = CarDNDWDLogging(v9, v10);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not recording end event - we weren't driving?", v25, 2u);
  }

LABEL_30:
}

- (void)userChangedAutoReplyFromAudience:(id)a3 toAudience:(id)a4 messageChanged:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[3];

  v5 = a5;
  v12[0] = CFSTR("Previous");
  v12[1] = CFSTR("New");
  v13[0] = a3;
  v13[1] = a4;
  v12[2] = CFSTR("MessageChanged");
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v13[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));

  -[CARAnalytics sendEvent:withDictionary:](self, "sendEvent:withDictionary:", 2, v11);
}

- (void)userChangedFromTriggerMethod:(id)a3 toMethod:(id)a4 withMechanism:(id)a5 fromPreviousInterval:(double)a6 activateWithCarPlay:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a6 >= 1.0)
  {
    v16 = (void *)objc_opt_class(self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a6));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v15 = objc_msgSend(v16, "calendarUnitsOfType:fromDate:toDate:", 16, v17, v18);

  }
  else
  {
    v15 = 0;
  }
  v22[0] = CFSTR("Previous");
  v22[1] = CFSTR("New");
  v23[0] = v12;
  v23[1] = v13;
  v23[2] = v14;
  v22[2] = CFSTR("Trigger");
  v22[3] = CFSTR("Interval (Days)");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
  v23[3] = v19;
  v22[4] = CFSTR("ActivateWithCarPlay");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  v23[4] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 5));
  -[CARAnalytics sendEvent:withDictionary:](self, "sendEvent:withDictionary:", 3, v21);

}

- (void)wirelessReconnectStarted
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  CARConnectionTimeServiceAgent *connectionTimeServiceAgent;
  void *v10;
  id v11;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARAnalytics wirelessReconnectStartDate](self, "wirelessReconnectStartDate"));

  if (v3)
  {
    v5 = CarGeneralLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Ignoring wireless reconnect start; already started.",
        buf,
        2u);
    }

  }
  else
  {
    v7 = CARCarKitAttemptingConnectionEvent;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[CARConnectionEvent eventWithName:type:date:payload:](CARConnectionEvent, "eventWithName:type:date:payload:", v7, 4, v8, 0));

    connectionTimeServiceAgent = self->_connectionTimeServiceAgent;
    if (connectionTimeServiceAgent)
      -[CARConnectionTimeServiceAgent recordConnectionEvent:completion:](connectionTimeServiceAgent, "recordConnectionEvent:completion:", v11, &stru_1000B7720);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[CARAnalytics setWirelessReconnectStartDate:](self, "setWirelessReconnectStartDate:", v10);

  }
}

- (void)wirelessReconnectCancelled
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Resetting wireless reconnect timestamp.", v5, 2u);
  }

  -[CARAnalytics setWirelessReconnectStartDate:](self, "setWirelessReconnectStartDate:", 0);
  -[CARAnalytics setWirelessReconnectEndDate:](self, "setWirelessReconnectEndDate:", 0);
}

- (void)_wirelessReconnectEnded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  CARConnectionTimeServiceAgent *connectionTimeServiceAgent;
  int v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARAnalytics wirelessReconnectEndDate](self, "wirelessReconnectEndDate"));

  if (v3)
  {
    v5 = CarGeneralLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Ignoring wireless reconnect end; already ended.",
        (uint8_t *)&v19,
        2u);
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[CARAnalytics setWirelessReconnectEndDate:](self, "setWirelessReconnectEndDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARAnalytics wirelessReconnectStartDate](self, "wirelessReconnectStartDate"));
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    v13 = CarGeneralLogging(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
      v19 = 138412290;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Wireless reconnect ended. Observed reconnection time: %@", (uint8_t *)&v19, 0xCu);

    }
    v16 = CARCarKitConnectionSessionEndEvent;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v6 = objc_claimAutoreleasedReturnValue(+[CARConnectionEvent eventWithName:type:date:payload:](CARConnectionEvent, "eventWithName:type:date:payload:", v16, 4, v17, 0));

    connectionTimeServiceAgent = self->_connectionTimeServiceAgent;
    if (connectionTimeServiceAgent)
      -[CARConnectionTimeServiceAgent recordConnectionEvent:completion:](connectionTimeServiceAgent, "recordConnectionEvent:completion:", v6, &stru_1000B7740);
  }

}

- (void)_wiredReconnectEnded
{
  uint64_t v3;
  void *v4;
  CARConnectionTimeServiceAgent *connectionTimeServiceAgent;
  id v6;

  v3 = CARCarKitConnectionSessionEndEvent;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[CARConnectionEvent eventWithName:type:date:payload:](CARConnectionEvent, "eventWithName:type:date:payload:", v3, 4, v4, 0));

  connectionTimeServiceAgent = self->_connectionTimeServiceAgent;
  if (connectionTimeServiceAgent)
    -[CARConnectionTimeServiceAgent recordConnectionEvent:completion:](connectionTimeServiceAgent, "recordConnectionEvent:completion:", v6, &stru_1000B7760);

}

- (void)reconnectEndedOnTransport:(unint64_t)a3
{
  if (a3 == 3)
    -[CARAnalytics _wirelessReconnectEnded](self, "_wirelessReconnectEnded");
  else
    -[CARAnalytics _wiredReconnectEnded](self, "_wiredReconnectEnded");
}

- (void)wirelessSessionEndedWithPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  CARConnectionTimeServiceAgent *connectionTimeServiceAgent;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id location[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARAnalytics wirelessReconnectStartDate](self, "wirelessReconnectStartDate"));

  if (!v5)
  {
    v18 = CarGeneralLogging(v6);
    v13 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    LOWORD(location[0]) = 0;
    v19 = "No available wireless reconnect start time.";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v19, (uint8_t *)location, 2u);
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARAnalytics wirelessReconnectEndDate](self, "wirelessReconnectEndDate"));

  if (!v7)
  {
    v20 = CarGeneralLogging(v8);
    v13 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    LOWORD(location[0]) = 0;
    v19 = "No available wireless reconnect end time.";
    goto LABEL_11;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARAnalytics wirelessReconnectEndDate](self, "wirelessReconnectEndDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARAnalytics wirelessReconnectStartDate](self, "wirelessReconnectStartDate"));
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  -[CARAnalytics wirelessReconnectCancelled](self, "wirelessReconnectCancelled");
  v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
  -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, CFSTR("reconnectionTime"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CARAnalytics wifiChannel](self, "wifiChannel"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CARAnalytics wifiChannel](self, "wifiChannel"));
    -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, CFSTR("wifiChannel"));

  }
  if (self->_connectionTimeServiceAgent)
  {
    objc_initWeak(location, self);
    connectionTimeServiceAgent = self->_connectionTimeServiceAgent;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10005E4F8;
    v21[3] = &unk_1000B77F0;
    objc_copyWeak(&v23, location);
    v13 = v13;
    v22 = v13;
    -[CARConnectionTimeServiceAgent fetchConnectionSessions:](connectionTimeServiceAgent, "fetchConnectionSessions:", v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
  }
LABEL_12:

}

- (void)wiredSessionEnded
{
  CARConnectionTimeServiceAgent *connectionTimeServiceAgent;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  connectionTimeServiceAgent = self->_connectionTimeServiceAgent;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005FB78;
  v4[3] = &unk_1000B7818;
  objc_copyWeak(&v5, &location);
  -[CARConnectionTimeServiceAgent fetchConnectionSessions:](connectionTimeServiceAgent, "fetchConnectionSessions:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)userCreatedWirelessPairingWithSource:(id)a3 payload:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  id v14;

  v6 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a4));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, CFSTR("source"));

  if (self->_connectionTimeServiceAgent)
  {
    v7 = CARCarKitWirelessPairingCreatedEvent;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = objc_msgSend(v14, "copy");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CARConnectionEvent eventWithName:type:date:payload:](CARConnectionEvent, "eventWithName:type:date:payload:", v7, 4, v8, v9));

    -[CARConnectionTimeServiceAgent recordConnectionEvent:completion:](self->_connectionTimeServiceAgent, "recordConnectionEvent:completion:", v10, &stru_1000B7838);
  }
  if (-[CARAnalytics carKeyPairingResult](self, "carKeyPairingResult"))
  {
    v11 = -[CARAnalytics carKeyPairingResult](self, "carKeyPairingResult");
    if (v11 > 4)
      v12 = CFSTR("unknown");
    else
      v12 = *(&off_1000B78E0 + v11);
  }
  else
  {
    v12 = CFSTR("undefined");
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("carKeyPairingResult"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
  objc_msgSend(v13, "setCarKeyPairingResult:", 0);

  -[CARAnalytics sendEvent:withDictionary:](self, "sendEvent:withDictionary:", 6, v14);
}

- (void)userIndicatedNotDrivingWithReason:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v6 = CFSTR("Reason");
  v7 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));

  -[CARAnalytics sendEvent:withDictionary:](self, "sendEvent:withDictionary:", 4, v5);
}

- (void)navigationOwnershipEndedWithMaximumConcurrentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v6 = CFSTR("ownerCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[CARAnalytics sendEvent:withDictionary:](self, "sendEvent:withDictionary:", 5, v5);

}

- (void)sendEvent:(unint64_t)a3 withDictionary:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;

  v6 = a4;
  if (objc_msgSend((id)objc_opt_class(self), "shouldRecordAnalyticsEvents"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARAnalytics _CARCoreAnalyticsEventNameForEvent:](self, "_CARCoreAnalyticsEventNameForEvent:", a3));
    v9 = CarDNDWDLogging(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10006F0DC();

    if (v6)
      v11 = v6;
    else
      v11 = &__NSDictionary0__struct;
    AnalyticsSendEvent(v7, v11);

  }
}

- (id)_CARCoreAnalyticsEventNameForEvent:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;

  if (a3 >= 9)
  {
    v5 = CarGeneralLogging(self);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10006F14C(a3);

    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.carexperience.%@"), *(&off_1000B7908 + a3)));
  }
  return v4;
}

+ (int64_t)calendarUnitsOfType:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  int64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  id v20;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v20 = 0;
  objc_msgSend(v9, "rangeOfUnit:startDate:interval:forDate:", a3, &v20, 0, v8);

  v10 = v20;
  v19 = 0;
  objc_msgSend(v9, "rangeOfUnit:startDate:interval:forDate:", a3, &v19, 0, v7);

  v11 = v19;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "components:fromDate:toDate:options:", a3, v10, v11, 0));
  v13 = v12;
  switch(a3)
  {
    case 0x10uLL:
      v14 = objc_msgSend(v12, "day");
      goto LABEL_7;
    case 0x40uLL:
      v14 = objc_msgSend(v12, "minute");
      goto LABEL_7;
    case 0x80uLL:
      v14 = objc_msgSend(v12, "second");
LABEL_7:
      v15 = (int64_t)v14;
      goto LABEL_11;
  }
  v16 = CarGeneralLogging(v12);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10006F1D0(a3);

  v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v15;
}

+ (BOOL)shouldRecordAnalyticsEvents
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = CRIsTestContext(a1, a2);
  if (v2)
  {
    v3 = CarDNDWDLogging();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not recording events due to testing context.", v6, 2u);
    }

  }
  return v2 ^ 1;
}

- (void)_prepareConnectionTTRDraftWithConnectionSession:(id)a3 withAdditionalDescription:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRDiagnosticsService sharedInstance](CRDiagnosticsService, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000603F0;
  v12[3] = &unk_1000B5628;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "collectDiagnosticsWithSession:displayReason:additionalDescription:attachmentURLs:completionHandler:", v9, CFSTR("CarPlay connection took longer than expected. Gathering diagnostics"), v8, 0, v12);

}

- (CARConnectionTimeServiceAgent)connectionTimeServiceAgent
{
  return self->_connectionTimeServiceAgent;
}

- (void)setConnectionTimeServiceAgent:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTimeServiceAgent, a3);
}

- (NSNumber)wifiChannel
{
  return self->_wifiChannel;
}

- (void)setWifiChannel:(id)a3
{
  objc_storeStrong((id *)&self->_wifiChannel, a3);
}

- (unint64_t)carKeyPairingResult
{
  return self->_carKeyPairingResult;
}

- (void)setCarKeyPairingResult:(unint64_t)a3
{
  self->_carKeyPairingResult = a3;
}

- (double)driveStartTimeInterval
{
  return self->_driveStartTimeInterval;
}

- (void)setDriveStartTimeInterval:(double)a3
{
  self->_driveStartTimeInterval = a3;
}

- (BOOL)isCurrentlyDriving
{
  return self->_isCurrentlyDriving;
}

- (void)setIsCurrentlyDriving:(BOOL)a3
{
  self->_isCurrentlyDriving = a3;
}

- (NSDate)wirelessReconnectStartDate
{
  return self->_wirelessReconnectStartDate;
}

- (void)setWirelessReconnectStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_wirelessReconnectStartDate, a3);
}

- (NSDate)wirelessReconnectEndDate
{
  return self->_wirelessReconnectEndDate;
}

- (void)setWirelessReconnectEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_wirelessReconnectEndDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wirelessReconnectEndDate, 0);
  objc_storeStrong((id *)&self->_wirelessReconnectStartDate, 0);
  objc_storeStrong((id *)&self->_wifiChannel, 0);
  objc_storeStrong((id *)&self->_connectionTimeServiceAgent, 0);
}

@end
