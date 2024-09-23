@implementation WBSBrowsingDataImportServiceProxy

- (WBSBrowsingDataImportServiceProxy)init
{
  void *v3;
  WBSBrowsingDataImportServiceProxy *v4;

  WBSBrowsingDataImportServiceInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WBSBrowsingDataImportServiceProxy initWithInterface:](self, "initWithInterface:", v3);

  return v4;
}

- (WBSBrowsingDataImportServiceProxy)initWithInterface:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  WBSBrowsingDataImportServiceProxy *v8;

  v4 = initWithInterface__once;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&initWithInterface__once, &__block_literal_global_22);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.Safari.BrowsingDataImport"));
  objc_msgSend(v6, "setRemoteObjectInterface:", v5);

  objc_msgSend(v6, "resume");
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WBSBrowsingDataImportServiceProxy initWithConnection:proxy:](self, "initWithConnection:proxy:", v6, v7);

  return v8;
}

uint64_t __55__WBSBrowsingDataImportServiceProxy_initWithInterface___block_invoke()
{
  return xpc_add_bundle();
}

- (WBSBrowsingDataImportServiceProxy)initWithConnection:(id)a3 proxy:(id)a4
{
  id v7;
  id v8;
  WBSBrowsingDataImportServiceProxy *v9;
  WBSBrowsingDataImportServiceProxy *v10;
  WBSBrowsingDataImportServiceProxy *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSBrowsingDataImportServiceProxy;
  v9 = -[WBSBrowsingDataImportServiceProxy init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_proxy, a4);
    v11 = v10;
  }

  return v10;
}

- (id)_defaultProxyErrorHandlerWithReplyHandler:(id)a3
{
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  NSXPCConnection *v11;
  id v12;

  v4 = a3;
  v5 = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithReplyHandler___block_invoke;
  v10[3] = &unk_1E649D0E8;
  v11 = v5;
  v12 = v4;
  v6 = v5;
  v7 = v4;
  v8 = _Block_copy(v10);

  return v8;
}

void __79__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __79__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithReplyHandler___block_invoke_cold_1(v5, v3);
  }
  objc_opt_class();

}

- (id)_defaultProxyErrorHandlerWithSimpleReplyHandler:(id)a3
{
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  NSXPCConnection *v11;
  id v12;

  v4 = a3;
  v5 = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke;
  v10[3] = &unk_1E649D0E8;
  v11 = v5;
  v12 = v4;
  v6 = v5;
  v7 = v4;
  v8 = _Block_copy(v10);

  return v8;
}

void __85__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v3);
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __79__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithReplyHandler___block_invoke_cold_1(v5, v3);
  }
  objc_opt_class();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __79__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithReplyHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "XPC Proxy reported: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

@end
