@implementation TVRCAnalytics

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_6);
  return (id)sharedInstance_instance;
}

void __31__TVRCAnalytics_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

- (void)logPresentationFrom:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

uint64_t __37__TVRCAnalytics_logPresentationFrom___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentationSourceEventDictionaryFor:", *(_QWORD *)(a1 + 40));
}

- (id)_presentationSourceEventDictionaryFor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("source");
  v8[0] = a3;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)logConnectingSpinnerShown:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __43__TVRCAnalytics_logConnectingSpinnerShown___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_spinnerShownDictionaryFor:", CFSTR("connecting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_spinnerShownDictionaryFor:", CFSTR("connecting"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)logSearchingSpinnerShown
{
  AnalyticsSendEventLazy();
}

uint64_t __41__TVRCAnalytics_logSearchingSpinnerShown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_spinnerShownDictionaryFor:", CFSTR("searching"));
}

- (id)_spinnerShownDictionaryFor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("type");
  v8[0] = a3;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)logConnectionStatus:(int64_t)a3 type:(int64_t)a4 reason:(int64_t)a5
{
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  __CFString *v11;

  v6 = &stru_24DCDC4B0;
  if ((unint64_t)(a3 - 1) <= 2)
    v6 = off_24DCD7DD0[a3 - 1];
  TVRCDeviceConnectionTypeDescription(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("deviceUnpaired");
  if (a3 != 1)
    v8 = &stru_24DCDC4B0;
  v10 = v7;
  v11 = (__CFString *)v8;
  v9 = v7;
  AnalyticsSendEventLazy();

}

uint64_t __49__TVRCAnalytics_logConnectionStatus_type_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionDictionaryForType:status:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)_connectionDictionaryForType:(id)a3 status:(id)a4 reason:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("type"));
  if (v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("status"));
  if (v9)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("reason"));

  return v11;
}

- (void)logShortcutActionRunWithType:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __46__TVRCAnalytics_logShortcutActionRunWithType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("type");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)logSessionStatistics:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "sessionStartTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceNow");
    v8 = fabs(v7);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("duration"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "usedRTI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("usedRTI"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "usedSiri"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("usedSiri"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "requiredPairing"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("requiredPairing"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "directionalControlsEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("dcontrolsEnabled"));

  objc_msgSend(v3, "launchContextDesc");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "launchContextDesc");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("launchContext"));

  }
  v17 = v4;
  v16 = v4;
  AnalyticsSendEventLazy();

}

id __38__TVRCAnalytics_logSessionStatistics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logFindingSessionStatistics:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "sessionEndTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStartTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  objc_msgSend(v6, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("sessionDuration"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "firstMeasurementTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStartTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  objc_msgSend(v10, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("timeToFirstMeasurement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "remoteIsConnectedToATV"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("remoteIsConnectedToATV"));

  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "startingProximityMeasurement");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("startingProximityMeasurement"));

  v17 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "endingProximityMeasurement");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("endingProximityMeasurement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "numberOfGotCloserRegionTransitions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("numberOfGotCloserRegionTransitions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "numberOfGotFartherRegionTransitions"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("numberOfGotFartherRegionTransitions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "gotToHere"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("gotToHere"));

  v22 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "timeToHere");
  v24 = v23;

  objc_msgSend(v22, "numberWithDouble:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("timeToHere"));

  v27 = v5;
  v26 = v5;
  AnalyticsSendEventLazy();

}

id __45__TVRCAnalytics_logFindingSessionStatistics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
