@implementation PRSServer

- (PRSServer)init
{
  PRSServer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  PRSServer *v6;
  uint64_t v7;
  BSServiceConnectionListener *connectionListener;
  uint64_t v9;
  NSMutableArray *connections;
  _QWORD v12[4];
  PRSServer *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PRSServer;
  v2 = -[PRSServer init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.posterboardservices.Server.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (void *)MEMORY[0x1E0D03460];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __17__PRSServer_init__block_invoke;
    v12[3] = &unk_1E4D42890;
    v6 = v2;
    v13 = v6;
    objc_msgSend(v5, "listenerWithConfigurator:", v12);
    v7 = objc_claimAutoreleasedReturnValue();
    connectionListener = v6->_connectionListener;
    v6->_connectionListener = (BSServiceConnectionListener *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    connections = v6->_connections;
    v6->_connections = (NSMutableArray *)v9;

  }
  return v2;
}

void __17__PRSServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setDomain:", CFSTR("com.apple.posterboardservices"));
  PRSServiceInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *queue;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke;
  v16[3] = &unk_1E4D428E0;
  v16[4] = self;
  objc_msgSend(v6, "configureConnection:", v16);
  objc_msgSend(v6, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.migrationpluginwrapper")))
  {
    queue = self->_queue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke_8;
    block[3] = &unk_1E4D427A0;
    block[4] = self;
    v11 = v6;
    v15 = v11;
    dispatch_async(queue, block);
    PRSLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_1A4996000, v12, OS_LOG_TYPE_DEFAULT, "PRSServer received connection: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v11, "activate");
  }
  else
  {
    PRSLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1A4996000, v13, OS_LOG_TYPE_DEFAULT, "PRSServer rejected connection: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v6, "invalidate");
  }

}

void __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  PRSDefaultServiceQuality();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  PRSServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E4D428B8;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

}

void __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A4996000, v4, OS_LOG_TYPE_DEFAULT, "PRSServer received connection invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_DEFAULT, "Adding Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v4);

}

- (void)_queue_removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_DEFAULT, "Removing Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", v4);

}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)deleteDataStoreWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer deleteDataStoreWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.deleteDataStore"));

  if ((v8 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server:deleteDataStoreWithCompletion:", self, v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)triggerMessedUpDataProtectionWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer triggerMessedUpDataProtectionWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.deleteDataStore")))
  {
    v8 = MEMORY[0x1A85A40B4]("-[PRSServer triggerMessedUpDataProtectionWithCompletion:]");

    if ((v8 & 1) != 0)
    {
      -[PRSServer delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "server:triggerMessedUpDataProtectionWithCompletion:", self, v4);
LABEL_9:

      goto LABEL_10;
    }
  }
  else
  {

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)resetRole:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer resetRole:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.deleteDataStore"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:resetRole:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)invalidateDataStoreWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer invalidateDataStoreWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.deleteDataStore"));

  if ((v8 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server:invalidateDataStoreWithCompletion:", self, v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)terminate
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PRSLogPosterContents();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[PRSServer terminate]";
    _os_log_impl(&dword_1A4996000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.deleteDataStore"));

  if ((v5 & 1) != 0)
    exit(0);
}

- (void)fetchExtensionIdentifiersWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[PRSServer fetchExtensionIdentifiersWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v4)
  {
    -[PRSServer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__PRSServer_fetchExtensionIdentifiersWithCompletion___block_invoke;
    v7[3] = &unk_1E4D42908;
    v8 = v4;
    objc_msgSend(v6, "server:fetchExtensionIdentifiersWithCompletion:", self, v7);

  }
}

uint64_t __53__PRSServer_fetchExtensionIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SEL v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PRSLogPosterContents();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[PRSServer fetchPosterDescriptorsForExtension:completion:]";
    _os_log_impl(&dword_1A4996000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "auditToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRSServer delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__PRSServer_fetchPosterDescriptorsForExtension_completion___block_invoke;
    v15[3] = &unk_1E4D42930;
    v16 = v12;
    v18 = a2;
    v17 = v8;
    v14 = v12;
    objc_msgSend(v13, "server:fetchPosterDescriptorsForExtension:completion:", self, v7, v15);

  }
}

void __59__PRSServer_fetchPosterDescriptorsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = *(_QWORD *)(a1 + 32);
        v20 = 0;
        objc_msgSend(v12, "extendContentsReadAccessToAuditToken:error:", v13, &v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v20;
        if (v15)
        {
          PRSLogPosterContents();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v26 = v19;
            v27 = 2112;
            v28 = v15;
            v29 = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_1A4996000, v16, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);

          }
        }
        if (v14)
          v17 = v14;
        else
          v17 = v12;
        objc_msgSend(v6, "addObject:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchStaticPosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SEL v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PRSLogPosterContents();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[PRSServer fetchStaticPosterDescriptorsForExtension:completion:]";
    _os_log_impl(&dword_1A4996000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "auditToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRSServer delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__PRSServer_fetchStaticPosterDescriptorsForExtension_completion___block_invoke;
    v15[3] = &unk_1E4D42930;
    v16 = v12;
    v18 = a2;
    v17 = v8;
    v14 = v12;
    objc_msgSend(v13, "server:fetchStaticPosterDescriptorsForExtension:completion:", self, v7, v15);

  }
}

