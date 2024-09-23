@implementation DPCRSSIPolicy

- (DPCRSSIPolicy)initWithStateMachine:(id)a3
{
  id v4;
  DPCRSSIPolicy *v5;
  DPCRSSIPolicy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DPCRSSIPolicy;
  v5 = -[DPCBasePolicy init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[DPCBasePolicy setRequireRSSI:](v5, "setRequireRSSI:", 1);
    -[DPCBasePolicy setStateMachine:](v6, "setStateMachine:", v4);
  }

  return v6;
}

- (void)notifyNewEvent:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v5 = sub_100002F3C((uint64_t)off_100012CB8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    v8 = objc_msgSend(v7, "currentWatchWristState");
    if ((unint64_t)v8 >= 4)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Undefined state (%ld)"), v8));
    else
      v9 = *(&off_10000C508 + (_QWORD)v8);
    v10 = v9;
    if (a3 >= 3)
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Undefined state (%ld)"), a3));
    else
      v11 = *(&off_10000C528 + a3);
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current wrist state: %@, checking if need to notify with watch state: %@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
  if (objc_msgSend(v12, "currentWatchWristState") == (id)3)
  {
    v13 = 1;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    v13 = objc_msgSend(v14, "currentWatchWristState") == (id)1;

  }
  if (a3 == 2 && v13)
  {
    -[DPCBasePolicy scheduleSendAbsenceEvent](self, "scheduleSendAbsenceEvent");
  }
  else if (a3 == 1)
  {
    -[DPCBasePolicy invalidateAbsenceEvent](self, "invalidateAbsenceEvent");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DPCBasePolicy detectedNewEventBlock](self, "detectedNewEventBlock"));
    v15[2](v15, 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v16, "timeIntervalSince1970");
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    objc_msgSend(v19, "setLastPresenceEventTimestamp:", v18);

  }
}

- (unint64_t)onRSSIChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unsigned __int8 v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  unsigned __int8 v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  int v39;
  id v40;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
  v6 = (uint64_t)objc_msgSend(v5, "isInRSSIStreamingMode");

  if ((v6 & 1) != 0)
    goto LABEL_2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
  v9 = objc_msgSend(v8, "isInDiscoveryMode");
  if ((v9 & 1) != 0
    || (v6 = objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine")),
        (objc_msgSend((id)v6, "isMonitoringAbsence") & 1) != 0))
  {
    objc_msgSend(v4, "floatValue");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdD2")));
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    if ((v9 & 1) == 0)
    if (v11 <= v15)
    {
      v16 = sub_100002F3C((uint64_t)off_100012CB8);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 138412290;
        v40 = v4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Device Absence Detected! %@; going to monitor for Presence",
          (uint8_t *)&v39,
          0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
      objc_msgSend(v18, "setIsInDiscoveryMode:", 0);

      -[DPCRSSIPolicy runRSSIAdapter:RSSI:](self, "runRSSIAdapter:RSSI:", 2, v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
      objc_msgSend(v19, "lastPresenceEventTimestamp");
      v21 = v20;

      if (v21 == 0.0)
      {
        v36 = sub_100002F3C((uint64_t)off_100012CB8);
        v22 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v39) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Ignore Absence event: Watch hasn't been back to phone in this session.", (uint8_t *)&v39, 2u);
        }
      }
      else
      {
        -[DPCRSSIPolicy notifyNewEvent:](self, "notifyNewEvent:", 2);
        v22 = objc_claimAutoreleasedReturnValue(-[DPCBasePolicy telemetry](self, "telemetry"));
        -[NSObject registerWatchEvent:rssiValue:](v22, "registerWatchEvent:rssiValue:", 2, objc_msgSend(v4, "integerValue"));
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
      objc_msgSend(v37, "setIsMonitoringAbsence:", 0);

      v7 = 1;
      goto LABEL_25;
    }
  }
  else
  {

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
  v24 = objc_msgSend(v23, "isInDiscoveryMode");
  if ((v24 & 1) == 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    if (objc_msgSend((id)v6, "isMonitoringAbsence"))
    {

LABEL_2:
      v7 = 0;
      goto LABEL_25;
    }
  }
  objc_msgSend(v4, "floatValue");
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "NSNumberForDefault:", CFSTR("DPCDefaultsThresholdD1")));
  objc_msgSend(v28, "floatValue");
  v30 = v29;

  if ((v24 & 1) == 0)
  if (v26 < v30)
    goto LABEL_2;
  v31 = sub_100002F3C((uint64_t)off_100012CB8);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 138412290;
    v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Device Presence Detected! %@; going to monitor for Absence",
      (uint8_t *)&v39,
      0xCu);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
  objc_msgSend(v33, "setIsInDiscoveryMode:", 0);

  -[DPCRSSIPolicy runRSSIAdapter:RSSI:](self, "runRSSIAdapter:RSSI:", 1, v4);
  -[DPCRSSIPolicy notifyNewEvent:](self, "notifyNewEvent:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy telemetry](self, "telemetry"));
  objc_msgSend(v34, "registerWatchEvent:rssiValue:", 1, objc_msgSend(v4, "integerValue"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
  objc_msgSend(v35, "setIsMonitoringAbsence:", 1);

  v7 = 2;
LABEL_25:

  return v7;
}

- (void)onWristStateChange:(int64_t)a3
{
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  NSObject *v11;
  id v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v12 = (id)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
  if ((objc_msgSend(v12, "isRunning") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    v6 = objc_msgSend(v5, "isMonitoringAbsence");

    if ((v6 & 1) == 0)
    {
      -[DPCBasePolicy invalidateAbsenceEvent](self, "invalidateAbsenceEvent");
      if (a3 == 3)
      {
        v10 = sub_100002F3C((uint64_t)off_100012CB8);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Wrist on while absence, going to send a absence event", v13, 2u);
        }

        -[DPCBasePolicy scheduleSendAbsenceEvent](self, "scheduleSendAbsenceEvent");
      }
      else if (a3 == 2)
      {
        v7 = sub_100002F3C((uint64_t)off_100012CB8);
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Wrist off while absence, going to send a presence event", buf, 2u);
        }

        -[DPCBasePolicy invalidateAbsenceEvent](self, "invalidateAbsenceEvent");
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DPCBasePolicy detectedNewEventBlock](self, "detectedNewEventBlock"));
        v9[2](v9, 1);

      }
    }
  }
  else
  {

  }
}

