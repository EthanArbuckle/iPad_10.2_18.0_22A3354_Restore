@implementation PRBTCoreAnalytics

- (PRBTCoreAnalytics)init
{
  PRBTCoreAnalytics *v2;
  PRBTCoreAnalytics *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  OS_os_log *logger;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PRBTCoreAnalytics;
  v2 = -[PRBTCoreAnalytics init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PRBTCoreAnalytics resetState](v2, "resetState");
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v5;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACD8]), "initWithIdentifier:", v5);
    -[PRBTCoreAnalytics setAuthSession:](v3, "setAuthSession:", v6);

    -[PRBTCoreAnalytics authSession](v3, "authSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "set_appleIDContext:", v7);

    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRBTCoreAnalytics setUrlSession:](v3, "setUrlSession:", v8);

    v9 = objc_alloc_init(MEMORY[0x24BDB4398]);
    objc_msgSend(v9, "aa_primaryAppleAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "aa_personID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "credential");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "credentialItemForKey:", *MEMORY[0x24BDB4360]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Basic %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRBTCoreAnalytics setAuthHeaderValue:](v3, "setAuthHeaderValue:", v17);

    v18 = os_log_create("com.apple.proximity", "btlocalizer_analytics");
    logger = v3->_logger;
    v3->_logger = (OS_os_log *)v18;

  }
  return v3;
}

- (void)resetState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PRBTCoreAnalytics setShouldLogProximityLevelFoundEvent:](self, "setShouldLogProximityLevelFoundEvent:", 1);
  -[PRBTCoreAnalytics setShouldLogMotionEvent:](self, "setShouldLogMotionEvent:", 1);
  -[PRBTCoreAnalytics setShouldLogEnteredArmsReachEvent:](self, "setShouldLogEnteredArmsReachEvent:", 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics setBtRssiEstimate:](self, "setBtRssiEstimate:", v3);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics setTraveledDistance:](self, "setTraveledDistance:", v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics setNumberOfPoses:](self, "setNumberOfPoses:", v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics setNumberOfMeasurements:](self, "setNumberOfMeasurements:", v6);

  -[PRBTCoreAnalytics setLatestProximityLevel:](self, "setLatestProximityLevel:", 0);
}

