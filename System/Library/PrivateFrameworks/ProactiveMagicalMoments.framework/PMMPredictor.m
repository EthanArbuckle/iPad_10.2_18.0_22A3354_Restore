@implementation PMMPredictor

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PMMPredictionItem)mostRecentPrediction
{
  return self->_mostRecentPrediction;
}

void __20__PMMPredictor_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__PMMPredictor_init__block_invoke_2;
  block[3] = &unk_24D9723A0;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

void __20__PMMPredictor_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "mostRecentPrediction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return;
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "mostRecentPrediction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(&unk_24D974DA0, "containsObject:", v5))
  {

LABEL_6:
    __atxlog_handle_pmm();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "mostRecentPrediction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "mostRecentNowPlayingPrediction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_2188D0000, v12, OS_LOG_TYPE_DEFAULT, "Got headphone/BT disconnect from Duet. Clearing all recommendations. Most recent prediction: %@. Most recent NowPlaying prediction: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clearAllRecommendations");
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "mostRecentNowPlayingPrediction");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 32), "mostRecentNowPlayingPrediction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "reason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(&unk_24D974DA0, "containsObject:", v10);

    if (v11)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "mostRecentPrediction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "reason");

  if (v16 == 512)
  {
    __atxlog_handle_pmm();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "mostRecentPrediction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "mostRecentNowPlayingPrediction");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_2188D0000, v17, OS_LOG_TYPE_DEFAULT, "Got headphone/BT disconnect from Duet and reason of new prediction was 'other'. Clearing all recommendations except those for app predictions. Most recent prediction: %@. Most recent NowPlaying prediction: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_clearAllRecommendationsExceptAppPredictions");
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6, &__block_literal_global_1);
  return (id)sharedInstance__pasExprOnceResult_0;
}

void __30__PMMPredictor_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x219A1C610]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;

  objc_autoreleasePoolPop(v0);
}

- (PMMPredictor)init
{
  PMMPredictor *v2;
  uint64_t v3;
  PMMDataProtectionMonitor *dataProtectionMonitor;
  objc_class *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_class *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *nowPlayingStatusQueue;
  uint64_t v14;
  CXCallObserver *callObserver;
  void *v16;
  __CFNotificationCenter *LocalCenter;
  uint64_t v18;
  PMMMusicStateProcessor *musicStateProcessor;
  PMMAudioDisconnectListener *v20;
  PMMPredictor *v21;
  uint64_t v22;
  PMMAudioDisconnectListener *disconnectListener;
  uint64_t v24;
  PMMTelephonyConnection *ctConnection;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  PETScalarEventTracker *mmAppSuggestion;
  id v40;
  void *v41;
  uint64_t v42;
  PETScalarEventTracker *heroAppSuggestion;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  PMMPredictor *v49;
  objc_super v50;
  _QWORD v51[3];
  _QWORD v52[4];

  v52[3] = *MEMORY[0x24BDAC8D0];
  v50.receiver = self;
  v50.super_class = (Class)PMMPredictor;
  v2 = -[PMMPredictor init](&v50, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dataProtectionMonitor = v2->_dataProtectionMonitor;
    v2->_dataProtectionMonitor = (PMMDataProtectionMonitor *)v3;

    -[PMMDataProtectionMonitor setDelegate:](v2->_dataProtectionMonitor, "setDelegate:", v2);
    v2->_encryptedDataAvailability = -[PMMDataProtectionMonitor encryptedDataAvailability](v2->_dataProtectionMonitor, "encryptedDataAvailability");
    v2->_unlockedSinceBoot = -[PMMDataProtectionMonitor unlockedSinceBoot](v2->_dataProtectionMonitor, "unlockedSinceBoot");
    v2->_dataProtectionStatus = -[PMMDataProtectionMonitor dataProtectionStatus](v2->_dataProtectionMonitor, "dataProtectionStatus");
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("NowPlayingStatus"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    nowPlayingStatusQueue = v2->_nowPlayingStatusQueue;
    v2->_nowPlayingStatusQueue = (OS_dispatch_queue *)v12;

    v2->_callInProgress = 0;
    v14 = objc_opt_new();
    callObserver = v2->_callObserver;
    v2->_callObserver = (CXCallObserver *)v14;

    -[CXCallObserver setDelegate:queue:](v2->_callObserver, "setDelegate:queue:", v2, v2->_queue);
    -[PMMPredictor nowPlayingStatusQueue](v2, "nowPlayingStatusQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemoteRegisterForNowPlayingNotifications();

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)onNowPlayingInfoChange, (CFStringRef)*MEMORY[0x24BE65760], 0, CFNotificationSuspensionBehaviorDrop);
    +[PMMMusicStateProcessor shared](PMMMusicStateProcessor, "shared");
    v18 = objc_claimAutoreleasedReturnValue();
    musicStateProcessor = v2->_musicStateProcessor;
    v2->_musicStateProcessor = (PMMMusicStateProcessor *)v18;

    v20 = [PMMAudioDisconnectListener alloc];
    v45 = MEMORY[0x24BDAC760];
    v46 = 3221225472;
    v47 = __20__PMMPredictor_init__block_invoke;
    v48 = &unk_24D9723A0;
    v21 = v2;
    v49 = v21;
    v22 = -[PMMAudioDisconnectListener initWithHandler:](v20, "initWithHandler:", &v45);
    disconnectListener = v21->_disconnectListener;
    v21->_disconnectListener = (PMMAudioDisconnectListener *)v22;

    v24 = objc_opt_new();
    ctConnection = v21->_ctConnection;
    v21->_ctConnection = (PMMTelephonyConnection *)v24;

    v26 = (void *)MEMORY[0x24BE799E0];
    objc_msgSend(MEMORY[0x24BE04180], "mmConsumerMapping", v45, v46, v47, v48);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("consumer"), v27, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x24BE799E0];
    objc_msgSend(MEMORY[0x24BE04180], "mmEventTypeMapping");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("event"), v30, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x24BE799E0];
    objc_msgSend(MEMORY[0x24BE04180], "predictionReasonMapping");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("reason"), v33, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE799E0], "propertyWithName:possibleValues:autoSanitizeValues:", CFSTR("category"), &unk_24D974DB8, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc(MEMORY[0x24BE799F0]);
    v52[0] = v28;
    v52[1] = v34;
    v52[2] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "initWithFeatureId:event:registerProperties:", CFSTR("MM"), CFSTR("MMAppSuggestion"), v37);
    mmAppSuggestion = v21->_mmAppSuggestion;
    v21->_mmAppSuggestion = (PETScalarEventTracker *)v38;

    v40 = objc_alloc(MEMORY[0x24BE799F0]);
    v51[0] = v35;
    v51[1] = v28;
    v51[2] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "initWithFeatureId:event:registerProperties:", CFSTR("MM"), CFSTR("HeroAppSuggestion"), v41);
    heroAppSuggestion = v21->_heroAppSuggestion;
    v21->_heroAppSuggestion = (PETScalarEventTracker *)v42;

  }
  return v2;
}

