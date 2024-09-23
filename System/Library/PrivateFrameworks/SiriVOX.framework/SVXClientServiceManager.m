@implementation SVXClientServiceManager

- (SVXClientServiceManager)init
{
  SVXClientServiceManager *v2;
  uint64_t v3;
  SVXPerforming *performer;
  uint64_t v5;
  AFAnalytics *analytics;
  SVXClientActivationService *v7;
  SVXClientActivationServicing *activationService;
  SVXClientAudioSystemService *v9;
  SVXClientAudioSystemServicing *audioSystemService;
  SVXClientDeviceService *v11;
  SVXClientDeviceServicing *deviceService;
  SVXClientAudioPowerService *v13;
  SVXClientAudioPowerServicing *inputAudioPowerService;
  SVXClientAudioPowerService *v15;
  SVXClientAudioPowerServicing *outputAudioPowerService;
  SVXClientSessionService *v17;
  SVXClientSessionServicing *sessionService;
  SVXClientSpeechSynthesisService *v19;
  SVXClientSpeechSynthesisServicing *speechSynthesisService;
  SVXClientSessionStateService *v21;
  SVXClientSessionStateServicing *sessionStateService;
  SVXClientKeepAliveService *v23;
  SVXClientKeepAliveServicing *keepAliveService;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SVXClientServiceManager;
  v2 = -[SVXClientServiceManager init](&v26, sel_init);
  if (v2)
  {
    +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
    v3 = objc_claimAutoreleasedReturnValue();
    performer = v2->_performer;
    v2->_performer = (SVXPerforming *)v3;

    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v5 = objc_claimAutoreleasedReturnValue();
    analytics = v2->_analytics;
    v2->_analytics = (AFAnalytics *)v5;

    v7 = -[SVXClientActivationService initWithClientServiceProvider:analytics:performer:]([SVXClientActivationService alloc], "initWithClientServiceProvider:analytics:performer:", v2, v2->_analytics, v2->_performer);
    activationService = v2->_activationService;
    v2->_activationService = (SVXClientActivationServicing *)v7;

    v9 = -[SVXClientAudioSystemService initWithClientServiceProvider:analytics:performer:]([SVXClientAudioSystemService alloc], "initWithClientServiceProvider:analytics:performer:", v2, v2->_analytics, v2->_performer);
    audioSystemService = v2->_audioSystemService;
    v2->_audioSystemService = (SVXClientAudioSystemServicing *)v9;

    v11 = -[SVXClientDeviceService initWithClientServiceProvider:analytics:performer:]([SVXClientDeviceService alloc], "initWithClientServiceProvider:analytics:performer:", v2, v2->_analytics, v2->_performer);
    deviceService = v2->_deviceService;
    v2->_deviceService = (SVXClientDeviceServicing *)v11;

    v13 = -[SVXClientAudioPowerService initWithType:clientServiceProvider:analytics:performer:]([SVXClientAudioPowerService alloc], "initWithType:clientServiceProvider:analytics:performer:", 1, v2, v2->_analytics, v2->_performer);
    inputAudioPowerService = v2->_inputAudioPowerService;
    v2->_inputAudioPowerService = (SVXClientAudioPowerServicing *)v13;

    v15 = -[SVXClientAudioPowerService initWithType:clientServiceProvider:analytics:performer:]([SVXClientAudioPowerService alloc], "initWithType:clientServiceProvider:analytics:performer:", 2, v2, v2->_analytics, v2->_performer);
    outputAudioPowerService = v2->_outputAudioPowerService;
    v2->_outputAudioPowerService = (SVXClientAudioPowerServicing *)v15;

    v17 = -[SVXClientSessionService initWithClientServiceProvider:analytics:performer:]([SVXClientSessionService alloc], "initWithClientServiceProvider:analytics:performer:", v2, v2->_analytics, v2->_performer);
    sessionService = v2->_sessionService;
    v2->_sessionService = (SVXClientSessionServicing *)v17;

    v19 = -[SVXClientSpeechSynthesisService initWithClientServiceProvider:analytics:performer:]([SVXClientSpeechSynthesisService alloc], "initWithClientServiceProvider:analytics:performer:", v2, v2->_analytics, v2->_performer);
    speechSynthesisService = v2->_speechSynthesisService;
    v2->_speechSynthesisService = (SVXClientSpeechSynthesisServicing *)v19;

    v21 = -[SVXClientSessionStateService initWithClientServiceProvider:analytics:performer:]([SVXClientSessionStateService alloc], "initWithClientServiceProvider:analytics:performer:", v2, v2->_analytics, v2->_performer);
    sessionStateService = v2->_sessionStateService;
    v2->_sessionStateService = (SVXClientSessionStateServicing *)v21;

    v23 = -[SVXClientKeepAliveService initWithClientServiceProvider:analytics:performer:]([SVXClientKeepAliveService alloc], "initWithClientServiceProvider:analytics:performer:", v2, v2->_analytics, v2->_performer);
    keepAliveService = v2->_keepAliveService;
    v2->_keepAliveService = (SVXClientKeepAliveServicing *)v23;

    -[SVXClientServiceManager _connect](v2, "_connect");
  }
  return v2;
}

