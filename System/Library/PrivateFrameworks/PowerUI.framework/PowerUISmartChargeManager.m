@implementation PowerUISmartChargeManager

- (void)handleCallback
{
  -[PowerUISmartChargeManager handleCallback:](self, "handleCallback:", 0);
}

- (void)handleCallback:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _CDLocalContext *context;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  int v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  double debounceOverride;
  char v32;
  NSObject *v33;
  NSDate *potentialUnplugDate;
  NSObject *log;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  double v40;
  NSObject *v41;
  NSDate *v42;
  NSDate *v43;
  int v44;
  char v45;
  void *v46;
  void *v47;
  id v48;
  char v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  _BOOL8 v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  __int128 buf;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v58 = (void *)os_transaction_create();
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("Beginning of handleCallback"));
  -[PowerUISmartChargeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PowerUISmartChargeManager log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "Handling data dictionary: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "batteryPercentageKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(MEMORY[0x24BE1B180], "batteryFullyChargedKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v16, "BOOLValue");

    context = self->_context;
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForPluginStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    -[PowerUISmartChargeManager updateNotificationSettings:](self, "updateNotificationSettings:", v14);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (-[PowerUISmartChargeManager lastPluginStatus](self, "lastPluginStatus"))
      v22 = 0;
    else
      v22 = v14;
    if (v22 == 1)
    {
      objc_msgSend(v21, "timeIntervalSinceDate:", self->_disabledUntilDate);
      if (v23 > 0.0)
        -[PowerUISmartChargeManager setTemporarilyDisabled:until:](self, "setTemporarilyDisabled:until:", 0, 0);
    }
    objc_msgSend(MEMORY[0x24BE1B180], "batteryIsChargingKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    if ((_DWORD)v11 != -[PowerUISmartChargeManager lastBatteryLevel](self, "lastBatteryLevel")
      || -[PowerUISmartChargeManager lastPluginStatus](self, "lastPluginStatus") < 1)
    {
      goto LABEL_25;
    }
    v27 = -[PowerUISmartChargeManager lastPluginStatus](self, "lastPluginStatus");
    if ((v14 & 1) != 0)
    {
      if (v27 > 0)
        v28 = v26;
      else
        v28 = 0;
      if (v28 != 1 || v57 && self->_checkpoint - 5 < 2)
        goto LABEL_25;
    }
    else if (v27 > 0)
    {
      goto LABEL_25;
    }
    if (!a3)
    {
      -[PowerUISmartChargeManager log](self, "log");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[PowerUISmartChargeManager handleCallback:].cold.5();
      goto LABEL_24;
    }
LABEL_25:
    if (!-[PowerUISmartChargeManager shouldContinueAfterMCMCheckWithBatteryLevel:withIsCharging:withIsExternalConnected:withIsPluggedIn:](self, "shouldContinueAfterMCMCheckWithBatteryLevel:withIsCharging:withIsExternalConnected:withIsPluggedIn:", v11, v26, v14, v20))goto LABEL_97;
    if (os_log_type_enabled((os_log_t)self->_mcmLog, OS_LOG_TYPE_DEBUG))
      -[PowerUISmartChargeManager handleCallback:].cold.4();
    -[PowerUISmartChargeManager log](self, "log");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[PowerUISmartChargeManager handleCallback:].cold.3(self, v14, v30);

    debounceOverride = 300.0;
    if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild")
      && self->_debounceOverride >= 0.0)
    {
      debounceOverride = self->_debounceOverride;
    }
    if (-[PowerUISmartChargeManager lastPluginStatus](self, "lastPluginStatus") == (_DWORD)v14)
      v32 = 1;
    else
      v32 = v14;
    if ((v32 & 1) != 0)
    {
      if ((_DWORD)v14 && self->_potentialUnplugDate)
      {
        -[PowerUISmartChargeManager log](self, "log");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_215A71000, v33, OS_LOG_TYPE_DEFAULT, "Plugged in within debounce limit, ignore previous unplug", (uint8_t *)&buf, 2u);
        }

        potentialUnplugDate = self->_potentialUnplugDate;
        self->_potentialUnplugDate = 0;

        -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", 0, CFSTR("potentialUnplugDate"));
        if (!self->_isDesktopDevice && self->_manualChargeLimitStatus != 1 && self->_checkpoint - 2 <= 2)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "OBC still engaged on re-plug, re-post notification", (uint8_t *)&buf, 2u);
          }
          -[PowerUISmartChargeManager postOBCNotificationWithTopOff:](self, "postOBCNotificationWithTopOff:", 0);
        }
      }
      goto LABEL_58;
    }
    if (self->_potentialUnplugDate)
    {
      objc_msgSend(v21, "timeIntervalSinceDate:");
      if (v36 < debounceOverride)
      {
        objc_msgSend(v21, "timeIntervalSinceDate:", self->_potentialUnplugDate);
        v38 = v37;
        -[PowerUISmartChargeManager log](self, "log");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = fmax(debounceOverride - v38, 10.0);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(double *)((char *)&buf + 4) = v40;
          _os_log_impl(&dword_215A71000, v39, OS_LOG_TYPE_DEFAULT, "Potential disconnect, debounce for %f more seconds", (uint8_t *)&buf, 0xCu);
        }

        -[PowerUISmartChargeManager requestPeriodicCheckWithDuration:withAlarmKey:](self, "requestPeriodicCheckWithDuration:withAlarmKey:", "DebounceTimer", v40);
        goto LABEL_97;
      }
      -[PowerUISmartChargeManager log](self, "log");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = debounceOverride;
        _os_log_impl(&dword_215A71000, v41, OS_LOG_TYPE_DEFAULT, "Device not reconnected to power within %f seconds, treat as unplugged", (uint8_t *)&buf, 0xCu);
      }

      v42 = self->_potentialUnplugDate;
      v43 = self->_potentialUnplugDate;
      self->_potentialUnplugDate = 0;

      -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", 0, CFSTR("potentialUnplugDate"));
      v21 = v42;
LABEL_58:
      -[PowerUISmartChargeManager updateTimeLineForCurrentBatteryLevel:withIsExternalConnected:forDate:](self, "updateTimeLineForCurrentBatteryLevel:withIsExternalConnected:forDate:", v11, v14, v21);
      -[PowerUISmartChargeManager setLastBatteryLevel:](self, "setLastBatteryLevel:", v11);
      v21 = v21;
      if (-[PowerUISmartChargeManager lastPluginStatus](self, "lastPluginStatus") != (_DWORD)v14)
        -[PowerUIIntelligenceManager handleCallback](self->_intelligenceManager, "handleCallback");
      v44 = -[PowerUISmartChargeManager lastPluginStatus](self, "lastPluginStatus");
      v45 = v14 ^ 1;
      if (v44 == (_DWORD)v14)
        v45 = 1;
      if ((v45 & 1) != 0)
      {
        if (-[PowerUISmartChargeManager lastPluginStatus](self, "lastPluginStatus") == (_DWORD)v14)
          v49 = 1;
        else
          v49 = v14;
        if ((v49 & 1) != 0)
        {
          v50 = v21;
          if (-[PowerUISmartChargeManager lastPluginStatus](self, "lastPluginStatus") == (_DWORD)v14)
          {
            v50 = v21;
            if (self->_manualChargeLimitStatus != 1)
            {
              v50 = v21;
              if (!self->_checkpoint)
              {
                if (!self->_enabled || (v50 = v21, self->_temporarilyDisabled))
                {
                  -[PowerUISmartChargeManager log](self, "log");
                  v51 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                    -[PowerUISmartChargeManager handleCallback:].cold.2((uint64_t)self, v51);

                  v50 = v21;
                  goto LABEL_96;
                }
              }
            }
          }
        }
        else
        {
          -[PowerUISmartChargeManager handleUnplugAtDate:withBatteryLevel:](self, "handleUnplugAtDate:withBatteryLevel:", v21, v11);
          v50 = v21;
        }
      }
      else
      {
        +[PowerUISmartChargeUtilities timelineEventDate:withDefaultsDomain:](PowerUISmartChargeUtilities, "timelineEventDate:withDefaultsDomain:", CFSTR("Plugin"), self->_defaultsDomain);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v46)
        {
          v48 = v46;
        }
        else
        {
          +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
          v48 = (id)objc_claimAutoreleasedReturnValue();
        }
        v50 = v48;

        -[PowerUISmartChargeManager log](self, "log");
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          -[PowerUISmartChargeManager handleCallback:].cold.1();

        v53 = +[PowerUISmartChargeUtilities deviceConnectedToWirelessChargerWithContext:](PowerUISmartChargeUtilities, "deviceConnectedToWirelessChargerWithContext:", self->_context);
        self->_lastChargerWasWireless = v53;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v54, CFSTR("wirelessCharger"));

        -[PowerUISmartChargeManager resetDeviceHasLegitimateUsage](self, "resetDeviceHasLegitimateUsage");
        -[PowerUIMLTwoStageModelPredictor setPluginDate:](self->_modelTwoStagePredictor, "setPluginDate:", v50);
        if (!v47)
          -[PowerUISmartChargeManager handleNewPluginWithBatteryLevel:pluginDate:](self, "handleNewPluginWithBatteryLevel:pluginDate:", v11, v50);
        +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
        {
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v60 = 0x3032000000;
          v61 = __Block_byref_object_copy__6;
          v62 = __Block_byref_object_dispose__6;
          objc_msgSend(v55, "objectForKey:", CFSTR("featureAnalytics"));
          v63 = (id)objc_claimAutoreleasedReturnValue();
          if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
            AnalyticsSendEventLazy();
          _Block_object_dispose(&buf, 8);

        }
      }
      -[PowerUISmartChargeManager setLastPluginStatus:](self, "setLastPluginStatus:", v14);
      if ((((v20 | v14) & 1) != 0 || self->_isChargePackConnected)
        && self->_manualChargeLimitStatus == 1)
      {
        -[PowerUISmartChargeManager engageManualChargeLimit](self, "engageManualChargeLimit");
      }
      if (self->_manualChargeLimitStatus == 1)
      {
        -[PowerUISmartChargeManager handleNewBatteryLevelForMCL:whileExternalConnected:](self, "handleNewBatteryLevelForMCL:whileExternalConnected:", v11, v14);
      }
      else if (+[PowerUISmartChargeUtilities isiPhone](PowerUISmartChargeUtilities, "isiPhone"))
      {
        -[PowerUISmartChargeManager handleNewBatteryLevel:whileExternalConnected:fullyCharged:](self, "handleNewBatteryLevel:whileExternalConnected:fullyCharged:", v11, v14, v57);
      }
LABEL_96:

      goto LABEL_97;
    }
    objc_storeStrong((id *)&self->_potentialUnplugDate, v21);
    -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", self->_potentialUnplugDate, CFSTR("potentialUnplugDate"));
    -[PowerUISmartChargeManager requestPeriodicCheckWithDuration:withAlarmKey:](self, "requestPeriodicCheckWithDuration:withAlarmKey:", "DebounceTimer", debounceOverride);
    -[PowerUISmartChargeManager clearAllNotificationState](self, "clearAllNotificationState");
    -[PowerUISmartChargeManager log](self, "log");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = debounceOverride;
      _os_log_impl(&dword_215A71000, v29, OS_LOG_TYPE_DEFAULT, "Potential disconnect, debounce for %f seconds", (uint8_t *)&buf, 0xCu);
    }
LABEL_24:

LABEL_97:
  }

}

- (int)lastPluginStatus
{
  return self->_lastPluginStatus;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLastFullyCharged:(int)a3
{
  self->_lastFullyCharged = a3;
}

- (int)lastBatteryLevel
{
  return self->_lastBatteryLevel;
}

- (void)updateNotificationSettings:(BOOL)a3
{
  id v3;

  if (a3)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v3, "Notification", "com.apple.system.powermanagement.useractivity2");
    xpc_set_event();

  }
  else
  {
    xpc_set_event();
  }
}

- (void)setLastPluginStatus:(int)a3
{
  self->_lastPluginStatus = a3;
}

- (void)setLastBatteryLevel:(int)a3
{
  self->_lastBatteryLevel = a3;
}

- (void)handleNewBatteryLevel:(int)a3 whileExternalConnected:(BOOL)a4 fullyCharged:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *log;
  NSObject *v10;
  _BOOL8 v11;
  unint64_t checkpoint;
  void *v13;
  PowerUISmartChargeManager *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  PowerUISmartChargeManager *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  unint64_t v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD block[5];
  uint8_t buf[4];
  _DWORD v66[7];

  v5 = a4;
  *(_QWORD *)&v66[5] = *MEMORY[0x24BDAC8D0];
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("Beginning of handleNewBatteryLevel"), a4, a5);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v66[0] = a3;
    LOWORD(v66[1]) = 1024;
    *(_DWORD *)((char *)&v66[1] + 2) = v5;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Called for battery level=%d, externalConnected=%u", buf, 0xEu);
  }
  if (!v5)
  {
    -[PowerUISmartChargeManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__PowerUISmartChargeManager_handleNewBatteryLevel_whileExternalConnected_fullyCharged___block_invoke;
    block[3] = &unk_24D3FB7B0;
    block[4] = self;
    dispatch_async(v10, block);

  }
  v11 = a3 == 100 && v5;
  if (-[PowerUISmartChargeManager isDeviceWithLegitimateUsage](self, "isDeviceWithLegitimateUsage"))
  {
    checkpoint = self->_checkpoint;
    if (!self->_enabled || self->_temporarilyDisabled)
    {
      -[PowerUISmartChargeManager stopAllMonitoring](self, "stopAllMonitoring");
      if (checkpoint - 1 > 8)
      {
        if ((checkpoint & 0xFFFFFFFFFFFFFFFELL) != 0xA)
        {
LABEL_19:
          v18 = self->_log;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = (void *)MEMORY[0x24BDD16E0];
            v20 = self->_checkpoint;
            v21 = v18;
            objc_msgSend(v19, "numberWithUnsignedInteger:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v66 = v22;
            _os_log_impl(&dword_215A71000, v21, OS_LOG_TYPE_DEFAULT, "Checkpoint: %@", buf, 0xCu);

          }
          v23 = self->_checkpoint;
          if (checkpoint != v23 && v23)
          {
            switch(v23)
            {
              case 2uLL:
                if (!self->_isDesktopDevice)
                {
                  v24 = self->_log;
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_215A71000, v24, OS_LOG_TYPE_DEFAULT, "Top-Off Detected. Provide non-obvious notification", buf, 2u);
                  }
                  v25 = self;
                  v26 = 0;
                  goto LABEL_50;
                }
                break;
              case 5uLL:
                v44 = self->_log;
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_215A71000, v44, OS_LOG_TYPE_DEFAULT, "Top-Off Engaged. Provide obvious notification", buf, 2u);
                }
                -[PowerUISmartChargeManager clearAllNotificationState](self, "clearAllNotificationState");
                v25 = self;
                v26 = 1;
LABEL_50:
                -[PowerUISmartChargeManager postOBCNotificationWithTopOff:](v25, "postOBCNotificationWithTopOff:", v26);
                break;
              case 7uLL:
                v45 = self->_log;
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_215A71000, v45, OS_LOG_TYPE_DEFAULT, "Success: Removing all notifications.", buf, 2u);
                }
                goto LABEL_56;
              case 8uLL:
                -[PowerUISmartChargeManager fullChargeDeadlineOverride](self, "fullChargeDeadlineOverride");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                if (v46)
                  goto LABEL_54;
                if (!self->_lastChargerWasWireless)
                {
                  objc_msgSend(MEMORY[0x24BDBCE60], "date");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", v46, CFSTR("lastInterrupted"));
LABEL_54:

                }
LABEL_56:
                -[PowerUISmartChargeManager clearAllNotificationState](self, "clearAllNotificationState");
                break;
              default:
                break;
            }
          }
          if (checkpoint != self->_checkpoint)
            -[PowerUISmartChargeManager promptBDCToQueryCurrentState](self, "promptBDCToQueryCurrentState");
          if (!v5 && (self->_checkpoint & 0xFFFFFFFFFFFFFFFELL) == 8)
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", 0, 0, v47);

            -[PowerUISmartChargeManager setCheckpoint:withSelector:](self, "setCheckpoint:withSelector:", 0, a2);
            -[PowerUIChargingController clearAllChargeLimits](self->_chargingController, "clearAllChargeLimits");
            notify_post((const char *)objc_msgSend(CFSTR("com.apple.powerui.smartchargestatuschanged"), "UTF8String"));
          }
          +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("End of handleNewBatterylevel"));
          return;
        }
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", 0, 0, v17);

        v14 = self;
        v15 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", 10, 0, v13);

        v14 = self;
        v15 = 10;
      }
      -[PowerUISmartChargeManager setCheckpoint:withSelector:](v14, "setCheckpoint:withSelector:", v15, a2);
      goto LABEL_19;
    }
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUISmartChargeManager updateChargingTimeSaved](self, "updateChargingTimeSaved");
      -[PowerUISmartChargeManager stopAllMonitoring](self, "stopAllMonitoring");
      if (checkpoint > 6 || (v42 = 8, ((1 << checkpoint) & 0x43) != 0))
      {
        if (checkpoint == 1)
          v43 = 0;
        else
          v43 = checkpoint;
        if (checkpoint - 6 >= 3)
          v42 = v43;
        else
          v42 = 0;
      }
      -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", v42, 0, v41);
      -[PowerUISmartChargeManager setCheckpoint:withSelector:](self, "setCheckpoint:withSelector:", v42, a2);
      -[PowerUISmartChargeManager cleanupOverrides](self, "cleanupOverrides");

      goto LABEL_19;
    }
    -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("lastInterrupted"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v27)
    {
      objc_msgSend(v28, "timeIntervalSinceDate:", v27);
      if (v30 < 8.0)
      {
        v31 = self->_log;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v31, OS_LOG_TYPE_DEFAULT, "Device unplugged and reconnected...logging this behavior", buf, 2u);
        }
        -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D443918, CFSTR("recentlyInterrupted"));
      }
    }
    v32 = a3;
    -[PowerUISmartChargeManager chargePrediction:fullyCharged:previousCheckpoint:predictor:](self, "chargePrediction:fullyCharged:previousCheckpoint:predictor:", a3, v11, checkpoint, self->_predictorType);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("checkpoint"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
LABEL_68:
      -[PowerUISmartChargeManager requestPeriodicCheck](self, "requestPeriodicCheck");
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("checkpoint"));
      v49 = objc_claimAutoreleasedReturnValue();
      if (!v49)
        goto LABEL_78;
      v50 = (void *)v49;
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("shouldDisableCharging"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v51)
        goto LABEL_78;
      v52 = v29;
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("shouldDisableCharging"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "BOOLValue");

      if (v54)
      {
        -[PowerUISmartChargeManager disableCharging](self, "disableCharging");
        v55 = self->_checkpoint;
        v29 = v52;
        if (checkpoint == v55 || v55 == 4)
          goto LABEL_78;
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        v57 = v56;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v58, CFSTR("chargingDisabledAt"));

        v29 = v52;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v59, CFSTR("lastEnabled"));

      }
      else
      {
        -[PowerUISmartChargeManager enableCharging](self, "enableCharging");
        v60 = self->_checkpoint;
        v29 = v52;
        if (checkpoint == v60 || v60 == 3)
          goto LABEL_78;
        -[PowerUISmartChargeManager updateChargingTimeSaved](self, "updateChargingTimeSaved");
      }
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.powerui.smartchargestatuschanged"), "UTF8String"));
LABEL_78:

      goto LABEL_19;
    }
    v62 = v29;
    v63 = v27;
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("checkpoint"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "unsignedIntegerValue");

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "integerValue");

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("decisionDate"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager updateDecisionMakerID:withCheckpoint:](self, "updateDecisionMakerID:withCheckpoint:", v38, v36);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", v36, v40, v39);

    if (checkpoint == v36)
    {
LABEL_67:

      v29 = v62;
      v27 = v63;
      goto LABEL_68;
    }
    if (v36 != 7)
    {
      -[PowerUISmartChargeManager checkpointNameFromCheckpoint:](self, "checkpointNameFromCheckpoint:", v36);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUISmartChargeManager pluginTimelineAddEvent:atDate:withBatteryLevel:](self, "pluginTimelineAddEvent:atDate:withBatteryLevel:", v61, v48, v32);

      if (v36 == 2)
      {
        -[PowerUISmartChargeManager startAllMonitoring](self, "startAllMonitoring");
        goto LABEL_65;
      }
      if (v36 < 5)
        goto LABEL_66;
    }
    -[PowerUISmartChargeManager stopAllMonitoring](self, "stopAllMonitoring");
LABEL_65:
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.smartcharging.statechange"), "UTF8String"));
LABEL_66:
    -[PowerUISmartChargeManager setCheckpoint:withSelector:](self, "setCheckpoint:withSelector:", v36, a2);
    goto LABEL_67;
  }
  -[PowerUISmartChargeManager log](self, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[PowerUISmartChargeManager handleNewBatteryLevel:whileExternalConnected:fullyCharged:].cold.1();

}

