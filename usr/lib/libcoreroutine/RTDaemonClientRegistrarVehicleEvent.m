@implementation RTDaemonClientRegistrarVehicleEvent

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RTDaemonClientRegistrarVehicleEvent)initWithVehicleLocationProvider:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTDaemonClientRegistrarVehicleEvent *v10;
  RTDaemonClientRegistrarVehicleEvent *v11;
  RTDaemonClientRegistrarVehicleEvent *v12;
  RTInvocationDispatcher *v13;
  void *v14;
  uint64_t v15;
  RTInvocationDispatcher *dispatcher;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)RTDaemonClientRegistrarVehicleEvent;
    v11 = -[RTDaemonClientRegistrarVehicleEvent init](&v18, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_queue, a4);
      v13 = [RTInvocationDispatcher alloc];
      -[RTDaemonClientRegistrarVehicleEvent queue](v12, "queue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[RTInvocationDispatcher initWithQueue:](v13, "initWithQueue:", v14);
      dispatcher = v12->_dispatcher;
      v12->_dispatcher = (RTInvocationDispatcher *)v15;

      objc_storeStrong((id *)&v12->_vehicleLocationProvider, a3);
    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)startMonitoringVehicleEvents
{
  void *v3;
  void *v4;
  void *v5;

  if (-[RTDaemonClientRegistrarVehicleEvent invocationsPending](self, "invocationsPending"))
  {
    -[RTDaemonClientRegistrarVehicleEvent dispatcher](self, "dispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dispatchPendingInvocations");

  }
  if (!-[RTDaemonClientRegistrarVehicleEvent registered](self, "registered"))
  {
    -[RTDaemonClientRegistrarVehicleEvent vehicleLocationProvider](self, "vehicleLocationProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:", self, sel_onVehicleEventNotification_, v5);

    -[RTDaemonClientRegistrarVehicleEvent setRegistered:](self, "setRegistered:", 1);
  }
}

- (void)stopMonitoringVehicleEvents
{
  void *v3;
  void *v4;
  void *v5;

  -[RTDaemonClientRegistrarVehicleEvent dispatcher](self, "dispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllPendingInvocations");

  if (-[RTDaemonClientRegistrarVehicleEvent registered](self, "registered"))
  {
    -[RTDaemonClientRegistrarVehicleEvent vehicleLocationProvider](self, "vehicleLocationProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:fromNotification:", self, v5);

    -[RTDaemonClientRegistrarVehicleEvent setRegistered:](self, "setRegistered:", 0);
  }
}

- (void)onVehicleEventNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTDaemonClientRegistrarVehicleEvent *v9;

  v4 = a3;
  -[RTDaemonClientRegistrarVehicleEvent queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__RTDaemonClientRegistrarVehicleEvent_onVehicleEventNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __66__RTDaemonClientRegistrarVehicleEvent_onVehicleEventNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "vehicleEvents");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "vehicleEventRegistrar:didReceiveVehicleEvents:error:", *(_QWORD *)(a1 + 40), v2, 0);

    }
  }
}

- (int64_t)countOfPendingInvocations
{
  void *v2;
  int64_t v3;

  -[RTDaemonClientRegistrarVehicleEvent dispatcher](self, "dispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfPendingInvocations");

  return v3;
}

- (BOOL)invocationsPending
{
  void *v2;
  BOOL v3;

  -[RTDaemonClientRegistrarVehicleEvent dispatcher](self, "dispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfPendingInvocations") != 0;

  return v3;
}

- (void)addPendingVehicleEventBlock:(id)a3 failBlock:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  if (a3)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    -[RTDaemonClientRegistrarVehicleEvent dispatcher](self, "dispatcher");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enqueueBlock:failureBlock:description:", v10, v9, CFSTR("%@"), v8);

  }
}

- (RTDaemonClientRegistrarVehicleEventProtocol)delegate
{
  return (RTDaemonClientRegistrarVehicleEventProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (void)setVehicleLocationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleLocationProvider, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
