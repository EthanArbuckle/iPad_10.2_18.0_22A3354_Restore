@implementation WFBiomeListener

- (WFBiomeListener)initWithEventQueue:(id)a3
{
  id v5;
  WFBiomeListener *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSMutableDictionary *triggerIDToSinks;
  uint64_t v13;
  NSMutableDictionary *remoteTriggerIDToSinks;
  uint64_t v15;
  NSMutableDictionary *seenTransactionIdentifiers;
  WFBiomeListener *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFBiomeListener;
  v6 = -[WFBiomeListener init](&v19, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.siriactionsd.WFBiomeListener", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_eventQueue, a3);
    v11 = objc_opt_new();
    triggerIDToSinks = v6->_triggerIDToSinks;
    v6->_triggerIDToSinks = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    remoteTriggerIDToSinks = v6->_remoteTriggerIDToSinks;
    v6->_remoteTriggerIDToSinks = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    seenTransactionIdentifiers = v6->_seenTransactionIdentifiers;
    v6->_seenTransactionIdentifiers = (NSMutableDictionary *)v15;

    v17 = v6;
  }

  return v6;
}

- (void)registerConfiguredTrigger:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WFBiomeListener *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[WFBiomeListener queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke;
  block[3] = &unk_1E7AA8110;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)unregisterConfiguredTriggerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFBiomeListener queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__WFBiomeListener_unregisterConfiguredTriggerWithIdentifier___block_invoke;
  v7[3] = &unk_1E7AA8138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)queue_unregisterConfiguredTriggerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFBiomeListener queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  getWFTriggersLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[WFBiomeListener queue_unregisterConfiguredTriggerWithIdentifier:]";
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s [Biome] Unregistering trigger with identifier: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  -[WFBiomeListener triggerIDToSinks](self, "triggerIDToSinks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = objc_claimAutoreleasedReturnValue();

  -[WFBiomeListener remoteTriggerIDToSinks](self, "remoteTriggerIDToSinks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v4);
  v10 = objc_claimAutoreleasedReturnValue();

  if (!(v8 | v10))
  {
    getWFTriggersLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315394;
      v17 = "-[WFBiomeListener queue_unregisterConfiguredTriggerWithIdentifier:]";
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEFAULT, "%s [Biome] No sink associated with identifier: %{public}@, nothing to unregister", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_12;
  }
  if (v8)
  {
    objc_msgSend((id)v8, "cancel");
    -[WFBiomeListener triggerIDToSinks](self, "triggerIDToSinks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v4);

  }
  if (v10)
  {
    -[WFBiomeListener remoteTriggerIDToSinks](self, "remoteTriggerIDToSinks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 <= 1)
      objc_msgSend(MEMORY[0x1E0DD9EE8], "unregisterContextSyncClient");
    objc_msgSend((id)v10, "cancel");
    -[WFBiomeListener remoteTriggerIDToSinks](self, "remoteTriggerIDToSinks");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v15, "removeObjectForKey:", v4);
LABEL_12:

  }
}

- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[WFBiomeListener queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WFBiomeListener_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke;
  block[3] = &unk_1E7AA8160;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)queue_fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[WFBiomeListener queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBiomeListener.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBiomeListener.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  -[WFBiomeListener eventQueue](self, "eventQueue");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "enqueueTriggerWithIdentifier:eventInfo:force:completion:", v13, v12, v7, v11);

}

- (void)queue_handleEvent:(id)a3 forTrigger:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  WFBiomeListener *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[WFBiomeListener queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBiomeListener.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuredTrigger"));

  }
  objc_msgSend(v8, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getWFTriggersLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v23 = "-[WFBiomeListener queue_handleEvent:forTrigger:]";
    v24 = 2112;
    v25 = v10;
    v26 = 2114;
    v27 = v12;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s 🤖 Handling event for trigger with identifier (%@, %{public}@) and event: %@", buf, 0x2Au);

  }
  -[WFBiomeListener seenTransactionIdentifiers](self, "seenTransactionIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFBiomeListener isTransactionEventDuplicate:forTrigger:withSeenTransactionIdentifiers:](self, "isTransactionEventDuplicate:forTrigger:withSeenTransactionIdentifiers:", v7, v8, v13);

  if (!v14)
  {
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke;
    v17[3] = &unk_1E7AA81F0;
    v18 = v10;
    v19 = v8;
    v20 = v7;
    v21 = self;
    objc_msgSend(v18, "shouldFireInResponseToEvent:triggerIdentifier:completion:", v20, v15, v17);

  }
}

- (BOOL)isTransactionEventDuplicate:(id)a3 forTrigger:(id)a4 withSeenTransactionIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  NSObject *v18;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "trigger");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "transactionIdentifierWithEvent:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        v15 = v13;
      else
        v15 = (id)objc_opt_new();
      v17 = v15;

      v16 = objc_msgSend(v17, "containsObject:", v11);
      if (v16)
      {
        getWFTriggersLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136315394;
          v21 = "-[WFBiomeListener isTransactionEventDuplicate:forTrigger:withSeenTransactionIdentifiers:]";
          v22 = 2112;
          v23 = v11;
          _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_DEFAULT, "%s Ignoring duplicate transaction identifier %@", (uint8_t *)&v20, 0x16u);
        }
      }
      else
      {
        objc_msgSend(v17, "addObject:", v11);
        objc_msgSend(v8, "identifier");
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);
      }

    }
    else
    {
      LOBYTE(v16) = 0;
    }

  }
  else
  {

    LOBYTE(v16) = 0;
  }

  return v16;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFTriggerEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (NSMutableDictionary)triggerIDToSinks
{
  return self->_triggerIDToSinks;
}

