@implementation VOSOutputEventDispatcher

+ (VOSOutputEventDispatcher)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_12);
  return (VOSOutputEventDispatcher *)(id)sharedInstance__Shared_0;
}

void __42__VOSOutputEventDispatcher_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEventDispatcher _init]([VOSOutputEventDispatcher alloc], "_init");
  v1 = (void *)sharedInstance__Shared_0;
  sharedInstance__Shared_0 = (uint64_t)v0;

}

- (id)_init
{
  VOSOutputEventDispatcher *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSHashTable *eventHandlers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VOSOutputEventDispatcher;
  v2 = -[VOSOutputEventDispatcher init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("VOSOutputEventDispatcher", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    eventHandlers = v2->_eventHandlers;
    v2->_eventHandlers = (NSHashTable *)v6;

  }
  return v2;
}

- (id)_activeSoundPack
{
  VOSSoundPack *cachedActiveSoundPack;
  VOSDefaultSoundPack *v4;
  VOSSoundPack *v5;

  cachedActiveSoundPack = self->_cachedActiveSoundPack;
  if (!cachedActiveSoundPack)
  {
    v4 = objc_alloc_init(VOSDefaultSoundPack);
    v5 = self->_cachedActiveSoundPack;
    self->_cachedActiveSoundPack = (VOSSoundPack *)v4;

    cachedActiveSoundPack = self->_cachedActiveSoundPack;
  }
  return cachedActiveSoundPack;
}

- (id)_activeHapticPack
{
  VOSHapticPack *cachedActiveHapticPack;
  VOSDefaultHapticPack *v4;
  VOSHapticPack *v5;

  cachedActiveHapticPack = self->_cachedActiveHapticPack;
  if (!cachedActiveHapticPack)
  {
    v4 = objc_alloc_init(VOSDefaultHapticPack);
    v5 = self->_cachedActiveHapticPack;
    self->_cachedActiveHapticPack = (VOSHapticPack *)v4;

    cachedActiveHapticPack = self->_cachedActiveHapticPack;
  }
  return cachedActiveHapticPack;
}

- (void)addEventHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__VOSOutputEventDispatcher_addEventHandler___block_invoke;
  block[3] = &unk_24CBAC228;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __44__VOSOutputEventDispatcher_addEventHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeEventHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__VOSOutputEventDispatcher_removeEventHandler___block_invoke;
  block[3] = &unk_24CBAC228;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __47__VOSOutputEventDispatcher_removeEventHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)shouldPlaySoundForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "voiceOverSoundEffectsEnabled"))
  {
    objc_msgSend(v3, "rawValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceOverSoundEnabledForEvent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = objc_msgSend(v6, "BOOLValue");
    else
      v7 = 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldPlayHapticForEvent:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (_AXSVibrationDisabled())
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "voiceOverHapticsEnabled"))
    {
      objc_msgSend(v3, "rawValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "voiceOverHapticEnabledForEvent:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "BOOLValue");

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)sendEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  VOSOutputEventDispatcher *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__VOSOutputEventDispatcher_sendEvent___block_invoke;
  block[3] = &unk_24CBAC228;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __38__VOSOutputEventDispatcher_sendEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  VOTLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __38__VOSOutputEventDispatcher_sendEvent___block_invoke_cold_1(a1, v2);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v9, "_activeSoundPack", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_activeHapticPack");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dispatcher:handleEvent:soundPack:hapticPack:", v9, v10, v11, v12);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedActiveHapticPack, 0);
  objc_storeStrong((id *)&self->_cachedActiveSoundPack, 0);
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __38__VOSOutputEventDispatcher_sendEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_211371000, a2, OS_LOG_TYPE_DEBUG, "Sending output event: %@", (uint8_t *)&v3, 0xCu);
}

@end
