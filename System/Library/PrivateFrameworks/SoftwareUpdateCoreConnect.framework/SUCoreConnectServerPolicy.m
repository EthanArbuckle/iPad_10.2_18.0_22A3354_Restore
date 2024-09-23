@implementation SUCoreConnectServerPolicy

- (SUCoreConnectServerPolicy)initWithServiceName:(id)a3 entitlements:(id)a4 serverDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SUCoreConnectServerPolicy *v12;
  SUCoreConnectServerPolicy *v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *connectionQueue;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *delegateQueue;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SUCoreConnectServerPolicy;
  v12 = -[SUCoreConnectServerPolicy init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeStrong((id *)&v13->_entitlements, a4);
    objc_storeWeak((id *)&v13->_serverDelegate, v11);
    v14 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ConnectionQueue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    connectionQueue = v13->_connectionQueue;
    v13->_connectionQueue = (OS_dispatch_queue *)v16;

    v18 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ServerDelegateQueue"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    delegateQueue = v13->_delegateQueue;
    v13->_delegateQueue = (OS_dispatch_queue *)v20;

  }
  return v13;
}

+ (id)_getSharedServerAccessQueue
{
  if (_getSharedServerAccessQueue_sharedServerAccessQueueOnceToken != -1)
    dispatch_once(&_getSharedServerAccessQueue_sharedServerAccessQueueOnceToken, &__block_literal_global_0);
  return (id)_getSharedServerAccessQueue_sharedServerAccessQueue;
}

void __56__SUCoreConnectServerPolicy__getSharedServerAccessQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ServerAllowlistAccessQueue"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)_getSharedServerAccessQueue_sharedServerAccessQueue;
  _getSharedServerAccessQueue_sharedServerAccessQueue = (uint64_t)v1;

}

+ (id)_getSharedServerAllowlistedClasses
{
  NSObject *v2;

  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue](SUCoreConnectServerPolicy, "_getSharedServerAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (_getSharedServerAllowlistedClasses_sharedServerAllowlistedClassesOnceToken != -1)
    dispatch_once(&_getSharedServerAllowlistedClasses_sharedServerAllowlistedClassesOnceToken, &__block_literal_global_6);
  return (id)_getSharedServerAllowlistedClasses_sharedServerAllowlistedClasses;
}

void __63__SUCoreConnectServerPolicy__getSharedServerAllowlistedClasses__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)_getSharedServerAllowlistedClasses_sharedServerAllowlistedClasses;
  _getSharedServerAllowlistedClasses_sharedServerAllowlistedClasses = (uint64_t)v0;

}

+ (id)_getAllowlistedClassesForKey:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue](SUCoreConnectServerPolicy, "_getSharedServerAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    +[SUCoreConnectServerPolicy _getSharedServerAllowlistedClasses](SUCoreConnectServerPolicy, "_getSharedServerAllowlistedClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeObjectForKey:ofClass:", v3, objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2067B0000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConnectServerPolicy] Cannot get allowlisted for a nil key, returning no allowlisted classes", v10, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)getAllowlistedClassesForKey:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue](SUCoreConnectServerPolicy, "_getSharedServerAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue](SUCoreConnectServerPolicy, "_getSharedServerAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SUCoreConnectServerPolicy_getAllowlistedClassesForKey___block_invoke;
  v9[3] = &unk_24BFDC128;
  v10 = v3;
  v11 = &v12;
  v6 = v3;
  dispatch_sync(v5, v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__SUCoreConnectServerPolicy_getAllowlistedClassesForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[SUCoreConnectServerPolicy _getAllowlistedClassesForKey:](SUCoreConnectServerPolicy, "_getAllowlistedClassesForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)setAllowlistedClass:(Class)a3 forKey:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = a4;
  objc_msgSend(v5, "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUCoreConnectServerPolicy setAllowlistedClasses:forKeys:](SUCoreConnectServerPolicy, "setAllowlistedClasses:forKeys:", v8, v7);
}

+ (void)setAllowlistedClasses:(id)a3 forKey:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = a3;
  objc_msgSend(v5, "setWithObject:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SUCoreConnectServerPolicy setAllowlistedClasses:forKeys:](SUCoreConnectServerPolicy, "setAllowlistedClasses:forKeys:", v6, v7);

}

+ (void)setAllowlistedClasses:(id)a3 forKeys:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  v10 = a3;
  v5 = a4;
  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue](SUCoreConnectServerPolicy, "_getSharedServerAccessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  if (v5 && objc_msgSend(v5, "count"))
  {
    if (v10 && objc_msgSend(v10, "count"))
    {
      +[SUCoreConnectServerPolicy _getSharedServerAccessQueue](SUCoreConnectServerPolicy, "_getSharedServerAccessQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__SUCoreConnectServerPolicy_setAllowlistedClasses_forKeys___block_invoke;
      block[3] = &unk_24BFDC150;
      v12 = v5;
      v13 = v10;
      dispatch_sync(v7, block);

      v8 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot set nil/empty NSSet of classes for keys %@"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreConnectServerPolicy"), v9, 8102, 0);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreConnectServerPolicy"), CFSTR("Cannot set allowlisted classes for a nil/empty NSSet of keys"), 8102, 0);
  }

}

void __59__SUCoreConnectServerPolicy_setAllowlistedClasses_forKeys___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x20BCFCF90]();
        v8 = (void *)MEMORY[0x24BDBCF20];
        +[SUCoreConnectConstants defaultClasses](SUCoreConnectConstants, "defaultClasses");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setWithArray:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        +[SUCoreConnectServerPolicy _getAllowlistedClassesForKey:](SUCoreConnectServerPolicy, "_getAllowlistedClassesForKey:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "setByAddingObjectsFromSet:", v11);
          v12 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v12;
        }
        objc_msgSend(v10, "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 40));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[SUCoreConnectServerPolicy _getSharedServerAllowlistedClasses](SUCoreConnectServerPolicy, "_getSharedServerAllowlistedClasses");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSafeObject:forKey:", v13, v6);

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

+ (void)clearAllowlistedClasses
{
  NSObject *v2;
  NSObject *v3;

  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue](SUCoreConnectServerPolicy, "_getSharedServerAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v2);

  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue](SUCoreConnectServerPolicy, "_getSharedServerAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v3, &__block_literal_global_19);

}

void __52__SUCoreConnectServerPolicy_clearAllowlistedClasses__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  +[SUCoreConnectServerPolicy _getSharedServerAllowlistedClasses](SUCoreConnectServerPolicy, "_getSharedServerAllowlistedClasses");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeAllObjects");

  objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "oslog");
  v2 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2067B0000, v2, OS_LOG_TYPE_DEFAULT, "[SUCoreConnectServerPolicy] All entries removed from allowlisted classes dictionary", v3, 2u);
  }

}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SUCoreConnectServerPolicy serviceName](self, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SUCoreConnectServerPolicy(serviceName:%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSSet)entitlements
{
  return self->_entitlements;
}

- (SUCoreConnectServerDelegate)serverDelegate
{
  return (SUCoreConnectServerDelegate *)objc_loadWeakRetained((id *)&self->_serverDelegate);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_destroyWeak((id *)&self->_serverDelegate);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
