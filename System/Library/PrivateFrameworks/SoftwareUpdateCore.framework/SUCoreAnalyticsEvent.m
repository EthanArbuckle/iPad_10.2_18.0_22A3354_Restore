@implementation SUCoreAnalyticsEvent

- (SUCoreAnalyticsEvent)init
{

  return 0;
}

- (SUCoreAnalyticsEvent)initWithEventName:(id)a3
{
  id v5;
  SUCoreAnalyticsEvent *v6;
  SUCoreAnalyticsEvent *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *mutableEventPayload;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *stateQueue;
  void *v13;
  uint64_t v14;
  NSString *eventUUID;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUCoreAnalyticsEvent;
  v6 = -[SUCoreAnalyticsEvent init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableEventPayload = v7->_mutableEventPayload;
    v7->_mutableEventPayload = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.SUCore.CoreAnalyticsEventQueue", v10);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    eventUUID = v7->_eventUUID;
    v7->_eventUUID = (NSString *)v14;

  }
  return v7;
}

- (NSDictionary)eventPayload
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__SUCoreAnalyticsEvent_eventPayload__block_invoke;
  v6[3] = &unk_1EA877F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __36__SUCoreAnalyticsEvent_eventPayload__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setEventPayloadEntry:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSObject *stateQueue;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SUCoreAnalyticsEvent_setEventPayloadEntry_value___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_sync(stateQueue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v6;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "Event payload data \"%{public}@\" is unsupported type \"%{public}@\". Supported Types: NSString, NSNumber, NSData, NSDate", buf, 0x16u);

    }
  }

}

uint64_t __51__SUCoreAnalyticsEvent_setEventPayloadEntry_value___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntry:value:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setEventPayloadEntryToNull:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SUCoreAnalyticsEvent_setEventPayloadEntryToNull___block_invoke;
  block[3] = &unk_1EA878A88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

uint64_t __51__SUCoreAnalyticsEvent_setEventPayloadEntryToNull___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntryToNull:", *(_QWORD *)(a1 + 40));
}

- (void)removeEventPayloadEntry:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SUCoreAnalyticsEvent_removeEventPayloadEntry___block_invoke;
  block[3] = &unk_1EA878A88;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

uint64_t __48__SUCoreAnalyticsEvent_removeEventPayloadEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeEventPayloadEntry:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_setEventPayloadEntry:(id)a3 value:(id)a4
{
  NSObject *stateQueue;
  id v7;
  id v8;

  stateQueue = self->_stateQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[NSMutableDictionary setSafeObject:forKey:](self->_mutableEventPayload, "setSafeObject:forKey:", v7, v8);

}

- (void)_queue_setEventPayloadEntryToNull:(id)a3
{
  NSObject *stateQueue;
  id v5;
  NSMutableDictionary *mutableEventPayload;
  id v7;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  mutableEventPayload = self->_mutableEventPayload;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](mutableEventPayload, "setSafeObject:forKey:", v7, v5);

}

- (void)_queue_removeEventPayloadEntry:(id)a3
{
  NSObject *stateQueue;
  id v5;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableEventPayload, "setObject:forKeyedSubscript:", 0, v5);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreAnalyticsEvent eventName](self, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreAnalyticsEvent eventUUID](self, "eventUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreAnalyticsEvent eventPayload](self, "eventPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("EventName: %@ EventUUID: %@ EventPayload: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)eventUUID
{
  return self->_eventUUID;
}

- (void)setEventUUID:(id)a3
{
  objc_storeStrong((id *)&self->_eventUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventUUID, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_mutableEventPayload, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
