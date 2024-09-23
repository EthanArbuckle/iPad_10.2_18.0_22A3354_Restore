@implementation LongChargingMode

- (LongChargingMode)init
{
  os_log_t v3;
  void *v4;
  void *v5;
  LongChargingMode *v6;
  objc_super v8;

  if (_os_feature_enabled_impl("powerexperienced", "LongChargingMode"))
  {
    v8.receiver = self;
    v8.super_class = (Class)LongChargingMode;
    self = -[LongChargingMode init](&v8, "init");
    v3 = os_log_create("com.apple.powerexperience", "LongChargingMode");
    -[PowerModeObjImpl setLog:](self, "setLog:", v3);

    -[PowerModeObjImpl setState:](self, "setState:", 0);
    -[PowerModeObjImpl setEnabled:](self, "setEnabled:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPlatformContext")));
    -[PowerModeObjImpl setSupportedPlatform:](self, "setSupportedPlatform:", objc_msgSend(v5, "isEqual:", CFSTR("iPhone")));

    -[PowerModeObjImpl setAppliesPowerTarget:](self, "setAppliesPowerTarget:", 1);
    -[PowerModeObjImpl setMaxEngagementDuration:](self, "setMaxEngagementDuration:", 21600.0);
  }
  v6 = self;

  return v6;
}

+ (id)powerModeInstance
{
  if (qword_10001BDE0 != -1)
    dispatch_once(&qword_10001BDE0, &stru_100014490);
  return (id)qword_10001BDE8;
}

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  char v22;
  int v23;
  BOOL v24;
  void *v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  NSObject *v29;
  _BOOL4 v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int v37;
  void *v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  unsigned int v46;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPluggedInContext")));
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Display")));
  v11 = objc_msgSend(v10, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kLockStateContext")));

  v13 = objc_msgSend(v12, "BOOLValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CarPlay")));

  v15 = objc_msgSend(v14, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AudioPlayback")));

  v17 = objc_msgSend(v16, "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OnenessSession")));

  v19 = objc_msgSend(v18, "state");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("USBDeviceMode")));

  v21 = objc_msgSend(v20, "state");
  v22 = v13 ^ 1;
  if (v11 != (id)101)
    v22 = 0;
  v23 = 1;
  if ((v22 & 1) != 0
    || v15 == (id)1
    || v17 == (id)1
    || (v19 != (id)1 ? (v24 = v21 == (id)1) : (v24 = 1), !v24 ? (v23 = 0) : (v23 = 1), !v9 || (v23 & 1) != 0))
  {
    v28 = 0;
    LOBYTE(v27) = 0;
    if (!-[PowerModeObjImpl state](self, "state"))
      goto LABEL_31;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[ChargeDurationPredictor sharedInstance](ChargeDurationPredictor, "sharedInstance"));
    v26 = v25;
    if (v25)
      v27 = objc_msgSend(v25, "longChargeExpected");
    else
      v27 = 0;

    if (v27 == -[PowerModeObjImpl state](self, "state"))
      goto LABEL_31;
    v23 = 0;
    v28 = v27;
  }
  v29 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = v11 == (id)101;
    v31 = (objc_class *)objc_opt_class(self);
    v32 = NSStringFromClass(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v37 = 138413314;
    v38 = v33;
    v39 = 1024;
    v40 = v28;
    v41 = 1024;
    v42 = v30;
    v43 = 1024;
    v44 = v15 == (id)1;
    v45 = 1024;
    v46 = v9;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "evaluatePowerMode: %@: %d display %d, carPlay %d, pluggedIn %d", (uint8_t *)&v37, 0x24u);

  }
  if ((v27 & 1) != 0)
  {
    LOBYTE(v27) = 1;
  }
  else
  {
    v34 = 4;
    if (v9)
      v34 = 1;
    if (v23)
      v35 = 3;
    else
      v35 = v34;
    -[PowerModeObjImpl setExitReason:](self, "setExitReason:", v35);
    LOBYTE(v27) = 0;
  }
LABEL_31:

  return v27;
}

- (void)enterPowerMode
{
  objc_super v3;

  if (!-[PowerModeObjImpl state](self, "state"))
  {
    v3.receiver = self;
    v3.super_class = (Class)LongChargingMode;
    -[PowerModeObjImpl enterPowerMode](&v3, "enterPowerMode");
    -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
  }
}

- (void)exitPowerMode
{
  objc_super v3;

  if (-[PowerModeObjImpl state](self, "state"))
  {
    v3.receiver = self;
    v3.super_class = (Class)LongChargingMode;
    -[PowerModeObjImpl exitPowerMode](&v3, "exitPowerMode");
    -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
  }
}

@end
