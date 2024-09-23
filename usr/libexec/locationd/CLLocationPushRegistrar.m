@implementation CLLocationPushRegistrar

+ (id)sharedRegistrar
{
  if (qword_1023061C8 != -1)
    dispatch_once(&qword_1023061C8, &stru_102163408);
  return (id)qword_1023061D0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLLocationPushRegistrar;
  -[CLLocationPushRegistrar dealloc](&v3, "dealloc");
}

- (void)connect
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.locationpushd.pushregistration"), 4096);
  self->_connection = v3;
  if (v3)
  {
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LPPushTokenServerProtocol));
    connection = self->_connection;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1009CFEF8;
    v7[3] = &unk_10212BB58;
    v7[4] = self;
    -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", v7);
    v5 = self->_connection;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1009D009C;
    v6[3] = &unk_10212BB58;
    v6[4] = self;
    -[NSXPCConnection setInterruptionHandler:](v5, "setInterruptionHandler:", v6);
    -[NSXPCConnection resume](self->_connection, "resume");
  }
}

- (void)registerForPushToken:(id)a3 completion:(id)a4
{
  NSXPCConnection *connection;
  _QWORD v8[5];

  connection = self->_connection;
  if (!connection)
  {
    -[CLLocationPushRegistrar connect](self, "connect");
    connection = self->_connection;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009D02C8;
  v8[3] = &unk_102163430;
  v8[4] = a4;
  objc_msgSend(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"), "registerForPushToken:completion:", a3, v8);
}

- (void)setLocationPushesActive:(BOOL)a3 forAppBundleIdentifier:(id)a4 completion:(id)a5
{
  _BOOL8 v7;
  NSXPCConnection *connection;
  _QWORD v10[5];

  v7 = a3;
  connection = self->_connection;
  if (!connection)
  {
    -[CLLocationPushRegistrar connect](self, "connect");
    connection = self->_connection;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009D0364;
  v10[3] = &unk_102163458;
  v10[4] = a5;
  objc_msgSend(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"), "setLocationPushesActive:forAppBundleIdentifier:completion:", v7, a4, v10);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