- (BOOL)isDeviceWithLegitimateUsage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__PowerUISmartChargeManager_isDeviceWithLegitimateUsage__block_invoke;
  block[3] = &unk_24D3FB7B0;
  block[4] = self;
  if (isDeviceWithLegitimateUsage_onceToken != -1)
    dispatch_once(&isDeviceWithLegitimateUsage_onceToken, block);
  return self->__hasLegitimateUsage;
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PowerUISmartChargeManager)initWithDefaultsDomain:(id)a3 contextStore:(id)a4 beforeHandlingBatteryChangeCallback:(id)a5 afterHandlingBatteryChangeCallback:(id)a6
{
  char *v11;
  os_log_t v12;
  void *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  os_log_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  PowerUITrialManager *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  PowerUIMLPhonePredictor *v64;
  void *v65;
  PowerUIIntelligenceManager *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  void *v78;
  double v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  char *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  NSObject *v96;
  id *v97;
  uint64_t v98;
  id v99;
  NSObject *v100;
  id *v101;
  NSObject *v102;
  id *v103;
  const char *v104;
  NSObject *v105;
  id *v106;
  NSObject *v107;
  id *v108;
  NSObject *v109;
  id *v110;
  NSObject *v111;
  id *v112;
  NSObject *v113;
  id *v114;
  NSObject *v115;
  id *v116;
  NSObject *v117;
  id *v118;
  NSObject *v119;
  id v120;
  NSObject *v121;
  id v122;
  NSObject *v123;
  id v124;
  NSObject *v125;
  id v126;
  NSObject *v127;
  id v128;
  NSObject *v129;
  id v130;
  NSObject *v131;
  id v132;
  NSObject *v133;
  id v134;
  NSObject *v135;
  id v136;
  NSObject *v137;
  id v138;
  NSObject *v139;
  id v140;
  NSObject *v141;
  int *v142;
  void *v143;
  NSObject *v144;
  int *v145;
  void *v146;
  int *v147;
  int *v148;
  int *v149;
  NSObject *v151;
  void *v152;
  void *v153;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  id v166;
  _QWORD v167[4];
  int *v168;
  _QWORD v169[4];
  int *v170;
  _QWORD v171[4];
  int *v172;
  _QWORD v173[4];
  int *v174;
  _QWORD v175[4];
  int *v176;
  _QWORD v177[4];
  int *v178;
  int v179;
  _QWORD v180[4];
  id v181;
  int v182;
  _QWORD v183[4];
  id v184;
  int v185;
  _QWORD v186[4];
  id v187;
  int v188;
  _QWORD v189[4];
  id v190;
  int v191;
  _QWORD v192[4];
  id v193;
  int v194;
  _QWORD v195[4];
  id v196;
  int v197;
  _QWORD v198[4];
  id v199;
  int v200;
  _QWORD v201[4];
  id v202;
  int v203;
  _QWORD v204[4];
  id v205;
  int v206;
  _QWORD v207[4];
  id v208;
  int v209;
  _QWORD v210[4];
  id v211;
  int v212;
  _QWORD v213[4];
  id v214;
  int v215;
  _QWORD v216[4];
  id *v217;
  int v218;
  _QWORD v219[4];
  id *v220;
  SEL v221;
  int v222;
  _QWORD v223[4];
  id *v224;
  int v225;
  _QWORD v226[4];
  id *v227;
  int v228;
  _QWORD v229[4];
  id *v230;
  int v231;
  _QWORD v232[4];
  id *v233;
  int v234;
  _QWORD v235[4];
  id *v236;
  int out_token;
  _QWORD handler[4];
  id *v239;
  _QWORD block[4];
  id *v241;
  _QWORD v242[4];
  char *v243;
  id v244;
  id v245;
  _QWORD v246[4];
  id v247;
  id location;
  objc_super v249;
  uint8_t buf[4];
  void *v251;
  __int16 v252;
  _BOOL4 v253;
  _QWORD v254[7];

  v254[4] = *MEMORY[0x24BDAC8D0];
  v158 = a3;
  v159 = a4;
  v166 = a5;
  v163 = a6;
  v249.receiver = self;
  v249.super_class = (Class)PowerUISmartChargeManager;
  v11 = -[PowerUISmartChargeManager init](&v249, sel_init);
  if (v11)
  {
    v153 = (void *)os_transaction_create();
    v12 = os_log_create("com.apple.powerui.smartcharging", ");
    v13 = (void *)*((_QWORD *)v11 + 12);
    *((_QWORD *)v11 + 12) = v12;

    v14 = (id *)(v11 + 48);
    objc_storeStrong((id *)v11 + 6, a4);
    objc_storeStrong((id *)v11 + 7, a3);
    +[PowerUIChargingController sharedInstance](PowerUIChargingController, "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v11 + 50);
    *((_QWORD *)v11 + 50) = v15;

    +[PowerUIAnalyticsManager sharedInstance](PowerUIAnalyticsManager, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v11 + 51);
    *((_QWORD *)v11 + 51) = v17;

    objc_msgSend(v11, "readStringForPreferenceKey:", CFSTR("bootUUIDOnLastInit"));
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    +[PowerUISmartChargeUtilities getCurrentBootSessionUUID](PowerUISmartChargeUtilities, "getCurrentBootSessionUUID");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v162, "isEqualToString:", v157);
    objc_msgSend(v11, "setString:forPreferenceKey:", v162, CFSTR("bootUUIDOnLastInit"));
    v20 = *((_QWORD *)v11 + 12);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)MEMORY[0x24BDD16E0];
      v22 = v20;
      objc_msgSend(v21, "numberWithBool:", v19 ^ 1u);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v251 = v23;
      _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "SmartChargeManager initializing. Was the device restarted: %@", buf, 0xCu);

    }
    if (v19)
      v24 = 2;
    else
      v24 = 1;
    objc_msgSend(*((id *)v11 + 51), "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", 0, 0, 0, 0, v24);
    v25 = MEMORY[0x2199EC2D0](v166);
    v26 = (void *)*((_QWORD *)v11 + 8);
    *((_QWORD *)v11 + 8) = v25;

    v27 = MEMORY[0x2199EC2D0](v166);
    v28 = (void *)*((_QWORD *)v11 + 9);
    *((_QWORD *)v11 + 9) = v27;

    if ((v19 & 1) == 0)
      objc_msgSend(*((id *)v11 + 50), "clearAllChargeLimits");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("com.apple.powerui.queue", v29);
    v31 = (void *)*((_QWORD *)v11 + 21);
    *((_QWORD *)v11 + 21) = v30;

    v32 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v33 = (void *)*((_QWORD *)v11 + 59);
    *((_QWORD *)v11 + 59) = v32;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v11, sel_powerStateChangedCallback, *MEMORY[0x24BDD1160], 0);

    v35 = os_log_create("com.apple.powerui.mobilechargemode", ");
    v36 = (void *)*((_QWORD *)v11 + 13);
    *((_QWORD *)v11 + 13) = v35;

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)*((_QWORD *)v11 + 11);
    *((_QWORD *)v11 + 11) = v37;

    objc_msgSend(v11, "readNumberForPreferenceKey:", CFSTR("MCMCurrentState"));
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v165)
    {
      objc_msgSend(v11, "setNumber:forPreferenceKey:", &unk_24D4438D0, CFSTR("MCMCurrentState"));
      v165 = &unk_24D4438D0;
    }
    objc_msgSend(v11, "readNumberForPreferenceKey:", CFSTR("MCMForbidsCharging"));
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v164)
    {
      objc_msgSend(v11, "setNumber:forPreferenceKey:", MEMORY[0x24BDBD1C0], CFSTR("MCMForbidsCharging"));
      v164 = (void *)MEMORY[0x24BDBD1C0];
    }
    v11[17] = 0;
    v39 = objc_msgSend(v165, "unsignedIntValue");
    *((_QWORD *)v11 + 52) = v39;
    if (v39 == 2)
      objc_msgSend(v11, "startFidgetMitigationTimer");
    v11[18] = objc_msgSend(v164, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE1A0C0], "sharedInstance");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v11 + 53);
    *((_QWORD *)v11 + 53) = v40;

    if (objc_msgSend(v11, "isMCMSupported"))
      objc_msgSend(*((id *)v11 + 53), "registerDelegate:", v11);
    objc_msgSend(v11, "readNumberForPreferenceKey:", CFSTR("NumberOfTimesMCMNotificationWasDisplayed"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v42;
    if (v42)
    {
      *((_QWORD *)v11 + 57) = objc_msgSend(v42, "unsignedIntValue");
    }
    else
    {
      *((_QWORD *)v11 + 57) = 0;
      objc_msgSend(v11, "setNumber:forPreferenceKey:", &unk_24D4438E8, CFSTR("NumberOfTimesMCMNotificationWasDisplayed"));
    }
    objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", CFSTR("/charging/topOffCheckpoint"));
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)*((_QWORD *)v11 + 10);
    *((_QWORD *)v11 + 10) = v43;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("smartChargeManager init before trialManager"));
    v45 = -[PowerUITrialManager initWithDefaultsDomain:]([PowerUITrialManager alloc], "initWithDefaultsDomain:", *((_QWORD *)v11 + 7));
    v46 = (void *)*((_QWORD *)v11 + 49);
    *((_QWORD *)v11 + 49) = v45;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("smartChargeManager init before monitors"));
    +[PowerUIAlarmSignalMonitor monitorWithDelegate:trialManager:withContext:](PowerUIAlarmSignalMonitor, "monitorWithDelegate:trialManager:withContext:", v11, *((_QWORD *)v11 + 49), *((_QWORD *)v11 + 6));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v254[0] = v47;
    +[PowerUICalendarSignalMonitor monitorWithDelegate:trialManager:withContext:](PowerUICalendarSignalMonitor, "monitorWithDelegate:trialManager:withContext:", v11, *((_QWORD *)v11 + 49), *((_QWORD *)v11 + 6));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v254[1] = v48;
    +[PowerUILocationSignalMonitor monitorWithDelegate:trialManager:withContext:](PowerUILocationSignalMonitor, "monitorWithDelegate:trialManager:withContext:", v11, *((_QWORD *)v11 + 49), *((_QWORD *)v11 + 6));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v254[2] = v49;
    +[PowerUIWalletSignalMonitor monitorWithDelegate:](PowerUIWalletSignalMonitor, "monitorWithDelegate:", v11);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v254[3] = v50;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v254, 4);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)*((_QWORD *)v11 + 39);
    *((_QWORD *)v11 + 39) = v51;

    v11[16] = 0;
    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("smartChargeManager init before CEC manager"));
    +[PowerUICECManager manager](PowerUICECManager, "manager");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    if (v161)
    {
      v53 = (void *)objc_msgSend(*((id *)v11 + 39), "mutableCopy");
      objc_msgSend(v53, "addObject:", v161);
      v54 = (void *)*((_QWORD *)v11 + 39);
      *((_QWORD *)v11 + 39) = v53;

    }
    *((_QWORD *)v11 + 4) = -1;
    if ((objc_msgSend(v11, "isExternalConnected") & v19) == 1)
    {
      *((_DWORD *)v11 + 9) = 1;
      v55 = *((_QWORD *)v11 + 12);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v55, OS_LOG_TYPE_DEFAULT, "Device is still plugged in on daemon restart.", buf, 2u);
      }
    }
    *((_DWORD *)v11 + 10) = -1;
    v11[14] = 0;
    *((_QWORD *)v11 + 34) = -1;
    objc_msgSend(v11, "readNumberForPreferenceKey:", CFSTR("engagementsLastMonthBucket"));
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)*((_QWORD *)v11 + 27);
    *((_QWORD *)v11 + 27) = v56;

    if (!*((_QWORD *)v11 + 27))
    {
      *((_QWORD *)v11 + 27) = &unk_24D443900;

    }
    objc_msgSend(v11, "readNumberForPreferenceKey:", CFSTR("numberOfPluginEvents"));
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)*((_QWORD *)v11 + 28);
    *((_QWORD *)v11 + 28) = v58;

    if (!*((_QWORD *)v11 + 28))
    {
      *((_QWORD *)v11 + 28) = &unk_24D443900;

    }
    objc_msgSend(v11, "readNumberForPreferenceKey:", CFSTR("medianPluginLength"));
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)*((_QWORD *)v11 + 29);
    *((_QWORD *)v11 + 29) = v60;

    if (!*((_QWORD *)v11 + 29))
    {
      *((_QWORD *)v11 + 29) = &unk_24D443900;

    }
    objc_msgSend(v11, "readNumberForPreferenceKey:", CFSTR("previousDecisionMaker"));
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    if (v160)
      *((_QWORD *)v11 + 34) = objc_msgSend(v160, "integerValue");
    objc_msgSend(v11, "readDateForPreferenceKey:", CFSTR("previousDecisionMakerDate"));
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)*((_QWORD *)v11 + 36);
    *((_QWORD *)v11 + 36) = v62;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("smartChargeManager init before predictor"));
    v64 = -[PowerUIMLTwoStageModelPredictor initWithDefaultsDomain:withContextStore:withTrialManager:]([PowerUIMLPhonePredictor alloc], "initWithDefaultsDomain:withContextStore:withTrialManager:", *((_QWORD *)v11 + 7), *((_QWORD *)v11 + 6), *((_QWORD *)v11 + 49));
    v65 = (void *)*((_QWORD *)v11 + 37);
    *((_QWORD *)v11 + 37) = v64;

    v66 = -[PowerUIIntelligenceManager initWithDefaultsDomain:withContextStore:withTrialManager:]([PowerUIIntelligenceManager alloc], "initWithDefaultsDomain:withContextStore:withTrialManager:", *((_QWORD *)v11 + 7), *((_QWORD *)v11 + 6), *((_QWORD *)v11 + 49));
    v67 = (void *)*((_QWORD *)v11 + 38);
    *((_QWORD *)v11 + 38) = v66;

    if (*((int *)v11 + 9) >= 1)
    {
      +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v11 + 37), "setPluginDate:", v68);

    }
    objc_initWeak(&location, v11);
    v69 = (void *)*((_QWORD *)v11 + 49);
    v70 = MEMORY[0x24BDAC760];
    v246[0] = MEMORY[0x24BDAC760];
    v246[1] = 3221225472;
    v246[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke;
    v246[3] = &unk_24D3FC848;
    objc_copyWeak(&v247, &location);
    objc_msgSend(v69, "addUpdateHandler:", v246);
    if (!+[PowerUISmartChargeUtilities isUltraWatch](PowerUISmartChargeUtilities, "isUltraWatch"))
      kMaxDEoCBatteryDrain = 1;
    objc_msgSend(v11, "handleXPCActivityOnBoot");
    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("smartChargeManager init before loadDefaults"));
    objc_msgSend(v11, "loadDefaults");
    if ((v19 & 1) != 0 || v11[15])
    {
      objc_msgSend(v11, "loadCheckpoint");
      v71 = *((id *)v11 + 12);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *((_QWORD *)v11 + 14));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v251 = v72;
        _os_log_impl(&dword_215A71000, v71, OS_LOG_TYPE_DEFAULT, "Loading checkpoint value: %@", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v11, "setCheckpoint:withSelector:forceWrite:", 0, a2, 1);
      v151 = *((_QWORD *)v11 + 12);
      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v151, OS_LOG_TYPE_DEFAULT, "Device was restarted, reset checkpoint.", buf, 2u);
      }
    }
    v73 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v11, "readNumberForPreferenceKey:", CFSTR("disabledUntil"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "doubleValue");
    objc_msgSend(v73, "dateWithTimeIntervalSinceReferenceDate:");
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = (void *)*((_QWORD *)v11 + 16);
    *((_QWORD *)v11 + 16) = v75;

    objc_msgSend(v11, "setTemporarilyDisabled:until:", 1, *((_QWORD *)v11 + 16));
    v77 = *((id *)v11 + 12);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = (void *)*((_QWORD *)v11 + 16);
      objc_msgSend(v78, "timeIntervalSinceNow");
      *(_DWORD *)buf = 138412546;
      v251 = v78;
      v252 = 1024;
      v253 = v79 > 0.0;
      _os_log_impl(&dword_215A71000, v77, OS_LOG_TYPE_DEFAULT, "Temp disabled until date: %@ (temp disabled: %u)", buf, 0x12u);
    }

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("smartChargeManager init before mitigationManager"));
    +[PowerUIBatteryMitigationManager sharedManager](PowerUIBatteryMitigationManager, "sharedManager");
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)*((_QWORD *)v11 + 46);
    *((_QWORD *)v11 + 46) = v80;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("smartChargeManager init before BDC manager"));
    +[PowerUIBDCDataManager sharedInstance](PowerUIBDCDataManager, "sharedInstance");
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)*((_QWORD *)v11 + 47);
    *((_QWORD *)v11 + 47) = v82;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("smartChargeManager init after BDC manager"));
    if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
      kMaximumDurationUntilFullyCharged = 0x40E89C0000000000;
    if (*((_QWORD *)v11 + 60) == 1)
      objc_msgSend(v11, "engageManualChargeLimit");
    v84 = (void *)MEMORY[0x24BE1B1A0];
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForForegroundApp");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "predicateForKeyPath:withFormat:", v85, CFSTR("(SELF.%@.value.rawExternalConnected = %@) AND NOT (SELF.%@.value = %@) AND NOT (SELF.%@.value.fullyCharged = %@)"), v86, MEMORY[0x24BDBD1C8], v87, CFSTR("com.apple.camera"), v88, &unk_24D443918);
    v155 = (void *)objc_claimAutoreleasedReturnValue();

    v242[0] = v70;
    v242[1] = 3221225472;
    v242[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_408;
    v242[3] = &unk_24D3FC898;
    v89 = v11;
    v243 = v89;
    v244 = v166;
    v245 = v163;
    v90 = (void *)MEMORY[0x2199EC2D0](v242);
    v91 = (void *)MEMORY[0x24BE1B1A0];
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForPluginStatus");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "predicateForChangeAtKeyPath:", v92);
    v93 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.powerui.smartcharge"), v155, v90);
    v94 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B190], "localWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.powerui.smartcharge.unplug"), v93, v90);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v14, "registerCallback:", v94);
    objc_msgSend(*v14, "registerCallback:", v95);
    v96 = *((_QWORD *)v11 + 21);
    block[0] = v70;
    block[1] = 3221225472;
    block[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3;
    block[3] = &unk_24D3FB7B0;
    v97 = v89;
    v241 = v97;
    dispatch_async(v96, block);
    v98 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.powerui.smartChargeManager"));
    v99 = v97[48];
    v97[48] = (id)v98;

    objc_msgSend(v97[48], "setDelegate:", v97);
    objc_msgSend(v97[48], "resume");
    objc_msgSend(v97, "registerBDCXPC");
    v152 = (void *)v94;
    *(_DWORD *)buf = 0;
    v100 = *((_QWORD *)v11 + 21);
    handler[0] = v70;
    handler[1] = 3221225472;
    handler[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_4;
    handler[3] = &unk_24D3FB748;
    v101 = v97;
    v239 = v101;
    notify_register_dispatch("AppleLanguagePreferencesChangedNotification", (int *)buf, v100, handler);
    out_token = 0;
    v102 = *((_QWORD *)v11 + 21);
    v235[0] = v70;
    v235[1] = 3221225472;
    v235[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_425;
    v235[3] = &unk_24D3FB748;
    v103 = v101;
    v236 = v103;
    notify_register_dispatch("com.apple.powerui.checkpoint", &out_token, v102, v235);
    v234 = 0;
    v104 = (const char *)objc_msgSend(CFSTR("com.apple.smartcharging.defaultschanged"), "UTF8String");
    v105 = *((_QWORD *)v11 + 21);
    v232[0] = v70;
    v232[1] = 3221225472;
    v232[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_426;
    v232[3] = &unk_24D3FB748;
    v106 = v103;
    v233 = v106;
    notify_register_dispatch(v104, &v234, v105, v232);
    v231 = 0;
    v107 = *((_QWORD *)v11 + 21);
    v229[0] = v70;
    v229[1] = 3221225472;
    v229[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_428;
    v229[3] = &unk_24D3FB748;
    v108 = v106;
    v230 = v108;
    notify_register_dispatch("com.apple.powerui.requiredFullCharge", &v231, v107, v229);
    v228 = 0;
    v109 = *((_QWORD *)v11 + 21);
    v226[0] = v70;
    v226[1] = 3221225472;
    v226[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_430;
    v226[3] = &unk_24D3FB748;
    v110 = v108;
    v227 = v110;
    notify_register_dispatch("com.apple.powerui.ptoengaged", &v228, v109, v226);
    v225 = 0;
    v111 = *((_QWORD *)v11 + 21);
    v223[0] = v70;
    v223[1] = 3221225472;
    v223[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_432;
    v223[3] = &unk_24D3FB748;
    v112 = v110;
    v224 = v112;
    notify_register_dispatch("com.apple.powerui.ttr", &v225, v111, v223);
    v222 = 0;
    v113 = *((_QWORD *)v11 + 21);
    v219[0] = v70;
    v219[1] = 3221225472;
    v219[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_434;
    v219[3] = &unk_24D3FC8C0;
    v114 = v112;
    v220 = v114;
    v221 = a2;
    notify_register_dispatch("com.apple.system.powersources.gaugingmitigation", &v222, v113, v219);
    v218 = 0;
    v115 = *((_QWORD *)v11 + 21);
    v216[0] = v70;
    v216[1] = 3221225472;
    v216[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_436;
    v216[3] = &unk_24D3FB748;
    v116 = v114;
    v217 = v116;
    notify_register_dispatch("com.apple.powerui.computehistorical", &v218, v115, v216);
    v215 = 0;
    v117 = *((_QWORD *)v11 + 21);
    v213[0] = v70;
    v213[1] = 3221225472;
    v213[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_438;
    v213[3] = &unk_24D3FB748;
    v118 = v116;
    v214 = v118;
    notify_register_dispatch("com.apple.powerui.testMCMActiveNotificationRequest", &v215, v117, v213);
    v212 = 0;
    v119 = *((_QWORD *)v11 + 21);
    v210[0] = v70;
    v210[1] = 3221225472;
    v210[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_440;
    v210[3] = &unk_24D3FB748;
    v120 = v118;
    v211 = v120;
    notify_register_dispatch("com.apple.powerui.genericttr", &v212, v119, v210);
    v209 = 0;
    v121 = *((_QWORD *)v11 + 21);
    v207[0] = v70;
    v207[1] = 3221225472;
    v207[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_444;
    v207[3] = &unk_24D3FB748;
    v122 = v120;
    v208 = v122;
    notify_register_dispatch("com.apple.powerui.checklocation", &v209, v121, v207);
    v206 = 0;
    v123 = *((_QWORD *)v11 + 21);
    v204[0] = v70;
    v204[1] = 3221225472;
    v204[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_446;
    v204[3] = &unk_24D3FB748;
    v124 = v122;
    v205 = v124;
    notify_register_dispatch("com.apple.powerui.testMonthlyAnalytics", &v206, v123, v204);
    v203 = 0;
    v125 = *((_QWORD *)v11 + 21);
    v201[0] = v70;
    v201[1] = 3221225472;
    v201[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_448;
    v201[3] = &unk_24D3FB748;
    v126 = v124;
    v202 = v126;
    notify_register_dispatch("com.apple.powerui.testHardwareCheck", &v203, v125, v201);
    v200 = 0;
    v127 = *((_QWORD *)v11 + 21);
    v198[0] = v70;
    v198[1] = 3221225472;
    v198[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_452;
    v198[3] = &unk_24D3FB748;
    v128 = v126;
    v199 = v128;
    notify_register_dispatch("com.apple.powerui.evaluateDEoC", &v200, v127, v198);
    v197 = 0;
    v129 = *((_QWORD *)v11 + 21);
    v195[0] = v70;
    v195[1] = 3221225472;
    v195[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_454;
    v195[3] = &unk_24D3FB748;
    v130 = v128;
    v196 = v130;
    notify_register_dispatch("com.apple.powerui.printBiomeStreams", &v197, v129, v195);
    v194 = 0;
    v131 = *((_QWORD *)v11 + 21);
    v192[0] = v70;
    v192[1] = 3221225472;
    v192[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_456;
    v192[3] = &unk_24D3FB748;
    v132 = v130;
    v193 = v132;
    notify_register_dispatch("com.apple.powerui.pluginEvents", &v194, v131, v192);
    v191 = 0;
    v133 = *((_QWORD *)v11 + 21);
    v189[0] = v70;
    v189[1] = 3221225472;
    v189[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_458;
    v189[3] = &unk_24D3FB748;
    v134 = v132;
    v190 = v134;
    notify_register_dispatch("com.apple.powerui.gaugingStatistics", &v191, v133, v189);
    v188 = 0;
    v135 = *((_QWORD *)v11 + 21);
    v186[0] = v70;
    v186[1] = 3221225472;
    v186[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_460;
    v186[3] = &unk_24D3FB748;
    v136 = v134;
    v187 = v136;
    notify_register_dispatch("com.apple.powerui.evaluateChargeLimitRecommendation", &v188, v135, v186);
    v185 = 0;
    v137 = *((_QWORD *)v11 + 21);
    v183[0] = v70;
    v183[1] = 3221225472;
    v183[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_462;
    v183[3] = &unk_24D3FB748;
    v138 = v136;
    v184 = v138;
    notify_register_dispatch("com.apple.powerui.postChargeLimitRecommendation", &v185, v137, v183);
    v182 = 0;
    v139 = *((_QWORD *)v11 + 21);
    v180[0] = v70;
    v180[1] = 3221225472;
    v180[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_464;
    v180[3] = &unk_24D3FB748;
    v140 = v138;
    v181 = v140;
    notify_register_dispatch("com.apple.powerui.testTmpDisableChargeLimit", &v182, v139, v180);
    v179 = 0;
    v141 = *((_QWORD *)v11 + 21);
    v177[0] = v70;
    v177[1] = 3221225472;
    v177[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_4_466;
    v177[3] = &unk_24D3FB748;
    v142 = (int *)v140;
    v178 = v142;
    notify_register_dispatch("com.apple.powerui.testCheckForTempDisabled", &v179, v141, v177);
    v143 = (void *)v93;
    v144 = *((_QWORD *)v11 + 21);
    v175[0] = v70;
    v175[1] = 3221225472;
    v175[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_5;
    v175[3] = &unk_24D3FB748;
    v145 = v142;
    v176 = v145;
    notify_register_dispatch("com.apple.perfpowerservices.reportobcanalytics", v142 + 7, v144, v175);
    v146 = (void *)*MEMORY[0x24BDAC5A0];
    v173[0] = v70;
    v173[1] = 3221225472;
    v173[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_468;
    v173[3] = &unk_24D3FC490;
    v147 = v145;
    v174 = v147;
    xpc_activity_register("com.apple.poweruiagent.reportAnalyticsRepeating", v146, v173);
    v171[0] = v70;
    v171[1] = 3221225472;
    v171[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_471;
    v171[3] = &unk_24D3FC490;
    v148 = v147;
    v172 = v148;
    xpc_activity_register("com.apple.poweruiagent.reportMonthlyAnalytics", v146, v171);
    v169[0] = v70;
    v169[1] = 3221225472;
    v169[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_472;
    v169[3] = &unk_24D3FC490;
    v149 = v148;
    v170 = v149;
    xpc_activity_register("com.apple.poweruiagent.reportBatteryHealthMetrics", v146, v169);
    if (objc_msgSend(v149, "isMCLSupported"))
    {
      v167[0] = v70;
      v167[1] = 3221225472;
      v167[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_473;
      v167[3] = &unk_24D3FC490;
      v168 = v149;
      xpc_activity_register("com.apple.poweruiagent.evaluateRecommendedLimit", v146, v167);

    }
    else
    {
      xpc_activity_unregister("com.apple.poweruiagent.evaluateRecommendedLimit");
    }
    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("End of smartChargeManager init"));

    objc_destroyWeak(&v247);
    objc_destroyWeak(&location);

  }
  return (PowerUISmartChargeManager *)v11;
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);

  if (v1)
  {
    v2 = objc_loadWeakRetained(&to);
    objc_msgSend(v2, "modelTwoStagePredictor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadTrial");

  }
  objc_destroyWeak(&to);
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_408(id *a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2;
  block[3] = &unk_24D3FC870;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  dispatch_sync(v2, block);

  return 1;
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t result;

  v2 = (_QWORD *)a1[4];
  if (v2[8])
  {
    (*(void (**)(void))(a1[5] + 16))();
    v2 = (_QWORD *)a1[4];
  }
  result = objc_msgSend(v2, "handleCallback");
  if (*(_QWORD *)(a1[4] + 72))
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  return result;
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelNotificationRequestWithIdentifier:", CFSTR("com.apple.powerui.note.location"));

  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLowPowerModeEnabled");

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "forceDEoCReevaluation");
  }
  else if (objc_msgSend(v5, "isExternalConnected"))
  {
    objc_msgSend(*(id *)(a1 + 32), "evaluateIfDesktopDevice");
  }
  return objc_msgSend(*(id *)(a1 + 32), "handleCallback");
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_4(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_215A71000, v1, OS_LOG_TYPE_DEFAULT, "Language preference has changed, exit daemon!", v2, 2u);
  }

  exit(0);
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_425(uint64_t a1, int token)
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  return objc_msgSend(*(id *)(a1 + 32), "handleNewBatteryLevel:whileExternalConnected:fullyCharged:", state64 % 0x64, state64 > 0x64, 0);
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_426(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "loadDefaults");
  return objc_msgSend(*(id *)(a1 + 32), "handleCallback");
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_428(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "monitors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v13;
    *(_QWORD *)&v4 = 138412546;
    v11 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "log", v11);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "requiredFullChargeDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v11;
          v17 = v8;
          v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "%@ requires full charge by %@", buf, 0x16u);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v5);
  }

}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_430(uint64_t a1, int token)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  if (state64 == 42)
  {
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllNotifications");

  }
  else
  {
    v4 = *(_QWORD **)(a1 + 32);
    if (v4[17])
    {
      objc_msgSend(v4, "postOBCNotificationWithTopOff:", state64 != 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 21600.0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 136);
      *(_QWORD *)(v6 + 136) = v5;

      objc_msgSend(*(id *)(a1 + 32), "postOBCNotificationWithTopOff:", state64 != 0);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 136);
      *(_QWORD *)(v8 + 136) = 0;

    }
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_432(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllNotifications");

  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smartTopOffFailureNotificationAtBatteryLevel:withDate:", 42, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "postNotificationWithRequest:", v5);

}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_434(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "fetchCurrentMitigationState");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(*(os_log_t *)(v3 + 96), OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 368);
      v6 = v4;
      v10[0] = 67109120;
      v10[1] = objc_msgSend(v5, "mitigationsCurrentlyEnabled");
      _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Gauging mitigation state changed, new state: %d", (uint8_t *)v10, 8u);

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "mitigationsCurrentlyEnabled"))
      objc_msgSend(*(id *)(a1 + 32), "updateCurrentDEoCStatusAsGaugingMitigated");
    if (+[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48)))
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "mitigationsCurrentlyEnabled");
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      if (v7)
      {
        objc_msgSend(v8, "setCheckpoint:withSelector:", 6, v9);
        objc_msgSend(*(id *)(a1 + 32), "clearAllNotificationState");
      }
      else
      {
        objc_msgSend(v8, "setCheckpoint:withSelector:", 0, v9);
      }
      objc_msgSend(*(id *)(a1 + 32), "handleCallback:", 1);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(v3 + 96), OS_LOG_TYPE_DEBUG))
  {
    __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_434_cold_1();
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_436(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:](PowerUISmartChargeUtilities, "historicalFullChargeDurationStartingAt:withMinimumPluginDuration:", 80, 1200);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_msgSend(v2, "percentile:", 0.95);
    v6 = 138412546;
    v7 = v2;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Durations are %@, and 95th percentile is %.0lf", (uint8_t *)&v6, 0x16u);

  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_438(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mcmActiveNotificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "postNotificationWithRequest:", v2);

}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_440(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllNotifications");

  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "genericOBCFailureNotification:", CFSTR("TTR Debugging"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "postNotificationWithRequest:", v3);

}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_444(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 312);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v15;
    *(_QWORD *)&v4 = 138412290;
    v13 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "signalID", v13, (_QWORD)v14) == 4)
        {
          v9 = v8;
          v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = v10;
            objc_msgSend(v9, "requiredFullChargeDate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v13;
            v19 = v12;
            _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Required full charge date from location monitor: %@", buf, 0xCu);

          }
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_446(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportMonthlyData");
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_448(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isDEoCSupported"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[PowerUISmartChargeUtilities isDEoCDryRunSupported](PowerUISmartChargeUtilities, "isDEoCDryRunSupported"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", MGGetBoolAnswer());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "DEoC Supported: %@ - DEoC DryRun Supported: %@ - BOOL answer: %@", (uint8_t *)&v9, 0x20u);

  }
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_452(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceDEoCReevaluation");
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_454(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "printExistingEvents");
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 408);
    v4 = (void *)MEMORY[0x24BDBCE60];
    v5 = v2;
    objc_msgSend(v4, "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chargingStatisticsSince:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "chargingStatisticsSince: %@", (uint8_t *)&v14, 0xCu);

  }
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "Get charging statistics since last charge session", (uint8_t *)&v14, 2u);
  }
  +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 408);
    v12 = v10;
    objc_msgSend(v11, "chargingStatisticsSince:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v13;
    _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "chargingStatistics since last charge session: %@", (uint8_t *)&v14, 0xCu);

  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_456(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "Charge sessions WITHOUT filtering debounces:", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "minInputChargeDuration");
  +[PowerUISmartChargeUtilities pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:](PowerUISmartChargeUtilities, "pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v35;
    *(_QWORD *)&v7 = 138412546;
    v29 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v5);
        v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v13 = v11;
          objc_msgSend(v12, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "endDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v29;
          v40 = v14;
          v41 = 2112;
          v42 = v15;
          _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "  start: %@ - end %@", buf, 0x16u);

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v8);
  }

  v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Charge sessions WITH filtering debounces:", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date", v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "minInputChargeDuration");
  +[PowerUISmartChargeUtilities pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:](PowerUISmartChargeUtilities, "pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          v26 = v24;
          objc_msgSend(v25, "startDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "endDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v40 = v27;
          v41 = 2112;
          v42 = v28;
          _os_log_impl(&dword_215A71000, v26, OS_LOG_TYPE_DEFAULT, "  start: %@ - end %@", buf, 0x16u);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v21);
  }

}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_458(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 408);
    v4 = (void *)MEMORY[0x24BDBCE60];
    v5 = v2;
    objc_msgSend(v4, "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gaugingMitigationStatisticsSince:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "gaugingMitigationStatisticsSince: %@", (uint8_t *)&v8, 0xCu);

  }
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_460(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateChargeLimitRecommendationForced:", 1);
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_462(uint64_t a1)
{
  id v2;
  id v3;

  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "postChargeLimitRecommendationWithLimit:", objc_msgSend(*(id *)(a1 + 32), "getUISoCChargeLimit"));

}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_464(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tempDisableMCL");
}

uint64_t __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_4_466(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkWhetherMCLTempDisablementCanBeClearedOnPlugin:", 0);
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "powerLogStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Writing to PowerLog %@", (uint8_t *)&v8, 0xCu);

  }
  v6 = (void *)MEMORY[0x2199EC15C]();
  objc_msgSend(*(id *)(a1 + 32), "powerLogStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogRegisteredEvent();

  objc_autoreleasePoolPop(v6);
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_468(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_469;
    block[3] = &unk_24D3FB7B0;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);

  }
  else if (!state && os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_DEBUG))
  {
    __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_468_cold_1();
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_469(uint64_t a1)
{
  id v2;

  +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("AggDStatus"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "reportAggDKeys:", v2);

}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_471(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;

  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportMonthlyData");
  }
  else if (!state && os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_DEBUG))
  {
    __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_471_cold_1();
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_472(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;

  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportBatteryHealthMetrics");
  }
  else if (!state && os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_DEBUG))
  {
    __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_472_cold_1();
  }
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_473(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Running EvaluateRecommendedLimitActivity", v6, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "evaluateChargeLimitRecommendationForced:", 0);
  }
  else if (!state)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "EvaluateRecommendedLimitActivity checking in!", buf, 2u);
    }
  }
}

+ (id)manager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__PowerUISmartChargeManager_manager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (manager_onceToken != -1)
    dispatch_once(&manager_onceToken, block);
  return (id)manager_manager;
}

void __36__PowerUISmartChargeManager_manager__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithDefaultsDomain:contextStore:beforeHandlingBatteryChangeCallback:afterHandlingBatteryChangeCallback:", CFSTR("com.apple.smartcharging.topoffprotection"), v3, 0, 0);
  v2 = (void *)manager_manager;
  manager_manager = v1;

}

- (void)handleXPCActivityOnBoot
{
  void *v2;
  _QWORD handler[5];

  v2 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __52__PowerUISmartChargeManager_handleXPCActivityOnBoot__block_invoke;
  handler[3] = &unk_24D3FC490;
  handler[4] = self;
  xpc_activity_register("com.apple.poweruiagent.runOnBoot", v2, handler);
}

void __52__PowerUISmartChargeManager_handleXPCActivityOnBoot__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (xpc_activity_get_state(v3) && xpc_activity_get_state(v3) == 2)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Activity run on boot!", v5, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "deleteCompiledModels");
  }

}

- (void)loadCheckpoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *log;
  uint8_t v8[16];

  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("checkpoint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_checkpoint = objc_msgSend(v3, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_checkpoint);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v4, self->_checkpointKP);

  if (self->_checkpoint == 2)
  {
    -[PowerUISmartChargeManager startAllMonitoring](self, "startAllMonitoring");
    if (!self->_isDesktopDevice && self->_manualChargeLimitStatus != 1)
    {
      +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "getDeliveredNotifications");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v6, "count"))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Top-Off Detected and no notification delivered. Provide non-obvious notification", v8, 2u);
        }
        -[PowerUISmartChargeManager postOBCNotificationWithTopOff:](self, "postOBCNotificationWithTopOff:", 0);
      }

    }
  }
}

- (id)checkpointNameFromCheckpoint:(unint64_t)a3
{
  if (a3 - 1 > 0xA)
    return CFSTR("None");
  else
    return off_24D3FCBE0[a3 - 1];
}

- (void)setCheckpoint:(unint64_t)a3 withSelector:(SEL)a4
{
  -[PowerUISmartChargeManager setCheckpoint:withSelector:forceWrite:](self, "setCheckpoint:withSelector:forceWrite:", a3, a4, 0);
}

- (void)setCheckpoint:(unint64_t)a3 withSelector:(SEL)a4 forceWrite:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  NSObject *log;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  unint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)os_transaction_create();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = log;
    NSStringFromSelector(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v22 = a3;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Set Checkpoint: %llu from %@", buf, 0x16u);

  }
  v13 = (void *)MEMORY[0x2199EC15C]();
  if (self->_checkpoint != a3 || v5)
  {
    v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v22 = a3;
      _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEFAULT, "Saving Checkpoint: %llu to defaults", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v16, CFSTR("checkpoint"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v17, self->_checkpointKP);

    self->_checkpoint = a3;
    -[PowerUISmartChargeManager setPreviousPowerLogStatus:](self, "setPreviousPowerLogStatus:", 0);
    -[PowerUISmartChargeManager checkpointNameFromCheckpoint:](self, "checkpointNameFromCheckpoint:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.das.smartcharging.%@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ADClientSetValueForScalarKey();
    if (a3 >= 9)
      -[PowerUISmartChargeManager promptBDCToQueryCurrentState](self, "promptBDCToQueryCurrentState");

  }
  objc_autoreleasePoolPop(v13);

}

- (void)setNumber:(id)a3 forPreferenceKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)self->_defaultsDomain);
}

- (id)readNumberForPreferenceKey:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)self->_defaultsDomain);
}

- (void)setDate:(id)a3 forPreferenceKey:(id)a4
{
  void *v6;
  const void *v7;
  __CFString *key;

  key = (__CFString *)a4;
  if (a3)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v7 = (const void *)objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    v7 = 0;
  }
  CFPreferencesSetAppValue(key, v7, (CFStringRef)self->_defaultsDomain);

}

- (void)setString:(id)a3 forPreferenceKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)self->_defaultsDomain);
}

- (id)readDateForPreferenceKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)self->_defaultsDomain);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)readStringForPreferenceKey:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)self->_defaultsDomain);
}

- (id)eligibleEngagementIntervalFromTimelineEvents:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  double v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  void *v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  double empiricalTimeToFullChargeDurationMinutes;
  double v24;
  id v25;
  void *v26;
  PowerUISmartChargeManager *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v28 = self;
    v6 = 1.79769313e308;
    v7 = *(_QWORD *)v30;
    v8 = 1.79769313e308;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("event"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("EligibleForIdle"));

        if (v12)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("date"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValue");
          v15 = v14;

          if (v15 < v8 && v15 > 0.0)
            v8 = v15;
        }
        else
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("event"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Unplug"));

          if (v18)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("date"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "doubleValue");
            v21 = v20;

            if (v21 < v6 && v21 > 0.0)
              v6 = v21;
          }
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v5);
    if (v6 != 1.79769313e308 && v8 <= v6)
    {
      empiricalTimeToFullChargeDurationMinutes = v28->_empiricalTimeToFullChargeDurationMinutes;
      if (empiricalTimeToFullChargeDurationMinutes <= 2.22507386e-308)
        v24 = 5400.0;
      else
        v24 = empiricalTimeToFullChargeDurationMinutes * 60.0;
      v25 = objc_alloc(MEMORY[0x24BDD1508]);
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v25, "initWithStartDate:duration:", v26, fmax(v6 - v8 - v24, 0.0));

    }
  }

  return v5;
}

- (void)_submitEngagementEventWithBatteryLevel:(id)a3 eventType:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  PowerUIAnalyticsManager *analyticsManager;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = +[PowerUIAnalyticsManager obcModeOfOperationToBiomeModeOfOperation:](PowerUIAnalyticsManager, "obcModeOfOperationToBiomeModeOfOperation:", -[PowerUISmartChargeManager currentModeOfOperation](self, "currentModeOfOperation"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PowerUISmartChargeManager currentChargeLimit](self, "currentChargeLimit"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  analyticsManager = self->_analyticsManager;
  -[PowerUISmartChargeManager fullChargeDeadline](self, "fullChargeDeadline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUIAnalyticsManager submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:](analyticsManager, "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", v6, v10, v9, v7, v4);

}

- (void)pluginTimelineAddEvent:(id)a3 atDate:(id)a4 withBatteryLevel:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager _submitEngagementEventWithBatteryLevel:eventType:](self, "_submitEngagementEventWithBatteryLevel:eventType:", v10, +[PowerUIAnalyticsManager convertTimelineStringToOBCEvent:](PowerUIAnalyticsManager, "convertTimelineStringToOBCEvent:", v8));

  v11 = (void *)CFPreferencesCopyAppValue(CFSTR("timeline"), (CFStringRef)self->_defaultsDomain);
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[0] = v8;
  v18[0] = CFSTR("event");
  v18[1] = CFSTR("date");
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  v18[2] = CFSTR("batteryLevel");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v16);

  v17 = (void *)objc_msgSend(v12, "copy");
  CFPreferencesSetAppValue(CFSTR("timeline"), v17, (CFStringRef)self->_defaultsDomain);

}

- (void)clearPluginTimeline
{
  void *v3;
  double v4;
  void *value;

  value = (void *)CFPreferencesCopyAppValue(CFSTR("timeline"), (CFStringRef)self->_defaultsDomain);
  -[PowerUISmartChargeManager eligibleEngagementIntervalFromTimelineEvents:](self, "eligibleEngagementIntervalFromTimelineEvents:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  if (v4 >= 4500.0)
    CFPreferencesSetAppValue(CFSTR("timeline.archive"), value, (CFStringRef)self->_defaultsDomain);
  CFPreferencesSetAppValue(CFSTR("timeline"), 0, (CFStringRef)self->_defaultsDomain);

}

- (void)reportMonthlyData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  NSObject *log;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)os_transaction_create();
  if (self->_enabled || -[PowerUISmartChargeManager isMCLSupported](self, "isMCLSupported"))
  {
    -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("MonthlyDataReportedDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 && (objc_msgSend(v5, "timeIntervalSinceDate:", v4), v7 < 2592000.0))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Considered submitting monthly OBC analytics, but not enough time has passed since last submission: %@", buf, 0xCu);
      }
    }
    else
    {
      -[PowerUISmartChargeManager sendLegacyData](self, "sendLegacyData");
      v12 = v4;
      AnalyticsSendEventLazy();
      -[PowerUIAnalyticsManager gaugingMitigationStatisticsSince:](self->_analyticsManager, "gaugingMitigationStatisticsSince:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_manualChargeLimitStatus);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("CurrentMCLEnabled"));

      v11 = v9;
      AnalyticsSendEventLazy();

    }
  }

}

uint64_t __46__PowerUISmartChargeManager_reportMonthlyData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "chargingStatisticsSince:", *(_QWORD *)(a1 + 40));
}

id __46__PowerUISmartChargeManager_reportMonthlyData__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)sendLegacyData
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *log;
  void *v7;
  id v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_deocFeatureState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("currentDEoCState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_manualChargeLimitStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currentMCLState"));

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Reporting monthly metrics to CoreAnalytics %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", v7, CFSTR("MonthlyDataReportedDate"));

  v9 = v3;
  v8 = v3;
  AnalyticsSendEventLazy();

}

id __43__PowerUISmartChargeManager_sendLegacyData__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)sendHistoricalDEoCEngagementEventToCA:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __67__PowerUISmartChargeManager_sendHistoricalDEoCEngagementEventToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)reportBatteryHealthMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *log;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities batteryProperties](PowerUISmartChargeUtilities, "batteryProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CycleCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("CycleCount"));
  v21 = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 50 * (objc_msgSend(v5, "unsignedIntegerValue") / 0x32uLL));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:");
  objc_msgSend(v4, "objectForKey:", CFSTR("BatteryData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("ChemID"));
  v7 = objc_claimAutoreleasedReturnValue();

  v19 = (void *)v7;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("BatteryChemID"));
  objc_msgSend(v4, "objectForKey:", CFSTR("BatteryData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("ChemicalWeightedRa"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ChemicalWeightedRa"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 50 * (objc_msgSend(v9, "unsignedIntegerValue") / 0x32uLL));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ChemicalWeightedRaBuckets"));
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("com.apple.das.smartcharging.analytics.countChargeSessionsEngaged"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = (void *)v11;
  else
    v12 = &unk_24D4438E8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("LifetimeEngagements"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 25 * (objc_msgSend(v12, "unsignedIntegerValue") / 0x19uLL));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("LifetimeEngagementsBuckets"));
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("com.apple.das.smartcharging.analytics.countMinutesIdled"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = (void *)v14;
  else
    v15 = &unk_24D4438E8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("LifetimeIdleDurationMins"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 100 * (objc_msgSend(v15, "unsignedIntegerValue") / 0x1770uLL));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("LifetimeIdleDurationMinsBuckets"));
  v17 = v3;
  AnalyticsSendEventLazy();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v17;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Reported battery health metrics to CoreAnalytics %@", buf, 0xCu);
  }

}

id __55__PowerUISmartChargeManager_reportBatteryHealthMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (double)idleDurationWithEngagedCheckpoints:(id)a3 withTopOffStartCheckpoints:(id)a4 withDisabledCheckpoints:(id)a5 withTopOffStart:(id)a6 withIdleStart:(id)a7 withTemporarilyDisabledStart:(id)a8 withPluginEnd:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  NSObject *log;
  double v26;
  NSObject *v27;
  double v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  id v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = v21;
  if (v18 && v19)
  {
    objc_msgSend(v18, "timeIntervalSinceDate:", v19);
    v24 = v23;
    if (v23 < 0.0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        -[PowerUISmartChargeManager idleDurationWithEngagedCheckpoints:withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:].cold.1(log);
    }
  }
  else if (v19 && v20)
  {
    objc_msgSend(v20, "timeIntervalSinceDate:", v19);
    v24 = v26;
    if (v26 < 0.0)
    {
      v27 = self->_log;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[PowerUISmartChargeManager idleDurationWithEngagedCheckpoints:withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:].cold.2(v27);
    }
  }
  else
  {
    v24 = 0.0;
    if (v19)
    {
      if (v21)
      {
        objc_msgSend(v21, "timeIntervalSinceDate:", v19);
        v24 = v28;
        if (v28 < 0.0)
        {
          v29 = self->_log;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[PowerUISmartChargeManager idleDurationWithEngagedCheckpoints:withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:].cold.3(v29);
        }
      }
    }
  }
  v30 = +[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild");
  if (v24 < 0.0 && v30)
  {
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager genericOBCFailureNotification:](self, "genericOBCFailureNotification:", CFSTR("negative idle duration"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)objc_msgSend(v31, "postNotificationWithRequest:", v32);

  }
  return v24;
}

- (double)totalTopOffDurationWithTopOffStartCheckpoints:(id)a3 withFullyChargedCheckpoints:(id)a4 withTopOffStart:(id)a5 withFullyChargedDate:(id)a6 withPluginEnd:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v13 && (v16 = v14) != 0 || (v17 = 0.0, v13) && (v16 = v15) != 0)
  {
    objc_msgSend(v16, "timeIntervalSinceDate:", v13);
    v17 = v18;
  }

  return v17;
}

- (double)totalTemporarilyDisabledHours:(id)a3 withEngagements:(id)a4 withPluginEnd:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v31;
  id v33;
  void *v34;

  v7 = a3;
  v8 = a4;
  v33 = a5;
  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(v7, "count");
  v11 = v10 - 1;
  if (v10 - 1 >= 0)
  {
    v12 = v10;
    v13 = v9 - 1;
    v14 = 0.0;
    while (1)
    {
      v15 = v11;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("date"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v13 & 0x8000000000000000) == 0)
        break;
LABEL_14:

      v11 = v15 - 1;
      v12 = v15;
      if (v15 <= 0)
        goto LABEL_20;
    }
    v34 = v16;
    v21 = 0;
    v22 = 0.0;
    while (1)
    {
      v23 = v21;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("date"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;

      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "timeIntervalSinceDate:", v20);
      if (v28 <= 0.0)
        break;
      v29 = v28;

      v22 = v29;
      if (v13-- <= 0)
      {
        v13 = -1;
        v16 = v34;
        goto LABEL_13;
      }
    }
    if (v22 == 0.0)
    {
      if (v33)
      {
        v16 = v34;
        if (v12 == objc_msgSend(v7, "count"))
        {
          objc_msgSend(v33, "timeIntervalSinceDate:", v20);
          v14 = v14 + v31;
        }
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      v14 = v14 + v22;
    }
    v16 = v34;
    goto LABEL_12;
  }
  v14 = 0.0;
LABEL_20:

  return v14;
}

- (id)cloakingMetrics:(id)a3 withIdleCheckpoints:(id)a4 withIdleStart:(id)a5 withTopOffStart:(id)a6 withPluginEnd:(id)a7
{
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  unint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  id v44;
  id v45;
  id v46;
  int v47;

  v43 = a3;
  v11 = a4;
  v45 = a5;
  v46 = a6;
  v44 = a7;
  if (objc_msgSend(v11, "count"))
  {
    v12 = 0;
    LODWORD(v13) = 0;
    LODWORD(v14) = 0;
    v15 = 0.0;
    v16 = 0x24BDBC000uLL;
    v17 = 0.0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("event"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("date"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = v21;

      objc_msgSend(*(id *)(v16 + 3680), "dateWithTimeIntervalSinceReferenceDate:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v19, "isEqualToString:", CFSTR("EngagedFloor"));
      if (v12)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v12 - 1);
        v24 = v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("date"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        v28 = v27;

        objc_msgSend(*(id *)(v16 + 3680), "dateWithTimeIntervalSinceReferenceDate:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v19, "isEqualToString:", CFSTR("EngagedFloor"));
        objc_msgSend(v23, "timeIntervalSinceDate:", v29);
        if (v30)
          v32 = -0.0;
        else
          v32 = v31;
        v17 = v17 + v32;
        if (!v30)
          v31 = -0.0;
        v15 = v15 + v31;

        v11 = v24;
      }
      else if (v45)
      {
        objc_msgSend(v23, "timeIntervalSinceDate:");
        v15 = v15 + v33;
      }
      if (objc_msgSend(v11, "count") == ++v12)
      {
        v16 = 0x24BDBC000;
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("EngagedFloor")))
        {
          v34 = v46;
          if (v46 || (v34 = v44) != 0)
          {
            objc_msgSend(v34, "timeIntervalSinceDate:", v23);
            v17 = v17 + v35;
          }
        }
        else
        {
          v36 = v46;
          if (v46 || (v36 = v44) != 0)
          {
            objc_msgSend(v36, "timeIntervalSinceDate:", v23);
            v15 = v15 + v37;
          }
        }
      }
      else
      {
        v16 = 0x24BDBC000;
      }
      v14 = v14 + (v47 ^ 1);
      v13 = (v13 + v47);

    }
    while (objc_msgSend(v11, "count") > v12);
  }
  else
  {
    v14 = 0;
    v13 = 0;
    v17 = 0.0;
    v15 = 0.0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v38, CFSTR("DrainedToFloorCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v39, CFSTR("ToppedOffToCeilingCount"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v40, CFSTR("CloakingTopOffToCeilingDuration"));

  if (v15 == 0.0)
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("IdleDuration"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v41, CFSTR("DrainedDuration"));

  return v43;
}

- (id)constructAnalyticsStatusFromEvents:(id)a3
{
  id v4;
  uint64_t v5;
  OS_os_log *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v28;
  void *v30;
  double v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  const __CFString *v89;
  double v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  _BOOL8 v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  void *v129;
  void *v130;
  unint64_t v131;
  void *v132;
  unint64_t v133;
  void *v134;
  unint64_t v135;
  NSArray *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t i;
  void *v141;
  void *v142;
  void *v143;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  _BOOL4 isDesktopDevice;
  _BOOL4 v150;
  unint64_t v151;
  PowerUISmartChargeManager *v152;
  id v153;
  id v154;
  id v155;
  uint64_t v156;
  void *v157;
  id v158;
  uint64_t v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _BYTE v175[128];
  uint8_t v176[128];
  uint8_t buf[4];
  id v178;
  uint64_t v179;

  v179 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v150 = self->_enabled && !self->_temporarilyDisabled;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  isDesktopDevice = self->_isDesktopDevice;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = self->_log;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v178 = v4;
    _os_log_impl(&dword_215A71000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Events are %@", buf, 0xCu);
  }
  v161 = (void *)v5;
  v152 = self;

  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v171, v176, 16);
  v164 = v7;
  if (v8)
  {
    v9 = v8;
    v153 = 0;
    v154 = 0;
    v155 = 0;
    v156 = 0;
    v151 = 0;
    v158 = 0;
    v159 = 0;
    v160 = 0;
    v162 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v172;
    v12 = CFSTR("event");
    v13 = CFSTR("Plugin");
    v165 = *(_QWORD *)v172;
    while (1)
    {
      v14 = 0;
      v166 = v9;
      do
      {
        if (*(_QWORD *)v172 != v11)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v14);
        objc_msgSend(v15, "objectForKeyedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v13);
        if ((v17 & v10 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_35;
        }
        v18 = v13;
        v19 = v7;
        v20 = v12;
        v10 |= v17;
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("date"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22;

        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("batteryLevel"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "unsignedIntegerValue");

        if (v23 <= 0.0 || v25 == 0)
        {
          v12 = v20;
          v11 = v165;
          v9 = v166;
          v7 = v19;
          v13 = v18;
          goto LABEL_35;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@BatteryLevel"), v16);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;
        if (objc_msgSend(v16, "isEqualToString:", v18))
        {
          v30 = v28;
          if (!v162 || (objc_msgSend(v162, "timeIntervalSinceDate:", v28), v31 < 0.0))
          {
            v32 = v28;

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "setObject:forKeyedSubscript:", v33, v27);

            v162 = v32;
            v30 = v28;
          }
          v13 = v18;
          goto LABEL_34;
        }
        if (!objc_msgSend(v16, "isEqualToString:", CFSTR("EligibleForIdle")) || v160)
        {
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("Engaged")))
          {
            if (v158)
              goto LABEL_33;
            v158 = v28;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "setObject:forKeyedSubscript:", v35, v27);

            v30 = v28;
            v156 = v25;
          }
          else
          {
            if ((objc_msgSend(v16, "isEqualToString:", CFSTR("EngagedFloor")) & 1) != 0
              || objc_msgSend(v16, "isEqualToString:", CFSTR("EngagedCeiling")))
            {
              objc_msgSend(v157, "addObject:", v15);
              goto LABEL_33;
            }
            if (objc_msgSend(v16, "isEqualToString:", CFSTR("TopOff")))
            {
              v30 = v28;
              if (v154)
                goto LABEL_34;
              v154 = v28;
LABEL_43:
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v161, "setObject:forKeyedSubscript:", v36, v27);

LABEL_33:
              v30 = v28;
              goto LABEL_34;
            }
            v30 = v28;
            if (!objc_msgSend(v16, "isEqualToString:", CFSTR("FullyCharged")))
            {
              if (objc_msgSend(v16, "isEqualToString:", CFSTR("Unplug")) && !v153)
              {
                v153 = v28;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v161, "setObject:forKeyedSubscript:", v37, v27);

                v30 = v28;
                v151 = v25;
              }
              goto LABEL_34;
            }
            if (!v155)
            {
              v155 = v28;
              goto LABEL_43;
            }
          }
        }
        else
        {
          v160 = v28;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "setObject:forKeyedSubscript:", v34, v27);

          v30 = v28;
          v159 = v25;
        }
LABEL_34:

        v12 = v20;
        v7 = v164;
        v11 = v165;
        v9 = v166;
LABEL_35:

        ++v14;
      }
      while (v9 != v14);
      v38 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v171, v176, 16);
      v9 = v38;
      if (!v38)
        goto LABEL_50;
    }
  }
  v153 = 0;
  v154 = 0;
  v155 = 0;
  v156 = 0;
  v151 = 0;
  v158 = 0;
  v159 = 0;
  v160 = 0;
  v162 = 0;