- (id)eventDictionaryWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double MachTimeSeconds;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[9];
  _QWORD v34[11];

  v34[9] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PRBTCoreAnalytics sessionId](self, "sessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    MachTimeSeconds = PRCommonGetMachTimeSeconds();
    -[PRBTCoreAnalytics startTime](self, "startTime");
    objc_msgSend(v6, "numberWithDouble:", MachTimeSeconds - v8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PRBTCoreAnalytics eventNumber](self, "eventNumber"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRBTCoreAnalytics setEventNumber:](self, "setEventNumber:", -[PRBTCoreAnalytics eventNumber](self, "eventNumber") + 1);
    v33[0] = CFSTR("sessionId");
    -[PRBTCoreAnalytics sessionId](self, "sessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v11;
    v33[1] = CFSTR("eventNumber");
    objc_msgSend(v31, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v12;
    v34[2] = v32;
    v33[2] = CFSTR("timeElapsed");
    v33[3] = CFSTR("traveledDistance");
    -[PRBTCoreAnalytics traveledDistance](self, "traveledDistance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v13;
    v34[4] = v30;
    v33[4] = CFSTR("straightLineDistance");
    v33[5] = CFSTR("btRssiEstimate");
    -[PRBTCoreAnalytics btRssiEstimate](self, "btRssiEstimate");
    v14 = objc_claimAutoreleasedReturnValue();
    v34[5] = v14;
    v33[6] = CFSTR("numberOfMeasurements");
    -[PRBTCoreAnalytics numberOfMeasurements](self, "numberOfMeasurements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[6] = v15;
    v33[7] = CFSTR("numberOfPoses");
    -[PRBTCoreAnalytics numberOfPoses](self, "numberOfPoses");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[8] = CFSTR("eventType");
    v34[7] = v16;
    v34[8] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRBTCoreAnalytics runId](self, "runId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = v19 == 0;

    if ((v14 & 1) == 0)
    {
      -[PRBTCoreAnalytics runId](self, "runId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("runId"));

    }
    -[PRBTCoreAnalytics customData](self, "customData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

    if (!v23)
    {
      -[PRBTCoreAnalytics customData](self, "customData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addEntriesFromDictionary:", v24);

    }
    -[PRBTCoreAnalytics productUUID](self, "productUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    if (!v26)
    {
      -[PRBTCoreAnalytics productUUID](self, "productUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("ProductUUID"));

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)sendAnalyticsEvent:(id)a3
{
  id v4;
  NSObject *logger;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "Logging event %@", (uint8_t *)&v6, 0xCu);
    }
    -[PRBTCoreAnalytics sendLiveOnAnalytics:](self, "sendLiveOnAnalytics:", v4);
  }

}

- (void)configureSession:(BOOL)a3 withProductUUID:(id)a4
{
  _BOOL8 v4;
  void *v6;
  CABTSessionData *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics setSessionId:](self, "setSessionId:", v6);

  -[PRBTCoreAnalytics setEventNumber:](self, "setEventNumber:", 0);
  -[PRBTCoreAnalytics setStartTime:](self, "setStartTime:", PRCommonGetMachTimeSeconds());
  -[PRBTCoreAnalytics setProductUUID:](self, "setProductUUID:", v11);
  v7 = objc_alloc_init(CABTSessionData);
  -[PRBTCoreAnalytics setSessionData:](self, "setSessionData:", v7);

  -[PRBTCoreAnalytics sessionData](self, "sessionData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProductUUID:", v11);

  -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("Configure"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics sessionData](self, "sessionData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configure:withOwner:", v9, v4);

  -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v9);
}

- (void)configureComplete:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("ConfigureComplete"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics sessionData](self, "sessionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureComplete:withTxPower:", v6, v3);

  -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v6);
}

- (BOOL)isRunning
{
  void *v2;
  BOOL v3;

  -[PRBTCoreAnalytics runId](self, "runId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)start
{
  void *v3;
  void *v4;
  id v5;
  CABTRunData *v6;
  id v7;
  id v8;

  -[PRBTCoreAnalytics resetState](self, "resetState");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics setRunId:](self, "setRunId:");

  v6 = objc_alloc_init(CABTRunData);
  -[PRBTCoreAnalytics setRunData:](self, "setRunData:");

  -[PRBTCoreAnalytics productUUID](self, "productUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics runData](self, "runData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProductUUID:", v7);

  -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("Start"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics runData](self, "runData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start:", v8);

  -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v8);
}

- (void)addLatestProximityLevel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PRBTCoreAnalytics latestProximityLevel](self, "latestProximityLevel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v10 = CFSTR("proximityLevel");
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[PRBTCoreAnalytics latestProximityLevel](self, "latestProximityLevel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "proximityLevel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addEntriesFromDictionary:", v9);
  }

}

- (void)stop
{
  void *v3;
  void *v4;
  id v5;

  if (-[PRBTCoreAnalytics isRunning](self, "isRunning"))
  {
    -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("Stop"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PRBTCoreAnalytics addLatestProximityLevel:](self, "addLatestProximityLevel:");
    -[PRBTCoreAnalytics runData](self, "runData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stop:", v5);

    -[PRBTCoreAnalytics runData](self, "runData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logData");

    -[PRBTCoreAnalytics setRunData:](self, "setRunData:", 0);
    -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v5);
    -[PRBTCoreAnalytics setRunId:](self, "setRunId:", 0);
    -[PRBTCoreAnalytics setRunData:](self, "setRunData:", 0);

  }
}

- (void)deinit
{
  void *v3;
  void *v4;
  id v5;

  -[PRBTCoreAnalytics stop](self, "stop");
  -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("Deinit"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics sessionData](self, "sessionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deinit:", v5);

  -[PRBTCoreAnalytics sessionData](self, "sessionData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logData");

  -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v5);
}

- (void)invalidPoseDetected
{
  void *v3;
  id v4;

  -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("InvalidPose"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics runData](self, "runData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidPose:", v4);

  -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v4);
}