- (void)runRSSIAdapter:(unint64_t)a3 RSSI:(id)a4
{
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  float v41;
  float v42;
  void *v43;
  void *v44;
  float v45;
  double v46;
  void *v47;
  void *v48;
  id v49;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "NSNumberForDefault:", CFSTR("DPCDefaultsSessionBasedAdaptiveRSSIEnabled")));
  v8 = objc_msgSend(v7, "BOOLValue");

  if (!v8)
    return;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;

  if (a3 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    objc_msgSend(v12, "lastAbsenceEventTimestamp");
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
    objc_msgSend(v15, "lastAbsenceEventTimestamp");
    if (v16 == 0.0)
    {
LABEL_6:

      goto LABEL_7;
    }
    v17 = v11 - v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "NSNumberForDefault:", CFSTR("DPCDefaultsAPWakeToSuppressionBreakEvenDuration")));
    objc_msgSend(v19, "floatValue");
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "NSNumberForDefault:", CFSTR("DPCDefaultsPowerWinGainTimes")));
    objc_msgSend(v23, "floatValue");
    v25 = (float)(v21 * v24);

    if (v17 < v25)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "NSNumberForDefault:", CFSTR("DPCDefaultsD2FixedStepSize")));
      objc_msgSend(v15, "setD2ThresholdMargin:", objc_msgSend(v15, "D2ThresholdMargin") + objc_msgSend(v27, "intValue"));

      goto LABEL_6;
    }
  }
LABEL_7:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "NSNumberForDefault:", CFSTR("DPCDefaultsSessionBasedAdaptiveRSSITwoWaysEnabled")));
  v30 = objc_msgSend(v29, "BOOLValue");

  if (a3 == 2)
  {
    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
      objc_msgSend(v31, "lastAbsenceEventTimestamp");
      v33 = v32;

      if (v33 != 0.0)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
        objc_msgSend(v34, "lastPresenceEventTimestamp");
        v36 = v35;

        v49 = (id)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
        objc_msgSend(v49, "lastPresenceEventTimestamp");
        if (v37 != 0.0)
        {
          v38 = v11 - v36;
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "NSNumberForDefault:", CFSTR("DPCDefaultsAPWakeToSuppressionBreakEvenDuration")));
          objc_msgSend(v40, "floatValue");
          v42 = v41;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "NSNumberForDefault:", CFSTR("DPCDefaultsPowerWinGainTimes")));
          objc_msgSend(v44, "floatValue");
          v46 = (float)(v42 * v45);

          if (v38 >= v46)
            return;
          v49 = (id)objc_claimAutoreleasedReturnValue(-[DPCBasePolicy stateMachine](self, "stateMachine"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "NSNumberForDefault:", CFSTR("DPCDefaultsD2FixedStepSize")));
          objc_msgSend(v49, "setD2ThresholdMargin:", objc_msgSend(v49, "D2ThresholdMargin") + objc_msgSend(v48, "intValue"));

        }
      }
    }
  }
}

@end
