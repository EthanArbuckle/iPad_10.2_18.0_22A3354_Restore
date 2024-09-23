@implementation PowerUIIntelligenceManager

- (PowerUIIntelligenceManager)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  PowerUIIntelligenceManager *v12;
  os_log_t v13;
  OS_os_log *log;
  uint64_t v15;
  _OSChargingPredictor *chargingPredictor;
  NSDictionary *lastPluginPredictionInfo;
  NSObject *v18;
  uint8_t v20[16];
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PowerUIIntelligenceManager;
  v12 = -[PowerUIIntelligenceManager init](&v21, sel_init);
  if (v12)
  {
    v13 = os_log_create("com.apple.powerui.smartcharging.intelligence", "manager");
    log = v12->_log;
    v12->_log = (OS_os_log *)v13;

    objc_storeStrong((id *)&v12->_context, a4);
    objc_storeStrong((id *)&v12->_trialManager, a5);
    objc_msgSend(MEMORY[0x24BE6E030], "predictor");
    v15 = objc_claimAutoreleasedReturnValue();
    chargingPredictor = v12->_chargingPredictor;
    v12->_chargingPredictor = (_OSChargingPredictor *)v15;

    objc_storeStrong((id *)&v12->_defaultsDomain, a3);
    lastPluginPredictionInfo = v12->_lastPluginPredictionInfo;
    v12->_lastPluginPredictionInfo = 0;

    v18 = v12->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_215A71000, v18, OS_LOG_TYPE_DEFAULT, "Init powerui intelligence manager", v20, 2u);
    }
  }

  return v12;
}

- (id)queryPredictedPlugoutDate
{
  return (id)objc_opt_new();
}