- (void)updateWithProximityLevel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PRBTCoreAnalytics setLatestProximityLevel:](self, "setLatestProximityLevel:");
  if (-[PRBTCoreAnalytics shouldLogProximityLevelFoundEvent](self, "shouldLogProximityLevelFoundEvent"))
  {
    -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("ProximityLevelFound"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRBTCoreAnalytics addLatestProximityLevel:](self, "addLatestProximityLevel:", v4);
    -[PRBTCoreAnalytics runData](self, "runData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proximityLevelFound:", v4);

    -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v4);
    -[PRBTCoreAnalytics setShouldLogProximityLevelFoundEvent:](self, "setShouldLogProximityLevelFoundEvent:", 0);

  }
  if (objc_msgSend(v8, "proximityLevel") == 4
    && -[PRBTCoreAnalytics shouldLogEnteredArmsReachEvent](self, "shouldLogEnteredArmsReachEvent"))
  {
    -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("EnteredArmsReach"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v6);
    -[PRBTCoreAnalytics runData](self, "runData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setArmsReachEvent:", v6);

    -[PRBTCoreAnalytics setShouldLogEnteredArmsReachEvent:](self, "setShouldLogEnteredArmsReachEvent:", 0);
  }

}

- (void)revokeProximityLevel
{
  void *v3;
  id v4;
  id v5;

  if (!-[PRBTCoreAnalytics shouldLogProximityLevelFoundEvent](self, "shouldLogProximityLevelFoundEvent"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -200.0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PRBTCoreAnalytics setBtRssiEstimate:](self, "setBtRssiEstimate:");

    -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("ProximityLevelRevoked"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PRBTCoreAnalytics runData](self, "runData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "proximityLevelRevoked:", v5);

    -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v5);
    -[PRBTCoreAnalytics setShouldLogProximityLevelFoundEvent:](self, "setShouldLogProximityLevelFoundEvent:", 1);

  }
}

- (void)rangingFailedWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCED8];
  v13 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v7, CFSTR("status"), v8, CFSTR("errorDescription"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("RangingError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "addEntriesFromDictionary:", v9);
    if (-[PRBTCoreAnalytics isRunning](self, "isRunning"))
      -[PRBTCoreAnalytics runData](self, "runData");
    else
      -[PRBTCoreAnalytics sessionData](self, "sessionData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error:", v11);

    -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v11);
  }

}

- (void)updateWithRssiMeasurement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(int)objc_msgSend(v11, "rssi"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics setBtRssiEstimate:](self, "setBtRssiEstimate:", v4);

  v5 = (void *)MEMORY[0x24BDD16E0];
  -[PRBTCoreAnalytics numberOfMeasurements](self, "numberOfMeasurements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRBTCoreAnalytics setNumberOfMeasurements:](self, "setNumberOfMeasurements:", v7);

  -[PRBTCoreAnalytics numberOfMeasurements](self, "numberOfMeasurements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "intValue");

  if ((_DWORD)v7 == 1)
  {
    -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("FirstRssiMeasurement"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRBTCoreAnalytics runData](self, "runData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstRssiMeasurement:", v9);

    -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v9);
  }

}

- (void)targetMovingStateChanged:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, CFSTR("status"), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PRBTCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("TargetMoving"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  if (-[PRBTCoreAnalytics shouldLogMotionEvent](self, "shouldLogMotionEvent"))
  {
    objc_msgSend(v7, "addEntriesFromDictionary:", v9);
    -[PRBTCoreAnalytics runData](self, "runData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "motion:", v7);

    -[PRBTCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v7);
LABEL_4:
    -[PRBTCoreAnalytics setShouldLogMotionEvent:](self, "setShouldLogMotionEvent:", !v3);
  }

}

+ (BOOL)isInternalBuild
{
  if (+[PRBTCoreAnalytics isInternalBuild]::onceToken != -1)
    dispatch_once(&+[PRBTCoreAnalytics isInternalBuild]::onceToken, &__block_literal_global);
  return +[PRBTCoreAnalytics isInternalBuild]::isInternalBuild;
}

uint64_t __36__PRBTCoreAnalytics_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  +[PRBTCoreAnalytics isInternalBuild]::isInternalBuild = result;
  return result;
}