void __65__PRSServer_fetchStaticPosterDescriptorsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = *(_QWORD *)(a1 + 32);
        v20 = 0;
        objc_msgSend(v12, "extendContentsReadAccessToAuditToken:error:", v13, &v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v20;
        if (v15)
        {
          PRSLogPosterContents();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v26 = v19;
            v27 = 2112;
            v28 = v15;
            v29 = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_1A4996000, v16, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);

          }
        }
        if (v14)
          v17 = v14;
        else
          v17 = v12;
        objc_msgSend(v6, "addObject:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)refreshPosterDescriptorsForExtension:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  SEL v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  PRSLogPosterContents();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[PRSServer refreshPosterDescriptorsForExtension:sessionInfo:completion:]";
    _os_log_impl(&dword_1A4996000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteProcess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "auditToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__PRSServer_refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke;
    v19[3] = &unk_1E4D42930;
    v20 = v15;
    v22 = a2;
    v21 = v9;
    v16 = v15;
    v17 = (void *)MEMORY[0x1A85A457C](v19);

  }
  else
  {
    v17 = &__block_literal_global_7;
  }
  -[PRSServer delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "server:refreshPosterDescriptorsForExtension:sessionInfo:completion:", self, v11, v10, v17);

}

void __73__PRSServer_refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = *(_QWORD *)(a1 + 32);
        v20 = 0;
        objc_msgSend(v12, "extendContentsReadAccessToAuditToken:error:", v13, &v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v20;
        if (v15)
        {
          PRSLogPosterContents();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v26 = v19;
            v27 = 2112;
            v28 = v15;
            v29 = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_1A4996000, v16, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);

          }
        }
        if (v14)
          v17 = v14;
        else
          v17 = v12;
        objc_msgSend(v6, "addObject:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deletePosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[PRSServer deletePosterDescriptorsForExtension:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.deleteDescriptors"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__PRSServer_deletePosterDescriptorsForExtension_completion___block_invoke;
    v14[3] = &unk_1E4D42978;
    v15 = v7;
    objc_msgSend(v12, "server:deletePosterDescriptorsForExtension:completion:", self, v6, v14);

    v13 = v15;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __60__PRSServer_deletePosterDescriptorsForExtension_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pushToProactiveWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[PRSServer pushToProactiveWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[PRSServer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PRSServer_pushToProactiveWithCompletion___block_invoke;
  v8[3] = &unk_1E4D42978;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "server:pushToProactiveWithCompletion:", self, v8);

}

uint64_t __43__PRSServer_pushToProactiveWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pushPosterGalleryUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PRSServer pushPosterGalleryUpdate:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[PRSServer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__PRSServer_pushPosterGalleryUpdate_completion___block_invoke;
  v11[3] = &unk_1E4D42978;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "server:pushPosterGalleryUpdate:completion:", self, v7, v11);

}

