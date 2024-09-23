@implementation AFKEndpointInterfacePowerlogDisplay

- (AFKEndpointInterfacePowerlogDisplay)initWithService:(unsigned int)a3 andIOKitComposition:(id)a4
{
  uint64_t v4;
  id v6;
  AFKEndpointInterfacePowerlogDisplay *v7;
  AFKEndpointInterfacePowerlogDisplay *v8;
  NSObject *v9;
  uint8_t v11[16];
  objc_super v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AFKEndpointInterfacePowerlogDisplay;
  v7 = -[AFKEndpointInterface initWithService:](&v12, sel_initWithService_, v4);
  v8 = v7;
  if (v7)
  {
    -[AFKEndpointInterfacePowerlogDisplay setValid:](v7, "setValid:", 1);
    -[AFKEndpointInterfacePowerlogDisplay setComp:](v8, "setComp:", v6);
    if (IOServiceAddInterestNotification((IONotificationPortRef)objc_msgSend(v6, "ioNotifyPort"), v4, "IOGeneralInterest", (IOServiceInterestCallback)serviceInterestCallback, v8, &v8->_notification))
    {
      PLLogDisplay();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEFAULT, "Error trying to setup IO service interest notification", v11, 2u);
      }

    }
  }

  return v8;
}

- (void)cancel
{
  io_object_t notification;
  objc_super v4;

  notification = self->_notification;
  if (notification)
    IOObjectRelease(notification);
  v4.receiver = self;
  v4.super_class = (Class)AFKEndpointInterfacePowerlogDisplay;
  -[AFKEndpointInterface cancel](&v4, sel_cancel);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (PLIOKitOperatorComposition)comp
{
  return (PLIOKitOperatorComposition *)objc_loadWeakRetained((id *)&self->_comp);
}

- (void)setComp:(id)a3
{
  objc_storeWeak((id *)&self->_comp, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_comp);
}

@end
