@implementation CACUserAttentionController

- (CACUserAttentionController)initWithSamplingInterval:(double)a3 attentionLossTimeout:(double)a4 supportedAttentionAwarenessEvents:(unint64_t)a5 deviceSupportsRaiseGestureDetection:(BOOL)a6
{
  _BOOL8 v6;
  CACUserAttentionSignalProviderFactory *v9;
  CACUserAttentionController *v10;

  v6 = a6;
  v9 = -[CACUserAttentionSignalProviderFactory initWithSamplingInterval:attentionLossTimeout:supportedAttentionAwarenessEvents:]([CACUserAttentionSignalProviderFactory alloc], "initWithSamplingInterval:attentionLossTimeout:supportedAttentionAwarenessEvents:", a5, a3, a4);
  v10 = -[CACUserAttentionController initWithSignalProviderFactory:supportedAttentionAwarenessEvents:deviceSupportsRaiseGestureDetection:](self, "initWithSignalProviderFactory:supportedAttentionAwarenessEvents:deviceSupportsRaiseGestureDetection:", v9, a5, v6);

  return v10;
}

- (CACUserAttentionController)initWithSignalProviderFactory:(id)a3 supportedAttentionAwarenessEvents:(unint64_t)a4 deviceSupportsRaiseGestureDetection:(BOOL)a5
{
  id v9;
  CACUserAttentionController *v10;
  CACUserAttentionController *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *attentionAwarenessHandlerQueue;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CACUserAttentionController;
  v10 = -[CACUserAttentionController init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_userAttentionSignalProviderFactory, a3);
    v11->_supportedAttentionAwarenessEvents = a4;
    v11->_deviceSupportsRaiseGestureDetection = a5;
    v11->_deviceLowered = 0;
    v12 = dispatch_queue_create("com.apple.SpeechRecognitionCore.AttentionAwarenessQueue", 0);
    attentionAwarenessHandlerQueue = v11->_attentionAwarenessHandlerQueue;
    v11->_attentionAwarenessHandlerQueue = (OS_dispatch_queue *)v12;

  }
  return v11;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4_0(&dword_229A40000, a2, a3, "Failed to stop user attention controller: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (BOOL)startIfNeeded:(id *)a3
{
  return -[CACUserAttentionController startIfNeededForTypes:error:](self, "startIfNeededForTypes:error:", 7, a3);
}

- (BOOL)startIfNeededForTypes:(unint64_t)a3 error:(id *)a4
{
  char v5;
  BOOL v7;

  v5 = a3;
  if ((a3 & 1) != 0 && !-[CACUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 1))
  {
    if (!-[CACUserAttentionController _startFaceAttentionAwarenessClient:](self, "_startFaceAttentionAwarenessClient:", a4))return 0;
    -[CACUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 1, 1);
  }
  if ((v5 & 2) != 0 && !-[CACUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 2))
  {
    if (-[CACUserAttentionController _startTouchAttentionAwarenessClient:](self, "_startTouchAttentionAwarenessClient:", a4))
    {
      -[CACUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 1, 2);
      goto LABEL_9;
    }
    return 0;
  }
LABEL_9:
  if ((v5 & 4) == 0 || -[CACUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 4))
    return 1;
  -[CACUserAttentionController _startWakeGestureManagerIfNeeded](self, "_startWakeGestureManagerIfNeeded");
  v7 = 1;
  -[CACUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 1, 4);
  return v7;
}

- (BOOL)stopIfNeeded:(id *)a3
{
  return -[CACUserAttentionController stopIfNeededForTypes:error:](self, "stopIfNeededForTypes:error:", 7, a3);
}

- (BOOL)stopIfNeededForTypes:(unint64_t)a3 error:(id *)a4
{
  char v5;
  _BOOL4 v7;

  v5 = a3;
  if ((a3 & 1) != 0 && -[CACUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 1))
  {
    v7 = -[CACUserAttentionController _stopFaceAttentionAwarenessClient:](self, "_stopFaceAttentionAwarenessClient:", a4);
    if (!v7)
      return v7;
    -[CACUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 0, 1);
  }
  if ((v5 & 2) != 0 && -[CACUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 2))
  {
    v7 = -[CACUserAttentionController _stopTouchAttentionAwarenessClient:](self, "_stopTouchAttentionAwarenessClient:", a4);
    if (!v7)
      return v7;
    -[CACUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 0, 2);
  }
  if ((v5 & 4) != 0 && -[CACUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 4))
  {
    -[CACUserAttentionController _stopWakeGestureManagerIfNeeded](self, "_stopWakeGestureManagerIfNeeded");
    -[CACUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 0, 4);
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)_startFaceAttentionAwarenessClient:(id *)a3
{
  AWAttentionAwarenessClient *v5;
  AWAttentionAwarenessClient *faceAttentionAwarenessClient;
  AWAttentionAwarenessClient *v7;
  OS_dispatch_queue *attentionAwarenessHandlerQueue;
  uint64_t v9;
  AWAttentionAwarenessClient *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  -[CACUserAttentionSignalProviderFactory faceAttentionAwarenessClient](self->_userAttentionSignalProviderFactory, "faceAttentionAwarenessClient");
  v5 = (AWAttentionAwarenessClient *)objc_claimAutoreleasedReturnValue();
  faceAttentionAwarenessClient = self->_faceAttentionAwarenessClient;
  self->_faceAttentionAwarenessClient = v5;

  objc_initWeak(&location, self);
  v7 = self->_faceAttentionAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __65__CACUserAttentionController__startFaceAttentionAwarenessClient___block_invoke;
  v16[3] = &unk_24F2AC320;
  objc_copyWeak(&v17, &location);
  -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v7, "setEventHandlerWithQueue:block:", attentionAwarenessHandlerQueue, v16);
  v10 = self->_faceAttentionAwarenessClient;
  v11 = MEMORY[0x24BDAC9B8];
  v12 = MEMORY[0x24BDAC9B8];
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __65__CACUserAttentionController__startFaceAttentionAwarenessClient___block_invoke_2;
  v14[3] = &unk_24F2AC348;
  objc_copyWeak(&v15, &location);
  -[AWAttentionAwarenessClient setNotificationHandlerWithQueue:block:](v10, "setNotificationHandlerWithQueue:block:", v11, v14);

  LOBYTE(a3) = -[AWAttentionAwarenessClient resumeWithError:](self->_faceAttentionAwarenessClient, "resumeWithError:", a3);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return (char)a3;
}

void __65__CACUserAttentionController__startFaceAttentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleFaceAttentionEvent:", v3);

}

