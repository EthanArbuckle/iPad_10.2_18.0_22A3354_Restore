@implementation SDMigrationMonitor

- (void)suspendMigrationQueue
{
  dispatch_suspend((dispatch_object_t)self->_queue);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_8);
  return (id)sharedInstance_sSDMigrationMonitor;
}

void __36__SDMigrationMonitor_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sSDMigrationMonitor;
  sharedInstance_sSDMigrationMonitor = v0;

}

- (SDMigrationMonitor)init
{
  SDMigrationMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDMigrationMonitor;
  v2 = -[SDMigrationMonitor init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.searchd.migrationMonitor", v3);
    -[SDMigrationMonitor setQueue:](v2, "setQueue:", v4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__didFindExtensions_, *MEMORY[0x24BDC24F0], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDC24F0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SDMigrationMonitor;
  -[SDMigrationMonitor dealloc](&v4, sel_dealloc);
}

- (void)resumeMigrationQueue
{
  dispatch_resume((dispatch_object_t)self->_queue);
}

- (void)_didFindExtensions:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SDMigrationMonitor__didFindExtensions___block_invoke;
  block[3] = &unk_24D0EA758;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __41__SDMigrationMonitor__didFindExtensions___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 9))
  {
    v1 = result;
    logForCSLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "SDMigrationMonitor found index extensions", v4, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 9) = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", *(_QWORD *)(v1 + 32), *MEMORY[0x24BDC24F0], 0);

    return objc_msgSend(*(id *)(v1 + 32), "_finishMigration");
  }
  return result;
}

- (void)_finishMigration
{
  NSObject *v3;
  void *completionBlock;
  NSObject *v5;
  _BOOL4 unlocked;
  _BOOL4 foundExtensions;
  _BOOL4 finishedDataMigration;
  id v9;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_unlocked && self->_foundExtensions && self->_finishedDataMigration && self->_completionBlock)
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "### SDMigrationMonitor _finishMigration", (uint8_t *)v10, 2u);
    }

    (*((void (**)(void))self->_completionBlock + 2))();
    completionBlock = self->_completionBlock;
    self->_completionBlock = 0;
  }
  else
  {
    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unlocked = self->_unlocked;
      foundExtensions = self->_foundExtensions;
      finishedDataMigration = self->_finishedDataMigration;
      v9 = self->_completionBlock;
      v10[0] = 67109888;
      v10[1] = unlocked;
      v11 = 1024;
      v12 = foundExtensions;
      v13 = 1024;
      v14 = finishedDataMigration;
      v15 = 1024;
      v16 = (int)v9;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "### SDMigrationMonitor unlocked: %d, foundExtensions: %d, migrationFinished: %d, completion: %d", (uint8_t *)v10, 0x1Au);
    }

    +[SDLockHandler sharedLockHandler](SDLockHandler, "sharedLockHandler");
    completionBlock = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(completionBlock, "checkMigrationComplete");
  }

}

- (void)unlock
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "### SDMigrationMonitor unlock", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__SDMigrationMonitor_unlock__block_invoke;
  block[3] = &unk_24D0EA758;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __28__SDMigrationMonitor_unlock__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    logForCSLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "SDMigrationMonitor unlocked", v3, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 8) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_finishMigration");
  }
  return result;
}

- (void)monitorDataMigrationWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke;
  v7[3] = &unk_24D0EB780;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *, void *, void *);
  void *v10;
  uint64_t v11;
  id v12;

  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke_2;
  v10 = &unk_24D0EDBF8;
  v2 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v2;
  v3 = (void *)MEMORY[0x2199C2F34](&v7);
  +[SDEventMonitor sharedInstance](SDEventMonitor, "sharedInstance", v7, v8, v9, v10, v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterHandler:forEventName:", v6, CFSTR("com.apple.datamigrator.migrationDidFinish"));

  }
  objc_msgSend(*(id *)(a1 + 32), "setEventHandler:", v3);
  objc_msgSend(v4, "registerHandler:forEventName:", v3, CFSTR("com.apple.datamigrator.migrationDidFinish"));

}

void __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    logForCSLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_error_impl(&dword_213CF1000, v11, OS_LOG_TYPE_ERROR, "SDMigrationMonitor received an error for \"%@\", userInfo:%@, error:%@", buf, 0x20u);
    }

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v14 = *(NSObject **)(v12 + 16);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke_9;
    v15[3] = &unk_24D0EB780;
    v15[4] = v12;
    v16 = v13;
    dispatch_async(v14, v15);

  }
}

uint64_t __62__SDMigrationMonitor_monitorDataMigrationWithCompletionBlock___block_invoke_9(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 10))
  {
    v1 = result;
    logForCSLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "SDMigrationMonitor was notified of data migration completion", v9, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 10) = 1;
    v3 = MEMORY[0x2199C2F34](*(_QWORD *)(v1 + 40));
    v4 = *(_QWORD *)(v1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    +[SDEventMonitor sharedInstance](SDEventMonitor, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 32), "eventHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterHandler:forEventName:", v7, CFSTR("com.apple.datamigrator.migrationDidFinish"));

    objc_msgSend(*(id *)(v1 + 32), "setEventHandler:", 0);
    +[SDLockHandler sharedLockHandler](SDLockHandler, "sharedLockHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceMigrationComplete");

    return objc_msgSend(*(id *)(v1 + 32), "_finishMigration");
  }
  return result;
}

- (void)registerHandlerWithEventMonitor:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[SDMigrationMonitor registerHandlerWithEventMonitor:]", "SDMigrationMonitor.m", 129, "0");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)unlocked
{
  return self->_unlocked;
}

- (void)setUnlocked:(BOOL)a3
{
  self->_unlocked = a3;
}

- (BOOL)foundExtensions
{
  return self->_foundExtensions;
}

- (void)setFoundExtensions:(BOOL)a3
{
  self->_foundExtensions = a3;
}

- (BOOL)finishedDataMigration
{
  return self->_finishedDataMigration;
}

- (void)setFinishedDataMigration:(BOOL)a3
{
  self->_finishedDataMigration = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
