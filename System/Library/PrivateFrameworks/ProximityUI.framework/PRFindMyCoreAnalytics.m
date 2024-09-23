@implementation PRFindMyCoreAnalytics

- (PRFindMyCoreAnalytics)init
{
  PRFindMyCoreAnalytics *v2;
  PRFindMyCoreAnalytics *v3;
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
  v23.super_class = (Class)PRFindMyCoreAnalytics;
  v2 = -[PRFindMyCoreAnalytics init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PRFindMyCoreAnalytics resetState](v2, "resetState");
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v5;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACD8]), "initWithIdentifier:", v5);
    -[PRFindMyCoreAnalytics setAuthSession:](v3, "setAuthSession:", v6);

    -[PRFindMyCoreAnalytics authSession](v3, "authSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "set_appleIDContext:", v7);

    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRFindMyCoreAnalytics setUrlSession:](v3, "setUrlSession:", v8);

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
    -[PRFindMyCoreAnalytics setAuthHeaderValue:](v3, "setAuthHeaderValue:", v17);

    v18 = os_log_create("com.apple.proximity", "itemlocalizer_analytics");
    logger = v3->_logger;
    v3->_logger = (OS_os_log *)v18;

  }
  return v3;
}

- (void)resetState
{
  double *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (double *)MEMORY[0x24BDAEE00];
  +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setPreviousPose:](self, "setPreviousPose:", v4);

  +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *v3, v3[2], v3[4], v3[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setPreviousPoseOfUser:](self, "setPreviousPoseOfUser:", v5);

  +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *v3, v3[2], v3[4], v3[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setOldPreviousPoseOfUser:](self, "setOldPreviousPoseOfUser:", v6);

  -[PRFindMyCoreAnalytics setShouldLogTargetFoundEvent:](self, "setShouldLogTargetFoundEvent:", 1);
  -[PRFindMyCoreAnalytics setShouldLogMotionEvent:](self, "setShouldLogMotionEvent:", 1);
  -[PRFindMyCoreAnalytics setShouldLogEnteredArmsReachEvent:](self, "setShouldLogEnteredArmsReachEvent:", 1);
  -[PRFindMyCoreAnalytics setReceivedfirstSOIRSSI:](self, "setReceivedfirstSOIRSSI:", 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setRangeEstimate:](self, "setRangeEstimate:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setTraveledDistance:](self, "setTraveledDistance:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setTraveledDistanceOfUser:](self, "setTraveledDistanceOfUser:", v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setNumberOfPoses:](self, "setNumberOfPoses:", v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setNumberOfRanges:](self, "setNumberOfRanges:", v11);

  -[PRFindMyCoreAnalytics setLatestTarget:](self, "setLatestTarget:", 0);
}