void __65__CACUserAttentionController__startFaceAttentionAwarenessClient___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleFaceInterruptNotification:", a2);

}

- (BOOL)_startTouchAttentionAwarenessClient:(id *)a3
{
  AWAttentionAwarenessClient *v5;
  AWAttentionAwarenessClient *touchAttentionAwarenessClient;
  AWAttentionAwarenessClient *v7;
  OS_dispatch_queue *attentionAwarenessHandlerQueue;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  -[CACUserAttentionSignalProviderFactory touchAttentionAwarenessClient](self->_userAttentionSignalProviderFactory, "touchAttentionAwarenessClient");
  v5 = (AWAttentionAwarenessClient *)objc_claimAutoreleasedReturnValue();
  touchAttentionAwarenessClient = self->_touchAttentionAwarenessClient;
  self->_touchAttentionAwarenessClient = v5;

  objc_initWeak(&location, self);
  v7 = self->_touchAttentionAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __66__CACUserAttentionController__startTouchAttentionAwarenessClient___block_invoke;
  v13 = &unk_24F2AC320;
  objc_copyWeak(&v14, &location);
  -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v7, "setEventHandlerWithQueue:block:", attentionAwarenessHandlerQueue, &v10);
  LOBYTE(a3) = -[AWAttentionAwarenessClient resumeWithError:](self->_touchAttentionAwarenessClient, "resumeWithError:", a3, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return (char)a3;
}

void __66__CACUserAttentionController__startTouchAttentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleTouchAttentionEvent:", v3);

}

- (BOOL)_stopFaceAttentionAwarenessClient:(id *)a3
{
  char v4;
  AWAttentionAwarenessClient *faceAttentionAwarenessClient;

  v4 = -[AWAttentionAwarenessClient invalidateWithError:](self->_faceAttentionAwarenessClient, "invalidateWithError:", a3);
  faceAttentionAwarenessClient = self->_faceAttentionAwarenessClient;
  self->_faceAttentionAwarenessClient = 0;

  return v4;
}

- (BOOL)_stopTouchAttentionAwarenessClient:(id *)a3
{
  char v4;
  AWAttentionAwarenessClient *touchAttentionAwarenessClient;

  v4 = -[AWAttentionAwarenessClient invalidateWithError:](self->_touchAttentionAwarenessClient, "invalidateWithError:", a3);
  touchAttentionAwarenessClient = self->_touchAttentionAwarenessClient;
  self->_touchAttentionAwarenessClient = 0;

  return v4;
}

