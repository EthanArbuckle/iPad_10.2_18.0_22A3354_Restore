@implementation WBSHistoryServiceDatabaseDelegateProxy

- (WBSHistoryServiceDatabaseDelegateProxy)initWithProxy:(id)a3
{
  id v5;
  WBSHistoryServiceDatabaseDelegateProxy *v6;
  WBSHistoryServiceDatabaseDelegateProxy *v7;
  WBSHistoryServiceDatabaseDelegateProxy *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceDatabaseDelegateProxy;
  v6 = -[WBSHistoryServiceDatabaseDelegateProxy init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxy, a3);
    v8 = v7;
  }

  return v7;
}

- (WBSHistoryServiceDatabaseDelegateProxy)init
{

  return 0;
}

- (void)reportPermanentIDsForItems:(id)a3 completionHandler:(id)a4
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
  objc_msgSend(v8, "reportPermanentIDsForItems:completionHandler:", v7, v6);

}

- (void)reportPermanentIDsForVisits:(id)a3 completionHandler:(id)a4
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
  objc_msgSend(v8, "reportPermanentIDsForVisits:completionHandler:", v7, v6);

}

- (void)reportSevereError:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCProxyCreating *proxy;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  proxy = self->_proxy;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__WBSHistoryServiceDatabaseDelegateProxy_reportSevereError_completionHandler___block_invoke;
  v11[3] = &unk_1E4B2B8A0;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](proxy, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportSevereError:completionHandler:", v9, v8);

}

uint64_t __78__WBSHistoryServiceDatabaseDelegateProxy_reportSevereError_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleEvent:(id)a3 completionHandler:(id)a4
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
  objc_msgSend(v8, "handleEvent:completionHandler:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
