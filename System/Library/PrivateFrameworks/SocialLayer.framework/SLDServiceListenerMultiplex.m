@implementation SLDServiceListenerMultiplex

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)endpointForServiceClass:(Class)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class sharedService](a3, "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLDServiceListenerMultiplex _listenerForService:](self, "_listenerForService:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SLDaemonLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SLDServiceListenerMultiplex endpointForServiceClass:].cold.1();

    v6 = 0;
  }
  objc_msgSend(v6, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_listenerForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_serviceToListenerTable, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_serviceToListenerTable, "setObject:forKey:", v5, v4);
    -[NSMapTable setObject:forKey:](self->_listenerToServiceTable, "setObject:forKey:", v4, v5);
    objc_msgSend(v5, "setDelegate:", self);
    SLDGlobalWorkloop();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setQueue:", v6);

    objc_msgSend(v5, "resume");
  }
  SLDaemonLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SLDServiceListenerMultiplex _listenerForService:].cold.1();

  return v5;
}

+ (id)emptyMultiplex
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (SLDServiceListenerMultiplex)init
{
  SLDServiceListenerMultiplex *v2;
  uint64_t v3;
  NSMapTable *serviceToListenerTable;
  uint64_t v5;
  NSMapTable *listenerToServiceTable;
  uint64_t v7;
  NSMapTable *serviceToConnectionsTable;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SLDServiceListenerMultiplex;
  v2 = -[SLDServiceListenerMultiplex init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    serviceToListenerTable = v2->_serviceToListenerTable;
    v2->_serviceToListenerTable = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    listenerToServiceTable = v2->_listenerToServiceTable;
    v2->_listenerToServiceTable = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    serviceToConnectionsTable = v2->_serviceToConnectionsTable;
    v2->_serviceToConnectionsTable = (NSMapTable *)v7;

  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SLDServiceListenerMultiplex;
  -[SLDServiceListenerMultiplex description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ :::\n Services->Listeners: %@, Listeners->Services: %@, Services->Connections:%@"), v4, self->_serviceToListenerTable, self->_listenerToServiceTable, self->_serviceToConnectionsTable);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)_logFullDescription
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_199EFF000, a2, OS_LOG_TYPE_DEBUG, "%@", v4, 0xCu);

  OUTLINED_FUNCTION_6();
}

- (BOOL)isEmpty
{
  return !-[NSMapTable count](self->_listenerToServiceTable, "count")
      && !-[NSMapTable count](self->_serviceToListenerTable, "count")
      && -[NSMapTable count](self->_serviceToConnectionsTable, "count") == 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;

  v6 = a4;
  -[NSMapTable objectForKey:](self->_listenerToServiceTable, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SLDConnectionIsEntitled(v6) & 1) == 0)
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLDServiceListenerMultiplex listener:shouldAcceptNewConnection:].cold.4();
    goto LABEL_14;
  }
  if (!v7)
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLDServiceListenerMultiplex listener:shouldAcceptNewConnection:].cold.1();
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "allowsConnection:", v6) & 1) == 0)
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLDServiceListenerMultiplex listener:shouldAcceptNewConnection:].cold.3();
LABEL_14:

    v9 = 0;
    goto LABEL_15;
  }
  SLDaemonLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SLDServiceListenerMultiplex listener:shouldAcceptNewConnection:].cold.2();

  -[SLDServiceListenerMultiplex _acceptConnection:forService:](self, "_acceptConnection:forService:", v6, v7);
  -[SLDServiceListenerMultiplex _logFullDescription](self, "_logFullDescription");
  v9 = 1;
LABEL_15:

  return v9;
}

