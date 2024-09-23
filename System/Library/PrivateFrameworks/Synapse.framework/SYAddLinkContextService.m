@implementation SYAddLinkContextService

- (SYAddLinkContextService)init
{
  return (SYAddLinkContextService *)-[SYAddLinkContextService initForTesting:](self, "initForTesting:", 0);
}

- (id)initForTesting:(BOOL)a3
{
  SYAddLinkContextService *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serviceQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SYAddLinkContextService;
  v4 = -[SYAddLinkContextService init](&v9, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.synapse.AddLinkContextService", v5);
    serviceQueue = v4->__serviceQueue;
    v4->__serviceQueue = (OS_dispatch_queue *)v6;

    v4->__forTesting = a3;
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SYAddLinkContextService _listener](self, "_listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[SYAddLinkContextService _listener](self, "_listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SYAddLinkContextService set_listener:](self, "set_listener:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SYAddLinkContextService;
  -[SYAddLinkContextService dealloc](&v5, sel_dealloc);
}

- (void)beginListeningToConnections
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  -[SYAddLinkContextService _listener](self, "_listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[SYAddLinkContextService _forTesting](self, "_forTesting");
    v5 = os_log_create("com.apple.synapse", "AddLinkContext");
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "AddLinkContextService: Starting Add Link Context Service with anonymous listener for testing", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1BCC38000, v5, OS_LOG_TYPE_DEFAULT, "AddLinkContextService: Starting Add Link Context Service", v13, 2u);
      }

      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.synapse.add-link-context-service"));
    }
    v8 = (void *)v7;
    -[SYAddLinkContextService set_listener:](self, "set_listener:", v7);

    -[SYAddLinkContextService _listener](self, "_listener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYAddLinkContextService _serviceQueue](self, "_serviceQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setQueue:", v10);

    -[SYAddLinkContextService _listener](self, "_listener");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    -[SYAddLinkContextService _listener](self, "_listener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");

  }
}

- (void)userWillAddLinkWithActivityData:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[SYAddLinkContextService delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v13);
    v9 = v8;
    if (v8
      && (objc_msgSend(v8, "activityType"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB3418]),
          v10,
          v11))
    {
      -[SYAddLinkContextService delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userWillAddLinkWithActivityData:completion:", v13, v6);

    }
    else if (v6)
    {
      v6[2](v6, 0);
    }

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)userDidRemoveContentItemDatas:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SYAddLinkContextService delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SYAddLinkContextService delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userDidRemoveContentItemDatas:", v6);

  }
}

- (void)userEditDidAddContentItemDatas:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SYAddLinkContextService delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SYAddLinkContextService delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userEditDidAddContentItemDatas:", v6);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7;
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const __CFString *v16;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYAddLinkContextService.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newConnection"));

  }
  -[SYAddLinkContextService _listener](self, "_listener");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v7)
    goto LABEL_4;
  if (!-[SYAddLinkContextService _forTesting](self, "_forTesting"))
  {
    objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.synapse.allowAddLinkContextRequests"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v11, "BOOLValue"))
    {
      v18 = os_log_create("com.apple.synapse", "AddLinkContext");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SYAddLinkContextService listener:shouldAcceptNewConnection:].cold.1((uint64_t)v8, v18);

LABEL_4:
      v10 = 0;
      goto LABEL_10;
    }

  }
  -[SYAddLinkContextService _serviceQueue](self, "_serviceQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setQueue:", v12);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF496760);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedInterface:", v13);

  objc_msgSend(v8, "setExportedObject:", self);
  objc_msgSend(v8, "resume");
  v10 = 1;
LABEL_10:
  v14 = os_log_create("com.apple.synapse", "AddLinkContext");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v8, "processIdentifier");
    v16 = CFSTR("No");
    if (v10)
      v16 = CFSTR("Yes");
    *(_DWORD *)buf = 134218242;
    v21 = v15;
    v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_1BCC38000, v14, OS_LOG_TYPE_INFO, "AddLinkContextService: Listener should accept connection from pid %ld: %@", buf, 0x16u);
  }

  return v10;
}

- (id)_listenerEndpoint
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  -[SYAddLinkContextService _serviceQueue](self, "_serviceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SYAddLinkContextService__listenerEndpoint__block_invoke;
  v6[3] = &unk_1E757B730;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__SYAddLinkContextService__listenerEndpoint__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_listener");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpoint");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (SYAddLinkContextServiceDelegate)delegate
{
  return (SYAddLinkContextServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCListener)_listener
{
  return self->__listener;
}

- (void)set_listener:(id)a3
{
  objc_storeStrong((id *)&self->__listener, a3);
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
  objc_storeStrong((id *)&self->__serviceQueue, a3);
}

- (BOOL)_forTesting
{
  return self->__forTesting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "AddLinkContextService: Refusing connection from non-entitled client with connection: %@", (uint8_t *)&v2, 0xCu);
}

@end
