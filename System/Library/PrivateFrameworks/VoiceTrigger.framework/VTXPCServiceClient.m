@implementation VTXPCServiceClient

- (VTXPCServiceClient)init
{
  VTXPCServiceClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTXPCServiceClient;
  v2 = -[VTXPCServiceClient init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("VTServiceClient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  NSXPCConnection *vtxConnection;
  objc_super v4;

  vtxConnection = self->_vtxConnection;
  if (vtxConnection)
    -[NSXPCConnection invalidate](vtxConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)VTXPCServiceClient;
  -[VTXPCServiceClient dealloc](&v4, sel_dealloc);
}

- (id)_service
{
  NSXPCConnection *vtxConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;

  vtxConnection = self->_vtxConnection;
  if (!vtxConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.voicetrigger.voicetriggerservice"), 4096);
    v5 = self->_vtxConnection;
    self->_vtxConnection = v4;

    v6 = self->_vtxConnection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E0E98);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection setInterruptionHandler:](self->_vtxConnection, "setInterruptionHandler:", &__block_literal_global_1951);
    -[NSXPCConnection setInvalidationHandler:](self->_vtxConnection, "setInvalidationHandler:", &__block_literal_global_83);
    -[NSXPCConnection resume](self->_vtxConnection, "resume");
    vtxConnection = self->_vtxConnection;
  }
  return -[NSXPCConnection remoteObjectProxy](vtxConnection, "remoteObjectProxy");
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__VTXPCServiceClient_enableVoiceTrigger_withAssertion___block_invoke;
  block[3] = &unk_24C7F3D68;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__VTXPCServiceClient_setPhraseSpotterBypassing_timeout___block_invoke;
  block[3] = &unk_24C7F3D90;
  block[4] = self;
  v6 = a3;
  *(double *)&block[5] = a4;
  dispatch_async(queue, block);
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__VTXPCServiceClient_setRaiseToSpeakBypassing_timeout___block_invoke;
  block[3] = &unk_24C7F3D90;
  block[4] = self;
  v6 = a3;
  *(double *)&block[5] = a4;
  dispatch_async(queue, block);
}

- (void)notifyVoiceTriggeredSiriSessionCancelled:(id)a3
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
  v7[2] = __63__VTXPCServiceClient_notifyVoiceTriggeredSiriSessionCancelled___block_invoke;
  v7[3] = &unk_24C7F4DC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)notifySecondChanceRequest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__VTXPCServiceClient_notifySecondChanceRequest__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifyTriggerEventRequest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__VTXPCServiceClient_notifyTriggerEventRequest__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unsigned)getLastTriggerType
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  unsigned __int8 v8;
  uint8_t v10[8];
  _QWORD block[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__VTXPCServiceClient_getLastTriggerType__block_invoke;
  block[3] = &unk_24C7F4490;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Query for last trigger event type timed out", v10, 2u);
    }
  }
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)resetAssertions
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__VTXPCServiceClient_resetAssertions__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clearVoiceTriggerCount
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__VTXPCServiceClient_clearVoiceTriggerCount__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (int64_t)getVoiceTriggerCount
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  int64_t v8;
  uint8_t v10[8];
  _QWORD block[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__VTXPCServiceClient_getVoiceTriggerCount__block_invoke;
  block[3] = &unk_24C7F4490;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Query for voice trigger count timed out", v10, 2u);
    }
  }
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)getFirstChanceAudioBuffer
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  uint8_t v10[8];
  _QWORD block[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1931;
  v18 = __Block_byref_object_dispose__1932;
  v19 = 0;
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__VTXPCServiceClient_getFirstChanceAudioBuffer__block_invoke;
  block[3] = &unk_24C7F4490;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Query for voice trigger first chance audio buffer timed out", v10, 2u);
    }
  }
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)getFirstChanceVTEventInfo
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  uint8_t v10[8];
  _QWORD block[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1931;
  v18 = __Block_byref_object_dispose__1932;
  v19 = 0;
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__VTXPCServiceClient_getFirstChanceVTEventInfo__block_invoke;
  block[3] = &unk_24C7F4490;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Query for voice trigger first chance vt event info timed out", v10, 2u);
    }
  }
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)getFirstChanceTriggeredDate
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  uint8_t v10[8];
  _QWORD block[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1931;
  v18 = __Block_byref_object_dispose__1932;
  v19 = 0;
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__VTXPCServiceClient_getFirstChanceTriggeredDate__block_invoke;
  block[3] = &unk_24C7F4490;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Query for voice trigger first chance triggered date", v10, 2u);
    }
  }
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (int64_t)isLastTriggerFollowedBySpeech
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  int64_t v8;
  uint8_t v10[8];
  _QWORD block[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__VTXPCServiceClient_isLastTriggerFollowedBySpeech__block_invoke;
  block[3] = &unk_24C7F4490;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Query for followedBySpeech timed out", v10, 2u);
    }
  }
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)requestAudioCapture:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__VTXPCServiceClient_requestAudioCapture___block_invoke;
  v4[3] = &unk_24C7F4D70;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)requestCurrentVoiceTriggerAssetDictionary
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  uint8_t v10[8];
  _QWORD block[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1931;
  v18 = __Block_byref_object_dispose__1932;
  v19 = 0;
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionary__block_invoke;
  block[3] = &unk_24C7F4490;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Query for VoiceTrigger asset timed out", v10, 2u);
    }
  }
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)requestCurrentVoiceTriggerAssetDictionaryWithReply:(id)a3
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
  v7[2] = __73__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke;
  v7[3] = &unk_24C7F48B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)requestCurrentBuiltInRTModelDictionary
{
  dispatch_semaphore_t v3;
  NSObject *queue;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  uint8_t v10[8];
  _QWORD block[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1931;
  v18 = __Block_byref_object_dispose__1932;
  v19 = 0;
  v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__VTXPCServiceClient_requestCurrentBuiltInRTModelDictionary__block_invoke;
  block[3] = &unk_24C7F4490;
  block[4] = self;
  v13 = &v14;
  v5 = v3;
  v12 = v5;
  dispatch_async(queue, block);
  v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Query for VoiceTrigger asset timed out", v10, 2u);
    }
  }
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)setCurrentBuiltInRTModelDictionary:(id)a3
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
  v7[2] = __57__VTXPCServiceClient_setCurrentBuiltInRTModelDictionary___block_invoke;
  v7[3] = &unk_24C7F4DC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vtxConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __57__VTXPCServiceClient_setCurrentBuiltInRTModelDictionary___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCurrentBuiltInRTModelDictionary:", *(_QWORD *)(a1 + 40));

}

