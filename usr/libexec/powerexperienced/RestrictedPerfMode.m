@implementation RestrictedPerfMode

- (RestrictedPerfMode)init
{
  RestrictedPerfMode *v2;
  os_log_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RestrictedPerfMode;
  v2 = -[RestrictedPerfMode init](&v15, "init");
  v3 = os_log_create("com.apple.powerexperienced", "RestrictedPerfMode");
  -[PowerModeObjImpl setLog:](v2, "setLog:", v3);

  -[PowerModeObjImpl setState:](v2, "setState:", 0);
  -[PowerModeObjImpl setEnabled:](v2, "setEnabled:", 1);
  -[RestrictedPerfMode setAllowOnCharger:](v2, "setAllowOnCharger:", 0);
  -[PowerModeObjImpl setEntryDelay:](v2, "setEntryDelay:", 3.0);
  byte_10001BDF0 = _os_feature_enabled_impl("powerexperienced", "RestrictedPerfMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPlatformContext")));
  if (objc_msgSend(v5, "isEqual:", CFSTR("iPhone")))
  {
    -[PowerModeObjImpl setSupportedPlatform:](v2, "setSupportedPlatform:", 1);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPlatformContext")));
    -[PowerModeObjImpl setSupportedPlatform:](v2, "setSupportedPlatform:", objc_msgSend(v7, "isEqual:", CFSTR("Watch")));

  }
  if (!-[PowerModeObjImpl supportedPlatform](v2, "supportedPlatform"))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](v2, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restricted perf mode not supported on this platform", buf, 2u);
    }
    goto LABEL_15;
  }
  -[PowerModeObjImpl setAppliesPowerTarget:](v2, "setAppliesPowerTarget:", 1);
  if (byte_10001BDF0 && (MGGetBoolAnswer(CFSTR("IsVirtualDevice")) & 1) == 0)
  {
    v13 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CLPCPolicyInterface createClient:](CLPCPolicyInterface, "createClient:", &v13));
    v9 = v13;
    -[RestrictedPerfMode setClpcClient:](v2, "setClpcClient:", v8);

    v10 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](v2, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initialized CLPC Policy Interface", buf, 2u);
    }

    if (v9)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](v2, "log"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10000CEE0((uint64_t)v9, v11);

LABEL_15:
    }
  }
  return v2;
}

+ (id)powerModeInstance
{
  if (qword_10001BDF8 != -1)
    dispatch_once(&qword_10001BDF8, &stru_1000144B0);
  return (id)qword_10001BE00;
}

- (void)restoreState:(id)a3
{
  -[PowerModeObjImpl setState:](self, "setState:", 0);
  -[PowerModeObjImpl updatePowerTarget](self, "updatePowerTarget");
}

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  _BOOL4 v26;
  const char *v27;
  id v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  NSObject *v33;
  unint64_t v34;
  _BOOL4 v35;
  unsigned int v36;
  id v37;
  NSObject *log;
  id v39;
  id v40;
  uint8_t buf[4];
  unint64_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  _BOOL4 v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  _BOOL4 v56;
  __int16 v57;
  _BOOL4 v58;
  __int16 v59;
  unsigned int v60;
  __int16 v61;
  unsigned int v62;

  v6 = a3;
  v7 = a4;
  if (!-[PowerModeObjImpl supportedPlatform](self, "supportedPlatform"))
  {
    v19 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v27 = "Platform not supported";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v27, buf, 2u);
    }
