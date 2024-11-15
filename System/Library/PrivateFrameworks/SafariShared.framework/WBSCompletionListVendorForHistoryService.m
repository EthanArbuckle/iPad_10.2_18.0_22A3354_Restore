@implementation WBSCompletionListVendorForHistoryService

- (WBSCompletionListVendorForHistoryService)initWithDataSource:(id)a3
{
  id v4;
  WBSCompletionListVendorForHistoryService *v5;
  WBSCompletionListVendorForHistoryService *v6;
  WBSCompletionListVendorForHistoryService *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSCompletionListVendorForHistoryService;
  v5 = -[WBSCompletionListVendorForHistoryService init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    -[WBSCompletionListVendorForHistoryService _connect](v6, "_connect");
    v7 = v6;
  }

  return v6;
}

- (void)_connect
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  WBSHistoryConnectionProxy *v5;
  WBSHistoryConnectionProxy *historyProxy;
  WBSHistoryConnectionProxy *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcListener, "resume");
  v5 = objc_alloc_init(WBSHistoryConnectionProxy);
  historyProxy = self->_historyProxy;
  self->_historyProxy = v5;

  v7 = self->_historyProxy;
  -[NSXPCListener endpoint](self->_xpcListener, "endpoint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryConnectionProxy setCompletionListVendorEndpoint:completionHandler:](v7, "setCompletionListVendorEndpoint:completionHandler:", v8, &__block_literal_global_22);

}

void __52__WBSCompletionListVendorForHistoryService__connect__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXHistory();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __52__WBSCompletionListVendorForHistoryService__connect__block_invoke_cold_1(v4, v2);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Successfully sent completion list endpoint to history service.", v5, 2u);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char HasEntitlement;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "auditToken");
  HasEntitlement = WBSAuditTokenHasEntitlement();
  if ((HasEntitlement & 1) != 0)
  {
    -[WBSCompletionListVendorForHistoryService _setExportedInterfaceAndObjectForConnection:](self, "_setExportedInterfaceAndObjectForConnection:", v8);
    objc_msgSend(v8, "resume");
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSCompletionListVendorForHistoryService listener:shouldAcceptNewConnection:].cold.1(v10);
  }

  return HasEntitlement;
}

- (WBSCompletionListVendorForHistoryServiceDataSource)dataSource
{
  return (WBSCompletionListVendorForHistoryServiceDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong(&self->_completionListItemsCallback, 0);
  objc_storeStrong((id *)&self->_historyProxy, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

void __52__WBSCompletionListVendorForHistoryService__connect__block_invoke_cold_1(void *a1, void *a2)
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
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Error sending completion list endpoint to history service: %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "The completion list vendor has rejected an incoming connection due to missing entitlements.", v1, 2u);
}

@end