- (void)handlePredictedApplications:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PMMPredictor *v9;

  v4 = a3;
  -[PMMPredictor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__PMMPredictor_handlePredictedApplications___block_invoke;
  v7[3] = &unk_24D9723C8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__PMMPredictor_handlePredictedApplications___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  uint8_t buf[16];

  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__PMMPredictor_handlePredictedApplications___block_invoke_44;
    block[3] = &unk_24D9723C8;
    v6 = *(int8x16_t *)(a1 + 32);
    v4 = (id)v6.i64[0];
    v8 = vextq_s8(v6, v6, 8uLL);
    dispatch_async(v3, block);

  }
  else
  {
    __atxlog_handle_pmm();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D0000, v5, OS_LOG_TYPE_DEFAULT, "nil predictions or zero count applications. Clearing all recommendations (just in case) and exiting.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_clearAllRecommendations");
  }
}

void __44__PMMPredictor_handlePredictedApplications___block_invoke_44(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    __atxlog_handle_pmm();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2188D0000, v3, OS_LOG_TYPE_DEFAULT, "A user is busy now. Keep it in silence.", v5, 2u);
    }

  }
  else
  {
    v4 = (id)objc_msgSend(v2, "_publishPredictionWithPredictedApplication:fromUnitTest:", *(_QWORD *)(a1 + 40), 0);
  }
}

- (void)_notifyAppPredictionAboutMMUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  PMMPrediction *v7;
  NSObject *v8;
  int v9;
  PMMPrediction *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PMMPredictor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", 300.0);
    v7 = -[PMMPrediction initWithPredictedItems:expirationDate:]([PMMPrediction alloc], "initWithPredictedItems:expirationDate:", v4, v6);
    __atxlog_handle_pmm();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_2188D0000, v8, OS_LOG_TYPE_DEFAULT, "populating app prediction expert with MM prediction, %@", (uint8_t *)&v9, 0xCu);
    }

    +[PMMPredictionNotification postPredictionUpdate:consumer:](PMMPredictionNotification, "postPredictionUpdate:consumer:", v7, 1);
  }

}

