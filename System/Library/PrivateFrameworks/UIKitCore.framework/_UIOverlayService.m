@implementation _UIOverlayService

- (_UIOverlayService)init
{
  _UIOverlayService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIOverlayService;
  v2 = -[_UIOverlayService init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.uikit.uioverlayservice.connectionQueue", v3);
    -[_UIOverlayService setConnectionQueue:](v2, "setConnectionQueue:", v4);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionClient invalidate](self->_serviceConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIOverlayService;
  -[_UIOverlayService dealloc](&v3, sel_dealloc);
}

- (void)_makeConnectionIfNecessaryWithConnectionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[_UIOverlayService connectionQueue](self, "connectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69___UIOverlayService__makeConnectionIfNecessaryWithConnectionHandler___block_invoke;
  v7[3] = &unk_1E16D7338;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_asyncTargetWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45___UIOverlayService__asyncTargetWithHandler___block_invoke;
  v6[3] = &unk_1E16EC190;
  v7 = v4;
  v5 = v4;
  -[_UIOverlayService _makeConnectionIfNecessaryWithConnectionHandler:](self, "_makeConnectionIfNecessaryWithConnectionHandler:", v6);

}

- (void)prewarmConnection
{
  -[_UIOverlayService _makeConnectionIfNecessaryWithConnectionHandler:](self, "_makeConnectionIfNecessaryWithConnectionHandler:", 0);
}

- (void)sendOverlayAction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39___UIOverlayService_sendOverlayAction___block_invoke;
  v6[3] = &unk_1E16D7FB0;
  v7 = v4;
  v5 = v4;
  -[_UIOverlayService _asyncTargetWithHandler:](self, "_asyncTargetWithHandler:", v6);

}

- (void)performOverlayClientAction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _UIOverlayService *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48___UIOverlayService_performOverlayClientAction___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (_UIOverlayServiceDelegate)delegate
{
  return (_UIOverlayServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (BSServiceConnectionClient)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
