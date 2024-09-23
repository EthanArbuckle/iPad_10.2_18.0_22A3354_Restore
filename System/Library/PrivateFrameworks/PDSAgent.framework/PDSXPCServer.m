@implementation PDSXPCServer

- (PDSXPCServer)initWithServiceName:(id)a3 listenerVendor:(id)a4 interfaceVendor:(id)a5 daemonListenerVendor:(id)a6 queue:(id)a7 workloop:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PDSXPCServer *v20;
  PDSXPCServer *v21;
  uint64_t v22;
  PDSXPCListener *XPCListener;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCServer.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceName"));

    if (v15)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCServer.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("listenerVendor"));

  if (v16)
  {
LABEL_4:
    if (v17)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCServer.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interfaceVendor"));

  if (v17)
  {
LABEL_5:
    if (v18)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCServer.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v19)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCServer.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("daemonListenerVendor"));

  if (!v18)
    goto LABEL_14;
LABEL_6:
  if (v19)
    goto LABEL_7;
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCServer.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workloop"));

LABEL_7:
  v32.receiver = self;
  v32.super_class = (Class)PDSXPCServer;
  v20 = -[PDSXPCServer init](&v32, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_workloop, a8);
    objc_storeStrong((id *)&v21->_daemonListenerVendor, a6);
    objc_storeStrong((id *)&v21->_interfaceVendor, a5);
    objc_msgSend(v15, "listenerForMachService:", v14);
    v22 = objc_claimAutoreleasedReturnValue();
    XPCListener = v21->_XPCListener;
    v21->_XPCListener = (PDSXPCListener *)v22;

    -[PDSXPCListener _setQueue:](v21->_XPCListener, "_setQueue:", v18);
    -[PDSXPCListener setDelegate:](v21->_XPCListener, "setDelegate:", v21);
  }

  return v21;
}

- (void)resume
{
  -[PDSXPCListener resume](self->_XPCListener, "resume");
}

- (NSArray)connectedClients
{
  void *v2;
  void *v3;
  NSArray *v4;

  v2 = (void *)-[NSMutableArray copy](self->_XPCClients, "copy");
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *XPCClients;
  NSObject *v12;
  PDSXPCClient *v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  id location;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForEntitlement:", *MEMORY[0x24BE6E538]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
      goto LABEL_8;
  }
  objc_msgSend(v7, "valueForEntitlement:", *MEMORY[0x24BE6E528]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    pds_defaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PDSXPCServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v7, v14);
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      pds_defaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PDSXPCServer listener:shouldAcceptNewConnection:].cold.2((uint64_t)v7, (uint64_t)v9, v14);
LABEL_17:
      v16 = 0;
      goto LABEL_18;
    }
  }

LABEL_8:
  if (!self->_XPCClients)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    XPCClients = self->_XPCClients;
    self->_XPCClients = v10;

  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create_with_target_V2("com.apple.pds.xpc.clientqueue", v12, (dispatch_queue_t)self->_workloop);

  v13 = -[PDSXPCClient initWithConnection:interfaceVendor:daemonListenerVendor:queue:]([PDSXPCClient alloc], "initWithConnection:interfaceVendor:daemonListenerVendor:queue:", v7, self->_interfaceVendor, self->_daemonListenerVendor, v9);
  -[NSMutableArray addObject:](self->_XPCClients, "addObject:", v13);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __51__PDSXPCServer_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &unk_24D4A6EC0;
  objc_copyWeak(&v20, &location);
  v14 = v13;
  v19 = v14;
  objc_msgSend(v7, "setInvalidationHandler:", v18);
  pds_defaultLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    _os_log_impl(&dword_215E64000, v15, OS_LOG_TYPE_DEFAULT, "Allowing PDS Client connection {newConnection: %@}", buf, 0xCu);
  }

  -[NSObject resume](v14, "resume");
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  v16 = 1;
LABEL_18:

  return v16;
}

void __51__PDSXPCServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    pds_defaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_215E64000, v3, OS_LOG_TYPE_DEFAULT, "PDS Client went invalid {client: %@}", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(WeakRetained, "XPCClients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

  }
}

- (PDSXPCListener)XPCListener
{
  return self->_XPCListener;
}

- (void)setXPCListener:(id)a3
{
  objc_storeStrong((id *)&self->_XPCListener, a3);
}

- (PDSXPCInterfaceVendor)interfaceVendor
{
  return self->_interfaceVendor;
}

- (void)setInterfaceVendor:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceVendor, a3);
}

- (PDSDaemonListenerVendor)daemonListenerVendor
{
  return self->_daemonListenerVendor;
}

- (void)setDaemonListenerVendor:(id)a3
{
  objc_storeStrong((id *)&self->_daemonListenerVendor, a3);
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
  objc_storeStrong((id *)&self->_workloop, a3);
}

- (NSMutableArray)XPCClients
{
  return self->_XPCClients;
}

- (void)setXPCClients:(id)a3
{
  objc_storeStrong((id *)&self->_XPCClients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCClients, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_daemonListenerVendor, 0);
  objc_storeStrong((id *)&self->_interfaceVendor, 0);
  objc_storeStrong((id *)&self->_XPCListener, 0);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215E64000, a2, OS_LOG_TYPE_ERROR, "PDS Client connection missing entitlement -- rejecting {newConnection: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_215E64000, log, OS_LOG_TYPE_ERROR, "PDS Client connection has invalid entitlement type -- rejecting {clientIDEntitlement: %@, newConnection: %@}", (uint8_t *)&v3, 0x16u);
}

@end
