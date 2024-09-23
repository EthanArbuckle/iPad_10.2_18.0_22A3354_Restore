@implementation RBConnectionListener

- (os_unfair_lock_s)readyClients
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (os_unfair_lock_s *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", *(_QWORD *)&v1[12]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

void __29__RBConnectionListener_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD activity_block[4];
  id v9;
  id v10;
  uint64_t v11;

  v7 = a2;
  v3 = MEMORY[0x22074C57C]();
  if (v3 == MEMORY[0x24BDACF88])
  {
    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __29__RBConnectionListener_start__block_invoke_2;
    activity_block[3] = &unk_24DD45E60;
    v9 = v7;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v10 = v5;
    v11 = v6;
    _os_activity_initiate(&dword_21A8B4000, "incoming connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
  else if (v3 == MEMORY[0x24BDACFB8])
  {
    rbs_connection_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __29__RBConnectionListener_start__block_invoke_cold_1(v7, v4);

    exit(0);
  }

}

void __29__RBConnectionListener_start__block_invoke_2(id *a1)
{
  id v2;
  uid_t v3;
  uid_t v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  audit_token_t v29;
  audit_token_t atoken;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  memset(&v29, 0, sizeof(v29));
  RBSInvalidRealAuditToken();
  xpc_connection_get_audit_token();
  memset(&atoken, 0, sizeof(atoken));
  if (RBSRealAuditTokenValid())
  {
    atoken = v29;
    v3 = audit_token_to_euid(&atoken);
    atoken = v29;
    v4 = audit_token_to_auid(&atoken);
    if (v4 + 1 >= 2)
      v5 = v4;
    else
      v5 = v3;
  }
  else
  {
    v5 = 0;
    v3 = 0;
  }
  atoken = v29;
  objc_msgSend(MEMORY[0x24BE80B30], "tokenFromAuditToken:", &atoken);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_connection_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "pid");
    atoken.val[0] = 67109632;
    atoken.val[1] = v8;
    LOWORD(atoken.val[2]) = 1024;
    *(unsigned int *)((char *)&atoken.val[2] + 2) = v3;
    HIWORD(atoken.val[3]) = 1024;
    atoken.val[4] = v5;
    _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_DEFAULT, "Incoming connection from %d, user %d/%d", (uint8_t *)&atoken, 0x14u);
  }

  objc_msgSend(a1[5], "processManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processForAuditToken:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)a1[6] + 2);
    if (!objc_msgSend(*((id *)a1[6] + 4), "count"))
    {
      v12 = os_transaction_create();
      v13 = a1[6];
      v14 = (void *)v13[8];
      v13[8] = v12;

      rbs_connection_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(atoken.val[0]) = 0;
        _os_log_impl(&dword_21A8B4000, v15, OS_LOG_TYPE_DEFAULT, "Taking Transaction as now busy with client", (uint8_t *)&atoken, 2u);
      }

    }
    objc_msgSend(*((id *)a1[6] + 5), "objectForKey:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v16 = -[RBConnectionClient initWithContext:listener:process:connection:]((id *)[RBConnectionClient alloc], a1[5], a1[6], v10, v2);
      objc_msgSend(*((id *)a1[6] + 5), "setObject:forKey:", v16, v11);
      objc_msgSend(*((id *)a1[6] + 7), "historicalStatistics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "notifyClientCount:", objc_msgSend(*((id *)a1[6] + 5), "count"));

    }
    objc_msgSend(*((id *)a1[6] + 4), "setObject:forKey:", v16, v2);
    os_unfair_lock_unlock((os_unfair_lock_t)a1[6] + 2);
    +[RBConnectionListener sharedConnectionWorkloop]();
    v18 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue((xpc_connection_t)v2, v18);

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __29__RBConnectionListener_start__block_invoke_25;
    v24[3] = &unk_24DD46DA0;
    v25 = v16;
    v19 = v2;
    v20 = a1[6];
    v26 = v19;
    v27 = v20;
    v28 = v11;
    v21 = v11;
    v22 = v16;
    xpc_connection_set_event_handler((xpc_connection_t)v19, v24);
    xpc_connection_activate((xpc_connection_t)v19);

  }
  else
  {
    rbs_connection_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __29__RBConnectionListener_start__block_invoke_2_cold_1(v6, v23);

    xpc_connection_set_event_handler((xpc_connection_t)v2, &__block_literal_global_30);
    xpc_connection_activate((xpc_connection_t)v2);
    xpc_connection_cancel((xpc_connection_t)v2);
  }

}

