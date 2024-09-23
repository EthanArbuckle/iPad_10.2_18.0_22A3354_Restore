@implementation BRCThrottler

- (BRCThrottler)initWithName:(id)a3 throttleParameters:(id)a4 queue:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  BRCThrottler *v14;
  BRCThrottleBase *v15;
  BRCThrottleBase *throttle;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  dispatch_source_t v22;
  OS_dispatch_source *source;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  dispatch_block_t v28;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)BRCThrottler;
  v14 = -[BRCThrottler init](&v30, sel_init);
  if (v14)
  {
    v15 = -[BRCThrottleBase initWithName:andParameters:]([BRCThrottleBase alloc], "initWithName:andParameters:", v10, v11);
    throttle = v14->_throttle;
    v14->_throttle = v15;

    v17 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v18, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create_with_target_V2(v17, v19, v12);

    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v20;

    v22 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v12);
    source = v14->_source;
    v14->_source = (OS_dispatch_source *)v22;

    v24 = v14->_source;
    v25 = v13;
    v26 = v25;
    v27 = v25;
    if (*MEMORY[0x24BE17840])
    {
      ((void (*)(id))*MEMORY[0x24BE17840])(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v27);
    dispatch_source_set_event_handler(v24, v28);

  }
  return v14;
}

- (void)scheduleNextEvent
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__BRCThrottler_scheduleNextEvent__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_async(queue, block);
}

void __33__BRCThrottler_scheduleNextEvent__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = brc_current_date_nsec();
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "nsecsToNextRetry:retryCount:now:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 32) + 24, v2);
    if (!v3)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v2;
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __33__BRCThrottler_scheduleNextEvent__block_invoke_cold_1(v3, (uint64_t)v4, v5);

    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v7 = dispatch_time(0, v3);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__BRCThrottler_reset__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __21__BRCThrottler_reset__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = 0;
  *(_DWORD *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_source);
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_source);
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__BRCThrottler_cancel__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_async(queue, block);
}

void __22__BRCThrottler_cancel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_throttle, 0);
}

void __33__BRCThrottler_scheduleNextEvent__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  brc_interval_from_nsec();
  v6 = 134218242;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Next event will fire in %fs%@", (uint8_t *)&v6, 0x16u);
}

@end
