@implementation SSRVTUITrainingServiceClient

- (SSRVTUITrainingServiceClient)initWithDelegate:(id)a3
{
  id v4;
  SSRVTUITrainingServiceClient *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSRVTUITrainingServiceClient;
  v5 = -[SSRVTUITrainingServiceClient init](&v10, sel_init);
  if (v5)
  {
    SSRLogInitIfNeeded();
    v6 = dispatch_queue_create("com.apple.VoiceTriggerUI.TrainingService", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
    v5->_requireResetup = 0;
    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[SSRVTUITrainingServiceClient initWithDelegate:]";
      _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
  }

  return v5;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SSRVTUITrainingServiceClient_invalidate__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setupWithLocaleID:(id)a3 appDomain:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SSRVTUITrainingServiceClient *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SSRVTUITrainingServiceClient_setupWithLocaleID_appDomain___block_invoke;
  block[3] = &unk_24CC861E0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SSRVTUITrainingServiceClient_reset__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startRMS
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SSRVTUITrainingServiceClient_startRMS__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopRMS
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SSRVTUITrainingServiceClient_stopRMS__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setLocaleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__SSRVTUITrainingServiceClient_setLocaleIdentifier___block_invoke;
  v7[3] = &unk_24CC85EE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)didDetectForceEndPoint
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SSRVTUITrainingServiceClient_didDetectForceEndPoint__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)prepareWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SSRVTUITrainingServiceClient_prepareWithCompletion___block_invoke;
  v7[3] = &unk_24CC86148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)cleanupViaXPCWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__SSRVTUITrainingServiceClient_cleanupViaXPCWithCompletion___block_invoke;
  v7[3] = &unk_24CC86148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  BOOL v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_completion___block_invoke;
  v11[3] = &unk_24CC84D08;
  v11[4] = self;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)trainUtteranceViaXPC:(int64_t)a3 shouldUseASR:(BOOL)a4 mhUUID:(id)a5 completionWithResult:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  BOOL v19;

  v10 = a5;
  v11 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_mhUUID_completionWithResult___block_invoke;
  block[3] = &unk_24CC84D30;
  v17 = v11;
  v18 = a3;
  v19 = a4;
  block[4] = self;
  v16 = v10;
  v13 = v10;
  v14 = v11;
  dispatch_async(queue, block);

}

- (void)playSoundsEffect:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__SSRVTUITrainingServiceClient_playSoundsEffect___block_invoke;
  v4[3] = &unk_24CC84D80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)cancelTrainingViaXPCForID:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__SSRVTUITrainingServiceClient_cancelTrainingViaXPCForID___block_invoke;
  v4[3] = &unk_24CC84D80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)voiceProfileWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  NSObject *queue;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(id, _QWORD))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1038;
  v16 = __Block_byref_object_dispose__1039;
  v17 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SSRVTUITrainingServiceClient_voiceProfileWithCompletion___block_invoke;
  block[3] = &unk_24CC86380;
  block[4] = self;
  v11 = &v12;
  v7 = v5;
  v10 = v7;
  dispatch_async(queue, block);
  v8 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v7, v8);
  if (v4)
    v4[2](v4, v13[5]);

  _Block_object_dispose(&v12, 8);
}

- (void)audioSourceWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  NSObject *queue;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = (void (**)(id, _QWORD))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 6;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SSRVTUITrainingServiceClient_audioSourceWithCompletion___block_invoke;
  block[3] = &unk_24CC86380;
  block[4] = self;
  v11 = &v12;
  v7 = v5;
  v10 = v7;
  dispatch_async_and_wait(queue, block);
  v8 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v7, v8);
  if (v4)
    v4[2](v4, v13[3]);

  _Block_object_dispose(&v12, 8);
}

- (void)_resetupIfNeeded
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_requireResetup)
  {
    self->_requireResetup = 0;
    v3 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[SSRVTUITrainingServiceClient _resetupIfNeeded]";
      _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Re-setup training service due to xpc rebuilt", (uint8_t *)&v5, 0xCu);
    }
    -[SSRVTUITrainingServiceClient _service](self, "_service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setupWithLocaleID:appDomain:", self->_localeIdentifier, self->_appDomain);

  }
}

- (void)CSVTUIRemoteTrainingSessionRMSAvailable:(float)a3
{
  SSRVTUITrainingServiceDelegate **p_delegate;
  id WeakRetained;
  char v7;
  double v8;
  id v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    *(float *)&v8 = a3;
    objc_msgSend(v9, "CSVTUIRemoteTrainingSessionRMSAvailable:", v8);

  }
}