uint64_t __48__PRSServer_pushPosterGalleryUpdate_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchGallery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[PRSServer fetchGallery:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[PRSServer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __26__PRSServer_fetchGallery___block_invoke;
  v8[3] = &unk_1E4D429A0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "server:fetchGallery:", self, v8);

}

uint64_t __26__PRSServer_fetchGallery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a5);
  return result;
}

- (void)retrieveGallery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[PRSServer retrieveGallery:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[PRSServer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__PRSServer_retrieveGallery___block_invoke;
  v8[3] = &unk_1E4D429A0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "server:retrieveGallery:", self, v8);

}

uint64_t __29__PRSServer_retrieveGallery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a5);
  return result;
}

- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 role:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  SEL v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  PRSLogPosterContents();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[PRSServer createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:]";
    _os_log_impl(&dword_1A4996000, v15, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remoteProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "auditToken");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __103__PRSServer_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke;
    v22[3] = &unk_1E4D429C8;
    v23 = v18;
    v25 = a2;
    v24 = v11;
    v19 = v18;
    v20 = (void *)MEMORY[0x1A85A457C](v22);

  }
  else
  {
    v20 = &__block_literal_global_18;
  }
  -[PRSServer delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "server:createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:", self, v14, v13, v12, v20);

}

void __103__PRSServer_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  objc_msgSend(v5, "extendContentsReadAccessToAuditToken:error:", v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v9)
  {
    PRSLogPosterContents();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_1A4996000, v10, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);

    }
  }
  if (v8)
    v11 = v8;
  else
    v11 = v5;
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11, v6);

}

- (void)deletePosterConfigurationsMatchingUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[PRSServer deletePosterConfigurationsMatchingUUID:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.deleteDescriptors"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__PRSServer_deletePosterConfigurationsMatchingUUID_completion___block_invoke;
    v14[3] = &unk_1E4D42978;
    v15 = v7;
    objc_msgSend(v12, "server:deletePosterConfigurationsMatchingUUID:completion:", self, v6, v14);

    v13 = v15;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __63__PRSServer_deletePosterConfigurationsMatchingUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)exportPosterConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer exportPosterConfigurationMatchingUUID:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:exportPosterConfigurationMatchingUUID:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)importPosterConfigurationFromArchiveData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer importPosterConfigurationFromArchiveData:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:importPosterConfigurationFromArchiveData:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)fetchSelectedPosterForRole:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer fetchSelectedPosterForRole:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:fetchSelectedPosterForRole:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)fetchActivePosterForRole:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[PRSServer fetchActivePosterForRole:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__PRSServer_fetchActivePosterForRole_completion___block_invoke;
    v14[3] = &unk_1E4D42A30;
    v15 = v7;
    objc_msgSend(v12, "server:fetchActivePosterForRole:completion:", self, v6, v14);

    v13 = v15;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v13);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __49__PRSServer_fetchActivePosterForRole_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchActivePosterForRole:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PRSLogPosterContents();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v14 = 136315138;
    v15 = "-[PRSServer fetchActivePosterForRole:error:]";
    _os_log_impl(&dword_1A4996000, v7, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v10 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "server:fetchActivePosterForRole:error:", self, v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)updateToSelectedPosterMatchingUUID:(id)a3 role:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  PRSLogPosterContents();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v19 = 136315138;
    v20 = "-[PRSServer updateToSelectedPosterMatchingUUID:role:completion:]";
    _os_log_impl(&dword_1A4996000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteProcess");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRSServer delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "server:updateToSelectedConfigurationMatchingUUID:role:from:completion:", self, v8, v9, v17, v10);

LABEL_7:
    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v17);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)fetchPosterConfigurationsForRole:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PRSLogPosterContents();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[PRSServer fetchPosterConfigurationsForRole:completion:]";
    _os_log_impl(&dword_1A4996000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v12 & 1) != 0)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "remoteProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "auditToken");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PRSServer delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __57__PRSServer_fetchPosterConfigurationsForRole_completion___block_invoke;
      v18[3] = &unk_1E4D42930;
      v19 = v15;
      v21 = a2;
      v20 = v8;
      v17 = v15;
      objc_msgSend(v16, "server:fetchPosterConfigurationsForRole:completion:", self, v7, v18);

