@implementation InUseChargingMode

- (InUseChargingMode)init
{
  os_log_t v3;
  void *v4;
  void *v5;
  InUseChargingMode *v6;
  objc_super v8;

  if (_os_feature_enabled_impl("powerexperienced", "InUseChargingMode"))
  {
    v8.receiver = self;
    v8.super_class = (Class)InUseChargingMode;
    self = -[InUseChargingMode init](&v8, "init");
    v3 = os_log_create("com.apple.powerexperienced", "InUseChargingMode");
    -[PowerModeObjImpl setLog:](self, "setLog:", v3);

    -[PowerModeObjImpl setState:](self, "setState:", 0);
    -[PowerModeObjImpl setEnabled:](self, "setEnabled:", 1);
    -[PowerModeObjImpl setEntryDelay:](self, "setEntryDelay:", 120.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPlatformContext")));
    -[PowerModeObjImpl setSupportedPlatform:](self, "setSupportedPlatform:", objc_msgSend(v5, "isEqual:", CFSTR("iPhone")));

    -[PowerModeObjImpl setAppliesChargingPolicy:](self, "setAppliesChargingPolicy:", 1);
  }
  v6 = self;

  return v6;
}

+ (id)powerModeInstance
{
  if (qword_10001BDD0 != -1)
    dispatch_once(&qword_10001BDD0, &stru_100014470);
  return (id)qword_10001BDD8;
}

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned __int8 v19;
  char v20;
  _BOOL4 v21;
  void *v23;
  int v24;
  _BOOL4 v25;
  int v26;
  int v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  id v37;
  unsigned int v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  unsigned int v50;

  v6 = a3;
  v7 = a4;
  v38 = -[PowerModeObjImpl state](self, "state");
  v8 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "evaluatePowerMode resources %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Display")));
  v10 = objc_msgSend(v9, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CarPlay")));

  v12 = objc_msgSend(v11, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Camera")));

  v37 = objc_msgSend(v13, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PersonalHotspot")));

  v15 = objc_msgSend(v14, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kPluggedInContext")));
  v17 = objc_msgSend(v16, "BOOLValue");

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kLockStateContext")));
  v19 = objc_msgSend(v18, "BOOLValue");

  v36 = v10;
  v20 = v19 ^ 1;
  if (v10 != (id)101)
    v20 = 0;
  v21 = 1;
  if ((v20 & 1) == 0 && v12 != (id)1)
    v21 = v37 == (id)1 || v15 == (id)1;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kBatteryLevelContext")));

  v24 = objc_msgSend(v23, "intValue");
  if ((v17 & 1) == 0)
  {
    v27 = 0;
    if ((v38 & 1) == 0)
      goto LABEL_35;
    goto LABEL_23;
  }
  v25 = v24 > 19 && v21;
  v26 = !v25 | v38;
  v27 = v25 | v26 ^ 1;
  if ((v26 & 1) == 0 && v12 != (id)1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[ChargeDurationPredictor sharedInstance](ChargeDurationPredictor, "sharedInstance"));
    v27 = objc_msgSend(v28, "inTypicalUsageEnvironment");

  }
  if (v38 != v27)
  {
LABEL_23:
    v29 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (objc_class *)objc_opt_class(self);
      v31 = NSStringFromClass(v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)buf = 138413570;
      v40 = v32;
      v41 = 1024;
      v42 = v27;
      v43 = 1024;
      v44 = v36 == (id)101;
      v45 = 1024;
      v46 = v12 == (id)1;
      v47 = 1024;
      v48 = v37 == (id)1;
      v49 = 1024;
      v50 = v17;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "evaluatePowerMode: %@: %d display %d, carPlaySession %d cameraActive %d, pluggedIn %d", buf, 0x2Au);

    }
    if ((v27 & 1) != 0)
    {
      LOBYTE(v27) = 1;
    }
    else
    {
      v33 = 5;
      if (v24 > 19)
        v33 = 1;
      if (!v21)
        v33 = 2;
      if (v17)
        v34 = v33;
      else
        v34 = 4;
      -[PowerModeObjImpl setExitReason:](self, "setExitReason:", v34);
      LOBYTE(v27) = 0;
    }
  }
LABEL_35:

  return v27;
}

- (void)enterPowerMode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InUseChargingMode;
  -[PowerModeObjImpl enterPowerMode](&v3, "enterPowerMode");
  -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
}

- (void)exitPowerMode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InUseChargingMode;
  -[PowerModeObjImpl exitPowerMode](&v3, "exitPowerMode");
  -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
}

- (void)updateChargingPolicy
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[SMCSensorExchangeHelper sharedInstance](SMCSensorExchangeHelper, "sharedInstance"));
  objc_msgSend(v3, "updateCLTMChargingPolicy:", -[PowerModeObjImpl state](self, "state"));

}

@end
