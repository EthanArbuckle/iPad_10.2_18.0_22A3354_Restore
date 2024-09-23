@implementation PRSharingSession

- (PRSharingSession)init
{
  -[PRSharingSession doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)watchDogTimedOut
{
  double MachTimeSeconds;
  double MachContinuousTimeSeconds;
  NSObject *logger;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MachTimeSeconds = PRCommonGetMachTimeSeconds();
  MachContinuousTimeSeconds = PRCommonGetMachContinuousTimeSeconds();
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = MachTimeSeconds;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "Watchdog timed out %lf", (uint8_t *)&v6, 0xCu);
  }
  -[PRSharingChoice heartbeatTimeout:currentMachContTime:useUpdatedScores:](self->_sharingChoiceEstimator, "heartbeatTimeout:currentMachContTime:useUpdatedScores:", 1, MachTimeSeconds, MachContinuousTimeSeconds);
  if (-[PRSharingChoice currentlyInitiating](self->_sharingChoiceEstimator, "currentlyInitiating"))
    -[PRSharingSession startWatchDogWithDuration:](self, "startWatchDogWithDuration:", 1000000000);
}

- (void)startWatchDogWithDuration:(int64_t)a3
{
  dispatch_block_t v5;
  id reportWatchdog;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PRSharingSession_startWatchDogWithDuration___block_invoke;
  v8[3] = &unk_1E3D04690;
  objc_copyWeak(&v9, &location);
  v5 = dispatch_block_create((dispatch_block_flags_t)0, v8);
  reportWatchdog = self->_reportWatchdog;
  self->_reportWatchdog = v5;

  v7 = dispatch_time(0, a3);
  dispatch_after(v7, (dispatch_queue_t)self->_delegateQueue, self->_reportWatchdog);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__PRSharingSession_startWatchDogWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "watchDogTimedOut");

}

- (PRSharingSession)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v7;
  id v8;
  PRSharingSession *v9;
  PRSharingSession *v10;
  os_log_t v11;
  OS_os_log *logger;
  PRBeacon *v13;
  PRBeacon *nearbyDaemonSession;
  PRSharingChoice *v15;
  PRSharingChoice *sharingChoiceEstimator;
  PRSharingChoice *v17;
  uint64_t v18;
  PRProximityEstimator *v19;
  PRProximityEstimator *btProxEstimator;
  NSMutableDictionary *v21;
  NSMutableDictionary *trackedBTPeers;
  NSMutableDictionary *v23;
  NSMutableDictionary *trackedBTPeersDevice;
  dispatch_block_t v25;
  id reportWatchdog;
  void *v28;
  _QWORD block[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSharingSession.mm"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v34.receiver = self;
  v34.super_class = (Class)PRSharingSession;
  v9 = -[PRSharingSession init](&v34, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v7);
    objc_storeStrong((id *)&v10->_delegateQueue, a4);
    v10->_needToRestart = 0;
    v10->_scoresReported = 0;
    v11 = os_log_create("com.apple.proximity", "PRSharingSession");
    logger = v10->_logger;
    v10->_logger = (OS_os_log *)v11;

    objc_initWeak(&location, v10);
    if (+[PRRangingDevice isSupported](PRRangingDevice, "isSupported"))
    {
      v13 = -[PRBeacon initWithDelegate:queue:]([PRBeacon alloc], "initWithDelegate:queue:", v10, v10->_delegateQueue);
      nearbyDaemonSession = v10->_nearbyDaemonSession;
      v10->_nearbyDaemonSession = v13;

    }
    v15 = -[PRSharingChoice initWithQueue:]([PRSharingChoice alloc], "initWithQueue:", v10->_delegateQueue);
    sharingChoiceEstimator = v10->_sharingChoiceEstimator;
    v10->_sharingChoiceEstimator = v15;

    -[PRSharingChoice setCurrentlyInitiating:](v10->_sharingChoiceEstimator, "setCurrentlyInitiating:", 0);
    -[PRSharingChoice setLogger:](v10->_sharingChoiceEstimator, "setLogger:", v10->_logger);
    v17 = v10->_sharingChoiceEstimator;
    v18 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __51__PRSharingSession_initWithDelegate_delegateQueue___block_invoke;
    v31[3] = &unk_1E3D046B8;
    objc_copyWeak(&v32, &location);
    -[PRSharingChoice setNewScoresHandler:](v17, "setNewScoresHandler:", v31);
    v19 = -[PRProximityEstimator initSingleThresholdEstmatorWithDelegate:delegateQueue:]([PRProximityEstimator alloc], "initSingleThresholdEstmatorWithDelegate:delegateQueue:", v10, v10->_delegateQueue);
    btProxEstimator = v10->_btProxEstimator;
    v10->_btProxEstimator = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedBTPeers = v10->_trackedBTPeers;
    v10->_trackedBTPeers = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedBTPeersDevice = v10->_trackedBTPeersDevice;
    v10->_trackedBTPeersDevice = v23;

    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __51__PRSharingSession_initWithDelegate_delegateQueue___block_invoke_2;
    block[3] = &unk_1E3D04690;
    objc_copyWeak(&v30, &location);
    v25 = dispatch_block_create((dispatch_block_flags_t)0, block);
    reportWatchdog = v10->_reportWatchdog;
    v10->_reportWatchdog = v25;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __51__PRSharingSession_initWithDelegate_delegateQueue___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "onNewSharingChoiceScores:", v3);

}