- (void)_acceptConnection:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_serviceToConnectionsTable, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_serviceToConnectionsTable, "setObject:forKey:", v8, v7);
  }
  objc_msgSend(v8, "addObject:", v6);
  objc_initWeak(&location, v6);
  objc_initWeak(&from, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__SLDServiceListenerMultiplex__acceptConnection_forService___block_invoke;
  v14[3] = &unk_1E37958B8;
  objc_copyWeak(&v16, &from);
  objc_copyWeak(&v17, &location);
  v9 = v7;
  v15 = v9;
  objc_msgSend(v6, "setInvalidationHandler:", v14);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "receivedConnection:", v6);
  v10 = (void *)MEMORY[0x1E0CB3B50];
  objc_msgSend((id)objc_opt_class(), "remoteObjectProtocol");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "interfaceWithProtocol:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_opt_class(), "setupInterface:", v12);
  objc_msgSend(v6, "setExportedObject:", v9);
  objc_msgSend(v6, "setExportedInterface:", v12);
  SLDGlobalWorkloop();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setQueue:", v13);

  objc_msgSend(v6, "resume");
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __60__SLDServiceListenerMultiplex__acceptConnection_forService___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v2)
    objc_msgSend(WeakRetained, "_service:lostConnection:", *(_QWORD *)(a1 + 32), v2);

}

- (void)_service:(id)a3 lostConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  SLDaemonLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SLDServiceListenerMultiplex _service:lostConnection:].cold.1();

  -[NSMapTable objectForKey:](self->_serviceToConnectionsTable, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v7);
  if (!objc_msgSend(v9, "count"))
  {
    -[NSMapTable removeObjectForKey:](self->_serviceToConnectionsTable, "removeObjectForKey:", v6);
    -[NSMapTable objectForKey:](self->_serviceToListenerTable, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSMapTable removeObjectForKey:](self->_serviceToListenerTable, "removeObjectForKey:", v6);
      -[NSMapTable removeObjectForKey:](self->_listenerToServiceTable, "removeObjectForKey:", v10);
      objc_msgSend(v10, "invalidate");
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "lostConnection:", v7);
  -[SLDServiceListenerMultiplex _logFullDescription](self, "_logFullDescription");
  -[SLDServiceListenerMultiplex _notifyDelegateIfEmpty](self, "_notifyDelegateIfEmpty");

}

- (void)_notifyDelegateIfEmpty
{
  void *v3;
  id v4;

  -[SLDServiceListenerMultiplex delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[SLDServiceListenerMultiplex isEmpty](self, "isEmpty"))
    {
      -[SLDServiceListenerMultiplex delegate](self, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "multiplexDidRemoveAllServices:", self);

    }
  }
}

- (SLDServiceMultiplexDelegate)delegate
{
  return (SLDServiceMultiplexDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMapTable)serviceToListenerTable
{
  return self->_serviceToListenerTable;
}

- (void)setServiceToListenerTable:(id)a3
{
  objc_storeStrong((id *)&self->_serviceToListenerTable, a3);
}

- (NSMapTable)listenerToServiceTable
{
  return self->_listenerToServiceTable;
}

- (void)setListenerToServiceTable:(id)a3
{
  objc_storeStrong((id *)&self->_listenerToServiceTable, a3);
}

- (NSMapTable)serviceToConnectionsTable
{
  return self->_serviceToConnectionsTable;
}

- (void)setServiceToConnectionsTable:(id)a3
{
  objc_storeStrong((id *)&self->_serviceToConnectionsTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceToConnectionsTable, 0);
  objc_storeStrong((id *)&self->_listenerToServiceTable, 0);
  objc_storeStrong((id *)&self->_serviceToListenerTable, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)endpointForServiceClass:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "Service class does not implement the the required SLDService protocol: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_listenerForService:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_4_3();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v2, v3, "Configured a new service listener:[%@] serviceClass:[%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "There is not a service connected to this listener: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_4_3();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v2, v3, "Accepting a new service connection: [%@] : [%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_199EFF000, v1, OS_LOG_TYPE_ERROR, "Service: %@ denied connection: %@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)listener:shouldAcceptNewConnection:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "XPC Connection does not have the proper entitlement: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_service:lostConnection:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_4_3();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_1_0(&dword_199EFF000, v2, v3, "Service connection invalidated: %@ for service class: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

@end
