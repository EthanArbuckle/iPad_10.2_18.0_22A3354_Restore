@implementation _HDSPBiomeBridge

- (_HDSPBiomeBridge)init
{
  _HDSPBiomeBridge *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  uint64_t v5;
  BMBiomeScheduler *scheduler;
  _HDSPBiomeBridge *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_HDSPBiomeBridge;
  v2 = -[_HDSPBiomeBridge init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.sleep.HDSPBiomeManager.queue", v3);

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE0CB48]), "initWithIdentifier:targetQueue:waking:", CFSTR("com.apple.sleepd.biome"), v4, 1);
    scheduler = v2->_scheduler;
    v2->_scheduler = (BMBiomeScheduler *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)subscribe:(id)a3 callback:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  objc_msgSend(a3, "subscribeOn:", self->_scheduler);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39___HDSPBiomeBridge_subscribe_callback___block_invoke_294;
  v11[3] = &unk_24D4E5920;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_20, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)publish:(id)a3 stream:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = objc_opt_class();
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] publishing event: [%{public}@]", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v6, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sendEvent:", v5);
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
