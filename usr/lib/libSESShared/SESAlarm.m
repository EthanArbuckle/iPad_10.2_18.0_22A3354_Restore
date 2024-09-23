@implementation SESAlarm

+ (id)sharedObject
{
  if (sharedObject_onceToken != -1)
    dispatch_once(&sharedObject_onceToken, &__block_literal_global);
  return (id)sharedObject_sharedObject;
}

void __24__SESAlarm_sharedObject__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedObject_sharedObject;
  sharedObject_sharedObject = v0;

}

- (SESAlarm)init
{
  SESAlarm *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMapTable *registered;
  uint64_t v9;
  NSMutableSet *pendingAlarms;
  NSObject *v11;
  _QWORD handler[4];
  SESAlarm *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SESAlarm;
  v2 = -[SESAlarm init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.seserviced.alarm", v4);
    queue = v2->queue;
    v2->queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    registered = v2->registered;
    v2->registered = (NSMapTable *)v7;

    v9 = objc_opt_new();
    pendingAlarms = v2->pendingAlarms;
    v2->pendingAlarms = (NSMutableSet *)v9;

    v11 = v2->queue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __16__SESAlarm_init__block_invoke;
    handler[3] = &unk_251CC6118;
    v14 = v2;
    xpc_set_event_stream_handler("com.apple.alarm", v11, handler);

  }
  return v2;
}

uint64_t __16__SESAlarm_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAlarmFired:", a2);
}

+ (void)kickoff
{
  id v2;

  v2 = +[SESAlarm sharedObject](SESAlarm, "sharedObject");
}

- (void)_handleAlarmFired:(id)a3
{
  NSObject *queue;
  id v5;
  const char *string;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  queue = self->queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x24BDACF50]);

  if (string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_retainAutorelease(v7);
      objc_msgSend(v9, "UTF8String");
      xpc_set_event();
      -[NSMapTable objectForKey:](self->registered, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SESDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = 138412546;
        v13 = v9;
        v14 = 1024;
        v15 = v10 == 0;
        _os_log_impl(&dword_24B9C8000, v11, OS_LOG_TYPE_INFO, "Handling alarm %@ pended %d", (uint8_t *)&v12, 0x12u);
      }

      if (v10)
        objc_msgSend(v10, "onAlarm:", v9);
      else
        -[NSMutableSet addObject:](self->pendingAlarms, "addObject:", v9);

    }
  }
}

+ (BOOL)registerAlarm:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  dispatch_queue_t *v7;
  NSObject *v8;
  dispatch_queue_t *v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  BOOL v14;
  _QWORD v16[4];
  dispatch_queue_t *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  +[SESAlarm sharedObject](SESAlarm, "sharedObject");
  v7 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7[1]);
  v8 = v7[1];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __34__SESAlarm_registerAlarm_handler___block_invoke;
  v16[3] = &unk_251CC6140;
  v9 = v7;
  v17 = v9;
  v10 = v6;
  v18 = v10;
  v11 = v5;
  v19 = v11;
  v20 = &v21;
  dispatch_sync(v8, v16);
  SESDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = *((unsigned __int8 *)v22 + 24);
    *(_DWORD *)buf = 138412546;
    v26 = v11;
    v27 = 1024;
    v28 = v13;
    _os_log_impl(&dword_24B9C8000, v12, OS_LOG_TYPE_INFO, "Registered alarm %@ wasPending %d", buf, 0x12u);
  }

  v14 = *((_BYTE *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  return v14;
}

uint64_t __34__SESAlarm_registerAlarm_handler___block_invoke(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[5], a1[6]);
  result = objc_msgSend(*(id *)(a1[4] + 24), "containsObject:", a1[6]);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1[4] + 24), "removeObject:", a1[6]);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  return result;
}

+ (void)deregisterAlarm:(id)a3
{
  id v3;
  dispatch_queue_t *v4;
  NSObject *v5;
  id v6;
  dispatch_queue_t *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  dispatch_queue_t *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SESAlarm sharedObject](SESAlarm, "sharedObject");
  v4 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4[1]);
  v5 = v4[1];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __28__SESAlarm_deregisterAlarm___block_invoke;
  v9[3] = &unk_251CC6168;
  v6 = v3;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  dispatch_sync(v5, v9);
  SESDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_24B9C8000, v8, OS_LOG_TYPE_INFO, "Deregistered alarm %@", buf, 0xCu);
  }

}

uint64_t __28__SESAlarm_deregisterAlarm___block_invoke(uint64_t a1)
{
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  xpc_set_event();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(a1 + 32));
}

+ (void)clearAlarm:(id)a3
{
  id v3;
  dispatch_queue_t *v4;
  NSObject *v5;
  id v6;
  dispatch_queue_t *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  dispatch_queue_t *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SESAlarm sharedObject](SESAlarm, "sharedObject");
  v4 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4[1]);
  v5 = v4[1];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __23__SESAlarm_clearAlarm___block_invoke;
  v9[3] = &unk_251CC6168;
  v6 = v3;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  dispatch_sync(v5, v9);
  SESDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_24B9C8000, v8, OS_LOG_TYPE_INFO, "Cleared alarm %@", buf, 0xCu);
  }

}

uint64_t __23__SESAlarm_clearAlarm___block_invoke(uint64_t a1)
{
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  xpc_set_event();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(a1 + 32));
}

+ (void)setAlarm:(id)a3 secondsFromNow:(double)a4
{
  id v5;
  dispatch_queue_t *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  double v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SESAlarm sharedObject](SESAlarm, "sharedObject");
  v6 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6[1]);
  v7 = v6[1];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__SESAlarm_setAlarm_secondsFromNow___block_invoke;
  v10[3] = &unk_251CC6190;
  v12 = a4;
  v8 = v5;
  v11 = v8;
  dispatch_sync(v7, v10);
  SESDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v8;
    v15 = 2048;
    v16 = (uint64_t)a4;
    _os_log_impl(&dword_24B9C8000, v9, OS_LOG_TYPE_INFO, "Event %@ scheduled in %lld seconds", buf, 0x16u);
  }

}

void __36__SESAlarm_setAlarm_secondsFromNow___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = (uint64_t)(v3 + *(double *)(a1 + 40));

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v5, "Date", 1000000000 * v4);
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  xpc_set_event();

}

+ (BOOL)isAlarmSet:(id)a3
{
  id v3;
  dispatch_queue_t *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a3;
  +[SESAlarm sharedObject](SESAlarm, "sharedObject");
  v4 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4[1]);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = v4[1];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __23__SESAlarm_isAlarmSet___block_invoke;
  v8[3] = &unk_251CC61B8;
  v9 = v3;
  v10 = &v11;
  v6 = v3;
  dispatch_sync(v5, v8);
  LOBYTE(v5) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __23__SESAlarm_isAlarmSet___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  char v4;
  void *v5;

  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v2 = (void *)xpc_copy_event();
  if (v2)
  {
    v5 = v2;
    v3 = xpc_dictionary_get_count(v2) == 0;
    v2 = v5;
    v4 = !v3;
  }
  else
  {
    v4 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pendingAlarms, 0);
  objc_storeStrong((id *)&self->registered, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end