- (void)handleCallback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  NSObject *log;
  _OSChargingPredictor *chargingPredictor;
  void *v12;
  id v13;
  _OSChargingPredictor *v14;
  void *v15;
  NSDictionary *v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSDictionary *v35;
  NSDictionary *lastPluginPredictionInfo;
  NSDictionary *v37;
  void *v38;
  double v39;
  double v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  NSObject *v51;
  NSDictionary *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  NSDictionary *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  uint8_t buf[4];
  _BYTE v84[10];
  void *v85;
  _QWORD v86[4];
  _QWORD v87[4];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[5];

  v91[3] = *MEMORY[0x24BDAC8D0];
  -[PowerUIIntelligenceManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PowerUIIntelligenceManager context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", v6);

    if (+[PowerUISmartChargeUtilities isiPhone](PowerUISmartChargeUtilities, "isiPhone")
      && +[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
    {
      +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("chargingIntelligenceNotificationEnabled"), self->_defaultsDomain);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

    }
    else
    {
      v9 = 0;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v84 = v7;
      *(_WORD *)&v84[4] = 1024;
      *(_DWORD *)&v84[6] = v9;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Handling callback in intelligence manager isPluggedIn: %d, notificationsEnabled: %d", buf, 0xEu);
    }
    if (v7)
    {
      chargingPredictor = self->_chargingPredictor;
      v82 = 0;
      -[_OSChargingPredictor chargePredictionOutputOfScheme:withError:](chargingPredictor, "chargePredictionOutputOfScheme:withError:", 1, &v82);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v82;
      v14 = self->_chargingPredictor;
      v81 = v13;
      -[_OSChargingPredictor chargePredictionOutputOfScheme:withError:](v14, "chargePredictionOutputOfScheme:withError:", 0, &v81);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (NSDictionary *)v81;

      if (v9)
        -[PowerUIIntelligenceManager postPluginNotificationWithPredictorOutput:andError:andState:](self, "postPluginNotificationWithPredictorOutput:andError:andState:", v12, v16, v5);
      v77 = v16;
      +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = CFSTR("predictedDurationSeconds");
      v17 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v15, "chargingDuration");
      objc_msgSend(v17, "numberWithDouble:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = v18;
      v90[1] = CFSTR("confidence");
      v19 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v15, "confidence");
      objc_msgSend(v19, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v91[1] = v20;
      v90[2] = CFSTR("meetsThreshold");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v15, "meetsSystemConfidenceThreshold"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v91[2] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v88[0] = CFSTR("predictedDurationSeconds");
      v23 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v12, "chargingDuration");
      objc_msgSend(v23, "numberWithDouble:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = v24;
      v88[1] = CFSTR("confidence");
      v25 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v12, "confidence");
      objc_msgSend(v25, "numberWithDouble:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v89[1] = v26;
      v88[2] = CFSTR("meetsThreshold");
      v79 = v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "meetsSystemConfidenceThreshold"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v89[2] = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v89, v88, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v86[0] = CFSTR("classicPredictionInfo");
      v86[1] = CFSTR("onPluginPredictionInfo");
      v87[0] = v22;
      v87[1] = v28;
      v87[2] = v76;
      v86[2] = CFSTR("pluginDate");
      v86[3] = CFSTR("isWireless");
      v29 = (void *)MEMORY[0x24BDD16E0];
      -[PowerUIIntelligenceManager context](self, "context");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithBool:", +[PowerUISmartChargeUtilities deviceConnectedToWirelessChargerWithContext:](PowerUISmartChargeUtilities, "deviceConnectedToWirelessChargerWithContext:", v30));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v87[3] = v31;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_lastPluginPredictionInfo, v32);
      +[PowerUISmartChargeUtilities setDict:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDict:forPreferenceKey:inDomain:", v32, CFSTR("intelligence-manager-predictions"), self->_defaultsDomain);
      v33 = self->_log;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v84 = v32;
        _os_log_impl(&dword_215A71000, v33, OS_LOG_TYPE_INFO, "Wrote prediction information %@ to defaults", buf, 0xCu);
      }

      v34 = v79;
      v35 = v77;
      goto LABEL_26;
    }
    -[PowerUIIntelligenceManager removePluginNotification](self, "removePluginNotification");
    lastPluginPredictionInfo = self->_lastPluginPredictionInfo;
    if (lastPluginPredictionInfo)
    {
      v35 = lastPluginPredictionInfo;
      -[NSDictionary objectForKeyedSubscript:](self->_lastPluginPredictionInfo, "objectForKeyedSubscript:", CFSTR("pluginDate"));
    }
    else
    {
      +[PowerUISmartChargeUtilities readDictForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readDictForPreferenceKey:inDomain:", CFSTR("intelligence-manager-predictions"), self->_defaultsDomain);
      v35 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PowerUISmartChargeUtilities setDict:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setDict:forPreferenceKey:inDomain:", MEMORY[0x24BDBD1B8], CFSTR("intelligence-manager-predictions"), self->_defaultsDomain);
    v37 = self->_lastPluginPredictionInfo;
    self->_lastPluginPredictionInfo = 0;

    if (v35 && -[NSDictionary count](v35, "count") && v34)
    {
      -[NSDictionary objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", CFSTR("pluginDate"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSinceDate:", v38);
      v40 = fabs(v39);

      if (v40 <= 300.0)
      {
        -[NSDictionary objectForKey:](v35, "objectForKey:", CFSTR("classicPredictionInfo"));
        v46 = objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          v47 = (void *)v46;
          -[NSDictionary objectForKey:](v35, "objectForKey:", CFSTR("onPluginPredictionInfo"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48)
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "now");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "timeIntervalSinceDate:", v34);
            v78 = (uint64_t)(v50 / 60.0);

            v51 = self->_log;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v84 = v34;
              _os_log_impl(&dword_215A71000, v51, OS_LOG_TYPE_INFO, "Logging metrics for charge session started at %@", buf, 0xCu);
            }
            v80 = v5;
            v52 = v35;
            -[NSDictionary objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", CFSTR("classicPredictionInfo"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = self->_log;
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_215A71000, v54, OS_LOG_TYPE_DEFAULT, "Posting metrics from classic predictions", buf, 2u);
            }
            objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("predictedDurationSeconds"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "integerValue") / 60;

            objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("confidence"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "doubleValue");
            v59 = v58;
            objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("meetsThreshold"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "integerValue");
            -[NSDictionary objectForKeyedSubscript:](v52, "objectForKeyedSubscript:", CFSTR("isWireless"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[PowerUIIntelligenceManager postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes:andActualDurationMinutes:andConfidence:didMeetThreshold:andWasWireless:andPredictionScheme:](self, "postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes:andActualDurationMinutes:andConfidence:didMeetThreshold:andWasWireless:andPredictionScheme:", v56, v78, v61, objc_msgSend(v62, "BOOLValue"), CFSTR("classic"), v59);

            -[NSDictionary objectForKeyedSubscript:](v52, "objectForKeyedSubscript:", CFSTR("onPluginPredictionInfo"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = self->_log;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_215A71000, v64, OS_LOG_TYPE_DEFAULT, "Posting metrics from on plugin predictions", buf, 2u);
            }
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("predictedDurationSeconds"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v65, "integerValue") / 60;

            -[PowerUIIntelligenceManager postAnalyticsEventForOldEventTypeWithPredictedDurationMinutes:andActualDurationMinutes:](self, "postAnalyticsEventForOldEventTypeWithPredictedDurationMinutes:andActualDurationMinutes:", v66, v78);
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("confidence"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "doubleValue");
            v69 = v68;
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("meetsThreshold"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "integerValue");
            -[NSDictionary objectForKeyedSubscript:](v52, "objectForKeyedSubscript:", CFSTR("isWireless"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "BOOLValue");
            v74 = v66;
            v35 = v52;
            -[PowerUIIntelligenceManager postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes:andActualDurationMinutes:andConfidence:didMeetThreshold:andWasWireless:andPredictionScheme:](self, "postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes:andActualDurationMinutes:andConfidence:didMeetThreshold:andWasWireless:andPredictionScheme:", v74, v78, v71, v73, CFSTR("onplugin"), v69);

            v5 = v80;
            goto LABEL_26;
          }
        }
        v75 = self->_log;
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v84 = v35;
          v42 = "Corrupted saved prediction doesn't contain classic/plugin prediction info %@";
          v43 = v75;
          v44 = 12;
          goto LABEL_25;
        }
      }
      else
      {
        v41 = self->_log;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v84 = v35;
          *(_WORD *)&v84[8] = 2112;
          v85 = v34;
          v42 = "Can't retrieve information on plugin that matches the saved prediction, \n"
                " saved info: %@ \n"
                " biome info %@";
          v43 = v41;
          v44 = 22;
LABEL_25:
          _os_log_impl(&dword_215A71000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
        }
      }
    }
    else
    {
      v45 = self->_log;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v42 = "Prediction for previous plugin not found";
        v43 = v45;
        v44 = 2;
        goto LABEL_25;
      }
    }