+ (id)getHighestConfidencePredictionForNowPlayingConsumerFromPredictions:(id)a3 fromUnitTest:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (+[PMMPredictor _predictionPopulatesNowPlaying:fromUnitTest:](PMMPredictor, "_predictionPopulatesNowPlaying:fromUnitTest:", v10, v4, (_QWORD)v13))
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)logPrediction:(id)a3 predictionSource:(unint64_t)a4 mmReason:(int64_t)a5 decReason:(int64_t)a6 reasonSingle:(int64_t)a7 reasonMetadata:(id)a8
{
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  __atxlog_handle_pmm();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188D0000, v11, OS_LOG_TYPE_DEFAULT, "prediction type was magical moments", buf, 2u);
  }

  __atxlog_handle_pmm();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BE04180], "stringForMMConsumerType:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE04180], "stringForPredictionReason:", a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    v23 = 2048;
    v24 = a6;
    _os_log_impl(&dword_2188D0000, v12, OS_LOG_TYPE_DEFAULT, "com.apple.MagicalMoments metrics: MM, consumer %@, reasonSingle %@, reason %ld, suggested", buf, 0x20u);

  }
  -[PMMPredictor mmAppSuggestion](self, "mmAppSuggestion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = &unk_24D974CF8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  v18[2] = &unk_24D974CF8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trackEventWithPropertyValues:", v17);

}

- (id)preprocessPrediction:(id)a3 predictionSource:(unint64_t)a4 mmReason:(int64_t)a5 decReason:(int64_t)a6 reasonSingle:(int64_t)a7 reasonMetadata:(id)a8
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t v17[16];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (-[PMMPredictor _recommendingAudioWhileAlreadyPlaying:](self, "_recommendingAudioWhileAlreadyPlaying:", v10))
  {
    __atxlog_handle_pmm();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2188D0000, v11, OS_LOG_TYPE_DEFAULT, "suppressing suggestion since audio is already playing", v17, 2u);
    }

    -[PMMPredictor mmAppSuggestion](self, "mmAppSuggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = &unk_24D974CF8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    v18[2] = &unk_24D974D10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackEventWithPropertyValues:", v14);

    v15 = 0;
  }
  else
  {
    v15 = v10;
  }

  return v15;
}

- (id)notifyNonNowPlayingConsumersOfPredictionItem:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  PMMPrediction *v8;
  void *v9;
  PMMPrediction *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  PMMPrediction *v16;
  void *v17;
  PMMPrediction *v18;
  id v20;
  uint8_t buf[4];
  PMMPrediction *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (+[PMMPredictor _predictionPopulatesContinuity:](PMMPredictor, "_predictionPopulatesContinuity:", v4))
  {
    __atxlog_handle_pmm();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D0000, v6, OS_LOG_TYPE_DEFAULT, "prediction populates continuity", buf, 2u);
    }

    -[PMMPredictor expirationForReason:](self, "expirationForReason:", objc_msgSend(v4, "reason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [PMMPrediction alloc];
    v23[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PMMPrediction initWithPredictedItems:expirationDate:](v8, "initWithPredictedItems:expirationDate:", v9, v7);

    if (+[PMMPredictor _predictionPopulatesSpringboard:](PMMPredictor, "_predictionPopulatesSpringboard:", v4))
    {
      __atxlog_handle_pmm();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_2188D0000, v11, OS_LOG_TYPE_DEFAULT, "prediction populates springboard, %@", buf, 0xCu);
      }

      +[PMMPredictionNotification postPredictionUpdate:consumer:](PMMPredictionNotification, "postPredictionUpdate:consumer:", v10, 5);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x24BE04180], "mmConsumerTypeOfConsumerType:consumerSubType:", 1, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x24BE04180], "mmConsumerTypeOfConsumerType:consumerSubType:", 1, 2));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

    }
  }
  if (+[PMMPredictor _predictionPopulatesStark:](PMMPredictor, "_predictionPopulatesStark:", v4))
  {
    __atxlog_handle_pmm();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D0000, v14, OS_LOG_TYPE_DEFAULT, "Prediction populates carplay", buf, 2u);
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", 30.0);
    v16 = [PMMPrediction alloc];
    v20 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PMMPrediction initWithPredictedItems:expirationDate:](v16, "initWithPredictedItems:expirationDate:", v17, v15);

    +[PMMPredictionNotification postPredictionUpdate:consumer:](PMMPredictionNotification, "postPredictionUpdate:consumer:", v18, 3);
    objc_msgSend(v5, "addObject:", &unk_24D974D28);

  }
  return v5;
}

- (void)notifyNowPlayingConsumerOfPredictionItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  PMMPrediction *v7;
  void *v8;
  PMMPrediction *v9;
  uint8_t v10[16];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PMMPredictor setMostRecentNowPlayingPrediction:](self, "setMostRecentNowPlayingPrediction:", v4);
  __atxlog_handle_pmm();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2188D0000, v5, OS_LOG_TYPE_DEFAULT, "Prediction populates now playing.", v10, 2u);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", 30.0);
  v7 = [PMMPrediction alloc];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PMMPrediction initWithPredictedItems:expirationDate:](v7, "initWithPredictedItems:expirationDate:", v8, v6);

  +[PMMPredictionNotification postPredictionUpdate:consumer:](PMMPredictionNotification, "postPredictionUpdate:consumer:", v9, 2);
}

