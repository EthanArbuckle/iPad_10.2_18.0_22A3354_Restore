@implementation TFLogConfiguration

- (TFLogConfiguration)initWithSubsystem:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  TFLogConfiguration *v9;
  TFLogConfiguration *v10;
  OS_os_log *internalLogger;
  dispatch_queue_t v12;
  OS_dispatch_queue *internalLoggerAccessQueue;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TFLogConfiguration;
  v9 = -[TFLogConfiguration init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subsystem, a3);
    objc_storeStrong((id *)&v10->_category, a4);
    internalLogger = v10->_internalLogger;
    v10->_internalLogger = 0;

    v12 = dispatch_queue_create("com.apple.TestFlightCore.TFLogConfiguration", MEMORY[0x24BDAC9C0]);
    internalLoggerAccessQueue = v10->_internalLoggerAccessQueue;
    v10->_internalLoggerAccessQueue = (OS_dispatch_queue *)v12;

  }
  return v10;
}

+ (id)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1)
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_6);
  return (id)defaultConfiguration_configuration;
}

void __42__TFLogConfiguration_defaultConfiguration__block_invoke()
{
  TFLogConfiguration *v0;
  void *v1;

  v0 = -[TFLogConfiguration initWithSubsystem:category:]([TFLogConfiguration alloc], "initWithSubsystem:category:", CFSTR("com.apple.TestFlightCore"), CFSTR("default"));
  v1 = (void *)defaultConfiguration_configuration;
  defaultConfiguration_configuration = (uint64_t)v0;

}

- (OS_os_log)generatedLogger
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  -[TFLogConfiguration internalLoggerAccessQueue](self, "internalLoggerAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__TFLogConfiguration_generatedLogger__block_invoke;
  block[3] = &unk_24D7947E0;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v3, block);

  v5 = (void *)v12[5];
  if (!v5)
  {
    -[TFLogConfiguration internalLoggerAccessQueue](self, "internalLoggerAccessQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __37__TFLogConfiguration_generatedLogger__block_invoke_2;
    v9[3] = &unk_24D7947E0;
    v9[4] = self;
    v9[5] = &v11;
    dispatch_barrier_sync(v6, v9);

    v5 = (void *)v12[5];
  }
  v7 = v5;
  _Block_object_dispose(&v11, 8);

  return (OS_os_log *)v7;
}

void __37__TFLogConfiguration_generatedLogger__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "internalLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37__TFLogConfiguration_generatedLogger__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  const char *v6;
  id v7;
  os_log_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "internalLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "subsystem");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    objc_msgSend(*(id *)(a1 + 32), "category");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = os_log_create(v6, (const char *)objc_msgSend(v7, "UTF8String"));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(a1 + 32), "setInternalLogger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (OS_os_log)internalLogger
{
  return self->_internalLogger;
}

- (void)setInternalLogger:(id)a3
{
  objc_storeStrong((id *)&self->_internalLogger, a3);
}

- (OS_dispatch_queue)internalLoggerAccessQueue
{
  return self->_internalLoggerAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalLoggerAccessQueue, 0);
  objc_storeStrong((id *)&self->_internalLogger, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end
