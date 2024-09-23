@implementation OspreyConnectionPool

- (OspreyConnectionPool)init
{
  OspreyConnectionPool *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *poolQueue;
  uint64_t v6;
  NSMapTable *connectionMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OspreyConnectionPool;
  v2 = -[OspreyConnectionPool init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("OspreyConnectionPool", v3);
    poolQueue = v2->_poolQueue;
    v2->_poolQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    connectionMap = v2->_connectionMap;
    v2->_connectionMap = (NSMapTable *)v6;

  }
  return v2;
}

- (id)connectionForConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  OspreyRPCPromise *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *poolQueue;
  OspreyRPCPromise *v12;
  id v13;
  OspreyRPCPromise *v14;
  OspreyRPCPromise *v15;
  _QWORD block[5];
  id v18;
  OspreyRPCPromise *v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OspreyLoggingInit();
  v5 = OspreyLogContextChannel;
  if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[OspreyConnectionPool connectionForConfiguration:]";
    _os_log_impl(&dword_1B97C2000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v6 = -[OspreyRPCPromise initWithFulfillmentQueue:]([OspreyRPCPromise alloc], "initWithFulfillmentQueue:", self->_poolQueue);
  objc_msgSend(v4, "urlSessionConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    OspreyLoggingInit();
    v8 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_DEBUG))
      -[OspreyConnectionPool connectionForConfiguration:].cold.2(v8);
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUrlSessionConfiguration:", v9);

  }
  OspreyLoggingInit();
  v10 = (void *)OspreyLogContextChannel;
  if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_DEBUG))
    -[OspreyConnectionPool connectionForConfiguration:].cold.1(v10, v4);
  poolQueue = self->_poolQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__OspreyConnectionPool_connectionForConfiguration___block_invoke;
  block[3] = &unk_1E7097F68;
  block[4] = self;
  v18 = v4;
  v12 = v6;
  v19 = v12;
  v13 = v4;
  dispatch_async(poolQueue, block);
  v14 = v19;
  v15 = v12;

  return v15;
}

void __51__OspreyConnectionPool_connectionForConfiguration___block_invoke(id *a1)
{
  OspreyChannel *v2;
  NSObject *v3;
  OspreyChannel *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  OspreyConnectionHandle *v8;
  id v9;
  OspreyConnectionHandle *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  OspreyChannel *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*((id *)a1[4] + 2), "objectForKey:", a1[5]);
  v2 = (OspreyChannel *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    OspreyLoggingInit();
    v3 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[OspreyConnectionPool connectionForConfiguration:]_block_invoke";
      v19 = 2112;
      v20 = v2;
      _os_log_impl(&dword_1B97C2000, v3, OS_LOG_TYPE_INFO, "%s Reused channel %@ from pool", buf, 0x16u);
    }
  }
  else
  {
    v4 = [OspreyChannel alloc];
    objc_msgSend(a1[5], "connectionUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "urlSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[OspreyChannel initWithURL:configuration:](v4, "initWithURL:configuration:", v5, v6);

    OspreyLoggingInit();
    v7 = OspreyLogContextChannel;
    if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[OspreyConnectionPool connectionForConfiguration:]_block_invoke";
      v19 = 2112;
      v20 = v2;
      _os_log_impl(&dword_1B97C2000, v7, OS_LOG_TYPE_INFO, "%s Created channel %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, a1[4]);
    v8 = [OspreyConnectionHandle alloc];
    v9 = a1[5];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __51__OspreyConnectionPool_connectionForConfiguration___block_invoke_7;
    v14 = &unk_1E7098680;
    objc_copyWeak(&v16, (id *)buf);
    v15 = a1[5];
    v10 = -[OspreyConnectionHandle initWithConnectionKey:willRelease:](v8, "initWithConnectionKey:willRelease:", v9, &v11);
    -[OspreyChannel ocp_setAssociatedHandle:](v2, "ocp_setAssociatedHandle:", v10, v11, v12, v13, v14);
    objc_msgSend(*((id *)a1[4] + 2), "setObject:forKey:", v2, a1[5]);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  objc_msgSend(a1[6], "fulfill:", v2);

}

void __51__OspreyConnectionPool_connectionForConfiguration___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  _QWORD *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  OspreyLoggingInit();
  v2 = OspreyLogContextChannel;
  if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[OspreyConnectionPool connectionForConfiguration:]_block_invoke";
    _os_log_impl(&dword_1B97C2000, v2, OS_LOG_TYPE_INFO, "%s OspreyChannel deallocated, removing handle from pool", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained[1];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__OspreyConnectionPool_connectionForConfiguration___block_invoke_8;
  v6[3] = &unk_1E7098180;
  v7 = WeakRetained;
  v8 = *(id *)(a1 + 32);
  v5 = WeakRetained;
  dispatch_async(v4, v6);

}

void __51__OspreyConnectionPool_connectionForConfiguration___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  OspreyLoggingInit();
  v2 = (void *)OspreyLogContextChannel;
  if (os_log_type_enabled((os_log_t)OspreyLogContextChannel, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v4 = v2;
    v5 = 136315394;
    v6 = "-[OspreyConnectionPool connectionForConfiguration:]_block_invoke";
    v7 = 2048;
    v8 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1B97C2000, v4, OS_LOG_TYPE_INFO, "%s Handle removed from pool, current size: %lu", (uint8_t *)&v5, 0x16u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionMap, 0);
  objc_storeStrong((id *)&self->_poolQueue, 0);
}

- (void)connectionForConfiguration:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "urlSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[OspreyConnectionPool connectionForConfiguration:]";
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1B97C2000, v3, OS_LOG_TYPE_DEBUG, "%s Using NSURLSessionConfiguration: %@", (uint8_t *)&v5, 0x16u);

}

- (void)connectionForConfiguration:(os_log_t)log .cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[OspreyConnectionPool connectionForConfiguration:]";
  _os_log_debug_impl(&dword_1B97C2000, log, OS_LOG_TYPE_DEBUG, "%s No NSURLSessionConfiguration specified, using defaultSessionConfiguration", (uint8_t *)&v1, 0xCu);
}

@end