- (id)_publishPredictionWithPredictedApplication:(id)a3 fromUnitTest:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  PMMPredictor *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[3];
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  uint64_t v66;

  v4 = a4;
  v66 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[PMMPredictor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMMPredictor.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predictedApplications"));

  }
  -[PMMPredictor _notifyAppPredictionAboutMMUpdate:](self, "_notifyAppPredictionAboutMMUpdate:", v7);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "addObject:", &unk_24D974D40);
  objc_msgSend(v9, "addObject:", &unk_24D974D58);
  __atxlog_handle_pmm();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v65 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_2188D0000, v10, OS_LOG_TYPE_DEFAULT, "Got %lu Magical Moments predictions.", buf, 0xCu);
  }

  if (!objc_msgSend(v7, "count"))
  {
    __atxlog_handle_pmm();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D0000, v33, OS_LOG_TYPE_DEFAULT, "Got empty Magical Moments prediction.", buf, 2u);
    }
    goto LABEL_31;
  }
  objc_msgSend(v7, "firstObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = -[NSObject reason](v11, "reason");
  v13 = objc_msgSend((id)objc_opt_class(), "pmmReasonToDECReason:", -[NSObject reason](v11, "reason"));
  v14 = objc_msgSend(MEMORY[0x24BE04180], "selectSingleReason:", v13);
  -[NSObject reasonMetadata](v11, "reasonMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMMPredictor logPrediction:predictionSource:mmReason:decReason:reasonSingle:reasonMetadata:](self, "logPrediction:predictionSource:mmReason:decReason:reasonSingle:reasonMetadata:", v11, 2, v12, v13, v14, v15);
  -[PMMPredictor setMostRecentPrediction:](self, "setMostRecentPrediction:", v11);
  v57 = v14;
  -[PMMPredictor preprocessPrediction:predictionSource:mmReason:decReason:reasonSingle:reasonMetadata:](self, "preprocessPrediction:predictionSource:mmReason:decReason:reasonSingle:reasonMetadata:", v11, 2, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "bundleId");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(v17, "bundleId");
      v20 = v4;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (v22)
      {
        v56 = v9;
        -[PMMPredictor notifyNonNowPlayingConsumersOfPredictionItem:](self, "notifyNonNowPlayingConsumersOfPredictionItem:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v15;
        v55 = v23;
        if (+[PMMPredictor _predictionPopulatesNowPlaying:fromUnitTest:](PMMPredictor, "_predictionPopulatesNowPlaying:fromUnitTest:", v17, v20))
        {
          if ((objc_msgSend(v23, "containsObject:", &unk_24D974D28) & 1) == 0)
          {
            -[PMMPredictor notifyNowPlayingConsumerOfPredictionItem:](self, "notifyNowPlayingConsumerOfPredictionItem:", v17);
            objc_msgSend(v23, "addObject:", &unk_24D974CF8);
          }
        }
        else
        {
          +[PMMPredictor getHighestConfidencePredictionForNowPlayingConsumerFromPredictions:fromUnitTest:](PMMPredictor, "getHighestConfidencePredictionForNowPlayingConsumerFromPredictions:fromUnitTest:", v7, v20);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
          {
            v52 = objc_msgSend(v34, "reason");
            v36 = objc_msgSend((id)objc_opt_class(), "pmmReasonToDECReason:", objc_msgSend(v35, "reason"));
            v37 = objc_msgSend(MEMORY[0x24BE04180], "selectSingleReason:", v36);
            objc_msgSend(v35, "reasonMetadata");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[PMMPredictor logPrediction:predictionSource:mmReason:decReason:reasonSingle:reasonMetadata:](self, "logPrediction:predictionSource:mmReason:decReason:reasonSingle:reasonMetadata:", v35, 2, v52, v36, v37, v38);
            -[PMMPredictor preprocessPrediction:predictionSource:mmReason:decReason:reasonSingle:reasonMetadata:](self, "preprocessPrediction:predictionSource:mmReason:decReason:reasonSingle:reasonMetadata:", v35, 2, v52, v36, v37, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v39 && (objc_msgSend(v23, "containsObject:", &unk_24D974D28) & 1) == 0)
            {
              -[PMMPredictor notifyNowPlayingConsumerOfPredictionItem:](self, "notifyNowPlayingConsumerOfPredictionItem:", v39);
              objc_msgSend(v23, "addObject:", &unk_24D974CF8);
            }

            v9 = v56;
          }

        }
        v53 = v17;
        v40 = self;
        objc_msgSend(v9, "addObjectsFromArray:", v23);
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v41 = v9;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v43; ++i)
            {
              if (*(_QWORD *)v59 != v44)
                objc_enumerationMutation(v41);
              v46 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
              -[PMMPredictor mmAppSuggestion](v40, "mmAppSuggestion");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v62[0] = v46;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v57);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v62[1] = v48;
              v62[2] = &unk_24D974D40;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 3);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "trackEventWithPropertyValues:", v49);

            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
          }
          while (v43);
        }

        v33 = v11;
        v9 = v56;
