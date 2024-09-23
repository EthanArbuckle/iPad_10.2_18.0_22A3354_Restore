@implementation SUAnalyticsEvent

- (SUAnalyticsEvent)initWithEventName:(id)a3
{
  id v5;
  SUAnalyticsEvent *v6;
  SUAnalyticsEvent *v7;
  void *v8;
  uint64_t v9;
  NSString *eventUUID;
  NSMutableDictionary *v11;
  NSMutableDictionary *mutableEventPayload;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *stateQueue;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUAnalyticsEvent;
  v6 = -[SUAnalyticsEvent init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    eventUUID = v7->_eventUUID;
    v7->_eventUUID = (NSString *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mutableEventPayload = v7->_mutableEventPayload;
    v7->_mutableEventPayload = v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.SUServices.CoreAnalyticsEventQueue", v13);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v14;

  }
  return v7;
}

- (SUAnalyticsEvent)initWithCoder:(id)a3
{
  id v4;
  SUAnalyticsEvent *v5;
  uint64_t v6;
  NSString *eventName;
  uint64_t v8;
  NSString *eventUUID;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *mutableEventPayload;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *stateQueue;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUAnalyticsEvent;
  v5 = -[SUAnalyticsEvent init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("analyticsEventName"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("analyticsEventUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventUUID = v5->_eventUUID;
    v5->_eventUUID = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v10, v14, CFSTR("analyticsEventPayload"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
    mutableEventPayload = v5->_mutableEventPayload;
    v5->_mutableEventPayload = (NSMutableDictionary *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.SUServices.CoreAnalyticsEventQueue", v18);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SUAnalyticsEvent eventName](self, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("analyticsEventName"));

  -[SUAnalyticsEvent eventPayload](self, "eventPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("analyticsEventPayload"));

  -[SUAnalyticsEvent eventUUID](self, "eventUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("analyticsEventUUID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__SUAnalyticsEvent_eventPayload__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __32__SUAnalyticsEvent_eventPayload__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setEventPayloadEntry:(id)a3 BOOLValue:(BOOL)a4
{
  id v6;
  NSObject *stateQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUAnalyticsEvent_setEventPayloadEntry_BOOLValue___block_invoke;
  block[3] = &unk_24CE3C498;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(stateQueue, block);

}

uint64_t __51__SUAnalyticsEvent_setEventPayloadEntry_BOOLValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntry:BOOLValue:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)setEventPayloadEntry:(id)a3 numberValue:(id)a4
{
  id v6;
  id v7;
  NSObject *stateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUAnalyticsEvent_setEventPayloadEntry_numberValue___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(stateQueue, block);

}

uint64_t __53__SUAnalyticsEvent_setEventPayloadEntry_numberValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntry:numberValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setEventPayloadEntry:(id)a3 stringValue:(id)a4
{
  id v6;
  id v7;
  NSObject *stateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUAnalyticsEvent_setEventPayloadEntry_stringValue___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(stateQueue, block);

}

uint64_t __53__SUAnalyticsEvent_setEventPayloadEntry_stringValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntry:stringValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SUAnalyticsEvent_setEventPayloadEntryToNull___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

uint64_t __47__SUAnalyticsEvent_setEventPayloadEntryToNull___block_invoke(uint64_t a1)
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUAnalyticsEvent_removeEventPayloadEntry___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

uint64_t __44__SUAnalyticsEvent_removeEventPayloadEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeEventPayloadEntry:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_setEventPayloadEntry:(id)a3 BOOLValue:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v4 = a4;
  v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableEventPayload, "setObject:forKeyedSubscript:", v6, v14);
  }
  else
  {
    SULogAnalytics();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v6, CFSTR("invalid key passed to setEventPayloadEntry"), v7, v8, v9, v10, v11, v12, v13);
  }

}

- (void)_queue_setEventPayloadEntry:(id)a3 numberValue:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v15 && v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableEventPayload, "setObject:forKeyedSubscript:", v6, v15);
  }
  else
  {
    SULogAnalytics();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v7, CFSTR("invalid key/numberValue passed to setEventPayloadEntry"), v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)_queue_setEventPayloadEntry:(id)a3 stringValue:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v15 && v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableEventPayload, "setObject:forKeyedSubscript:", v6, v15);
  }
  else
  {
    SULogAnalytics();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v7, CFSTR("invalid key/stringValue passed to setEventPayloadEntry"), v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)_queue_setEventPayloadEntryToNull:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  id v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  SULogAnalytics();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  if (a3)
    v11 = CFSTR("not supported");
  else
    v11 = CFSTR("invalid key passed to setEventPayloadEntrytoNull");
  SULogErrorForSubsystem(v4, v11, v5, v6, v7, v8, v9, v10, v12);

}

- (void)_queue_removeEventPayloadEntry:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v12)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableEventPayload, "setObject:forKeyedSubscript:", 0, v12);
  }
  else
  {
    SULogAnalytics();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SULogErrorForSubsystem(v4, CFSTR("invalid key passed to removePayloadEntry"), v5, v6, v7, v8, v9, v10, v11);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUAnalyticsEvent eventName](self, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAnalyticsEvent eventUUID](self, "eventUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAnalyticsEvent eventPayload](self, "eventPayload");
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
