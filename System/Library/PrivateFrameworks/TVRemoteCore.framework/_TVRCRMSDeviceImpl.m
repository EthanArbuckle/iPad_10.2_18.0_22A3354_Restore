@implementation _TVRCRMSDeviceImpl

+ (id)implWithDevice:(id)a3
{
  id v3;
  _TVRCRMSDeviceImpl *v4;

  v3 = a3;
  v4 = -[_TVRCRMSDeviceImpl initWithDevice:]([_TVRCRMSDeviceImpl alloc], "initWithDevice:", v3);

  return v4;
}

- (_TVRCRMSDeviceImpl)initWithDevice:(id)a3
{
  id v5;
  _TVRCRMSDeviceImpl *v6;
  _TVRCRMSDeviceImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVRCRMSDeviceImpl;
  v6 = -[_TVRCRMSDeviceImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceWrapper, a3);
    -[_TVRCRMSDeviceWrapper setDelegate:](v7->_deviceWrapper, "setDelegate:", v7);
  }

  return v7;
}

- (BOOL)supportsTouchEvents
{
  return -[_TVRCRMSDeviceWrapper supportsTouchEvents](self->_deviceWrapper, "supportsTouchEvents");
}

- (id)name
{
  return -[_TVRCRMSDeviceWrapper name](self->_deviceWrapper, "name");
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[_TVRCRMSDeviceWrapper identifier](self->_deviceWrapper, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)alternateIdentifiers
{
  return -[_TVRCRMSDeviceWrapper alternateIdentifiers](self->_deviceWrapper, "alternateIdentifiers");
}

- (id)model
{
  void *v2;
  void *v3;

  -[_TVRCRMSDeviceWrapper model](self->_deviceWrapper, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)supportedButtons
{
  return -[_TVRCRMSDeviceWrapper supportedButtons](self->_deviceWrapper, "supportedButtons");
}

- (void)setAuthenticationSupported:(BOOL)a3
{
  -[_TVRCRMSDeviceWrapper setAuthenticationAllowed:](self->_deviceWrapper, "setAuthenticationAllowed:", a3);
}

- (void)connect
{
  -[_TVRCRMSDeviceWrapper connect](self->_deviceWrapper, "connect");
}

- (void)disconnect
{
  -[_TVRCRMSDeviceWrapper disconnect](self->_deviceWrapper, "disconnect");
}

- (void)sendButtonEvent:(id)a3
{
  -[_TVRCRMSDeviceWrapper sendButtonEvent:](self->_deviceWrapper, "sendButtonEvent:", a3);
}

- (void)sendTouchEvent:(id)a3
{
  -[_TVRCRMSDeviceWrapper sendTouchEvent:](self->_deviceWrapper, "sendTouchEvent:", a3);
}

- (id)keyboardController
{
  return -[_TVRCRMSDeviceWrapper keyboardController](self->_deviceWrapper, "keyboardController");
}

- (unint64_t)pairingCapability
{
  return 0;
}

- (int64_t)connectionType
{
  return -[_TVRCRMSDeviceWrapper connectionType](self->_deviceWrapper, "connectionType");
}

- (BOOL)isPaired
{
  return -[_TVRCRMSDeviceWrapper isPaired](self->_deviceWrapper, "isPaired");
}

- (BOOL)supportsDirectCaptionQueries
{
  return 0;
}

- (BOOL)supportsFindMyRemote
{
  return 0;
}

- (void)connectedToDevice:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(WeakRetained, "_connectionAttemptSucceeded");

}

- (void)disconnectedFromDevice:(id)a3 error:(id)a4
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

- (void)deviceUpdatedSupportedButtons:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  -[_TVRCRMSDeviceWrapper supportedButtons](self->_deviceWrapper, "supportedButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setSupportedButtons:", v4);

}

- (void)deviceEncounteredAuthenticationChallenge:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_TVRCRMSDeviceImpl device](self, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_encounteredAuthenticationChallenge:", v4);

}

- (TVRXDevice)device
{
  return (TVRXDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
  objc_storeWeak((id *)&self->_device, a3);
}

- (_TVRCRMSDeviceWrapper)deviceWrapper
{
  return self->_deviceWrapper;
}

- (void)setDeviceWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_deviceWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceWrapper, 0);
  objc_destroyWeak((id *)&self->_device);
}

@end