- (BOOL)_restartFaceAttentionAwarenessClient:(id *)a3
{
  if (-[CACUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 1))
    return -[AWAttentionAwarenessClient resetAttentionLostTimeoutWithError:](self->_faceAttentionAwarenessClient, "resetAttentionLostTimeoutWithError:", a3);
  else
    return -[CACUserAttentionController startIfNeededForTypes:error:](self, "startIfNeededForTypes:error:", 1, a3);
}

- (void)_handleFaceAttentionEvent:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10[3];
  id location;

  v4 = objc_msgSend(a3, "eventMask");
  if (-[CACUserAttentionController _isDeviceLowered](self, "_isDeviceLowered"))
  {
    v5 = 0;
    v6 = 2;
  }
  else
  {
    v7 = 1;
    v8 = 3;
    if ((v4 & 8) == 0)
      v8 = (v4 >> 7) & 4;
    if ((v4 & 0x80) == 0)
      v7 = v8;
    v6 = (v4 & 1) != 0;
    if ((v4 & 1) != 0)
      v5 = 0;
    else
      v5 = (void *)v7;
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__CACUserAttentionController__handleFaceAttentionEvent___block_invoke;
  v9[3] = &unk_24F2AC370;
  v10[1] = (id)v6;
  objc_copyWeak(v10, &location);
  v10[2] = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __56__CACUserAttentionController__handleFaceAttentionEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  if (*(_QWORD *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v2, "userAttentionController:didLoseAttentionWithEvent:", v3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!*(_QWORD *)(a1 + 48))
      return;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v2, "userAttentionController:didGainAttentionWithEvent:", v3, *(_QWORD *)(a1 + 48));
  }

}

- (void)_handleFaceInterruptNotification:(unint64_t)a3
{
  id v4;

  if (a3 == 2)
  {
    -[CACUserAttentionController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAttentionControllerAttentionAwarenessInterruptionEnded:", self);
  }
  else
  {
    if (a3 != 1)
      return;
    -[CACUserAttentionController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAttentionControllerAttentionAwarenessInterrupted:", self);
  }

}

- (void)_handleTouchAttentionEvent:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7[3];
  id location;

  v4 = objc_msgSend(a3, "eventMask");
  if ((v4 & 8) != 0)
    v5 = 3;
  else
    v5 = (v4 >> 7) & 4;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__CACUserAttentionController__handleTouchAttentionEvent___block_invoke;
  v6[3] = &unk_24F2AC370;
  v7[1] = 0;
  objc_copyWeak(v7, &location);
  v7[2] = (id)v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __57__CACUserAttentionController__handleTouchAttentionEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  if (*(_QWORD *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v2, "userAttentionController:didLoseAttentionWithEvent:", v3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!*(_QWORD *)(a1 + 48))
      return;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v2, "userAttentionController:didGainAttentionWithEvent:", v3, *(_QWORD *)(a1 + 48));
  }

}

- (void)_startWakeGestureManagerIfNeeded
{
  CMWakeGestureManager *v3;
  CMWakeGestureManager *wakeGestureManager;

  if (!-[CACUserAttentionController _deviceSupportsFaceDetection](self, "_deviceSupportsFaceDetection")
    && self->_deviceSupportsRaiseGestureDetection)
  {
    -[CACUserAttentionSignalProviderFactory wakeGestureManager](self->_userAttentionSignalProviderFactory, "wakeGestureManager");
    v3 = (CMWakeGestureManager *)objc_claimAutoreleasedReturnValue();
    wakeGestureManager = self->_wakeGestureManager;
    self->_wakeGestureManager = v3;

    -[CMWakeGestureManager setDelegate:](self->_wakeGestureManager, "setDelegate:", self);
    -[CMWakeGestureManager startWakeGestureUpdates](self->_wakeGestureManager, "startWakeGestureUpdates");
  }
}

