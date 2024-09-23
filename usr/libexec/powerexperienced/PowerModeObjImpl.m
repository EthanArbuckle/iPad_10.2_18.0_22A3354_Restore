@implementation PowerModeObjImpl

- (void)enterPowerMode
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  int v18;
  void *v19;

  -[PowerModeObjImpl setState:](self, "setState:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[PowerModeObjImpl setLastEntryTime:](self, "setLastEntryTime:", v3);

  -[PowerModeObjImpl setExitReason:](self, "setExitReason:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kBatteryLevelContext")));
  -[PowerModeObjImpl setStartingSOC:](self, "setStartingSOC:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v18 = 138412290;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Entering Contextual Power Mode %@", (uint8_t *)&v18, 0xCu);

  }
  if (-[PowerModeObjImpl appliesPowerTarget](self, "appliesPowerTarget")
    && (objc_opt_respondsToSelector(self, "updatePowerTarget") & 1) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class(self);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v18 = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating power target for %@", (uint8_t *)&v18, 0xCu);

    }
    -[PowerModeObjImpl updatePowerTarget](self, "updatePowerTarget");
  }
  if (-[PowerModeObjImpl appliesChargingPolicy](self, "appliesChargingPolicy")
    && (objc_opt_respondsToSelector(self, "updateChargingPolicy") & 1) != 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class(self);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = 138412290;
      v19 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating charging policy for %@", (uint8_t *)&v18, 0xCu);

    }
    -[PowerModeObjImpl updateChargingPolicy](self, "updateChargingPolicy");
  }
}

- (void)exitPowerMode
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  const __CFString *v27;
  int v28;
  void *v29;

  -[PowerModeObjImpl setState:](self, "setState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[PowerModeObjImpl setLastExitTime:](self, "setLastExitTime:", v3);

  v4 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v28 = 138412290;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Exiting Contextual Power Mode %@", (uint8_t *)&v28, 0xCu);

  }
  if (-[PowerModeObjImpl appliesPowerTarget](self, "appliesPowerTarget")
    && (objc_opt_respondsToSelector(self, "updatePowerTarget") & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class(self);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v28 = 138412290;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating power target for %@", (uint8_t *)&v28, 0xCu);

    }
    -[PowerModeObjImpl updatePowerTarget](self, "updatePowerTarget");
  }
  if (-[PowerModeObjImpl appliesChargingPolicy](self, "appliesChargingPolicy")
    && (objc_opt_respondsToSelector(self, "updateChargingPolicy") & 1) != 0)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class(self);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v28 = 138412290;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating charging policy for %@", (uint8_t *)&v28, 0xCu);

    }
    -[PowerModeObjImpl updateChargingPolicy](self, "updateChargingPolicy");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](DeviceContext, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kBatteryLevelContext")));
  -[PowerModeObjImpl setEndingSOC:](self, "setEndingSOC:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[AnalyticsLogger logger](AnalyticsLogger, "logger"));
  v19 = (objc_class *)objc_opt_class(self);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl lastEntryTime](self, "lastEntryTime"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl lastExitTime](self, "lastExitTime"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl startingSOC](self, "startingSOC"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl endingSOC](self, "endingSOC"));
  v26 = -[PowerModeObjImpl exitReason](self, "exitReason") - 1;
  if (v26 > 4)
    v27 = CFSTR("Unknown");
  else
    v27 = off_1000144F0[v26];
  objc_msgSend(v18, "logCAEventforMode:startDate:endDate:startingSOC:endingSOC:exitReason:", v21, v22, v23, v24, v25, v27);

}

- (void)enablePowerMode
{
  -[PowerModeObjImpl setEnabled:](self, "setEnabled:", 1);
}

- (void)disablePowerMode
{
  -[PowerModeObjImpl setEnabled:](self, "setEnabled:", 0);
}

