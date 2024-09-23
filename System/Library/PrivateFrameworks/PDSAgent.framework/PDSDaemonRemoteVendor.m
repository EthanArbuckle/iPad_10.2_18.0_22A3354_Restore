@implementation PDSDaemonRemoteVendor

- (PDSDaemonRemoteVendor)initWithQueue:(id)a3 daemonListenerVendor:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PDSDaemonRemoteVendor *v11;
  PDSDaemonRemoteVendor *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemonRemoteVendor.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemonRemoteVendor.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("daemonListenerVendor"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PDSDaemonRemoteVendor;
  v11 = -[PDSDaemonRemoteVendor init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    objc_storeStrong((id *)&v12->_daemonListenerVendor, a4);
  }

  return v12;
}

- (id)_remoteInternalForSync:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  PDSQueueProxy *v6;
  void *v7;
  PDSQueueProxy *v8;

  v4 = !a3;
  -[PDSDaemonListenerVendor remoteInternalListener](self->_daemonListenerVendor, "remoteInternalListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PDSQueueProxy alloc];
  -[PDSDaemonRemoteVendor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PDSQueueProxy initWithTarget:queue:mode:](v6, "initWithTarget:queue:mode:", v5, v7, v4);

  return v8;
}

- (id)_remoteForSync:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  PDSQueueProxy *v6;
  void *v7;
  PDSQueueProxy *v8;

  v4 = !a3;
  -[PDSDaemonListenerVendor remoteListenerForAllClientIDs](self->_daemonListenerVendor, "remoteListenerForAllClientIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PDSQueueProxy alloc];
  -[PDSDaemonRemoteVendor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PDSQueueProxy initWithTarget:queue:mode:](v6, "initWithTarget:queue:mode:", v5, v7, v4);

  return v8;
}

- (id)internalRemoteObjectProxyWithError:(id *)a3
{
  return -[PDSDaemonRemoteVendor _remoteInternalForSync:](self, "_remoteInternalForSync:", 0);
}

- (id)remoteObjectProxyWithError:(id *)a3
{
  return -[PDSDaemonRemoteVendor _remoteForSync:](self, "_remoteForSync:", 0);
}

- (id)synchronousInternalRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PDSDaemonRemoteVendor _remoteInternalForSync:](self, "_remoteInternalForSync:", 1);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PDSDaemonRemoteVendor _remoteForSync:](self, "_remoteForSync:", 1);
}

- (BOOL)validateConnectionWithError:(id *)a3
{
  return 1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (PDSDaemonListenerVendor)daemonListenerVendor
{
  return self->_daemonListenerVendor;
}

- (void)setDaemonListenerVendor:(id)a3
{
  objc_storeStrong((id *)&self->_daemonListenerVendor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonListenerVendor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
