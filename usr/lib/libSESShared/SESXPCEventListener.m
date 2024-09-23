@implementation SESXPCEventListener

+ (id)sharedObject
{
  if (sharedObject_onceToken_0 != -1)
    dispatch_once(&sharedObject_onceToken_0, &__block_literal_global_1);
  return (id)sharedObject_sharedObject_0;
}

void __35__SESXPCEventListener_sharedObject__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedObject_sharedObject_0;
  sharedObject_sharedObject_0 = v0;

}

- (SESXPCEventListener)init
{
  SESXPCEventListener *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableDictionary *registeredDelegates;
  uint64_t v9;
  NSMutableDictionary *pendingEvents;
  SESXPCEventListener *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SESXPCEventListener;
  v2 = -[SESXPCEventListener init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.seserviced.sesxpclistener", v4);
    queue = v2->queue;
    v2->queue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    registeredDelegates = v2->registeredDelegates;
    v2->registeredDelegates = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    pendingEvents = v2->pendingEvents;
    v2->pendingEvents = (NSMutableDictionary *)v9;

    v12 = v2;
    os_state_add_handler();

  }
  return v2;
}

uint64_t __27__SESXPCEventListener_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dumpState");
}

+ (void)kickoff
{
  id v2;

  v2 = +[SESXPCEventListener sharedObject](SESXPCEventListener, "sharedObject");
}

+ (id)registerOnStream:(id)a3 forEvent:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  dispatch_queue_t *v10;
  NSObject *v11;
  dispatch_queue_t *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;
  _QWORD block[4];
  dispatch_queue_t *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[SESXPCEventListener sharedObject](SESXPCEventListener, "sharedObject");
  v10 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10[1]);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v11 = v10[1];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SESXPCEventListener_registerOnStream_forEvent_handler___block_invoke;
  block[3] = &unk_251CC6330;
  v12 = v10;
  v21 = v12;
  v13 = v7;
  v22 = v13;
  v14 = v9;
  v23 = v14;
  v15 = v8;
  v24 = v15;
  v25 = &v26;
  dispatch_sync(v11, block);
  SESDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = objc_msgSend((id)v27[5], "count");
    *(_DWORD *)buf = 138412546;
    v33 = v13;
    v34 = 1024;
    v35 = v17;
    _os_log_impl(&dword_24B9C8000, v16, OS_LOG_TYPE_INFO, "Registered client for stream %@ and returning %u pending events", buf, 0x12u);
  }

  v18 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v18;
}

void __57__SESXPCEventListener_registerOnStream_forEvent_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  xpc_object_t empty;
  const char *v5;
  _QWORD *v6;
  NSObject *v7;
  id v8;
  xpc_object_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  _QWORD *v17;
  id v18;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "addPointer:", *(_QWORD *)(a1 + 48));
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String");
    empty = xpc_dictionary_create_empty();
    xpc_set_event();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addPointer:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
    v5 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    v6 = *(_QWORD **)(a1 + 32);
    v7 = v6[1];
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __57__SESXPCEventListener_registerOnStream_forEvent_handler___block_invoke_2;
    v16 = &unk_251CC6308;
    v17 = v6;
    v18 = *(id *)(a1 + 40);
    xpc_set_event_stream_handler(v5, v7, &v13);
    v8 = objc_retainAutorelease(*(id *)(a1 + 40));
    objc_msgSend(v8, "UTF8String", v13, v14, v15, v16);
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String");
    v9 = xpc_dictionary_create_empty();
    xpc_set_event();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __57__SESXPCEventListener_registerOnStream_forEvent_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEvent:payload:", *(_QWORD *)(a1 + 40), a2);
}

- (void)_handleEvent:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->queue);
  -[NSMutableDictionary objectForKey:](self->registeredDelegates, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SESDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2048;
    v25 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_24B9C8000, v9, OS_LOG_TYPE_INFO, "Received event on stream %@ have %lu delegates", buf, 0x16u);
  }

  if (v8)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (v15)
            objc_msgSend(v15, "onEvent:eventPayload:", v6, v7, (_QWORD)v17);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->pendingEvents, "objectForKeyedSubscript:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!self->pendingEvents)
    {
      v16 = objc_opt_new();

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->pendingEvents, "setObject:forKeyedSubscript:", v16, v6);
      v10 = (id)v16;
    }
    objc_msgSend(v10, "addObject:", v7);
  }

}

- (os_state_data_s)_dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_state_data_s *v8;
  id v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("registeredStreams");
  -[NSMutableDictionary keyEnumerator](self->registeredDelegates, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("pendingEvents");
  v12[0] = v4;
  -[NSMutableDictionary allKeys](self->pendingEvents, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 200, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (os_state_data_s *)malloc_type_calloc(1uLL, objc_msgSend(v7, "length") + 200, 0xD8CAA496uLL);
  v8->var0 = 1;
  v8->var1.var1 = objc_msgSend(v7, "length");
  __strlcpy_chk();
  v9 = objc_retainAutorelease(v7);
  memcpy(v8->var4, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pendingEvents, 0);
  objc_storeStrong((id *)&self->registeredDelegates, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end
