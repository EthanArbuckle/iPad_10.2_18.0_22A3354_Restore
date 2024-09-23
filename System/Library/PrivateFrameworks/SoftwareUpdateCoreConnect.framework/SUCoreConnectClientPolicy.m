@implementation SUCoreConnectClientPolicy

- (id)initForServiceName:(id)a3 delegate:(id)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreConnectClientPolicy"), CFSTR("initForServiceName:delegate: is deprecated, use initForServiceName:delegate:clientID instead"), 8123, 0);

  return 0;
}

- (id)initForServiceName:(id)a3 delegate:(id)a4 clientID:(id)a5
{
  id v9;
  id v10;
  id v11;
  SUCoreConnectClientPolicy *v12;
  SUCoreConnectClientPolicy *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *clientID;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SUCoreConnectClientPolicy;
  v12 = -[SUCoreConnectClientPolicy init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeWeak((id *)&v13->_clientDelegate, v10);
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.<%d>"), v11, objc_msgSend(v15, "processIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    clientID = v13->_clientID;
    v13->_clientID = (NSString *)v16;

    objc_storeStrong((id *)&v13->_clientIDRaw, a5);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_clientProcessIdentifier = objc_msgSend(v18, "processIdentifier");

    v13->_usesPersistentXPCConnections = 0;
  }

  return v13;
}

- (void)setProxyObjectClasses:(id)a3
{
  NSSet *v4;
  void *v5;
  NSObject *v6;
  NSSet *proxyObjectClasses;
  int v8;
  NSSet *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (NSSet *)a3;
  objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_2067B0000, v6, OS_LOG_TYPE_DEFAULT, "[SUCoreConnectClientPolicy] Setting proxy object classes: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  proxyObjectClasses = self->_proxyObjectClasses;
  self->_proxyObjectClasses = v4;

}

+ (id)_getSharedClientAccessQueue
{
  if (_getSharedClientAccessQueue_sharedClientAccessQueueOnceToken != -1)
    dispatch_once(&_getSharedClientAccessQueue_sharedClientAccessQueueOnceToken, &__block_literal_global);
  return (id)_getSharedClientAccessQueue_sharedClientAccessQueue;
}

void __56__SUCoreConnectClientPolicy__getSharedClientAccessQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.SUCoreConnect.ClientAllowlistAccessQueue"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)_getSharedClientAccessQueue_sharedClientAccessQueue;
  _getSharedClientAccessQueue_sharedClientAccessQueue = (uint64_t)v1;

}

+ (id)_getSharedClientAllowlistedClasses
{
  NSObject *v2;

  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue](SUCoreConnectClientPolicy, "_getSharedClientAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (_getSharedClientAllowlistedClasses_sharedClientAllowlistedClassesOnceToken != -1)
    dispatch_once(&_getSharedClientAllowlistedClasses_sharedClientAllowlistedClassesOnceToken, &__block_literal_global_12);
  return (id)_getSharedClientAllowlistedClasses_sharedClientAllowlistedClasses;
}

void __63__SUCoreConnectClientPolicy__getSharedClientAllowlistedClasses__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)_getSharedClientAllowlistedClasses_sharedClientAllowlistedClasses;
  _getSharedClientAllowlistedClasses_sharedClientAllowlistedClasses = (uint64_t)v0;

}