- (NSMutableDictionary)remoteTriggerIDToSinks
{
  return self->_remoteTriggerIDToSinks;
}

- (NSMutableDictionary)seenTransactionIdentifiers
{
  return self->_seenTransactionIdentifiers;
}

- (void)setSeenTransactionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_seenTransactionIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenTransactionIdentifiers, 0);
  objc_storeStrong((id *)&self->_remoteTriggerIDToSinks, 0);
  objc_storeStrong((id *)&self->_triggerIDToSinks, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[WFBiomeListener queue_handleEvent:forTrigger:]_block_invoke";
    v15 = 1024;
    LODWORD(v16) = a2;
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s 🤖 Should the trigger fire in response to this event? %d", buf, 0x12u);
  }

  if ((a2 & 1) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke_144;
    v11[3] = &unk_1E7AA81C8;
    v5 = *(_QWORD *)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 56);
    v6 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v6, "eventInfoForEvent:completion:", v5, v11);

  }
  else
  {
    getWFTriggersLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315906;
      v14 = "-[WFBiomeListener queue_handleEvent:forTrigger:]_block_invoke";
      v15 = 2112;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s 🤖 Trigger (%@, %{public}@) should NOT fire in response to event: %@, dropping", buf, 0x2Au);

    }
  }
}

void __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke_144(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke_2;
  block[3] = &unk_1E7AA82B0;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

void __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (*(_QWORD *)(a1 + 48))
    v4 = *(_QWORD *)(a1 + 48);
  else
    v4 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v2, "queue_fireTriggerWithIdentifier:force:eventInfo:completion:", v3, 0, v4, &__block_literal_global_6720);

}

void __48__WFBiomeListener_queue_handleEvent_forTrigger___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[WFBiomeListener queue_handleEvent:forTrigger:]_block_invoke_3";
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

uint64_t __72__WFBiomeListener_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_fireTriggerWithIdentifier:force:eventInfo:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __61__WFBiomeListener_unregisterConfiguredTriggerWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_unregisterConfiguredTriggerWithIdentifier:", *(_QWORD *)(a1 + 40));
}

void __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  int8x16_t v42;
  int8x16_t v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  int8x16_t v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  int8x16_t v53;
  _QWORD v54[4];
  id v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "queue_unregisterConfiguredTriggerWithIdentifier:", v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "triggerIDToSinks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_6:
    objc_msgSend(*(id *)(a1 + 40), "queue_unregisterConfiguredTriggerWithIdentifier:", v2);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 40), "remoteTriggerIDToSinks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_6;
