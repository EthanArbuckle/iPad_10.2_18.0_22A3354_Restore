@implementation SUTransactionManager

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allKeys](self->_openTransactions, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[SUTransactionManager endTransaction:](self, "endTransaction:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SUTransactionManager;
  -[SUTransactionManager dealloc](&v8, sel_dealloc);
}

- (SUTransactionManager)init
{
  SUTransactionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *openTransactions;
  NSMutableSet *v7;
  NSMutableSet *keepAliveTransactions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUTransactionManager;
  v2 = -[SUTransactionManager init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.softwareupdateservicesd.SUTransactionManager", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    openTransactions = v2->_openTransactions;
    v2->_openTransactions = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    keepAliveTransactions = v2->_keepAliveTransactions;
    v2->_keepAliveTransactions = v7;

    v2->_keepAliveClearable = 1;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___once_0 != -1)
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_7);
  return (id)sharedInstance___instance_2;
}

void __38__SUTransactionManager_sharedInstance__block_invoke()
{
  SUTransactionManager *v0;
  void *v1;

  v0 = objc_alloc_init(SUTransactionManager);
  v1 = (void *)sharedInstance___instance_2;
  sharedInstance___instance_2 = (uint64_t)v0;

}

- (void)beginTransaction:(id)a3
{
  -[SUTransactionManager beginTransaction:keepAlive:](self, "beginTransaction:keepAlive:", a3, 0);
}

- (void)beginTransaction:(id)a3 keepAlive:(BOOL)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUTransactionManager_beginTransaction_keepAlive___block_invoke;
  block[3] = &unk_24CE3C498;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(workQueue, block);

}

void __51__SUTransactionManager_beginTransaction_keepAlive___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if ((objc_msgSend(*(id *)(a1 + 32), "_hasOpenTransactionForName:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    SULogDebug(CFSTR("ERROR: trying to start a transaction with already used name %@%@"), v2, v3, v4, v5, v6, v7, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    SULogDebug(CFSTR("Beginning transaction: %@%@"), v2, v3, v4, v5, v6, v7, v8, *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("com.apple.SoftwareUpdateServices."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", *(_QWORD *)(a1 + 40));
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v12 = objc_retainAutorelease(v9);
    objc_msgSend(v12, "UTF8String");
    v11 = (void *)os_transaction_create();
    objc_msgSend(v10, "setObject:forKey:", v11, *(_QWORD *)(a1 + 40));

    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_toggleKeepAliveStatus");
    }

  }
}

- (void)endTransaction:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SUTransactionManager_endTransaction___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(workQueue, block);

}

void __39__SUTransactionManager_endTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (objc_msgSend(*(id *)(a1 + 32), "_hasOpenTransactionForName:", *(_QWORD *)(a1 + 40)))
  {
    SULogDebug(CFSTR("Ended transaction: %@"), v2, v3, v4, v5, v6, v7, v8, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_toggleKeepAliveStatus");
    }
  }
  else
  {
    SULogDebug(CFSTR("ERROR: trying to end a non existent transaction with name %@"), v2, v3, v4, v5, v6, v7, v8, *(_QWORD *)(a1 + 40));
  }
}

- (BOOL)hasOpenTransactionForName:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUTransactionManager_hasOpenTransactionForName___block_invoke;
  block[3] = &unk_24CE3C768;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(workQueue, block);
  LOBYTE(workQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)workQueue;
}

uint64_t __50__SUTransactionManager_hasOpenTransactionForName___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_hasOpenTransactionForName:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)copyTransactions
{
  NSObject *workQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__SUTransactionManager_copyTransactions__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__SUTransactionManager_copyTransactions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setKeepAliveClearable:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SUTransactionManager_setKeepAliveClearable___block_invoke;
  v4[3] = &unk_24CE3BB60;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(workQueue, v4);
}

uint64_t __46__SUTransactionManager_setKeepAliveClearable___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isKeepAliveEnabled
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__SUTransactionManager_isKeepAliveEnabled__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SUTransactionManager_isKeepAliveEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isKeepAliveEnabled:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)clearKeepAliveIfNecessary:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SUTransactionManager_clearKeepAliveIfNecessary___block_invoke;
  v4[3] = &unk_24CE3BB60;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(workQueue, v4);
}

uint64_t __50__SUTransactionManager_clearKeepAliveIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_setKeepAlive:", 0);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_setKeepAlive:", 0);
  return result;
}

- (BOOL)_hasOpenTransactionForName:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_openTransactions, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_toggleKeepAliveStatus
{
  -[SUTransactionManager _setKeepAlive:](self, "_setKeepAlive:", -[NSMutableSet count](self->_keepAliveTransactions, "count") != 0);
}

- (void)_setKeepAlive:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;

  v3 = a3;
  if (a3 || self->_keepAliveClearable)
  {
    v14 = 0;
    v4 = -[SUTransactionManager _isKeepAliveEnabled:](self, "_isKeepAliveEnabled:", &v14) ^ a3;
    if (v14 || v4 != 0)
    {
      if (vproc_swap_integer())
      {
        NSLog(CFSTR("softwareupdateservicesd could not toggle keep alive status to launchd."));
      }
      else
      {
        v13 = CFSTR("Disabled");
        if (v3)
          v13 = CFSTR("Enabled");
        SULogDebug(CFSTR("Keep alive status: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v13);
      }
    }
  }
}

- (BOOL)_isKeepAliveEnabled:(id *)a3
{
  if (vproc_swap_integer())
  {
    NSLog(CFSTR("softwareupdateservicesd could not read keep alive status from launchd."));
    +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", a3, -1);
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_keepAliveTransactions, 0);
  objc_storeStrong((id *)&self->_openTransactions, 0);
}

@end
