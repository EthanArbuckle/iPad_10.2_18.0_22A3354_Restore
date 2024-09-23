@implementation SVXMyriadHostDevice

- (SVXMyriadHostDevice)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  SVXMyriadHostDevice *v8;
  uint64_t v9;
  SCDACoordinator *scdaCoordinator;
  uint64_t v11;
  SVXMyriadWiFiAssertion *v12;
  SVXMyriadWiFiAssertion *wifiAssertion;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SVXMyriadHostDevice;
  v8 = -[SVXMyriadHostDevice init](&v15, sel_init);
  if (v8)
  {
    if (objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled"))
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE92080]), "initWithDelegate:", v8);
      scdaCoordinator = v8->_scdaCoordinator;
      v8->_scdaCoordinator = (SCDACoordinator *)v9;
    }
    else
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE09238]), "initWithDelegate:", v8);
      scdaCoordinator = v8->_myriadCoordinator;
      v8->_myriadCoordinator = (AFMyriadCoordinator *)v11;
    }

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_queue, a4);
    -[SVXMyriadHostDevice _initializeMyriadEmergencyTimer](v8, "_initializeMyriadEmergencyTimer");
    v12 = -[SVXMyriadWiFiAssertion initWithQueue:delegate:]([SVXMyriadWiFiAssertion alloc], "initWithQueue:delegate:", v8->_queue, 0);
    wifiAssertion = v8->_wifiAssertion;
    v8->_wifiAssertion = v12;

  }
  return v8;
}

- (void)preheatMyriad
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SVXMyriadHostDevice_preheatMyriad__block_invoke;
  block[3] = &unk_24D24EFF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resetMyriad
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SVXMyriadHostDevice_resetMyriad__block_invoke;
  block[3] = &unk_24D24EFF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setupEnabled:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__SVXMyriadHostDevice_setupEnabled___block_invoke;
  v4[3] = &unk_24D24DDE0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)startAdvertising:(unint64_t)a3 withMyriadGoodnessScoreContext:(id)a4 withMyriadAudioContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  SVXMyriadHostDevice *v20;
  id v21;
  unint64_t v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __105__SVXMyriadHostDevice_startAdvertising_withMyriadGoodnessScoreContext_withMyriadAudioContext_completion___block_invoke;
  block[3] = &unk_24D24DB00;
  v21 = v12;
  v22 = a3;
  v18 = v11;
  v19 = v10;
  v20 = self;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(queue, block);

}

- (void)startAdvertising:(unint64_t)a3 withSCDAGoodnessScoreContext:(id)a4 withSCDAAudioContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  SVXMyriadHostDevice *v20;
  id v21;
  unint64_t v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__SVXMyriadHostDevice_startAdvertising_withSCDAGoodnessScoreContext_withSCDAAudioContext_completion___block_invoke;
  block[3] = &unk_24D24DB00;
  v21 = v12;
  v22 = a3;
  v18 = v11;
  v19 = v10;
  v20 = self;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(queue, block);

}

- (void)_initializeMyriadEmergencyTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timer;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  timer = self->_emergencyContext.timer;
  self->_emergencyContext.timer = v3;

  dispatch_source_set_event_handler((dispatch_source_t)self->_emergencyContext.timer, &__block_literal_global_10024);
  dispatch_resume((dispatch_object_t)self->_emergencyContext.timer);
}

- (void)_armEmergencyDispatchTimerFor:(double)a3 toExecute:(id)a4
{
  NSObject *timer;
  int64_t v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  timer = self->_emergencyContext.timer;
  v6 = (uint64_t)(a3 * 1000000000.0);
  v7 = a4;
  v8 = dispatch_time(0, v6);
  dispatch_source_set_timer(timer, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  dispatch_source_set_event_handler((dispatch_source_t)self->_emergencyContext.timer, v7);

  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[SVXMyriadHostDevice _armEmergencyDispatchTimerFor:toExecute:]";
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s #myriad Myriad emergency timer armed", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_disarmMyriadEmergencyTimer
{
  NSObject *timer;
  dispatch_time_t v4;

  timer = self->_emergencyContext.timer;
  v4 = dispatch_time(0, 0);
  dispatch_source_set_timer(timer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  dispatch_source_set_event_handler((dispatch_source_t)self->_emergencyContext.timer, &__block_literal_global_4);
}

- (void)_startAdvertisingEmergency:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id completion;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SVXMyriadHostDevice _startAdvertisingEmergency:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s #myriad Begin Emergency Call", buf, 0xCu);
  }
  v6 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
  v7 = 8;
  if (v6)
    v7 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "startAdvertisingEmergency");
  v8 = (void *)objc_msgSend(v4, "copy");
  completion = self->_emergencyContext.completion;
  self->_emergencyContext.completion = v8;

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__SVXMyriadHostDevice__startAdvertisingEmergency___block_invoke;
  v10[3] = &unk_24D24EFF0;
  v10[4] = self;
  -[SVXMyriadHostDevice _armEmergencyDispatchTimerFor:toExecute:](self, "_armEmergencyDispatchTimerFor:toExecute:", v10, 2.75);

}