LABEL_8:
    }
  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v17);
    goto LABEL_8;
  }

}

void __57__PRSServer_fetchPosterConfigurationsForRole_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = *(_QWORD *)(a1 + 32);
        v20 = 0;
        objc_msgSend(v12, "extendContentsReadAccessToAuditToken:error:", v13, &v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v20;
        if (v15)
        {
          PRSLogPosterContents();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v26 = v19;
            v27 = 2112;
            v28 = v15;
            v29 = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_1A4996000, v16, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);

          }
        }
        if (v14)
          v17 = v14;
        else
          v17 = v12;
        objc_msgSend(v6, "addObject:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchPosterConfigurationsForExtension:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PRSLogPosterContents();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[PRSServer fetchPosterConfigurationsForExtension:completion:]";
    _os_log_impl(&dword_1A4996000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v12 & 1) != 0)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "remoteProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "auditToken");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PRSServer delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __62__PRSServer_fetchPosterConfigurationsForExtension_completion___block_invoke;
      v18[3] = &unk_1E4D42930;
      v19 = v15;
      v21 = a2;
      v20 = v8;
      v17 = v15;
      objc_msgSend(v16, "server:fetchPosterConfigurationsForExtension:completion:", self, v7, v18);

LABEL_8:
    }
  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v17);
    goto LABEL_8;
  }

}

void __62__PRSServer_fetchPosterConfigurationsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = *(_QWORD *)(a1 + 32);
        v20 = 0;
        objc_msgSend(v12, "extendContentsReadAccessToAuditToken:error:", v13, &v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v20;
        if (v15)
        {
          PRSLogPosterContents();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v26 = v19;
            v27 = 2112;
            v28 = v15;
            v29 = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_1A4996000, v16, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);

          }
        }
        if (v14)
          v17 = v14;
        else
          v17 = v12;
        objc_msgSend(v6, "addObject:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchPosterSnapshotsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PRSServer fetchPosterSnapshotsWithRequest:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[PRSServer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PRSServer_fetchPosterSnapshotsWithRequest_completion___block_invoke;
  v11[3] = &unk_1E4D42A58;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "server:fetchPosterSnapshotsWithRequest:completion:", self, v7, v11);

}

uint64_t __56__PRSServer_fetchPosterSnapshotsWithRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)refreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  SEL v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PRSLogPosterContents();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[PRSServer refreshPosterConfigurationMatchingUUID:sessionInfo:completion:]";
    _os_log_impl(&dword_1A4996000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "remoteProcess");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.refreshConfigurations"));

  if ((v15 & 1) != 0)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "remoteProcess");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "auditToken");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __75__PRSServer_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke;
      v22[3] = &unk_1E4D429C8;
      v23 = v18;
      v25 = a2;
      v24 = v11;
      v19 = v18;
      v20 = (void *)MEMORY[0x1A85A457C](v22);

    }
    else
    {
      v20 = &__block_literal_global_22;
    }
    -[PRSServer delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "server:refreshPosterConfigurationMatchingUUID:sessionInfo:completion:", self, v9, v10, v20);

    goto LABEL_10;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v20);
LABEL_10:

  }
}

void __75__PRSServer_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  objc_msgSend(v5, "extendContentsReadAccessToAuditToken:error:", v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v9)
  {
    PRSLogPosterContents();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_1A4996000, v10, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);

    }
  }
  if (v8)
    v11 = v8;
  else
    v11 = v5;
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11, v6);

}