LABEL_31:

        v32 = v9;
        goto LABEL_32;
      }
    }
  }
  __atxlog_handle_default();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[PMMPredictor _publishPredictionWithPredictedApplication:fromUnitTest:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

  v32 = (id)MEMORY[0x24BDBD1A8];
LABEL_32:

  return v32;
}

- (void)_clearAllRecommendationsExceptAppPredictions
{
  NSObject *v3;
  uint8_t v4[16];

  __atxlog_handle_pmm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188D0000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all recommendations, except App Predictions.", v4, 2u);
  }

  +[PMMPredictionNotification postPredictionUpdate:consumer:](PMMPredictionNotification, "postPredictionUpdate:consumer:", 0, 5);
  +[PMMPredictionNotification postPredictionUpdate:consumer:](PMMPredictionNotification, "postPredictionUpdate:consumer:", 0, 3);
  +[PMMPredictionNotification postPredictionUpdate:consumer:](PMMPredictionNotification, "postPredictionUpdate:consumer:", 0, 2);
  -[PMMPredictor setMostRecentNowPlayingPrediction:](self, "setMostRecentNowPlayingPrediction:", 0);
}

- (void)_clearAllRecommendations
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  __atxlog_handle_pmm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188D0000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all recommendations. (1) Clear recommendations for SpringBoard, Stark, and NowPlaying. (2) Clear recommendations for App Predictions.", buf, 2u);
  }

  -[PMMPredictor _clearAllRecommendationsExceptAppPredictions](self, "_clearAllRecommendationsExceptAppPredictions");
  __atxlog_handle_pmm();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188D0000, v4, OS_LOG_TYPE_DEFAULT, "Clearing recommendations for App Predictions.", v5, 2u);
  }

  +[PMMPredictionNotification postPredictionUpdate:consumer:](PMMPredictionNotification, "postPredictionUpdate:consumer:", 0, 1);
  -[PMMPredictor setMostRecentPrediction:](self, "setMostRecentPrediction:", 0);
}

- (id)expirationForReason:(int64_t)a3
{
  char v3;
  NSObject *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  -[PMMPredictor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if ((v3 & 0x10) == 0 && (v3 & 8) != 0)
  {
    __atxlog_handle_pmm();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = 300;
      _os_log_impl(&dword_2188D0000, v5, OS_LOG_TYPE_DEFAULT, "Received a prediction for FirstWakeupOfDay. Setting the expiration date to %lu seconds from now.", (uint8_t *)&v7, 0xCu);
    }

  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", 300.0);
}

+ (BOOL)_predictionPopulatesSpringboard:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForAppDataDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PMMContextHelper sharedInstance](PMMContextHelper, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchDataDictionaryForKeyPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "appBundleIdKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v3, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9) ^ 1;

  return v10;
}

+ (BOOL)_predictionPopulatesContinuity:(id)a3
{
  id v3;
  char v4;
  double v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "reason") == 8 || !objc_msgSend(v3, "reason") || objc_msgSend(v3, "reason") == 512)
    goto LABEL_4;
  objc_msgSend(v3, "confidence");
  if (v6 >= 0.25)
  {
    v4 = 1;
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "reason") & 0x86) == 0)
  {
LABEL_4:
    v4 = 0;
  }
  else
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(v3, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "bundleSupportsINPlayMediaIntentForBundleId:fromUnitTest:", v8, 0);

  }
LABEL_5:

  return v4;
}

+ (BOOL)_predictionIsAudio:(id)a3
{
  return (objc_msgSend(a3, "reason") & 0x86) != 0;
}

+ (BOOL)bundleSupportsINPlayMediaIntentForBundleId:(id)a3 fromUnitTest:(BOOL)a4
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  BOOL v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE04100], "appInfoForBundle:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if ((v9 & 1) != 0)
  {
    if (a4
      || (objc_msgSend(v5, "actionsRestrictedWhileLocked"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "containsObject:", v7),
          v10,
          !v11))
    {
      v14 = 1;
      goto LABEL_11;
    }
    __atxlog_handle_pmm();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v7;
      v13 = "Prediction does not support %@ handling while device is locked.";
LABEL_8:
      _os_log_impl(&dword_2188D0000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    __atxlog_handle_pmm();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v7;
      v13 = "Prediction does not support %@.";
      goto LABEL_8;
    }
  }

  v14 = 0;
LABEL_11:

  return v14;
}