LABEL_26:

  }
}

- (void)postAnalyticsEventForOldEventTypeWithPredictedDurationMinutes:(int64_t)a3 andActualDurationMinutes:(int64_t)a4
{
  AnalyticsSendEventLazy();
}

id __117__PowerUIIntelligenceManager_postAnalyticsEventForOldEventTypeWithPredictedDurationMinutes_andActualDurationMinutes___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  *(float *)&v3 = (float)*(uint64_t *)(a1 + 40) / 60.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("actualDuration"));

  *(float *)&v5 = (float)*(uint64_t *)(a1 + 48) / 60.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("predictedDuration"));

  *(float *)&v7 = (float)(uint64_t)(*(_QWORD *)(a1 + 48) - *(_QWORD *)(a1 + 40)) / 60.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("durationDelta"));

  objc_msgSend(*(id *)(a1 + 32), "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v2;
    v13 = 2112;
    v14 = CFSTR("com.apple.smartcharging.plugoutpredictions");
    _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Logged %@ to %@ event in CA", (uint8_t *)&v11, 0x16u);
  }

  return v2;
}

- (void)postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes:(int64_t)a3 andActualDurationMinutes:(int64_t)a4 andConfidence:(double)a5 didMeetThreshold:(int)a6 andWasWireless:(BOOL)a7 andPredictionScheme:(id)a8
{
  id v8;
  id v9;

  v9 = a8;
  v8 = v9;
  AnalyticsSendEventLazy();

}

