@implementation SSVSubscriptionEntitlementsCoordinator

- (SSVSubscriptionEntitlementsCoordinator)init
{
  SSVSubscriptionEntitlementsCoordinator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSVSubscriptionEntitlementsCoordinator;
  v2 = -[SSVSubscriptionEntitlementsCoordinator init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSVSubscriptionEntitlementsCoordinator", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__EntitlementsChangedNotification, kSSVNotificationSubscriptionEntitlementsChanged, 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kSSVNotificationSubscriptionEntitlementsChanged, 0);
  v4.receiver = self;
  v4.super_class = (Class)SSVSubscriptionEntitlementsCoordinator;
  -[SSVSubscriptionEntitlementsCoordinator dealloc](&v4, sel_dealloc);
}

+ (id)sharedCoordinator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SSVSubscriptionEntitlementsCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sOnce_0 != -1)
    dispatch_once(&sOnce_0, block);
  return (id)sCoordinator_0;
}

void __59__SSVSubscriptionEntitlementsCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sCoordinator_0;
  sCoordinator_0 = (uint64_t)v1;

}

- (void)getSubscriptionEntitlements:(id)a3
{
  -[SSVSubscriptionEntitlementsCoordinator getSubscriptionEntitlementsIgnoreCaches:entitlementsBlock:](self, "getSubscriptionEntitlementsIgnoreCaches:entitlementsBlock:", 0, a3);
}

- (void)getSubscriptionEntitlementsIgnoreCaches:(BOOL)a3 entitlementsBlock:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__SSVSubscriptionEntitlementsCoordinator_getSubscriptionEntitlementsIgnoreCaches_entitlementsBlock___block_invoke;
  block[3] = &unk_1E47B9FA0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __100__SSVSubscriptionEntitlementsCoordinator_getSubscriptionEntitlementsIgnoreCaches_entitlementsBlock___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_cachedSubscriptionEntitlements");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v16 = (void *)v18;
      v17 = 0;
      goto LABEL_17;
    }
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (v4)
  {
    v27 = 138412290;
    v28 = (id)objc_opt_class();
    v6 = v28;
    LODWORD(v21) = 12;
    v7 = (void *)_os_log_send_and_compose_impl();

    if (!v7)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v27, v21);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
  }

LABEL_13:
  v14 = *(void **)(a1 + 32);
  v15 = *(unsigned __int8 *)(a1 + 48);
  v26 = 0;
  objc_msgSend(v14, "_loadSubscriptionEntitlementsIgnoreCaches:error:", v15, &v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v26;
  if (!v17)
    objc_msgSend(*(id *)(a1 + 32), "_setCachedSubscriptionEntitlements:", v16);
LABEL_17:
  v19 = *(void **)(a1 + 40);
  if (v19)
  {
    dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__SSVSubscriptionEntitlementsCoordinator_getSubscriptionEntitlementsIgnoreCaches_entitlementsBlock___block_invoke_6;
    block[3] = &unk_1E47B8608;
    v25 = v19;
    v23 = v16;
    v24 = v17;
    dispatch_async(v20, block);

  }
}

uint64_t __100__SSVSubscriptionEntitlementsCoordinator_getSubscriptionEntitlementsIgnoreCaches_entitlementsBlock___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_cachedSubscriptionEntitlements
{
  SSVSubscriptionEntitlementsCoordinator *v2;
  SSVSubscriptionEntitlements *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cachedEntitlements;
  objc_sync_exit(v2);

  return v3;
}

- (id)_connection
{
  SSXPCConnection *connection;
  SSXPCConnection *v4;
  SSXPCConnection *v5;

  connection = self->_connection;
  if (!connection)
  {
    v4 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v5 = self->_connection;
    self->_connection = v4;

    connection = self->_connection;
  }
  return connection;
}

- (id)_loadSubscriptionEntitlementsIgnoreCaches:(BOOL)a3 error:(id *)a4
{
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  void *v21;
  id v22;
  uint64_t v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  __int128 v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      v11 = v9;
    else
      v11 = v9 & 2;
    if (v11)
    {
      LODWORD(v32) = 136446210;
      *(_QWORD *)((char *)&v32 + 4) = "-[SSVSubscriptionEntitlementsCoordinator _loadSubscriptionEntitlementsIgnoreCaches:error:]";
      LODWORD(v24) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v32, v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);

      }
    }
    else
    {

    }
  }
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 150);
  xpc_dictionary_set_BOOL(v20, "1", a3);
  *(_QWORD *)&v32 = 0;
  *((_QWORD *)&v32 + 1) = &v32;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__84;
  v35 = __Block_byref_object_dispose__84;
  v36 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__84;
  v30 = __Block_byref_object_dispose__84;
  v31 = 0;
  -[SSVSubscriptionEntitlementsCoordinator _connection](self, "_connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __90__SSVSubscriptionEntitlementsCoordinator__loadSubscriptionEntitlementsIgnoreCaches_error___block_invoke;
  v25[3] = &unk_1E47C0728;
  v25[4] = &v32;
  v25[5] = &v26;
  objc_msgSend(v21, "sendSynchronousMessage:withReply:", v20, v25);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v32 + 1) + 40));
  v22 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v22;
}

void __90__SSVSubscriptionEntitlementsCoordinator__loadSubscriptionEntitlementsIgnoreCaches_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SSVSubscriptionEntitlements *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  xpc_object_t xdict;

  v3 = a2;
  xdict = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v4 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
    {
      v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(xdict, "2");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithXPCEncoding:", v9);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v13 = [SSVSubscriptionEntitlements alloc];
      xpc_dictionary_get_value(xdict, "3");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SSVSubscriptionEntitlements initWithXPCEncoding:](v13, "initWithXPCEncoding:", v7);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      goto LABEL_7;
    }
    v4 = 111;
  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), v4, 0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
LABEL_7:

}

- (void)_setCachedSubscriptionEntitlements:(id)a3
{
  SSVSubscriptionEntitlementsCoordinator *v5;
  SSVSubscriptionEntitlements *v6;

  v6 = (SSVSubscriptionEntitlements *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_cachedEntitlements != v6)
    objc_storeStrong((id *)&v5->_cachedEntitlements, a3);
  objc_sync_exit(v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_cachedEntitlements, 0);
}

@end
