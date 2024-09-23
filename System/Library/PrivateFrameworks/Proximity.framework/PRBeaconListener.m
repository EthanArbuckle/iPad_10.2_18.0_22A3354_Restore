@implementation PRBeaconListener

- (PRBeaconListener)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  PRBeaconListener *v8;
  PRBeaconListener *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PRRangingClientExportedObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PRBeaconListener;
  v8 = -[PRRangingDevice init](&v26, sel_init);
  v9 = v8;
  if (v8)
  {
    v19 = v7;
    v8->_state = 0;
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_initWeak(&location, v9);
    v10 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __43__PRBeaconListener_initWithDelegate_queue___block_invoke;
    v23[3] = &unk_1E3D04690;
    objc_copyWeak(&v24, &location);
    v11 = (void *)MEMORY[0x1A1AD03B0](v23);
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __43__PRBeaconListener_initWithDelegate_queue___block_invoke_2;
    v21[3] = &unk_1E3D04690;
    objc_copyWeak(&v22, &location);
    v12 = (void *)MEMORY[0x1A1AD03B0](v21);
    v13 = -[PRRangingClientExportedObject initWithRangingClient:]([PRRangingClientExportedObject alloc], "initWithRangingClient:", v9);
    PRMakeRangingClientXPCInterface();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PRMakeBeaconRangingServerXPCInterface();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    DaemonBackedService::connect((id *)&v9->_service._connection, CFSTR("com.apple.nearbyd.xpc.beacon"), 4096, v13, v14, v15, v9->_queue, v11, v12, 1);

    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v9->_service._connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20.receiver = v9;
    v20.super_class = (Class)PRBeaconListener;
    -[PRRangingDevice clientInfo](&v20, sel_clientInfo);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "connectWithClientInfo:", v17);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    v7 = v19;
  }

  return v9;
}

void __43__PRBeaconListener_initWithDelegate_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deamonConnectionInvalidated");

}

void __43__PRBeaconListener_initWithDelegate_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deamonConnectionInterrupted");

}

- (void)pushBeaconAllowlist:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_service._connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushBeaconAllowlist:reply:", v8, v6);

}

- (void)clearBeaconAllowlistWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_service._connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearBeaconAllowlist:", v5);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_service._connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRBeaconListener;
  -[PRBeaconListener dealloc](&v3, sel_dealloc);
}

- (void)deamonConnectionInterrupted
{
  void *v3;
  void *v4;
  objc_super v5;

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_service._connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)PRBeaconListener;
  -[PRRangingDevice clientInfo](&v5, sel_clientInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectWithClientInfo:", v4);

}

- (void)didFailWithError:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__PRBeaconListener_didFailWithError___block_invoke;
  v7[3] = &unk_1E3D04708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatchAsyncOnQueue(queue, v7);

}

void __37__PRBeaconListener_didFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "beaconListener:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  if (a3 <= 4)
    -[PRBeaconListener _updateState:](self, "_updateState:", qword_19BF79F10[a3], a4);
}

- (void)didReceiveNewSolutions:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "beaconListener:didOutputRangeResults:", self, v5);

}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  if (a3 <= 3)
    -[PRBeaconListener _updateState:](self, "_updateState:", qword_19BF79F38[a3]);
}

- (void)_updateState:(unint64_t)a3
{
  id WeakRetained;

  self->_state = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "beaconListener:didChangeState:", self, a3);

}

- (PRBeaconListenerDelegate)delegate
{
  return (PRBeaconListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
