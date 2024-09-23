@implementation SVXVirtualDeviceManager

- (SVXVirtualDeviceManager)initWithRemoraVirtualDeviceManager:(id)a3
{
  id v4;
  SVXVirtualDevice *v5;
  void *v6;
  SVXVirtualDevice *v7;
  SVXVirtualDeviceManager *v8;

  v4 = a3;
  v5 = [SVXVirtualDevice alloc];
  objc_msgSend(MEMORY[0x24BE091F8], "defaultContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SVXVirtualDevice initWithInstanceContext:](v5, "initWithInstanceContext:", v6);

  v8 = -[SVXVirtualDeviceManager initWithRemoraVirtualDeviceManager:hostVirtualDevice:](self, "initWithRemoraVirtualDeviceManager:hostVirtualDevice:", v4, v7);
  return v8;
}

- (SVXVirtualDeviceManager)initWithRemoraVirtualDeviceManager:(id)a3 hostVirtualDevice:(id)a4
{
  id v7;
  id v8;
  SVXVirtualDeviceManager *v9;
  SVXVirtualDeviceManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXVirtualDeviceManager;
  v9 = -[SVXVirtualDeviceManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remoraVirtualDeviceManager, a3);
    objc_storeStrong((id *)&v10->_hostVirtualDevice, a4);
  }

  return v10;
}

- (void)getVirtualDeviceForActivationContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, SVXVirtualDevice *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, SVXVirtualDevice *))a4;
  if (v6)
  {
    if (objc_msgSend(v8, "source") == 11)
    {
      objc_msgSend(v8, "deviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)

    }
    v6[2](v6, self->_hostVirtualDevice);
  }

}

- (void)getVirtualDeviceForInstanceInfo:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, SVXVirtualDevice *))a4 + 2))(a4, self->_hostVirtualDevice);
}

- (SVXVirtualDevice)hostVirtualDevice
{
  return self->_hostVirtualDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostVirtualDevice, 0);
  objc_storeStrong((id *)&self->_remoraVirtualDeviceManager, 0);
}

@end
