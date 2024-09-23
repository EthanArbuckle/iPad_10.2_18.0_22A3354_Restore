@implementation RSDComputeControllerDeviceEndpoint

- (RSDComputeControllerDeviceEndpoint)initWithAddress:(const char *)a3
{
  RSDComputeControllerDeviceEndpoint *v4;
  char *v5;
  char *v6;
  void *v7;
  RSDComputeControllerDeviceEndpoint *v8;
  objc_super v10;
  uint64_t v11;
  _OWORD v12[5];

  v10.receiver = self;
  v10.super_class = (Class)RSDComputeControllerDeviceEndpoint;
  v4 = -[RSDComputeControllerDeviceEndpoint init](&v10, "init");
  if (v4)
  {
    if (_dispatch_is_multithreaded())
    {
      v5 = strdup(a3);
      if (!v5)
      {
        do
        {
          __os_temporary_resource_shortage();
          v6 = strdup(a3);
        }
        while (!v6);
        v5 = v6;
      }
    }
    else
    {
      v5 = strdup(a3);
      if (!v5)
        sub_100035B64(a3, &v11, v12);
    }
    -[RSDComputeControllerDeviceEndpoint setAddress:](v4, "setAddress:", v5);
    v7 = (void *)os_transaction_create("compute_controller");
    -[RSDComputeControllerDeviceEndpoint setEndpoint_tx:](v4, "setEndpoint_tx:", v7);

    v8 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(-[RSDComputeControllerDeviceEndpoint address](self, "address"));
  -[RSDComputeControllerDeviceEndpoint setAddress:](self, "setAddress:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RSDComputeControllerDeviceEndpoint;
  -[RSDComputeControllerDeviceEndpoint dealloc](&v3, "dealloc");
}

- (char)address
{
  return self->_address;
}

- (void)setAddress:(char *)a3
{
  self->_address = a3;
}

- (OS_os_transaction)endpoint_tx
{
  return self->_endpoint_tx;
}

- (void)setEndpoint_tx:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint_tx, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint_tx, 0);
}

@end