- (id)eventDictionaryWithEvent:(id)a3
{
  void *v4;
  void *v5;
  double MachTimeSeconds;
  double v7;
  void *v8;
  void *v9;
  float32x4_t v10;
  float32x4_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[10];
  _QWORD v42[12];

  v42[10] = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  -[PRFindMyCoreAnalytics sessionId](self, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    MachTimeSeconds = PRCommonGetMachTimeSeconds();
    -[PRFindMyCoreAnalytics startTime](self, "startTime");
    objc_msgSend(v5, "numberWithDouble:", MachTimeSeconds - v7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PRFindMyCoreAnalytics eventNumber](self, "eventNumber"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[PRFindMyCoreAnalytics previousPose](self, "previousPose");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pose");
    v11 = vmulq_f32(v10, v10);
    v11.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).u64[0];
    v11.f32[0] = sqrtf(v11.f32[0]);
    objc_msgSend(v8, "numberWithFloat:", *(double *)v11.i64);
    v36 = objc_claimAutoreleasedReturnValue();

    -[PRFindMyCoreAnalytics setEventNumber:](self, "setEventNumber:", -[PRFindMyCoreAnalytics eventNumber](self, "eventNumber") + 1);
    v41[0] = CFSTR("sessionId");
    -[PRFindMyCoreAnalytics sessionId](self, "sessionId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v13;
    v41[1] = CFSTR("eventNumber");
    objc_msgSend(v39, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v14;
    v42[2] = v38;
    v41[2] = CFSTR("timeElapsed");
    v41[3] = CFSTR("traveledDistance");
    -[PRFindMyCoreAnalytics traveledDistance](self, "traveledDistance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v15;
    v41[4] = CFSTR("traveledDistanceOfUser");
    -[PRFindMyCoreAnalytics traveledDistanceOfUser](self, "traveledDistanceOfUser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v16;
    v42[5] = v36;
    v41[5] = CFSTR("straightLineDistance");
    v41[6] = CFSTR("rangeEstimate");
    -[PRFindMyCoreAnalytics rangeEstimate](self, "rangeEstimate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[6] = v17;
    v41[7] = CFSTR("numberOfRanges");
    -[PRFindMyCoreAnalytics numberOfRanges](self, "numberOfRanges");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[7] = v18;
    v41[8] = CFSTR("numberOfPoses");
    -[PRFindMyCoreAnalytics numberOfPoses](self, "numberOfPoses");
    v19 = objc_claimAutoreleasedReturnValue();
    v41[9] = CFSTR("eventType");
    v42[8] = v19;
    v42[9] = v40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRFindMyCoreAnalytics runId](self, "runId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = v22 == 0;

    if ((v19 & 1) == 0)
    {
      -[PRFindMyCoreAnalytics runId](self, "runId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("runId"));

    }
    -[PRFindMyCoreAnalytics customData](self, "customData", v36);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    if (!v26)
    {
      -[PRFindMyCoreAnalytics customData](self, "customData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addEntriesFromDictionary:", v27);

    }
    -[PRFindMyCoreAnalytics productUUID](self, "productUUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (!v29)
    {
      -[PRFindMyCoreAnalytics productUUID](self, "productUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "UUIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, CFSTR("ProductUUID"));

    }
    -[PRFindMyCoreAnalytics isOwner](self, "isOwner");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 == 0;

    if (!v33)
    {
      -[PRFindMyCoreAnalytics isOwner](self, "isOwner");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v34, CFSTR("IsOwner"));

    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
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
    -[PRFindMyCoreAnalytics sendLiveOnAnalytics:](self, "sendLiveOnAnalytics:", v4);
  }

}

- (void)configureSessionWithProductUUID:(id)a3 withOwner:(id)a4
{
  id v6;
  void *v7;
  CASessionData *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setSessionId:](self, "setSessionId:", v7);

  -[PRFindMyCoreAnalytics setEventNumber:](self, "setEventNumber:", 0);
  -[PRFindMyCoreAnalytics setStartTime:](self, "setStartTime:", PRCommonGetMachTimeSeconds());
  -[PRFindMyCoreAnalytics setProductUUID:](self, "setProductUUID:", v13);
  -[PRFindMyCoreAnalytics setIsOwner:](self, "setIsOwner:", v6);
  v8 = objc_alloc_init(CASessionData);
  -[PRFindMyCoreAnalytics setSessionData:](self, "setSessionData:", v8);

  -[PRFindMyCoreAnalytics sessionData](self, "sessionData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProductUUID:", v13);

  -[PRFindMyCoreAnalytics sessionData](self, "sessionData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsOwner:", v6);

  -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("Configure"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics sessionData](self, "sessionData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configure:", v11);

  -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v11);
}

- (void)configureComplete
{
  void *v3;
  id v4;

  -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("ConfigureComplete"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics sessionData](self, "sessionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configureComplete:", v4);

  -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v4);
}

- (BOOL)isRunning
{
  void *v2;
  BOOL v3;

  -[PRFindMyCoreAnalytics runId](self, "runId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CARunData *v7;
  id v8;
  id v9;
  id v10;

  -[PRFindMyCoreAnalytics resetState](self, "resetState");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setRunId:](self, "setRunId:");

  v7 = objc_alloc_init(CARunData);
  -[PRFindMyCoreAnalytics setRunData:](self, "setRunData:");

  -[PRFindMyCoreAnalytics productUUID](self, "productUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics runData](self, "runData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProductUUID:", v8);

  -[PRFindMyCoreAnalytics isOwner](self, "isOwner");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics runData](self, "runData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsOwner:", v9);

  -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("Start"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics runData](self, "runData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start:", v10);

  -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v10);
}

- (void)addLatestTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PRFindMyCoreAnalytics latestTarget](self, "latestTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCED8];
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[PRFindMyCoreAnalytics latestTarget](self, "latestTarget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vector");
    objc_msgSend(v7, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[PRFindMyCoreAnalytics latestTarget](self, "latestTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "vector");
    LODWORD(v12) = HIDWORD(v12);
    objc_msgSend(v10, "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v13;
    v14 = (void *)MEMORY[0x24BDD16E0];
    -[PRFindMyCoreAnalytics latestTarget](self, "latestTarget");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "vector");
    LODWORD(v17) = v16;
    objc_msgSend(v14, "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v19, CFSTR("target"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addEntriesFromDictionary:", v20);
  }

}

- (void)stop
{
  void *v3;
  void *v4;
  id v5;

  if (-[PRFindMyCoreAnalytics isRunning](self, "isRunning"))
  {
    -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("Stop"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PRFindMyCoreAnalytics addLatestTarget:](self, "addLatestTarget:");
    -[PRFindMyCoreAnalytics runData](self, "runData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stop:", v5);

    -[PRFindMyCoreAnalytics runData](self, "runData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logData");

    -[PRFindMyCoreAnalytics setRunData:](self, "setRunData:", 0);
    -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v5);
    -[PRFindMyCoreAnalytics setRunId:](self, "setRunId:", 0);
    -[PRFindMyCoreAnalytics setRunData:](self, "setRunData:", 0);

  }
}

- (void)deinit
{
  void *v3;
  void *v4;
  id v5;

  -[PRFindMyCoreAnalytics stop](self, "stop");
  -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("Deinit"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics sessionData](self, "sessionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deinit:", v5);

  -[PRFindMyCoreAnalytics sessionData](self, "sessionData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logData");

  -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v5);
}

- (void)invalidPoseDetected
{
  double *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = (double *)MEMORY[0x24BDAEE00];
  +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setPreviousPose:](self, "setPreviousPose:");

  +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *v3, v3[2], v3[4], v3[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setPreviousPoseOfUser:](self, "setPreviousPoseOfUser:");

  +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:", 0.0, *v3, v3[2], v3[4], v3[6]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setOldPreviousPoseOfUser:](self, "setOldPreviousPoseOfUser:");

  -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("InvalidPose"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics runData](self, "runData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidPose:", v8);

  -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v8);
}