void __60__VTXPCServiceClient_requestCurrentBuiltInRTModelDictionary__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__VTXPCServiceClient_requestCurrentBuiltInRTModelDictionary__block_invoke_2;
  v5[3] = &unk_24C7F3E30;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "requestCurrentBuiltInRTModelDictionaryWithReply:", v5);

}

void __60__VTXPCServiceClient_requestCurrentBuiltInRTModelDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __73__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __73__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke_2;
  v3[3] = &unk_24C7F3E80;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "requestCurrentVoiceTriggerAssetDictionaryWithReply:", v3);

}

uint64_t __73__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionaryWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionary__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionary__block_invoke_2;
  v5[3] = &unk_24C7F3E30;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "requestCurrentVoiceTriggerAssetDictionaryWithReply:", v5);

}

void __63__VTXPCServiceClient_requestCurrentVoiceTriggerAssetDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __42__VTXPCServiceClient_requestAudioCapture___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestAudioCapture:", *(double *)(a1 + 40));

}

void __51__VTXPCServiceClient_isLastTriggerFollowedBySpeech__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__VTXPCServiceClient_isLastTriggerFollowedBySpeech__block_invoke_2;
  v5[3] = &unk_24C7F3DE0;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "isLastTriggerFollowedBySpeechWithReply:", v5);

}

intptr_t __51__VTXPCServiceClient_isLastTriggerFollowedBySpeech__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49__VTXPCServiceClient_getFirstChanceTriggeredDate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__VTXPCServiceClient_getFirstChanceTriggeredDate__block_invoke_2;
  v5[3] = &unk_24C7F3E58;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "getFirstChanceTriggeredDateWithReply:", v5);

}

void __49__VTXPCServiceClient_getFirstChanceTriggeredDate__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __47__VTXPCServiceClient_getFirstChanceVTEventInfo__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__VTXPCServiceClient_getFirstChanceVTEventInfo__block_invoke_2;
  v5[3] = &unk_24C7F3E30;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "getFirstChanceVTEventInfoWithReply:", v5);

}

void __47__VTXPCServiceClient_getFirstChanceVTEventInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __47__VTXPCServiceClient_getFirstChanceAudioBuffer__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__VTXPCServiceClient_getFirstChanceAudioBuffer__block_invoke_2;
  v5[3] = &unk_24C7F3E08;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "getFirstChanceAudioBufferWithReply:", v5);

}

void __47__VTXPCServiceClient_getFirstChanceAudioBuffer__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __42__VTXPCServiceClient_getVoiceTriggerCount__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__VTXPCServiceClient_getVoiceTriggerCount__block_invoke_2;
  v5[3] = &unk_24C7F3DE0;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "getVoiceTriggerCountWithReply:", v5);

}

intptr_t __42__VTXPCServiceClient_getVoiceTriggerCount__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__VTXPCServiceClient_clearVoiceTriggerCount__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearVoiceTriggerCount");

}

void __37__VTXPCServiceClient_resetAssertions__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetAssertions");

}

void __40__VTXPCServiceClient_getLastTriggerType__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__VTXPCServiceClient_getLastTriggerType__block_invoke_2;
  v5[3] = &unk_24C7F3DB8;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "queryLastTriggerEventTypeWithReply:", v5);

}

intptr_t __40__VTXPCServiceClient_getLastTriggerType__block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __47__VTXPCServiceClient_notifyTriggerEventRequest__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyTriggerEventRequest");

}

void __47__VTXPCServiceClient_notifySecondChanceRequest__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifySecondChanceRequest");

}

void __63__VTXPCServiceClient_notifyVoiceTriggeredSiriSessionCancelled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyVoiceTriggeredSiriSessionCancelled:", *(_QWORD *)(a1 + 40));

}

void __55__VTXPCServiceClient_setRaiseToSpeakBypassing_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(double *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  objc_msgSend(v6, "setRaiseToSpeakBypassing:timeout:timestamp:", v2, v3, v5);

}

void __56__VTXPCServiceClient_setPhraseSpotterBypassing_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(double *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  objc_msgSend(v6, "setPhraseSpotterBypassing:timeout:timestamp:", v2, v3, v5);

}

void __55__VTXPCServiceClient_enableVoiceTrigger_withAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  objc_msgSend(v5, "enableVoiceTrigger:withAssertion:timestamp:", v2, v3);

}

void __30__VTXPCServiceClient__service__block_invoke_82()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20D965000, v0, OS_LOG_TYPE_DEFAULT, "VTXConnection Invalidated", v1, 2u);
  }
}

void __30__VTXPCServiceClient__service__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20D965000, v0, OS_LOG_TYPE_DEFAULT, "VTXConnection Interrupted", v1, 2u);
  }
}

@end
