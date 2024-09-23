@implementation SiriUICardProviderRegistry

+ (id)sharedInstance
{
  if (sharedInstance_onceInitializationToken != -1)
    dispatch_once(&sharedInstance_onceInitializationToken, &__block_literal_global_11);
  return (id)sharedInstance_registry;
}

void __44__SiriUICardProviderRegistry_sharedInstance__block_invoke()
{
  SiriUICardProviderRegistry *v0;
  void *v1;

  v0 = objc_alloc_init(SiriUICardProviderRegistry);
  v1 = (void *)sharedInstance_registry;
  sharedInstance_registry = (uint64_t)v0;

}

- (void)preloadProviders
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SiriUICardProviderRegistry preloadProviders]";
    _os_log_impl(&dword_21764F000, v3, OS_LOG_TYPE_DEFAULT, "%s Enqueuing load card providers", buf, 0xCu);
  }
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SiriUICardProviderRegistry_preloadProviders__block_invoke;
  block[3] = &unk_24D7D91F8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __46__SiriUICardProviderRegistry_preloadProviders__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriUICardProviderRegistry preloadProviders]_block_invoke";
    _os_log_impl(&dword_21764F000, v2, OS_LOG_TYPE_DEFAULT, "%s Loading card providers", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "loadProviders");
}

- (void)loadProviders
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (loadProviders__onceToken != -1)
    dispatch_once(&loadProviders__onceToken, &__block_literal_global_1);
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[SiriUICardProviderRegistry loadProviders]";
    _os_log_impl(&dword_21764F000, v2, OS_LOG_TYPE_DEFAULT, "%s Card Providers loaded", (uint8_t *)&v3, 0xCu);
  }
}

void __43__SiriUICardProviderRegistry_loadProviders__block_invoke()
{
  os_log_t *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 buf;
  Class (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v0 = (os_log_t *)MEMORY[0x24BE08FB0];
  v1 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[SiriUICardProviderRegistry loadProviders]_block_invoke";
    _os_log_impl(&dword_21764F000, v1, OS_LOG_TYPE_DEFAULT, "%s starting", (uint8_t *)&buf, 0xCu);
  }
  v2 = (void *)MEMORY[0x24BE15448];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v3 = (void *)getSUICKPEntryPointClass_softClass;
  v22 = getSUICKPEntryPointClass_softClass;
  if (!getSUICKPEntryPointClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v24 = __getSUICKPEntryPointClass_block_invoke;
    v25 = &unk_24D7D9460;
    v26 = &v19;
    __getSUICKPEntryPointClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v20[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v19, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v2, "registerProvider:", v5, v19);

  v6 = (void *)MEMORY[0x24BE15448];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v7 = (void *)getINUICKPEntryPointClass_softClass;
  v22 = getINUICKPEntryPointClass_softClass;
  if (!getINUICKPEntryPointClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v24 = __getINUICKPEntryPointClass_block_invoke;
    v25 = &unk_24D7D9460;
    v26 = &v19;
    __getINUICKPEntryPointClass_block_invoke((uint64_t)&buf);
    v7 = (void *)v20[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v19, 8);
  v9 = objc_alloc_init(v8);
  objc_msgSend(v6, "registerProvider:", v9, v19);

  v10 = (void *)MEMORY[0x24BE15448];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v11 = (void *)getVSUICKPEntryPointClass_softClass;
  v22 = getVSUICKPEntryPointClass_softClass;
  if (!getVSUICKPEntryPointClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v24 = __getVSUICKPEntryPointClass_block_invoke;
    v25 = &unk_24D7D9460;
    v26 = &v19;
    __getVSUICKPEntryPointClass_block_invoke((uint64_t)&buf);
    v11 = (void *)v20[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v19, 8);
  v13 = objc_alloc_init(v12);
  objc_msgSend(v10, "registerProvider:", v13, v19);

  v14 = (void *)MEMORY[0x24BE15448];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v15 = (void *)getSCKPProviderClass_softClass;
  v22 = getSCKPProviderClass_softClass;
  if (!getSCKPProviderClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v24 = __getSCKPProviderClass_block_invoke;
    v25 = &unk_24D7D9460;
    v26 = &v19;
    __getSCKPProviderClass_block_invoke((uint64_t)&buf);
    v15 = (void *)v20[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v19, 8);
  v17 = objc_alloc_init(v16);
  objc_msgSend(v14, "registerProvider:", v17, v19);

  v18 = *v0;
  if (os_log_type_enabled(*v0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[SiriUICardProviderRegistry loadProviders]_block_invoke";
    _os_log_impl(&dword_21764F000, v18, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&buf, 0xCu);
  }
}

@end