LABEL_27:
    LOBYTE(v21) = 0;
    goto LABEL_28;
  }
  if (!-[PowerModeObjImpl enabled](self, "enabled"))
  {
    v19 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v27 = "Restriced Perf Mode is disabled";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Display")));
  v40 = objc_msgSend(v8, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CarPlay")));

  v10 = objc_msgSend(v9, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NFCSession")));

  v12 = objc_msgSend(v11, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AudioPlayback")));

  v14 = objc_msgSend(v13, "state");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SleepInProgress")));

  v16 = objc_msgSend(v15, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WakeInProgress")));

  v18 = objc_msgSend(v17, "state");
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OnenessSession")));

  v39 = -[NSObject state](v19, "state");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kPluggedInContext")));
  v36 = objc_msgSend(v20, "BOOLValue");

  v21 = 0;
  if (v18 != (id)1 && v16 != (id)1)
  {
    v26 = v40 == (id)101 || v10 == (id)1 || v12 == (id)1 || v14 == (id)1 || v39 == (id)1;
    if (-[RestrictedPerfMode allowOnCharger](self, "allowOnCharger"))
      v21 = !v26;
    else
      v21 = (v36 | v26) ^ 1;
  }
  v37 = v7;
  log = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  v29 = v12;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v35 = v12 == (id)1;
    v30 = (objc_class *)objc_opt_class(self);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    *(_DWORD *)buf = 138414850;
    v42 = (unint64_t)v32;
    v43 = 1024;
    v44 = v21;
    v45 = 1024;
    v46 = v40 == (id)101;
    v47 = 1024;
    v48 = v10 == (id)1;
    v49 = 1024;
    v50 = v35;
    v51 = 1024;
    v52 = v14 == (id)1;
    v53 = 1024;
    v54 = v16 == (id)1;
    v55 = 1024;
    v56 = v18 == (id)1;
    v57 = 1024;
    v58 = v39 == (id)1;
    v59 = 1024;
    v60 = v36;
    v61 = 1024;
    v62 = -[RestrictedPerfMode allowOnCharger](self, "allowOnCharger");
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "evaluatePowerMode: %@: %d display %d, carPlaySession %d, nFCSession %d, audioSession %d, sleepInProgress %d, wakeInProgress %d, onenessSession %d, pluggedIn %d (allowOnCharger: %d)", buf, 0x48u);

  }
  -[RestrictedPerfMode setClientResponsible:](self, "setClientResponsible:", (4 * (v40 == (id)101)) | (8 * (v10 == (id)1)) | (16 * (v29 == (id)1)) | (32 * (v14 == (id)1)) | (v16 == (id)1) | (2 * (v18 == (id)1)) | ((unint64_t)(v39 == (id)1) << 7));
  if ((v21 & 1) != 0)
  {
    v7 = v37;
  }
  else
  {
    v7 = v37;
    if (-[PowerModeObjImpl state](self, "state"))
    {
      v33 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = -[RestrictedPerfMode clientResponsible](self, "clientResponsible");
        *(_DWORD *)buf = 134217984;
        v42 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Client responsible %llu", buf, 0xCu);
      }

      -[PowerModeObjImpl setExitReason:](self, "setExitReason:", 3);
    }
  }
LABEL_28:

  return v21;
}

- (void)enterPowerMode
{
  NSObject *v3;
  unsigned int v4;
  objc_super v5;
  uint8_t buf[4];
  unsigned int v7;

  if (!-[PowerModeObjImpl state](self, "state"))
  {
    v5.receiver = self;
    v5.super_class = (Class)RestrictedPerfMode;
    -[PowerModeObjImpl enterPowerMode](&v5, "enterPowerMode");
    v3 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[PowerModeObjImpl state](self, "state");
      *(_DWORD *)buf = 67109120;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Entering restricted perf mode. New state %d", buf, 8u);
    }

    -[RestrictedPerfMode logStatusToPowerLog](self, "logStatusToPowerLog");
  }
}

- (void)exitPowerMode
{
  NSObject *v3;
  unsigned int v4;
  objc_super v5;
  uint8_t buf[4];
  unsigned int v7;

  if (-[PowerModeObjImpl state](self, "state"))
  {
    v5.receiver = self;
    v5.super_class = (Class)RestrictedPerfMode;
    -[PowerModeObjImpl exitPowerMode](&v5, "exitPowerMode");
    v3 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[PowerModeObjImpl state](self, "state");
      *(_DWORD *)buf = 67109120;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Exiting restricted perf mode. New state %d", buf, 8u);
    }

    -[RestrictedPerfMode logStatusToPowerLog](self, "logStatusToPowerLog");
  }
}

- (void)allowOnCharger:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting allowOnCharger: %d", (uint8_t *)v6, 8u);
  }

  -[RestrictedPerfMode setAllowOnCharger:](self, "setAllowOnCharger:", v3);
}

- (void)logStatusToPowerLog
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  if (!-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"))
    -[PowerModeObjImpl setPowerlogIdentifier:](self, "setPowerlogIdentifier:", PPSCreateTelemetryIdentifier(CFSTR("PowerModes"), CFSTR("HotInPocket")));
  if (-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"))
  {
    v9[0] = CFSTR("status");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PowerModeObjImpl state](self, "state")));
    v9[1] = CFSTR("client");
    v10[0] = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[RestrictedPerfMode clientResponsible](self, "clientResponsible")));
    v10[1] = v4;
    v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

    PPSSendTelemetry(-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"), v5);
    v6 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Logging to powerlog %@", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000CF54(v5);
  }

}

- (CLPCPolicyAccess)clpcClient
{
  return (CLPCPolicyAccess *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClpcClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)allowOnCharger
{
  return self->_allowOnCharger;
}

- (void)setAllowOnCharger:(BOOL)a3
{
  self->_allowOnCharger = a3;
}

- (unint64_t)clientResponsible
{
  return self->_clientResponsible;
}

- (void)setClientResponsible:(unint64_t)a3
{
  self->_clientResponsible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clpcClient, 0);
}

@end