+ (BOOL)_predictionPopulatesNowPlaying:(id)a3 fromUnitTest:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  _BOOL4 v9;
  BOOL v10;
  const char *v11;
  uint8_t *v12;
  uint8_t v14[16];
  uint8_t buf[2];
  __int16 v16;

  v4 = a4;
  v5 = a3;
  if (!+[PMMPredictor _predictionIsAudio:](PMMPredictor, "_predictionIsAudio:", v5))
  {
    __atxlog_handle_pmm();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v11 = "Prediction does not populate now playing because it is not an audio prediction.";
      v12 = (uint8_t *)&v16;
LABEL_10:
      _os_log_impl(&dword_2188D0000, v8, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v5, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[PMMPredictor bundleSupportsINPlayMediaIntentForBundleId:fromUnitTest:](PMMPredictor, "bundleSupportsINPlayMediaIntentForBundleId:fromUnitTest:", v6, v4);

  __atxlog_handle_pmm();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      v11 = "Prediction does not support the INPlayMediaIntent, and, thus, cannot populate NowPlaying.";
      v12 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v9)
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_2188D0000, v8, OS_LOG_TYPE_DEFAULT, "prediction does populate now playing", v14, 2u);
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)_recommendingAudioWhileAlreadyPlaying:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  uint64_t v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  char v25;
  uint8_t v26[4];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "reason") & 0x86) != 0)
  {
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x2020000000;
    v25 = 0;
    v5 = dispatch_semaphore_create(0);
    -[PMMPredictor nowPlayingStatusQueue](self, "nowPlayingStatusQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v7 = v5;
    MRMediaRemoteGetNowPlayingApplicationPlaybackState();

    if (objc_msgSend(MEMORY[0x24BE7A5D8], "waitForSemaphore:timeoutSeconds:", v7, 5.0, v21, 3221225472, __54__PMMPredictor__recommendingAudioWhileAlreadyPlaying___block_invoke, &unk_24D9723F0) == 1)
    {
      __atxlog_handle_pmm();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PMMPredictor _recommendingAudioWhileAlreadyPlaying:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

      v16 = 0;
    }
    else
    {
      __atxlog_handle_pmm();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v23[24];
        *(_DWORD *)v26 = 67109120;
        v27 = v19;
        _os_log_impl(&dword_2188D0000, v18, OS_LOG_TYPE_DEFAULT, "recommending while audio playing, %d", v26, 8u);
      }

      v16 = v23[24] != 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __atxlog_handle_pmm();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D0000, v17, OS_LOG_TYPE_DEFAULT, "prediction is not audio, BT or stark but it wants to populate NP", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

intptr_t __54__PMMPredictor__recommendingAudioWhileAlreadyPlaying___block_invoke(uint64_t a1, int a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)_predictionPopulatesStark:(id)a3
{
  unint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v10;
  uint8_t buf[2];

  v3 = objc_msgSend(a3, "reason");
  __atxlog_handle_pmm();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 0x80) != 0)
  {
    if (v5)
    {
      v10 = 0;
      v6 = "prediction does populate stark";
      v7 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_2188D0000, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v6 = "prediction does not populate stark because reason is not stark";
    v7 = buf;
    goto LABEL_6;
  }

  return (v3 >> 7) & 1;
}

+ (int64_t)pmmReasonToDECReason:(int64_t)a3
{
  return a3 & 0x210 | ((unint64_t)a3 >> 1) & 3 | ((a3 & 1u) << 6) | (32
                                                                                           * (((unint64_t)a3 >> 3) & 1)) & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)a3 >> 3) & 8 | ((unint64_t)a3 >> 5) & 4 | ((((unint64_t)a3 >> 5) & 1) << 10) | (8 * (int)a3) & 0x800;
}

- (void)_updatePredictionBasedOnPreviousDataProtectionStatus:(int64_t)a3 previousEncryptedDataAvailability:(int64_t)a4
{
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  -[PMMPredictor queue](self, "queue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[PMMPredictor mostRecentPrediction](self, "mostRecentPrediction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "reason");

  if ((v7 & 8) != 0)
  {
    __atxlog_handle_pmm();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D0000, v8, OS_LOG_TYPE_DEFAULT, "prediction is first wake up", buf, 2u);
    }

    if (-[PMMPredictor encryptedDataAvailability](self, "encryptedDataAvailability") == 3)
    {
      __atxlog_handle_pmm();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2188D0000, v9, OS_LOG_TYPE_DEFAULT, "clearing recommendation based on lock status", v12, 2u);
      }

      -[PMMPredictor _clearAllRecommendations](self, "_clearAllRecommendations");
    }
  }
  if (-[PMMPredictor encryptedDataAvailability](self, "encryptedDataAvailability") == 3)
  {
    __atxlog_handle_pmm();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2188D0000, v10, OS_LOG_TYPE_DEFAULT, "locking, clearing any now playing recommendations", v11, 2u);
    }

    +[PMMPredictionNotification postPredictionUpdate:consumer:](PMMPredictionNotification, "postPredictionUpdate:consumer:", 0, 2);
  }
}