LABEL_50:

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", isDesktopDevice);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "setObject:forKeyedSubscript:", v39, CFSTR("ChargeLimited"));

  if (v152->_manualChargeLimitStatus)
    v40 = MEMORY[0x24BDBD1C8];
  else
    v40 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v161, "setObject:forKeyedSubscript:", v40, CFSTR("ManualChargeLimit"));
  v42 = v162;
  if (!v162)
  {
    +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v153 && v42)
  {
    v43 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v42, "timeIntervalSince1970");
    objc_msgSend(v43, "numberWithDouble:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setObject:forKeyedSubscript:", v44, CFSTR("AnalyticsPluginDate"));

    v45 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v153, "timeIntervalSinceDate:", v42);
    objc_msgSend(v45, "numberWithDouble:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setObject:forKeyedSubscript:", v46, CFSTR("PluginDuration"));

  }
  if (v160)
    v47 = v150;
  else
    v47 = 0;
  v48 = 0x24BDD1000uLL;
  v49 = v151;
  if (v153 && v47)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v159);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setObject:forKeyedSubscript:", v50, CFSTR("EligibleForIdleBatteryLevelScore"));

    -[PowerUISmartChargeManager readNumberForPreferenceKey:](v152, "readNumberForPreferenceKey:", CFSTR("recentlyInterrupted"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "BOOLValue");

    if (v52)
    {
      objc_msgSend(v161, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("recentlyInterrupted"));
      -[PowerUISmartChargeManager setNumber:forPreferenceKey:](v152, "setNumber:forPreferenceKey:", 0, CFSTR("recentlyInterrupted"));
    }
    objc_msgSend(v161, "objectForKeyedSubscript:", CFSTR("PluginDuration"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "unsignedIntegerValue");

    if (!v54)
    {
      objc_msgSend(v161, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("BadSession"));
LABEL_77:
      v48 = 0x24BDD1000;
      goto LABEL_79;
    }
    -[PowerUISmartChargeManager durationToFullChargeFromBatteryLevel:](v152, "durationToFullChargeFromBatteryLevel:", v159);
    v56 = v55;
    objc_msgSend(v153, "timeIntervalSinceDate:", v160);
    v58 = v57;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setObject:forKeyedSubscript:", v59, CFSTR("TotalEligibleDuration"));

    v60 = v58 - v56;
    v61 = 0.0;
    if (v60 >= 0.0)
      v61 = v60;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setObject:forKeyedSubscript:", v62, CFSTR("EstimatedUsableEligibleDuration"));

    if (v155 && v154)
    {
      v63 = v155;
LABEL_75:
      objc_msgSend(v63, "timeIntervalSinceDate:", v154);
      v65 = v64;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "setObject:forKeyedSubscript:", v66, CFSTR("TopOffDuration"));

      v48 = 0x24BDD1000uLL;
      v41 = v58 - v65;
      if (v58 - v65 <= 0.0)
        goto LABEL_79;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v41);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "setObject:forKeyedSubscript:", v67, CFSTR("ActualUsableEligibleDuration"));

      goto LABEL_77;
    }
    if (v154 && v151 == 100)
    {
      v63 = v153;
      goto LABEL_75;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v60);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setObject:forKeyedSubscript:", v68, CFSTR("ActualUsableEligibleDuration"));

    v48 = 0x24BDD1000uLL;
  }
LABEL_79:
  -[PowerUISmartChargeManager idleDurationWithEngagedCheckpoints:withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:](v152, "idleDurationWithEngagedCheckpoints:withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:", 0, 0, 0, v154, v158, 0, v41, v153);
  v70 = v69;
  objc_msgSend(*(id *)(v48 + 1760), "numberWithDouble:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "setObject:forKeyedSubscript:", v71, CFSTR("IdleDuration"));

  if (v70 < 0.0)
  {
    v72 = v152->_log;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
      -[PowerUISmartChargeManager constructAnalyticsStatusFromEvents:].cold.1((uint64_t)v7, v72);

    objc_msgSend(v161, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("BadSession"));
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v70 > 0.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "setObject:forKeyedSubscript:", v73, CFSTR("Engaged"));

  objc_msgSend(v161, "objectForKeyedSubscript:", CFSTR("ActualUsableEligibleDuration"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "doubleValue");
  v76 = v75 - v70;

  if (v76 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setObject:forKeyedSubscript:", v77, CFSTR("EstimatedMissedIdleDuration"));

  }
  -[PowerUISmartChargeManager cloakingMetrics:withIdleCheckpoints:withIdleStart:withTopOffStart:withPluginEnd:](v152, "cloakingMetrics:withIdleCheckpoints:withIdleStart:withTopOffStart:withPluginEnd:", v161, v157, v158, v154, v153);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v153 && v155)
  {
    v79 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v153, "timeIntervalSinceDate:", v155);
    objc_msgSend(v79, "numberWithDouble:");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v80, CFSTR("FullChargeDuration"));

  }
  if (v153 && v151)
  {
    v49 = v151 & 0xFFFFFFFFFFFFFFFELL;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v151 & 0xFFFFFFFFFFFFFFFELL);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v81, CFSTR("PluginEndBatteryLevelScore"));

  }
  if (v153 && v158)
  {
    objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("PluginDuration"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "unsignedIntegerValue");

    if (!v83)
      objc_msgSend(v78, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("BadSession"));
    v84 = MEMORY[0x24BDBD1C0];
    objc_msgSend(v78, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("UnderChargedAvoidable"));
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v84, CFSTR("UnderChargedUnavoidable"));
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v84, CFSTR("UnderChargedTLC"));
    if (v49 <= 0x63)
    {
      -[PowerUISmartChargeManager durationToFullChargeFromBatteryLevel:](v152, "durationToFullChargeFromBatteryLevel:", v156);
      v86 = v85;
      objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("TotalEligibleDuration"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (double)(unint64_t)objc_msgSend(v87, "unsignedIntegerValue");

      if (v86 <= v88)
      {
        if (v152->_encounteredTLCDuringTopOff)
          v89 = CFSTR("UnderChargedTLC");
        else
          v89 = CFSTR("UnderChargedAvoidable");
      }
      else
      {
        v89 = CFSTR("UnderChargedUnavoidable");
      }
      objc_msgSend(v78, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v89);
    }
  }
  else if (!v158)
  {
    if (!v154)
      goto LABEL_101;
    goto LABEL_100;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v156 & 0xFFFFFFFFFFFFFFFELL);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v145, CFSTR("IdleBatteryLevelScore"));

  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("IdleDuration"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = -[PowerUISmartChargeManager projectedBatteryLevelForDuration:withInitialBatteryLevel:](v152, "projectedBatteryLevelForDuration:withInitialBatteryLevel:", objc_msgSend(v146, "unsignedIntegerValue"), v156 & 0xFFFFFFFFFFFFFFFELL);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v147 & 0xFFFFFFFFFFFFFFFELL);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v148, CFSTR("ProjectedPluginEndBatteryLevelScore"));

  if (v154)
LABEL_100:
    objc_msgSend(v78, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("TopOffInitiated"));
LABEL_101:
  if (v155)
    objc_msgSend(v78, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("FullCharged"));
  if (v153 && v154 && v158)
  {
    -[PowerUISmartChargeManager totalTopOffDurationWithTopOffStartCheckpoints:withFullyChargedCheckpoints:withTopOffStart:withFullyChargedDate:withPluginEnd:](v152, "totalTopOffDurationWithTopOffStartCheckpoints:withFullyChargedCheckpoints:withTopOffStart:withFullyChargedDate:withPluginEnd:", 0, 0, v154, v155, v153);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v70 / (v70 + v90) * 100.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v91, CFSTR("ImpactRatio"));

  }
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v152->_engagementsLastMonthBucket, CFSTR("EngagementsLastMonthBucket"));
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v152->_lastReportedNumberOfPluginEvents, CFSTR("NumberOfPluginEvents"));
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v152->_medianPluginLength, CFSTR("MedianPluginLength"));
  -[NSDate timeIntervalSinceDate:](v152->_previousDecisionMakerDate, "timeIntervalSinceDate:", v42);
  if (v92 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v152->_previousDecisionMakerID);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setObject:forKeyedSubscript:", v93, CFSTR("DecisionMaker"));

    -[PowerUIBatteryMitigationManager getGaugingMitigationDict](v152->_batteryMitigationManager, "getGaugingMitigationDict");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("lastDOD0Update"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (v95)
    {
      objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("lastDOD0Update"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "timeIntervalSinceDate:", v96);
      objc_msgSend(v97, "numberWithDouble:", v99 / 86400.0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setObject:forKeyedSubscript:", v100, CFSTR("DaysSinceOCVUpdate"));

    }
    else
    {
      objc_msgSend(v78, "setObject:forKeyedSubscript:", &unk_24D4438E8, CFSTR("DaysSinceOCVUpdate"));
    }
    objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("lastQMaxUpdate"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (v101)
    {
      objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("lastQMaxUpdate"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "timeIntervalSinceDate:", v102);
      objc_msgSend(v103, "numberWithDouble:", v105 / 86400.0);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setObject:forKeyedSubscript:", v106, CFSTR("DaysSinceQmaxUpdate"));

    }
    else
    {
      objc_msgSend(v78, "setObject:forKeyedSubscript:", &unk_24D4438E8, CFSTR("DaysSinceQmaxUpdate"));
    }

  }
  v163 = v42;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PowerUIMLTwoStageModelPredictor engagementModelVersion](v152->_modelTwoStagePredictor, "engagementModelVersion"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v107, CFSTR("EngageModelVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PowerUIMLTwoStageModelPredictor durationModelVersion](v152->_modelTwoStagePredictor, "durationModelVersion"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v108, CFSTR("DurationModelVersion"));

  -[PowerUIMLTwoStageModelPredictor engagementModelBoltID](v152->_modelTwoStagePredictor, "engagementModelBoltID");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v109, CFSTR("EngageModelBoltID"));

  -[PowerUIMLTwoStageModelPredictor durationModelBoltID](v152->_modelTwoStagePredictor, "durationModelBoltID");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v110, CFSTR("DurationModelBoltID"));

  -[PowerUITrialManager treatmentID](v152->_trialManager, "treatmentID");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "description");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v112, CFSTR("TrackingID"));

  -[PowerUITrialManager experimentID](v152->_trialManager, "experimentID");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "description");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v114, CFSTR("ExperimentID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v152->_enabled);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v115, CFSTR("Enabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v152->_temporarilyDisabled);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v116, CFSTR("TempDisabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v152->_encounteredTLCDuringTopOff);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v117, CFSTR("EncounteredTLC"));

  v118 = (void *)MEMORY[0x24BDD16E0];
  -[PowerUIMLTwoStageModelPredictor lastEngagementResult](v152->_modelTwoStagePredictor, "lastEngagementResult");
  objc_msgSend(v118, "numberWithDouble:");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v119, CFSTR("EngagementModelResult"));

  -[PowerUIMLTwoStageModelPredictor threshold](v152->_modelTwoStagePredictor, "threshold");
  v121 = v120;
  -[PowerUIMLTwoStageModelPredictor lastEngagementResult](v152->_modelTwoStagePredictor, "lastEngagementResult");
  v123 = v121 - v122;
  v124 = v123 <= 0.05 && v123 > 0.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v125, CFSTR("EngagementModelResultCloseBelowThreshold"));

  v126 = (void *)MEMORY[0x24BDD16E0];
  -[PowerUIMLTwoStageModelPredictor lastDurationResult](v152->_modelTwoStagePredictor, "lastDurationResult");
  objc_msgSend(v126, "numberWithDouble:");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v127, CFSTR("DurationModelResult"));

  v128 = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v129, CFSTR("AnalyticsVersion"));

  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("EstimatedUsableEligibleDuration"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "unsignedIntegerValue");

  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("IdleDuration"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = objc_msgSend(v132, "unsignedIntegerValue");

  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("EligibleForIdleBatteryLevelScore"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = objc_msgSend(v134, "unsignedIntegerValue");

  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v136 = v152->_monitors;
  v137 = -[NSArray countByEnumeratingWithState:objects:count:](v136, "countByEnumeratingWithState:objects:count:", &v167, v175, 16);
  if (v137)
  {
    v138 = v137;
    v139 = *(_QWORD *)v168;
    do
    {
      for (i = 0; i != v138; ++i)
      {
        if (*(_QWORD *)v168 != v139)
          objc_enumerationMutation(v136);
        v141 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * i);
        if (objc_msgSend(v141, "signalID") == 4)
          v128 = objc_msgSend(v141, "notAuthorizedForLocation") ^ 1;
      }
      v138 = -[NSArray countByEnumeratingWithState:objects:count:](v136, "countByEnumeratingWithState:objects:count:", &v167, v175, 16);
    }
    while (v138);
  }

  if (v152->_enabled)
  {
    if ((-[PowerUISmartChargeManager isDeviceWithLegitimateUsage](v152, "isDeviceWithLegitimateUsage") & v128) == 1
      && !v152->_temporarilyDisabled
      && v133 <= 0x3B
      && v131 >> 2 >= 0x717
      && v135 <= 0x5E)
    {
      objc_msgSend(v78, "setObject:forKeyedSubscript:", &unk_24D443918, CFSTR("ShouldHaveEngaged"));
    }
    if (v152->_enabled
      && (-[PowerUISmartChargeManager isDeviceWithLegitimateUsage](v152, "isDeviceWithLegitimateUsage") & v128) == 1
      && !v152->_temporarilyDisabled
      && v131 >> 2 >= 0x717
      && v135 <= 0x5E)
    {
      objc_msgSend(v78, "setObject:forKeyedSubscript:", &unk_24D443918, CFSTR("AbsoluteShouldHaveEngaged"));
    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -[PowerUITrialManager longFactorForName:](v152->_trialManager, "longFactorForName:", CFSTR("modelExecutionPath")));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v142, CFSTR("ModelExecutionPath"));

  v143 = (void *)objc_msgSend(v78, "copy");
  return v143;
}

- (id)constructAnalyticsStatus
{
  void *v3;
  void *v4;

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("timeline"), (CFStringRef)self->_defaultsDomain);
  -[PowerUISmartChargeManager constructAnalyticsStatusFromEvents:](self, "constructAnalyticsStatusFromEvents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)recordDEoCAnalytics:(id)a3
{
  id v4;
  void *v5;
  NSObject *log;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint8_t buf[4];
  _BYTE v58[10];
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("PreviousDEoCStatus"), self->_defaultsDomain);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v58 = v5;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Got previous DEoC status: %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dryRun"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("dryRun"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("limitCharge"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DEoCStatus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mostRecentDrain"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    -[PowerUISmartChargeManager log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v58 = v15;
      *(_WORD *)&v58[4] = 1024;
      *(_DWORD *)&v58[6] = v11;
      v59 = 2048;
      v60 = v13;
      _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "DEoC Analytics - most recent drain: %d, last charge DEoC: %d, last status: %lu", buf, 0x18u);
    }

    if ((v13 - 1) >= 5 && (v13 - 200) > 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v41, CFSTR("DEoCStatus"));

      v19 = &unk_24D443948;
    }
    else
    {
      if (v15 < 0x3E9)
      {
        if (kMaxDEoCBatteryDrain)
          v20 = 60;
        else
          v20 = 70;
        v21 = v15 >= v20;
        v22 = 3;
        if (v21)
          v22 = 1;
        v23 = 4;
        if (!v21)
          v23 = 2;
        if (v11)
          v24 = v23;
        else
          v24 = v22;
        -[PowerUISmartChargeManager log](self, "log");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v58 = v24;
          _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_DEFAULT, "Last DEoC decision was: %lu", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("DEoCStatus"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("DEoCDecision"));

        v28 = v15 - (unsigned __int16)v15 % 5u;
        if (v28 >= 100)
          v29 = 100;
        else
          v29 = v28;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("lastDrainBucket"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("idleDurationMinutes"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("idleDurationMinutes"));

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("totalEligibleDurationMinutes"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("totalEligibleDurationMinutes"));
          v33 = (void *)MEMORY[0x24BDD16E0];
          v34 = (int)objc_msgSend(v32, "intValue") / 60;
          if (v34 >= 19)
            v35 = 19;
          else
            v35 = v34;
          objc_msgSend(v33, "numberWithInt:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v36, CFSTR("totalEligibleDurationHoursBucket"));

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modelThreshold"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v38 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modelThreshold"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR("threshold:%@"), v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v40, CFSTR("trialExperimentID"));

        }
        goto LABEL_40;
      }
      -[PowerUISmartChargeManager log](self, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[PowerUISmartChargeManager recordDEoCAnalytics:].cold.1(v15, v17);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("DEoCStatus"));

      v19 = &unk_24D443930;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("DEoCDecision"));
LABEL_40:
    v42 = self->_log;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v58 = v8;
      _os_log_impl(&dword_215A71000, v42, OS_LOG_TYPE_DEFAULT, "Reporting DEoC plugout metrics to CoreAnalytics %@", buf, 0xCu);
    }
    +[PowerUISmartChargeUtilities setDict:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDict:forPreferenceKey:inDomain:", 0, CFSTR("PreviousDEoCStatus"), self->_defaultsDomain);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager sendDEoCAnalyticsToCA:](self, "sendDEoCAnalyticsToCA:", v43);

    goto LABEL_43;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "No previous DEoC charge found, no analytics to send.", buf, 2u);
  }
LABEL_43:
  -[NSLock lock](self->_deocCurrentStatusLock, "lock");
  +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_deocCurrentStatusLock, "unlock");
  if (v44)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (self->_isDesktopDevice)
    {
      v47 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IdleDuration"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "numberWithInt:", ((int)objc_msgSend(v48, "intValue") / 60));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setObject:forKeyedSubscript:", v49, CFSTR("idleDurationMinutes"));

    }
    else
    {
      objc_msgSend(v45, "setObject:forKeyedSubscript:", &unk_24D4438E8, CFSTR("idleDurationMinutes"));
    }
    v50 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalEligibleDuration"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "numberWithInt:", ((int)objc_msgSend(v51, "intValue") / 60));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v52, CFSTR("totalEligibleDurationMinutes"));

    if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild")
      || +[PowerUISmartChargeUtilities isUltraWatch](PowerUISmartChargeUtilities, "isUltraWatch"))
    {
      +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("NoLoIButRegularCharges"), CFSTR("com.apple.smartcharging.topoffprotection"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (v53)
      {
        if (objc_msgSend(v53, "intValue") == 1)
        {
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("DEoCStatus"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "unsignedIntValue");

          if ((v56 - 2) <= 3)
            objc_msgSend(v46, "setObject:forKeyedSubscript:", qword_24D3FCC38[v56 - 2], CFSTR("DEoCStatus"));
        }
      }

    }
    +[PowerUISmartChargeUtilities setDict:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDict:forPreferenceKey:inDomain:", v46, CFSTR("PreviousDEoCStatus"), self->_defaultsDomain);

  }
}

- (void)sendDEoCAnalyticsToCA:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __51__PowerUISmartChargeManager_sendDEoCAnalyticsToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)defaultDateToDisableUntilGivenDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *log;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (defaultDateToDisableUntilGivenDate__onceToken_0 != -1)
    dispatch_once(&defaultDateToDisableUntilGivenDate__onceToken_0, &__block_literal_global_13);
  objc_msgSend((id)defaultDateToDisableUntilGivenDate__calendar_0, "components:fromDate:", 60, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hour") >= 6)
    objc_msgSend(v5, "setDay:", objc_msgSend(v5, "day") + 1);
  objc_msgSend(v5, "setHour:", 6);
  objc_msgSend((id)defaultDateToDisableUntilGivenDate__calendar_0, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Feature disabled until: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

void __64__PowerUISmartChargeManager_defaultDateToDisableUntilGivenDate___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultDateToDisableUntilGivenDate__calendar_0;
  defaultDateToDisableUntilGivenDate__calendar_0 = v0;

}

- (void)setTemporarilyDisabled:(BOOL)a3 until:(id)a4
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  NSObject *queue;
  NSDate *disabledUntilDate;
  uint64_t v19;
  unint64_t checkpoint;
  void *v21;
  _QWORD block[5];

  v5 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "timeIntervalSinceNow");
    v11 = v10;
    if (v10 >= 0.0 && v5)
    {
LABEL_4:
      if (!self->_temporarilyDisabled)
      {
        v12 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v9, "timeIntervalSinceReferenceDate");
        objc_msgSend(v12, "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v13, CFSTR("disabledUntil"));

        objc_storeStrong((id *)&self->_disabledUntilDate, a4);
        self->_temporarilyDisabled = 1;
        -[PowerUISmartChargeManager setCurrentState:](self, "setCurrentState:", 3);
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager pluginTimelineAddEvent:atDate:withBatteryLevel:](self, "pluginTimelineAddEvent:atDate:withBatteryLevel:", CFSTR("TemporarilyDisabled"), v14, +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context));

        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", 11, 0, v15);

        -[PowerUISmartChargeManager setCheckpoint:withSelector:](self, "setCheckpoint:withSelector:", 11, a2);
        v16 = dispatch_walltime(0, (uint64_t)(v11 * 1000000000.0));
        queue = self->_queue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __58__PowerUISmartChargeManager_setTemporarilyDisabled_until___block_invoke;
        block[3] = &unk_24D3FB7B0;
        block[4] = self;
        dispatch_after(v16, queue, block);
        -[PowerUISmartChargeManager forceDEoCReevaluation](self, "forceDEoCReevaluation");
      }
      goto LABEL_16;
    }
  }
  else
  {
    v11 = 0.0;
    if (v5)
      goto LABEL_4;
  }
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", 0, CFSTR("disabledUntil"));
  disabledUntilDate = self->_disabledUntilDate;
  self->_disabledUntilDate = 0;

  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", self->_context)&& self->_temporarilyDisabled)
  {
    v19 = 6;
LABEL_12:
    -[PowerUISmartChargeManager setCheckpoint:withSelector:](self, "setCheckpoint:withSelector:", v19, a2);
    goto LABEL_13;
  }
  if ((self->_checkpoint & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    v19 = 0;
    goto LABEL_12;
  }
LABEL_13:
  self->_temporarilyDisabled = 0;
  if (self->_currentState == 3)
  {
    -[PowerUISmartChargeManager setCurrentState:](self, "setCurrentState:", 1);
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.powerui.smartchargestatuschanged"), "UTF8String"));
  }
  checkpoint = self->_checkpoint;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", checkpoint, 0, v21);

LABEL_16:
}

uint64_t __58__PowerUISmartChargeManager_setTemporarilyDisabled_until___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTemporarilyDisabled:until:", 0, 0);
}

- (void)loadDefaults
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSDate *v12;
  NSDate *potentialUnplugDate;
  void *v14;
  void *v15;
  double v16;
  NSDate *v17;
  NSDate *mclDisabledUntilDate;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  NSDate *v35;
  NSDate *lastDesktopModeChangeDate;
  NSNumber *v37;
  NSNumber *lastNonEngagementSignalID;
  void *v39;
  NSObject *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSDate *v45;
  NSDate *fullChargeDeadline;
  void *v47;
  double v48;
  double empiricalTimeToFullChargeDurationMinutes;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  _BOOL4 enabled;
  void *v65;
  unint64_t predictorType;
  void *v67;
  NSDictionary *signalDeadline;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  unint64_t currentState;
  _BOOL4 signalsIgnored;
  _BOOL4 isDesktopDevice;
  unint64_t manualChargeLimitStatus;
  NSObject *log;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint8_t buf[4];
  _BYTE v88[14];
  __int16 v89;
  _BOOL4 v90;
  __int16 v91;
  _BOOL4 v92;
  __int16 v93;
  unint64_t v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  NSDictionary *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  const __CFString *v107;
  _QWORD v108[3];

  v108[1] = *MEMORY[0x24BDAC8D0];
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PowerUISmartChargeUtilities isiPad](PowerUISmartChargeUtilities, "isiPad"))
  {
    self->_enabled = 0;
  }
  else
  {
    if (v3)
      v4 = objc_msgSend(v3, "BOOLValue");
    else
      v4 = 1;
    self->_enabled = v4;
  }
  ADClientSetValueForScalarKey();
  v107 = CFSTR("enabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_enabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("currentState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (self->_enabled)
    {
      self->_currentState = 1;
    }
    else
    {
      self->_currentState = 0;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", 10, 0, v11);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v10, CFSTR("currentState"));
    goto LABEL_15;
  }
  v9 = objc_msgSend(v7, "unsignedIntegerValue");
  self->_currentState = v9;
  if (!self->_enabled && v9 == 1)
  {
    -[PowerUISmartChargeManager setCurrentState:](self, "setCurrentState:", 0);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", 10, 0, v10);
LABEL_15:

  }
  -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("potentialUnplugDate"));
  v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
  potentialUnplugDate = self->_potentialUnplugDate;
  self->_potentialUnplugDate = v12;

  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("debounceOverrideInSeconds"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "doubleValue");
    else
      v16 = -1.0;
    self->_debounceOverride = v16;

  }
  -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("MCLTempDisabledUntilDate"));
  v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
  mclDisabledUntilDate = self->_mclDisabledUntilDate;
  self->_mclDisabledUntilDate = v17;

  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("MCLFeatureState"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
    v21 = objc_msgSend(v19, "unsignedIntValue");
  else
    v21 = 0;
  self->_manualChargeLimitStatus = v21;
  -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("initialChargeLimitSetDate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    self->_manualChargeLimitWasEverEnabled = 1;
  }
  else if (self->_manualChargeLimitStatus)
  {
    self->_manualChargeLimitWasEverEnabled = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", v23, CFSTR("initialChargeLimitSetDate"));

    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D443990, CFSTR("mclLimitValue"));
  }
  else
  {
    self->_manualChargeLimitWasEverEnabled = 0;
  }
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("mclLimitValue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v24;
  if (v24)
    v25 = objc_msgSend(v24, "unsignedCharValue");
  else
    v25 = 100;
  self->_mclTargetSoC = v25;
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("ChargeLimitRecommendation"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v26;
  if (v26)
    v27 = objc_msgSend(v26, "unsignedIntValue");
  else
    v27 = 0;
  self->_recommendedLimit = v27;
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("DEoCFeatureState"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = v28;
  if (+[PowerUISmartChargeUtilities isiPad](PowerUISmartChargeUtilities, "isiPad"))
  {
    self->_deocFeatureState = 0;
  }
  else
  {
    if (v28)
      v29 = objc_msgSend(v28, "unsignedIntValue") != 0;
    else
      v29 = 1;
    self->_deocFeatureState = v29;
  }
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("alarmsIgnored"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  self->_signalsIgnored = objc_msgSend(v30, "BOOLValue");

  -[NSLock lock](self->_deocCurrentStatusLock, "lock");
  +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_deocCurrentStatusLock, "unlock");
  if (v31)
  {
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("dryRun"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "BOOLValue");

    if ((v33 & 1) == 0)
    {
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("limitCharge"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isDesktopDevice = objc_msgSend(v34, "BOOLValue");

    }
  }
  -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("lastDesktopModeChangeDate"));
  v35 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastDesktopModeChangeDate = self->_lastDesktopModeChangeDate;
  self->_lastDesktopModeChangeDate = v35;

  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("lastNonEngagementSignalID"));
  v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  lastNonEngagementSignalID = self->_lastNonEngagementSignalID;
  self->_lastNonEngagementSignalID = v37;

  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("chargePredictionModel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = self->_log;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v88 = v39;
    _os_log_impl(&dword_215A71000, v40, OS_LOG_TYPE_DEFAULT, "Loading model: %@", buf, 0xCu);
  }
  if (!v39 || objc_msgSend(v39, "unsignedIntegerValue") == 2)
  {
    v41 = 2;
LABEL_49:
    self->_predictorType = v41;
    goto LABEL_50;
  }
  if (objc_msgSend(v39, "unsignedIntegerValue") == 4)
  {
    v41 = 4;
    goto LABEL_49;
  }
  if (objc_msgSend(v39, "unsignedIntegerValue") == -1)
  {
    v41 = -1;
    goto LABEL_49;
  }
  self->_predictorType = 2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v73, CFSTR("chargePredictionModel"));

LABEL_50:
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("fullChargeDeadline"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    v44 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v42, "doubleValue");
    objc_msgSend(v44, "dateWithTimeIntervalSinceReferenceDate:");
    v45 = (NSDate *)objc_claimAutoreleasedReturnValue();
    fullChargeDeadline = self->__fullChargeDeadline;
    self->__fullChargeDeadline = v45;

  }
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("empiricalFullChargeDuration"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "doubleValue");
  self->_empiricalTimeToFullChargeDurationMinutes = v48;

  empiricalTimeToFullChargeDurationMinutes = self->_empiricalTimeToFullChargeDurationMinutes;
  v50 = fmax(fmin(empiricalTimeToFullChargeDurationMinutes, 180.0), 40.0);
  v51 = empiricalTimeToFullChargeDurationMinutes - v50;
  if (v51 < 0.0)
    v51 = -v51;
  if (v51 > 1.0)
  {
    self->_empiricalTimeToFullChargeDurationMinutes = v50;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v52, CFSTR("empiricalFullChargeDuration"));

  }
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("wirelessCharger"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastChargerWasWireless = objc_msgSend(v53, "BOOLValue");

  -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("engagementTimeOverride"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setEngagementTimeOverride:](self, "setEngagementTimeOverride:", v54);

  -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("fullChargeDeadlineOverride"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setFullChargeDeadlineOverride:](self, "setFullChargeDeadlineOverride:", v55);

  -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("repeatEngagementOverrideEndDate"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setRepeatEngagementOverrideEndDate:](self, "setRepeatEngagementOverrideEndDate:", v56);

  -[PowerUISmartChargeManager cleanupOverrides](self, "cleanupOverrides");
  +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("powerLogStatus"), self->_defaultsDomain);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setPowerLogStatus:](self, "setPowerLogStatus:", v57);

  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("becameOBCEligible"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  v82 = v43;
  if (v58)
    LOBYTE(v58) = objc_msgSend(v58, "BOOLValue");
  self->_becameOBCEligible = (char)v58;
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("reachedTargetSoC"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  v83 = v39;
  if (v60)
    LOBYTE(v60) = objc_msgSend(v60, "BOOLValue");
  self->_reachedTargetSoC = (char)v60;
  v62 = self->_log;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v80 = v22;
    v81 = v8;
    v63 = v20;
    enabled = self->_enabled;
    currentState = self->_currentState;
    signalsIgnored = self->_signalsIgnored;
    isDesktopDevice = self->_isDesktopDevice;
    manualChargeLimitStatus = self->_manualChargeLimitStatus;
    v65 = (void *)MEMORY[0x24BDD16E0];
    predictorType = self->_predictorType;
    log = v62;
    objc_msgSend(v65, "numberWithUnsignedInteger:", predictorType);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    signalDeadline = self->_signalDeadline;
    -[PowerUISmartChargeManager engagementTimeOverride](self, "engagementTimeOverride");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager fullChargeDeadlineOverride](self, "fullChargeDeadlineOverride");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager repeatEngagementOverrideEndDate](self, "repeatEngagementOverrideEndDate");
    v79 = v31;
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_overrideAllSignals);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67111682;
    *(_DWORD *)v88 = enabled;
    v20 = v63;
    v22 = v80;
    *(_WORD *)&v88[4] = 2048;
    *(_QWORD *)&v88[6] = currentState;
    v89 = 1024;
    v90 = signalsIgnored;
    v91 = 1024;
    v92 = isDesktopDevice;
    v93 = 2048;
    v94 = manualChargeLimitStatus;
    v95 = 2112;
    v96 = v67;
    v97 = 2112;
    v98 = signalDeadline;
    v99 = 2112;
    v100 = v69;
    v101 = 2112;
    v102 = v70;
    v103 = 2112;
    v104 = v71;
    v105 = 2112;
    v106 = v72;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Loaded Settings: Enabled=%u, CurrentState=%lu, Signals Ignored=%u, Desktop device=%u, Manual Charge Limit=%lu, Predictor = %@, Full Charge Deadline=%@, EngagementTimeOverride=%@, FullChargeDeadlineOverride=%@, repeatEngagementOverrideEndDate=%@ OverrideAllSignals=%@", buf, 0x64u);

    v31 = v79;
    v8 = v81;

  }
}

- (BOOL)isExternalConnected
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (-[PowerUISmartChargeManager lastPluginStatus](self, "lastPluginStatus") > 0)
    return 1;
  if ((-[PowerUISmartChargeManager lastPluginStatus](self, "lastPluginStatus") & 0x80000000) == 0)
    return 0;
  -[PowerUISmartChargeManager context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (void)handleTopOffSupervisorEventInternal
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[PowerUISmartChargeManager isExternalConnected](self, "isExternalConnected"))
  {
    -[PowerUISmartChargeManager log](self, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215A71000, v3, OS_LOG_TYPE_DEFAULT, "Handling periodic check for callback", v4, 2u);
    }

    -[PowerUISmartChargeManager handleCallback:](self, "handleCallback:", 1);
  }
}

- (void)handleTopOffSupervisorEvent
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__PowerUISmartChargeManager_handleTopOffSupervisorEvent__block_invoke;
  block[3] = &unk_24D3FB7B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__PowerUISmartChargeManager_handleTopOffSupervisorEvent__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "recallPeriodicCheck");
  return objc_msgSend(*(id *)(a1 + 32), "handleTopOffSupervisorEventInternal");
}

- (double)periodicCheckDuration
{
  return (double)(arc4random_uniform(0xB4u) + 720);
}

- (void)requestPeriodicCheckWithDuration:(double)a3 withAlarmKey:(const char *)a4
{
  time_t v5;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  v5 = time(0);
  xpc_dictionary_set_date(xdict, "Date", 1000000000 * (unint64_t)((double)v5 + a3));
  xpc_set_event();

}

- (void)requestPeriodicCheck
{
  -[PowerUISmartChargeManager periodicCheckDuration](self, "periodicCheckDuration");
  -[PowerUISmartChargeManager requestPeriodicCheckWithDuration:withAlarmKey:](self, "requestPeriodicCheckWithDuration:withAlarmKey:", "TopOffSupervisor");
}

- (void)recallPeriodicCheck
{
  xpc_set_event();
}

- (void)handleInternalCarryPromptEvent
{
  NSObject *queue;
  _QWORD block[5];

  xpc_set_event();
  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__PowerUISmartChargeManager_handleInternalCarryPromptEvent__block_invoke;
    block[3] = &unk_24D3FB7B0;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

void __59__PowerUISmartChargeManager_handleInternalCarryPromptEvent__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48)))
  {
    ADClientSetValueForScalarKey();
  }
  else
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "Failure: Providing notification to charge.", v7, 2u);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -5.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "smartTopOffFailureNotificationAtBatteryLevel:withDate:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "postNotificationWithRequest:", v5);

    ADClientSetValueForScalarKey();
  }
}

- (void)handleDebounceTimerEvent
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  -[PowerUISmartChargeManager log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, v3, OS_LOG_TYPE_DEFAULT, "Handling debounce timer callback", buf, 2u);
  }

  xpc_set_event();
  -[PowerUISmartChargeManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__PowerUISmartChargeManager_handleDebounceTimerEvent__block_invoke;
  block[3] = &unk_24D3FB7B0;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __53__PowerUISmartChargeManager_handleDebounceTimerEvent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallback:", 1);
}