- (void)sendLiveOnAnalytics:(id)a3
{
  id v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "isInternalBuild");
  if (v4)
    v6 = v5;
  else
    v6 = 0;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("com.apple.proximity.findmy.btlocalizer.event"), CFSTR("eventName"));
    objc_msgSend(v7, "addEntriesFromDictionary:", v4);
    if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v7) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://gateway.icloud.com/acsnservice/metrics"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
      v20 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v7, 1, &v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v20;
      if (v11)
      {
        NSLog(CFSTR("LiveOn analytics: Error creating JSON payload data"));
      }
      else
      {
        objc_msgSend(v9, "setHTTPBody:", v10);
        -[PRBTCoreAnalytics authHeaderValue](self, "authHeaderValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:forHTTPHeaderField:", v12, CFSTR("Authorization"));

        -[PRBTCoreAnalytics urlSession](self, "urlSession");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __41__PRBTCoreAnalytics_sendLiveOnAnalytics___block_invoke;
        v18 = &unk_24EC11318;
        v19 = v7;
        objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v9, &v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "resume", v15, v16, v17, v18);
      }

    }
  }

}

void __41__PRBTCoreAnalytics_sendLiveOnAnalytics___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "statusCode");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("eventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("URL request response status %ld for event %@"), v4, v5);

}

- (NSDictionary)customData
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCustomData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (NSUUID)runId
{
  return self->_runId;
}

- (void)setRunId:(id)a3
{
  objc_storeStrong((id *)&self->_runId, a3);
}

- (int64_t)eventNumber
{
  return self->_eventNumber;
}

- (void)setEventNumber:(int64_t)a3
{
  self->_eventNumber = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
  objc_storeStrong((id *)&self->_productUUID, a3);
}

- (PRBTProximityMeasurement)latestProximityLevel
{
  return self->_latestProximityLevel;
}

- (void)setLatestProximityLevel:(id)a3
{
  objc_storeStrong((id *)&self->_latestProximityLevel, a3);
}

- (NSNumber)btRssiEstimate
{
  return self->_btRssiEstimate;
}

- (void)setBtRssiEstimate:(id)a3
{
  objc_storeStrong((id *)&self->_btRssiEstimate, a3);
}

- (NSNumber)traveledDistance
{
  return self->_traveledDistance;
}

- (void)setTraveledDistance:(id)a3
{
  objc_storeStrong((id *)&self->_traveledDistance, a3);
}

- (NSNumber)numberOfPoses
{
  return self->_numberOfPoses;
}

- (void)setNumberOfPoses:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfPoses, a3);
}

- (NSNumber)numberOfMeasurements
{
  return self->_numberOfMeasurements;
}

- (void)setNumberOfMeasurements:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfMeasurements, a3);
}

- (BOOL)shouldLogProximityLevelFoundEvent
{
  return self->_shouldLogProximityLevelFoundEvent;
}

- (void)setShouldLogProximityLevelFoundEvent:(BOOL)a3
{
  self->_shouldLogProximityLevelFoundEvent = a3;
}

- (BOOL)shouldLogMotionEvent
{
  return self->_shouldLogMotionEvent;
}

- (void)setShouldLogMotionEvent:(BOOL)a3
{
  self->_shouldLogMotionEvent = a3;
}

- (BOOL)shouldLogEnteredArmsReachEvent
{
  return self->_shouldLogEnteredArmsReachEvent;
}

- (void)setShouldLogEnteredArmsReachEvent:(BOOL)a3
{
  self->_shouldLogEnteredArmsReachEvent = a3;
}

- (AKAppleIDSession)authSession
{
  return self->_authSession;
}

- (void)setAuthSession:(id)a3
{
  objc_storeStrong((id *)&self->_authSession, a3);
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (NSString)authHeaderValue
{
  return self->_authHeaderValue;
}

- (void)setAuthHeaderValue:(id)a3
{
  objc_storeStrong((id *)&self->_authHeaderValue, a3);
}

- (CABTSessionData)sessionData
{
  return self->_sessionData;
}

- (void)setSessionData:(id)a3
{
  objc_storeStrong((id *)&self->_sessionData, a3);
}

- (CABTRunData)runData
{
  return self->_runData;
}

- (void)setRunData:(id)a3
{
  objc_storeStrong((id *)&self->_runData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runData, 0);
  objc_storeStrong((id *)&self->_sessionData, 0);
  objc_storeStrong((id *)&self->_authHeaderValue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_authSession, 0);
  objc_storeStrong((id *)&self->_numberOfMeasurements, 0);
  objc_storeStrong((id *)&self->_numberOfPoses, 0);
  objc_storeStrong((id *)&self->_traveledDistance, 0);
  objc_storeStrong((id *)&self->_btRssiEstimate, 0);
  objc_storeStrong((id *)&self->_latestProximityLevel, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_runId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
