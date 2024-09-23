@implementation NRDevicePairingManagerConnection

- (void)dealloc
{
  OS_xpc_object *xpcConnection;
  OS_xpc_object *v4;
  objc_super v5;

  if (self)
  {
    xpcConnection = self->_xpcConnection;
    if (xpcConnection)
    {
      xpc_connection_cancel(xpcConnection);
      v4 = self->_xpcConnection;
      self->_xpcConnection = 0;

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NRDevicePairingManagerConnection;
  -[NRDevicePairingManagerConnection dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingManagers, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