- (void)handleAlarmEvent:(id)a3
{
  void *v4;
  const char *v5;
  id v6;
  void *v7;
  xpc_object_t reply;
  _xpc_connection_s *v9;
  NSObject *log;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (const char *)*MEMORY[0x24BDACF50];
  v6 = a3;
  objc_msgSend(v4, "stringWithUTF8String:", xpc_dictionary_get_string(v6, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v6);
  xpc_dictionary_get_remote_connection(v6);
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  xpc_connection_send_message(v9, reply);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Alarm fired for %@", (uint8_t *)&v11, 0xCu);
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("TopOffSupervisor")))
  {
    -[PowerUISmartChargeManager handleTopOffSupervisorEvent](self, "handleTopOffSupervisorEvent");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("InternalCarryPrompt")))
  {
    -[PowerUISmartChargeManager handleInternalCarryPromptEvent](self, "handleInternalCarryPromptEvent");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("DebounceTimer")))
  {
    -[PowerUISmartChargeManager handleDebounceTimerEvent](self, "handleDebounceTimerEvent");
  }

}

- (void)dispatchAlarmAfter:(int64_t)a3 withName:(id)a4
{
  id v6;
  NSObject *log;
  xpc_object_t v8;
  time_t v9;
  id v10;
  int v11;
  int64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218242;
    v12 = a3;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Requesting wake in %llu seconds for %@", (uint8_t *)&v11, 0x16u);
  }
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = time(0);
  xpc_dictionary_set_date(v8, "Date", 1000000000 * (v9 + a3));
  v10 = objc_retainAutorelease(v6);
  objc_msgSend(v10, "UTF8String");
  xpc_set_event();

}

- (void)promptBDCToQueryCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PowerUIBDCDataManager getBDCDataDictTemplate](self->_bdcDataManager, "getBDCDataDictTemplate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24D443900, CFSTR("ChargingState"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24D443900, CFSTR("InflowState"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PowerUISmartChargeManager currentChargeLimit](self, "currentChargeLimit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, CFSTR("ChargeLimit"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_checkpoint);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("CheckPoint"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PowerUISmartChargeManager currentModeOfOperation](self, "currentModeOfOperation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("ModeOfOperation"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PowerUISmartChargeManager currentDecisionMaker](self, "currentDecisionMaker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("DecisionMaker"));

  -[PowerUIBDCDataManager promptBDCToQueryState:](self->_bdcDataManager, "promptBDCToQueryState:", v7);
}

- (void)registerBDCXPC
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *xpcCallbackQueue;
  OS_xpc_object *mach_service;
  OS_xpc_object *bdcConnection;
  OS_xpc_object *v8;
  NSObject *log;
  uint8_t v10[8];
  _QWORD handler[5];

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.powerui.xpcCallbackQueue", v3);
  xpcCallbackQueue = self->_xpcCallbackQueue;
  self->_xpcCallbackQueue = v4;

  mach_service = xpc_connection_create_mach_service("com.apple.powerui.bdcdata", (dispatch_queue_t)self->_xpcCallbackQueue, 1uLL);
  bdcConnection = self->_bdcConnection;
  self->_bdcConnection = mach_service;

  v8 = self->_bdcConnection;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __43__PowerUISmartChargeManager_registerBDCXPC__block_invoke;
  handler[3] = &unk_24D3FC490;
  handler[4] = self;
  xpc_connection_set_event_handler(v8, handler);
  xpc_connection_activate(self->_bdcConnection);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_INFO, "registerBDCXPC done", v10, 2u);
  }
}

void __43__PowerUISmartChargeManager_registerBDCXPC__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "xpcRegister event handler called", (uint8_t *)&v7, 2u);
  }
  if (MEMORY[0x2199EC534](v3) == MEMORY[0x24BDACF88])
  {
    objc_msgSend(*(id *)(a1 + 32), "incomingBDCRequest:", v3);
  }
  else
  {
    v5 = (void *)MEMORY[0x2199EC4A4](v3);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = v5;
      _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Received object: %s", (uint8_t *)&v7, 0xCu);
    }
    free(v5);
  }

}

- (void)incomingBDCRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke;
  v6[3] = &unk_24D3FC930;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  xpc_connection_set_event_handler((xpc_connection_t)v5, v6);
  xpc_connection_activate((xpc_connection_t)v5);
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[PowerUISmartChargeManager incomingBDCRequest:].cold.1();

}

void __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_INFO, "incomingBDCRequest event handler called", (uint8_t *)&v10, 2u);
  }
  if (MEMORY[0x2199EC534](v3) == MEMORY[0x24BDACFB8])
  {
    v8 = (void *)MEMORY[0x2199EC4A4](v3);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = v8;
      _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_INFO, "Connection received error: %s", (uint8_t *)&v10, 0xCu);
    }
    free(v8);
  }
  else if (MEMORY[0x2199EC534](v3) == MEMORY[0x24BDACFA0])
  {
    if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_DEBUG))
      __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke_cold_2();
    xpc_dictionary_get_value(v3, "currentSmartChargingStateRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "incoming xpc connection event: currentSmartChargingStateRequest", (uint8_t *)&v10, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "sendBDCData:withMessage:", *(_QWORD *)(a1 + 40), v3);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "bdcSemaphoreToUse");
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal(v7);

    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke_cold_1();
    }
  }

}

- (void)sendBDCData:(id)a3 withMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  xpc_object_t reply;
  const __CFAllocator *v10;
  __SecTask *v11;
  __SecTask *v12;
  CFTypeRef v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  audit_token_t token;
  uint8_t buf[16];
  __int128 v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    reply = xpc_dictionary_create_reply(v7);
    if (reply)
    {
      *(_OWORD *)buf = 0u;
      v39 = 0u;
      xpc_connection_get_audit_token();
      v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      memset(&token, 0, sizeof(token));
      v11 = SecTaskCreateWithAuditToken(v10, &token);
      if (v11
        && (v12 = v11,
            v13 = SecTaskCopyValueForEntitlement(v11, CFSTR("com.apple.powerui.bdcdata"), 0),
            CFRelease(v12),
            v13))
      {
        CFRelease(v13);
        -[PowerUIBDCDataManager getNextBDCDataDict](self->_bdcDataManager, "getNextBDCDataDict");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MessageVersion"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_int64(reply, "MessageVersion", (int)objc_msgSend(v15, "intValue"));

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ChargingState"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_BOOL(reply, "ChargingState", objc_msgSend(v16, "BOOLValue"));

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("InflowState"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_BOOL(reply, "InflowState", objc_msgSend(v17, "BOOLValue"));

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ChargeLimit"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_int64(reply, "ChargeLimit", (int)objc_msgSend(v18, "intValue"));

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CheckPoint"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_int64(reply, "CheckPoint", (int)objc_msgSend(v19, "intValue"));

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DecisionMaker"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_int64(reply, "DecisionMaker", (int)objc_msgSend(v20, "intValue"));

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ModeOfOperation"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_int64(reply, "ModeOfOperation", (int)objc_msgSend(v21, "intValue"));

        xpc_dictionary_send_reply();
        -[PowerUISmartChargeManager log](self, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MessageVersion"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v36, "intValue");
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ChargingState"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v35, "BOOLValue");
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("InflowState"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v34, "BOOLValue");
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ChargeLimit"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v33, "intValue");
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CheckPoint"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "intValue");
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DecisionMaker"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "intValue");
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ModeOfOperation"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "intValue");
          *(_DWORD *)buf = 67110656;
          *(_DWORD *)&buf[4] = v32;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v31;
          *(_WORD *)&buf[14] = 1024;
          LODWORD(v39) = v30;
          WORD2(v39) = 1024;
          *(_DWORD *)((char *)&v39 + 6) = v29;
          WORD5(v39) = 1024;
          HIDWORD(v39) = v24;
          v40 = 1024;
          v41 = v26;
          v42 = 1024;
          v43 = v28;
          _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_INFO, "Sent data to BDC: MessageVersion=%d - ChargingState=%d - InflowState=%d - ChargeLimit=%d - CheckPoint=%d - DecisionMaker=%d - ModeOfOperation: %d", buf, 0x2Cu);

        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[PowerUISmartChargeManager sendBDCData:withMessage:].cold.2();
        xpc_dictionary_set_uint64(reply, "returnCode", 0xFFFFFFFFE00002C1);
        xpc_dictionary_send_reply();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[PowerUISmartChargeManager sendBDCData:withMessage:].cold.1();
    }

  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[PowerUISmartChargeManager sendBDCData:withMessage:].cold.3();
  }

}

- (unint64_t)currentModeOfOperation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  unint64_t v8;

  +[PowerUISmartChargeUtilities timelineEventDate:withDefaultsDomain:](PowerUISmartChargeUtilities, "timelineEventDate:withDefaultsDomain:", CFSTR("Plugin"), self->_defaultsDomain);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "timeIntervalSinceNow");
  if (self->_checkpoint - 5 >= 0xFFFFFFFFFFFFFFFCLL)
  {
    if (self->_manualChargeLimitStatus == 1)
    {
      v8 = 7;
    }
    else if (self->_isDesktopDevice)
    {
      v8 = 5;
    }
    else if (self->_remoteOBCEngaged)
    {
      v8 = 4;
    }
    else if (v7 >= -72000.0)
    {
      v8 = 1;
    }
    else
    {
      v8 = 3;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)currentDecisionMaker
{
  void *v3;
  double v4;
  unint64_t previousDecisionMakerID;
  unint64_t v6;

  +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceDate:](self->_previousDecisionMakerDate, "timeIntervalSinceDate:", v3);
  if (v4 <= 0.0)
  {
    v6 = -1;
  }
  else
  {
    previousDecisionMakerID = self->_previousDecisionMakerID;
    if (previousDecisionMakerID > 9)
      v6 = 1;
    else
      v6 = qword_215B39390[previousDecisionMakerID];
  }

  return v6;
}

id __44__PowerUISmartChargeManager_handleCallback___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
}

- (void)handleNewPluginWithBatteryLevel:(int)a3 pluginDate:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *log;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[PowerUISmartChargeManager checkWhetherMCLTempDisablementCanBeClearedOnPlugin:](self, "checkWhetherMCLTempDisablementCanBeClearedOnPlugin:", 1);
  -[PowerUIMLTwoStageModelPredictor resetSavedDeadline](self->_modelTwoStagePredictor, "resetSavedDeadline");
  +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("CAPluggedInStatus"), self->_defaultsDomain);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager updateAnalyticsWithPluginMetrics:withBatteryLevel:](self, "updateAnalyticsWithPluginMetrics:withBatteryLevel:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
    AnalyticsSendEventLazy();
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v9;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Reported Plugin Metrics to CoreAnalytics %@", buf, 0xCu);
    }
    +[PowerUISmartChargeUtilities setDict:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDict:forPreferenceKey:inDomain:", 0, CFSTR("CAPluggedInStatus"), self->_defaultsDomain);

  }
  -[PowerUISmartChargeManager evaluateIfDesktopDevice](self, "evaluateIfDesktopDevice");
  -[PowerUISmartChargeManager pluginTimelineAddEvent:atDate:withBatteryLevel:](self, "pluginTimelineAddEvent:atDate:withBatteryLevel:", CFSTR("Plugin"), v6, (int)v4);

  if (-[PowerUITrialManager useTrialEnabledFeature:](self->_trialManager, "useTrialEnabledFeature:", CFSTR("useSleepBasedPredictor"))&& +[PowerUISleepBasedPredictor shouldUseSleepPredictorWithLog:](PowerUISleepBasedPredictor, "shouldUseSleepPredictorWithLog:", self->_log))
  {
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D4439A8, CFSTR("chargePredictionModel"));
    self->_predictorType = 4;
    -[PowerUISmartChargeManager log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Sleep schedule is relevant, use sleep predictor for smart charging", buf, 2u);
    }

  }
  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild")
    && _os_feature_enabled_impl()
    && !self->_isDesktopDevice)
  {
    if ((int)v4 <= 80)
      v12 = 80;
    else
      v12 = v4;
    +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:](PowerUISmartChargeUtilities, "historicalFullChargeDurationStartingAt:withMinimumPluginDuration:", v12, 300);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134218242;
      v20 = v15;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "Found %lu applicable charge sessions for duration estimation: %@", buf, 0x16u);
    }

    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "percentile:", 0.1);
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v17, "postOBCEngagedTopOffNotificationWithDate:", v16);

    }
  }

}

id __72__PowerUISmartChargeManager_handleNewPluginWithBatteryLevel_pluginDate___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)handleUnplugAtDate:(id)a3 withBatteryLevel:(int)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  +[PowerUISmartChargeUtilities timelineEventDate:withDefaultsDomain:](PowerUISmartChargeUtilities, "timelineEventDate:withDefaultsDomain:", CFSTR("Unplug"), self->_defaultsDomain);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PowerUISmartChargeManager pluginTimelineAddEvent:atDate:withBatteryLevel:](self, "pluginTimelineAddEvent:atDate:withBatteryLevel:", CFSTR("Unplug"), v6, a4);
    -[PowerUISmartChargeManager recordAnalytics](self, "recordAnalytics");
  }
  -[PowerUISmartChargeManager clearPluginTimeline](self, "clearPluginTimeline");
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D4438E8, CFSTR("becameOBCEligible"));
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D4438E8, CFSTR("reachedTargetSoC"));
  *(_WORD *)&self->_becameOBCEligible = 0;
  -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:](self, "cacheCurrentDEoCBehaviorForced:", 1);
  if (self->_predictorType == 4)
  {
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D4439C0, CFSTR("chargePredictionModel"));
    self->_predictorType = 2;
    -[PowerUISmartChargeManager log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "Reset predictor type back to default", v9, 2u);
    }

  }
  -[PowerUISmartChargeManager checkWhetherMCLTempDisablementCanBeClearedOnPlugin:](self, "checkWhetherMCLTempDisablementCanBeClearedOnPlugin:", 0);
  -[PowerUISmartChargeManager clearManualChargeLimit](self, "clearManualChargeLimit");

}

- (void)updateTimeLineForCurrentBatteryLevel:(int)a3 withIsExternalConnected:(BOOL)a4 forDate:(id)a5
{
  _BOOL4 v5;
  uint64_t v6;
  _BOOL4 v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v13 = a5;
  v8 = self->_isDesktopDevice || self->_manualChargeLimitStatus == 1;
  v9 = -[PowerUISmartChargeManager lastBatteryLevel](self, "lastBatteryLevel");
  if ((int)v6 <= 99 && v9 == 100 && !v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager _submitEngagementEventWithBatteryLevel:eventType:](self, "_submitEngagementEventWithBatteryLevel:eventType:", v10, 11);

    self->_reachedTargetSoC = 0;
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D4438E8, CFSTR("reachedTargetSoC"));
  }
  if ((v6 - 80) > 0xE || self->_becameOBCEligible)
  {
    v11 = (_DWORD)v6 == 100 && v5;
    if ((_DWORD)v11 == 1 && !self->_lastFullyCharged)
    {
      -[PowerUISmartChargeManager pluginTimelineAddEvent:atDate:withBatteryLevel:](self, "pluginTimelineAddEvent:atDate:withBatteryLevel:", CFSTR("FullyCharged"), v13, 100);
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.smartcharging.statechange"), "UTF8String"));
      v11 = 1;
    }
  }
  else
  {
    -[PowerUISmartChargeManager pluginTimelineAddEvent:atDate:withBatteryLevel:](self, "pluginTimelineAddEvent:atDate:withBatteryLevel:", CFSTR("EligibleForIdle"), v13, v6);
    self->_becameOBCEligible = 1;
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D443918, CFSTR("becameOBCEligible"));
    v11 = 0;
  }
  -[PowerUISmartChargeManager setLastFullyCharged:](self, "setLastFullyCharged:", v11);
  if (v8 && (int)v6 >= 80 && !self->_reachedTargetSoC)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager _submitEngagementEventWithBatteryLevel:eventType:](self, "_submitEngagementEventWithBatteryLevel:eventType:", v12, 10);

    self->_reachedTargetSoC = 1;
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D443918, CFSTR("reachedTargetSoC"));
  }

}

- (BOOL)shouldContinueAfterMCMCheckWithBatteryLevel:(int)a3 withIsCharging:(BOOL)a4 withIsExternalConnected:(BOOL)a5 withIsPluggedIn:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *mcmLog;
  void *v11;
  _BOOL8 isChargePackConnected;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  _BOOL4 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v6 = a6;
  v26 = a5;
  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v39 = *MEMORY[0x24BDAC8D0];
  mcmLog = self->_mcmLog;
  if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    isChargePackConnected = self->_isChargePackConnected;
    v13 = mcmLog;
    objc_msgSend(v11, "numberWithBool:", isChargePackConnected);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_mcmForbidsCharging);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
    v17 = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v18;
    v35 = 2112;
    v36 = v19;
    v37 = 2112;
    v38 = v20;
    _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_INFO, "Handle callback. _isChargePackConnected: %@ - isCharging: %@ - mcmForbidsCharging: %@ - batteryLevel: %@, isPluggedIn: %@ - isExternalConnected: %@", buf, 0x3Eu);

    v8 = v17;
  }
  if (!self->_isChargePackConnected || self->_manualChargeLimitStatus == 1)
    return 1;
  v21 = v26 || v6;
  if (!v26 && !v6)
  {
    if (self->_mcmCurrentState == 1)
    {
      if (v8 < 0x5B)
      {
        if ((_DWORD)v8 != 90 && self->_mcmForbidsCharging)
        {
          v23 = self->_mcmLog;
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          *(_WORD *)buf = 0;
          v24 = "Mobile Charge Mode enable charging";
          goto LABEL_11;
        }
      }
      else if (!self->_mcmForbidsCharging)
      {
        v25 = self->_mcmLog;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_DEFAULT, "Mobile Charge Mode disable charging", buf, 2u);
        }
        -[PowerUISmartChargeManager mcmDisableCharging](self, "mcmDisableCharging");
        goto LABEL_22;
      }
    }
    else if (self->_mcmForbidsCharging)
    {
      if (os_log_type_enabled((os_log_t)self->_mcmLog, OS_LOG_TYPE_ERROR))
        -[PowerUISmartChargeManager shouldContinueAfterMCMCheckWithBatteryLevel:withIsCharging:withIsExternalConnected:withIsPluggedIn:].cold.1();
      goto LABEL_21;
    }
    return 0;
  }
  if (self->_mcmForbidsCharging)
  {
    v23 = self->_mcmLog;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:
      -[PowerUISmartChargeManager mcmEnableCharging](self, "mcmEnableCharging");
LABEL_22:
      -[PowerUISmartChargeManager reportMCMStatusWithBatteryLevel:](self, "reportMCMStatusWithBatteryLevel:", v8);
      return v21;
    }
    *(_WORD *)buf = 0;
    v24 = "Mobile Charge Mode enable charging - external power available";
LABEL_11:
    _os_log_impl(&dword_215A71000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
    goto LABEL_21;
  }
  return 1;
}

- (void)reportAggDKeys:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Reporting to aggd %@", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_661);

}

void __44__PowerUISmartChargeManager_reportAggDKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(a3, "integerValue");
  ADClientSetValueForScalarKey();

}

- (void)recordAnalytics
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Plugin date is coming back as 0, do not attempt Biome plugout analysis", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = CFSTR("DeviceNotLegitimate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_690(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = CFSTR("DeviceOverride");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = CFSTR("EnabledAndLegitimate");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_703(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_706(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __44__PowerUISmartChargeManager_recordAnalytics__block_invoke_707(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = CFSTR("FeatureDisabled");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dailyStatsFromLastReported:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _CDLocalContext *context;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  _QWORD v34[3];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("timeline"), (CFStringRef)self->_defaultsDomain);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryLevel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = (void *)objc_msgSend(v5, "mutableCopy");

    v35[0] = CFSTR("Unplug");
    v34[0] = CFSTR("event");
    v34[1] = CFSTR("date");
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    objc_msgSend(v12, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = CFSTR("batteryLevel");
    v35[1] = v14;
    v35[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v15);

    v6 = v11;
  }
  -[PowerUISmartChargeManager constructAnalyticsStatusFromEvents:](self, "constructAnalyticsStatusFromEvents:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager constructDailyStats:](self, "constructDailyStats:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DailyHoursEngaged"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DailyHoursEstimated"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("EligibleForIdleTime"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "timeIntervalSinceDate:", v21);
  }
  objc_msgSend(v4, "timeIntervalSinceNow");
  v23 = v22 / -3600.0;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DailyHoursEngaged"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DailyHoursEstimated"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;

  if (v29 >= v23)
    v30 = v29;
  else
    v30 = v23;
  if (v30 > 0.0)
  {
    if (v26 >= v23)
      v31 = v26;
    else
      v31 = v23;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31 / v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v32, CFSTR("DailyHoursSaved"));

  }
  return v18;
}

- (id)constructDailyStats:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  NSObject *log;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;

  v4 = a3;
  +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("DailyStatus"), self->_defaultsDomain);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IdleDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = (double)(v8 / 0xE10);

  if (v8 >> 6 > 0x7E8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager constructDailyStats:].cold.2(log);
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DailyEngagements"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (double)(unint64_t)objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11 + 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("DailyEngagements"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DailyHoursEngaged"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15 + v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("DailyHoursEngaged"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EstimatedUsableEligibleDuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  if (v19 >= 0x1FA40)
  {
    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager constructDailyStats:].cold.1(v24);
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DailyHoursEstimated"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22 + (double)(v19 / 0xE10));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("DailyHoursEstimated"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UnderChargedAvoidable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLValue");

  if (v26)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DailyUndercharges"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (double)(unint64_t)objc_msgSend(v27, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28 + 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("DailyUndercharges"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DailyPluggedInSessions"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (double)(unint64_t)objc_msgSend(v30, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v31 + 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("DailyPluggedInSessions"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EligibleForIdleTime"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("EligibleForIdleTime"));

  return v6;
}

- (id)updateAnalyticsWithPluginMetrics:(id)a3 withBatteryLevel:(int)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = v6;
  if (a4 <= 19)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("MeaningfulUndercharge"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_engagementsLastMonthBucket, CFSTR("EngagementsLastMonthBucket"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_lastReportedNumberOfPluginEvents, CFSTR("NumberOfPluginEvents"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_medianPluginLength, CFSTR("MedianPluginLength"));
  return v7;
}

- (void)startAllMonitoring
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_monitors;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "startMonitoring", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)stopAllMonitoring
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_monitors;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "stopMonitoring", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addPowerLogEventForCheckpoint:(unint64_t)a3 decisionSignalID:(id)a4 decisionDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *log;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[PowerUISmartChargeManager powerLogStatus](self, "powerLogStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setPreviousPowerLogStatus:](self, "setPreviousPowerLogStatus:", v10);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_enabled)
  {
    v13 = &unk_24D443918;
  }
  else if (self->_temporarilyDisabled)
  {
    v13 = &unk_24D4439D8;
  }
  else
  {
    v13 = &unk_24D4438E8;
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("status"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("checkpoint"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentState);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("state"));

  if (v8)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("decisionMaker"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("decisionTime"));
  }
  -[PowerUISmartChargeManager durationToFullChargeFromBatteryLevel:](self, "durationToFullChargeFromBatteryLevel:", self->_lastBatteryLevel);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("timeTillTopOff"));

  if (self->_predictorType == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PowerUIMLTwoStageModelPredictor engagementModelVersion](self->_modelTwoStagePredictor, "engagementModelVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("engagementModelVersion"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PowerUIMLTwoStageModelPredictor durationModelVersion](self->_modelTwoStagePredictor, "durationModelVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("modelVersion"));

    v19 = (void *)MEMORY[0x24BDD16E0];
    -[PowerUIMLTwoStageModelPredictor lastEngagementResult](self->_modelTwoStagePredictor, "lastEngagementResult");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("engagementProbability"));

    v21 = (void *)MEMORY[0x24BDD16E0];
    -[PowerUIMLTwoStageModelPredictor lastDurationResult](self->_modelTwoStagePredictor, "lastDurationResult");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("durationPrediction"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("batteryLevel"));

  if (a3 - 2 >= 3)
    v24 = MEMORY[0x24BDBD1C0];
  else
    v24 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("isEngaged"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDesktopDevice);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("isMaxChargeLimited"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_manualChargeLimitStatus);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, CFSTR("isManuallyChargeLimited"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_mclTargetSoC);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, CFSTR("chargeLimitTargetSoC"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_recommendedLimit);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v28, CFSTR("recommendedChargeLimit"));

  if (a3 <= 8 && ((1 << a3) & 0x181) != 0)
  {
    if (self->_enabled)
      v29 = (16 * self->_temporarilyDisabled) ^ 0x10;
    else
      v29 = 0;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntegerValue");

    v32 = v29 | (32 * v31);
  }
  else
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 16 * objc_msgSend(v33, "unsignedIntegerValue");

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v32 | a3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v34, CFSTR("aggDBitmap"));

  -[PowerUISmartChargeManager setPowerLogStatus:](self, "setPowerLogStatus:", v12);
  -[PowerUISmartChargeManager powerLogStatus](self, "powerLogStatus");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities setDict:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDict:forPreferenceKey:inDomain:", v35, CFSTR("powerLogStatus"), self->_defaultsDomain);

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 138412290;
    v39 = v12;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Writing to PowerLog %@", (uint8_t *)&v38, 0xCu);
  }
  v37 = (void *)MEMORY[0x2199EC15C]();
  PLLogRegisteredEvent();
  objc_autoreleasePoolPop(v37);

}

- (id)adjustedFullChargeDeadlineWithSignals:(id)a3 withDesktopMode:(BOOL)a4 withFullChargeDeadline:(id)a5 withResult:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("decisionDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "earlierDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToDate:", v12) & 1) == 0)
  {
    v13 = v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("decisionMaker"));

    v9 = v13;
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("decisionDate"));

  return v10;
}

- (void)resetState
{
  NSDate *lastComputedSignalDeadline;
  NSDictionary *signalDeadline;
  id v5;

  lastComputedSignalDeadline = self->_lastComputedSignalDeadline;
  self->_lastComputedSignalDeadline = 0;

  signalDeadline = self->_signalDeadline;
  self->_signalDeadline = 0;

  v5 = -[PowerUISmartChargeManager setFullChargeDeadline:](self, "setFullChargeDeadline:", 0);
  -[PowerUISmartChargeManager recallPeriodicCheck](self, "recallPeriodicCheck");
  -[PowerUIMLTwoStageModelPredictor resetSavedDeadline](self->_modelTwoStagePredictor, "resetSavedDeadline");
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.smartcharging.statechange"), "UTF8String"));
}

- (id)stringFromDecisionMaker:(int64_t)a3 decisionDate:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v5 = a4;
  if (stringFromDecisionMaker_decisionDate__onceToken != -1)
    dispatch_once(&stringFromDecisionMaker_decisionDate__onceToken, &__block_literal_global_779);
  if ((unint64_t)a3 <= 0xD && ((0x33FFu >> a3) & 1) != 0)
  {
    v7 = off_24D3FCC58[a3];
    objc_msgSend((id)stringFromDecisionMaker_decisionDate__formatter, "stringFromDate:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v7, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __66__PowerUISmartChargeManager_stringFromDecisionMaker_decisionDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)stringFromDecisionMaker_decisionDate__formatter;
  stringFromDecisionMaker_decisionDate__formatter = (uint64_t)v0;

  return objc_msgSend((id)stringFromDecisionMaker_decisionDate__formatter, "setDateFormat:", CFSTR("MM/dd HH:mm"));
}

- (void)cleanupOverrides
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *log;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[PowerUISmartChargeManager fullChargeDeadlineOverride](self, "fullChargeDeadlineOverride");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PowerUISmartChargeManager fullChargeDeadlineOverride](self, "fullChargeDeadlineOverride");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;

    if (v7 <= 0.0)
    {
      -[PowerUISmartChargeManager fullChargeDeadlineOverride](self, "fullChargeDeadlineOverride");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateByAddingTimeInterval:", 86400.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PowerUISmartChargeManager repeatEngagementOverrideEndDate](self, "repeatEngagementOverrideEndDate");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        -[PowerUISmartChargeManager repeatEngagementOverrideEndDate](self, "repeatEngagementOverrideEndDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceDate:", v13);
        if (v14 >= 0.0)
        {

        }
        else
        {
          -[PowerUISmartChargeManager repeatEngagementOverrideEndDate](self, "repeatEngagementOverrideEndDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "timeIntervalSinceNow");
          v17 = v16;

          if (v17 > 0.0)
          {
            -[PowerUISmartChargeManager engagementTimeOverride](self, "engagementTimeOverride");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "dateByAddingTimeInterval:", 86400.0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v10, "timeIntervalSinceReferenceDate");
            objc_msgSend(v20, "numberWithDouble:");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v21, CFSTR("fullChargeDeadlineOverride"));

            v22 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v19, "timeIntervalSinceReferenceDate");
            objc_msgSend(v22, "numberWithDouble:");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v23, CFSTR("engagementTimeOverride"));

            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              v25 = log;
              -[PowerUISmartChargeManager fullChargeDeadlineOverride](self, "fullChargeDeadlineOverride");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[PowerUISmartChargeManager engagementTimeOverride](self, "engagementTimeOverride");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = 138413058;
              v31 = v26;
              v32 = 2112;
              v33 = v10;
              v34 = 2112;
              v35 = v27;
              v36 = 2112;
              v37 = v19;
              _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_DEFAULT, "Forwarding fullChargeDeadlineOverride = %@ to %@ and engagementTimeOverrideDate = %@ to %@", (uint8_t *)&v30, 0x2Au);

            }
            -[PowerUISmartChargeManager setFullChargeDeadlineOverride:](self, "setFullChargeDeadlineOverride:", v10);
            -[PowerUISmartChargeManager setEngagementTimeOverride:](self, "setEngagementTimeOverride:", v19);
            -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("overrideAllSignals"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUISmartChargeManager setOverrideAllSignals:](self, "setOverrideAllSignals:", objc_msgSend(v28, "BOOLValue"));

            goto LABEL_15;
          }
        }
      }
      -[PowerUISmartChargeManager resetEngagementOverrideWithHandler:](self, "resetEngagementOverrideWithHandler:", &__block_literal_global_806);
LABEL_15:

      return;
    }
  }
  -[PowerUISmartChargeManager fullChargeDeadlineOverride](self, "fullChargeDeadlineOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    -[PowerUISmartChargeManager engagementTimeOverride](self, "engagementTimeOverride");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      -[PowerUISmartChargeManager resetEngagementOverrideWithHandler:](self, "resetEngagementOverrideWithHandler:", &__block_literal_global_807);
  }
}

- (void)updateDecisionMakerID:(int64_t)a3 withCheckpoint:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t previousDecisionMakerID;
  _QWORD *v10;
  NSDate *v11;
  NSDate *previousDecisionMakerDate;
  void *v13;
  uint64_t v14;

  if (a3 == -1)
    return;
  v14 = v4;
  previousDecisionMakerID = self->_previousDecisionMakerID;
  if (a4 > 1)
  {
    if ((unint64_t)a3 < 0xE && ((0x30BDu >> a3) & 1) != 0)
    {
      v10 = &unk_215B39448;
      goto LABEL_10;
    }
  }
  else if ((unint64_t)a3 < 0xD && ((0x193Du >> a3) & 1) != 0)
  {
    v10 = &unk_215B393E0;
LABEL_10:
    previousDecisionMakerID = v10[a3];
  }
  if (a3 == 14)
    previousDecisionMakerID = 14;
  self->_previousDecisionMakerID = previousDecisionMakerID;
  objc_msgSend(MEMORY[0x24BDBCE60], "date", v5, v14, v6, v7);
  v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
  previousDecisionMakerDate = self->_previousDecisionMakerDate;
  self->_previousDecisionMakerDate = v11;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_previousDecisionMakerID);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v13, CFSTR("previousDecisionMaker"));

  -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", self->_previousDecisionMakerDate, CFSTR("previousDecisionMakerDate"));
}

_QWORD *__87__PowerUISmartChargeManager_handleNewBatteryLevel_whileExternalConnected_fullyCharged___block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "resetState");
  result = *(_QWORD **)(a1 + 32);
  if (!result[14])
    return (_QWORD *)objc_msgSend(result, "promptBDCToQueryCurrentState");
  return result;
}

- (void)handleNewBatteryLevelForMCL:(int)a3 whileExternalConnected:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *log;
  unint64_t checkpoint;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int mclTargetSoC;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  _DWORD v23[7];

  v4 = a4;
  *(_QWORD *)&v23[5] = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 67109376;
    v23[0] = a3;
    LOWORD(v23[1]) = 1024;
    *(_DWORD *)((char *)&v23[1] + 2) = v4;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Called for MCL battery level=%d, externalConnected=%u", (uint8_t *)&v22, 0xEu);
  }
  if (v4)
  {
    checkpoint = self->_checkpoint;
    if (-[PowerUIBatteryMitigationManager mitigationsCurrentlyEnabled](self->_batteryMitigationManager, "mitigationsCurrentlyEnabled"))
    {
      v10 = self->_log;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_DEFAULT, "Battery mitigations are in place, MCL will be ignored", (uint8_t *)&v22, 2u);
      }
      if (a3 == 100)
        v11 = 7;
      else
        v11 = 6;
    }
    else
    {
      mclTargetSoC = self->_mclTargetSoC;
      if (mclTargetSoC <= a3 || checkpoint >= 2)
      {
        if (checkpoint < 2 && mclTargetSoC <= a3)
          v11 = 2;
        else
          v11 = checkpoint;
      }
      else
      {
        v11 = 1;
      }
    }
    if (checkpoint != v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUISmartChargeManager updateDecisionMakerID:withCheckpoint:](self, "updateDecisionMakerID:withCheckpoint:", 14, v11);
      -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", v11, &unk_24D4439F0, v15);
      -[PowerUISmartChargeManager checkpointNameFromCheckpoint:](self, "checkpointNameFromCheckpoint:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUISmartChargeManager pluginTimelineAddEvent:atDate:withBatteryLevel:](self, "pluginTimelineAddEvent:atDate:withBatteryLevel:", v16, v15, a3);

      -[PowerUISmartChargeManager setCheckpoint:withSelector:](self, "setCheckpoint:withSelector:", v11, a2);
      -[PowerUISmartChargeManager promptBDCToQueryCurrentState](self, "promptBDCToQueryCurrentState");
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.smartcharging.statechange"), "UTF8String"));

    }
    -[PowerUISmartChargeManager requestPeriodicCheck](self, "requestPeriodicCheck");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:](self, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", 0, 0, v12);

    -[PowerUISmartChargeManager setCheckpoint:withSelector:](self, "setCheckpoint:withSelector:", 0, a2);
    -[PowerUISmartChargeManager promptBDCToQueryCurrentState](self, "promptBDCToQueryCurrentState");
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.powerui.smartchargestatuschanged"), "UTF8String"));
  }
  v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)MEMORY[0x24BDD16E0];
    v19 = self->_checkpoint;
    v20 = v17;
    objc_msgSend(v18, "numberWithUnsignedInteger:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    *(_QWORD *)v23 = v21;
    _os_log_impl(&dword_215A71000, v20, OS_LOG_TYPE_DEFAULT, "Checkpoint through MCL: %@", (uint8_t *)&v22, 0xCu);

  }
}

