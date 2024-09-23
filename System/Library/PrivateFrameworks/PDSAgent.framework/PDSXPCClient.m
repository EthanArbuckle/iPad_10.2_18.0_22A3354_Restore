@implementation PDSXPCClient

- (PDSXPCClient)initWithConnection:(id)a3 interfaceVendor:(id)a4 daemonListenerVendor:(id)a5 queue:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  PDSXPCClient *v16;
  PDSXPCClient *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCClient.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCClient.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("daemonListenerVendor"));

      if (v15)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCClient.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interfaceVendor"));

  if (!v14)
    goto LABEL_10;
LABEL_4:
  if (v15)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCClient.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_5:
  v24.receiver = self;
  v24.super_class = (Class)PDSXPCClient;
  v16 = -[PDSXPCClient init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_daemonListenerVendor, a5);
    objc_storeStrong((id *)&v17->_queue, a6);
    objc_storeStrong((id *)&v17->_connection, a3);
    objc_msgSend(v12, "_setQueue:", v15);
    objc_msgSend(MEMORY[0x24BE6E510], "handShakeInterfaceFromVendor:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setExportedInterface:", v18);

    objc_msgSend(v12, "setExportedObject:", v17);
  }

  return v17;
}

- (void)resume
{
  -[PDSXPCDaemonConnection resume](self->_connection, "resume");
}

- (id)_connectionEntitledClientIDs
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[PDSXPCDaemonConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", *MEMORY[0x24BE6E528]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16[0] = v2;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_17:
        v4 = 0;
        goto LABEL_18;
      }
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v5 = v2;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_17;
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v7)
            continue;
          break;
        }
      }

      v3 = v5;
    }
    v4 = v3;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
LABEL_18:

  return v4;
}

- (BOOL)_hasToolEntitlement
{
  void *v2;
  char v3;

  -[PDSXPCDaemonConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", *MEMORY[0x24BE6E538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (void)connectWithClientID:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  if (!-[PDSXPCClient _hasToolEntitlement](self, "_hasToolEntitlement"))
  {
    -[PDSXPCClient _connectionEntitledClientIDs](self, "_connectionEntitledClientIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      if (objc_msgSend(v8, "containsObject:", v12))
      {
        -[PDSDaemonListenerVendor remoteListenerForClientIDs:](self->_daemonListenerVendor, "remoteListenerForClientIDs:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDSXPCClient setDaemonListener:](self, "setDaemonListener:", v9);

        -[PDSXPCClient daemonListener](self, "daemonListener");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v10, 0);
LABEL_9:

        goto LABEL_10;
      }
      v11 = -302;
    }
    else
    {
      v11 = -301;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], v11, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v10);
    goto LABEL_9;
  }
  -[PDSDaemonListenerVendor remoteListenerForAllClientIDs](self->_daemonListenerVendor, "remoteListenerForAllClientIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSXPCClient setDaemonListener:](self, "setDaemonListener:", v7);

  -[PDSXPCClient daemonListener](self, "daemonListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8, 0);
LABEL_10:

}

- (void)connectInternalWithCompletion:(id)a3
{
  void (**v4)(id, id, _QWORD);
  id v5;

  v4 = (void (**)(id, id, _QWORD))a3;
  if (-[PDSXPCClient _hasToolEntitlement](self, "_hasToolEntitlement"))
  {
    -[PDSDaemonListenerVendor remoteInternalListener](self->_daemonListenerVendor, "remoteInternalListener");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6E558], -304, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, id))v4)[2](v4, 0, v5);
  }

}

- (PDSRemote)daemonListener
{
  return self->_daemonListener;
}

- (void)setDaemonListener:(id)a3
{
  objc_storeStrong((id *)&self->_daemonListener, a3);
}

- (PDSDaemonListenerVendor)daemonListenerVendor
{
  return self->_daemonListenerVendor;
}

- (void)setDaemonListenerVendor:(id)a3
{
  objc_storeStrong((id *)&self->_daemonListenerVendor, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (PDSXPCDaemonConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_daemonListenerVendor, 0);
  objc_storeStrong((id *)&self->_daemonListener, 0);
}

@end
