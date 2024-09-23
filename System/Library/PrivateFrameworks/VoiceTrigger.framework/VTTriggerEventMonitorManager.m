@implementation VTTriggerEventMonitorManager

- (VTTriggerEventMonitorManager)init
{
  VTTriggerEventMonitorManager *v2;
  uint64_t v3;
  NSMutableSet *connections;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VTTriggerEventMonitorManager;
  v2 = -[VTTriggerEventMonitorManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v3;

    v5 = dispatch_queue_create("VTTriggerEventMonitorManager queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)addConnection:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__VTTriggerEventMonitorManager_addConnection___block_invoke;
    v8[3] = &unk_24C7F4DC0;
    v8[4] = self;
    v9 = v4;
    dispatch_sync(queue, v8);

  }
  else
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, "Cannot add connection since it is nil", buf, 2u);
    }
  }

}

- (void)removeConnection:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__VTTriggerEventMonitorManager_removeConnection___block_invoke;
    v8[3] = &unk_24C7F4DC0;
    v8[4] = self;
    v9 = v4;
    dispatch_sync(queue, v8);

  }
  else
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, "Cannot add connection since it is nil", buf, 2u);
    }
  }

}

- (void)notifyVoiceTrigger
{
  NSObject *queue;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__111;
  v19 = __Block_byref_object_dispose__112;
  v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__VTTriggerEventMonitorManager_notifyVoiceTrigger__block_invoke;
  block[3] = &unk_24C7F4D00;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(queue, block);
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Broadcasting XPC notification for VoiceTrigger event", buf, 2u);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)v16[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "remoteObjectProxy", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "voiceTriggered");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v21, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)notifyEarlyDetect
{
  NSObject *queue;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__111;
  v19 = __Block_byref_object_dispose__112;
  v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__VTTriggerEventMonitorManager_notifyEarlyDetect__block_invoke;
  block[3] = &unk_24C7F4D00;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(queue, block);
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Broadcasting XPC notification for EarlyDetection event", buf, 2u);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)v16[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "remoteObjectProxy", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "earlyDetected");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v21, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v15, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

void __49__VTTriggerEventMonitorManager_notifyEarlyDetect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__VTTriggerEventMonitorManager_notifyVoiceTrigger__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__VTTriggerEventMonitorManager_removeConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
  v3 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v6 = v3;
    v7 = 134349568;
    v8 = v4;
    v9 = 2050;
    v10 = v2;
    v11 = 2050;
    v12 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "Remove Connection : %{public}p, numConnection was %{public}tu, become %{public}tu", (uint8_t *)&v7, 0x20u);

  }
}

void __46__VTTriggerEventMonitorManager_addConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
  v3 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v6 = v3;
    v7 = 134349568;
    v8 = v4;
    v9 = 2050;
    v10 = v2;
    v11 = 2050;
    v12 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "Add Connection : %{public}p, numConnection was %{public}tu, become %{public}tu", (uint8_t *)&v7, 0x20u);

  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_126);
  return (id)sharedManager_sharedManager;
}

void __45__VTTriggerEventMonitorManager_sharedManager__block_invoke()
{
  VTTriggerEventMonitorManager *v0;
  void *v1;

  v0 = objc_alloc_init(VTTriggerEventMonitorManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

@end