- (id)shouldDisableChargingAtBatteryLevel:(unint64_t)a3 withPredictor:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:](self, "shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:", v8, a3, self->_signalsIgnored, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)shouldDisableChargingAsOfDate:(id)a3 atBatteryLevel:(unint64_t)a4 overrideAllSignals:(BOOL)a5 withPredictor:(id)a6 bypassSaved:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  PowerUIMLTwoStageModelPredictor *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *log;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  BOOL v36;
  __objc2_class **v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  NSObject *v50;
  void *v51;
  double v52;
  uint64_t v53;
  double v54;
  double v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  double v59;
  uint64_t v60;
  unint64_t v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v7 = a7;
  v67 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = (PowerUIMLTwoStageModelPredictor *)a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  v16 = v15;
  if (self->_isDesktopDevice)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_24D443A08, CFSTR("decisionMaker"));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Engage DEoC", buf, 2u);
    }
  }
  else
  {
    if (v7 && self->_modelTwoStagePredictor == v13)
    {
      objc_msgSend(v15, "dateByAddingTimeInterval:", -1800.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUIMLTwoStageModelPredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](v13, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", a4, v38, v16, 1, 20.0);
      v40 = v39;

      objc_msgSend(v16, "dateByAddingTimeInterval:", v40);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PowerUIMLTwoStageModelPredictor predictFullChargeDateWithBatteryLevel:](v13, "predictFullChargeDateWithBatteryLevel:", a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = v19;
    objc_msgSend(v19, "timeIntervalSinceDate:", v16);
    v21 = v20;
    if (v20 > *(double *)&kMaximumDurationUntilFullyCharged)
    {
      v22 = self->_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)MEMORY[0x24BDD16E0];
        v24 = v22;
        objc_msgSend(v23, "numberWithDouble:", v21 / 60.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v64 = v25;
        _os_log_impl(&dword_215A71000, v24, OS_LOG_TYPE_DEFAULT, "Very lengthy prediction (%@ mins); limiting idle time",
          buf,
          0xCu);

      }
      objc_msgSend(v16, "dateByAddingTimeInterval:", *(double *)&kMaximumDurationUntilFullyCharged);
      v26 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v26;
    }
    if (-[PowerUIMLTwoStageModelPredictor predictorType](v13, "predictorType") == 4)
      v27 = &unk_24D443A20;
    else
      v27 = &unk_24D443A38;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, CFSTR("decisionMaker"));
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("decisionDate"));
  objc_msgSend(v17, "timeIntervalSinceDate:", v16);
  if (v28 >= 0.0 && !a5)
  {
    -[PowerUISmartChargeManager computeSignalDeadline](self, "computeSignalDeadline");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager adjustedFullChargeDeadlineWithSignals:withDesktopMode:withFullChargeDeadline:withResult:](self, "adjustedFullChargeDeadlineWithSignals:withDesktopMode:withFullChargeDeadline:withResult:", v29, self->_isDesktopDevice, v17, v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("decisionDate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = a4;
    if (-[PowerUIBatteryMitigationManager mitigationsCurrentlyEnabled](self->_batteryMitigationManager, "mitigationsCurrentlyEnabled"))
    {
      v32 = self->_log;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v32, OS_LOG_TYPE_DEFAULT, "Gauging mitigations enabled, adjust deadline", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = v31;
    }
    if (!+[PowerUISmartChargeUtilities isDEoCDryRunSupported](PowerUISmartChargeUtilities, "isDEoCDryRunSupported"))goto LABEL_50;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v17, "isEqualToDate:", v34))
      goto LABEL_49;
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(&unk_24D4439A8, "isEqualToNumber:", v35) & 1) != 0)
    {
      v36 = -[PowerUITrialManager useTrialEnabledFeature:](self->_trialManager, "useTrialEnabledFeature:", CFSTR("disableLocationCheckForDEoC"));

      v37 = off_24D3FB000;
      if (v36)
        goto LABEL_50;
    }
    else
    {

      v37 = off_24D3FB000;
    }
    -[NSLock lock](self->_deocCurrentStatusLock, "lock");
    -[__objc2_class readDictForPreferenceKey:inDomain:](v37[12], "readDictForPreferenceKey:inDomain:", CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[PowerUISmartChargeManager shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:].cold.1();
      goto LABEL_48;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v34);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("limitCharge"));
    self->_isDesktopDevice = 0;
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      objc_msgSend(v41, "setObject:forKeyedSubscript:", &unk_24D443948, CFSTR("DEoCStatus"));
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[PowerUISmartChargeManager shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:].cold.2();
      goto LABEL_45;
    }
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(&unk_24D4439A8, "isEqualToNumber:", v43);

    if (v44)
    {
      v45 = &unk_24D443A20;
    }
    else
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(&unk_24D443A50, "isEqualToNumber:", v46);

      if (v47)
      {
        v45 = &unk_24D4439F0;
      }
      else
      {
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(&unk_24D443A68, "isEqualToNumber:", v48);

        if (!v49)
        {
          objc_msgSend(v41, "setObject:forKeyedSubscript:", &unk_24D443948, CFSTR("DEoCStatus"));
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
            -[PowerUISmartChargeManager shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:].cold.3();
          goto LABEL_45;
        }
        v45 = &unk_24D443A80;
      }
    }
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v45, CFSTR("DEoCStatus"));
LABEL_45:
    +[PowerUISmartChargeUtilities setDict:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDict:forPreferenceKey:inDomain:", v41, CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
    v50 = self->_log;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v41;
      _os_log_impl(&dword_215A71000, v50, OS_LOG_TYPE_DEFAULT, "SignalMonitors updated currentDEoCStatus: %@", buf, 0xCu);
    }

LABEL_48:
    -[NSLock unlock](self->_deocCurrentStatusLock, "unlock");
LABEL_49:

LABEL_50:
    a4 = v62;
    goto LABEL_51;
  }
  v33 = self->_log;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, v33, OS_LOG_TYPE_DEFAULT, "Ignoring all signals", buf, 2u);
  }
  v30 = v14;
LABEL_51:
  -[PowerUISmartChargeManager setFullChargeDeadline:](self, "setFullChargeDeadline:", v17);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v51, "timeIntervalSinceDate:", v16);
  if (v52 > 0.0)
    -[PowerUISmartChargeManager recomputeEmpiricalTimeToFullCharge](self, "recomputeEmpiricalTimeToFullCharge");
  v53 = MEMORY[0x24BDBD1C0];
  -[PowerUISmartChargeManager durationToFullChargeFromBatteryLevel:includeTLCDelay:](self, "durationToFullChargeFromBatteryLevel:includeTLCDelay:", a4, 1);
  v55 = v54;
  v56 = self->_log;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = v56;
    objc_msgSend(v16, "dateByAddingTimeInterval:", v55);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v64 = v51;
    v65 = 2112;
    v66 = v58;
    _os_log_impl(&dword_215A71000, v57, OS_LOG_TYPE_DEFAULT, "Deadline for full charge is: %@ and resuming now would get us there by %@", buf, 0x16u);

  }
  objc_msgSend(v51, "timeIntervalSinceDate:", v16);
  if (v59 <= v55)
    v60 = v53;
  else
    v60 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v60, CFSTR("shouldDisableCharging"));

  return v30;
}

- (BOOL)shouldDisableChargingOverrideModel:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  NSObject *log;
  NSObject *v22;
  void *v23;
  double v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[PowerUISmartChargeManager fullChargeDeadlineOverride](self, "fullChargeDeadlineOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager engagementTimeOverride](self, "engagementTimeOverride");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[PowerUISmartChargeManager engagementTimeOverride](self, "engagementTimeOverride"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "timeIntervalSinceDate:", v9),
        v11 = v10,
        v9,
        v8,
        v11 < 0.0))
  {
    v12 = 0;
  }
  else
  {
    -[PowerUISmartChargeManager fullChargeDeadlineOverride](self, "fullChargeDeadlineOverride");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_overrideAllSignals)
    {
      -[PowerUISmartChargeManager computeSignalDeadline](self, "computeSignalDeadline");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("decisionDate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_deadlineSignalID = objc_msgSend(v16, "integerValue");

      objc_msgSend(v13, "earlierDate:", v15);
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v17;
    }
    -[PowerUISmartChargeManager setFullChargeDeadline:](self, "setFullChargeDeadline:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PowerUISmartChargeManager durationToFullChargeFromBatteryLevel:includeTLCDelay:](self, "durationToFullChargeFromBatteryLevel:includeTLCDelay:", a3, 1);
    v20 = v19;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v22 = log;
      objc_msgSend(v6, "dateByAddingTimeInterval:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v18;
      v28 = 2112;
      v29 = v23;
      _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "Deadline for full charge is: %@ and resuming now would get us there by %@", (uint8_t *)&v26, 0x16u);

    }
    objc_msgSend(v18, "timeIntervalSinceDate:", v6);
    v12 = v24 > v20;

  }
  return v12;
}

- (BOOL)shouldOBCRoutineReengage
{
  return 0;
}

- (id)chargePrediction:(unint64_t)a3 fullyCharged:(BOOL)a4 previousCheckpoint:(unint64_t)a5 predictor:(unint64_t)a6
{
  _BOOL4 v8;
  void *v11;
  _BOOL4 v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  int v20;
  PowerUIMLTwoStageModelPredictor *modelTwoStagePredictor;
  int v22;
  void *v23;
  void *v24;
  unint64_t v25;
  char v26;
  char v27;
  unint64_t v28;
  NSNumber *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  _BOOL4 v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  NSObject *v39;
  _QWORD block[5];
  uint8_t buf[4];
  int v42;
  uint64_t v43;

  v8 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24D443900, CFSTR("decisionMaker"));
  if (a5)
    goto LABEL_2;
  v17 = -[PowerUISmartChargeManager deviceWasRecentlyConnectedToCharger](self, "deviceWasRecentlyConnectedToCharger");
  if ((a3 < 0x50 || v17) && !self->_isDesktopDevice)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v33, CFSTR("checkpoint"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v34, CFSTR("shouldDisableCharging"));

    -[PowerUISmartChargeManager log](self, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (a3 > 0x4F)
    {
      if (v35)
      {
        *(_WORD *)buf = 0;
        v36 = "Skipping prediction check: Device was just recently plugged-in";
        v37 = v15;
        v38 = 2;
        goto LABEL_82;
      }
    }
    else if (v35)
    {
      *(_DWORD *)buf = 67109120;
      v42 = 80;
      v36 = "Skipping prediction check: Battery level below %d%%";
      v37 = v15;
      v38 = 8;
LABEL_82:
      _os_log_impl(&dword_215A71000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
    }
LABEL_83:
    v16 = &unk_24D443900;
    goto LABEL_63;
  }
  if ((a3 > 0x5F || v8) && !self->_isDesktopDevice && !self->_remoteOBCEngaged)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("checkpoint"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("shouldDisableCharging"));

    -[PowerUISmartChargeManager log](self, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[PowerUISmartChargeManager chargePrediction:fullyCharged:previousCheckpoint:predictor:].cold.1();
    goto LABEL_83;
  }
LABEL_2:
  v12 = -[PowerUISmartChargeManager shouldOBCRoutineReengage](self, "shouldOBCRoutineReengage");
  switch(a6)
  {
    case 4uLL:
      v22 = a5 < 5 || v12;
      if (v22 != 1)
        goto LABEL_36;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __88__PowerUISmartChargeManager_chargePrediction_fullyCharged_previousCheckpoint_predictor___block_invoke;
      block[3] = &unk_24D3FB7B0;
      block[4] = self;
      if (chargePrediction_fullyCharged_previousCheckpoint_predictor__onceToken != -1)
        dispatch_once(&chargePrediction_fullyCharged_previousCheckpoint_predictor__onceToken, block);
      modelTwoStagePredictor = (PowerUIMLTwoStageModelPredictor *)chargePrediction_fullyCharged_previousCheckpoint_predictor__sleepPredictor;
      break;
    case 2uLL:
      v20 = a5 < 5 || v12;
      if (v20 != 1)
        goto LABEL_36;
      modelTwoStagePredictor = self->_modelTwoStagePredictor;
      break;
    case 0xFFFFFFFFFFFFFFFFLL:
      v13 = a5 < 5 || v12;
      if (v13 == 1)
      {
        v14 = -[PowerUISmartChargeManager shouldDisableChargingOverrideModel:](self, "shouldDisableChargingOverrideModel:", a3);
        v15 = 0;
        v16 = &unk_24D443900;
        if (a5)
          goto LABEL_40;
        goto LABEL_33;
      }
LABEL_36:
      v15 = 0;
      v14 = 0;
      v16 = &unk_24D443900;
      goto LABEL_37;
    default:
      v14 = 0;
      v15 = 0;
      v16 = &unk_24D443900;
      goto LABEL_40;
  }
  -[PowerUISmartChargeManager shouldDisableChargingAtBatteryLevel:withPredictor:](self, "shouldDisableChargingAtBatteryLevel:withPredictor:", a3, modelTwoStagePredictor);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("decisionDate"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("shouldDisableCharging"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v24, "BOOLValue");

  if (a5)
    goto LABEL_40;
LABEL_33:
  if ((v14 & 1) != 0)
  {
    v14 = 1;
    if (a3 <= 0x4F)
    {
      v25 = 1;
      goto LABEL_65;
    }
    v25 = 2;
    goto LABEL_62;
  }
LABEL_40:
  if (!a5 && !(_DWORD)v14)
  {
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v16, CFSTR("lastNonEngagementSignalID"));
    objc_storeStrong((id *)&self->_lastNonEngagementSignalID, v16);
LABEL_58:
    v29 = self->_lastNonEngagementSignalID;

    v25 = 6;
    v16 = v29;
LABEL_59:
    if (a5 - 5 <= 1 && v8)
    {
      self->_OBCReengagementEvaluated = 0;
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.smartcharging.statechange"), "UTF8String"));
      v25 = 7;
    }
    goto LABEL_62;
  }
  v26 = v14 ^ 1;
  if (a5 == 1)
    v27 = v14 ^ 1;
  else
    v27 = 0;
  if ((v27 & 1) != 0)
  {
    v14 = 0;
    goto LABEL_58;
  }
  if (a5 - 5 <= 0xFFFFFFFFFFFFFFFCLL)
    v26 = 0;
  if ((v26 & 1) == 0)
  {
    if (a5 <= 4)
    {
      if (a3 > 0x4F)
      {
        v28 = 4;
        if (a5 != 3)
          v28 = a5;
        if (a5 == 1)
          v25 = 2;
        else
          v25 = v28;
        goto LABEL_62;
      }
      v25 = a5;
LABEL_65:
      if (a3 > 0x4B)
      {
        if (a5 != 3 && v25 != 1 && v25 != 2 && v25 != 4)
        {
          -[PowerUISmartChargeManager log](self, "log");
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[PowerUISmartChargeManager chargePrediction:fullyCharged:previousCheckpoint:predictor:].cold.2();

        }
      }
      else if (a5 == 4 || a5 == 2)
      {
        v25 = 3;
      }
      goto LABEL_62;
    }
LABEL_37:
    v25 = a5;
    if (a5 != 6)
      goto LABEL_59;
    goto LABEL_58;
  }
  v14 = 0;
  v25 = 5;
LABEL_62:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, CFSTR("checkpoint"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, CFSTR("shouldDisableCharging"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("decisionMaker"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("decisionDate"));
LABEL_63:

  return v11;
}

void __88__PowerUISmartChargeManager_chargePrediction_fullyCharged_previousCheckpoint_predictor___block_invoke(uint64_t a1)
{
  PowerUISleepBasedPredictor *v1;
  void *v2;

  v1 = -[PowerUISleepBasedPredictor initWithLog:]([PowerUISleepBasedPredictor alloc], "initWithLog:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = (void *)chargePrediction_fullyCharged_previousCheckpoint_predictor__sleepPredictor;
  chargePrediction_fullyCharged_previousCheckpoint_predictor__sleepPredictor = (uint64_t)v1;

}

- (id)stringFromInterval:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = stringFromInterval__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&stringFromInterval__onceToken, &__block_literal_global_825);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (void *)stringFromInterval__formatter;
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)stringFromInterval__formatter;
  objc_msgSend(v4, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ - %@"), v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __48__PowerUISmartChargeManager_stringFromInterval___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)stringFromInterval__formatter;
  stringFromInterval__formatter = (uint64_t)v0;

  objc_msgSend((id)stringFromInterval__formatter, "setDateStyle:", 1);
  return objc_msgSend((id)stringFromInterval__formatter, "setTimeStyle:", 1);
}

- (id)timeStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = timeStringFromDate__onceToken_1;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&timeStringFromDate__onceToken_1, &__block_literal_global_828);
  objc_msgSend((id)timeStringFromDate__formatter_1, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __48__PowerUISmartChargeManager_timeStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)timeStringFromDate__formatter_1;
  timeStringFromDate__formatter_1 = (uint64_t)v0;

  objc_msgSend((id)timeStringFromDate__formatter_1, "setDateStyle:", 0);
  return objc_msgSend((id)timeStringFromDate__formatter_1, "setTimeStyle:", 1);
}

- (void)recomputeEmpiricalTimeToFullCharge
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  NSObject *log;
  double empiricalTimeToFullChargeDurationMinutes;
  void *v14;
  int v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!recomputeEmpiricalTimeToFullCharge_lastComputedDate
    || (objc_msgSend((id)recomputeEmpiricalTimeToFullCharge_lastComputedDate, "timeIntervalSinceDate:", v3),
        v4 < -43200.0))
  {
    objc_storeStrong((id *)&recomputeEmpiricalTimeToFullCharge_lastComputedDate, v3);
    +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:](PowerUISmartChargeUtilities, "historicalFullChargeDurationStartingAt:withMinimumPluginDuration:", 80, 1200);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") >= 3)
    {
      objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 2);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    objc_msgSend(v5, "percentile:", 0.95);
    v9 = v8 / 60.0;
    v10 = objc_msgSend(v5, "count");
    v11 = fmax(fmin(v9, 180.0), 40.0);
    if (v10 <= 3)
      v11 = 90.0;
    self->_empiricalTimeToFullChargeDurationMinutes = v11;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      empiricalTimeToFullChargeDurationMinutes = self->_empiricalTimeToFullChargeDurationMinutes;
      v15 = 134218240;
      v16 = v9;
      v17 = 2048;
      v18 = empiricalTimeToFullChargeDurationMinutes;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Recompiled empirical TTFC - raw: %f, adjusted: %f", (uint8_t *)&v15, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_empiricalTimeToFullChargeDurationMinutes);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v14, CFSTR("empiricalFullChargeDuration"));

  }
}

- (double)durationToFullChargeFromBatteryLevel:(unint64_t)a3
{
  double result;

  -[PowerUISmartChargeManager durationToFullChargeFromBatteryLevel:includeTLCDelay:](self, "durationToFullChargeFromBatteryLevel:includeTLCDelay:", a3, 0);
  return result;
}

- (double)durationToFullChargeFromBatteryLevel:(unint64_t)a3 includeTLCDelay:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *log;
  double v10;
  NSObject *v11;
  double empiricalTimeToFullChargeDurationMinutes;
  double v13;
  double v14;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    +[PowerUISmartChargeUtilities batteryProperties](PowerUISmartChargeUtilities, "batteryProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ChargerData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NotChargingReason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "unsignedLongLongValue") & 0x11E) != 0)
    {
      if (self->_checkpoint - 5 <= 4)
        self->_encounteredTLCDuringTopOff = 1;
      log = self->_log;
      v10 = 2700.0;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v11 = log;
        v16 = 134217984;
        v17 = objc_msgSend(v8, "unsignedLongLongValue");
        _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "TLC Engaged; Projecting additional charge delay (Not Charging reason: %llu)",
          (uint8_t *)&v16,
          0xCu);

      }
    }
    else
    {
      v10 = 900.0;
    }

  }
  else
  {
    v10 = 900.0;
  }
  empiricalTimeToFullChargeDurationMinutes = self->_empiricalTimeToFullChargeDurationMinutes;
  if (empiricalTimeToFullChargeDurationMinutes <= 2.22507386e-308)
    empiricalTimeToFullChargeDurationMinutes = 90.0;
  v13 = empiricalTimeToFullChargeDurationMinutes / 20.0 * (double)(100 - a3);
  v14 = empiricalTimeToFullChargeDurationMinutes + 80.0 - (double)a3;
  if (a3 > 0x4F)
    v14 = v13;
  return v10 + v14 * 60.0;
}

- (unint64_t)projectedBatteryLevelForDuration:(unint64_t)a3 withInitialBatteryLevel:(unint64_t)a4
{
  double v6;

  -[PowerUISmartChargeManager durationToFullChargeFromBatteryLevel:](self, "durationToFullChargeFromBatteryLevel:", a4);
  if (v6 <= (double)a3)
    return 100;
  else
    return (unint64_t)((double)(100 - a4) / (v6 / (double)a3)) + a4;
}

- (BOOL)deviceHasEnoughPluggedInTime
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("activityMinHistory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = (double)(int)objc_msgSend(v3, "intValue");
  else
    v5 = 14.0;
  v6 = +[PowerUISmartChargeUtilities deviceHasEnoughPluggedInTimeWithMinimumDays:withContext:withDefaultsDomain:](PowerUISmartChargeUtilities, "deviceHasEnoughPluggedInTimeWithMinimumDays:withContext:withDefaultsDomain:", self->_context, self->_defaultsDomain, v5);

  return v6;
}

- (id)desktopModeOverride
{
  return -[PowerUISmartChargeManager readStringForPreferenceKey:](self, "readStringForPreferenceKey:", CFSTR("overrideDesktopMode"));
}

- (void)evaluateIfDesktopDeviceForced:(BOOL)a3
{
  self->_isDesktopDevice = 0;
}

- (void)forceDEoCReevaluation
{
  -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:](self, "cacheCurrentDEoCBehaviorForced:", 1);
  -[PowerUISmartChargeManager evaluateIfDEoCDevice](self, "evaluateIfDEoCDevice");
}

- (void)cacheCurrentDEoCBehaviorForced:(BOOL)a3
{
  void *v5;
  __objc2_class **v6;
  NSObject *log;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  _BOOL8 v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 isDesktopDevice;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  double v56;
  unint64_t v57;
  unint64_t v58;
  NSObject *v59;
  PowerUITrialManager *trialManager;
  NSObject *v61;
  void *v62;
  void *v63;
  PowerUIMLRelevantDrainPredictor *v64;
  void *v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  NSObject *v77;
  NSObject *v78;
  const char *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  NSObject *v92;
  _BOOL4 v93;
  NSObject *v94;
  uint64_t v95;
  int v96;
  NSObject *v97;
  _BOOL4 v98;
  NSObject *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  const __CFString *v108;
  NSObject *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  NSObject *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  unint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  char v131;
  void *v132;
  BOOL v133;
  NSArray *v134;
  void *v135;
  id obj;
  uint8_t v137;
  char v138[15];
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint8_t v147[128];
  uint8_t buf[4];
  uint64_t v149;
  __int16 v150;
  void *v151;
  __int16 v152;
  const __CFString *v153;
  __int16 v154;
  unint64_t v155;
  __int16 v156;
  const __CFString *v157;
  __int16 v158;
  unint64_t v159;
  _BYTE v160[128];
  uint64_t v161;

  v161 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)os_transaction_create();
  v6 = off_24D3FB000;
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("Beginning of cacheCurrentDEoC"));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:].cold.6((unsigned __int8 *)self, log);
  if (!+[PowerUISmartChargeUtilities isOBCSupported](PowerUISmartChargeUtilities, "isOBCSupported")
    || !+[PowerUISmartChargeUtilities isDEoCDryRunSupported](PowerUISmartChargeUtilities, "isDEoCDryRunSupported"))
  {
    goto LABEL_40;
  }
  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", self->_context)&& !a3)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:].cold.5();
    goto LABEL_40;
  }
  v133 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24D443A38, CFSTR("DEoCStatus"));
  v9 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("cacheDate"));

  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("committedDate"));

  if (-[PowerUISmartChargeManager isDEoCSupported](self, "isDEoCSupported"))
    v12 = MEMORY[0x24BDBD1C0];
  else
    v12 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("dryRun"));
  v13 = 0x24BDD1000uLL;
  if (self->_temporarilyDisabled)
  {
    v14 = &unk_24D443A98;
LABEL_19:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("DEoCStatus"));
    -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("forcedDEoC"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (!self->_enabled || !self->_deocFeatureState)
  {
    v14 = &unk_24D443AB0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isLowPowerModeEnabled");

  if ((v16 & 1) != 0)
  {
    v14 = &unk_24D443AC8;
    goto LABEL_19;
  }
  if (self->_deocFeatureState != 1)
  {
    v30 = self->_log;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:].cold.4((uint64_t *)&self->_deocFeatureState, v30, v31);
    v14 = &unk_24D443930;
    goto LABEL_19;
  }
  if (-[PowerUIBatteryMitigationManager mitigationsCurrentlyEnabled](self->_batteryMitigationManager, "mitigationsCurrentlyEnabled"))
  {
    v14 = &unk_24D443AE0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities drainSessionsInfoBetweenRelevantChargesBefore:withMinimumDuration:](PowerUISmartChargeUtilities, "drainSessionsInfoBetweenRelevantChargesBefore:withMinimumDuration:", v32, 0.0);
  v33 = objc_claimAutoreleasedReturnValue();

  v34 = self->_log;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v149 = v33;
    _os_log_impl(&dword_215A71000, v34, OS_LOG_TYPE_DEFAULT, "Drain sessions info found: %@", buf, 0xCu);
  }
  +[PowerUISmartChargeUtilities drainBetweenRelevantEventsFromDrainSessionInfo:](PowerUISmartChargeUtilities, "drainBetweenRelevantEventsFromDrainSessionInfo:", v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self->_log;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v36;
    v38 = objc_msgSend(v35, "count");
    *(_DWORD *)buf = 134217984;
    v149 = v38;
    _os_log_impl(&dword_215A71000, v37, OS_LOG_TYPE_DEFAULT, "Found %lu instances of historic drain between relevant charge sessions", buf, 0xCu);

  }
  if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(v35, "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, CFSTR("mostRecentDrain"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24D443900, CFSTR("mostRecentDrain"));
  }
  if (kMaxDEoCBatteryDrain)
    v40 = 60;
  else
    v40 = 70;
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("DEoCThresholdOverride"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = self->_log;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v44 = objc_msgSend(v41, "intValue");
      *(_DWORD *)buf = 67109120;
      LODWORD(v149) = v44;
      _os_log_impl(&dword_215A71000, v43, OS_LOG_TYPE_DEFAULT, "Using DEoC override value: %d", buf, 8u);

    }
    v40 = objc_msgSend(v41, "intValue");
  }
  v127 = v41;
  v128 = v5;
  v129 = (void *)v33;
  v130 = v8;
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  obj = v35;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v160, 16);
  if (v45)
  {
    v46 = v45;
    v47 = 0;
    v48 = *(_QWORD *)v144;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v144 != v48)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
        v51 = self->_log;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v149 = (uint64_t)v50;
          _os_log_impl(&dword_215A71000, v51, OS_LOG_TYPE_DEFAULT, "  drain: %@", buf, 0xCu);
        }
        if ((int)objc_msgSend(v50, "intValue") >= v40)
          ++v47;
      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v160, 16);
    }
    while (v46);
  }
  else
  {
    v47 = 0;
  }

  v52 = self->_log;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v149 = v47;
    v150 = 2048;
    v151 = (void *)v40;
    _os_log_impl(&dword_215A71000, v52, OS_LOG_TYPE_DEFAULT, "Found %lu instances of historic drain above the threshold of %lu between relevant charge sessions", buf, 0x16u);
  }
  objc_msgSend(v129, "firstObject");
  v53 = objc_claimAutoreleasedReturnValue();
  v5 = v128;
  v126 = (void *)v53;
  if (v53)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v53, "objectForKeyedSubscript:", CFSTR("start"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "timeIntervalSinceDate:", v55);
    v53 = (int)v56 / 86400;

  }
  v57 = -[PowerUITrialManager longFactorForName:](self->_trialManager, "longFactorForName:", CFSTR("minDaysOfChargingHistoryRequiredForDEoCModel"));
  v58 = -[PowerUITrialManager longFactorForName:](self->_trialManager, "longFactorForName:", CFSTR("minNumberOfRelevantDrainsRequiredForDEoCModel"));
  v59 = self->_log;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    trialManager = self->_trialManager;
    v61 = v59;
    -[PowerUITrialManager experimentID](trialManager, "experimentID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUITrialManager treatmentID](self->_trialManager, "treatmentID");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v149 = (uint64_t)v62;
    v150 = 2112;
    v151 = v63;
    v152 = 2112;
    v153 = CFSTR("minDaysOfChargingHistoryRequiredForDEoCModel");
    v154 = 2048;
    v155 = v57;
    v156 = 2112;
    v157 = CFSTR("minNumberOfRelevantDrainsRequiredForDEoCModel");
    v158 = 2048;
    v159 = v58;
    _os_log_impl(&dword_215A71000, v61, OS_LOG_TYPE_DEFAULT, "DEoC Trial parameters from experiment: %@ and treatment: %@ \n loaded: \n %@:%ld \n %@:%ld", buf, 0x3Eu);

  }
  if (v53 < v57)
  {
    objc_msgSend(v130, "setObject:forKeyedSubscript:", &unk_24D443AF8, CFSTR("DEoCStatus"));
    v125 = v53;
    v8 = v130;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("daysSinceFirstChargeSession : %ld < minDaysOfChargingHistoryRequiredForDEoCModel : %ld"), v125, v57);
    v64 = (PowerUIMLRelevantDrainPredictor *)objc_claimAutoreleasedReturnValue();
    v65 = v130;
LABEL_84:
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v64, CFSTR("reasonString"));
    v66 = 0;
    goto LABEL_85;
  }
  if (objc_msgSend(v129, "count") < v58)
  {
    v8 = v130;
    objc_msgSend(v130, "setObject:forKeyedSubscript:", &unk_24D443B10, CFSTR("DEoCStatus"));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("numberOfHistoricalDrainSessions : %ld < minNumberOfRelevantDrainsRequiredForDEoCModel : %ld"), objc_msgSend(v129, "count"), v58);
    v64 = (PowerUIMLRelevantDrainPredictor *)objc_claimAutoreleasedReturnValue();
    v65 = v130;
    goto LABEL_84;
  }
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v134 = self->_monitors;
  v67 = -[NSArray countByEnumeratingWithState:objects:count:](v134, "countByEnumeratingWithState:objects:count:", &v139, v147, 16);
  if (!v67)
  {

    v6 = off_24D3FB000;
    v8 = v130;
    v9 = 0x24BDBC000uLL;
    goto LABEL_119;
  }
  v68 = v67;
  v131 = 1;
  v69 = *(_QWORD *)v140;
  do
  {
    for (j = 0; j != v68; ++j)
    {
      if (*(_QWORD *)v140 != v69)
        objc_enumerationMutation(v134);
      v71 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * j);
      if (!-[PowerUITrialManager useTrialEnabledFeature:](self->_trialManager, "useTrialEnabledFeature:", CFSTR("disableLocationCheckForDEoC"))|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(v71, "requiredFullChargeDate");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v73)
          goto LABEL_113;
        objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v73, "isEqualToDate:", v74);

        if (!v75)
          goto LABEL_113;
        v76 = objc_msgSend(v71, "signalID");
        switch(v76)
        {
          case 3:
            objc_msgSend(v130, "setObject:forKeyedSubscript:", &unk_24D443A80, CFSTR("DEoCStatus"));
            v80 = self->_log;
            v131 = 0;
            if (!os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              goto LABEL_113;
            *(_WORD *)buf = 0;
            v78 = v80;
            v79 = "Opting out of DEoC due to calendar";
            break;
          case 5:
            objc_msgSend(v130, "setObject:forKeyedSubscript:", &unk_24D4439F0, CFSTR("DEoCStatus"));
            v81 = self->_log;
            v131 = 0;
            if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
              goto LABEL_113;
            *(_WORD *)buf = 0;
            v78 = v81;
            v79 = "Opting out of DEoC due to wallet";
            break;
          case 4:
            objc_msgSend(v130, "setObject:forKeyedSubscript:", &unk_24D443A20, CFSTR("DEoCStatus"));
            v77 = self->_log;
            v131 = 0;
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v78 = v77;
              v79 = "Opting out of DEoC due to location";
              break;
            }
LABEL_113:

            continue;
          default:
            objc_msgSend(v130, "setObject:forKeyedSubscript:", &unk_24D443948, CFSTR("DEoCStatus"));
            v82 = self->_log;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
              -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:].cold.3(&v137, v138, v82);
LABEL_112:
            v131 = 0;
            goto LABEL_113;
        }
        _os_log_impl(&dword_215A71000, v78, OS_LOG_TYPE_DEFAULT, v79, buf, 2u);
        goto LABEL_112;
      }
      v72 = self->_log;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v72, OS_LOG_TYPE_DEFAULT, "Skipping location check for DEoC", buf, 2u);
      }
    }
    v68 = -[NSArray countByEnumeratingWithState:objects:count:](v134, "countByEnumeratingWithState:objects:count:", &v139, v147, 16);
  }
  while (v68);

  v6 = off_24D3FB000;
  v8 = v130;
  v9 = 0x24BDBC000;
  v66 = v131;
  if ((v131 & 1) != 0)
  {
LABEL_119:
    v64 = -[PowerUIMLRelevantDrainPredictor initWithDefaultsDomain:withContextStore:withTrialManager:]([PowerUIMLRelevantDrainPredictor alloc], "initWithDefaultsDomain:withContextStore:withTrialManager:", self->_defaultsDomain, self->_context, self->_trialManager);
    v83 = -[__objc2_class currentBatteryLevelWithContext:](v6[12], "currentBatteryLevelWithContext:", self->_context);
    objc_msgSend(*(id *)(v9 + 3680), "date");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUIMLRelevantDrainPredictor featuresForChargeSessionAtDate:withChargeStartSoC:withChargeAndDrainSessionHistory:](v64, "featuresForChargeSessionAtDate:withChargeStartSoC:withChargeAndDrainSessionHistory:", v84, v85, v129);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainwithFeatures:](v64, "predictedRelevantDrainwithFeatures:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainWithFeatures:forSchemes:](v64, "predictedRelevantDrainWithFeatures:forSchemes:", v86, &unk_24D44AC68);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "objectForKey:", &unk_24D443B28);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v89;
    if (v89)
    {
      v135 = v88;
      v91 = objc_msgSend(v89, "significantDrainAhead");
      v92 = self->_log;
      v93 = os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);
      if (v91)
      {
        if (v93)
        {
          v94 = v92;
          objc_msgSend(v90, "confidence");
          *(_DWORD *)buf = 134217984;
          v149 = v95;
          _os_log_impl(&dword_215A71000, v94, OS_LOG_TYPE_DEFAULT, "80%% model predicts deep drain ahead, check 95%% model. (confidence: %f)", buf, 0xCu);

        }
        objc_msgSend(v135, "objectForKey:", &unk_24D443B40);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        if (v132)
        {
          v96 = objc_msgSend(v132, "significantDrainAhead");
          v97 = self->_log;
          v98 = os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
          if (v96)
          {
            if (v98)
            {
              v99 = v97;
              objc_msgSend(v132, "confidence");
              *(_DWORD *)buf = 134217984;
              v149 = v100;
              _os_log_impl(&dword_215A71000, v99, OS_LOG_TYPE_DEFAULT, "95%% model predicts deep drain ahead, do not engage. (confidence: %f)", buf, 0xCu);

            }
            v8 = v130;
            objc_msgSend(v130, "setObject:forKeyedSubscript:", &unk_24D4438D0, CFSTR("DEoCStatus"));
            v101 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v132, "description");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "stringWithFormat:", CFSTR("Prediction output %@"), v102);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "setObject:forKeyedSubscript:", v103, CFSTR("reasonString"));

            -[PowerUIMLRelevantDrainPredictor analyticsEventFromFeatures:](v64, "analyticsEventFromFeatures:", v86);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "setObject:forKeyedSubscript:", v104, CFSTR("featureAnalytics"));

            v105 = (void *)MEMORY[0x24BDD16E0];
            -[PowerUIMLRelevantDrainPredictor threshold](v64, "threshold");
            objc_msgSend(v105, "numberWithDouble:");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "setObject:forKeyedSubscript:", v106, CFSTR("modelThreshold"));

            v107 = &unk_24D443948;
            v108 = CFSTR("socLimit");
            goto LABEL_137;
          }
          if (v98)
          {
            v117 = v97;
            objc_msgSend(v132, "confidence");
            *(_DWORD *)buf = 134217984;
            v149 = v118;
            _os_log_impl(&dword_215A71000, v117, OS_LOG_TYPE_DEFAULT, "95%% model engaged. (confidence: %f)", buf, 0xCu);

          }
          v8 = v130;
          objc_msgSend(v130, "setObject:forKeyedSubscript:", &unk_24D443A68, CFSTR("DEoCStatus"));
          v119 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v132, "description");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "stringWithFormat:", CFSTR("Prediction output %@"), v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "setObject:forKeyedSubscript:", v121, CFSTR("reasonString"));

          -[PowerUIMLRelevantDrainPredictor analyticsEventFromFeatures:](v64, "analyticsEventFromFeatures:", v86);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "setObject:forKeyedSubscript:", v122, CFSTR("featureAnalytics"));

          v123 = (void *)MEMORY[0x24BDD16E0];
          -[PowerUIMLRelevantDrainPredictor threshold](v64, "threshold");
          objc_msgSend(v123, "numberWithDouble:");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "setObject:forKeyedSubscript:", v124, CFSTR("modelThreshold"));

          objc_msgSend(v130, "setObject:forKeyedSubscript:", &unk_24D443B58, CFSTR("socLimit"));
          v66 = 1;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_FAULT))
            -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:].cold.1();
          v107 = &unk_24D443930;
          v108 = CFSTR("DEoCStatus");
          v8 = v130;
LABEL_137:
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v107, v108);
          v66 = 0;
        }
        v5 = v128;

      }
      else
      {
        if (v93)
        {
          v109 = v92;
          objc_msgSend(v90, "confidence");
          *(_DWORD *)buf = 134217984;
          v149 = v110;
          _os_log_impl(&dword_215A71000, v109, OS_LOG_TYPE_DEFAULT, "80%% model engaged. (confidence: %f)", buf, 0xCu);

        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24D443A68, CFSTR("DEoCStatus"));
        v111 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v90, "description");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "stringWithFormat:", CFSTR("Prediction output %@"), v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v113, CFSTR("reasonString"));

        -[PowerUIMLRelevantDrainPredictor analyticsEventFromFeatures:](v64, "analyticsEventFromFeatures:", v86);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v114, CFSTR("featureAnalytics"));

        v115 = (void *)MEMORY[0x24BDD16E0];
        -[PowerUIMLRelevantDrainPredictor threshold](v64, "threshold");
        objc_msgSend(v115, "numberWithDouble:");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v116, CFSTR("modelThreshold"));

        objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24D443B70, CFSTR("socLimit"));
        v66 = 1;
      }
      v88 = v135;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_FAULT))
        -[PowerUISmartChargeManager cacheCurrentDEoCBehaviorForced:].cold.1();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24D443930, CFSTR("DEoCStatus"));
      v66 = 0;
    }

LABEL_85:
    v6 = off_24D3FB000;
    v9 = 0x24BDBC000;

  }
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("forcedDEoC"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v66 & 1) != 0)
  {
    v18 = 1;
    v13 = 0x24BDD1000;
  }
  else
  {
    v13 = 0x24BDD1000;
LABEL_20:
    v18 = 0;
    if (-[__objc2_class isInternalBuild](v6[12], "isInternalBuild") && v17)
    {
      if (objc_msgSend(v17, "BOOLValue"))
      {
        v19 = self->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v19, OS_LOG_TYPE_DEFAULT, "DEoC engagement forced by internal settings override", buf, 2u);
        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24D443B88, CFSTR("DEoCStatus"));
        v18 = 1;
      }
      else
      {
        v18 = 0;
      }
    }
  }
  objc_msgSend(*(id *)(v13 + 1760), "numberWithBool:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("limitCharge"));

  self->_isDesktopDevice = v18;
  v21 = self->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    isDesktopDevice = self->_isDesktopDevice;
    *(_DWORD *)buf = 67109120;
    LODWORD(v149) = isDesktopDevice;
    _os_log_impl(&dword_215A71000, v21, OS_LOG_TYPE_DEFAULT, "Device is detected to be eligible for DEoC: %hhd", buf, 8u);
  }
  -[NSLock lock](self->_deocCurrentStatusLock, "lock");
  if (!v133)
  {
    -[__objc2_class readDictForPreferenceKey:inDomain:](v6[12], "readDictForPreferenceKey:inDomain:", CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v9 + 3680), "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("committedDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceDate:", v25);
    v27 = v26;

    if (v27 > 0.0 && v27 < 20.0)
    {
      v28 = self->_log;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v28, OS_LOG_TYPE_DEFAULT, "Abort caching the DEoC state, we are commited to current cache!", buf, 2u);
      }
      -[NSLock unlock](self->_deocCurrentStatusLock, "unlock");

      goto LABEL_39;
    }

  }
  -[__objc2_class setDict:forPreferenceKey:inDomain:](v6[12], "setDict:forPreferenceKey:inDomain:", v8, CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
  v29 = self->_log;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v149 = (uint64_t)v8;
    _os_log_impl(&dword_215A71000, v29, OS_LOG_TYPE_DEFAULT, "Saved current DEoC status: %@", buf, 0xCu);
  }
  -[NSLock unlock](self->_deocCurrentStatusLock, "unlock");
  -[__objc2_class logMemoryUsageInternalForEvent:](v6[12], "logMemoryUsageInternalForEvent:", CFSTR("End of cacheCurrentDEoC"));