void __51__PRSharingSession_initWithDelegate_delegateQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "watchDogTimedOut");

}

- (void)startInitiating
{
  -[PRSharingChoice createEstimators](self->_sharingChoiceEstimator, "createEstimators");
  -[PRBeacon startBeaconingWithOptions:](self->_nearbyDaemonSession, "startBeaconingWithOptions:", 0);
  -[PRSharingChoice setCurrentlyInitiating:](self->_sharingChoiceEstimator, "setCurrentlyInitiating:", 1);
  -[PRSharingSession startWatchDogWithDuration:](self, "startWatchDogWithDuration:", 0);
}

- (void)stopInitiating
{
  dispatch_block_cancel(self->_reportWatchdog);
  -[PRBeacon stopBeaconing](self->_nearbyDaemonSession, "stopBeaconing");
  -[PRSharingChoice setCurrentlyInitiating:](self->_sharingChoiceEstimator, "setCurrentlyInitiating:", 0);
  -[PRSharingSession stopProx](self, "stopProx");
  self->_scoresReported = 0;
}

- (BOOL)addRssiSample:(double)a3 channel:(unsigned int)a4 forPeer:(id)a5 peerDeviceModel:(id)a6 withError:(id *)a7
{
  uint64_t v9;
  id v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  OS_os_log *v17;
  void *v18;
  BOOL v19;
  void *v20;
  int v21;
  PRProximityEstimator *btProxEstimator;
  void *v23;
  void *v24;
  void *v25;
  PRProximityEstimator *v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v9 = *(_QWORD *)&a4;
  v41 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSharingSession.mm"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peerMacAddress"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSharingSession.mm"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceModel"));

LABEL_3:
  if (objc_msgSend(v13, "length") != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSharingSession.mm"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[peerMacAddress length] == BT_MAC_LEN"));

  }
  v16 = -[PRSharingChoice currentlyInitiating](self->_sharingChoiceEstimator, "currentlyInitiating");
  if (v16)
  {
    v17 = self->_logger;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v34 = v13;
      v35 = 2080;
      v36 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      v37 = 1024;
      v38 = v9;
      v39 = 2048;
      v40 = a3;
      _os_log_impl(&dword_19BF46000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "new RSSI sample:\n MAC address: %@\n model: %s\n channel: %d\n rssi: %f", buf, 0x26u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedBTPeers, "objectForKeyedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (v19)
    {
      if (-[PRSharingSession trackNewBTPeer:withDviceModel:error:](self, "trackNewBTPeer:withDviceModel:error:", v13, v15, a7))
      {
        goto LABEL_18;
      }
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedBTPeersDevice, "objectForKeyedSubscript:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v15, "isEqualToString:", v20);

      btProxEstimator = self->_btProxEstimator;
      if (v21)
      {
        +[PRSharingSessionHelper NSDataMacToUUID:](PRSharingSessionHelper, "NSDataMacToUUID:", v13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRProximityEstimator addRssiSample:channel:forPeer:withError:](btProxEstimator, "addRssiSample:channel:forPeer:withError:", v9, v23, a7, a3);
LABEL_19:

        goto LABEL_20;
      }
      +[PRSharingSessionHelper NSDataMacToUUID:](PRSharingSessionHelper, "NSDataMacToUUID:", v13);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRProximityEstimator stopEstimatingProximityFor:withError:](btProxEstimator, "stopEstimatingProximityFor:withError:", v25, a7);

      if (-[PRSharingSession trackNewBTPeer:withDviceModel:error:](self, "trackNewBTPeer:withDviceModel:error:", v13, v15, a7))
      {
LABEL_18:
        v26 = self->_btProxEstimator;
        +[PRSharingSessionHelper NSDataMacToUUID:](PRSharingSessionHelper, "NSDataMacToUUID:", v13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRProximityEstimator addRssiSample:channel:forPeer:withError:](v26, "addRssiSample:channel:forPeer:withError:", v9, v23, a7, a3);
        goto LABEL_19;
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      -[PRSharingSession addRssiSample:channel:forPeer:peerDeviceModel:withError:].cold.1();
    if (a7)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("Failed to initiate prior to adding sample");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 202, v23);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
LABEL_20:

  return v16;
}

- (BOOL)trackNewBTPeer:(id)a3 withDviceModel:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  PRProximityEstimator *btProxEstimator;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSharingSession.mm"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peerMacAddress"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSharingSession.mm"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceModel"));

