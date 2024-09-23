@implementation PLSoCAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSoCAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("LifetimeServoStats");
  objc_msgSend(a1, "entryEventPointDefinitionLifetimeServoStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventPointDefinitionLifetimeServoStats
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8652BA0;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("VTBucket");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("VTCount");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLSoCAgent)init
{
  PLSoCAgent *v2;
  PLSoCAgent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLSoCAgent;
  v2 = -[PLAgent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PLSoCAgent registerForTaskingStartNotification](v2, "registerForTaskingStartNotification");
  return v3;
}

- (void)registerForTaskingStartNotification
{
  id v3;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_taskingStartNotificationReceived_, *MEMORY[0x1E0D80408], 0);

  }
}

- (void)registerForTaskingEndNotification
{
  id v3;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_taskingEndNotificationReceived_, *MEMORY[0x1E0D803F8], 0);

  }
}

- (void)taskingStartNotificationReceived:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  PLLogSoC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "Received tasking start notification", buf, 2u);
  }

  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PLSoCAgent_taskingStartNotificationReceived___block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v5, block);

}

void __47__PLSoCAgent_taskingStartNotificationReceived___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "requestLTSStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSoC();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Got callback for PLSoCAgent_EventPoint_LifetimeServoStats: %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "logEventPointLifetimeServoStats:", v2);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v5) = 0;
      _os_log_error_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_ERROR, "LTSStats are unavailable", (uint8_t *)&v5, 2u);
    }

  }
}

- (void)taskingEndNotificationReceived:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  PLLogSoC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "Received tasking end notification", buf, 2u);
  }

  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PLSoCAgent_taskingEndNotificationReceived___block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v5, block);

}

void __45__PLSoCAgent_taskingEndNotificationReceived___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "requestLTSStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSoC();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Got callback for PLSoCAgent_EventPoint_LifetimeServoStats: %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "logEventPointLifetimeServoStats:", v2);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v5) = 0;
      _os_log_error_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_ERROR, "LTSStats are unavailable", (uint8_t *)&v5, 2u);
    }

  }
}

- (id)requestLTSStats
{
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  xpc_object_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[2];
  __int16 v18;

  mach_service = xpc_connection_create_mach_service("com.apple.powerdatad", MEMORY[0x1E0C80D38], 0);
  v3 = mach_service;
  if (!mach_service)
  {
    PLLogSoC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v10 = 0;
      goto LABEL_18;
    }
    v18 = 0;
    v11 = "Failed to create connection";
    v12 = (uint8_t *)&v18;
LABEL_20:
    _os_log_error_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_11;
  }
  v4 = (void *)MEMORY[0x1E0C80D38];
  xpc_connection_set_target_queue(mach_service, MEMORY[0x1E0C80D38]);

  xpc_connection_set_event_handler(v3, &__block_literal_global_26);
  xpc_connection_resume(v3);
  v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5)
  {
    PLLogSoC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v11 = "Failed to create dictionary to send message";
    v12 = buf;
    goto LABEL_20;
  }
  v6 = v5;
  xpc_dictionary_set_BOOL(v5, "LTSStats", 1);
  v7 = xpc_connection_send_message_with_reply_sync(v3, v6);
  v8 = v7;
  if (v7)
  {
    if (MEMORY[0x1D179CB2C](v7) == MEMORY[0x1E0C812F8])
    {
      v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    }
    else
    {
      PLLogSoC();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_ERROR, "Received an error in response", v15, 2u);
      }

      v10 = 0;
    }
    xpc_connection_cancel(v3);
  }
  else
  {
    PLLogSoC();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_ERROR, "Did not receive a response", v16, 2u);
    }

    v10 = 0;
  }

LABEL_18:
  return v10;
}

- (void)logEventPointLifetimeServoStats:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *, void *, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertFromSystemToMonotonic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LTSStats"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLSoCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("LifetimeServoStats"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __46__PLSoCAgent_logEventPointLifetimeServoStats___block_invoke;
  v18 = &unk_1E8579A70;
  v11 = v9;
  v19 = v11;
  v12 = v7;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v15);
  if (objc_msgSend(v13, "count", v15, v16, v17, v18))
  {
    v22 = v11;
    v23[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v14, v11);

  }
}

void __46__PLSoCAgent_logEventPointLifetimeServoStats___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PLSoCAgent_logEventPointLifetimeServoStats___block_invoke_2;
  v7[3] = &unk_1E857A028;
  v8 = a1[4];
  v9 = a1[5];
  v10 = v5;
  v11 = a1[6];
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __46__PLSoCAgent_logEventPointLifetimeServoStats___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v6 = a3;
  v7 = a2;
  v12 = (id)objc_msgSend([v5 alloc], "initWithEntryKey:withDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), *(_QWORD *)(a1 + 48), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("VTBucket"));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v9, "numberWithUnsignedLongLong:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("VTCount"));

  objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
}

@end