- (void)restoreState:(id)a3
{
  id v4;
  NSObject *log;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = log;
    *(_DWORD *)buf = 138412546;
    v22 = (id)objc_opt_class(NSString);
    v23 = 2112;
    v24 = v4;
    v7 = v22;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restoring state for %@: %@", buf, 0x16u);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("state")))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state")));
          -[PowerModeObjImpl setState:](self, "setState:", objc_msgSend(v14, "BOOLValue"));

        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("lastExitTime")))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastExitTime")));
          -[PowerModeObjImpl setLastExitTime:](self, "setLastExitTime:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)logStatusToPowerLog
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];

  if (!-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"))
  {
    v3 = (objc_class *)objc_opt_class(self);
    v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[PowerModeObjImpl setPowerlogIdentifier:](self, "setPowerlogIdentifier:", PPSCreateTelemetryIdentifier(CFSTR("PowerModes"), v5));

  }
  if (-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"))
  {
    if (-[PowerModeObjImpl exitReason](self, "exitReason"))
    {
      v14[0] = CFSTR("status");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PowerModeObjImpl state](self, "state")));
      v14[1] = CFSTR("ExitReason");
      v15[0] = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[PowerModeObjImpl exitReason](self, "exitReason")));
      v15[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));

    }
    else
    {
      v12 = CFSTR("status");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[PowerModeObjImpl state](self, "state")));
      v13 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    }

    v9 = objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Logging %@ to powerlog", (uint8_t *)&v10, 0xCu);
    }

    PPSSendTelemetry(-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"), v8);
  }
}

- (double)getEntryDelay
{
  double result;

  -[PowerModeObjImpl entryDelay](self, "entryDelay");
  return result;
}

- (double)getMaxEngagementDuration
{
  double result;

  -[PowerModeObjImpl maxEngagementDuration](self, "maxEngagementDuration");
  return result;
}

- (void)updatePowerTarget
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[CLPCPolicyInterfaceHelper sharedInstance](CLPCPolicyInterfaceHelper, "sharedInstance"));
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v6, "updatePowerTargetForMode:withState:", v5, -[PowerModeObjImpl state](self, "state"));

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (BOOL)state
{
  return self->_state;
}

- (void)setState:(BOOL)a3
{
  self->_state = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)supportedPlatform
{
  return self->_supportedPlatform;
}

- (void)setSupportedPlatform:(BOOL)a3
{
  self->_supportedPlatform = a3;
}

- (NSDate)lastEntryTime
{
  return self->_lastEntryTime;
}

- (void)setLastEntryTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastEntryTime, a3);
}

- (NSDate)lastExitTime
{
  return self->_lastExitTime;
}

- (void)setLastExitTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastExitTime, a3);
}

- (double)entryDelay
{
  return self->_entryDelay;
}

- (void)setEntryDelay:(double)a3
{
  self->_entryDelay = a3;
}

- (double)maxEngagementDuration
{
  return self->_maxEngagementDuration;
}

- (void)setMaxEngagementDuration:(double)a3
{
  self->_maxEngagementDuration = a3;
}

- (unint64_t)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(unint64_t)a3
{
  self->_exitReason = a3;
}

- (NSNumber)startingSOC
{
  return self->_startingSOC;
}

- (void)setStartingSOC:(id)a3
{
  objc_storeStrong((id *)&self->_startingSOC, a3);
}

- (NSNumber)endingSOC
{
  return self->_endingSOC;
}

- (void)setEndingSOC:(id)a3
{
  objc_storeStrong((id *)&self->_endingSOC, a3);
}

- (PPSTelemetryIdentifier)powerlogIdentifier
{
  return self->_powerlogIdentifier;
}

- (void)setPowerlogIdentifier:(PPSTelemetryIdentifier *)a3
{
  self->_powerlogIdentifier = a3;
}

- (BOOL)appliesPowerTarget
{
  return self->_appliesPowerTarget;
}

- (void)setAppliesPowerTarget:(BOOL)a3
{
  self->_appliesPowerTarget = a3;
}

- (BOOL)appliesChargingPolicy
{
  return self->_appliesChargingPolicy;
}

- (void)setAppliesChargingPolicy:(BOOL)a3
{
  self->_appliesChargingPolicy = a3;
}

- (BOOL)pendingDelayedEntryTimer
{
  return self->_pendingDelayedEntryTimer;
}

- (void)setPendingDelayedEntryTimer:(BOOL)a3
{
  self->_pendingDelayedEntryTimer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingSOC, 0);
  objc_storeStrong((id *)&self->_startingSOC, 0);
  objc_storeStrong((id *)&self->_lastExitTime, 0);
  objc_storeStrong((id *)&self->_lastEntryTime, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
