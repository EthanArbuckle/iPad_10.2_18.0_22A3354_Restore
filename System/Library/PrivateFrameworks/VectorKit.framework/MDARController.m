@implementation MDARController

- (MDARController)init
{
  MDARController *v2;
  MDARController *v3;
  ARSession *v4;
  ARSession *session;
  ARPositionalTrackingConfiguration *sessionConfiguration;
  ARPositionalTrackingConfiguration *v7;
  ARPositionalTrackingConfiguration *v8;
  void *v9;
  void *v10;
  MDARController *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MDARController;
  v2 = -[MDARController init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_trackingStateReason = 0;
    v2->_sessionInterruptedReason = 0;
    v2->_trackingState = 2;
    if (LoadARKit(void)::loadPredicate != -1)
      dispatch_once(&LoadARKit(void)::loadPredicate, &__block_literal_global_22025);
    v4 = (ARSession *)objc_alloc_init((Class)getARSessionClass());
    session = v3->_session;
    v3->_session = v4;

    -[ARSession setDelegate:](v3->_session, "setDelegate:", v3);
    sessionConfiguration = v3->_sessionConfiguration;
    v3->_sessionConfiguration = 0;

    if (objc_msgSend((id)getARPositionalTrackingConfigurationClass(), "isSupported"))
    {
      getARPositionalTrackingConfigurationClass();
      v7 = (ARPositionalTrackingConfiguration *)objc_opt_new();
      -[ARPositionalTrackingConfiguration setPlaneDetection:](v7, "setPlaneDetection:", 0);
      -[ARPositionalTrackingConfiguration setWorldAlignment:](v7, "setWorldAlignment:", 0);
      -[ARPositionalTrackingConfiguration setLightEstimationEnabled:](v7, "setLightEstimationEnabled:", 0);
      v8 = v3->_sessionConfiguration;
      v3->_sessionConfiguration = v7;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    getAVCaptureSessionWasInterruptedNotification();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel__avCaptureSessionWasInterrupted_, v10, 0);

    v11 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  ARSession *session;
  ARPositionalTrackingConfiguration *sessionConfiguration;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[ARSession pause](self->_session, "pause");
  session = self->_session;
  self->_session = 0;

  sessionConfiguration = self->_sessionConfiguration;
  self->_sessionConfiguration = 0;

  v6.receiver = self;
  v6.super_class = (Class)MDARController;
  -[MDARController dealloc](&v6, sel_dealloc);
}

- (void)run:(BOOL)a3
{
  ARSession *session;

  if (self->_sessionConfiguration)
  {
    session = self->_session;
    if (a3)
      -[ARSession runWithConfiguration:options:](session, "runWithConfiguration:options:");
    else
      -[ARSession runWithConfiguration:](session, "runWithConfiguration:");
  }
}

- (void)pause
{
  -[ARSession pause](self->_session, "pause");
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  BOOL v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v6 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 134218240;
    v11 = objc_msgSend(v5, "trackingState");
    v12 = 2048;
    v13 = objc_msgSend(v5, "trackingStateReason");
    _os_log_impl(&dword_19F029000, v6, OS_LOG_TYPE_INFO, "AR Tracking state changed: %ld, reason: %ld", (uint8_t *)&v10, 0x16u);
  }

  self->_trackingState = +[MDARController vkARTrackingStateFromARTrackingState:](MDARController, "vkARTrackingStateFromARTrackingState:", objc_msgSend(v5, "trackingState"));
  self->_trackingStateReason = +[MDARController vkARTrackingStateReasonFromARTrackingStateReason:](MDARController, "vkARTrackingStateReasonFromARTrackingStateReason:", objc_msgSend(v5, "trackingStateReason"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained == 0;

  if (!v8)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "arController:didChangeTrackingState:reason:", self, self->_trackingState, self->_trackingStateReason);

  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  BOOL v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v6 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_19F029000, v6, OS_LOG_TYPE_INFO, "AR did fail with error: %@", (uint8_t *)&v13, 0xCu);
  }

  v7 = objc_msgSend(v5, "code");
  if (v7 > 101)
  {
    if (v7 == 102)
    {
      v8 = 3;
      goto LABEL_15;
    }
    if (v7 == 200)
    {
      v8 = 4;
      goto LABEL_15;
    }
  }
  else
  {
    if (v7 == 100)
    {
      v8 = 1;
      goto LABEL_15;
    }
    if (v7 == 101)
    {
      v8 = 2;
      goto LABEL_15;
    }
  }
  v8 = 0;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.AR"), v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained == 0;

  if (!v11)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "arController:didEncounterError:", self, v9);

  }
}

- (void)sessionWasInterrupted:(id)a3
{
  NSObject *v4;
  unint64_t sessionInterruptedReason;
  id WeakRetained;
  BOOL v7;
  id v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v4 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sessionInterruptedReason = self->_sessionInterruptedReason;
    v9 = 134217984;
    v10 = sessionInterruptedReason;
    _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "AR sessions was interrupted: %lu", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained == 0;

  if (!v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "arController:arSessionWasInterrupted:", self, self->_sessionInterruptedReason);

  }
}

- (void)sessionInterruptionEnded:(id)a3
{
  MDARControllerDelegate **p_delegate;
  id WeakRetained;
  id v6;

  self->_sessionInterruptedReason = 0;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "arControllerSessionInterruptionEnded:", self);

  }
}

- (void)_avCaptureSessionWasInterrupted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint8_t v11[16];

  v4 = a3;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v5 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "AR AV capture session was interrupted", v11, 2u);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getAVCaptureSessionInterruptionReasonKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if ((unint64_t)(v9 - 1) >= 4)
    v10 = 1;
  else
    v10 = qword_1A007BA50[v9 - 1];
  self->_sessionInterruptedReason = v10;

}

- (ARSession)session
{
  return self->_session;
}

- (unint64_t)sessionInterruptedReason
{
  return self->_sessionInterruptedReason;
}

- (MDARControllerDelegate)delegate
{
  return (MDARControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

+ (BOOL)isSupported
{
  if (LoadARKit(void)::loadPredicate != -1)
    dispatch_once(&LoadARKit(void)::loadPredicate, &__block_literal_global_22025);
  return -[objc_class isSupported](getARPositionalTrackingConfigurationClass(), "isSupported");
}

+ (unint64_t)vkARTrackingStateReasonFromARTrackingStateReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (unint64_t)vkARTrackingStateFromARTrackingState:(int64_t)a3
{
  unint64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

@end
