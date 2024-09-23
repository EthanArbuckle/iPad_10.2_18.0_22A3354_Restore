@implementation TVRCDeviceEventManager

- (TVRCDeviceEventManager)initWithDevice:(id)a3 responseHandler:(id)a4
{
  id v7;
  id v8;
  TVRCDeviceEventManager *v9;
  uint64_t v10;
  id eventResponseHandler;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TVRCDeviceEventManager;
  v9 = -[TVRCDeviceEventManager init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    eventResponseHandler = v9->_eventResponseHandler;
    v9->_eventResponseHandler = (id)v10;

    objc_storeStrong((id *)&v9->_device, a3);
  }

  return v9;
}

- (void)sendEvent:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id eventResponseHandler;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[TVRCDevice connectionState](self->_device, "connectionState") == 2)
  {
    objc_initWeak(&location, self);
    +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRCDevice identifier](self->_device, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __44__TVRCDeviceEventManager_sendEvent_options___block_invoke;
    v12[3] = &unk_24DCD8030;
    objc_copyWeak(&v15, &location);
    v13 = v6;
    v14 = v7;
    objc_msgSend(v8, "sendEvent:toDeviceWithIdentifier:options:response:", v13, v9, v14, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    eventResponseHandler = self->_eventResponseHandler;
    if (eventResponseHandler)
    {
      TVRCMakeError(100, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id, _QWORD, _QWORD, void *))eventResponseHandler + 2))(eventResponseHandler, v6, 0, 0, v11);

    }
  }

}

void __44__TVRCDeviceEventManager_sendEvent_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "eventResponseHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(WeakRetained, "eventResponseHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id, _QWORD, id))v9)[2](v9, *(_QWORD *)(a1 + 32), v10, *(_QWORD *)(a1 + 40), v6);

  }
}

- (TVRCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (id)eventResponseHandler
{
  return self->_eventResponseHandler;
}

- (void)setEventResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventResponseHandler, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