- (void)targetComputed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PRFindMyCoreAnalytics setLatestTarget:](self, "setLatestTarget:");
  if (-[PRFindMyCoreAnalytics shouldLogTargetFoundEvent](self, "shouldLogTargetFoundEvent"))
  {
    -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("TargetFound"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRFindMyCoreAnalytics addLatestTarget:](self, "addLatestTarget:", v4);
    -[PRFindMyCoreAnalytics runData](self, "runData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetFound:", v4);

    -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v4);
    -[PRFindMyCoreAnalytics setShouldLogTargetFoundEvent:](self, "setShouldLogTargetFoundEvent:", 0);

  }
}

- (void)targetRevokedWithReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (!-[PRFindMyCoreAnalytics shouldLogTargetFoundEvent](self, "shouldLogTargetFoundEvent"))
  {
    -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("TargetRevoked"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PRFindMyCoreAnalytics runData](self, "runData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetRevoked:", v7);

    switch(a3)
    {
      case 0uLL:
        -[PRFindMyCoreAnalytics runData](self, "runData");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "vioRevoke:", v7);
        goto LABEL_9;
      case 1uLL:
        -[PRFindMyCoreAnalytics runData](self, "runData");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "targetMotionRevoke:", v7);
        goto LABEL_9;
      case 2uLL:
        -[PRFindMyCoreAnalytics runData](self, "runData");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "rangeRevoke:", v7);
        goto LABEL_9;
      case 3uLL:
        -[PRFindMyCoreAnalytics runData](self, "runData");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "aoaRevoke:", v7);
        goto LABEL_9;
      case 4uLL:
        -[PRFindMyCoreAnalytics runData](self, "runData");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "straightPathRevoke:", v7);
        goto LABEL_9;
      case 5uLL:
        -[PRFindMyCoreAnalytics runData](self, "runData");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "highResidualRevoke:", v7);