- (void)dataProtectionMonitor:(id)a3 encryptedDataAvailbilityDidChange:(int64_t)a4
{
  NSObject *v6;
  _QWORD v7[6];

  -[PMMPredictor queue](self, "queue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__PMMPredictor_dataProtectionMonitor_encryptedDataAvailbilityDidChange___block_invoke;
  v7[3] = &unk_24D972418;
  v7[4] = self;
  v7[5] = a4;
  dispatch_async(v6, v7);

}

uint64_t __72__PMMPredictor_dataProtectionMonitor_encryptedDataAvailbilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "encryptedDataAvailability");
  objc_msgSend(*(id *)(a1 + 32), "setEncryptedDataAvailability:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updatePredictionBasedOnPreviousDataProtectionStatus:previousEncryptedDataAvailability:", objc_msgSend(*(id *)(a1 + 32), "dataProtectionStatus"), v2);
}

- (void)dataProtectionMonitor:(id)a3 unlockedSinceBoot:(BOOL)a4
{
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[PMMPredictor queue](self, "queue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__PMMPredictor_dataProtectionMonitor_unlockedSinceBoot___block_invoke;
  v7[3] = &unk_24D972440;
  v7[4] = self;
  v8 = a4;
  dispatch_async(v6, v7);

}

uint64_t __56__PMMPredictor_dataProtectionMonitor_unlockedSinceBoot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUnlockedSinceBoot:", *(unsigned __int8 *)(a1 + 40));
}

- (void)dataProtectionMonitor:(id)a3 dataProtectionStatusDidChange:(int64_t)a4
{
  NSObject *v6;
  _QWORD v7[6];

  -[PMMPredictor queue](self, "queue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__PMMPredictor_dataProtectionMonitor_dataProtectionStatusDidChange___block_invoke;
  v7[3] = &unk_24D972418;
  v7[4] = self;
  v7[5] = a4;
  dispatch_async(v6, v7);

}

uint64_t __68__PMMPredictor_dataProtectionMonitor_dataProtectionStatusDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "dataProtectionStatus");
  __atxlog_handle_pmm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218240;
    v7 = v2;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_2188D0000, v3, OS_LOG_TYPE_DEFAULT, "data protection status did change from %ld to %ld", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setDataProtectionStatus:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updatePredictionBasedOnPreviousDataProtectionStatus:previousEncryptedDataAvailability:", v2, objc_msgSend(*(id *)(a1 + 32), "encryptedDataAvailability"));
}

- (void)handleNowPlayingInfoDidChange
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PMMPredictor nowPlayingStatusQueue](self, "nowPlayingStatusQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__PMMPredictor_handleNowPlayingInfoDidChange__block_invoke;
  v4[3] = &unk_24D972468;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__PMMPredictor_handleNowPlayingInfoDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleNowPlayingInfoDidChange");

}

- (void)_handleNowPlayingInfoDidChange
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[6];
  _QWORD v9[4];
  NSObject *v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  -[PMMPredictor nowPlayingStatusQueue](self, "nowPlayingStatusQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = dispatch_group_create();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy_;
  v12[4] = __Block_byref_object_dispose_;
  v13 = 0;
  dispatch_group_enter(v4);
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__PMMPredictor__handleNowPlayingInfoDidChange__block_invoke;
  v9[3] = &unk_24D972490;
  v11 = v12;
  v6 = v4;
  v10 = v6;
  -[PMMPredictor fetchMediaRemoteNowPlayingApplicationBundleId:](self, "fetchMediaRemoteNowPlayingApplicationBundleId:", v9);
  -[PMMPredictor queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __46__PMMPredictor__handleNowPlayingInfoDidChange__block_invoke_2;
  v8[3] = &unk_24D9724B8;
  v8[4] = self;
  v8[5] = v12;
  dispatch_group_notify(v6, v7, v8);

  _Block_object_dispose(v12, 8);
}

void __46__PMMPredictor__handleNowPlayingInfoDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __46__PMMPredictor__handleNowPlayingInfoDidChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqualToString:", CFSTR("duetexpertd")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMostRecentNowPlayingApp:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDateOfLastNowPlayingEvent:", v2);

    __atxlog_handle_pmm();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "mostRecentNowPlayingApp");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dateOfLastNowPlayingEvent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_2188D0000, v3, OS_LOG_TYPE_DEFAULT, "now playing info did change: %@, %@, ", (uint8_t *)&v6, 0x16u);

    }
  }
}

