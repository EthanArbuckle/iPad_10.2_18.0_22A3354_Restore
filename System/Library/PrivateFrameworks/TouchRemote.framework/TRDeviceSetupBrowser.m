@implementation TRDeviceSetupBrowser

- (TRDeviceSetupBrowser)init
{
  TRDeviceSetupBrowser *v2;
  TRTransferBrowser *v3;
  TRTransferBrowser *transferBrowser;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TRDeviceSetupBrowser;
  v2 = -[TRDeviceSetupBrowser init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TRTransferBrowser);
    transferBrowser = v2->_transferBrowser;
    v2->_transferBrowser = v3;

    -[TRTransferBrowser setDelegate:](v2->_transferBrowser, "setDelegate:", v2);
  }
  return v2;
}

- (void)browserDidChangeState:(id)a3
{
  TRDeviceSetupBrowserDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "deviceSetupBrowserDidChangeState:", self);

  }
}

- (void)browser:(id)a3 didStartTransferWithSendDataHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  TRDeviceSetupPeripheral *peripheral;
  TRDeviceSetupPeripheral *v10;
  TRDeviceSetupPeripheral *v11;
  id WeakRetained;
  char v13;
  id v14;
  int v15;
  TRDeviceSetupPeripheral *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (self->_peripheral)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        peripheral = self->_peripheral;
        v15 = 138412290;
        v16 = peripheral;
        _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupBrowser] Already have peripheral: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    v7[2](v7, 0);
  }
  else
  {
    v10 = objc_alloc_init(TRDeviceSetupPeripheral);
    v11 = self->_peripheral;
    self->_peripheral = v10;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v14, "deviceSetupBrowser:didFindPeripheral:", self, self->_peripheral);

    }
    -[TRDeviceSetupPeripheral _didTapWithSendDataHandler:](self->_peripheral, "_didTapWithSendDataHandler:", v7);
  }

}

- (void)browser:(id)a3 didReceiveData:(id)a4 replyHandler:(id)a5
{
  -[TRDeviceSetupPeripheral _didReceiveData:replyHandler:](self->_peripheral, "_didReceiveData:replyHandler:", a4, a5);
}

- (void)browserDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  TRDeviceSetupPeripheral *peripheral;
  TRDeviceSetupPeripheral *v7;
  TRDeviceSetupPeripheral *v8;
  id WeakRetained;
  char v10;
  id v11;
  int v12;
  TRDeviceSetupPeripheral *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      peripheral = self->_peripheral;
      v12 = 138412290;
      v13 = peripheral;
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "[TRDeviceSetupBrowser] Peripheral disconnected: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  v7 = self->_peripheral;
  -[TRDeviceSetupPeripheral _didDisconnect](self->_peripheral, "_didDisconnect");
  v8 = self->_peripheral;
  self->_peripheral = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "deviceSetupBrowser:didRemovePeripheral:", self, v7);

  }
}

- (void)start
{
  -[TRTransferBrowser start](self->_transferBrowser, "start");
}

- (int64_t)state
{
  return -[TRTransferBrowser state](self->_transferBrowser, "state");
}

- (void)defer
{
  -[TRTransferBrowser defer](self->_transferBrowser, "defer");
}

- (void)stop
{
  -[TRTransferBrowser stop](self->_transferBrowser, "stop");
}

- (TRDeviceSetupBrowserDelegate)delegate
{
  return (TRDeviceSetupBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TRTransferBrowser)transferBrowser
{
  return self->_transferBrowser;
}

- (void)setTransferBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_transferBrowser, a3);
}

- (TRDeviceSetupPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_transferBrowser, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
