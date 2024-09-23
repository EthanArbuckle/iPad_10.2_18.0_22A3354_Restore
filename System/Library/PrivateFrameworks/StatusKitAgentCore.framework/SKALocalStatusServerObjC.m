@implementation SKALocalStatusServerObjC

- (SKALocalStatusServerObjC)initWithIDSDeviceProvider:(id)a3
{
  id v4;
  SKALocalStatusServerObjC *v5;
  SKALocalStatusServer *v6;
  SKALocalStatusServer *server;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKALocalStatusServerObjC;
  v5 = -[SKALocalStatusServerObjC init](&v9, sel_init);
  if (v5)
  {
    v6 = -[SKALocalStatusServer initWithIdsDeviceProvider:]([SKALocalStatusServer alloc], "initWithIdsDeviceProvider:", v4);
    server = v5->_server;
    v5->_server = v6;

  }
  return v5;
}

- (void)shutdown
{
  SKALocalStatusServer *server;

  -[SKALocalStatusServer objcShutdown](self->_server, "objcShutdown");
  server = self->_server;
  self->_server = 0;

}

- (SKALocalStatusServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
}

@end
