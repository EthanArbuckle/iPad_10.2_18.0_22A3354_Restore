@implementation SASUIDeviceScreenEngagementController

void __68__SASUIDeviceScreenEngagementController__handleTouchAttentionEvent___block_invoke(uint64_t a1)
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
    objc_msgSend(v2, "deviceScreenEngagementController:didLoseAttentionWithEvent:", v3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!*(_QWORD *)(a1 + 48))
      return;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v2, "deviceScreenEngagementController:didGainAttentionWithEvent:", v3, *(_QWORD *)(a1 + 48));
  }

}

- (SASUIDeviceScreenEngagementControllerDelegate)delegate
{
  return (SASUIDeviceScreenEngagementControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __77__SASUIDeviceScreenEngagementController__startTouchAttentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleTouchAttentionEvent:", v3);

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
  v6[2] = __68__SASUIDeviceScreenEngagementController__handleTouchAttentionEvent___block_invoke;
  v6[3] = &unk_24D47A3B0;
  v7[1] = 0;
  objc_copyWeak(v7, &location);
  v7[2] = (id)v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (SASUIDeviceScreenEngagementController)initWithSamplingInterval:(double)a3 attentionLostTimeout:(double)a4
{
  SASUIUserEngagementProviderFactory *v5;
  SASUIDeviceScreenEngagementController *v6;

  v5 = -[SASUIUserEngagementProviderFactory initWithSamplingInterval:attentionLostTimeout:]([SASUIUserEngagementProviderFactory alloc], "initWithSamplingInterval:attentionLostTimeout:", a3, a4);
  v6 = -[SASUIDeviceScreenEngagementController initWithSignalProviderFactory:](self, "initWithSignalProviderFactory:", v5);

  return v6;
}

- (SASUIDeviceScreenEngagementController)initWithSignalProviderFactory:(id)a3
{
  id v5;
  SASUIDeviceScreenEngagementController *v6;
  SASUIDeviceScreenEngagementController *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *attentionAwarenessHandlerQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SASUIDeviceScreenEngagementController;
  v6 = -[SASUIDeviceScreenEngagementController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userAttentionSignalProviderFactory, a3);
    v8 = dispatch_queue_create("com.apple.siri.AttentionAwarenessQueue", 0);
    attentionAwarenessHandlerQueue = v7->_attentionAwarenessHandlerQueue;
    v7->_attentionAwarenessHandlerQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)dealloc
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[SASUIDeviceScreenEngagementController dealloc]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_215D55000, a2, OS_LOG_TYPE_ERROR, "%s Failed to stop user attention: %@", (uint8_t *)&v2, 0x16u);
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

  -[SASUIUserEngagementProviderFactory touchAttentionAwarenessClient](self->_userAttentionSignalProviderFactory, "touchAttentionAwarenessClient");
  v5 = (AWAttentionAwarenessClient *)objc_claimAutoreleasedReturnValue();
  touchAttentionAwarenessClient = self->_touchAttentionAwarenessClient;
  self->_touchAttentionAwarenessClient = v5;

  objc_initWeak(&location, self);
  v7 = self->_touchAttentionAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __77__SASUIDeviceScreenEngagementController__startTouchAttentionAwarenessClient___block_invoke;
  v13 = &unk_24D47A388;
  objc_copyWeak(&v14, &location);
  -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v7, "setEventHandlerWithQueue:block:", attentionAwarenessHandlerQueue, &v10);
  LOBYTE(a3) = -[AWAttentionAwarenessClient resumeWithError:](self->_touchAttentionAwarenessClient, "resumeWithError:", a3, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return (char)a3;
}

- (BOOL)_startButtonPressAttentionAwarenessClient:(id *)a3
{
  AWAttentionAwarenessClient *v5;
  AWAttentionAwarenessClient *buttonPressAwarenessClient;
  AWAttentionAwarenessClient *v7;
  OS_dispatch_queue *attentionAwarenessHandlerQueue;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  -[SASUIUserEngagementProviderFactory buttonPressAwarenessClient](self->_userAttentionSignalProviderFactory, "buttonPressAwarenessClient");
  v5 = (AWAttentionAwarenessClient *)objc_claimAutoreleasedReturnValue();
  buttonPressAwarenessClient = self->_buttonPressAwarenessClient;
  self->_buttonPressAwarenessClient = v5;

  objc_initWeak(&location, self);
  v7 = self->_buttonPressAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __83__SASUIDeviceScreenEngagementController__startButtonPressAttentionAwarenessClient___block_invoke;
  v13 = &unk_24D47A388;
  objc_copyWeak(&v14, &location);
  -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v7, "setEventHandlerWithQueue:block:", attentionAwarenessHandlerQueue, &v10);
  LOBYTE(a3) = -[AWAttentionAwarenessClient resumeWithError:](self->_buttonPressAwarenessClient, "resumeWithError:", a3, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return (char)a3;
}

void __83__SASUIDeviceScreenEngagementController__startButtonPressAttentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleButtonPressAttentionEvent:", v3);

}