LABEL_3:
  if (self->_scoresReported)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
      -[PRSharingSession trackNewBTPeer:withDviceModel:error:].cold.2();
    -[PRSharingChoice reportScoresToClientAlways:useUpdatedScoreList:currentMachContTime:](self->_sharingChoiceEstimator, "reportScoresToClientAlways:useUpdatedScoreList:currentMachContTime:", 1, 0, PRCommonGetMachContinuousTimeSeconds());
  }
  btProxEstimator = self->_btProxEstimator;
  +[PRSharingSessionHelper NSDataMacToUUID:](PRSharingSessionHelper, "NSDataMacToUUID:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PRProximityEstimator startEstimatingProximityFor:peerDeviceModel:withError:](btProxEstimator, "startEstimatingProximityFor:peerDeviceModel:withError:", v13, v11, a5);

  if (v14)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackedBTPeers, "setObject:forKeyedSubscript:", &unk_1E3D0F988, v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackedBTPeersDevice, "setObject:forKeyedSubscript:", v11, v9);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      -[PRSharingSession trackNewBTPeer:withDviceModel:error:].cold.1();
    if (a5)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = CFSTR("Failed to start estimating proximity to peer");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), 202, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v14;
}

- (void)stopProx
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_3(&dword_19BF46000, a4, (uint64_t)a3, "%@", a2);

}

- (void)logScores:(id)a3
{
  id v4;
  unint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *logger;
  NSObject *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    for (i = 0; i < objc_msgSend(v4, "count"); ++i)
    {
      kdebug_trace();
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("New scores: "));
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "btAddress");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("mac address: %@, "), v8);

      objc_msgSend(v7, "score");
      objc_msgSend(v6, "appendFormat:", CFSTR("score: %f, "), v9);
      objc_msgSend(v7, "angle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = v10 == 0;

      if ((v8 & 1) != 0)
      {
        objc_msgSend(v6, "appendFormat:", CFSTR("angle degrees: nil, "));
        objc_msgSend(v6, "appendFormat:", CFSTR("angle uncertainty: nil, "));
      }
      else
      {
        objc_msgSend(v7, "angle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "measurement");
        objc_msgSend(v6, "appendFormat:", CFSTR("angle degrees: %f, "), v12);

        objc_msgSend(v7, "angle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uncertainty");
        objc_msgSend(v6, "appendFormat:", CFSTR("angle uncertainty: %f, "), v14);

        objc_msgSend(v7, "timestamp");
        objc_msgSend(v6, "appendFormat:", CFSTR("#bighead_test mach_abs_time: %f, "), v15);
      }
      objc_msgSend(v7, "range");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (v17)
      {
        objc_msgSend(v6, "appendFormat:", CFSTR("range meters: nil, "));
        objc_msgSend(v6, "appendFormat:", CFSTR("range uncertainty: nil, "));
      }
      else
      {
        objc_msgSend(v7, "range");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "measurement");
        objc_msgSend(v6, "appendFormat:", CFSTR("range meters: %f, "), v19);

        objc_msgSend(v7, "range");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "uncertainty");
        objc_msgSend(v6, "appendFormat:", CFSTR("range uncertainty: %f, "), v21);

      }
      +[PRSharingSessionHelper ProxToString:](PRSharingSessionHelper, "ProxToString:", objc_msgSend(v7, "proximity"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("prox: %@, "), v22);

      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      kdebug_trace();

    }
  }
  else
  {
    v24 = self->_logger;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BF46000, v24, OS_LOG_TYPE_DEFAULT, "New scores: empty list", buf, 2u);
    }
  }

}