id __183__PowerUIIntelligenceManager_postAnalyticsEventForNewEventTypeWithPredictedDurationMinutes_andActualDurationMinutes_andConfidence_didMeetThreshold_andWasWireless_andPredictionScheme___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (30 * ((int)*(_QWORD *)(a1 + 48) / 30)));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("actualDuration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("actualDurationTrueValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (30 * ((int)*(_QWORD *)(a1 + 56) / 30)));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("predictedDuration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("predictedDurationTrueValue"));

  v7 = *(_QWORD *)(a1 + 56) - *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (15 * ((int)v7 / 15)));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("durationDelta"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("durationDeltaTrueValue"));

  LODWORD(v10) = vcvtmd_s64_f64(*(double *)(a1 + 64) * 10.0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("confidenceTrueValue"));

  LODWORD(v12) = vcvtmd_s64_f64(*(double *)(a1 + 64) * 10.0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("confidence"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 72));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("meetsThreshold"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("obc-v1-isWireless=%d-%@"), *(unsigned __int8 *)(a1 + 76), *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("modelInfo"));

  objc_msgSend(*(id *)(a1 + 40), "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v2;
    v20 = 2112;
    v21 = CFSTR("com.apple.smartcharging.plugoutpredictions.discrete.v2");
    _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Logged %@ to %@ event in CA", buf, 0x16u);
  }

  return v2;
}

- (void)postPluginNotificationWithPredictorOutput:(id)a3 andError:(id)a4 andState:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *log;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Prediction failed, please file a radar by tapping the notification"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v13 = log;
        objc_msgSend(v9, "localizedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412290;
        v24 = v14;
        _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_DEFAULT, "Error querying the predictor %@", (uint8_t *)&v23, 0xCu);

      }
      +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUIIntelligenceManager ttrURLforBadPredictionsWithStateDictionary:](self, "ttrURLforBadPredictionsWithStateDictionary:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 30.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v15, "postInternalChargingIntelligenceNotificationWithChargingStatus:information:url:validUntil:", 1, v11, v16, v17);

    }
    else
    {
      +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "chargingDuration");
      v20 = v19;
      objc_msgSend(v8, "confidence");
      objc_msgSend(v11, "postInternalChargeDurationNotificationWithDuration:withConfidence:", v20, v21);
    }

    v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_DEFAULT, "Posted plugin notification ", (uint8_t *)&v23, 2u);
    }
  }

}

- (void)removePluginNotification
{
  void *v3;
  NSObject *log;
  uint8_t v5[16];

  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    +[PowerUINotificationManager sharedInstance](PowerUINotificationManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelNotificationRequestWithIdentifier:", CFSTR("charging-intelligence-notification"));

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Removed plugin notification", v5, 2u);
    }
  }
}

- (id)ttrURLforBadPredictionsWithStateDictionary:(id)a3
{
  _CDContext *context;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
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

  v19 = *MEMORY[0x24BDAC8D0];
  context = self->_context;
  v5 = a3;
  v6 = +[PowerUISmartChargeUtilities currentBatteryLevelWithContext:](PowerUISmartChargeUtilities, "currentBatteryLevelWithContext:", context);
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("tap-to-radar://new?Title=Duration Predictor Failure (Unplugged at %@ percent)&Classification=Serious Bug&ComponentID=971083&ComponentName=PowerUI&ComponentVersion=all&Reproducible=Sometimes&Description=PLEASE ANSWER THESE QUESTIONS TO AID DEBUGGING:\n\n* Why did you unplug your device at %@?\n* Do you usually leave your device charged for a while at this time?\n* Is this your regular carry device? \n\n\n DebugInfo:\n %@"), v8, v10, v5);
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

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_CDContext)context
{
  return self->_context;
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

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (_OSChargingPredictor)chargingPredictor
{
  return self->_chargingPredictor;
}

- (void)setChargingPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_chargingPredictor, a3);
}

- (NSDictionary)lastPluginPredictionInfo
{
  return self->_lastPluginPredictionInfo;
}

- (void)setLastPluginPredictionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lastPluginPredictionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPluginPredictionInfo, 0);
  objc_storeStrong((id *)&self->_chargingPredictor, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