- (void)associateConfigurationMatchingUUID:(id)a3 focusModeActivityUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  PRSLogPosterContents();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v16 = 136315138;
    v17 = "-[PRSServer associateConfigurationMatchingUUID:focusModeActivityUUID:completion:]";
    _os_log_impl(&dword_1A4996000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v14 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "server:associateConfigurationMatchingUUID:focusModeActivityUUID:completion:", self, v8, v9, v10);
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v15);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)notePosterConfigurationUnderlyingModelDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer notePosterConfigurationUnderlyingModelDidChange:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if (v8)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server:notePosterConfigurationUnderlyingModelDidChange:", self, v4);

  }
}

- (void)refreshSnapshotForPosterConfigurationMatchUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer refreshSnapshotForPosterConfigurationMatchUUID:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.refreshConfigurationSnapshot"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:refreshSnapshotForPosterConfigurationMatchUUID:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)ingestSnapshotCollection:(id)a3 forPosterConfigurationUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PRSLogPosterContents();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[PRSServer ingestSnapshotCollection:forPosterConfigurationUUID:completion:]";
    _os_log_impl(&dword_1A4996000, v11, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v14 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__PRSServer_ingestSnapshotCollection_forPosterConfigurationUUID_completion___block_invoke;
    v17[3] = &unk_1E4D42978;
    v18 = v10;
    objc_msgSend(v15, "server:ingestSnapshotCollection:forPosterConfigurationUUID:completion:", self, v8, v9, v17);

    v16 = v18;
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v16);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __76__PRSServer_ingestSnapshotCollection_forPosterConfigurationUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchFocusUUIDForConfiguration:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherFocusConfiguration"));

  if ((v9 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "server:fetchFocusUUIDForConfiguration:completion:", self, v11, v6);
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v10);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)removeAllFocusConfigurationsMatchingFocusUUID:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherFocusConfiguration"));

  if ((v9 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "server:removeAllFocusConfigurationsMatchingFocusUUID:completion:", self, v11, v6);
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)fetchContentObstructionBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PRSServer delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v12, "server:fetchContentObstructionBoundsForPosterConfiguration:orientation:completion:", self, v10, v11, v8);
}

- (void)fetchMaximalContentCutoutBoundsForOrientation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PRSServer delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v9, "server:fetchMaximalContentCutoutBoundsForOrientation:completion:", self, v8, v6);
}

- (void)fetchContentCutoutBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PRSServer delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v12, "server:fetchContentCutoutBoundsForPosterConfiguration:orientation:completion:", self, v10, v11, v8);
}

- (void)fetchObscurableBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PRSServer delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v12, "server:fetchObscurableBoundsForPosterConfiguration:orientation:completion:", self, v10, v11, v8);
}

- (void)fetchLimitedOcclusionBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PRSServer delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v12, "server:fetchLimitedOcclusionBoundsForPosterConfiguration:orientation:completion:", self, v10, v11, v8);
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a3 extensionIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  PRSLogPosterContents();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v16 = 136315138;
    v17 = "-[PRSServer refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:]";
    _os_log_impl(&dword_1A4996000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v14 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "server:refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:", self, v8, v9, v10);
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v15);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)notifyActiveChargerIdentifierDidUpdate:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer notifyActiveChargerIdentifierDidUpdate:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:notifyActiveChargerIdentifierDidUpdate:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)notifyFocusModeDidChange:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer notifyFocusModeDidChange:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:notifyFocusModeDidChange:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)notifyAvailableFocusModesDidChange:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer notifyAvailableFocusModesDidChange:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:notifyAvailableFocusModesDidChange:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)prewarmWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer prewarmWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v8 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server:prewarmWithCompletion:", self, v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)overnightUpdateWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer overnightUpdateWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v8 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server:overnightUpdateWithCompletion:", self, v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)gatherDataFreshnessState:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer gatherDataFreshnessState:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v8 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server:gatherDataFreshnessState:", self, v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)deleteTransientDataWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer deleteTransientDataWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v8 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server:deleteTransientDataWithCompletion:", self, v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)deleteSnapshots:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer deleteSnapshots:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:deleteSnapshots:completion:", self, objc_msgSend(v6, "BOOLValue"), v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)notifyPosterBoardOfApplicationUpdatesWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer notifyPosterBoardOfApplicationUpdatesWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v8 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server:notifyPosterBoardOfApplicationUpdatesWithCompletion:", self, v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)fetchRuntimeAssertionState:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer fetchRuntimeAssertionState:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v8 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server:fetchRuntimeAssertionState:", self, v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)fetchChargerIdentifierRelationshipsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer fetchChargerIdentifierRelationshipsWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration")))
  {
    v8 = MEMORY[0x1A85A40B4]("-[PRSServer fetchChargerIdentifierRelationshipsWithCompletion:]");

    if ((v8 & 1) != 0)
    {
      -[PRSServer delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "server:fetchChargerIdentifierRelationshipsWithCompletion:", self, v4);
LABEL_9:

      goto LABEL_10;
    }
  }
  else
  {

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)fetchAssociatedHomeScreenPosterConfigurationUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer fetchAssociatedHomeScreenPosterConfigurationUUID:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:fetchAssociatedHomeScreenPosterConfigurationUUID:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PRSLogPosterContents();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[PRSServer updatePosterConfigurationMatchingUUID:updates:completion:]";
    _os_log_impl(&dword_1A4996000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "remoteProcess");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remoteProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.refreshConfigurations"));

    if ((v18 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "remoteProcess");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "auditToken");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[PRSServer delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __70__PRSServer_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke;
      v24[3] = &unk_1E4D42AA0;
      v25 = v21;
      v26 = v11;
      v27 = a2;
      v23 = v21;
      objc_msgSend(v22, "server:updatePosterConfigurationMatchingUUID:updates:completion:", self, v9, v10, v24);

LABEL_8:
      goto LABEL_9;
    }
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v23);
    goto LABEL_8;
  }
LABEL_9:

}

void __70__PRSServer_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v15 = 0;
    objc_msgSend(v7, "extendContentsReadAccessToAuditToken:error:", v9, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v11)
    {
      PRSLogPosterContents();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v17 = v14;
        v18 = 2112;
        v19 = v11;
        v20 = 2112;
        v21 = v7;
        _os_log_error_impl(&dword_1A4996000, v12, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);

      }
    }
    if (v10)
      v13 = v10;
    else
      v13 = v7;
    (*(void (**)(_QWORD, id, id, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v13, v8, 0);

  }
}

- (void)updatePosterConfiguration:(id)a3 updates:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PRSLogPosterContents();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[PRSServer updatePosterConfiguration:updates:completion:]";
    _os_log_impl(&dword_1A4996000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "remoteProcess");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remoteProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.refreshConfigurations"));

    if ((v18 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "remoteProcess");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "auditToken");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[PRSServer delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __58__PRSServer_updatePosterConfiguration_updates_completion___block_invoke;
      v24[3] = &unk_1E4D42AA0;
      v25 = v21;
      v26 = v11;
      v27 = a2;
      v23 = v21;
      objc_msgSend(v22, "server:updatePosterConfiguration:updates:completion:", self, v9, v10, v24);

LABEL_8:
      goto LABEL_9;
    }
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v23);
    goto LABEL_8;
  }
LABEL_9:

}

void __58__PRSServer_updatePosterConfiguration_updates_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v15 = 0;
    objc_msgSend(v7, "extendContentsReadAccessToAuditToken:error:", v9, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v11)
    {
      PRSLogPosterContents();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v17 = v14;
        v18 = 2112;
        v19 = v11;
        v20 = 2112;
        v21 = v7;
        _os_log_error_impl(&dword_1A4996000, v12, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);

      }
    }
    if (v10)
      v13 = v10;
    else
      v13 = v7;
    (*(void (**)(_QWORD, id, id, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v13, v8, 0);

  }
}