- (void)fetchMediaRemoteNowPlayingApplicationPlaybackState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    -[PMMPredictor nowPlayingStatusQueue](self, "nowPlayingStatusQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    MRMediaRemoteGetNowPlayingApplicationPlaybackState();

  }
}

uint64_t __67__PMMPredictor_fetchMediaRemoteNowPlayingApplicationPlaybackState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchMediaRemoteNowPlayingApplicationBundleId:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    -[PMMPredictor nowPlayingStatusQueue](self, "nowPlayingStatusQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    MRMediaRemoteGetClientProperties();

  }
}

uint64_t __62__PMMPredictor_fetchMediaRemoteNowPlayingApplicationBundleId___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t BundleIdentifier;

  v1 = *(_QWORD *)(a1 + 32);
  BundleIdentifier = MRNowPlayingClientGetBundleIdentifier();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, BundleIdentifier);
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[PMMPredictor queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__PMMPredictor_callObserver_callChanged___block_invoke;
  v8[3] = &unk_24D9723C8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __41__PMMPredictor_callObserver_callChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "calls");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(v2, "count") != 0;

}

- (PMMAudioDisconnectListener)disconnectListener
{
  return self->_disconnectListener;
}

- (void)setDisconnectListener:(id)a3
{
  objc_storeStrong((id *)&self->_disconnectListener, a3);
}

- (PMMMusicStateProcessor)musicStateProcessor
{
  return self->_musicStateProcessor;
}

- (void)setMusicStateProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_musicStateProcessor, a3);
}

- (OS_dispatch_queue)nowPlayingStatusQueue
{
  return self->_nowPlayingStatusQueue;
}

- (void)setNowPlayingStatusQueue:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingStatusQueue, a3);
}

- (PMMTelephonyConnection)ctConnection
{
  return self->_ctConnection;
}

- (void)setCtConnection:(id)a3
{
  objc_storeStrong((id *)&self->_ctConnection, a3);
}

- (PMMDataProtectionMonitor)dataProtectionMonitor
{
  return self->_dataProtectionMonitor;
}

- (void)setDataProtectionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionMonitor, a3);
}

- (void)setMostRecentPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentPrediction, a3);
}

- (PMMPredictionItem)mostRecentNowPlayingPrediction
{
  return self->_mostRecentNowPlayingPrediction;
}

- (void)setMostRecentNowPlayingPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentNowPlayingPrediction, a3);
}

- (NSString)mostRecentNowPlayingApp
{
  return self->_mostRecentNowPlayingApp;
}

- (void)setMostRecentNowPlayingApp:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentNowPlayingApp, a3);
}

- (NSDate)dateOfLastNowPlayingEvent
{
  return self->_dateOfLastNowPlayingEvent;
}

- (void)setDateOfLastNowPlayingEvent:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfLastNowPlayingEvent, a3);
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  self->_encryptedDataAvailability = a3;
}

- (BOOL)unlockedSinceBoot
{
  return self->_unlockedSinceBoot;
}

- (void)setUnlockedSinceBoot:(BOOL)a3
{
  self->_unlockedSinceBoot = a3;
}

- (int64_t)dataProtectionStatus
{
  return self->_dataProtectionStatus;
}

- (void)setDataProtectionStatus:(int64_t)a3
{
  self->_dataProtectionStatus = a3;
}

- (PETScalarEventTracker)mmAppSuggestion
{
  return self->_mmAppSuggestion;
}

- (void)setMmAppSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_mmAppSuggestion, a3);
}

- (PETScalarEventTracker)heroAppSuggestion
{
  return self->_heroAppSuggestion;
}

- (void)setHeroAppSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_heroAppSuggestion, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heroAppSuggestion, 0);
  objc_storeStrong((id *)&self->_mmAppSuggestion, 0);
  objc_storeStrong((id *)&self->_dateOfLastNowPlayingEvent, 0);
  objc_storeStrong((id *)&self->_mostRecentNowPlayingApp, 0);
  objc_storeStrong((id *)&self->_mostRecentNowPlayingPrediction, 0);
  objc_storeStrong((id *)&self->_mostRecentPrediction, 0);
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_ctConnection, 0);
  objc_storeStrong((id *)&self->_nowPlayingStatusQueue, 0);
  objc_storeStrong((id *)&self->_musicStateProcessor, 0);
  objc_storeStrong((id *)&self->_disconnectListener, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
}

- (void)_publishPredictionWithPredictedApplication:(uint64_t)a3 fromUnitTest:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188D0000, a1, a3, "Magical Moments prediction returned a nil or empty applicationBundleIdentifier", a5, a6, a7, a8, 0);
}

- (void)_recommendingAudioWhileAlreadyPlaying:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188D0000, a1, a3, "Could not read now playing state within 5s.", a5, a6, a7, a8, 0);
}

@end