LABEL_39:

LABEL_40:
}

- (void)evaluateChargeLimitRecommendationForced:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *log;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  unsigned int v20;
  NSObject *v21;
  PowerUISmartChargeManager *v22;
  uint64_t v23;
  uint64_t v24;
  signed int v25;
  signed int v26;
  signed int v27;
  signed int v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  NSObject *v32;
  BOOL v33;
  PowerUISmartChargeManager *v34;
  unint64_t v35;
  __objc2_class **v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  unint64_t v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  NSObject *v48;
  _BOOL4 manualChargeLimitWasEverEnabled;
  unint64_t recommendedLimit;
  int mclTargetSoC;
  void *v52;
  unint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  signed int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  _BYTE v71[14];
  __int16 v72;
  int v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities drainSessionsInfoBetweenRelevantChargesBefore:withMinimumDuration:](PowerUISmartChargeUtilities, "drainSessionsInfoBetweenRelevantChargesBefore:withMinimumDuration:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("start"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = (int)v11 / 86400;

  }
  else
  {
    v12 = 0;
  }
  if (v12 > 0xB || a3)
  {
    +[PowerUISmartChargeUtilities drainBetweenRelevantEventsFromDrainSessionInfo:](PowerUISmartChargeUtilities, "drainBetweenRelevantEventsFromDrainSessionInfo:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v16 = log;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v71 = objc_msgSend(v14, "count");
      _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Found %lu instances of historic drain between relevant charge sessions", buf, 0xCu);

    }
    if ((unint64_t)objc_msgSend(v14, "count") <= 0xD && !a3)
    {
      v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = objc_msgSend(v14, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v71 = v19;
        _os_log_impl(&dword_215A71000, v18, OS_LOG_TYPE_DEFAULT, "Only %lu available", buf, 0xCu);

      }
      self->_recommendedLimit = 202;
      +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", &unk_24D443BA0, CFSTR("ChargeLimitRecommendation"), self->_defaultsDomain);
LABEL_66:

      goto LABEL_67;
    }
    v20 = vcvtpd_s64_f64((double)v12 / 6.0);
    v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v71 = v20;
      _os_log_impl(&dword_215A71000, v21, OS_LOG_TYPE_DEFAULT, "  max instances above threshold: %d", buf, 8u);
    }
    v60 = v20;
    v62 = v8;
    v63 = v7;
    v22 = self;
    v64 = v5;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v61 = v14;
    obj = v14;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v67 != v29)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          v32 = v22->_log;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v71 = v31;
            _os_log_impl(&dword_215A71000, v32, OS_LOG_TYPE_DEFAULT, "  drain: %@", buf, 0xCu);
          }
          if ((int)objc_msgSend(v31, "intValue") > 60)
            ++v28;
          if ((int)objc_msgSend(v31, "intValue") > 65)
            ++v27;
          if ((int)objc_msgSend(v31, "intValue") > 70)
            ++v26;
          if ((int)objc_msgSend(v31, "intValue") > 75)
            ++v25;
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      }
      while (v24);
    }
    else
    {
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
    }

    if (v28 <= v60)
    {
      v34 = v22;
      v41 = v22->_log;
      v5 = v64;
      v35 = 0x24BDBC000;
      v36 = off_24D3FB000;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v39 = 80;
        *(_QWORD *)v71 = 80;
        _os_log_impl(&dword_215A71000, v41, OS_LOG_TYPE_DEFAULT, "Recommend limit %lu", buf, 0xCu);
        v40 = &unk_24D443B70;
      }
      else
      {
        v40 = &unk_24D443B70;
        v39 = 80;
      }
      v7 = v63;
    }
    else
    {
      v33 = v27 <= v60;
      v5 = v64;
      v34 = v22;
      v35 = 0x24BDBC000uLL;
      v36 = off_24D3FB000;
      if (v33)
      {
        v42 = v22->_log;
        v7 = v63;
        if (os_log_type_enabled((os_log_t)v34->_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v39 = 85;
          *(_QWORD *)v71 = 85;
          _os_log_impl(&dword_215A71000, v42, OS_LOG_TYPE_DEFAULT, "Recommend limit %lu", buf, 0xCu);
          v40 = &unk_24D443BB8;
        }
        else
        {
          v40 = &unk_24D443BB8;
          v39 = 85;
        }
      }
      else
      {
        if (v26 > v60)
        {
          v37 = v22->_log;
          v38 = os_log_type_enabled((os_log_t)v34->_log, OS_LOG_TYPE_DEFAULT);
          v7 = v63;
          if (v25 <= v60)
          {
            v14 = v61;
            if (v38)
            {
              *(_DWORD *)buf = 134217984;
              v39 = 95;
              *(_QWORD *)v71 = 95;
              _os_log_impl(&dword_215A71000, v37, OS_LOG_TYPE_DEFAULT, "Recommend limit %lu", buf, 0xCu);
              v40 = &unk_24D443B58;
            }
            else
            {
              v40 = &unk_24D443B58;
              v39 = 95;
            }
          }
          else
          {
            v14 = v61;
            if (v38)
            {
              *(_DWORD *)buf = 134217984;
              v39 = 100;
              *(_QWORD *)v71 = 100;
              _os_log_impl(&dword_215A71000, v37, OS_LOG_TYPE_DEFAULT, "Recommend limit %lu", buf, 0xCu);
              v40 = &unk_24D443948;
            }
            else
            {
              v40 = &unk_24D443948;
              v39 = 100;
            }
          }
          goto LABEL_56;
        }
        v43 = v22->_log;
        v7 = v63;
        if (os_log_type_enabled((os_log_t)v34->_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v39 = 90;
          *(_QWORD *)v71 = 90;
          _os_log_impl(&dword_215A71000, v43, OS_LOG_TYPE_DEFAULT, "Recommend limit %lu", buf, 0xCu);
          v40 = &unk_24D443B88;
        }
        else
        {
          v40 = &unk_24D443B88;
          v39 = 90;
        }
      }
    }
    v14 = v61;
LABEL_56:
    v34->_recommendedLimit = v39;
    -[__objc2_class setNumber:forPreferenceKey:inDomain:](v36[12], "setNumber:forPreferenceKey:inDomain:", v40, CFSTR("ChargeLimitRecommendation"), v34->_defaultsDomain);
    if (v34->_manualChargeLimitWasEverEnabled
      || (v44 = v34->_recommendedLimit, v44 - 80 > 0x13)
      || v44 == v34->_mclTargetSoC
      || !-[__objc2_class isiPhone](v36[12], "isiPhone"))
    {
      v48 = v34->_log;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        manualChargeLimitWasEverEnabled = v34->_manualChargeLimitWasEverEnabled;
        recommendedLimit = v34->_recommendedLimit;
        mclTargetSoC = v34->_mclTargetSoC;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v71 = manualChargeLimitWasEverEnabled;
        *(_WORD *)&v71[4] = 2048;
        *(_QWORD *)&v71[6] = recommendedLimit;
        v72 = 1024;
        v73 = mclTargetSoC;
        _os_log_impl(&dword_215A71000, v48, OS_LOG_TYPE_DEFAULT, "Don't recommend new limit - MCLWasEverEnabled: %d - _recommendedLimit: %lu - _mclTargetSoC: %hhu", buf, 0x18u);
      }
    }
    else
    {
      -[PowerUISmartChargeManager readDateForPreferenceKey:](v34, "readDateForPreferenceKey:", CFSTR("chargeLimitRecommendationPostDate"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v34->_log;
      v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      if (v45)
      {
        if (v47)
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v71 = v45;
          _os_log_impl(&dword_215A71000, v46, OS_LOG_TYPE_DEFAULT, "Don't recommend new limit, already recommended at %@", buf, 0xCu);
        }
      }
      else
      {
        if (v47)
        {
          v52 = (void *)MEMORY[0x24BDD16E0];
          v53 = v34->_recommendedLimit;
          v54 = v46;
          objc_msgSend(v52, "numberWithUnsignedInteger:", v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v71 = v55;
          _os_log_impl(&dword_215A71000, v54, OS_LOG_TYPE_DEFAULT, "Recommend charge limit for %@", buf, 0xCu);

        }
        +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (id)objc_msgSend(v56, "postChargeLimitRecommendationWithLimit:", -[PowerUISmartChargeManager getUISoCChargeLimit](v34, "getUISoCChargeLimit"));

        objc_msgSend(*(id *)(v35 + 3680), "now");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager setDate:forPreferenceKey:](v34, "setDate:forPreferenceKey:", v58, CFSTR("chargeLimitRecommendationPostDate"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v34->_recommendedLimit);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager setNumber:forPreferenceKey:](v34, "setNumber:forPreferenceKey:", v59, CFSTR("chargeLimitRecommendationValue"));

      }
    }
    -[PowerUISmartChargeManager sendChargeLimitRecommendationAnalytics](v34, "sendChargeLimitRecommendationAnalytics");
    v8 = v62;
    goto LABEL_66;
  }
  v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v71 = v12;
    _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "Earliest charge session is only %lu days old", buf, 0xCu);
  }
  self->_recommendedLimit = 201;
  +[PowerUISmartChargeUtilities setNumber:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setNumber:forPreferenceKey:inDomain:", &unk_24D443978, CFSTR("ChargeLimitRecommendation"), self->_defaultsDomain);
LABEL_67:

}

- (void)sendChargeLimitRecommendationAnalytics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  NSObject *log;
  id v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_manualChargeLimitStatus == 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_mclTargetSoC);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("currentLimit"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24D443BD0, CFSTR("currentLimit"));
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_recommendedLimit);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("currentRecommendation"));

  -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("mostRecentChargeLimitSetDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v7);
    v10 = v9;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10 / 86400.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("daysSinceLastChange"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24D443900, CFSTR("daysSinceLastChange"));
  }
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("chargeLimitRecommendationValue"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = &unk_24D443900;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("initialChargeLimitRecommendation"));
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("didTapChargeLimitRecommendation"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = &unk_24D443900;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("tappedChargeLimitNotification"));
  -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("chargeLimitRecommendationPostDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager readDateForPreferenceKey:](self, "readDateForPreferenceKey:", CFSTR("initialChargeLimitSetDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18 || !v19)
  {
    if (!v18 || v19)
    {
      if (v18 && v19)
      {
        objc_msgSend(v19, "timeIntervalSinceDate:", v18);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22 / 86400.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("limitEnabledDaysAfterNotification"));

        goto LABEL_24;
      }
      v21 = &unk_24D443C00;
    }
    else
    {
      v21 = &unk_24D443BE8;
    }
  }
  else
  {
    v21 = &unk_24D443900;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("limitEnabledDaysAfterNotification"));
LABEL_24:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Sending chargelimitrecommendation to CA: %@", buf, 0xCu);
  }
  v26 = v4;
  v25 = v4;
  AnalyticsSendEventLazy();

}

id __67__PowerUISmartChargeManager_sendChargeLimitRecommendationAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)powerStateChangedCallback
{
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *log;
  uint8_t v7[16];
  uint8_t buf[16];

  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", self->_context)&& (objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "isLowPowerModeEnabled"), v3, (v4 & 1) == 0))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_INFO, "LPM disabled on charger", buf, 2u);
    }
  }
  else
  {
    v5 = self->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "LPM state changed, reevaluate DEoC", v7, 2u);
    }
    -[PowerUISmartChargeManager forceDEoCReevaluation](self, "forceDEoCReevaluation");
  }
}

- (void)evaluateIfDEoCDevice
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *log;
  _BOOL4 v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_deocCurrentStatusLock, "lock");
  +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_deocCurrentStatusLock, "unlock");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cacheDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  log = self->_log;
  v9 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (!v3 || v7 < 0.0)
  {
    if (v9)
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "DEoC cached prediction is invalid, do not engage DEoC: %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_9;
  }
  if (v9)
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "DEoC has a valid cached prediction: %@", (uint8_t *)&v11, 0xCu);
  }
  if (!-[PowerUISmartChargeManager isDEoCSupported](self, "isDEoCSupported"))
  {
LABEL_9:
    self->_isDesktopDevice = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("limitCharge"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isDesktopDevice = objc_msgSend(v10, "BOOLValue");

LABEL_10:
}

- (void)resetDeviceHasLegitimateUsage
{
  BOOL v3;
  NSObject *log;
  uint8_t v5[16];

  if (self->_checkpoint
    || -[PowerUISmartChargeManager deviceHasOverriddenLegitimateUsageDetection](self, "deviceHasOverriddenLegitimateUsageDetection"))
  {
    self->__hasLegitimateUsage = 1;
  }
  else
  {
    v3 = -[PowerUISmartChargeManager deviceHasEnoughPluggedInTime](self, "deviceHasEnoughPluggedInTime");
    self->__hasLegitimateUsage = v3;
    if (!v3)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Legitimate Usage = 0", v5, 2u);
      }
    }
  }
  ADClientSetValueForScalarKey();
}

- (BOOL)deviceHasOverriddenLegitimateUsageDetection
{
  void *v2;
  char v3;

  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("overrideCarryDetection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)watchIsInternalAndCarrySwitchDisabled
{
  return 0;
}

void __56__PowerUISmartChargeManager_isDeviceWithLegitimateUsage__block_invoke(uint64_t a1)
{
  dispatch_source_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD handler[5];

  objc_msgSend(*(id *)(a1 + 32), "resetDeviceHasLegitimateUsage");
  v2 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 168));
  v3 = (void *)isDeviceWithLegitimateUsage_legitimateDeviceDetectionTimer;
  isDeviceWithLegitimateUsage_legitimateDeviceDetectionTimer = (uint64_t)v2;

  v4 = isDeviceWithLegitimateUsage_legitimateDeviceDetectionTimer;
  v5 = dispatch_walltime(0, 21600000000000);
  dispatch_source_set_timer(v4, v5, 0x13A52453C000uLL, 0xDF8475800uLL);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __56__PowerUISmartChargeManager_isDeviceWithLegitimateUsage__block_invoke_2;
  handler[3] = &unk_24D3FB7B0;
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)isDeviceWithLegitimateUsage_legitimateDeviceDetectionTimer, handler);
  dispatch_activate((dispatch_object_t)isDeviceWithLegitimateUsage_legitimateDeviceDetectionTimer);
}

_BYTE *__56__PowerUISmartChargeManager_isDeviceWithLegitimateUsage__block_invoke_2(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "resetDeviceHasLegitimateUsage");
  result = *(_BYTE **)(a1 + 32);
  if (!result[10])
  {
    result = (_BYTE *)objc_msgSend(result, "resetState");
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v3 + 10))
    {
      objc_msgSend(*(id *)(v3 + 400), "clearChargeLimitForLimitType:", 1);
      return (_BYTE *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "clearChargeLimitForLimitType:", 2);
    }
  }
  return result;
}

- (id)computeSignalDeadline
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *log;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = self->_monitors;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    v23 = -1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (!self->_checkpoint || objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "signalID") != 4)
        {
          objc_msgSend(v9, "requiredFullChargeDate", v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v9;
              v30 = 2112;
              v31 = v10;
              _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Monitor %@ suggested %@", buf, 0x16u);
            }
            objc_msgSend(v3, "earlierDate:", v10);
            v12 = objc_claimAutoreleasedReturnValue();

            if (v10 == (void *)v12)
            {
              objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              v3 = v10;
              if (v10 != v13)
              {
                v23 = objc_msgSend(v9, "signalID");
                v3 = v10;
              }
            }
            else
            {
              v3 = (void *)v12;
            }
          }

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v6);
  }
  else
  {
    v23 = -1;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v14, CFSTR("decisionMaker"));

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v3, CFSTR("decisionDate"));
  if (self->_isDesktopDevice)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToDate:", v15))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v3, "isEqualToDate:", v16);

      if ((v17 & 1) == 0)
      {
        objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_24D443900, CFSTR("decisionMaker"));
        objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("decisionDate"));

        v19 = self->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v19, OS_LOG_TYPE_DEFAULT, "In DEoC, ignore signals not requiring immediate charge", buf, 2u);
        }
      }
    }
  }
  v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v3;
    _os_log_impl(&dword_215A71000, v20, OS_LOG_TYPE_DEFAULT, "Monitors suggested: %@", buf, 0xCu);
  }

  return v22;
}

- (NSDictionary)signalDeadline
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_lastComputedSignalDeadline && (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 <= 600.0))
  {
    v6 = 0;
  }
  else
  {
    -[PowerUISmartChargeManager computeSignalDeadline](self, "computeSignalDeadline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("decisionMaker"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_deadlineSignalID = objc_msgSend(v7, "unsignedIntegerValue");

    objc_storeStrong((id *)&self->_lastComputedSignalDeadline, v4);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_deadlineSignalID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("decisionMaker"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("decisionDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("decisionDate"));

  return (NSDictionary *)v8;
}

- (id)uiDeadlineFromFullChargeDeadline:(id)a3 atDate:(id)a4
{
  void *v4;
  _CDLocalContext *context;
  id v7;
  id v8;
  void *v9;
  double v10;
  uint64_t v11;

  v4 = a3;
  if (a3)
  {
    context = self->_context;
    v7 = a4;
    v8 = v4;
    -[PowerUISmartChargeManager durationToFullChargeFromBatteryLevel:](self, "durationToFullChargeFromBatteryLevel:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", context));
    objc_msgSend(v7, "dateByAddingTimeInterval:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PowerUISmartChargeUtilities roundedDateFromDate:](PowerUISmartChargeUtilities, "roundedDateFromDate:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "timeIntervalSinceDate:", v9);
    if (v10 < 0.0)
    {
      +[PowerUISmartChargeUtilities roundedDateFromDate:](PowerUISmartChargeUtilities, "roundedDateFromDate:", v9);
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }

  }
  return v4;
}

- (id)fullChargeDeadline
{
  return self->__fullChargeDeadline;
}

- (id)setFullChargeDeadline:(id)a3
{
  id v5;
  void *v6;
  NSDate *fullChargeDeadline;
  NSDate **p_fullChargeDeadline;
  unint64_t checkpoint;
  double v10;
  void *v11;
  NSDate *v12;
  NSDate *uiDeadline;
  void *v14;
  void *v15;
  NSDate *v16;
  NSDate *v17;
  void *v18;
  NSDate *v19;
  NSDate *v20;
  NSDate *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a3;
  v6 = v5;
  p_fullChargeDeadline = &self->__fullChargeDeadline;
  fullChargeDeadline = self->__fullChargeDeadline;
  if (!v5 || !fullChargeDeadline)
    goto LABEL_9;
  checkpoint = self->_checkpoint;
  if (checkpoint - 5 >= 2)
  {
    if (checkpoint - 2 <= 2)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      if (v10 < 0.0)
      {
        objc_storeStrong((id *)&self->__fullChargeDeadline, a3);
        -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", self->__fullChargeDeadline, CFSTR("fullChargeDeadline"));
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager uiDeadlineFromFullChargeDeadline:atDate:](self, "uiDeadlineFromFullChargeDeadline:atDate:", v6, v11);
        v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
        uiDeadline = self->_uiDeadline;
        self->_uiDeadline = v12;

        +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "currentOBCEngagedNotification");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = self->_uiDeadline;
          if (v16)
          {
            v17 = v16;
          }
          else
          {
            -[PowerUISmartChargeManager fullChargeDeadline](self, "fullChargeDeadline");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUISmartChargeManager uiDeadlineFromFullChargeDeadline:atDate:](self, "uiDeadlineFromFullChargeDeadline:atDate:", v24, v25);
            v17 = (NSDate *)objc_claimAutoreleasedReturnValue();

          }
          +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "updateOBCEngagedNotificationWithDate:", v17);

        }
        else
        {
          +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeAllNotifications");

          -[PowerUISmartChargeManager postOBCNotificationWithTopOff:](self, "postOBCNotificationWithTopOff:", 0);
        }
        notify_post((const char *)objc_msgSend(CFSTR("com.apple.smartcharging.fullChargeDeadlineChanged"), "UTF8String"));
      }
      goto LABEL_10;
    }
LABEL_9:
    objc_storeStrong((id *)&self->__fullChargeDeadline, a3);
    -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", self->__fullChargeDeadline, CFSTR("fullChargeDeadline"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager uiDeadlineFromFullChargeDeadline:atDate:](self, "uiDeadlineFromFullChargeDeadline:atDate:", v6, v18);
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v20 = self->_uiDeadline;
    self->_uiDeadline = v19;

LABEL_10:
    fullChargeDeadline = *p_fullChargeDeadline;
  }
  v21 = fullChargeDeadline;

  return v21;
}

- (BOOL)deviceWasRecentlyConnectedToCharger
{
  return +[PowerUISmartChargeUtilities deviceWasConnectedToChargerWithinSeconds:withContext:](PowerUISmartChargeUtilities, "deviceWasConnectedToChargerWithinSeconds:withContext:", self->_context, 900.0);
}

- (void)updateChargingTimeSaved
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("chargingDisabledAt"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("totalTimeSaved"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v5 = v4;
    objc_msgSend(v14, "doubleValue");
    v7 = fmax(v5 - v6, 0.0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v8, CFSTR("lastSavedSeconds"));

    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v9, "numberWithDouble:", v7 + v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v11, CFSTR("totalTimeSaved"));

    v12 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v14, "doubleValue");
    objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager addEngagementFromDate:withDuration:](self, "addEngagementFromDate:withDuration:", v13, v7);

    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", 0, CFSTR("chargingDisabledAt"));
    ADClientSetValueForScalarKey();
  }

}

- (void)enableCharging
{
  -[PowerUIChargingController clearChargeLimitForLimitType:](self->_chargingController, "clearChargeLimitForLimitType:", 1);
  -[PowerUIChargingController clearChargeLimitForLimitType:](self->_chargingController, "clearChargeLimitForLimitType:", 2);
}

- (void)disableCharging
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: No current DEoC prediction cached", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (id)ttrURLforBatteryLevel:(int)a3 withDate:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *log;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a4;
  objc_msgSend(v7, "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager timeStringFromDate:](self, "timeStringFromDate:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("tap-to-radar://new?Title=Potential Optimized Battery Charging Failure (Unplugged at %@ percent)&Classification=Serious Bug&ComponentID=971083&ComponentName=PowerUI&ComponentVersion=all&Reproducible=Sometimes&Description=PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n* Why did you unplug your device at %@?\n* Do you usually leave your device charged for a while at this time?\n* Is this your regular carry device?"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v14;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", buf, 0xCu);
  }

  return v14;
}

- (id)ttrURLforGenericFailure:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *log;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("tap-to-radar://new?Title=Optimized Battery Charging Error of type: %@&Classification=Serious Bug&ComponentID=971083&ComponentName=PowerUI&ComponentVersion=all&Reproducible=Sometimes&Description=Could you please describe how you were (or are currently) charging your phone/watch?"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", buf, 0xCu);
  }

  return v7;
}

- (id)lastAcquiredLocation
{
  NSArray *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_monitors;
  v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "lastAcquiredLocation", (_QWORD)v8);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)clearManualChargeLimit
{
  -[PowerUIChargingController clearChargeLimitForLimitType:](self->_chargingController, "clearChargeLimitForLimitType:", 3);
}

- (void)engageManualChargeLimit
{
  NSObject *log;
  int mclTargetSoC;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    -[PowerUIChargingController setChargeLimitTo:forLimitType:](self->_chargingController, "setChargeLimitTo:forLimitType:", self->_mclTargetSoC, 3);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      mclTargetSoC = self->_mclTargetSoC;
      v5[0] = 67109120;
      v5[1] = mclTargetSoC;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Limiting charging to %hhu%% SoC", (uint8_t *)v5, 8u);
    }
  }
}

- (void)clearAllNotificationState
{
  void *v2;
  id v3;

  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllNotifications");

  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetAll");

}

- (id)smartTopOffFailureNotificationAtBatteryLevel:(int)a3 withDate:(id)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = *(_QWORD *)&a3;
  v6 = (objc_class *)MEMORY[0x24BDF8800];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OBC_FEATURE_TITLE"), &stru_24D3FD658, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v11);

  objc_msgSend(v8, "setBody:", CFSTR("Potential charging issue detected. Please file a radar by tapping on the notification."));
  objc_msgSend(v8, "setShouldIgnoreDoNotDisturb:", 1);
  -[PowerUISmartChargeManager ttrURLforBatteryLevel:withDate:](self, "ttrURLforBatteryLevel:withDate:", v4, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDefaultActionURL:", v12);
  v13 = (void *)MEMORY[0x24BDF8858];
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("chargingRequest-%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestWithIdentifier:content:trigger:", v16, v8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)genericOBCFailureNotification:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (objc_class *)MEMORY[0x24BDF8800];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OBC_FEATURE_TITLE"), &stru_24D3FD658, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v9);

  objc_msgSend(v6, "setBody:", CFSTR("Potential charging issue detected. Please file a radar by tapping on the notification."));
  objc_msgSend(v6, "setShouldIgnoreDoNotDisturb:", 1);
  -[PowerUISmartChargeManager ttrURLforGenericFailure:](self, "ttrURLforGenericFailure:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDefaultActionURL:", v10);
  v11 = (void *)MEMORY[0x24BDF8858];
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("chargingRequest-%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestWithIdentifier:content:trigger:", v14, v6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)postOBCNotificationWithTopOff:(BOOL)a3
{
  _BOOL4 v3;
  NSDate *uiDeadline;
  NSDate *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSDate *v13;
  NSDate *v14;

  v3 = a3;
  uiDeadline = self->_uiDeadline;
  if (uiDeadline)
  {
    v5 = uiDeadline;
  }
  else
  {
    -[PowerUISmartChargeManager fullChargeDeadline](self, "fullChargeDeadline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager uiDeadlineFromFullChargeDeadline:atDate:](self, "uiDeadlineFromFullChargeDeadline:atDate:", v7, v8);
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();

    v5 = v13;
    if (!v13)
      return;
  }
  v14 = v5;
  +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v3)
    v11 = (id)objc_msgSend(v9, "postOBCEngagedTopOffNotificationWithDate:", v14);
  else
    v12 = (id)objc_msgSend(v9, "postOBCEngagedNotificationWithDate:", v14);

}

- (void)monitor:(id)a3 maySuggestNewFullChargeDeadline:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PowerUISmartChargeManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__PowerUISmartChargeManager_monitor_maySuggestNewFullChargeDeadline___block_invoke;
  block[3] = &unk_24D3FCA80;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __69__PowerUISmartChargeManager_monitor_maySuggestNewFullChargeDeadline___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if ((unint64_t)(v2[14] - 2) <= 2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v2, "fullChargeDeadline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "earlierDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 40));

    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v10 = *(_QWORD *)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        v15 = 138412546;
        v16 = v9;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_215A71000, v7, OS_LOG_TYPE_DEFAULT, "Monitor %@ with new data (%@). Recomputing full charge deadline", (uint8_t *)&v15, 0x16u);
      }
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 160);
      *(_QWORD *)(v11 + 160) = 0;

      objc_msgSend(*(id *)(a1 + 32), "handleCallback:", 1);
    }
    else if (v8)
    {
      v14 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_215A71000, v7, OS_LOG_TYPE_DEFAULT, "Monitor %@ with new data (%@). Not recomputing as it is later than target date.", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)monitorMayInvalidateDEoCCache:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Monitor %@ forced DEoC re-caching", (uint8_t *)&v6, 0xCu);
  }
  -[PowerUISmartChargeManager forceDEoCReevaluation](self, "forceDEoCReevaluation");

}

- (void)handleNotificationResponse:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *log;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *mcmLog;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("fullCharge"));

  if (!v6)
  {
    objc_msgSend(v4, "notification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "categoryIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("mcmActiveCategory")))
    {
      objc_msgSend(v4, "actionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDF8A70]);

      if (v13)
      {
        mcmLog = self->_mcmLog;
        if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_215A71000, mcmLog, OS_LOG_TYPE_DEFAULT, "User dismissed MCM notification", v30, 2u);
        }
        self->_numberOfTimesMCMNotificationWasDisplayed = -1;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -1);
        v15 = objc_claimAutoreleasedReturnValue();
        -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v15, CFSTR("NumberOfTimesMCMNotificationWasDisplayed"));
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "notification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "content");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "categoryIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("chargeRecommendationCategory"));

    if (!v20)
      goto LABEL_24;
    objc_msgSend(v4, "actionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BDF8A60]);

    if (v22)
    {
      -[PowerUISmartChargeManager log](self, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_215A71000, v23, OS_LOG_TYPE_DEFAULT, "User selected defaultAction on charge recommendation", v29, 2u);
      }

      v24 = &unk_24D443918;
    }
    else
    {
      objc_msgSend(v4, "actionIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BDF8A70]);

      -[PowerUISmartChargeManager log](self, "log");
      v27 = objc_claimAutoreleasedReturnValue();
      v15 = v27;
      if (!v26)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[PowerUISmartChargeManager handleNotificationResponse:].cold.1();
        goto LABEL_23;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEFAULT, "User dismissed charge recommendation", v28, 2u);
      }

      v24 = &unk_24D4438E8;
    }
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v24, CFSTR("didTapChargeLimitRecommendation"));
    goto LABEL_24;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "User requested immediate charge.", buf, 2u);
  }
  -[PowerUISmartChargeManager client:setState:withHandler:](self, "client:setState:withHandler:", CFSTR("Notification"), 2, &__block_literal_global_931);
LABEL_24:

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PowerUISmartChargeManager *v15;
  uint64_t v16;
  void *v17;
  id v19;

  v19 = a3;
  v6 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[PowerUISmartChargeManager listener:shouldAcceptNewConnection:].cold.2();
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.powerui.smartcharging"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((!v7 || (objc_msgSend(v7, "BOOLValue") & 1) == 0) && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    -[PowerUIAudioAccessorySmartChargeManager listener:shouldAcceptNewConnection:].cold.1();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E02070);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = self;
  v16 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_statusWithHandler_, 0, 1);

  objc_msgSend(v6, "setExportedInterface:", v9);
  objc_msgSend(v6, "setExportedObject:", v15);
  objc_msgSend(v6, "resume");

  return 1;
}

- (id)stringFromState:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Unknown state");
  else
    return off_24D3FCCC8[a3];
}