- (void)runMigration:(id)a3 migrationDescriptor:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  PRSLogPosterContents();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[PRSServer runMigration:migrationDescriptor:completion:]";
    _os_log_impl(&dword_1A4996000, v11, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "bundleIdentifier");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.migration")) & 1) != 0
    || (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("com.apple.migrationpluginwrapper")) & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "server:runMigration:migrationDescriptor:completion:", self, objc_msgSend(v8, "BOOLValue"), v9, v10);
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB28A8];
    v20 = *MEMORY[0x1E0CB2D68];
    v21 = CFSTR("bundleIdentifier");
    v18 = CFSTR("(null)");
    if (v14)
      v18 = v14;
    v22[0] = CFSTR("Process not allowed to run migration.");
    v22[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v20, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, -1, v15, v20, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v19);

  }
LABEL_7:

}

- (void)clearMigrationFlags:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PRSServer clearMigrationFlags:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.migration"));

  if ((v8 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__PRSServer_clearMigrationFlags___block_invoke;
    v11[3] = &unk_1E4D42AC8;
    v12 = v4;
    objc_msgSend(v9, "server:clearMigrationFlags:", self, v11);

    v10 = v12;
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, MEMORY[0x1E0C9AAA0], v10);
    goto LABEL_7;
  }
LABEL_8:

}

void __33__PRSServer_clearMigrationFlags___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

- (void)ignoreExtension:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer ignoreExtension:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:ignoreExtension:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)unignoreExtension:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer unignoreExtension:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:unignoreExtension:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)fetchArchivedDataStoreNamesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  PRSLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[PRSServer fetchArchivedDataStoreNamesWithCompletion:]";
    _os_log_impl(&dword_1A4996000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.archiveDataStore"));

  if ((v8 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server:fetchArchivedDataStoreNamesWithCompletion:", self, v4);
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)restoreArchivedDataStoreNamed:(id)a3 backupExistingDataStore:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  PRSLogPosterContents();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v17 = 136315138;
    v18 = "-[PRSServer restoreArchivedDataStoreNamed:backupExistingDataStore:completion:]";
    _os_log_impl(&dword_1A4996000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.archiveDataStore"));

  if ((v14 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v16 = v9;
    else
      v16 = (void *)MEMORY[0x1E0C9AAB0];
    objc_msgSend(v15, "server:restoreArchivedDataStoreNamed:backupExistingDataStore:completion:", self, v8, objc_msgSend(v16, "BOOLValue"), v10);
    goto LABEL_10;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v15);
LABEL_10:

  }
}

- (void)stashCurrentDataStoreWithName:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  PRSLogPosterContents();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v16 = 136315138;
    v17 = "-[PRSServer stashCurrentDataStoreWithName:options:completion:]";
    _os_log_impl(&dword_1A4996000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.archiveDataStore"));

  if ((v14 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "server:stashCurrentDataStoreWithName:options:completion:", self, v8, v9, v10);
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v15);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)deleteArchivedDataStoreNamed:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  PRSLogPosterContents();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[PRSServer deleteArchivedDataStoreNamed:completion:]";
    _os_log_impl(&dword_1A4996000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.archiveDataStore"));

  if ((v11 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "server:deleteArchivedDataStoreNamed:completion:", self, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)exportArchivedDataStoreNamed:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.archiveDataStore"));

  if ((v9 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "server:exportArchivedDataStoreNamed:completion:", self, v11, v6);
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v10);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)exportCurrentDataStoreToURL:(id)a3 options:(id)a4 sandboxToken:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.archiveDataStore"));

  if ((v14 & 1) != 0)
  {
    -[PRSServer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "server:exportCurrentDataStoreToURL:options:sandboxToken:error:", self, v16, v10, v11, a6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], -1, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (PRSServerDelegate)delegate
{
  return (PRSServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