+ (id)sharedConnectionWorkloop
{
  objc_opt_self();
  if (sharedConnectionWorkloop_onceToken != -1)
    dispatch_once(&sharedConnectionWorkloop_onceToken, &__block_literal_global_12);
  return (id)sharedConnectionWorkloop__workloop;
}

- (void)connectionIsReady:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;

  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 8);
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

    os_unfair_lock_unlock(v3);
  }
}

void __48__RBConnectionListener_sharedConnectionWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("com.apple.runningboard.client-workloop");
  v1 = (void *)sharedConnectionWorkloop__workloop;
  sharedConnectionWorkloop__workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)sharedConnectionWorkloop__workloop);
}

- (RBConnectionListener)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBConnectionListener.m"), 63, CFSTR("-init is not allowed on RBConnectionListener"));

  return 0;
}

- (id)initWithContext:(id)a1
{
  id v4;
  void *v5;
  _DWORD *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  xpc_connection_t mach_service;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  objc_super v20;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithContext_, a1, CFSTR("RBConnectionListener.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    }
    v20.receiver = a1;
    v20.super_class = (Class)RBConnectionListener;
    v6 = objc_msgSendSuper2(&v20, sel_init);
    a1 = v6;
    if (v6)
    {
      v6[2] = 0;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create("com.apple.runningboard.listener", v7);
      v9 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v8;

      mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend((id)*MEMORY[0x24BE80DB0], "UTF8String"), *((dispatch_queue_t *)a1 + 2), 1uLL);
      v11 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = mach_service;

      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v12;

      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)*((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v14;

      v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v17 = (void *)*((_QWORD *)a1 + 6);
      *((_QWORD *)a1 + 6) = v16;

      objc_storeStrong((id *)a1 + 7, a2);
    }
  }

  return a1;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  os_unfair_lock_lock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMapTable objectEnumerator](self->_lock_connectionToClientMap, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[RBConnectionClient processIdentity](v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBConnectionClient processIdentifier](v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@:%d\n\t"), v11, objc_msgSend(v12, "pid"));

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  v13 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("<%@|  clients:[\n\t%@]>"), v14, v3);

  return (NSString *)v15;
}

- (void)start
{
  id v2;
  _xpc_connection_s *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  if (a1)
  {
    v2 = *(id *)(a1 + 56);
    v3 = *(_xpc_connection_s **)(a1 + 24);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __29__RBConnectionListener_start__block_invoke;
    v5[3] = &unk_24DD45E88;
    v6 = v2;
    v7 = a1;
    v4 = v2;
    xpc_connection_set_event_handler(v3, v5);
    xpc_connection_activate(*(xpc_connection_t *)(a1 + 24));

  }
}

void __29__RBConnectionListener_start__block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a2;
  v4 = MEMORY[0x22074C57C]();
  if (v4 == MEMORY[0x24BDACFA0])
  {
    v9 = (void *)MEMORY[0x22074BD78]();
    -[RBConnectionClient handleMessage:](*(_QWORD *)(a1 + 32), v3);
    objc_autoreleasePoolPop(v9);
  }
  else if (v4 == MEMORY[0x24BDACFB8])
  {
    xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 40), &__block_literal_global_28);
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
    -[RBConnectionClient invalidate](*(_QWORD *)(a1 + 32));
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "historicalStatistics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notifyClientCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "count"));

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "count"))
    {
      rbs_connection_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_DEFAULT, "Releasing Transaction as now without clients", v10, 2u);
      }

      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(void **)(v7 + 64);
      *(_QWORD *)(v7 + 64) = 0;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 8));
  }

}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lock_readyClients, 0);
  objc_storeStrong((id *)&self->_lock_identifierToClientMap, 0);
  objc_storeStrong((id *)&self->_lock_connectionToClientMap, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __29__RBConnectionListener_start__block_invoke_cold_1(void *a1, NSObject *a2)
{
  const char *string;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  v4 = 136315138;
  v5 = string;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Error on xpc listener connection: %s", (uint8_t *)&v4, 0xCu);
}

void __29__RBConnectionListener_start__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "pid");
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Unable to create a reference to incoming connection from %d", (uint8_t *)v3, 8u);
}

@end