- (void)getClientServiceUsingBlock:(id)a3 errorHandler:(id)a4
{
  id v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__SVXClientServiceManager_getClientServiceUsingBlock_errorHandler___block_invoke;
  v8[3] = &unk_24D24EF28;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)clientServiceConnectionDidInvalidate:(id)a3
{
  id v4;
  SVXPerforming *performer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__SVXClientServiceManager_clientServiceConnectionDidInvalidate___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (id)clientServiceConnection:(id)a3 performerForComponent:(int64_t)a4
{
  return 0;
}

- (void)_connect
{
  SVXPerforming *performer;
  _QWORD v3[5];

  performer = self->_performer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__SVXClientServiceManager__connect__block_invoke;
  v3[3] = &unk_24D24EFF0;
  v3[4] = self;
  -[SVXPerforming performBlock:withOptions:](performer, "performBlock:withOptions:", v3, 0);
}

- (id)_connection
{
  SVXClientServiceConnection *connection;
  SVXClientServiceConnection *v4;
  SVXClientActivationServicing *activationService;
  SVXClientAudioSystemServicing *audioSystemService;
  SVXClientDeviceServicing *deviceService;
  SVXClientAudioPowerServicing *inputAudioPowerService;
  SVXClientSessionServicing *sessionService;
  SVXClientSpeechSynthesisServicing *speechSynthesisService;
  SVXClientAudioPowerServicing *outputAudioPowerService;
  SVXClientKeepAliveServicing *keepAliveService;
  void *v13;
  SVXClientServiceConnection *v14;
  SVXClientServiceConnection *v15;
  SVXPerforming *performer;
  SVXClientServiceConnection *v18;

  connection = self->_connection;
  if (!connection)
  {
    v4 = [SVXClientServiceConnection alloc];
    performer = self->_performer;
    v18 = v4;
    activationService = self->_activationService;
    deviceService = self->_deviceService;
    audioSystemService = self->_audioSystemService;
    sessionService = self->_sessionService;
    inputAudioPowerService = self->_inputAudioPowerService;
    outputAudioPowerService = self->_outputAudioPowerService;
    speechSynthesisService = self->_speechSynthesisService;
    keepAliveService = self->_keepAliveService;
    objc_msgSend(MEMORY[0x24BE091F8], "currentContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SVXClientServiceConnection initWithQueuePerformer:activationService:audioSystemService:deviceService:inputAudioPowerService:outputAudioPowerService:sessionService:speechSynthesisService:keepAliveService:instanceContext:delegate:](v18, "initWithQueuePerformer:activationService:audioSystemService:deviceService:inputAudioPowerService:outputAudioPowerService:sessionService:speechSynthesisService:keepAliveService:instanceContext:delegate:", performer, activationService, audioSystemService, deviceService, inputAudioPowerService, outputAudioPowerService, sessionService, speechSynthesisService, keepAliveService, v13, self);
    v15 = self->_connection;
    self->_connection = v14;

    connection = self->_connection;
  }
  return connection;
}

- (SVXClientActivationServicing)activationService
{
  return self->_activationService;
}

- (SVXClientSessionStateServicing)sessionStateService
{
  return self->_sessionStateService;
}

- (SVXClientSessionServicing)sessionService
{
  return self->_sessionService;
}

- (SVXClientAudioPowerServicing)inputAudioPowerService
{
  return self->_inputAudioPowerService;
}

- (SVXClientAudioPowerServicing)outputAudioPowerService
{
  return self->_outputAudioPowerService;
}

- (SVXClientSpeechSynthesisServicing)speechSynthesisService
{
  return self->_speechSynthesisService;
}

- (SVXClientDeviceServicing)deviceService
{
  return self->_deviceService;
}

- (SVXClientAudioSystemServicing)audioSystemService
{
  return self->_audioSystemService;
}

- (SVXClientKeepAliveServicing)keepAliveService
{
  return self->_keepAliveService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepAliveService, 0);
  objc_storeStrong((id *)&self->_audioSystemService, 0);
  objc_storeStrong((id *)&self->_deviceService, 0);
  objc_storeStrong((id *)&self->_speechSynthesisService, 0);
  objc_storeStrong((id *)&self->_outputAudioPowerService, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerService, 0);
  objc_storeStrong((id *)&self->_sessionService, 0);
  objc_storeStrong((id *)&self->_sessionStateService, 0);
  objc_storeStrong((id *)&self->_activationService, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

id __35__SVXClientServiceManager__connect__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_connection");
}

uint64_t __64__SVXClientServiceManager_clientServiceConnectionDidInvalidate___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(void **)(v1 + 24);
  if (v2 == *(void **)(result + 40))
  {
    v3 = result;
    *(_QWORD *)(v1 + 24) = 0;

    return objc_msgSend(*(id *)(v3 + 32), "_connect");
  }
  return result;
}

void __67__SVXClientServiceManager_getClientServiceUsingBlock_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_connection");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2792);
  return (id)sharedManager_manager;
}

void __40__SVXClientServiceManager_sharedManager__block_invoke()
{
  SVXClientServiceManager *v0;
  void *v1;

  v0 = objc_alloc_init(SVXClientServiceManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

@end
