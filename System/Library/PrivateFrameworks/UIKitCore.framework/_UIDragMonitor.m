@implementation _UIDragMonitor

- (_UIDragMonitor)initWithMachServiceName:(id)a3
{
  id v4;
  _UIDragMonitor *v5;
  uint64_t v6;
  NSString *serviceName;
  uint64_t v8;
  NSXPCListener *xpcListener;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *xpcQueue;
  uint64_t v13;
  NSMutableArray *activeConnections;
  _UIDragMonitorSessionLifecyleListener *v15;
  _UIDragMonitorSessionLifecyleListener *lifecycleListener;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_UIDragMonitor;
  v5 = -[_UIDragMonitor init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v4);
    xpcListener = v5->_xpcListener;
    v5->_xpcListener = (NSXPCListener *)v8;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.UIKit.uidragmonitor.xpcQueue", v10);
    xpcQueue = v5->_xpcQueue;
    v5->_xpcQueue = (OS_dispatch_queue *)v11;

    -[NSXPCListener _setQueue:](v5->_xpcListener, "_setQueue:", v5->_xpcQueue);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    activeConnections = v5->_activeConnections;
    v5->_activeConnections = (NSMutableArray *)v13;

    v15 = -[_UIDragMonitorSessionLifecyleListener initWithDragMonitor:]([_UIDragMonitorSessionLifecyleListener alloc], "initWithDragMonitor:", v5);
    lifecycleListener = v5->_lifecycleListener;
    v5->_lifecycleListener = v15;

  }
  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  _DUIDragSessionLifecycleListeningInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  -[_UIDragMonitor activeConnections](self, "activeConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v7);

  -[_UIDragMonitor lifecycleListener](self, "lifecycleListener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedObject:", v10);

  -[_UIDragMonitor xpcQueue](self, "xpcQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setQueue:", v11);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __53___UIDragMonitor_listener_shouldAcceptNewConnection___block_invoke;
  v16 = &unk_1E16B2358;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  objc_msgSend(v7, "setInvalidationHandler:", &v13);
  objc_msgSend(v7, "resume", v13, v14, v15, v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)setDelegate:(id)a3
{
  _UIDragMonitorDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  -[_UIDragMonitor lifecycleListener](self, "lifecycleListener");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

}

- (void)activate
{
  void *v3;
  id v4;

  -[_UIDragMonitor xpcListener](self, "xpcListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[_UIDragMonitor xpcListener](self, "xpcListener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activate");

}

- (void)invalidate
{
  void *v3;

  -[_UIDragMonitor xpcListener](self, "xpcListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_UIDragMonitor _tearDownConnections](self, "_tearDownConnections");
}

- (void)_tearDownConnections
{
  NSObject *v3;
  _QWORD block[5];

  -[_UIDragMonitor xpcQueue](self, "xpcQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___UIDragMonitor__tearDownConnections__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)dealloc
{
  objc_super v3;

  -[_UIDragMonitor _tearDownConnections](self, "_tearDownConnections");
  v3.receiver = self;
  v3.super_class = (Class)_UIDragMonitor;
  -[_UIDragMonitor dealloc](&v3, sel_dealloc);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (_UIDragMonitorDelegate)delegate
{
  return (_UIDragMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (_UIDragMonitorSessionLifecyleListener)lifecycleListener
{
  return self->_lifecycleListener;
}

- (void)setLifecycleListener:(id)a3
{
  objc_storeStrong((id *)&self->_lifecycleListener, a3);
}

- (NSMutableArray)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
  objc_storeStrong((id *)&self->_activeConnections, a3);
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_lifecycleListener, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
