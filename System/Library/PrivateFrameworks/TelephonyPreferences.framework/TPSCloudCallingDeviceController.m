@implementation TPSCloudCallingDeviceController

- (TPSCloudCallingDeviceController)init
{
  TPSCloudCallingDeviceController *v2;
  void *v3;
  uint64_t v4;
  NSArray *devices;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSCloudCallingDeviceController;
  v2 = -[TPSCloudCallingDeviceController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DBD1B8], "cloudCallingDevices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "copy");
    devices = v2->_devices;
    v2->_devices = (NSArray *)v4;

    objc_msgSend(MEMORY[0x1E0DBD1B8], "addDelegate:queue:", v2, MEMORY[0x1E0C80D38]);
  }
  return v2;
}

- (void)setDevices:(id)a3
{
  NSArray *v5;
  void *v6;
  char v7;
  void *v8;
  NSArray *v9;

  v5 = (NSArray *)a3;
  if (self->_devices != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_devices, a3);
    -[TPSCloudCallingDeviceController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    v5 = v9;
    if ((v7 & 1) != 0)
    {
      -[TPSCloudCallingDeviceController delegate](self, "delegate", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cloudCallingDeviceController:didChangeDevices:", self, v9);

      v5 = v9;
    }
  }

}

- (void)didChangeCloudCallingDevices
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  TPSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB4B7000, v3, OS_LOG_TYPE_DEFAULT, "Cloud calling devices have changed. Refreshing cached list of devices.", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DBD1B8], "cloudCallingDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[TPSCloudCallingDeviceController setDevices:](self, "setDevices:", v5);

}

- (TPSCloudCallingDeviceControllerDelegate)delegate
{
  return (TPSCloudCallingDeviceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