LABEL_9:

        break;
      default:
        break;
    }
    -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v7);
    -[PRFindMyCoreAnalytics setShouldLogTargetFoundEvent:](self, "setShouldLogTargetFoundEvent:", 1);

  }
}

- (void)firstArrowFromRange
{
  void *v3;
  id v4;

  -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("TargetFoundFromRange"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics runData](self, "runData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetFoundFromRange:", v4);

}

- (void)firstArrowFromAoA
{
  void *v3;
  id v4;

  -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("TargetFoundFromAoA"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics runData](self, "runData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetFoundFromAoA:", v4);

}

- (void)torchButtonPresented
{
  id v2;

  -[PRFindMyCoreAnalytics runData](self, "runData");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTorchButtonPresented:", 1);

}

- (void)torchChangedState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PRFindMyCoreAnalytics runData](self, "runData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setTorchTurnedOn:", 1);
  else
    objc_msgSend(v4, "setTorchTurnedOff:", 1);

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

  -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("RangingError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "addEntriesFromDictionary:", v9);
    if (-[PRFindMyCoreAnalytics isRunning](self, "isRunning"))
      -[PRFindMyCoreAnalytics runData](self, "runData");
    else
      -[PRFindMyCoreAnalytics sessionData](self, "sessionData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error:", v11);

    -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v11);
  }

}

- (void)updateTravelDistanceWithPose:(id)a3
{
  void *v4;
  float32x4_t v5;
  void *v6;
  float32x4_t v7;
  void *v8;
  float32x4_t v9;
  float32x4_t v10;
  void *v11;
  void *v12;
  float32x4_t v13;
  float32x4_t v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float32x4_t v21;
  float32x4_t v22;
  float v23;
  float32x4_t v24;
  float32x4_t v25;
  double v26;
  void *v28;
  void *v29;
  float v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  id v42;

  v42 = a3;
  -[PRFindMyCoreAnalytics previousPose](self, "previousPose");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pose");
  v40 = v5;

  -[PRFindMyCoreAnalytics previousPoseOfUser](self, "previousPoseOfUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pose");
  v39 = v7;

  -[PRFindMyCoreAnalytics oldPreviousPoseOfUser](self, "oldPreviousPoseOfUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pose");
  v38 = v9;

  objc_msgSend(v42, "pose");
  v41 = v10;
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[PRFindMyCoreAnalytics traveledDistance](self, "traveledDistance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v13 = vsubq_f32(v40, v41);
  v14 = vmulq_f32(v13, v13);
  *(float *)&v16 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).f32[0])+ v15;
  objc_msgSend(v11, "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setTraveledDistance:](self, "setTraveledDistance:", v17);

  -[PRFindMyCoreAnalytics setPreviousPose:](self, "setPreviousPose:", v42);
  v18 = (void *)MEMORY[0x24BDD16E0];
  -[PRFindMyCoreAnalytics numberOfPoses](self, "numberOfPoses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "intValue") + 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setNumberOfPoses:](self, "setNumberOfPoses:", v20);

  v21 = vsubq_f32(v39, v41);
  v22 = vmulq_f32(v21, v21);
  v23 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]);
  v24 = vsubq_f32(v38, v41);
  v25 = vmulq_f32(v24, v24);
  *(_QWORD *)&v26 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).u64[0];
  *(float *)&v26 = sqrtf(*(float *)&v26);
  if (v23 > 0.5 && *(float *)&v26 > 0.5)
  {
    v28 = (void *)MEMORY[0x24BDD16E0];
    -[PRFindMyCoreAnalytics traveledDistanceOfUser](self, "traveledDistanceOfUser", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatValue");
    *(float *)&v31 = v23 + v30;
    objc_msgSend(v28, "numberWithFloat:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRFindMyCoreAnalytics setTraveledDistanceOfUser:](self, "setTraveledDistanceOfUser:", v32);

    -[PRFindMyCoreAnalytics previousPoseOfUser](self, "previousPoseOfUser");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRFindMyCoreAnalytics setOldPreviousPoseOfUser:](self, "setOldPreviousPoseOfUser:", v33);

    -[PRFindMyCoreAnalytics setPreviousPoseOfUser:](self, "setPreviousPoseOfUser:", v42);
  }
  -[PRFindMyCoreAnalytics numberOfPoses](self, "numberOfPoses", *(_OWORD *)&v38);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "intValue");

  if (v35 == 1)
  {
    -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("FirstPose"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRFindMyCoreAnalytics runData](self, "runData");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstPose:", v36);

    -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v36);
  }

}