- (id)readAndRemoveRecentEngagements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("recentEngagements"), (CFStringRef)self->_defaultsDomain);
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -2592000.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __59__PowerUISmartChargeManager_readAndRemoveRecentEngagements__block_invoke;
    v14 = &unk_24D3FCAE8;
    v15 = v4;
    v16 = v5;
    v6 = v5;
    v7 = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v11);
    objc_msgSend(v6, "allObjects", v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectsForKeys:", v8);

    v9 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __59__PowerUISmartChargeManager_readAndRemoveRecentEngagements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCE60];
  v7 = v3;
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  if (v6 < 0.0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (id)recentEngagements
{
  void *v3;
  void *v4;

  -[PowerUISmartChargeManager readAndRemoveRecentEngagements](self, "readAndRemoveRecentEngagements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  CFPreferencesSetAppValue(CFSTR("recentEngagements"), v4, (CFStringRef)self->_defaultsDomain);

  return v4;
}

- (void)addEngagementFromDate:(id)a3 withDuration:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  -[PowerUISmartChargeManager readAndRemoveRecentEngagements](self, "readAndRemoveRecentEngagements");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v9 = v8;

  objc_msgSend(v7, "stringWithFormat:", CFSTR("%lf"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", fmax(a4, 0.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v10);

  v12 = (void *)objc_msgSend(v13, "copy");
  CFPreferencesSetAppValue(CFSTR("recentEngagements"), v12, (CFStringRef)self->_defaultsDomain);

}

- (void)statusWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  unint64_t v8;
  void *v9;
  PowerUIMLTwoStageModelPredictor *modelTwoStagePredictor;
  void *v11;
  PowerUIMLTwoStageModelPredictor *v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PowerUIMLTwoStageModelPredictor *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *log;
  void *v74;
  void (**v75)(id, void *);
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint8_t buf[4];
  void *v85;
  _QWORD v86[12];
  _QWORD v87[12];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[4];

  v93[2] = *MEMORY[0x24BDAC8D0];
  v75 = (void (**)(id, void *))a3;
  v80 = (void *)CFPreferencesCopyAppValue(CFSTR("timeline"), (CFStringRef)self->_defaultsDomain);
  v74 = (void *)CFPreferencesCopyAppValue(CFSTR("timeline.archive"), (CFStringRef)self->_defaultsDomain);
  -[PowerUISmartChargeManager eligibleEngagementIntervalFromTimelineEvents:](self, "eligibleEngagementIntervalFromTimelineEvents:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("lastEnabled"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("lastSavedSeconds"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("totalTimeSaved"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:", v7 / 3600.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v4;
  if (self->_predictorType == 2)
  {
    v8 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    modelTwoStagePredictor = self->_modelTwoStagePredictor;
    v82 = v9;
    if (self->_lastPluginStatus < 1)
    {
      v36 = 1;
      -[PowerUIMLTwoStageModelPredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](modelTwoStagePredictor, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", v8, v9, v9, 1, (double)v8);
      objc_msgSend(v9, "dateByAddingTimeInterval:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = v9;
      v90[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v37, CFSTR("CurrentPluginPrediction"));

      v38 = 0;
      v39 = v8 - 5;
      v40 = 3600;
      do
      {
        v41 = v11;
        objc_msgSend(v9, "dateByAddingTimeInterval:", (double)v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "dateByAddingTimeInterval:", 1.0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39 <= 1)
          v44 = 1;
        else
          v44 = v39;
        -[PowerUIMLTwoStageModelPredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](self->_modelTwoStagePredictor, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", (double)v44);
        v46 = v45;
        objc_msgSend(v42, "dateByAddingTimeInterval:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v38 & 1) == 0 && v46 > 3600.0)
        {
          v89[0] = v42;
          v89[1] = v11;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 2);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setObject:forKeyedSubscript:", v47, CFSTR("NextPluginPrediction"));

          v38 = 1;
        }
        v48 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v36);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringWithFormat:", CFSTR("PluginPredictionIn%@Hours"), v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v88[0] = v42;
        v88[1] = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setObject:forKeyedSubscript:", v51, v50);

        ++v36;
        v39 -= 5;
        v40 += 3600;
        v9 = v82;
      }
      while (v36 != 24);
    }
    else
    {
      -[PowerUIMLTwoStageModelPredictor pluginDate](modelTwoStagePredictor, "pluginDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_modelTwoStagePredictor;
      -[PowerUIMLTwoStageModelPredictor pluginBatteryLevel](v12, "pluginBatteryLevel");
      v14 = (unint64_t)v13;
      -[PowerUIMLTwoStageModelPredictor pluginBatteryLevel](self->_modelTwoStagePredictor, "pluginBatteryLevel");
      v15 = 1;
      -[PowerUIMLTwoStageModelPredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](v12, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", v14, v11, v11, 1);
      objc_msgSend(v11, "dateByAddingTimeInterval:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = v11;
      v93[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v17, CFSTR("PluginPredictionAtPlugin"));

      v18 = self->_modelTwoStagePredictor;
      -[PowerUIMLTwoStageModelPredictor pluginBatteryLevel](v18, "pluginBatteryLevel");
      v20 = v19;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUIMLTwoStageModelPredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](v18, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", v8, v11, v21, 1, v20);
      v23 = v22;

      objc_msgSend(v11, "dateByAddingTimeInterval:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v92[0] = v11;
      v92[1] = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setObject:forKeyedSubscript:", v25, CFSTR("CurrentPluginPrediction"));

      v26 = v8 - 5;
      v27 = 3600;
      do
      {
        v28 = v24;
        objc_msgSend(v9, "dateByAddingTimeInterval:", (double)v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dateByAddingTimeInterval:", 1.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26 <= 1)
          v31 = 1;
        else
          v31 = v26;
        -[PowerUIMLTwoStageModelPredictor adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:](self->_modelTwoStagePredictor, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:", (double)v31);
        objc_msgSend(v29, "dateByAddingTimeInterval:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("PluginPredictionIn%@Hours"), v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v91[0] = v29;
        v91[1] = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "setObject:forKeyedSubscript:", v35, v34);

        v9 = v82;
        ++v15;
        v26 -= 5;
        v27 += 3600;
      }
      while (v15 != 24);

    }
    v4 = v76;
  }
  -[PowerUISmartChargeManager stringFromDecisionMaker:decisionDate:](self, "stringFromDecisionMaker:decisionDate:", self->_previousDecisionMakerID, self->_previousDecisionMakerDate);
  v52 = objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager recentEngagements](self, "recentEngagements");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enabled);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v54;
  v86[1] = CFSTR("TemporarilyDisabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_temporarilyDisabled);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v55;
  v86[2] = CFSTR("CurrentState");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentState);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v56;
  v86[3] = CFSTR("Checkpoint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_checkpoint);
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v57;
  v59 = (void *)MEMORY[0x24BDBD1A8];
  if (v80)
    v59 = v80;
  v87[3] = v57;
  v87[4] = v59;
  v86[4] = CFSTR("Timeline");
  v86[5] = CFSTR("LastEnabled");
  v60 = &unk_24D4438E8;
  v62 = v78;
  v61 = v79;
  if (!v79)
    v61 = &unk_24D4438E8;
  if (!v78)
    v62 = &unk_24D4438E8;
  v87[5] = v61;
  v87[6] = v62;
  v86[6] = CFSTR("LastSavedSeconds");
  v86[7] = CFSTR("TotalHoursSaved");
  if (v77)
    v60 = v77;
  v63 = (void *)MEMORY[0x24BDBD1B8];
  if (v53)
    v63 = v53;
  v87[7] = v60;
  v87[8] = v63;
  v86[8] = CFSTR("RecentEngagements");
  v86[9] = CFSTR("PreviousDecisionMaker");
  v64 = &stru_24D3FD658;
  v83 = (void *)v52;
  if (v52)
    v64 = (const __CFString *)v52;
  v87[9] = v64;
  v86[10] = CFSTR("LastEligibleStart");
  objc_msgSend(v4, "startDate");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v87[10] = v66;
  v86[11] = CFSTR("LastEligibleDuration");
  v67 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "duration");
  objc_msgSend(v67, "numberWithDouble:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v87[11] = v68;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 12);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v65)
  objc_msgSend(v81, "addEntriesFromDictionary:", v69);
  +[PowerUICECManager manager](PowerUICECManager, "manager");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "status");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v81, "addEntriesFromDictionary:", v71);
  v72 = (void *)objc_msgSend(v81, "copy");

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v85 = v72;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Status Requested: %@", buf, 0xCu);
  }
  v75[2](v75, v72);

}

- (void)powerLogStatusWithHandler:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  -[PowerUISmartChargeManager powerLogStatus](self, "powerLogStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  v4[2](v4, v6);
}

- (void)legacy_isOBCEngagedWithHandler:(id)a3
{
  _CDLocalContext *context;
  void (**v5)(id, _BOOL8, BOOL, _BOOL8, _QWORD);
  _BOOL4 v6;
  unint64_t checkpoint;
  _BOOL8 v8;
  _BOOL8 v9;
  NSObject *log;
  _BOOL4 isDesktopDevice;
  _DWORD v12[2];
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  context = self->_context;
  v5 = (void (**)(id, _BOOL8, BOOL, _BOOL8, _QWORD))a3;
  v6 = +[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", context);
  checkpoint = self->_checkpoint;
  v8 = checkpoint - 2 < 3 && v6;
  v9 = checkpoint - 1 < 4 && v6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    isDesktopDevice = self->_isDesktopDevice;
    v12[0] = 67109632;
    v12[1] = v8;
    v13 = 1024;
    v14 = isDesktopDevice;
    v15 = 1024;
    v16 = v9;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Returning currently engaged state: %u, desktop device: %u, chargingOverrideAllowed: %u", (uint8_t *)v12, 0x14u);
  }
  v5[2](v5, v8, self->_isDesktopDevice, v9, 0);

}

- (id)getCurrentSystemChargeLimit
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  IOPSCopyBatteryLevelLimits();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Owner"), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8 && !objc_msgSend(v8, "intValue"))
        {
          v10 = v7;

          goto LABEL_12;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)smartChargingUIStateWithHandler:(id)a3
{
  _CDLocalContext *context;
  void (**v5)(id, uint64_t, unint64_t, _BOOL8, _QWORD);
  uint64_t v6;
  _BOOL4 v7;
  unint64_t v8;
  unint64_t checkpoint;
  unint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  NSObject *log;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  context = self->_context;
  v5 = (void (**)(id, uint64_t, unint64_t, _BOOL8, _QWORD))a3;
  v6 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", context);
  v7 = +[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", self->_context);
  v8 = -[PowerUISmartChargeManager currentChargeLimit](self, "currentChargeLimit");
  checkpoint = self->_checkpoint;
  v10 = checkpoint - 1;
  v11 = checkpoint - 1 < 4 && v7;
  if (self->_temporarilyDisabled)
  {
    v12 = 3;
    goto LABEL_19;
  }
  if (!checkpoint)
  {
    if (self->_isDesktopDevice && self->_enabled)
    {
      v12 = 17;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (checkpoint >= 7 || !v7)
  {
LABEL_18:
    v12 = 1;
    goto LABEL_19;
  }
  v12 = 2;
  switch(v10)
  {
    case 0uLL:
    case 2uLL:
      if (self->_isDesktopDevice)
        v12 = 9;
      else
        v12 = 5;
      break;
    case 1uLL:
    case 3uLL:
      -[PowerUISmartChargeManager getCurrentSystemChargeLimit](self, "getCurrentSystemChargeLimit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("chargeSocLimitDrain"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("chargeSocLimitSoc"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue");

        v21 = v20;
      }
      else
      {
        v18 = 0;
        v21 = 100;
      }
      v22 = +[PowerUISmartChargeUtilities deviceConnectedToWirelessChargerWithContext:](PowerUISmartChargeUtilities, "deviceConnectedToWirelessChargerWithContext:", self->_context);
      if ((v18 & 1) != 0 || v22)
      {
        v23 = 7;
        if (v6 > 80)
          v23 = 8;
        v24 = 11;
        if (v6 > v21)
          v24 = 12;
        if (self->_isDesktopDevice)
          v12 = v24;
        else
          v12 = v23;
      }
      else if (self->_isDesktopDevice)
      {
        v12 = 10;
      }
      else
      {
        v12 = 6;
      }

      break;
    case 4uLL:
      v12 = 4;
      break;
    case 5uLL:
      break;
    default:
      v12 = 0;
      break;
  }
LABEL_19:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 134218496;
    v26 = v12;
    v27 = 2048;
    v28 = v8;
    v29 = 1024;
    v30 = v11;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Returning currently desired UI state: %lu, charge limit: %lu, chargingOverrideAllowed: %u", (uint8_t *)&v25, 0x1Cu);
  }
  v5[2](v5, v12, v8, v11, 0);

}

- (void)isSmartChargingCurrentlyEnabledWithHandler:(id)a3
{
  void (**v4)(id, unint64_t, _QWORD);
  NSObject *log;
  void *v6;
  unint64_t currentState;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, unint64_t, _QWORD))a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    currentState = self->_currentState;
    v8 = log;
    objc_msgSend(v6, "numberWithUnsignedInteger:", currentState);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "Returning current state: %@", (uint8_t *)&v10, 0xCu);

  }
  v4[2](v4, self->_currentState, 0);

}

- (void)fullChargeDeadlineWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *, _QWORD);

  v7 = (void (**)(id, void *, _QWORD))a3;
  if (self->_checkpoint - 1 > 4)
  {
    v6 = 0;
  }
  else
  {
    -[PowerUISmartChargeManager fullChargeDeadline](self, "fullChargeDeadline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager uiDeadlineFromFullChargeDeadline:atDate:](self, "uiDeadlineFromFullChargeDeadline:atDate:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7[2](v7, v6, 0);

}

- (void)setEnabled:(BOOL)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v5, CFSTR("enabled"));

  self->_enabled = a3;
}

- (void)setCurrentState:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v5, CFSTR("currentState"));

  if (a3 <= 3 && a3 != 1)
    -[PowerUISmartChargeManager enableCharging](self, "enableCharging");
  self->_currentState = a3;
}

- (void)client:(id)a3 setState:(unint64_t)a4 withHandler:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *log;
  NSObject *v12;
  void *v13;
  NSObject *queue;
  void *v15;
  _QWORD v16[5];
  void (**v17)(id, _QWORD, void *);
  unint64_t v18;
  SEL v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (a4 == 1
    && !+[PowerUISmartChargeUtilities isOBCSupported](PowerUISmartChargeUtilities, "isOBCSupported"))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager client:setState:withHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v15);

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v12 = log;
      -[PowerUISmartChargeManager stringFromState:](self, "stringFromState:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v9;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "%@ requests state: %@", buf, 0x16u);

    }
    queue = self->_queue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke;
    v16[3] = &unk_24D3FCB10;
    v18 = a4;
    v19 = a2;
    v16[4] = self;
    v17 = v10;
    dispatch_async(queue, v16);

  }
}

uint64_t __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id (*v33)(uint64_t);
  void *v34;
  uint64_t v35;

  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", 0);
      v2 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", 10, 0, v3);

      objc_msgSend(*(id *)(a1 + 32), "setCheckpoint:withSelector:", 10, *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 0);
      objc_msgSend(*(id *)(a1 + 32), "clearAllNotificationState");
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.powerui.smartchargestatuschanged"), "UTF8String"));
      v31 = MEMORY[0x24BDAC760];
      v32 = 3221225472;
      v33 = __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_2;
      v34 = &unk_24D3FBB70;
      v35 = *(_QWORD *)(a1 + 32);
      AnalyticsSendEventLazy();
      objc_msgSend(*(id *)(a1 + 32), "forceDEoCReevaluation");
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", 1);
      objc_msgSend(*(id *)(a1 + 32), "setTemporarilyDisabled:until:", 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
      v7 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", 0, 0, v8);

      objc_msgSend(*(id *)(a1 + 32), "setCheckpoint:withSelector:", 0, *(_QWORD *)(a1 + 56));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.powerui.smartchargestatuschanged"), "UTF8String"));
      break;
    case 2:
      v9 = *(_QWORD **)(a1 + 32);
      v10 = v9[14];
      if (v10 > 4)
        goto LABEL_10;
      if (v10)
      {
        objc_msgSend(v9, "setCurrentState:", 2);
        v11 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addPowerLogEventForCheckpoint:decisionSignalID:decisionDate:", 9, 0, v12);

        objc_msgSend(*(id *)(a1 + 32), "setCheckpoint:withSelector:", 9, *(_QWORD *)(a1 + 56));
        v13 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "defaultDateToDisableUntilGivenDate:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setTemporarilyDisabled:until:", 1, v15);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        notify_post((const char *)objc_msgSend(CFSTR("com.apple.powerui.smartchargestatuschanged"), "UTF8String"));
        objc_msgSend(*(id *)(a1 + 32), "clearAllNotificationState");
      }
      else
      {
        objc_msgSend(v9, "setCheckpoint:withSelector:", 9, *(_QWORD *)(a1 + 56));
        v23 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "defaultDateToDisableUntilGivenDate:", v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setTemporarilyDisabled:until:", 1, v15);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        notify_post((const char *)objc_msgSend(CFSTR("com.apple.powerui.smartchargestatuschanged"), "UTF8String"));
      }

      v26 = MEMORY[0x24BDAC760];
      v27 = 3221225472;
      v28 = __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_1091;
      v29 = &unk_24D3FBB70;
      v30 = *(_QWORD *)(a1 + 32);
      AnalyticsSendEventLazy();
      break;
    case 3:
      v16 = *(_BYTE **)(a1 + 32);
      if (!v16[8])
      {
LABEL_10:
        v4 = *(_QWORD *)(a1 + 40);
        v5 = (void *)MEMORY[0x24BDD1540];
        v6 = 2;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "defaultDateToDisableUntilGivenDate:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "setTemporarilyDisabled:until:", 1, v18);
      objc_msgSend(*(id *)(a1 + 32), "clearAllNotificationState");
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.powerui.smartchargestatuschanged"), "UTF8String"));
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(v19 + 408);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", *(_QWORD *)(v19 + 48)));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", v21, 0, 0, 2, 3);

      break;
    default:
      v4 = *(_QWORD *)(a1 + 40);
      v5 = (void *)MEMORY[0x24BDD1540];
      v6 = 1;
LABEL_11:
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), v6, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v22);

      break;
  }
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 96), OS_LOG_TYPE_DEBUG))
    __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_cold_1();
  return notify_post((const char *)objc_msgSend(CFSTR("com.apple.smartcharging.statechange"), "UTF8String", v26, v27, v28, v29, v30, v31, v32, v33, v34, v35));
}

id __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[PowerUISmartChargeUtilities recentEngagementHistory](PowerUISmartChargeUtilities, "recentEngagementHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Disabled"), CFSTR("DisableType"));
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "After disablement, reporting %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

id __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_1091(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[PowerUISmartChargeUtilities recentEngagementHistory](PowerUISmartChargeUtilities, "recentEngagementHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("TemporaryDisabled"), CFSTR("DisableType"));
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "After disablement, reporting %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (void)isOBCSupportedWithHandler:(id)a3
{
  id v4;

  v4 = a3;
  (*((void (**)(id, BOOL, _QWORD))a3 + 2))(v4, +[PowerUISmartChargeUtilities isOBCSupported](PowerUISmartChargeUtilities, "isOBCSupported"), 0);

}

- (void)isMCLSupportedWithHandler:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, BOOL, _QWORD))a3 + 2))(v5, -[PowerUISmartChargeManager isMCLSupported](self, "isMCLSupported"), 0);

}

- (BOOL)isMCLSupported
{
  int v3;
  void *v4;
  void *v5;

  if (_os_feature_enabled_impl() && (MGGetBoolAnswer() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else if (_os_feature_enabled_impl()
         && +[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("allowMCLOverride"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v3 = (int)(objc_msgSend(v4, "BOOLValue") << 31) >> 31;
    else
      LOBYTE(v3) = 0;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3 & 1;
}

- (void)client:(id)a3 setMCLLimit:(unsigned __int8)a4 withHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *log;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = log;
    objc_msgSend(v11, "numberWithUnsignedChar:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "Client %@ requests MCL limit: %@", (uint8_t *)&v19, 0x16u);

  }
  if (!-[PowerUISmartChargeManager isMCLSupported](self, "isMCLSupported"))
  {
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager client:setMCLLimit:withHandler:].cold.2((uint64_t)v8, v16, v6);
    goto LABEL_12;
  }
  if ((v6 - 80) > 0x14)
  {
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager client:setMCLLimit:withHandler:].cold.1((uint64_t)v8, v17, v6);
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v18);

    goto LABEL_13;
  }
  if (!self->_manualChargeLimitWasEverEnabled)
  {
    self->_manualChargeLimitWasEverEnabled = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", v14, CFSTR("initialChargeLimitSetDate"));

  }
  -[PowerUISmartChargeManager setMCLLimit:](self, "setMCLLimit:", v6);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", v15, CFSTR("mostRecentChargeLimitSetDate"));

  v9[2](v9, 1, 0);
LABEL_13:

}

- (void)client:(id)a3 getMCLLimitWithHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Client %@ queries MCL limit", (uint8_t *)&v10, 0xCu);
  }
  if (-[PowerUISmartChargeManager isMCLSupported](self, "isMCLSupported"))
  {
    -[PowerUISmartChargeManager checkWhetherMCLTempDisablementCanBeClearedOnPlugin:](self, "checkWhetherMCLTempDisablementCanBeClearedOnPlugin:", 0);
    if (self->_manualChargeLimitStatus == 1)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, self->_mclTargetSoC, 0);
    else
      (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 100, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);

  }
}

- (void)tmpDisableMCLViaClient:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *log;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Client %@ requests MCL tmp disablement", (uint8_t *)&v12, 0xCu);
  }
  if (!-[PowerUISmartChargeManager isMCLSupported](self, "isMCLSupported"))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager tmpDisableMCLViaClient:withHandler:].cold.2();
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = 4;
    goto LABEL_12;
  }
  if (self->_manualChargeLimitStatus != 1)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager tmpDisableMCLViaClient:withHandler:].cold.1();
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = 2;
LABEL_12:
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);

    goto LABEL_13;
  }
  -[PowerUISmartChargeManager tempDisableMCL](self, "tempDisableMCL");
  v7[2](v7, 1, 0);
LABEL_13:

}

- (unsigned)getUISoCChargeLimit
{
  unint64_t recommendedLimit;

  recommendedLimit = self->_recommendedLimit;
  if (recommendedLimit - 80 >= 0x15)
    LOBYTE(recommendedLimit) = 100;
  return recommendedLimit;
}

- (void)setMCLLimit:(unsigned __int8)a3
{
  int v3;
  void *v5;
  NSObject *log;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  self->_mclTargetSoC = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v5, CFSTR("mclLimitValue"));

  if (v3 == 100)
  {
    -[PowerUISmartChargeManager disableMCL](self, "disableMCL");
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v11[0]) = 0;
    v7 = "Charge limit was disabled";
    v8 = log;
    v9 = 2;
  }
  else
  {
    -[PowerUISmartChargeManager enableMCL](self, "enableMCL");
    v10 = self->_log;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      return;
    v11[0] = 67109120;
    v11[1] = v3;
    v7 = "Charge limit was set to: %hhu";
    v8 = v10;
    v9 = 8;
  }
  _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)v11, v9);
}

- (void)enableMCL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "MCL being enabled but not supported!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

uint64_t __38__PowerUISmartChargeManager_enableMCL__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallback:", 1);
}

- (void)disableMCL
{
  NSDate *mclDisabledUntilDate;

  -[PowerUISmartChargeManager setCheckpoint:withSelector:](self, "setCheckpoint:withSelector:", 0, a2);
  self->_manualChargeLimitStatus = 0;
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D443A38, CFSTR("MCLFeatureState"));
  -[PowerUISmartChargeManager clearManualChargeLimit](self, "clearManualChargeLimit");
  mclDisabledUntilDate = self->_mclDisabledUntilDate;
  self->_mclDisabledUntilDate = 0;

  -[PowerUISmartChargeManager setDate:forPreferenceKey:](self, "setDate:forPreferenceKey:", 0, CFSTR("MCLTempDisabledUntilDate"));
  -[PowerUIAnalyticsManager submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:](self->_analyticsManager, "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", 0, 0, 0, 6, 4);
}

- (void)tempDisableMCL
{
  NSObject *v4;
  _QWORD v5[6];

  -[PowerUISmartChargeManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__PowerUISmartChargeManager_tempDisableMCL__block_invoke;
  v5[3] = &unk_24D3FC6E0;
  v5[4] = self;
  v5[5] = a2;
  dispatch_sync(v4, v5);

}

void __43__PowerUISmartChargeManager_tempDisableMCL__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", 0, 0, 0, 6, 3);
  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48)))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCheckpoint:withSelector:", 6, *(_QWORD *)(a1 + 40));
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480) = 2;
  objc_msgSend(*(id *)(a1 + 32), "setNumber:forPreferenceKey:", &unk_24D4439C0, CFSTR("MCLFeatureState"));
  objc_msgSend(*(id *)(a1 + 32), "clearManualChargeLimit");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultDateToDisableUntilGivenDate:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 504);
  *(_QWORD *)(v5 + 504) = v4;

  objc_msgSend(*(id *)(a1 + 32), "setDate:forPreferenceKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504), CFSTR("MCLTempDisabledUntilDate"));
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_215A71000, v7, OS_LOG_TYPE_DEFAULT, "MCL has been temp disabled until %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)checkWhetherMCLTempDisablementCanBeClearedOnPlugin:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  NSDate *mclDisabledUntilDate;
  int v7;
  BOOL v8;
  double v9;
  double v10;
  NSObject *log;
  _BOOL4 v12;
  NSDate *v13;
  NSDate *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  NSDate *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v5 = +[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", self->_context);
  mclDisabledUntilDate = self->_mclDisabledUntilDate;
  v7 = !v5 || v3;
  if (mclDisabledUntilDate)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    -[NSDate timeIntervalSinceNow](mclDisabledUntilDate, "timeIntervalSinceNow");
    v10 = v9;
    log = self->_log;
    v12 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v10 <= 0.0)
    {
      if (v12)
      {
        v14 = self->_mclDisabledUntilDate;
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "MCL temp disablement date of %@ has passed, reenable feature", buf, 0xCu);
      }
      -[PowerUISmartChargeManager queue](self, "queue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__PowerUISmartChargeManager_checkWhetherMCLTempDisablementCanBeClearedOnPlugin___block_invoke;
      block[3] = &unk_24D3FB7B0;
      block[4] = self;
      dispatch_async(v15, block);

    }
    else if (v12)
    {
      v13 = self->_mclDisabledUntilDate;
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "MCL temp disablement date of %@ still upcoming", buf, 0xCu);
    }
  }
}

uint64_t __80__PowerUISmartChargeManager_checkWhetherMCLTempDisablementCanBeClearedOnPlugin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableMCL");
}

- (void)isMCLCurrentlyEnabledWithHandler:(id)a3
{
  unint64_t manualChargeLimitStatus;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PowerUISmartChargeManager checkWhetherMCLTempDisablementCanBeClearedOnPlugin:](self, "checkWhetherMCLTempDisablementCanBeClearedOnPlugin:", 0);
  manualChargeLimitStatus = self->_manualChargeLimitStatus;
  v5 = 3;
  if (manualChargeLimitStatus != 2)
    v5 = 0;
  if (manualChargeLimitStatus == 1)
    v6 = 1;
  else
    v6 = v5;
  v7[2](v7, v6, 0);

}

- (unint64_t)currentRecommendedChargeLimit
{
  return self->_recommendedLimit;
}

- (void)currentRecommendedChargeLimitWithHandler:(id)a3
{
  (*((void (**)(id, unint64_t, _QWORD))a3 + 2))(a3, self->_recommendedLimit, 0);
}

- (unint64_t)currentChargeLimit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *log;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_deocCurrentStatusLock, "lock");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cacheDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v6);
  v8 = v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("committedDate"));
  if (!v5 || v8 < 0.0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134217984;
      v21 = 100;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Cached DEoC state nonexistent. Committed to charge limit: %lu", (uint8_t *)&v20, 0xCu);
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("limitCharge"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24D443A38, CFSTR("DEoCStatus"));
    +[PowerUISmartChargeUtilities setDict:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDict:forPreferenceKey:inDomain:", v9, CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
    -[NSLock unlock](self->_deocCurrentStatusLock, "unlock");
    goto LABEL_16;
  }
  +[PowerUISmartChargeUtilities setDict:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDict:forPreferenceKey:inDomain:", v9, CFSTR("CurrentDEoCStatus"), self->_defaultsDomain);
  -[NSLock unlock](self->_deocCurrentStatusLock, "unlock");
  v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v3, "timeIntervalSinceNow");
    v20 = 134217984;
    *(double *)&v21 = v12 * -1000.0;
    _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Elapsed time for currentChargeLimit: %f ms", (uint8_t *)&v20, 0xCu);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("limitCharge"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dryRun"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if ((v15 & 1) == 0)
    {
      v16 = self->_log;
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 80;
        goto LABEL_17;
      }
      v20 = 134217984;
      v17 = 80;
      v21 = 80;
      goto LABEL_15;
    }
  }
  else
  {

  }
  v16 = self->_log;
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
LABEL_16:
    v17 = 100;
    goto LABEL_17;
  }
  v20 = 134217984;
  v17 = 100;
  v21 = 100;
LABEL_15:
  _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Committed to charge limit: %lu", (uint8_t *)&v20, 0xCu);
LABEL_17:

  return v17;
}

- (BOOL)isDEoCSupported
{
  int v3;
  void *v4;
  void *v5;

  if ((MGGetBoolAnswer() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    -[PowerUISmartChargeManager readNumberForPreferenceKey:](self, "readNumberForPreferenceKey:", CFSTR("allowDEoCOverride"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v3 = (int)(objc_msgSend(v4, "BOOLValue") << 31) >> 31;
    else
      LOBYTE(v3) = 0;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3 & 1;
}

- (void)isDEoCSupportedWithHandler:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, BOOL, _QWORD))a3 + 2))(v5, -[PowerUISmartChargeManager isDEoCSupported](self, "isDEoCSupported"), 0);

}

- (void)isDEoCCurrentlyEnabledWithHandler:(id)a3
{
  void (**v4)(id, unint64_t, _QWORD);
  NSObject *log;
  void *v6;
  unint64_t deocFeatureState;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, unint64_t, _QWORD))a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    deocFeatureState = self->_deocFeatureState;
    v8 = log;
    objc_msgSend(v6, "numberWithUnsignedInteger:", deocFeatureState);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "Returning current DEoC state: %@", (uint8_t *)&v10, 0xCu);

  }
  v4[2](v4, self->_deocFeatureState, 0);

}

- (void)client:(id)a3 setDEoCState:(unint64_t)a4 withHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  _BOOL4 v10;
  OS_os_log *log;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = -[PowerUISmartChargeManager isDEoCSupported](self, "isDEoCSupported");
  log = self->_log;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager client:setDEoCState:withHandler:].cold.1();
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = 4;
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)MEMORY[0x24BDD16E0];
    v13 = log;
    objc_msgSend(v12, "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "%@ requests DEoC state: %@", (uint8_t *)&v18, 0x16u);

  }
  if (!a4)
  {
    -[PowerUISmartChargeManager disableDEoC](self, "disableDEoC");
    goto LABEL_13;
  }
  if (a4 != 1)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = 1;
LABEL_12:
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v17);

    goto LABEL_13;
  }
  -[PowerUISmartChargeManager enableDEoC](self, "enableDEoC");
LABEL_13:
  v9[2](v9, 1, 0);

}

- (void)disableDEoC
{
  NSObject *v3;
  uint64_t v4;
  PowerUIAnalyticsManager *analyticsManager;
  void *v6;
  _QWORD block[5];

  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D443A38, CFSTR("DEoCFeatureState"));
  self->_deocFeatureState = 0;
  self->_isDesktopDevice = 0;
  -[PowerUISmartChargeManager forceDEoCReevaluation](self, "forceDEoCReevaluation");
  -[PowerUIChargingController clearChargeLimitForLimitType:](self->_chargingController, "clearChargeLimitForLimitType:", 2);
  -[PowerUISmartChargeManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__PowerUISmartChargeManager_disableDEoC__block_invoke;
  block[3] = &unk_24D3FB7B0;
  block[4] = self;
  dispatch_async(v3, block);

  AnalyticsSendEventLazy();
  analyticsManager = self->_analyticsManager;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context, v4, 3221225472, __40__PowerUISmartChargeManager_disableDEoC__block_invoke_2, &unk_24D3FBB70, self));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUIAnalyticsManager submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:](analyticsManager, "submitEngagementEventWithBatteryLevel:targetSoC:predictedEndOfCharge:modeOfOperation:eventType:", v6, 0, 0, 5, 4);

}

uint64_t __40__PowerUISmartChargeManager_disableDEoC__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallback:", 1);
}

id __40__PowerUISmartChargeManager_disableDEoC__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[PowerUISmartChargeUtilities recentEngagementHistory](PowerUISmartChargeUtilities, "recentEngagementHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("DEoCDisabled"), CFSTR("DisableType"));
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_INFO, "After DEoC disablement, reporting %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (void)enableDEoC
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: DEoC is enabling OBC. This should not happen unless the OBC configuration was changed manually.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)currentChargeLimitWithHandler:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, unint64_t, _QWORD))a3 + 2))(v5, -[PowerUISmartChargeManager currentChargeLimit](self, "currentChargeLimit"), 0);

}

- (void)getDEoCPredictionsWithHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  PowerUIMLRelevantDrainPredictor *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  int64_t v27;
  void (**v28)(id, void *, _QWORD);
  void *v29;
  _QWORD v30[7];
  _QWORD v31[7];
  _QWORD v32[3];
  _QWORD v33[5];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCE60];
  v28 = (void (**)(id, void *, _QWORD))a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities drainSessionsInfoBetweenRelevantChargesBefore:withMinimumDuration:](PowerUISmartChargeUtilities, "drainSessionsInfoBetweenRelevantChargesBefore:withMinimumDuration:", v5, 0.0);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = -[PowerUIMLRelevantDrainPredictor initWithDefaultsDomain:withContextStore:withTrialManager:]([PowerUIMLRelevantDrainPredictor alloc], "initWithDefaultsDomain:withContextStore:withTrialManager:", self->_defaultsDomain, self->_context, self->_trialManager);
  v8 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", self->_context);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v6;
  -[PowerUIMLRelevantDrainPredictor featuresForChargeSessionAtDate:withChargeStartSoC:withChargeAndDrainSessionHistory:](v7, "featuresForChargeSessionAtDate:withChargeStartSoC:withChargeAndDrainSessionHistory:", v9, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PowerUIMLRelevantDrainPredictor predictedRelevantDrainwithFeatures:](v7, "predictedRelevantDrainwithFeatures:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PowerUITrialManager longFactorForName:](self->_trialManager, "longFactorForName:", CFSTR("minDaysOfChargingHistoryRequiredForDEoCModel"));
  v27 = -[PowerUITrialManager longFactorForName:](self->_trialManager, "longFactorForName:", CFSTR("minNumberOfRelevantDrainsRequiredForDEoCModel"));
  v32[0] = CFSTR("confidence");
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "confidence");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v14;
  v32[1] = CFSTR("significantDrainAhead");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "significantDrainAhead"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v15;
  v32[2] = CFSTR("threshold");
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "threshold");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PowerUITrialManager experimentID](self->_trialManager, "experimentID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PowerUITrialManager experimentID](self->_trialManager, "experimentID");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("Nil");
  }
  -[PowerUITrialManager treatmentID](self->_trialManager, "treatmentID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[PowerUITrialManager treatmentID](self->_trialManager, "treatmentID");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = CFSTR("Nil");
  }
  v30[0] = CFSTR("predictions");
  v30[1] = CFSTR("features");
  v31[0] = v18;
  v31[1] = v11;
  v31[2] = v29;
  v30[2] = CFSTR("drainInfo");
  v30[3] = CFSTR("minDaysCharging");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v23;
  v30[4] = CFSTR("minNumberOfRelevantDrains");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v24;
  v31[5] = v20;
  v30[5] = CFSTR("trialexperiment");
  v30[6] = CFSTR("trialTreatment");
  v31[6] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v28[2](v28, v25, 0);
}

- (void)isOBCEngagedOrChargeLimitedWithHandler:(id)a3
{
  _CDLocalContext *context;
  void (**v5)(id, _BOOL8, unint64_t, _BOOL8, _QWORD);
  _BOOL4 v6;
  unint64_t checkpoint;
  _BOOL8 v8;
  _BOOL8 v9;
  unint64_t v10;
  NSObject *log;
  _DWORD v12[2];
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  context = self->_context;
  v5 = (void (**)(id, _BOOL8, unint64_t, _BOOL8, _QWORD))a3;
  v6 = +[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", context);
  checkpoint = self->_checkpoint;
  v8 = checkpoint - 2 < 3 && v6;
  v9 = checkpoint - 1 < 4 && v6;
  v10 = -[PowerUISmartChargeManager currentChargeLimit](self, "currentChargeLimit");
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109632;
    v12[1] = v8;
    v13 = 2048;
    v14 = v10;
    v15 = 1024;
    v16 = v9;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Returning currently engaged state: %u, charge limit: %lu, chargingOverrideAllowed: %u", (uint8_t *)v12, 0x18u);
  }
  v5[2](v5, v8, v10, v9, 0);

}

- (void)updateCurrentDEoCStatusAsGaugingMitigated
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: No currentDEoCStatus for gauging adjustment", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (BOOL)isCECSupported
{
  return +[PowerUICECManager isCECSupported](PowerUICECManager, "isCECSupported");
}

- (void)isCECSupportedWithHandler:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, BOOL, _QWORD))a3 + 2))(v5, -[PowerUISmartChargeManager isCECSupported](self, "isCECSupported"), 0);

}

- (void)isCECCurrentlyEnabledWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  uint64_t v6;
  NSObject *log;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  +[PowerUICECManager manager](PowerUICECManager, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cecState");

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = log;
    objc_msgSend(v8, "numberWithUnsignedInteger:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Returning current state: %@", (uint8_t *)&v11, 0xCu);

  }
  v4[2](v4, v6, 0);

}

- (void)client:(id)a3 setCECState:(unint64_t)a4 withHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  BOOL v10;
  NSObject *log;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = -[PowerUISmartChargeManager isCECSupported](self, "isCECSupported");
  log = self->_log;
  if (v10)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)MEMORY[0x24BDD16E0];
      v13 = log;
      objc_msgSend(v12, "numberWithUnsignedInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "%@ requests CEC state: %@", (uint8_t *)&v16, 0x16u);

    }
    +[PowerUICECManager manager](PowerUICECManager, "manager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handlePowerUICECStateChange:withHandler:", a4, v9);
  }
  else
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager client:setCECState:withHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v15);
  }

}

- (void)cecFullChargeDeadlineWithHandler:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(id, void *, _QWORD);

  v5 = (void (**)(id, void *, _QWORD))a3;
  +[PowerUICECManager manager](PowerUICECManager, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEngaged"))
  {
    objc_msgSend(v3, "userDeadline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5[2](v5, v4, 0);

}

- (void)shouldMCMBeDisplayedWithHandler:(id)a3
{
  void (**v4)(id, BOOL, _QWORD);
  NSObject *mcmLog;
  void *v6;
  _BOOL8 isChargePackConnected;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, BOOL, _QWORD))a3;
  if (-[PowerUISmartChargeManager isMCMSupported](self, "isMCMSupported"))
  {
    mcmLog = self->_mcmLog;
    if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      isChargePackConnected = self->_isChargePackConnected;
      v8 = mcmLog;
      objc_msgSend(v6, "numberWithBool:", isChargePackConnected);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "Returning whether MCM settings should be displayed: %@", (uint8_t *)&v10, 0xCu);

    }
    v4[2](v4, self->_isChargePackConnected, 0);
  }
  else
  {
    v4[2](v4, 0, 0);
  }

}

- (void)isMCMCurrentlyEnabledWithHandler:(id)a3
{
  void (**v4)(id, unint64_t, _QWORD);
  NSObject *mcmLog;
  void *v6;
  unint64_t mcmCurrentState;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, unint64_t, _QWORD))a3;
  mcmLog = self->_mcmLog;
  if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    mcmCurrentState = self->_mcmCurrentState;
    v8 = mcmLog;
    objc_msgSend(v6, "numberWithUnsignedInteger:", mcmCurrentState);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "Returning current MCM state: %@", (uint8_t *)&v10, 0xCu);

  }
  v4[2](v4, self->_mcmCurrentState, 0);

}

- (void)client:(id)a3 setMCMState:(unint64_t)a4 withHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  _BOOL4 v10;
  OS_os_log *mcmLog;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v10 = -[PowerUISmartChargeManager isMCMSupported](self, "isMCMSupported");
  mcmLog = self->_mcmLog;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)self->_mcmLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)MEMORY[0x24BDD16E0];
      v13 = mcmLog;
      objc_msgSend(v12, "numberWithUnsignedInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "%@ requests state: %@", (uint8_t *)&v19, 0x16u);

    }
    switch(a4)
    {
      case 2uLL:
        self->_mcmCurrentState = 2;
        v15 = &unk_24D4439C0;
        goto LABEL_13;
      case 1uLL:
        self->_mcmCurrentState = 1;
        -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D4438D0, CFSTR("MCMCurrentState"));
        goto LABEL_15;
      case 0uLL:
        self->_mcmCurrentState = 0;
        v15 = &unk_24D443A38;
LABEL_13:
        -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v15, CFSTR("MCMCurrentState"));
        -[PowerUISmartChargeManager mcmEnableCharging](self, "mcmEnableCharging");
LABEL_15:
        v9[2](v9, 1, 0);
        -[PowerUISmartChargeManager reportMCMStatusWithBatteryLevel:](self, "reportMCMStatusWithBatteryLevel:", 0xFFFFFFFFLL);
        goto LABEL_16;
    }
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_mcmLog, OS_LOG_TYPE_ERROR))
      -[PowerUISmartChargeManager client:setMCMState:withHandler:].cold.1();
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 4;
  }
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v18);

LABEL_16:
}

- (void)engageFrom:(id)a3 until:(id)a4 repeatUntil:(id)a5 overrideAllSignals:(BOOL)a6 withHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *log;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v8 = a6;
  v39 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, uint64_t))a7;
  -[PowerUISmartChargeManager setEngagementTimeOverride:](self, "setEngagementTimeOverride:", v12);
  -[PowerUISmartChargeManager setFullChargeDeadlineOverride:](self, "setFullChargeDeadlineOverride:", v13);
  -[PowerUISmartChargeManager setRepeatEngagementOverrideEndDate:](self, "setRepeatEngagementOverrideEndDate:", v14);
  v16 = (void *)MEMORY[0x24BDD16E0];
  -[PowerUISmartChargeManager engagementTimeOverride](self, "engagementTimeOverride");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceReferenceDate");
  objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v18, CFSTR("engagementTimeOverride"));

  v19 = (void *)MEMORY[0x24BDD16E0];
  -[PowerUISmartChargeManager fullChargeDeadlineOverride](self, "fullChargeDeadlineOverride");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  objc_msgSend(v19, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v21, CFSTR("fullChargeDeadlineOverride"));

  v22 = (void *)MEMORY[0x24BDD16E0];
  -[PowerUISmartChargeManager repeatEngagementOverrideEndDate](self, "repeatEngagementOverrideEndDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSinceReferenceDate");
  objc_msgSend(v22, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v24, CFSTR("repeatEngagementOverrideEndDate"));

  self->_overrideAllSignals = v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v25, CFSTR("overrideAllSignals"));

  }
  self->_predictorType = -1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v26, CFSTR("chargePredictionModel"));

  -[PowerUISmartChargeManager setEnabled:](self, "setEnabled:", 1);
  -[PowerUISmartChargeManager setCurrentState:](self, "setCurrentState:", 1);
  -[PowerUISmartChargeManager setTemporarilyDisabled:](self, "setTemporarilyDisabled:", 0);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)MEMORY[0x24BDD16E0];
    v29 = log;
    objc_msgSend(v28, "numberWithBool:", v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138413058;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v30;
    _os_log_impl(&dword_215A71000, v29, OS_LOG_TYPE_DEFAULT, "Top-off will engage after %@ targetting full deadline of %@. Repeat until %@, Signal override=%@", (uint8_t *)&v31, 0x2Au);

  }
  v15[2](v15, 1);

}

- (void)resetEngagementOverrideWithHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  NSObject *log;
  uint8_t v7[16];

  v4 = (void (**)(id, uint64_t))a3;
  -[PowerUISmartChargeManager setEngagementTimeOverride:](self, "setEngagementTimeOverride:", 0);
  -[PowerUISmartChargeManager setFullChargeDeadlineOverride:](self, "setFullChargeDeadlineOverride:", 0);
  -[PowerUISmartChargeManager setRepeatEngagementOverrideEndDate:](self, "setRepeatEngagementOverrideEndDate:", 0);
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", 0, CFSTR("engagementTimeOverride"));
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", 0, CFSTR("fullChargeDeadlineOverride"));
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", 0, CFSTR("repeatEngagementOverrideEndDate"));
  self->_predictorType = 2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", v5, CFSTR("chargePredictionModel"));

  -[PowerUISmartChargeManager setEnabled:](self, "setEnabled:", 1);
  -[PowerUISmartChargeManager setCurrentState:](self, "setCurrentState:", 1);
  -[PowerUISmartChargeManager setTemporarilyDisabled:](self, "setTemporarilyDisabled:", 0);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Overrides removed.", v7, 2u);
  }
  v4[2](v4, 1);

}

- (void)simulateCurrentOutputAsOfDate:(id)a3 overrideAllSignals:(BOOL)a4 withHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *, _QWORD);
  NSObject *log;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Simulating output", v15, 2u);
    }
    v11 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PowerUISmartChargeManager shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:](self, "shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:", v11, 80, v6, self->_modelTwoStagePredictor, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("decisionDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v9[2](v9, v13, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v14, 0);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v12, 0);
  }

}

- (void)enterDevelopmentMode
{
  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D443918, CFSTR("overrideCarryDetection"));
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D443918, CFSTR("activityMinHistory"));
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", &unk_24D443918, CFSTR("locIgnored"));
    -[PowerUISmartChargeManager resetDeviceHasLegitimateUsage](self, "resetDeviceHasLegitimateUsage");
  }
}

- (void)resetDevelopmentMode
{
  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", 0, CFSTR("overrideCarryDetection"));
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", 0, CFSTR("activityMinHistory"));
    -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", 0, CFSTR("locIgnored"));
    -[PowerUISmartChargeManager resetDeviceHasLegitimateUsage](self, "resetDeviceHasLegitimateUsage");
  }
}

- (void)currentLeewayWithHandler:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  -[PowerUISmartChargeManager modelTwoStagePredictor](self, "modelTwoStagePredictor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjustedDuration");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v6, v7, 0);

}

- (void)listMonitorSignals
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *log;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *obj;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = self->_monitors;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v44;
    *(_QWORD *)&v4 = 138412290;
    v33 = v4;
    v34 = *(_QWORD *)v44;
    do
    {
      v7 = 0;
      v35 = v5;
      do
      {
        if (*(_QWORD *)v44 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v37 = v7;
          objc_msgSend(v8, "detectedSignals");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v40 != v12)
                  objc_enumerationMutation(v9);
                log = self->_log;
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                  v16 = log;
                  v17 = (void *)objc_opt_class();
                  *(_DWORD *)buf = 138412546;
                  v48 = v17;
                  v49 = 2112;
                  v50 = v15;
                  v18 = v17;
                  _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Monitor of type '%@' detected signal with start date: %@", buf, 0x16u);

                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            }
            while (v11);
          }
          if (!objc_msgSend(v9, "count", v33))
          {
            v19 = self->_log;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = v19;
              v21 = (void *)objc_opt_class();
              *(_DWORD *)buf = v33;
              v48 = v21;
              v22 = v21;
              _os_log_impl(&dword_215A71000, v20, OS_LOG_TYPE_DEFAULT, "Monitor of type '%@' did not detect any valid signals.", buf, 0xCu);

            }
          }

          v6 = v34;
          v5 = v35;
          v7 = v37;
        }
        else if (objc_msgSend(v8, "signalID") == 4)
        {
          v23 = v8;
          v24 = self->_log;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = v24;
            v26 = (void *)objc_opt_class();
            v38 = v7;
            v27 = v26;
            objc_msgSend(v23, "requiredFullChargeDate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v48 = v26;
            v49 = 2112;
            v50 = v28;
            _os_log_impl(&dword_215A71000, v25, OS_LOG_TYPE_DEFAULT, "Required full charge date from %@: %@", buf, 0x16u);

            v7 = v38;
          }

        }
        else
        {
          v29 = self->_log;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v29;
            v31 = (void *)objc_opt_class();
            *(_DWORD *)buf = v33;
            v48 = v31;
            v32 = v31;
            _os_log_impl(&dword_215A71000, v30, OS_LOG_TYPE_DEFAULT, "Monitor of type '%@' does not respond to signals debug query.", buf, 0xCu);

          }
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v5);
  }

}

- (void)mcmEnableCharging
{
  self->_mcmForbidsCharging = 0;
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", MEMORY[0x24BDBD1C0], CFSTR("MCMForbidsCharging"));
  -[PowerUIChargingController clearChargeLimitForLimitType:](self->_chargingController, "clearChargeLimitForLimitType:", 5);
}

- (void)mcmDisableCharging
{
  self->_mcmForbidsCharging = 1;
  -[PowerUISmartChargeManager setNumber:forPreferenceKey:](self, "setNumber:forPreferenceKey:", MEMORY[0x24BDBD1C8], CFSTR("MCMForbidsCharging"));
  -[PowerUIChargingController setChargeLimitTo:forLimitType:](self->_chargingController, "setChargeLimitTo:forLimitType:", 91, 5);
}

- (BOOL)isMCMSupported
{
  return MGGetBoolAnswer();
}

- (id)mcmActiveNotificationRequest
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = objc_alloc_init(MEMORY[0x24BDF8800]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MCM_FEATURE_TITLE"), &stru_24D3FD658, CFSTR("Localizable-A149"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocale:", v7);

  objc_msgSend(v6, "setNumberStyle:", 3);
  objc_msgSend(v6, "setMaximumFractionDigits:", 0);
  objc_msgSend(v6, "setMultiplier:", &unk_24D443918);
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MCM_ACTIVE_BODY"), &stru_24D3FD658, CFSTR("Localizable-A149"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", &unk_24D443C18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBody:", v11);

  objc_msgSend(v2, "setCategoryIdentifier:", CFSTR("mcmActiveCategory"));
  objc_msgSend(v2, "setShouldHideDate:", 1);
  objc_msgSend(v2, "setShouldHideTime:", 1);
  objc_msgSend(v2, "setShouldSuppressDefaultAction:", 1);
  objc_msgSend(v2, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v2, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 480.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExpirationDate:", v12);

  objc_msgSend(MEMORY[0x24BDF8850], "iconForSystemImageNamed:", CFSTR("bolt.fill"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIcon:", v13);

  v14 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(MEMORY[0x24BDF88B0], "triggerWithTimeInterval:repeats:", 0, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestWithIdentifier:content:trigger:", CFSTR("mcmActiveNotification"), v2, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setDestinations:", 6);
  return v16;
}

- (void)reportMCMStatusWithBatteryLevel:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *mcmLog;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v3 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_mcmCurrentState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("mcmCurrentState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isChargePackConnected);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("isChargePackConnected"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_mcmForbidsCharging);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("mcmForbidsCharging"));

  if (v3 <= 0x64)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("batteryLevel"));

  }
  mcmLog = self->_mcmLog;
  if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, mcmLog, OS_LOG_TYPE_DEFAULT, "Reporting to PowerLog and BDC for MCM:", buf, 2u);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v5, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = self->_mcmLog;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v18 = v16;
          objc_msgSend(v5, "valueForKey:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v17;
          v28 = 2112;
          v29 = v19;
          _os_log_impl(&dword_215A71000, v18, OS_LOG_TYPE_DEFAULT, "  %@: %@", buf, 0x16u);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v13);
  }

  v20 = (void *)MEMORY[0x2199EC15C]();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogRegisteredEvent();
  -[NSDistributedNotificationCenter postNotificationName:object:userInfo:](self->_notificationCenter, "postNotificationName:object:userInfo:", CFSTR("com.apple.powerui.mcmstatusasnotification"), CFSTR("PowerUI"), v21);

  objc_autoreleasePoolPop(v20);
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4
{
  id v7;
  NSObject *v8;
  NSObject *mcmLog;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (a4 == 9)
  {
    mcmLog = self->_mcmLog;
    if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_215A71000, mcmLog, OS_LOG_TYPE_DEFAULT, "New accessory (%@), connection type: NFC", (uint8_t *)&v10, 0xCu);
    }
    -[PowerUISmartChargeManager accessoryNFCConnectionCallback:](self, "accessoryNFCConnectionCallback:", v7);
  }
  else if (a4 == 4)
  {
    v8 = self->_mcmLog;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "New accessory (%@), connection type: Inductive", (uint8_t *)&v10, 0xCu);
    }
    objc_storeStrong((id *)&self->_currentChargePackInductiveConnectionUUID, a3);
  }

}

- (void)accessoryNFCConnectionCallback:(id)a3
{
  ACCConnectionInfo *connectionInfoProvider;
  _QWORD v4[5];

  connectionInfoProvider = self->_connectionInfoProvider;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke;
  v4[3] = &unk_24D3FCB60;
  v4[4] = self;
  -[ACCConnectionInfo accessoryEndpointsForConnection:withReply:](connectionInfoProvider, "accessoryEndpointsForConnection:withReply:", a3, v4);
}

void __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 134218242;
    v26 = objc_msgSend(v6, "count");
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "%lu endpoints for NFC connection (%@)", buf, 0x16u);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    v13 = *MEMORY[0x24BE1A190];
    v14 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(v17 + 424);
        v19[0] = v14;
        v19[1] = 3221225472;
        v19[2] = __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1153;
        v19[3] = &unk_24D3FCB38;
        v19[4] = v17;
        objc_msgSend(v18, "accessoryProperty:forEndpoint:connection:withReply:", v13, v16, v5, v19);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

}

void __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1153(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "unsignedIntValue");
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(NSObject **)(v15 + 104);
    if (v14 == 66)
    {
      if (os_log_type_enabled(*(os_log_t *)(v15 + 104), OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Charge pack connected through NFC", buf, 2u);
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 440), a3);
      v17 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v17 + 432))
      {
        v18 = *(NSObject **)(v17 + 104);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v18, OS_LOG_TYPE_DEFAULT, "Cancel fidget mitigation timer", buf, 2u);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 432));
        v17 = *(_QWORD *)(a1 + 32);
      }
      *(_BYTE *)(v17 + 17) = 1;
      objc_msgSend(*(id *)(a1 + 32), "reportMCMStatusWithBatteryLevel:", 0xFFFFFFFFLL);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) <= 2uLL)
      {
        v38 = v13;
        v39 = v11;
        v40 = v10;
        v41 = v9;
        +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "getDeliveredNotifications");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v43;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v43 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "request");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "content");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "categoryIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("mcmActiveCategory"));

              if (v29)
              {
                v35 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
                v32 = v21;
                v10 = v40;
                v9 = v41;
                v13 = v38;
                v11 = v39;
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_215A71000, v35, OS_LOG_TYPE_DEFAULT, "MCM notification still active, don't display a new one.", buf, 2u);
                  v32 = v21;
                }
                goto LABEL_30;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
            if (v23)
              continue;
            break;
          }
        }

        +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "mcmActiveNotificationRequest");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "postNotificationWithRequest:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = *(_QWORD *)(a1 + 32);
        if (v32)
        {
          v10 = v40;
          if (os_log_type_enabled(*(os_log_t *)(v33 + 104), OS_LOG_TYPE_ERROR))
            __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1153_cold_1();
          v9 = v41;
        }
        else
        {
          ++*(_QWORD *)(v33 + 456);
          v36 = *(_QWORD **)(a1 + 32);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v36[57]);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setNumber:forPreferenceKey:", v37, CFSTR("NumberOfTimesMCMNotificationWasDisplayed"));

          v10 = v40;
          v9 = v41;
        }
        v13 = v38;
        v11 = v39;
LABEL_30:

      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(v15 + 104), OS_LOG_TYPE_ERROR))
    {
      __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1153_cold_2();
    }
  }
  else
  {
    v34 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v9;
      _os_log_impl(&dword_215A71000, v34, OS_LOG_TYPE_DEFAULT, "No NFC property value for endpoint (%@)", buf, 0xCu);
    }
  }

}

- (void)accessoryConnectionDetached:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *currentChargePackInductiveConnectionUUID;
  NSObject *mcmLog;
  const char *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", self->_currentChargePackNFCConnectionUUID))
  {
    if (objc_msgSend(v4, "isEqualToString:", self->_currentChargePackInductiveConnectionUUID))
    {
      currentChargePackInductiveConnectionUUID = self->_currentChargePackInductiveConnectionUUID;
      self->_currentChargePackInductiveConnectionUUID = 0;

      mcmLog = self->_mcmLog;
      if (!os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v9 = 138412290;
      v10 = v4;
      v8 = "Known inductive connection '%@' lost.";
    }
    else
    {
      mcmLog = self->_mcmLog;
      if (!os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v9 = 138412290;
      v10 = v4;
      v8 = "Accessory '%@' disconnected.";
    }
    _os_log_impl(&dword_215A71000, mcmLog, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0xCu);
    goto LABEL_12;
  }
  v5 = self->_mcmLog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Known charge pack disconnected (%@). Reset state.", (uint8_t *)&v9, 0xCu);
  }
  self->_isChargePackConnected = 0;
  -[PowerUISmartChargeManager mcmEnableCharging](self, "mcmEnableCharging");
  -[PowerUISmartChargeManager reportMCMStatusWithBatteryLevel:](self, "reportMCMStatusWithBatteryLevel:", 0xFFFFFFFFLL);
  -[PowerUISmartChargeManager clearManualChargeLimit](self, "clearManualChargeLimit");
  if (self->_mcmCurrentState == 2)
    -[PowerUISmartChargeManager startFidgetMitigationTimer](self, "startFidgetMitigationTimer");
LABEL_12:

}

- (void)startFidgetMitigationTimer
{
  NSObject *mcmLog;
  OS_dispatch_source *v4;
  OS_dispatch_source *mcmFidgetMitigationTimer;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD handler[5];
  uint8_t buf[16];

  mcmLog = self->_mcmLog;
  if (os_log_type_enabled(mcmLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, mcmLog, OS_LOG_TYPE_DEFAULT, "MCM is temporarily disabled, start fidget mitigation.", buf, 2u);
  }
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  mcmFidgetMitigationTimer = self->_mcmFidgetMitigationTimer;
  self->_mcmFidgetMitigationTimer = v4;

  v6 = self->_mcmFidgetMitigationTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __55__PowerUISmartChargeManager_startFidgetMitigationTimer__block_invoke;
  handler[3] = &unk_24D3FB7B0;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  v7 = self->_mcmFidgetMitigationTimer;
  v8 = dispatch_walltime(0, 480000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_activate((dispatch_object_t)self->_mcmFidgetMitigationTimer);
}

uint64_t __55__PowerUISmartChargeManager_startFidgetMitigationTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "MCM Fidget mitigation timer ran out, re-enable MCM.", v4, 2u);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "setNumber:forPreferenceKey:", &unk_24D4438D0, CFSTR("MCMCurrentState"));
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsDomain, a3);
}

- (id)beforeBatteryCallback
{
  return self->_beforeBatteryCallback;
}

- (void)setBeforeBatteryCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)afterBatteryCallback
{
  return self->_afterBatteryCallback;
}

- (void)setAfterBatteryCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_CDContextualKeyPath)checkpointKP
{
  return self->_checkpointKP;
}

- (void)setCheckpointKP:(id)a3
{
  objc_storeStrong((id *)&self->_checkpointKP, a3);
}

- (NSDistributedNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_os_log)mcmLog
{
  return self->_mcmLog;
}

- (void)setMcmLog:(id)a3
{
  objc_storeStrong((id *)&self->_mcmLog, a3);
}

- (unint64_t)checkpoint
{
  return self->_checkpoint;
}

- (void)setCheckpoint:(unint64_t)a3
{
  self->_checkpoint = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSDate)disabledUntilDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDisabledUntilDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)temporarilyDisabled
{
  return self->_temporarilyDisabled;
}

- (void)setTemporarilyDisabled:(BOOL)a3
{
  self->_temporarilyDisabled = a3;
}

- (NSDate)_fullChargeDeadline
{
  return self->__fullChargeDeadline;
}

- (void)set_fullChargeDeadline:(id)a3
{
  objc_storeStrong((id *)&self->__fullChargeDeadline, a3);
}

- (NSDate)uiDeadline
{
  return self->_uiDeadline;
}

- (void)setUiDeadline:(id)a3
{
  objc_storeStrong((id *)&self->_uiDeadline, a3);
}

- (void)setSignalDeadline:(id)a3
{
  objc_storeStrong((id *)&self->_signalDeadline, a3);
}

- (NSDate)lastComputedSignalDeadline
{
  return self->_lastComputedSignalDeadline;
}

- (void)setLastComputedSignalDeadline:(id)a3
{
  objc_storeStrong((id *)&self->_lastComputedSignalDeadline, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)xpcCallbackQueue
{
  return self->_xpcCallbackQueue;
}

- (void)setXpcCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCallbackQueue, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (int)powerlogToken
{
  return self->_powerlogToken;
}

- (void)setPowerlogToken:(int)a3
{
  self->_powerlogToken = a3;
}

- (OS_xpc_object)bdcConnection
{
  return self->_bdcConnection;
}

- (void)setBdcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_bdcConnection, a3);
}

- (BOOL)_hasLegitimateUsage
{
  return self->__hasLegitimateUsage;
}

- (void)set_hasLegitimateUsage:(BOOL)a3
{
  self->__hasLegitimateUsage = a3;
}

- (int)lastFullyCharged
{
  return self->_lastFullyCharged;
}

- (BOOL)lastChargerWasWireless
{
  return self->_lastChargerWasWireless;
}

- (void)setLastChargerWasWireless:(BOOL)a3
{
  self->_lastChargerWasWireless = a3;
}

- (NSDate)lastInterruptedTime
{
  return self->_lastInterruptedTime;
}

- (void)setLastInterruptedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastInterruptedTime, a3);
}

- (NSDate)potentialUnplugDate
{
  return self->_potentialUnplugDate;
}

- (void)setPotentialUnplugDate:(id)a3
{
  objc_storeStrong((id *)&self->_potentialUnplugDate, a3);
}

- (NSNumber)engagementsLastMonthBucket
{
  return self->_engagementsLastMonthBucket;
}

- (void)setEngagementsLastMonthBucket:(id)a3
{
  objc_storeStrong((id *)&self->_engagementsLastMonthBucket, a3);
}

- (NSNumber)lastReportedNumberOfPluginEvents
{
  return self->_lastReportedNumberOfPluginEvents;
}

- (void)setLastReportedNumberOfPluginEvents:(id)a3
{
  objc_storeStrong((id *)&self->_lastReportedNumberOfPluginEvents, a3);
}

- (NSNumber)medianPluginLength
{
  return self->_medianPluginLength;
}

- (void)setMedianPluginLength:(id)a3
{
  objc_storeStrong((id *)&self->_medianPluginLength, a3);
}

- (double)empiricalTimeToFullChargeDurationMinutes
{
  return self->_empiricalTimeToFullChargeDurationMinutes;
}

- (void)setEmpiricalTimeToFullChargeDurationMinutes:(double)a3
{
  self->_empiricalTimeToFullChargeDurationMinutes = a3;
}

- (int64_t)deadlineSignalID
{
  return self->_deadlineSignalID;
}

- (void)setDeadlineSignalID:(int64_t)a3
{
  self->_deadlineSignalID = a3;
}

- (BOOL)signalsIgnored
{
  return self->_signalsIgnored;
}

- (void)setSignalsIgnored:(BOOL)a3
{
  self->_signalsIgnored = a3;
}

- (double)debounceOverride
{
  return self->_debounceOverride;
}

- (void)setDebounceOverride:(double)a3
{
  self->_debounceOverride = a3;
}

- (unint64_t)predictorType
{
  return self->_predictorType;
}

- (void)setPredictorType:(unint64_t)a3
{
  self->_predictorType = a3;
}

- (int64_t)previousDecisionMakerID
{
  return self->_previousDecisionMakerID;
}

- (void)setPreviousDecisionMakerID:(int64_t)a3
{
  self->_previousDecisionMakerID = a3;
}

- (NSNumber)lastNonEngagementSignalID
{
  return self->_lastNonEngagementSignalID;
}

- (void)setLastNonEngagementSignalID:(id)a3
{
  objc_storeStrong((id *)&self->_lastNonEngagementSignalID, a3);
}

- (NSDate)previousDecisionMakerDate
{
  return self->_previousDecisionMakerDate;
}

- (void)setPreviousDecisionMakerDate:(id)a3
{
  objc_storeStrong((id *)&self->_previousDecisionMakerDate, a3);
}

- (PowerUIMLTwoStageModelPredictor)modelTwoStagePredictor
{
  return self->_modelTwoStagePredictor;
}

- (void)setModelTwoStagePredictor:(id)a3
{
  objc_storeStrong((id *)&self->_modelTwoStagePredictor, a3);
}

- (PowerUIIntelligenceManager)intelligenceManager
{
  return self->_intelligenceManager;
}

- (void)setIntelligenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_intelligenceManager, a3);
}

- (NSArray)monitors
{
  return self->_monitors;
}

- (void)setMonitors:(id)a3
{
  objc_storeStrong((id *)&self->_monitors, a3);
}

- (NSDictionary)powerLogStatus
{
  return (NSDictionary *)objc_getProperty(self, a2, 320, 1);
}

- (void)setPowerLogStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSDictionary)previousPowerLogStatus
{
  return (NSDictionary *)objc_getProperty(self, a2, 328, 1);
}

- (void)setPreviousPowerLogStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSDate)engagementTimeOverride
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (void)setEngagementTimeOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSDate)fullChargeDeadlineOverride
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (void)setFullChargeDeadlineOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSDate)repeatEngagementOverrideEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (void)setRepeatEngagementOverrideEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (BOOL)overrideAllSignals
{
  return self->_overrideAllSignals;
}

- (void)setOverrideAllSignals:(BOOL)a3
{
  self->_overrideAllSignals = a3;
}

- (BOOL)encounteredTLCDuringTopOff
{
  return self->_encounteredTLCDuringTopOff;
}

- (void)setEncounteredTLCDuringTopOff:(BOOL)a3
{
  self->_encounteredTLCDuringTopOff = a3;
}

- (BOOL)isDesktopDevice
{
  return self->_isDesktopDevice;
}

- (void)setIsDesktopDevice:(BOOL)a3
{
  self->_isDesktopDevice = a3;
}

- (NSDate)lastDesktopModeChangeDate
{
  return self->_lastDesktopModeChangeDate;
}

- (void)setLastDesktopModeChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastDesktopModeChangeDate, a3);
}

- (PowerUIBatteryMitigationManager)batteryMitigationManager
{
  return self->_batteryMitigationManager;
}

- (void)setBatteryMitigationManager:(id)a3
{
  objc_storeStrong((id *)&self->_batteryMitigationManager, a3);
}

- (PowerUIBDCDataManager)bdcDataManager
{
  return self->_bdcDataManager;
}

- (void)setBdcDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_bdcDataManager, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (BOOL)remoteOBCEngaged
{
  return self->_remoteOBCEngaged;
}

- (void)setRemoteOBCEngaged:(BOOL)a3
{
  self->_remoteOBCEngaged = a3;
}

- (PowerUIChargingController)chargingController
{
  return self->_chargingController;
}

- (void)setChargingController:(id)a3
{
  objc_storeStrong((id *)&self->_chargingController, a3);
}

- (PowerUIAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (unint64_t)mcmCurrentState
{
  return self->_mcmCurrentState;
}

- (void)setMcmCurrentState:(unint64_t)a3
{
  self->_mcmCurrentState = a3;
}

- (ACCConnectionInfo)connectionInfoProvider
{
  return self->_connectionInfoProvider;
}

- (void)setConnectionInfoProvider:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInfoProvider, a3);
}

- (OS_dispatch_source)mcmFidgetMitigationTimer
{
  return self->_mcmFidgetMitigationTimer;
}

- (void)setMcmFidgetMitigationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_mcmFidgetMitigationTimer, a3);
}

- (BOOL)isChargePackConnected
{
  return self->_isChargePackConnected;
}

- (void)setIsChargePackConnected:(BOOL)a3
{
  self->_isChargePackConnected = a3;
}

- (BOOL)mcmForbidsCharging
{
  return self->_mcmForbidsCharging;
}

- (void)setMcmForbidsCharging:(BOOL)a3
{
  self->_mcmForbidsCharging = a3;
}

- (NSString)currentChargePackNFCConnectionUUID
{
  return (NSString *)objc_getProperty(self, a2, 440, 1);
}

- (void)setCurrentChargePackNFCConnectionUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSString)currentChargePackInductiveConnectionUUID
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setCurrentChargePackInductiveConnectionUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (unint64_t)numberOfTimesMCMNotificationWasDisplayed
{
  return self->_numberOfTimesMCMNotificationWasDisplayed;
}

- (void)setNumberOfTimesMCMNotificationWasDisplayed:(unint64_t)a3
{
  self->_numberOfTimesMCMNotificationWasDisplayed = a3;
}

- (BOOL)OBCReengagementEvaluated
{
  return self->_OBCReengagementEvaluated;
}

- (void)setOBCReengagementEvaluated:(BOOL)a3
{
  self->_OBCReengagementEvaluated = a3;
}

- (unint64_t)deocFeatureState
{
  return self->_deocFeatureState;
}

- (void)setDeocFeatureState:(unint64_t)a3
{
  self->_deocFeatureState = a3;
}

- (NSLock)deocCurrentStatusLock
{
  return self->_deocCurrentStatusLock;
}

- (void)setDeocCurrentStatusLock:(id)a3
{
  objc_storeStrong((id *)&self->_deocCurrentStatusLock, a3);
}

- (unint64_t)manualChargeLimitStatus
{
  return self->_manualChargeLimitStatus;
}

- (void)setManualChargeLimitStatus:(unint64_t)a3
{
  self->_manualChargeLimitStatus = a3;
}

- (BOOL)manualChargeLimitWasEverEnabled
{
  return self->_manualChargeLimitWasEverEnabled;
}

- (void)setManualChargeLimitWasEverEnabled:(BOOL)a3
{
  self->_manualChargeLimitWasEverEnabled = a3;
}

- (__CFString)chargeLimitToken
{
  return self->_chargeLimitToken;
}

- (void)setChargeLimitToken:(__CFString *)a3
{
  self->_chargeLimitToken = a3;
}

- (unsigned)mclTargetSoC
{
  return self->_mclTargetSoC;
}

- (void)setMclTargetSoC:(unsigned __int8)a3
{
  self->_mclTargetSoC = a3;
}

- (unint64_t)recommendedLimit
{
  return self->_recommendedLimit;
}

- (void)setRecommendedLimit:(unint64_t)a3
{
  self->_recommendedLimit = a3;
}

- (NSDate)mclDisabledUntilDate
{
  return (NSDate *)objc_getProperty(self, a2, 504, 1);
}

- (void)setMclDisabledUntilDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (BOOL)becameOBCEligible
{
  return self->_becameOBCEligible;
}

- (void)setBecameOBCEligible:(BOOL)a3
{
  self->_becameOBCEligible = a3;
}

- (BOOL)reachedTargetSoC
{
  return self->_reachedTargetSoC;
}

- (void)setReachedTargetSoC:(BOOL)a3
{
  self->_reachedTargetSoC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mclDisabledUntilDate, 0);
  objc_storeStrong((id *)&self->_deocCurrentStatusLock, 0);
  objc_storeStrong((id *)&self->_currentChargePackInductiveConnectionUUID, 0);
  objc_storeStrong((id *)&self->_currentChargePackNFCConnectionUUID, 0);
  objc_storeStrong((id *)&self->_mcmFidgetMitigationTimer, 0);
  objc_storeStrong((id *)&self->_connectionInfoProvider, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_chargingController, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_bdcDataManager, 0);
  objc_storeStrong((id *)&self->_batteryMitigationManager, 0);
  objc_storeStrong((id *)&self->_lastDesktopModeChangeDate, 0);
  objc_storeStrong((id *)&self->_repeatEngagementOverrideEndDate, 0);
  objc_storeStrong((id *)&self->_fullChargeDeadlineOverride, 0);
  objc_storeStrong((id *)&self->_engagementTimeOverride, 0);
  objc_storeStrong((id *)&self->_previousPowerLogStatus, 0);
  objc_storeStrong((id *)&self->_powerLogStatus, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_intelligenceManager, 0);
  objc_storeStrong((id *)&self->_modelTwoStagePredictor, 0);
  objc_storeStrong((id *)&self->_previousDecisionMakerDate, 0);
  objc_storeStrong((id *)&self->_lastNonEngagementSignalID, 0);
  objc_storeStrong((id *)&self->_medianPluginLength, 0);
  objc_storeStrong((id *)&self->_lastReportedNumberOfPluginEvents, 0);
  objc_storeStrong((id *)&self->_engagementsLastMonthBucket, 0);
  objc_storeStrong((id *)&self->_potentialUnplugDate, 0);
  objc_storeStrong((id *)&self->_lastInterruptedTime, 0);
  objc_storeStrong((id *)&self->_bdcConnection, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_xpcCallbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastComputedSignalDeadline, 0);
  objc_storeStrong((id *)&self->_signalDeadline, 0);
  objc_storeStrong((id *)&self->_uiDeadline, 0);
  objc_storeStrong((id *)&self->__fullChargeDeadline, 0);
  objc_storeStrong((id *)&self->_disabledUntilDate, 0);
  objc_storeStrong((id *)&self->_mcmLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_checkpointKP, 0);
  objc_storeStrong(&self->_afterBatteryCallback, 0);
  objc_storeStrong(&self->_beforeBatteryCallback, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_3_434_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "Gauging mitigation callback, but state did not change", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_468_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "ReportAnalyticsRepeatingActivity checking in!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_2_471_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "ReportMonthlyAnalyticsActivity checking in!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __136__PowerUISmartChargeManager_initWithDefaultsDomain_contextStore_beforeHandlingBatteryChangeCallback_afterHandlingBatteryChangeCallback___block_invoke_472_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "BatteryHealthMetrics checking in!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)idleDurationWithEngagedCheckpoints:(void *)a1 withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3 = OUTLINED_FUNCTION_11();
  objc_msgSend(v4, "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v1, v6, "ERROR: idleStart after topOffStart, duration: %@", v7);

  OUTLINED_FUNCTION_8_0();
}

- (void)idleDurationWithEngagedCheckpoints:(void *)a1 withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:.cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3 = OUTLINED_FUNCTION_11();
  objc_msgSend(v4, "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v1, v6, "ERROR: idleStart after temporarilyDisabledStart, duration: %@", v7);

  OUTLINED_FUNCTION_8_0();
}

- (void)idleDurationWithEngagedCheckpoints:(void *)a1 withTopOffStartCheckpoints:withDisabledCheckpoints:withTopOffStart:withIdleStart:withTemporarilyDisabledStart:withPluginEnd:.cold.3(void *a1)
{
  NSObject *v1;
  id v2;
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3 = OUTLINED_FUNCTION_11();
  objc_msgSend(v4, "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v1, v6, "ERROR: idleStart after pluginEnd, duration: %@", v7);

  OUTLINED_FUNCTION_8_0();
}

- (void)constructAnalyticsStatusFromEvents:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint8_t v5[14];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  v6 = a1;
  _os_log_fault_impl(&dword_215A71000, a2, OS_LOG_TYPE_FAULT, "Negative idleDuration %@, events are %@", v5, 0x16u);

  OUTLINED_FUNCTION_0_1();
}

- (void)recordDEoCAnalytics:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_215A71000, a2, OS_LOG_TYPE_ERROR, "ERROR: Most recent drain out of bounds: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_6_0();
}

- (void)incomingBDCRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "incomingBDCRequest done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: unknown incoming xpc connection event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __48__PowerUISmartChargeManager_incomingBDCRequest___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "incoming xpc connection event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)sendBDCData:withMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Cannot create reply dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)sendBDCData:withMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: Ignoring BDC data message from unprivileged sender", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)sendBDCData:withMessage:.cold.3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  v3 = v0;
  OUTLINED_FUNCTION_9_0(&dword_215A71000, v1, (uint64_t)v1, "Invalid parameters. remoteConn: %@ msg: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)handleCallback:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_215A71000, v0, OS_LOG_TYPE_DEBUG, "Plugin date set to %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)handleCallback:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 9);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_215A71000, a2, OS_LOG_TYPE_DEBUG, "Skipping prediction check: Feature disabled (temporarily %d)", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_6_0();
}

- (void)handleCallback:(NSObject *)a3 .cold.3(void *a1, int a2, NSObject *a3)
{
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5[0] = 67109376;
  v5[1] = objc_msgSend(a1, "lastPluginStatus");
  v6 = 1024;
  v7 = a2;
  _os_log_debug_impl(&dword_215A71000, a3, OS_LOG_TYPE_DEBUG, "lastPluginStatus: %d - newPluginStatus: %d", (uint8_t *)v5, 0xEu);
}

- (void)handleCallback:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "Continue OBC evaluation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)handleCallback:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "Skipping prediction check: Nothing has changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)shouldContinueAfterMCMCheckWithBatteryLevel:withIsCharging:withIsExternalConnected:withIsPluggedIn:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "MCM was incorrectly forbidding charging.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)constructDailyStats:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3 = OUTLINED_FUNCTION_11();
  objc_msgSend(v4, "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v1, v6, "ERROR: Suspicious number of eligibleDurationHours: %@", v7);

  OUTLINED_FUNCTION_8_0();
}

- (void)constructDailyStats:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3 = OUTLINED_FUNCTION_11();
  objc_msgSend(v4, "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v1, v6, "ERROR: Suspicious number of idleDurationHours: %@", v7);

  OUTLINED_FUNCTION_8_0();
}

- (void)handleNewBatteryLevel:whileExternalConnected:fullyCharged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "Skipping prediction check: Device does not seem like a legitimate carry device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: No currentDEoCStatus at deadline adjustment stage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: No signalID key in deadlineResult", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)shouldDisableChargingAsOfDate:atBatteryLevel:overrideAllSignals:withPredictor:bypassSaved:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: DEoC limited by unexpected monitor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)chargePrediction:fullyCharged:previousCheckpoint:predictor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "Skipping prediction check: Device is already fully charged", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)chargePrediction:fullyCharged:previousCheckpoint:predictor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: Uncaught state in charge prediction.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)cacheCurrentDEoCBehaviorForced:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13(&dword_215A71000, v0, v1, "ERROR: Drain predictor model did not provide a result", v2);
  OUTLINED_FUNCTION_6_0();
}

- (void)cacheCurrentDEoCBehaviorForced:(NSObject *)a3 .cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_13(&dword_215A71000, a3, (uint64_t)a3, "Opting out of DEoC due to unexpected monitor", a1);
}

- (void)cacheCurrentDEoCBehaviorForced:(uint64_t)a3 .cold.4(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_1_0(&dword_215A71000, a2, a3, "ERROR: unknown DEoC feature state : %lu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)cacheCurrentDEoCBehaviorForced:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "Do not cache DEoC while plugged in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)cacheCurrentDEoCBehaviorForced:(unsigned __int8 *)a1 .cold.6(unsigned __int8 *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1[8];
  v5 = a2;
  objc_msgSend(v3, "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[9]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[PowerUISmartChargeUtilities isOBCSupported](PowerUISmartChargeUtilities, "isOBCSupported") ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a1, "isDEoCSupported") ^ 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138413058;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_debug_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEBUG, "!_enabled: %@ - _temporarilyDisabled: %@ - ![PowerUISmartChargeUtilities isOBCSupported]: %@ - ![self isDEoCSupported]: %@", (uint8_t *)&v10, 0x2Au);

}

- (void)handleNotificationResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Unknown action on charge recommendation response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "NSXPCListenerDelegate callback.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)client:setState:withHandler:.cold.1()
{
  void *v0;
  id v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  OUTLINED_FUNCTION_15();
  v6 = *MEMORY[0x24BDAC8D0];
  v2 = v1;
  objc_msgSend(v0, "stringFromState:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_9_0(&dword_215A71000, v2, v4, "%@ requests state: %@, but the state is not supported!", v5);

  OUTLINED_FUNCTION_0_1();
}

void __57__PowerUISmartChargeManager_client_setState_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A71000, v0, v1, "About to post OBC state change notification due to client set state request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)client:(uint64_t)a1 setMCLLimit:(void *)a2 withHandler:(unsigned __int8)a3 .cold.1(uint64_t a1, void *a2, unsigned __int8 a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(v4, "numberWithUnsignedChar:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_215A71000, v7, v8, "%@ requests MCL limit: %@, but this number is out of bounds!", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_0_1();
}

- (void)client:(uint64_t)a1 setMCLLimit:(void *)a2 withHandler:(unsigned __int8)a3 .cold.2(uint64_t a1, void *a2, unsigned __int8 a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a2;
  objc_msgSend(v4, "numberWithUnsignedChar:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_215A71000, v7, v8, "%@ requests MCL limit: %@, but MCL is not supported on this hardware!", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_0_1();
}

- (void)tmpDisableMCLViaClient:withHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "%@ requests MCL tmp disable, but MCL already disabled or temp disabled", v2);
  OUTLINED_FUNCTION_2();
}

- (void)tmpDisableMCLViaClient:withHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "%@ requests MCL tmp disable, but MCL is not supported on this hardware!", v2);
  OUTLINED_FUNCTION_2();
}

- (void)client:setDEoCState:withHandler:.cold.1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_15();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "numberWithUnsignedInteger:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_215A71000, v4, v5, "%@ requests DEoC state: %@, but DEoC is not supported on this hardware!", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

- (void)client:setCECState:withHandler:.cold.1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_15();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "numberWithUnsignedInteger:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_215A71000, v4, v5, "%@ requests state: %@, but CEC is not supported on this device!", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

- (void)client:setMCMState:withHandler:.cold.1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_15();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_14(), "numberWithUnsignedInteger:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7(&dword_215A71000, v4, v5, "%@ requests state: %@, but MCM is not supported on this hardware!", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

void __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1153_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "Unable to display MCM notification: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __60__PowerUISmartChargeManager_accessoryNFCConnectionCallback___block_invoke_1153_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "Unknown NFC property value: %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
