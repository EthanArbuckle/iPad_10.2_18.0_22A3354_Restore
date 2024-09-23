@implementation WBSCloudHistoryServiceProxy

- (WBSCloudHistoryServiceProxy)initWithProxy:(id)a3
{
  id v5;
  WBSCloudHistoryServiceProxy *v6;
  WBSCloudHistoryServiceProxy *v7;
  WBSCloudHistoryServiceProxy *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCloudHistoryServiceProxy;
  v6 = -[WBSCloudHistoryServiceProxy init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxy, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_defaultProxyErrorHandlerWithSimpleReplyHandler:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__WBSCloudHistoryServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke;
  v7[3] = &unk_1E4B2B8A0;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A8599ED0](v7);

  return v5;
}

void __79__WBSCloudHistoryServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v3);
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __79__WBSCloudHistoryServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke_cold_1(v5, v3);
  }

}

- (void)fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler:(id)a3
{
  NSXPCProxyCreating *proxy;
  id v5;
  void *v6;
  id v7;

  proxy = self->_proxy;
  v5 = a3;
  -[WBSCloudHistoryServiceProxy _defaultProxyErrorHandlerWithSimpleReplyHandler:](self, "_defaultProxyErrorHandlerWithSimpleReplyHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler:", v5);
}

- (void)updateConfiguration:(id)a3 completionHandler:(id)a4
{
  NSXPCProxyCreating *proxy;
  id v6;
  id v7;
  id v8;

  proxy = self->_proxy;
  v6 = a4;
  v7 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateConfiguration:completionHandler:", v7, v6);

}

- (void)resetForAccountChangeWithCompletionHandler:(id)a3
{
  NSXPCProxyCreating *proxy;
  id v4;
  id v5;

  proxy = self->_proxy;
  v4 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetForAccountChangeWithCompletionHandler:", v4);

}

- (void)fetchAndMergeChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  NSXPCProxyCreating *proxy;
  id v6;
  id v7;

  v4 = a3;
  proxy = self->_proxy;
  v6 = a4;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAndMergeChangesBypassingThrottler:completionHandler:", v4, v6);

}

- (void)saveChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  NSXPCProxyCreating *proxy;
  id v6;
  id v7;

  v4 = a3;
  proxy = self->_proxy;
  v6 = a4;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveChangesBypassingThrottler:completionHandler:", v4, v6);

}

- (void)updateProfileLocalIdentifiersToServerIdentifiersMap:(id)a3 completionHandler:(id)a4
{
  NSXPCProxyCreating *proxy;
  id v6;
  id v7;
  id v8;

  proxy = self->_proxy;
  v6 = a4;
  v7 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateProfileLocalIdentifiersToServerIdentifiersMap:completionHandler:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

void __79__WBSCloudHistoryServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "XPC Proxy reported: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