LABEL_7:
  getWFTriggersLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v57 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
    v58 = 2112;
    v59 = v9;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEFAULT, "%s 🤖 [Biome] Registering configured trigger: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.siriactionsd.%@"), v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D025E0]);
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "initWithIdentifier:targetQueue:", v10, v12);

  v45 = (void *)v13;
  objc_msgSend(v3, "publisherWithScheduler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_114;
  v54[3] = &unk_1E7AA80C0;
  v55 = v3;
  v51[0] = v15;
  v51[1] = 3221225472;
  v51[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_116;
  v51[3] = &unk_1E7AA80E8;
  v16 = v55;
  v52 = v16;
  v43 = *(int8x16_t *)(a1 + 32);
  v17 = (id)v43.i64[0];
  v53 = vextq_s8(v43, v43, 8uLL);
  objc_msgSend(v14, "sinkWithCompletion:receiveInput:", v54, v51);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 40), "triggerIDToSinks");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v18, v2);

    if (!objc_msgSend(v16, "hasRemotePublisher"))
      goto LABEL_20;
    v44 = v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.siriactionsd.remote.%@"), v2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x1E0D025E0]);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithIdentifier:targetQueue:", v20, v22);

    objc_msgSend(v16, "remotePublisherWithScheduler:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v15;
    v49[1] = 3221225472;
    v49[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_123;
    v49[3] = &unk_1E7AA80C0;
    v50 = v16;
    v46[0] = v15;
    v46[1] = 3221225472;
    v46[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_124;
    v46[3] = &unk_1E7AA80E8;
    v47 = v50;
    v42 = *(int8x16_t *)(a1 + 32);
    v25 = (id)v42.i64[0];
    v48 = vextq_s8(v42, v42, 8uLL);
    objc_msgSend(v24, "sinkWithCompletion:receiveInput:", v49, v46);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(*(id *)(a1 + 40), "remoteTriggerIDToSinks");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v26, v2);
    }
    else
    {
      v34 = v20;
      getWFTriggersLogObject();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "trigger");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v57 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke_2";
        v58 = 2114;
        v59 = v38;
        _os_log_impl(&dword_1C146A000, v35, OS_LOG_TYPE_FAULT, "%s Could not register trigger of type %{public}@ due to missing remote sink", buf, 0x16u);

      }
      v39 = *(_QWORD *)(a1 + 48);
      objc_msgSend((id)objc_opt_class(), "registrationError");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v39 + 16))(v39, 0, v27);
      v20 = v34;
    }

    v10 = v44;
    if (v26)
    {
LABEL_20:
      getWFTriggersLogObject();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v57 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
        v58 = 2112;
        v59 = v41;
        _os_log_impl(&dword_1C146A000, v40, OS_LOG_TYPE_DEFAULT, "%s 🤖 [Biome] Registered configured trigger: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    getWFTriggersLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "trigger");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v57 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke_2";
      v58 = 2114;
      v59 = v31;
      _os_log_impl(&dword_1C146A000, v28, OS_LOG_TYPE_FAULT, "%s Could not register trigger of type %{public}@ due to missing sink", buf, 0x16u);

    }
    v32 = *(_QWORD *)(a1 + 48);
    objc_msgSend((id)objc_opt_class(), "registrationError");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v32 + 16))(v32, 0, v33);

  }
LABEL_24:

}

void __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_114(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s Event cancelled %@", (uint8_t *)&v4, 0x16u);
  }

}

void __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_116(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v13 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s Received input %@ from trigger %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_117;
  block[3] = &unk_1E7AA82B0;
  v7 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  dispatch_async(v6, block);

}

void __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_123(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s Event cancelled %@ remote", (uint8_t *)&v4, 0x16u);
  }

}

void __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v13 = "-[WFBiomeListener registerConfiguredTrigger:completion:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s Received input %@ from trigger %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_125;
  block[3] = &unk_1E7AA82B0;
  v7 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  dispatch_async(v6, block);

}

uint64_t __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_125(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_handleEvent:forTrigger:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __56__WFBiomeListener_registerConfiguredTrigger_completion___block_invoke_117(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_handleEvent:forTrigger:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)registrationError
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  v3 = *MEMORY[0x1E0CB2D50];
  v8[0] = *MEMORY[0x1E0CB2D68];
  v8[1] = v3;
  v9[0] = CFSTR("Automation could not be registered");
  v9[1] = CFSTR("The associated automation could not be registered due to an underlying error.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithDictionary:", v4);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDA080], 1002, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
