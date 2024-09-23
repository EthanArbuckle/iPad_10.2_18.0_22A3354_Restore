@implementation SocialLayerDaemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (!SLDConnectionIsEntitled(v7))
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SocialLayerDaemon listener:shouldAcceptNewConnection:].cold.1((uint64_t)v7, v10);

    goto LABEL_7;
  }
  -[SocialLayerDaemon xpcListener](self, "xpcListener");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  -[SocialLayerDaemon _acceptMainConnection:](self, "_acceptMainConnection:", v7);
  v9 = 1;
LABEL_8:

  return v9;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)_acceptMainConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id from;
  id location;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE399DF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v5);
  objc_msgSend(v4, "setExportedObject:", self);
  +[SLDServiceListenerMultiplex emptyMultiplex](SLDServiceListenerMultiplex, "emptyMultiplex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  -[SocialLayerDaemon connectionsToServicesTable](self, "connectionsToServicesTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v4);

  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __43__SocialLayerDaemon__acceptMainConnection___block_invoke;
  v13 = &unk_1E3795890;
  objc_copyWeak(&v14, &from);
  objc_copyWeak(&v15, &location);
  objc_msgSend(v4, "setInvalidationHandler:", &v10);
  SLDGlobalWorkloop();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setQueue:", v8, v10, v11, v12, v13);

  SLDaemonLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_199EFF000, v9, OS_LOG_TYPE_INFO, "Accepted a new primary client connection: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "resume");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)endpointForServiceNamed:(id)a3 reply:(id)a4
{
  NSString *v6;
  void *v7;
  void (**v8)(id, void *);
  void *v9;
  Class v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  Class v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = (void *)MEMORY[0x1E0CB3B38];
  v8 = (void (**)(id, void *))a4;
  objc_msgSend(v7, "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = NSClassFromString(v6);
  -[SocialLayerDaemon connectionsToServicesTable](self, "connectionsToServicesTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && v12
    && -[objc_class conformsToProtocol:](v10, "conformsToProtocol:", &unk_1EE38B410)
    && (objc_msgSend(v12, "endpointForServiceClass:", v10), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    SLDaemonLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_debug_impl(&dword_199EFF000, v15, OS_LOG_TYPE_DEBUG, "Returning endpoint: %@ to client: %@ for service class: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    SLDaemonLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SocialLayerDaemon endpointForServiceNamed:reply:].cold.1((uint64_t)v9, (uint64_t)v6, v15);
    v14 = 0;
  }

  v8[2](v8, v14);
}

- (NSMapTable)connectionsToServicesTable
{
  return self->_connectionsToServicesTable;
}

- (void)setupListeners
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "Error registering for Apple system language change notification: %d. We will continue without registering, but this will result in localized strings not updating when the system language changes.", (uint8_t *)v2, 8u);
}

void __35__SocialLayerDaemon_setupListeners__block_invoke(uint64_t a1)
{
  id v1;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "_appleSystemLanguageDidChange:", 0);

  objc_destroyWeak(&to);
}

+ (id)_systemUIServiceIdentifier
{
  return CFSTR("com.apple.sociallayerd");
}

- (void)_appleSystemLanguageDidChange:(id)a3
{
  NSObject *v4;

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SocialLayerDaemon _appleSystemLanguageDidChange:].cold.1(v4);

  notify_cancel(self->_appleLanguageChangeNotificationToken);
  xpc_transaction_exit_clean();
}

void __43__SocialLayerDaemon__acceptMainConnection___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_appConnectionInvalidated:", v2);

}

- (void)_appConnectionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLDaemonLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "Primary client connection invalidated: %@", (uint8_t *)&v10, 0xCu);
  }

  -[SocialLayerDaemon connectionsToServicesTable](self, "connectionsToServicesTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SocialLayerDaemon connectionsToServicesTable](self, "connectionsToServicesTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v4);

  if ((objc_msgSend(v7, "isEmpty") & 1) == 0)
  {
    -[SocialLayerDaemon multiplexesPendingRemoval](self, "multiplexesPendingRemoval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v7);

  }
}

- (void)multiplexDidRemoveAllServices:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SocialLayerDaemon multiplexesPendingRemoval](self, "multiplexesPendingRemoval");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (int)appleLanguageChangeNotificationToken
{
  return self->_appleLanguageChangeNotificationToken;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (void)setConnectionsToServicesTable:(id)a3
{
  objc_storeStrong((id *)&self->_connectionsToServicesTable, a3);
}

- (NSMutableArray)multiplexesPendingRemoval
{
  return self->_multiplexesPendingRemoval;
}

- (void)setMultiplexesPendingRemoval:(id)a3
{
  objc_storeStrong((id *)&self->_multiplexesPendingRemoval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiplexesPendingRemoval, 0);
  objc_storeStrong((id *)&self->_connectionsToServicesTable, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)_appleSystemLanguageDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_199EFF000, log, OS_LOG_TYPE_DEBUG, "Apple system language changed. Exiting so NSBundle/Foundation can regenerate cached language-dependent strings on the next process launch.", v1, 2u);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "Primary client connection (%@) does not have the right entitlement.", (uint8_t *)&v2, 0xCu);
}

- (void)endpointForServiceNamed:(os_log_t)log reply:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "Primary client connection (%@) requested endpoint for service (%@), but we could not create one", (uint8_t *)&v3, 0x16u);
}

@end
