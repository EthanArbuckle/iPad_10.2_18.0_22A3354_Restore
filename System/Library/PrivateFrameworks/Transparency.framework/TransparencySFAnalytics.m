@implementation TransparencySFAnalytics

+ (id)logger
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TransparencySFAnalytics;
  objc_msgSendSuper2(&v3, sel_logger);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)databasePath
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("swtransparencyd")))
    +[SWTransparencySFAnalytics databasePath](SWTransparencySFAnalytics, "databasePath");
  else
    objc_msgSend(a1, "defaultAnalyticsDatabasePath:", CFSTR("TransparencyAnalytics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)backgroundPerform:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  BOOL v6;
  uint64_t v7;
  unsigned __int8 v8;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;
  _QWORD block[4];
  id v13;

  v3 = a3;
  if (backgroundPerform__onceToken != -1)
    dispatch_once(&backgroundPerform__onceToken, &__block_literal_global_9);
  v4 = backgroundPerform__backgroundQueue;
  v5 = backgroundPerform__analyticsGroup;
  if (backgroundPerform__backgroundQueue)
    v6 = backgroundPerform__analyticsGroup == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__TransparencySFAnalytics_backgroundPerform___block_invoke_2;
    block[3] = &unk_24DC8FAD0;
    v13 = v3;
    dispatch_group_async(v5, v4, block);
    do
      v8 = __ldaxr(backgroundPerform__has_transaction);
    while (__stlxr(1u, backgroundPerform__has_transaction));
    if ((v8 & 1) == 0)
    {
      v10[0] = 0;
      v10[1] = v10;
      v10[2] = 0x3032000000;
      v10[3] = __Block_byref_object_copy__4;
      v10[4] = __Block_byref_object_dispose__4;
      v11 = 0;
      v11 = (id)os_transaction_create();
      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __45__TransparencySFAnalytics_backgroundPerform___block_invoke_18;
      v9[3] = &unk_24DC8FAF8;
      v9[4] = v10;
      dispatch_group_notify((dispatch_group_t)backgroundPerform__analyticsGroup, (dispatch_queue_t)backgroundPerform__backgroundQueue, v9);
      _Block_object_dispose(v10, 8);

    }
  }

}

void __45__TransparencySFAnalytics_backgroundPerform___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  dispatch_group_t v3;
  void *v4;
  NSObject *attr;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.transparencyd.analytics", attr);
  v2 = (void *)backgroundPerform__backgroundQueue;
  backgroundPerform__backgroundQueue = (uint64_t)v1;

  v3 = dispatch_group_create();
  v4 = (void *)backgroundPerform__analyticsGroup;
  backgroundPerform__analyticsGroup = (uint64_t)v3;

}

uint64_t __45__TransparencySFAnalytics_backgroundPerform___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__TransparencySFAnalytics_backgroundPerform___block_invoke_18(uint64_t a1)
{
  unsigned __int8 v1;
  uint64_t v2;
  void *v3;

  do
    v1 = __ldaxr(backgroundPerform__has_transaction);
  while (__stlxr(0, backgroundPerform__has_transaction));
  if ((v1 & 1) != 0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
}

- (void)logSuccessForEventNamed:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TransparencySFAnalytics *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__TransparencySFAnalytics_logSuccessForEventNamed___block_invoke;
  v6[3] = &unk_24DC8FB20;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TransparencySFAnalytics backgroundPerform:](self, "backgroundPerform:", v6);

}

id __51__TransparencySFAnalytics_logSuccessForEventNamed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)TransparencySFAnalytics;
  return objc_msgSendSuper2(&v3, sel_logSuccessForEventNamed_, v1);
}

- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  TransparencySFAnalytics *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__TransparencySFAnalytics_logHardFailureForEventNamed_withAttributes___block_invoke;
  v10[3] = &unk_24DC8FB48;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[TransparencySFAnalytics backgroundPerform:](self, "backgroundPerform:", v10);

}

id __70__TransparencySFAnalytics_logHardFailureForEventNamed_withAttributes___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)TransparencySFAnalytics;
  return objc_msgSendSuper2(&v4, sel_logHardFailureForEventNamed_withAttributes_, v2, v1);
}

- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  TransparencySFAnalytics *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__TransparencySFAnalytics_logSoftFailureForEventNamed_withAttributes___block_invoke;
  v10[3] = &unk_24DC8FB48;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[TransparencySFAnalytics backgroundPerform:](self, "backgroundPerform:", v10);

}

id __70__TransparencySFAnalytics_logSoftFailureForEventNamed_withAttributes___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)TransparencySFAnalytics;
  return objc_msgSendSuper2(&v4, sel_logSoftFailureForEventNamed_withAttributes_, v2, v1);
}

- (void)noteEventNamed:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TransparencySFAnalytics *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__TransparencySFAnalytics_noteEventNamed___block_invoke;
  v6[3] = &unk_24DC8FB20;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TransparencySFAnalytics backgroundPerform:](self, "backgroundPerform:", v6);

}

id __42__TransparencySFAnalytics_noteEventNamed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)TransparencySFAnalytics;
  return objc_msgSendSuper2(&v3, sel_noteEventNamed_, v1);
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  TransparencySFAnalytics *v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__TransparencySFAnalytics_logResultForEvent_hardFailure_result___block_invoke;
  v12[3] = &unk_24DC8FB70;
  v16 = a4;
  v13 = v8;
  v14 = v9;
  v15 = self;
  v10 = v9;
  v11 = v8;
  -[TransparencySFAnalytics backgroundPerform:](self, "backgroundPerform:", v12);

}

id __64__TransparencySFAnalytics_logResultForEvent_hardFailure_result___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)TransparencySFAnalytics;
  return objc_msgSendSuper2(&v5, sel_logResultForEvent_hardFailure_result_, v3, v2, v1);
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  TransparencySFAnalytics *v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __79__TransparencySFAnalytics_logResultForEvent_hardFailure_result_withAttributes___block_invoke;
  v16[3] = &unk_24DC8FB98;
  v21 = a4;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = self;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[TransparencySFAnalytics backgroundPerform:](self, "backgroundPerform:", v16);

}

id __79__TransparencySFAnalytics_logResultForEvent_hardFailure_result_withAttributes___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v1 = *(unsigned __int8 *)(a1 + 64);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6.receiver = *(id *)(a1 + 56);
  v6.super_class = (Class)TransparencySFAnalytics;
  return objc_msgSendSuper2(&v6, sel_logResultForEvent_hardFailure_result_withAttributes_, v2, v1, v3, v4);
}

- (void)logMetric:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  TransparencySFAnalytics *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__TransparencySFAnalytics_logMetric_withName___block_invoke;
  v10[3] = &unk_24DC8FB48;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[TransparencySFAnalytics backgroundPerform:](self, "backgroundPerform:", v10);

}

id __46__TransparencySFAnalytics_logMetric_withName___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)TransparencySFAnalytics;
  return objc_msgSendSuper2(&v4, sel_logMetric_withName_, v2, v1);
}

@end