- (id)_newConnection
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.siri.ssrvtuitrainingservice.xpc"), 0);
  SSRVTUITrainingServiceGetXPCInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  v5 = (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AC8020);
  objc_msgSend(v3, "setExportedInterface:", v5);

  objc_msgSend(v3, "setExportedObject:", self);
  objc_msgSend(v3, "_setQueue:", self->_queue);
  return v3;
}

- (id)_connection
{
  NSXPCConnection *xpcConnection;
  NSObject *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[SSRVTUITrainingServiceClient _connection]";
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Creating new xpc connection...", buf, 0xCu);
    }
    v5 = -[SSRVTUITrainingServiceClient _newConnection](self, "_newConnection");
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    objc_initWeak((id *)buf, self);
    v7 = self->_xpcConnection;
    v8 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __43__SSRVTUITrainingServiceClient__connection__block_invoke;
    v16[3] = &unk_24CC85AB8;
    objc_copyWeak(&v17, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v16);
    v9 = self->_xpcConnection;
    v11 = v8;
    v12 = 3221225472;
    v13 = __43__SSRVTUITrainingServiceClient__connection__block_invoke_10;
    v14 = &unk_24CC85AB8;
    objc_copyWeak(&v15, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", &v11);
    -[NSXPCConnection resume](self->_xpcConnection, "resume", v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

- (id)_service
{
  void *v2;
  void *v3;

  -[SSRVTUITrainingServiceClient _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_handleXPCDisconnectedUnexpectedlyWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void (**prepareCompletion)(id, _QWORD);
  id v7;
  void (**cleanupCompletion)(void);
  id v9;
  id trainCompletion;
  id v11;
  id v12;
  CSVTUITrainingResult *v13;
  void (**trainCompletionWithResult)(void);
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SSRVTUITrainingServiceClient _handleXPCDisconnectedUnexpectedlyWithError:]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  prepareCompletion = (void (**)(id, _QWORD))self->_prepareCompletion;
  if (prepareCompletion)
  {
    prepareCompletion[2](prepareCompletion, 0);
    v7 = self->_prepareCompletion;
    self->_prepareCompletion = 0;

  }
  cleanupCompletion = (void (**)(void))self->_cleanupCompletion;
  if (cleanupCompletion)
  {
    cleanupCompletion[2]();
    v9 = self->_cleanupCompletion;
    self->_cleanupCompletion = 0;

  }
  trainCompletion = self->_trainCompletion;
  if (trainCompletion)
  {
    v18 = v4;
    (*((void (**)(id, _QWORD, uint64_t, _QWORD, id *))trainCompletion + 2))(trainCompletion, 0, 5, 0, &v18);
    v11 = v18;

    v12 = self->_trainCompletion;
    self->_trainCompletion = 0;

    v4 = v11;
  }
  if (self->_trainCompletionWithResult)
  {
    v13 = -[CSVTUITrainingResult initWithSessionId:sessionStatus:audioStatus:]([CSVTUITrainingResult alloc], "initWithSessionId:sessionStatus:audioStatus:", 0, 5, 2);
    trainCompletionWithResult = (void (**)(void))self->_trainCompletionWithResult;
    v17 = v4;
    trainCompletionWithResult[2]();
    v15 = v17;

    v16 = self->_trainCompletionWithResult;
    self->_trainCompletionWithResult = 0;

    v4 = v15;
  }
  self->_requireResetup = 1;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong(&self->_remoteObjectProxy, a3);
}

- (SSRVTUITrainingServiceDelegate)delegate
{
  return (SSRVTUITrainingServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)prepareCompletion
{
  return self->_prepareCompletion;
}

- (void)setPrepareCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)cleanupCompletion
{
  return self->_cleanupCompletion;
}

- (void)setCleanupCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)trainCompletion
{
  return self->_trainCompletion;
}

- (void)setTrainCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)trainCompletionWithResult
{
  return self->_trainCompletionWithResult;
}

- (void)setTrainCompletionWithResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)requireResetup
{
  return self->_requireResetup;
}

- (void)setRequireResetup:(BOOL)a3
{
  self->_requireResetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trainCompletionWithResult, 0);
  objc_storeStrong(&self->_trainCompletion, 0);
  objc_storeStrong(&self->_cleanupCompletion, 0);
  objc_storeStrong(&self->_prepareCompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appDomain, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

void __43__SSRVTUITrainingServiceClient__connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SSRVTUITrainingServiceClient _connection]_block_invoke";
    v9 = 2112;
    v10 = CFSTR("com.apple.siri.ssrvtuitrainingservice.xpc");
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Interrupted", (uint8_t *)&v7, 0x16u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "setInvalidationHandler:", 0);
    objc_msgSend(v4[5], "invalidate");
    v5 = v4[5];
    v4[5] = 0;

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 1151, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_handleXPCDisconnectedUnexpectedlyWithError:", v6);

  }
}