- (void)_stopWakeGestureManagerIfNeeded
{
  CMWakeGestureManager *wakeGestureManager;

  if (!-[CACUserAttentionController _deviceSupportsFaceDetection](self, "_deviceSupportsFaceDetection")
    && self->_deviceSupportsRaiseGestureDetection)
  {
    -[CMWakeGestureManager stopWakeGestureUpdates](self->_wakeGestureManager, "stopWakeGestureUpdates");
    -[CMWakeGestureManager setDelegate:](self->_wakeGestureManager, "setDelegate:", 0);
    wakeGestureManager = self->_wakeGestureManager;
    self->_wakeGestureManager = 0;

  }
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  _QWORD block[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke;
  block[3] = &unk_24F2AC398;
  v6[1] = (id)a4;
  objc_copyWeak(v6, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id v3;
  id v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  id WeakRetained;
  id v16;
  char v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;

  v1 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(v1 - 2) >= 2)
  {
    if (v1 != 1)
    {
      v6 = 0;
      goto LABEL_13;
    }
    v14 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_setDeviceLowered:", 0);

    v16 = objc_loadWeakRetained(v14);
    v27 = 0;
    v17 = objc_msgSend(v16, "stopIfNeededForTypes:error:", 1, &v27);
    v6 = v27;

    if ((v17 & 1) == 0)
    {
      CACLogAttentionAware();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke_cold_2((uint64_t)v6, v18, v19, v20, v21, v22, v23, v24);

    }
    v7 = objc_loadWeakRetained(v14);
    -[NSObject delegate](v7, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_loadWeakRetained(v14);
    objc_msgSend(v25, "userAttentionController:didGainAttentionWithEvent:", v26, 2);

    goto LABEL_11;
  }
  v2 = (id *)(a1 + 32);
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "_setDeviceLowered:", 1);

  v4 = objc_loadWeakRetained(v2);
  v28 = 0;
  v5 = objc_msgSend(v4, "_restartFaceAttentionAwarenessClient:", &v28);
  v6 = v28;

  if ((v5 & 1) == 0)
  {
    CACLogAttentionAware();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_11:

  }
LABEL_13:

}

- (BOOL)_detectionStartedForType:(unint64_t)a3
{
  NSMutableDictionary *attentionDetectionStatuses;
  void *v4;
  void *v5;
  char v6;

  attentionDetectionStatuses = self->_attentionDetectionStatuses;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](attentionDetectionStatuses, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)_setDetectionStarted:(BOOL)a3 forType:(unint64_t)a4
{
  _BOOL8 v5;
  NSMutableDictionary *attentionDetectionStatuses;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v5 = a3;
  attentionDetectionStatuses = self->_attentionDetectionStatuses;
  if (attentionDetectionStatuses)
  {
    v8 = attentionDetectionStatuses;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v9 = self->_attentionDetectionStatuses;
  self->_attentionDetectionStatuses = v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v10 = self->_attentionDetectionStatuses;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, v11);

}

- (BOOL)_deviceSupportsFaceDetection
{
  return LOBYTE(self->_supportedAttentionAwarenessEvents) >> 7;
}

- (CACUserAttentionControllerDelegate)delegate
{
  return (CACUserAttentionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_isDeviceLowered
{
  return self->_deviceLowered;
}

- (void)_setDeviceLowered:(BOOL)a3
{
  self->_deviceLowered = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asynchronousCallQueue, 0);
  objc_storeStrong((id *)&self->_attentionDetectionStatuses, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessHandlerQueue, 0);
  objc_storeStrong((id *)&self->_wakeGestureManager, 0);
  objc_storeStrong((id *)&self->_touchAttentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_faceAttentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_userAttentionSignalProviderFactory, 0);
}

- (void)startIfNeededForTypes:(unint64_t)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *asynchronousCallQueue;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17[2];
  id location;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    if (!self->_asynchronousCallQueue)
    {
      v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SpeechRecognitionCore.CACUserAttentionControllerQueue", 0);
      asynchronousCallQueue = self->_asynchronousCallQueue;
      self->_asynchronousCallQueue = v11;

    }
    objc_initWeak(&location, self);
    v13 = self->_asynchronousCallQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __100__CACUserAttentionController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke;
    block[3] = &unk_24F2AC3E8;
    objc_copyWeak(v17, &location);
    v17[1] = (id)a3;
    v15 = v8;
    v16 = v10;
    dispatch_async(v13, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }

}

void __100__CACUserAttentionController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 56);
  v11 = 0;
  objc_msgSend(WeakRetained, "startIfNeededForTypes:error:", v3, &v11);
  v4 = v11;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__CACUserAttentionController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke_2;
  block[3] = &unk_24F2AC3C0;
  v5 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __100__CACUserAttentionController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_229A40000, a2, a3, "Failed to restart attention awareness client: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __70__CACUserAttentionController_wakeGestureManager_didUpdateWakeGesture___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_229A40000, a2, a3, "Failed to stop attention awareness client: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