- (void)estimator:(id)a3 didEstimateProximity:(int64_t)a4 toPeer:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  PRSharingChoice *sharingChoiceEstimator;
  int v14;
  NSObject *logger;
  uint64_t v16;
  OS_os_log *v17;
  uint64_t v18;
  void *v19;
  std::string *v20;
  std::string __p;
  __int128 v22;
  __int128 v23;
  _OWORD v24[2];
  std::string v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[26];
  double v29;
  double v30;
  std::string buf;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  +[PRSharingSessionHelper UUIDToNSDataMac:len:](PRSharingSessionHelper, "UUIDToNSDataMac:len:", v7, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedBTPeers, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v29 = 0.0;
    v30 = 0.0;
    if (PRCommonGetAllTimes(0, &v30, &v29))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackedBTPeers, "setObject:forKeyedSubscript:", v10, v8);

      +[PRSharingSessionHelper reverseNSData:](PRSharingSessionHelper, "reverseNSData:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRSharingSessionHelper UIntToHexString:len:](PRSharingSessionHelper, "UIntToHexString:len:", +[PRSharingSessionHelper NSDataToUInt64:](PRSharingSessionHelper, "NSDataToUInt64:", v11), 6);
      v12 = v30;
      v25 = buf;
      *(double *)&v26 = v30;
      WORD4(v26) = 0;
      v27 = xmmword_19BF79E40;
      v28[0] = 1;
      *(_DWORD *)&v28[4] = +[PRSharingSessionHelper ProxToCoarseRange:](PRSharingSessionHelper, "ProxToCoarseRange:", a4);
      *(_WORD *)&v28[24] = 0;
      v28[8] = 0;
      *(_QWORD *)&v28[16] = 0;
      sharingChoiceEstimator = self->_sharingChoiceEstimator;
      v14 = SHIBYTE(v25.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&__p, v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_);
      else
        __p = v25;
      v22 = v26;
      v23 = v27;
      v24[0] = *(_OWORD *)v28;
      *(_OWORD *)((char *)v24 + 10) = *(_OWORD *)&v28[10];
      -[PRSharingChoice addBluetoothProximityEstimate:currentMachContTime:](sharingChoiceEstimator, "addBluetoothProximityEstimate:currentMachContTime:", &__p, v29);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v17 = self->_logger;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        +[PRSharingSessionHelper ProxToString:](PRSharingSessionHelper, "ProxToString:", a4);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        v20 = (std::string *)v25.__r_.__value_.__r.__words[0];
        if (v14 >= 0)
          v20 = &v25;
        LODWORD(buf.__r_.__value_.__l.__data_) = 138412802;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v18;
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v20;
        HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
        v32 = v12;
        _os_log_impl(&dword_19BF46000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "PTS: BT Prox estimate of %@ for device %s at time %f", (uint8_t *)&buf, 0x20u);

      }
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v25.__r_.__value_.__l.__data_);
    }
    else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      -[PRSharingSession estimator:didEstimateProximity:toPeer:].cold.2();
    }
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      -[PRSharingSession estimator:didEstimateProximity:toPeer:].cold.1((uint64_t)v8, logger, v16);
  }

}

- (void)beacon:(id)a3 didOutputRangeResults:(id)a4
{
  id v5;

  v5 = a4;
  kdebug_trace();
  -[PRSharingChoice addRoseSolutions:currentMachContTime:](self->_sharingChoiceEstimator, "addRoseSolutions:currentMachContTime:", v5, PRCommonGetMachContinuousTimeSeconds());
  kdebug_trace();

}

- (void)beacon:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  NSObject *logger;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  char v16;
  _QWORD v17[6];
  uint8_t buf[16];

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "PRSharingSession: PRBeaconStateUnknown", buf, 2u);
      }
      if (!-[PRSharingChoice currentlyInitiating](self->_sharingChoiceEstimator, "currentlyInitiating"))
        goto LABEL_7;
      v8 = self->_logger;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      goto LABEL_22;
    case 1uLL:
      v9 = self->_logger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BF46000, v9, OS_LOG_TYPE_DEFAULT, "PRSharingSession: PRBeaconStateIdle", buf, 2u);
      }
      if (self->_needToRestart)
      {
        v10 = self->_logger;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BF46000, v10, OS_LOG_TYPE_DEFAULT, "PRSharingSession: Attempting to restart initiator session", buf, 2u);
        }
        -[PRSharingSession startInitiating](self, "startInitiating");
      }
      a4 = 1;
      goto LABEL_26;
    case 2uLL:
      v11 = self->_logger;
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      v13 = 0;
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BF46000, v11, OS_LOG_TYPE_DEFAULT, "PRSharingSession: PRBeaconStateBeaconing", buf, 2u);
        v13 = 0;
      }
      goto LABEL_24;
    case 3uLL:
      v14 = self->_logger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BF46000, v14, OS_LOG_TYPE_DEFAULT, "PRSharingSession: PRBeaconStateUnavailable", buf, 2u);
      }
      if (-[PRSharingChoice currentlyInitiating](self->_sharingChoiceEstimator, "currentlyInitiating"))
      {
        v8 = self->_logger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
LABEL_22:
          _os_log_impl(&dword_19BF46000, v8, OS_LOG_TYPE_DEFAULT, "PRSharingSession: Need to restart!", buf, 2u);
        }
