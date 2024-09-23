@implementation SiriAnalyticsXPCServiceListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  SiriAnalyticsXPCConnectionHandler *v8;
  NSString *entitlementsKey;
  OS_dispatch_queue *queue;
  id WeakRetained;
  SiriAnalyticsXPCConnectionHandler *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  int v17;
  _QWORD v18[4];
  int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "processIdentifier");
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v7 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[SiriAnalyticsXPCServiceListener listener:shouldAcceptNewConnection:]";
    v22 = 2112;
    v23 = v5;
    v24 = 1024;
    v25 = v6;
    _os_log_impl(&dword_1A025F000, v7, OS_LOG_TYPE_INFO, "%s %@ Siri Analytics Connection Connected (pid=%d])", buf, 0x1Cu);
  }
  v8 = [SiriAnalyticsXPCConnectionHandler alloc];
  entitlementsKey = self->_entitlementsKey;
  queue = self->_queue;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = -[SiriAnalyticsXPCConnectionHandler initWithConnection:entitlementsKey:queue:delegate:](v8, "initWithConnection:entitlementsKey:queue:delegate:", v5, entitlementsKey, queue, WeakRetained);

  SiriAnalyticsXPCServiceInterface();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v13);

  objc_msgSend(v5, "setExportedObject:", v12);
  v14 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__SiriAnalyticsXPCServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &__block_descriptor_36_e5_v8__0l;
  v19 = v6;
  objc_msgSend(v5, "setInvalidationHandler:", v18);
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __70__SiriAnalyticsXPCServiceListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v16[3] = &__block_descriptor_36_e5_v8__0l;
  v17 = v6;
  objc_msgSend(v5, "setInterruptionHandler:", v16);
  objc_msgSend(v5, "_setQueue:", self->_queue);
  objc_msgSend(v5, "resume");

  return 1;
}

- (SiriAnalyticsXPCServiceListener)initWithMachServiceName:(id)a3 entitlementsKey:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SiriAnalyticsXPCServiceListener *v14;
  SiriAnalyticsXPCServiceListener *v15;
  uint64_t v16;
  NSXPCListener *listener;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SiriAnalyticsXPCServiceListener;
  v14 = -[SiriAnalyticsXPCServiceListener init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_storeStrong((id *)&v15->_entitlementsKey, a4);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v10);
    listener = v15->_listener;
    v15->_listener = (NSXPCListener *)v16;

    -[NSXPCListener setDelegate:](v15->_listener, "setDelegate:", v15);
    -[NSXPCListener _setQueue:](v15->_listener, "_setQueue:", v12);
    -[NSXPCListener resume](v15->_listener, "resume");
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementsKey, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __70__SiriAnalyticsXPCServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v2 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[SiriAnalyticsXPCServiceListener listener:shouldAcceptNewConnection:]_block_invoke";
    v6 = 1024;
    v7 = v3;
    _os_log_impl(&dword_1A025F000, v2, OS_LOG_TYPE_INFO, "%s Siri Analytics Connection Invalidated (pid=%d)", (uint8_t *)&v4, 0x12u);
  }
}

void __70__SiriAnalyticsXPCServiceListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
  v2 = SiriAnalyticsLogContextXPC;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextXPC, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[SiriAnalyticsXPCServiceListener listener:shouldAcceptNewConnection:]_block_invoke";
    v6 = 1024;
    v7 = v3;
    _os_log_impl(&dword_1A025F000, v2, OS_LOG_TYPE_INFO, "%s Siri Analytics Connection Interrupted (pid=%d)", (uint8_t *)&v4, 0x12u);
  }
}

@end