void __43__SSRVTUITrainingServiceClient__connection__block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SSRVTUITrainingServiceClient _connection]_block_invoke";
    v9 = 2112;
    v10 = CFSTR("com.apple.siri.ssrvtuitrainingservice.xpc");
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Invalidated", (uint8_t *)&v7, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 5);
    *((_QWORD *)WeakRetained + 5) = 0;

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 1151, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_handleXPCDisconnectedUnexpectedlyWithError:", v6);

  }
}

void __58__SSRVTUITrainingServiceClient_audioSourceWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__SSRVTUITrainingServiceClient_audioSourceWithCompletion___block_invoke_2;
  v5[3] = &unk_24CC84B20;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "audioSourceWithCompletion:", v5);

}

void __58__SSRVTUITrainingServiceClient_audioSourceWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__SSRVTUITrainingServiceClient_voiceProfileWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__SSRVTUITrainingServiceClient_voiceProfileWithCompletion___block_invoke_2;
  v5[3] = &unk_24CC84AF8;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "voiceProfileWithCompletion:", v5);

}

void __59__SSRVTUITrainingServiceClient_voiceProfileWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __58__SSRVTUITrainingServiceClient_cancelTrainingViaXPCForID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelTrainingViaXPCForID:", *(_QWORD *)(a1 + 40));

}

void __49__SSRVTUITrainingServiceClient_playSoundsEffect___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playSoundsEffect:", *(_QWORD *)(a1 + 40));

}

void __94__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_mhUUID_completionWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  v2 = MEMORY[0x212BE197C](*(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(unsigned __int8 *)(a1 + 64);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __94__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_mhUUID_completionWithResult___block_invoke_2;
  v9[3] = &unk_24CC84AD0;
  v8 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "trainUtteranceViaXPC:shouldUseASR:mhUUID:completionWithResult:", v6, v7, v8, v9);

}

void __94__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_mhUUID_completionWithResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = 0;

  }
}

void __77__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  v2 = MEMORY[0x212BE197C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_completion___block_invoke_2;
  v8[3] = &unk_24CC84AA8;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "trainUtteranceViaXPC:shouldUseASR:completion:", v6, v7, v8);

}

void __77__SSRVTUITrainingServiceClient_trainUtteranceViaXPC_shouldUseASR_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 80);
    *(_QWORD *)(v3 + 80) = 0;

  }
}

void __60__SSRVTUITrainingServiceClient_cleanupViaXPCWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = MEMORY[0x212BE197C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__SSRVTUITrainingServiceClient_cleanupViaXPCWithCompletion___block_invoke_2;
  v6[3] = &unk_24CC864B8;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "cleanupViaXPCWithCompletion:", v6);

}

void __60__SSRVTUITrainingServiceClient_cleanupViaXPCWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = 0;

  }
}

void __54__SSRVTUITrainingServiceClient_prepareWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = MEMORY[0x212BE197C](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__SSRVTUITrainingServiceClient_prepareWithCompletion___block_invoke_2;
  v6[3] = &unk_24CC84A80;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "prepareWithCompletion:", v6);

}

void __54__SSRVTUITrainingServiceClient_prepareWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = 0;

  }
}

void __54__SSRVTUITrainingServiceClient_didDetectForceEndPoint__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDetectForceEndPoint");

}

void __52__SSRVTUITrainingServiceClient_setLocaleIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocaleIdentifier:", *(_QWORD *)(a1 + 40));

}

void __39__SSRVTUITrainingServiceClient_stopRMS__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRMS");

}

void __40__SSRVTUITrainingServiceClient_startRMS__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRMS");

}

void __37__SSRVTUITrainingServiceClient_reset__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resetupIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

void __60__SSRVTUITrainingServiceClient_setupWithLocaleID_appDomain___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 136315650;
    v7 = "-[SSRVTUITrainingServiceClient setupWithLocaleID:appDomain:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s localeIdentifier : %{public}@, appDomain : %{public}@", (uint8_t *)&v6, 0x20u);
  }
  objc_storeStrong((id *)a1[6] + 1, a1[4]);
  objc_storeStrong((id *)a1[6] + 2, a1[5]);
  objc_msgSend(a1[6], "_service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setupWithLocaleID:appDomain:", a1[4], a1[5]);

}

void __42__SSRVTUITrainingServiceClient_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SSRVTUITrainingServiceClient invalidate]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = 0;

}

@end