LABEL_23:
        v13 = 1;
LABEL_24:
        self->_needToRestart = v13;
      }
      else
      {
        a4 = 3;
      }
LABEL_26:
      -[PRSharingSession delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __42__PRSharingSession_beacon_didChangeState___block_invoke;
        v17[3] = &unk_1E3D046E0;
        v17[4] = self;
        v17[5] = a4;
        -[PRSharingSession invokeDelegateBlock:](self, "invokeDelegateBlock:", v17);
      }

      return;
    default:
LABEL_7:
      a4 = 0;
      goto LABEL_26;
  }
}

void __42__PRSharingSession_beacon_didChangeState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(WeakRetained, "session:didChangeProximitySensorState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)beacon:(id)a3 didFailWithError:(id)a4
{
  -[PRSharingSession didFailWithError:](self, "didFailWithError:", a4);
}

- (void)didFailWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PRSharingSession_didFailWithError___block_invoke;
  v6[3] = &unk_1E3D04708;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PRSharingSession invokeDelegateBlock:](self, "invokeDelegateBlock:", v6);

}

void __37__PRSharingSession_didFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(WeakRetained, "session:didFailwithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)onNewSharingChoiceScores:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PRSharingSession *v8;

  v4 = a3;
  -[PRSharingSession logScores:](self, "logScores:", v4);
  if (!self->_scoresReported && objc_msgSend(v4, "count"))
    self->_scoresReported = 1;
  dispatch_block_cancel(self->_reportWatchdog);
  if (-[PRSharingChoice currentlyInitiating](self->_sharingChoiceEstimator, "currentlyInitiating"))
    -[PRSharingSession startWatchDogWithDuration:](self, "startWatchDogWithDuration:", 1000000000);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PRSharingSession_onNewSharingChoiceScores___block_invoke;
  v6[3] = &unk_1E3D04708;
  v5 = v4;
  v7 = v5;
  v8 = self;
  -[PRSharingSession invokeDelegateBlock:](self, "invokeDelegateBlock:", v6);

}

void __45__PRSharingSession_onNewSharingChoiceScores___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "count");
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 88));
  objc_msgSend(WeakRetained, "session:didEstimateScores:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)invokeDelegateBlock:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *delegateQueue;
  id v6;

  v4 = (void (**)(_QWORD))a3;
  delegateQueue = self->_delegateQueue;
  v6 = v4;
  if (delegateQueue)
    dispatch_async(delegateQueue, v4);
  else
    v4[2](v4);

}

- (PRSharingSessionDelegate)delegate
{
  return (PRSharingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sharingChoiceEstimator, 0);
  objc_storeStrong(&self->_reportWatchdog, 0);
  objc_storeStrong((id *)&self->_nearbyDaemonSession, 0);
  objc_storeStrong((id *)&self->_trackedBTPeersDevice, 0);
  objc_storeStrong((id *)&self->_trackedBTPeers, 0);
  objc_storeStrong((id *)&self->_btProxEstimator, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)addRssiSample:channel:forPeer:peerDeviceModel:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19BF46000, v0, v1, "Failed to initiate prior to adding sample", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)trackNewBTPeer:withDviceModel:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19BF46000, v0, v1, "Failed to start estimating proximity to peer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)trackNewBTPeer:withDviceModel:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_19BF46000, v0, OS_LOG_TYPE_DEBUG, "Tracking a new BT Peer. Reporting scores immediately.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)estimator:(uint64_t)a1 didEstimateProximity:(NSObject *)a2 toPeer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_19BF46000, a2, a3, "PTS: Received Proximity estimation for a device we are not tracking: %@", (uint8_t *)&v3);
}

- (void)estimator:didEstimateProximity:toPeer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19BF46000, v0, v1, "PTS: Unable to get absolute time stamp", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
