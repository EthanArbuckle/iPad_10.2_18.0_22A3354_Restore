@implementation TSPortInterface

- (TSPortInterface)initWithgPTPPort:(id)a3 onClockIdentifier:(unint64_t)a4
{
  id v7;
  TSPortInterface *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *notificationsQueue;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSPortInterface;
  v8 = -[TSPortInterface init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.timesync.TSPortInterface.0x%016llx.%hu.notifications"), a4, objc_msgSend(v7, "portNumber"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    notificationsQueue = v8->_notificationsQueue;
    v8->_notificationsQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v8->_port, a3);
  }

  return v8;
}

- (void)setMACLookupTimeoutCallback:(void *)a3 refcon:(void *)a4
{
  NSObject *notificationsQueue;
  _QWORD block[7];

  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__TSPortInterface_setMACLookupTimeoutCallback_refcon___block_invoke;
  block[3] = &unk_1E694B958;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

void __54__TSPortInterface_setMACLookupTimeoutCallback_refcon___block_invoke(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "port");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "port");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if (*(_QWORD *)(a1 + 40))
    {
      if (!v6)
      {
        objc_msgSend(v4, "addClient:");
        objc_msgSend(v5, "registerAsyncCallbackError:", 0);
      }
    }
    else if (v6)
    {
      objc_msgSend(v4, "deregisterAsyncCallbackError:", 0);
      objc_msgSend(v5, "removeClient:", *(_QWORD *)(a1 + 32));
    }

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 48);
}

- (void)didTimeoutOnMACLookupForPort:(id)a3
{
  id v4;
  id v5;
  NSObject *notificationsQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[TSPortInterface description](self, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315650;
    v11 = objc_msgSend(v5, "UTF8String");
    v12 = 1024;
    v13 = objc_msgSend(v4, "portNumber");
    v14 = 2048;
    v15 = objc_msgSend(v4, "clockIdentifier");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s didTimeoutOnMACLookupForPort:%hu (0x%016llx)\n", buf, 0x1Cu);

  }
  notificationsQueue = self->_notificationsQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__TSPortInterface_didTimeoutOnMACLookupForPort___block_invoke;
  v8[3] = &unk_1E694B118;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(notificationsQueue, v8);

}

void __48__TSPortInterface_didTimeoutOnMACLookupForPort___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = (void *)MEMORY[0x1B5E4E6F0]();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v4 = objc_msgSend(v3, "UTF8String");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 16);
      v7 = *(_QWORD *)(v5 + 24);
      v8 = objc_msgSend(*(id *)(a1 + 40), "portNumber");
      v9 = objc_msgSend(*(id *)(a1 + 40), "clockIdentifier");
      v17 = 136316162;
      v18 = v4;
      v19 = 2048;
      v20 = v6;
      v21 = 2048;
      v22 = v7;
      v23 = 1024;
      v24 = v8;
      v25 = 2048;
      v26 = v9;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s calling MAC lookup timeout callback function %p refcon %p port %hu (0x%016llx)\n", (uint8_t *)&v17, 0x30u);

    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "UTF8String");
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(v12 + 16);
      v14 = *(_QWORD *)(v12 + 24);
      v15 = objc_msgSend(*(id *)(a1 + 40), "portNumber");
      v16 = objc_msgSend(*(id *)(a1 + 40), "clockIdentifier");
      v17 = 136316162;
      v18 = v11;
      v19 = 2048;
      v20 = v13;
      v21 = 2048;
      v22 = v14;
      v23 = 1024;
      v24 = v15;
      v25 = 2048;
      v26 = v16;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s finished MAC lookup timeout callback function %p refcon %p port %hu (0x%016llx)\n", (uint8_t *)&v17, 0x30u);

    }
    objc_autoreleasePoolPop(v2);
  }
}

- (TSgPTPPort)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_storeStrong((id *)&self->_port, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_notificationsQueue, 0);
}

@end
