@implementation AcceleratedChargingMode

- (AcceleratedChargingMode)init
{
  os_log_t v3;
  void *v4;
  void *v5;
  AcceleratedChargingMode *v6;
  objc_super v8;

  if (_os_feature_enabled_impl("powerexperienced", "AcceleratedChargingMode"))
  {
    v8.receiver = self;
    v8.super_class = (Class)AcceleratedChargingMode;
    self = -[AcceleratedChargingMode init](&v8, "init");
    v3 = os_log_create("com.apple.powerexperience", "AcceleratedChargingMode");
    -[PowerModeObjImpl setLog:](self, "setLog:", v3);

    -[PowerModeObjImpl setState:](self, "setState:", 0);
    -[PowerModeObjImpl setEnabled:](self, "setEnabled:", 1);
    -[PowerModeObjImpl setEntryDelay:](self, "setEntryDelay:", 120.0);
    -[PowerModeObjImpl setMaxEngagementDuration:](self, "setMaxEngagementDuration:", 1800.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPlatformContext")));
    -[PowerModeObjImpl setSupportedPlatform:](self, "setSupportedPlatform:", objc_msgSend(v5, "isEqual:", CFSTR("iPhone")));

    -[PowerModeObjImpl setAppliesPowerTarget:](self, "setAppliesPowerTarget:", 1);
  }
  v6 = self;

  return v6;
}

+ (id)powerModeInstance
{
  if (qword_10001BE08 != -1)
    dispatch_once(&qword_10001BE08, &stru_1000144D0);
  return (id)qword_10001BE10;
}

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  char v21;
  int v22;
  AcceleratedChargingMode *v23;
  BOOL v24;
  void *v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  NSObject *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  int v38;
  int v39;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kPluggedInContext")));
  HIDWORD(v37) = objc_msgSend(v7, "BOOLValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kBatteryLevelContext")));
  LODWORD(v37) = objc_msgSend(v8, "intValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kLockStateContext")));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Display")));
  v12 = objc_msgSend(v11, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CarPlay")));

  v14 = objc_msgSend(v13, "state");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AudioPlayback")));

  v16 = objc_msgSend(v15, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OnenessSession")));

  v18 = objc_msgSend(v17, "state");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("USBDeviceMode")));

  v20 = objc_msgSend(v19, "state");
  v21 = v10 ^ 1;
  if (v12 != (id)101)
    v21 = 0;
  v22 = 1;
  if ((v21 & 1) != 0 || v14 == (id)1)
  {
    v23 = self;
    goto LABEL_18;
  }
  v23 = self;
  if (v16 == (id)1
    || (v18 != (id)1 ? (v24 = v20 == (id)1) : (v24 = 1),
        !v24 ? (v22 = 0) : (v22 = 1),
        !HIDWORD(v37) || (v22 & 1) != 0 || (int)v37 > 50))
  {
LABEL_18:
    v28 = 0;
    LOBYTE(v27) = 0;
    if (!-[PowerModeObjImpl state](v23, "state", v37))
      goto LABEL_35;
    goto LABEL_23;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[ChargeDurationPredictor sharedInstance](ChargeDurationPredictor, "sharedInstance"));
  v26 = v25;
  if (v25)
    v27 = objc_msgSend(v25, "shortChargeExpected");
  else
    v27 = 0;

  if (v27 == -[PowerModeObjImpl state](self, "state"))
    goto LABEL_35;
  v22 = 0;
  v28 = v27;
LABEL_23:
  v29 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](v23, "log", v37));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (objc_class *)objc_opt_class(v23);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kBatteryLevelContext")));
    *(_DWORD *)buf = 138413570;
    v42 = v32;
    v43 = 1024;
    v44 = v28;
    v45 = 1024;
    v46 = v12 == (id)101;
    v47 = 1024;
    v48 = v14 == (id)1;
    v49 = 1024;
    v50 = v39;
    v51 = 2112;
    v52 = v33;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "evaluatePowerMode: %@: %d display %d, carPlay %d, pluggedIn %d, batterylevel %@", buf, 0x2Eu);

    v23 = self;
  }

  if ((v27 & 1) != 0)
  {
    LOBYTE(v27) = 1;
  }
  else
  {
    v34 = 5;
    if (v38 <= 50)
      v34 = 1;
    if (!v39)
      v34 = 4;
    if (v22)
      v35 = 3;
    else
      v35 = v34;
    -[PowerModeObjImpl setExitReason:](v23, "setExitReason:", v35);
    LOBYTE(v27) = 0;
  }
LABEL_35:

  return v27;
}

- (void)enterPowerMode
{
  objc_super v3;

  if (!-[PowerModeObjImpl state](self, "state"))
  {
    v3.receiver = self;
    v3.super_class = (Class)AcceleratedChargingMode;
    -[PowerModeObjImpl enterPowerMode](&v3, "enterPowerMode");
    -[PowerModeObjImpl updatePowerTarget](self, "updatePowerTarget");
    -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
  }
}

- (void)exitPowerMode
{
  objc_super v3;

  if (-[PowerModeObjImpl state](self, "state"))
  {
    v3.receiver = self;
    v3.super_class = (Class)AcceleratedChargingMode;
    -[PowerModeObjImpl exitPowerMode](&v3, "exitPowerMode");
    -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
  }
}

@end