- (void)updateWithRangeEstimate:(id)a3
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
  float v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  v16 = v4;
  objc_msgSend(v4, "range");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setRangeEstimate:](self, "setRangeEstimate:", v6);

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[PRFindMyCoreAnalytics numberOfRanges](self, "numberOfRanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "intValue") + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setNumberOfRanges:](self, "setNumberOfRanges:", v9);

  -[PRFindMyCoreAnalytics numberOfRanges](self, "numberOfRanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "intValue");

  if ((_DWORD)v9 == 1)
  {
    -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("FirstRange"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRFindMyCoreAnalytics runData](self, "runData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstRange:", v11);

    -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v11);
  }
  objc_msgSend(v16, "range");
  if (v13 <= 0.9144 && -[PRFindMyCoreAnalytics shouldLogEnteredArmsReachEvent](self, "shouldLogEnteredArmsReachEvent"))
  {
    -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("EnteredArmsReach"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v14);
    -[PRFindMyCoreAnalytics runData](self, "runData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setArmsReachEvent:", v14);

    -[PRFindMyCoreAnalytics setShouldLogEnteredArmsReachEvent:](self, "setShouldLogEnteredArmsReachEvent:", 0);
  }

}

- (void)updateSOIRSSI:(double)a3
{
  id v5;

  if (!-[PRFindMyCoreAnalytics receivedfirstSOIRSSI](self, "receivedfirstSOIRSSI"))
  {
    -[PRFindMyCoreAnalytics setReceivedfirstSOIRSSI:](self, "setReceivedfirstSOIRSSI:", 1);
    -[PRFindMyCoreAnalytics runData](self, "runData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logFirstSOIRSSI:", a3);

  }
}

- (void)revokeRangeEstimate
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PRFindMyCoreAnalytics setRangeEstimate:](self, "setRangeEstimate:");

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

  -[PRFindMyCoreAnalytics eventDictionaryWithEvent:](self, "eventDictionaryWithEvent:", CFSTR("TargetMoving"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  if (-[PRFindMyCoreAnalytics shouldLogMotionEvent](self, "shouldLogMotionEvent"))
  {
    objc_msgSend(v7, "addEntriesFromDictionary:", v9);
    -[PRFindMyCoreAnalytics runData](self, "runData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "motion:", v7);

    -[PRFindMyCoreAnalytics sendAnalyticsEvent:](self, "sendAnalyticsEvent:", v7);
LABEL_4:
    -[PRFindMyCoreAnalytics setShouldLogMotionEvent:](self, "setShouldLogMotionEvent:", !v3);
  }

}

+ (BOOL)isInternalBuild
{
  if (+[PRFindMyCoreAnalytics isInternalBuild]::onceToken != -1)
    dispatch_once(&+[PRFindMyCoreAnalytics isInternalBuild]::onceToken, &__block_literal_global_3);
  return +[PRFindMyCoreAnalytics isInternalBuild]::isInternalBuild;
}

uint64_t __40__PRFindMyCoreAnalytics_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  +[PRFindMyCoreAnalytics isInternalBuild]::isInternalBuild = result;
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
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("com.apple.proximity.findmy.itemlocalizer.event"), CFSTR("eventName"));
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
        -[PRFindMyCoreAnalytics authHeaderValue](self, "authHeaderValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:forHTTPHeaderField:", v12, CFSTR("Authorization"));

        -[PRFindMyCoreAnalytics urlSession](self, "urlSession");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __45__PRFindMyCoreAnalytics_sendLiveOnAnalytics___block_invoke;
        v18 = &unk_24EC11318;
        v19 = v7;
        objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v9, &v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "resume", v15, v16, v17, v18);
      }

    }
  }

}