+ (id)_getAllowlistedClassesForKey:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a3;
  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue](SUCoreConnectClientPolicy, "_getSharedClientAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    +[SUCoreConnectClientPolicy _getSharedClientAllowlistedClasses](SUCoreConnectClientPolicy, "_getSharedClientAllowlistedClasses");
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

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SUCoreConnectClientPolicy _getAllowlistedClassesForKey:].cold.1(v8);

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
  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue](SUCoreConnectClientPolicy, "_getSharedClientAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue](SUCoreConnectClientPolicy, "_getSharedClientAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SUCoreConnectClientPolicy_getAllowlistedClassesForKey___block_invoke;
  v9[3] = &unk_24BFDC128;
  v10 = v3;
  v11 = &v12;
  v6 = v3;
  dispatch_sync(v5, v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__SUCoreConnectClientPolicy_getAllowlistedClassesForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[SUCoreConnectClientPolicy _getAllowlistedClassesForKey:](SUCoreConnectClientPolicy, "_getAllowlistedClassesForKey:", *(_QWORD *)(a1 + 32));
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

  +[SUCoreConnectClientPolicy setAllowlistedClasses:forKeys:](SUCoreConnectClientPolicy, "setAllowlistedClasses:forKeys:", v8, v7);
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
  +[SUCoreConnectClientPolicy setAllowlistedClasses:forKeys:](SUCoreConnectClientPolicy, "setAllowlistedClasses:forKeys:", v6, v7);

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
  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue](SUCoreConnectClientPolicy, "_getSharedClientAccessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  if (v5 && objc_msgSend(v5, "count"))
  {
    if (v10 && objc_msgSend(v10, "count"))
    {
      +[SUCoreConnectClientPolicy _getSharedClientAccessQueue](SUCoreConnectClientPolicy, "_getSharedClientAccessQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__SUCoreConnectClientPolicy_setAllowlistedClasses_forKeys___block_invoke;
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
      objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreConnectClientPolicy"), v9, 8102, 0);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEAEA50], "sharedDiag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreConnectClientPolicy"), CFSTR("Cannot set allowlisted classes for a nil/empty NSSet of keys"), 8102, 0);
  }

}

void __59__SUCoreConnectClientPolicy_setAllowlistedClasses_forKeys___block_invoke(uint64_t a1)
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

        +[SUCoreConnectClientPolicy _getAllowlistedClassesForKey:](SUCoreConnectClientPolicy, "_getAllowlistedClassesForKey:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "setByAddingObjectsFromSet:", v11);
          v12 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v12;
        }
        objc_msgSend(v10, "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 40));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[SUCoreConnectClientPolicy _getSharedClientAllowlistedClasses](SUCoreConnectClientPolicy, "_getSharedClientAllowlistedClasses");
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

  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue](SUCoreConnectClientPolicy, "_getSharedClientAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v2);

  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue](SUCoreConnectClientPolicy, "_getSharedClientAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v3, &__block_literal_global_20);

}

void __52__SUCoreConnectClientPolicy_clearAllowlistedClasses__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  +[SUCoreConnectClientPolicy _getSharedClientAllowlistedClasses](SUCoreConnectClientPolicy, "_getSharedClientAllowlistedClasses");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeAllObjects");

  objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "oslog");
  v2 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2067B0000, v2, OS_LOG_TYPE_DEFAULT, "[SUCoreConnectClientPolicy] All entries removed from allowlisted classes dictionary", v3, 2u);
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUCoreConnectClientPolicy serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectClientPolicy clientID](self, "clientID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCoreConnectClientPolicy(serviceName:%@|clientID:%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (SUCoreConnectClientDelegate)clientDelegate
{
  return (SUCoreConnectClientDelegate *)objc_loadWeakRetained((id *)&self->_clientDelegate);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientIDRaw
{
  return self->_clientIDRaw;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (NSSet)proxyObjectClasses
{
  return self->_proxyObjectClasses;
}

- (BOOL)usesPersistentXPCConnections
{
  return self->_usesPersistentXPCConnections;
}

- (void)setUsesPersistentXPCConnections:(BOOL)a3
{
  self->_usesPersistentXPCConnections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyObjectClasses, 0);
  objc_storeStrong((id *)&self->_clientIDRaw, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_destroyWeak((id *)&self->_clientDelegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

+ (void)_getAllowlistedClassesForKey:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2067B0000, log, OS_LOG_TYPE_ERROR, "[SUCoreConnectClientPolicy] Cannot get allowlisted for a nil key, returning no allowlisted classes", v1, 2u);
}

@end