- (void)_signalEmergencyCallHandledStatus:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__SVXMyriadHostDevice__signalEmergencyCallHandledStatus___block_invoke;
  v4[3] = &unk_24D24DDE0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)myriadCoordinatorDidHandleEmergency:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SVXMyriadHostDevice myriadCoordinatorDidHandleEmergency:]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v5, 0xCu);
  }
  -[SVXMyriadHostDevice _signalEmergencyCallHandledStatus:](self, "_signalEmergencyCallHandledStatus:", 1);
}

- (void)_acquireWiFiAssertion
{
  -[SVXMyriadWiFiAssertion acquireHomeKitAccessoryWiFiAssertionWithTimeout:](self->_wifiAssertion, "acquireHomeKitAccessoryWiFiAssertionWithTimeout:", 1.45000005);
}

- (void)_releaseWiFiAssertion
{
  -[SVXMyriadWiFiAssertion releaseHomeKitAccessoryWiFiAssertion](self->_wifiAssertion, "releaseHomeKitAccessoryWiFiAssertion");
}

- (void)shouldContinue:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SVXMyriadHostDevice_shouldContinue___block_invoke;
  block[3] = &unk_24D24EFF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)shouldAbortAnotherDeviceBetter:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SVXMyriadHostDevice_shouldAbortAnotherDeviceBetter___block_invoke;
  block[3] = &unk_24D24EFF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)shouldUnduck:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__SVXMyriadHostDevice_shouldUnduck___block_invoke;
  block[3] = &unk_24D24EFF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)scdaShouldContinue:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SVXMyriadHostDevice_scdaShouldContinue___block_invoke;
  block[3] = &unk_24D24EFF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SVXMyriadHostDevice_scdaShouldAbortAnotherDeviceBetter___block_invoke;
  block[3] = &unk_24D24EFF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)scdaShouldUnduck:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SVXMyriadHostDevice_scdaShouldUnduck___block_invoke;
  block[3] = &unk_24D24EFF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)scdaCoordinatorDidHandleEmergency:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SVXMyriadHostDevice scdaCoordinatorDidHandleEmergency:]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v5, 0xCu);
  }
  -[SVXMyriadHostDevice _signalEmergencyCallHandledStatus:](self, "_signalEmergencyCallHandledStatus:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiAssertion, 0);

  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scdaCoordinator, 0);
  objc_storeStrong((id *)&self->_myriadCoordinator, 0);
}

void __40__SVXMyriadHostDevice_scdaShouldUnduck___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "unduckDevice");

}

void __58__SVXMyriadHostDevice_scdaShouldAbortAnotherDeviceBetter___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_releaseWiFiAssertion");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "deviceLostMyriadElection");

}

void __42__SVXMyriadHostDevice_scdaShouldContinue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_releaseWiFiAssertion");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "deviceWonMyriadElection");

}

void __36__SVXMyriadHostDevice_shouldUnduck___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "unduckDevice");

}

void __54__SVXMyriadHostDevice_shouldAbortAnotherDeviceBetter___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_releaseWiFiAssertion");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "deviceLostMyriadElection");

}

void __38__SVXMyriadHostDevice_shouldContinue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_releaseWiFiAssertion");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "deviceWonMyriadElection");

}

void __57__SVXMyriadHostDevice__signalEmergencyCallHandledStatus___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_disarmMyriadEmergencyTimer");
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199D950C](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = *(unsigned __int8 *)(a1 + 40);
    v8 = 136315394;
    v9 = "-[SVXMyriadHostDevice _signalEmergencyCallHandledStatus:]_block_invoke";
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s #myriad Emergency call handled status: %d", (uint8_t *)&v8, 0x12u);
  }
  if (v2)
  {
    if (*(_BYTE *)(a1 + 40))
      +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
    else
      +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", -1, CFSTR("Myriad failed to handle emergency"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v2)[2](v2, v7);

  }
}