- (void)_handleButtonPressAttentionEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9[2];
  id location;

  v4 = a3;
  v5 = (void *)((objc_msgSend(v4, "eventMask") << 62 >> 63) & 5);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__SASUIDeviceScreenEngagementController__handleButtonPressAttentionEvent___block_invoke;
  v7[3] = &unk_24D47A3D8;
  v9[1] = v5;
  objc_copyWeak(v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __74__SASUIDeviceScreenEngagementController__handleButtonPressAttentionEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  if (*(_QWORD *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v2, "deviceScreenEngagementController:didGainAttentionWithEvent:", v3, *(_QWORD *)(a1 + 48));
LABEL_3:

    return;
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v2, "deviceScreenEngagementController:didLoseAttentionWithEvent:", v3, 0);
    goto LABEL_3;
  }
}

- (BOOL)startIfNeeded:(id *)a3
{
  return -[SASUIDeviceScreenEngagementController startIfNeededForTypes:error:](self, "startIfNeededForTypes:error:", 10, a3);
}

- (BOOL)startIfNeededForTypes:(unint64_t)a3 error:(id *)a4
{
  char v5;
  BOOL v7;

  v5 = a3;
  if ((a3 & 2) != 0
    && !-[SASUIDeviceScreenEngagementController _detectionStartedForType:](self, "_detectionStartedForType:", 2))
  {
    if (!-[SASUIDeviceScreenEngagementController _startTouchAttentionAwarenessClient:](self, "_startTouchAttentionAwarenessClient:", a4))return 0;
    -[SASUIDeviceScreenEngagementController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 1, 2);
  }
  if ((v5 & 8) != 0
    && !-[SASUIDeviceScreenEngagementController _detectionStartedForType:](self, "_detectionStartedForType:", 8))
  {
    if (-[SASUIDeviceScreenEngagementController _startButtonPressAttentionAwarenessClient:](self, "_startButtonPressAttentionAwarenessClient:", a4))
    {
      v7 = 1;
      -[SASUIDeviceScreenEngagementController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 1, 8);
      return v7;
    }
    return 0;
  }
  return 1;
}

- (BOOL)stopIfNeeded:(id *)a3
{
  return -[SASUIDeviceScreenEngagementController stopIfNeededForTypes:error:](self, "stopIfNeededForTypes:error:", 10, a3);
}

- (BOOL)stopIfNeededForTypes:(unint64_t)a3 error:(id *)a4
{
  _BOOL4 v6;

  if (-[SASUIDeviceScreenEngagementController _detectionStartedForType:](self, "_detectionStartedForType:", 2))
  {
    v6 = -[SASUIDeviceScreenEngagementController _stopTouchAttentionAwarenessClient:](self, "_stopTouchAttentionAwarenessClient:", a4);
    if (!v6)
      return v6;
    -[SASUIDeviceScreenEngagementController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 0, 2);
  }
  if (!-[SASUIDeviceScreenEngagementController _detectionStartedForType:](self, "_detectionStartedForType:", 8))
  {
LABEL_7:
    LOBYTE(v6) = 1;
    return v6;
  }
  v6 = -[SASUIDeviceScreenEngagementController _stopButtonPressAttentionAwarenessClient:](self, "_stopButtonPressAttentionAwarenessClient:", a4);
  if (v6)
  {
    -[SASUIDeviceScreenEngagementController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 0, 8);
    goto LABEL_7;
  }
  return v6;
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

- (BOOL)_stopButtonPressAttentionAwarenessClient:(id *)a3
{
  char v4;
  AWAttentionAwarenessClient *buttonPressAwarenessClient;

  v4 = -[AWAttentionAwarenessClient invalidateWithError:](self->_buttonPressAwarenessClient, "invalidateWithError:", a3);
  buttonPressAwarenessClient = self->_buttonPressAwarenessClient;
  self->_buttonPressAwarenessClient = 0;

  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asynchronousCallQueue, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessHandlerQueue, 0);
  objc_storeStrong((id *)&self->_attentionDetectionStatuses, 0);
  objc_storeStrong((id *)&self->_buttonPressAwarenessClient, 0);
  objc_storeStrong((id *)&self->_touchAttentionAwarenessClient, 0);
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
      v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.SASUIDeviceScreenEngagementControllerQueue", 0);
      asynchronousCallQueue = self->_asynchronousCallQueue;
      self->_asynchronousCallQueue = v11;

    }
    objc_initWeak(&location, self);
    v13 = self->_asynchronousCallQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __111__SASUIDeviceScreenEngagementController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke;
    block[3] = &unk_24D47A428;
    objc_copyWeak(v17, &location);
    v17[1] = (id)a3;
    v15 = v8;
    v16 = v10;
    dispatch_async(v13, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }

}

void __111__SASUIDeviceScreenEngagementController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke(uint64_t a1)
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
  block[2] = __111__SASUIDeviceScreenEngagementController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke_2;
  block[3] = &unk_24D47A400;
  v5 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __111__SASUIDeviceScreenEngagementController_AsynchronousMethods__startIfNeededForTypes_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