void __45__PRFindMyCoreAnalytics_sendLiveOnAnalytics___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (NSNumber)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(id)a3
{
  objc_storeStrong((id *)&self->_isOwner, a3);
}

- (PRPose)previousPose
{
  return self->_previousPose;
}

- (void)setPreviousPose:(id)a3
{
  objc_storeStrong((id *)&self->_previousPose, a3);
}

- (PRPose)previousPoseOfUser
{
  return self->_previousPoseOfUser;
}

- (void)setPreviousPoseOfUser:(id)a3
{
  objc_storeStrong((id *)&self->_previousPoseOfUser, a3);
}

- (PRPose)oldPreviousPoseOfUser
{
  return self->_oldPreviousPoseOfUser;
}

- (void)setOldPreviousPoseOfUser:(id)a3
{
  objc_storeStrong((id *)&self->_oldPreviousPoseOfUser, a3);
}

- (PRTargetEstimate)latestTarget
{
  return self->_latestTarget;
}

- (void)setLatestTarget:(id)a3
{
  objc_storeStrong((id *)&self->_latestTarget, a3);
}

- (NSNumber)rangeEstimate
{
  return self->_rangeEstimate;
}

- (void)setRangeEstimate:(id)a3
{
  objc_storeStrong((id *)&self->_rangeEstimate, a3);
}

- (NSNumber)traveledDistance
{
  return self->_traveledDistance;
}

- (void)setTraveledDistance:(id)a3
{
  objc_storeStrong((id *)&self->_traveledDistance, a3);
}

- (NSNumber)traveledDistanceOfUser
{
  return self->_traveledDistanceOfUser;
}

- (void)setTraveledDistanceOfUser:(id)a3
{
  objc_storeStrong((id *)&self->_traveledDistanceOfUser, a3);
}

- (NSNumber)numberOfPoses
{
  return self->_numberOfPoses;
}

- (void)setNumberOfPoses:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfPoses, a3);
}

- (NSNumber)numberOfRanges
{
  return self->_numberOfRanges;
}

- (void)setNumberOfRanges:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfRanges, a3);
}

- (BOOL)shouldLogTargetFoundEvent
{
  return self->_shouldLogTargetFoundEvent;
}

- (void)setShouldLogTargetFoundEvent:(BOOL)a3
{
  self->_shouldLogTargetFoundEvent = a3;
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

- (BOOL)receivedfirstSOIRSSI
{
  return self->_receivedfirstSOIRSSI;
}

- (void)setReceivedfirstSOIRSSI:(BOOL)a3
{
  self->_receivedfirstSOIRSSI = a3;
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

- (CASessionData)sessionData
{
  return self->_sessionData;
}

- (void)setSessionData:(id)a3
{
  objc_storeStrong((id *)&self->_sessionData, a3);
}

- (CARunData)runData
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
  objc_storeStrong((id *)&self->_numberOfRanges, 0);
  objc_storeStrong((id *)&self->_numberOfPoses, 0);
  objc_storeStrong((id *)&self->_traveledDistanceOfUser, 0);
  objc_storeStrong((id *)&self->_traveledDistance, 0);
  objc_storeStrong((id *)&self->_rangeEstimate, 0);
  objc_storeStrong((id *)&self->_latestTarget, 0);
  objc_storeStrong((id *)&self->_oldPreviousPoseOfUser, 0);
  objc_storeStrong((id *)&self->_previousPoseOfUser, 0);
  objc_storeStrong((id *)&self->_previousPose, 0);
  objc_storeStrong((id *)&self->_isOwner, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_runId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