uint64_t __50__SVXMyriadHostDevice__startAdvertisingEmergency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_signalEmergencyCallHandledStatus:", 0);
}

void __50__SVXMyriadHostDevice__disarmMyriadEmergencyTimer__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[SVXMyriadHostDevice _disarmMyriadEmergencyTimer]_block_invoke";
    _os_log_impl(&dword_214934000, v0, OS_LOG_TYPE_INFO, "%s #myriad Myriad emergency timer disarmed", (uint8_t *)&v1, 0xCu);
  }
}

void __101__SVXMyriadHostDevice_startAdvertising_withSCDAGoodnessScoreContext_withSCDAAudioContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 136315906;
    v8 = "-[SVXMyriadHostDevice startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:]_block_invoke";
    v9 = 2048;
    v10 = v2;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s #myriad queueAdvertisementType:%lu, context=%@, goodnessScoreContext=%@", (uint8_t *)&v7, 0x2Au);
  }
  switch(v2)
  {
    case 0:
    case 3:
      objc_msgSend(*(id *)(a1 + 48), "_acquireWiFiAssertion");
      switch(v2)
      {
        case 0:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
          goto LABEL_10;
        case 1:
          goto LABEL_6;
        case 2:
          goto LABEL_7;
        case 3:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "startAdvertisingFromInTaskVoiceTriggerWithContext:", 0);
          goto LABEL_10;
        default:
          return;
      }
    case 1:
LABEL_6:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "startAdvertisingFromDirectTriggerWithContext:", *(_QWORD *)(a1 + 32));
      goto LABEL_10;
    case 2:
LABEL_7:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "startAdvertisingFromAlertFiringVoiceTriggerWithContext:", *(_QWORD *)(a1 + 32));
LABEL_10:
      v6 = *(_QWORD *)(a1 + 56);
      if (v6)
        (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 48), "_startAdvertisingEmergency:", *(_QWORD *)(a1 + 56));
      break;
    default:
      return;
  }
}

void __105__SVXMyriadHostDevice_startAdvertising_withMyriadGoodnessScoreContext_withMyriadAudioContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 136315906;
    v8 = "-[SVXMyriadHostDevice startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:]_block_invoke";
    v9 = 2048;
    v10 = v2;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s #myriad queueAdvertisementType:%lu, context=%@, goodnessScoreContext=%@", (uint8_t *)&v7, 0x2Au);
  }
  switch(v2)
  {
    case 0:
    case 3:
      objc_msgSend(*(id *)(a1 + 48), "_acquireWiFiAssertion");
      switch(v2)
      {
        case 0:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "startAdvertisingFromVoiceTriggerWithGoodnessScoreContext:withContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
          goto LABEL_10;
        case 1:
          goto LABEL_6;
        case 2:
          goto LABEL_7;
        case 3:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "startAdvertisingFromInTaskVoiceTriggerWithContext:", 0);
          goto LABEL_10;
        default:
          return;
      }
    case 1:
LABEL_6:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "startAdvertisingFromDirectTriggerWithContext:", *(_QWORD *)(a1 + 32));
      goto LABEL_10;
    case 2:
LABEL_7:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "startAdvertisingFromAlertFiringVoiceTriggerWithContext:", *(_QWORD *)(a1 + 32));
LABEL_10:
      v6 = *(_QWORD *)(a1 + 56);
      if (v6)
        (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 48), "_startAdvertisingEmergency:", *(_QWORD *)(a1 + 56));
      break;
    default:
      return;
  }
}

uint64_t __36__SVXMyriadHostDevice_setupEnabled___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;

  v2 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
  v3 = 8;
  if (v2)
    v3 = 16;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v3), "setupEnabled:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __34__SVXMyriadHostDevice_resetMyriad__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;

  v2 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
  v3 = 8;
  if (v2)
    v3 = 16;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v3), "endTask");
}

uint64_t __36__SVXMyriadHostDevice_preheatMyriad__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;

  v2 = objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled");
  v3 = 8;
  if (v2)
    v3 = 16;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v3), "preheatWiProx");
}

@end
