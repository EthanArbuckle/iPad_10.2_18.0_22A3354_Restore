@implementation TVRCMatchPointDeviceImpl

+ (id)implWithService:(id)a3
{
  id v3;
  TVRCMatchPointDeviceImpl *v4;

  v3 = a3;
  v4 = -[TVRCMatchPointDeviceImpl initWithService:]([TVRCMatchPointDeviceImpl alloc], "initWithService:", v3);

  return v4;
}

- (TVRCMatchPointDeviceImpl)initWithService:(id)a3
{
  id v5;
  TVRCMatchPointDeviceImpl *v6;
  TVRCMatchPointDeviceImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRCMatchPointDeviceImpl;
  v6 = -[TVRCMatchPointDeviceImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    -[TVRCHMServiceWrapper setDelegate:](v7->_service, "setDelegate:", v7);
  }

  return v7;
}

- (BOOL)supportsDirectCaptionQueries
{
  return 0;
}

- (BOOL)supportsFindMyRemote
{
  return 0;
}

- (BOOL)supportsTouchEvents
{
  return 0;
}

- (id)name
{
  void *v2;
  void *v3;

  -[TVRCHMServiceWrapper name](self->_service, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[TVRCHMServiceWrapper identifier](self->_service, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)alternateIdentifiers
{
  return 0;
}

- (id)model
{
  void *v2;
  void *v3;

  -[TVRCHMServiceWrapper model](self->_service, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)supportedButtons
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v4 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 1);
  objc_msgSend(v3, "addObject:", v4);

  v5 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 12);
  objc_msgSend(v3, "addObject:", v5);

  v6 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 13);
  objc_msgSend(v3, "addObject:", v6);

  v7 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 14);
  objc_msgSend(v3, "addObject:", v7);

  v8 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 15);
  objc_msgSend(v3, "addObject:", v8);

  v9 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 5);
  objc_msgSend(v3, "addObject:", v9);

  v10 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 23);
  objc_msgSend(v3, "addObject:", v10);

  v11 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 24);
  objc_msgSend(v3, "addObject:", v11);

  if (-[TVRCHMServiceWrapper supportsPowerButton](self->_service, "supportsPowerButton"))
  {
    v12 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 30);
    objc_msgSend(v3, "addObject:", v12);

  }
  if (-[TVRCHMServiceWrapper supportsInfoKey](self->_service, "supportsInfoKey"))
  {
    v13 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 25);
    objc_msgSend(v3, "addObject:", v13);

  }
  if (-[TVRCHMServiceWrapper supportsVolumeControl](self->_service, "supportsVolumeControl"))
  {
    v14 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 10);
    objc_msgSend(v3, "addObject:", v14);

    v15 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 11);
    objc_msgSend(v3, "addObject:", v15);

  }
  if (-[TVRCHMServiceWrapper supportsMute](self->_service, "supportsMute"))
  {
    v16 = -[TVRCButton _initWithButtonType:]([TVRCButton alloc], "_initWithButtonType:", 29);
    objc_msgSend(v3, "addObject:", v16);

  }
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

- (void)connect
{
  -[TVRCHMServiceWrapper connect](self->_service, "connect");
}

- (void)disconnect
{
  -[TVRCHMServiceWrapper disconnect](self->_service, "disconnect");
}

- (void)sendButtonEvent:(id)a3
{
  -[TVRCHMServiceWrapper sendButtonEvent:](self->_service, "sendButtonEvent:", a3);
}

- (id)keyboardController
{
  return 0;
}

- (unint64_t)pairingCapability
{
  return 0;
}

- (int64_t)connectionType
{
  return 2;
}

- (void)connectedToService:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "_connectionAttemptSucceeded");

}

- (void)disconnectedFromService:(id)a3 error:(id)a4
{
  uint64_t v4;
  TVRXDevice **p_device;
  id v6;
  id WeakRetained;

  v4 = 4 * (a4 != 0);
  p_device = &self->_device;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_device);
  objc_msgSend(WeakRetained, "_disconnected:error:", v4, v6);

}

- (void)service:(id)a3 updatedName:(id)a4
{
  TVRXDevice **p_device;
  id v5;
  id WeakRetained;

  p_device = &self->_device;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_device);
  objc_msgSend(WeakRetained, "_setDeviceName:", v5);

}

- (TVRXDevice)device
{
  return (TVRXDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
  objc_storeWeak((id *)&self->_device, a3);
}

- (TVRCHMServiceWrapper)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_device);
}

@end
