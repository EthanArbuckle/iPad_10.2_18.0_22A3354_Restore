@implementation SCLInterruptBehaviorResolution

+ (id)resolutionForClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (resolutionForClientIdentifier__onceToken != -1)
    dispatch_once(&resolutionForClientIdentifier__onceToken, &__block_literal_global_5);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v5 = resolutionForClientIdentifier__lockQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SCLInterruptBehaviorResolution_resolutionForClientIdentifier___block_invoke_2;
  block[3] = &unk_24E29BC80;
  v10 = v4;
  v11 = &v13;
  v12 = a1;
  v6 = v4;
  dispatch_sync(v5, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __64__SCLInterruptBehaviorResolution_resolutionForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.schooltime.eventBehaviorResolution", v0);
  v2 = (void *)resolutionForClientIdentifier__lockQueue;
  resolutionForClientIdentifier__lockQueue = (uint64_t)v1;

  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)resolutionForClientIdentifier__resolutionByClientIdentifier;
  resolutionForClientIdentifier__resolutionByClientIdentifier = v3;

}

void __64__SCLInterruptBehaviorResolution_resolutionForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)resolutionForClientIdentifier__resolutionByClientIdentifier, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithClientIdentifier:", *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend((id)resolutionForClientIdentifier__resolutionByClientIdentifier, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (SCLInterruptBehaviorResolution)initWithClientIdentifier:(id)a3
{
  id v5;
  SCLInterruptBehaviorResolution *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *connectionQueue;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLInterruptBehaviorResolution;
  v6 = -[SCLInterruptBehaviorResolution init](&v11, sel_init);
  if (v6)
  {
    scl_interrupt_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_21E4AD000, v7, OS_LOG_TYPE_INFO, "Creating SCLInterruptBehaviorResolution for client %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_clientIdentifier, a3);
    v8 = dispatch_queue_create("com.apple.schooltime.behaviorResolutionConnection", 0);
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)v8;

  }
  return v6;
}

- (id)resolveBehaviorForEvent:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSString *clientIdentifier;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  scl_interrupt_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = clientIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_21E4AD000, v7, OS_LOG_TYPE_INFO, "Resolving behavior for client %@ event %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  -[SCLInterruptBehaviorResolution serverConnection](self, "serverConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __64__SCLInterruptBehaviorResolution_resolveBehaviorForEvent_error___block_invoke;
  v17[3] = &unk_24E29B938;
  v17[4] = buf;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_clientIdentifier;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __64__SCLInterruptBehaviorResolution_resolveBehaviorForEvent_error___block_invoke_2;
  v16[3] = &unk_24E29BCA8;
  v16[4] = &v18;
  v16[5] = buf;
  objc_msgSend(v11, "resolveBehaviorForEvent:clientIdentifier:completion:", v6, v12, v16);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    scl_interrupt_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SCLInterruptBehaviorResolution resolveBehaviorForEvent:error:].cold.1((uint64_t)v6, (uint64_t)&buf[8], v13);

  }
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(buf, 8);
  return v14;
}

void __64__SCLInterruptBehaviorResolution_resolveBehaviorForEvent_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__SCLInterruptBehaviorResolution_resolveBehaviorForEvent_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (!v7)
  {
    scl_interrupt_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_21E4AD000, v8, OS_LOG_TYPE_INFO, "Resolved behavior %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (id)serverConnection
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke;
  block[3] = &unk_24E29BB40;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
  return self->_connection;
}

void __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", 0x24E29C328, 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    SCLInterruptBehaviorResolutionXPCServerInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke_2;
    v12[3] = &unk_24E29B8C0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v12);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke_7;
    v10[3] = &unk_24E29B8C0;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v9, "setInvalidationHandler:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  scl_interrupt_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21E4AD000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setServerConnection:", 0);

}

void __50__SCLInterruptBehaviorResolution_serverConnection__block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  scl_interrupt_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21E4AD000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setServerConnection:", 0);

}

- (void)setServerConnection:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SCLInterruptBehaviorResolution_setServerConnection___block_invoke;
  block[3] = &unk_24E29B530;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__SCLInterruptBehaviorResolution_setServerConnection___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)resolveBehaviorForEvent:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_21E4AD000, log, OS_LOG_TYPE_ERROR, "Could not resolve behavior for event %@ (error:%@)", (uint8_t *)&v4, 0x16u);
}

@end
