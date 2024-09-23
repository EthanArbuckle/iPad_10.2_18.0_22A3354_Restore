@implementation KCSharingGroupNotificationConnection

- (KCSharingGroupNotificationConnection)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KCSharingGroupNotificationConnection;
  return -[KCSharingGroupNotificationConnection init](&v3, "init");
}

- (void)groupsUpdatedWithInfos:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingGroupNotificationConnection connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &stru_1002EAEC0));
  objc_msgSend(v6, "groupsUpdatedWithInfos:", v4);

}

- (id)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  if (!self->_connectionOK)
  {
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    connection = self->_connection;
    self->_connection = 0;

  }
  v4 = self->_connection;
  if (!v4)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    self->_connectionOK = 1;
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.AuthenticationServices.CredentialSharingGroups"), 0);
    v6 = self->_connection;
    self->_connection = v5;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001BF960;
    v16[3] = &unk_1002EB598;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001BFA1C;
    v14[3] = &unk_1002EB598;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v14);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_DEFAULT, -1);
    v10 = objc_claimAutoreleasedReturnValue(v9);

    v11 = dispatch_queue_create("com.apple.KCSharingGroupNotificationConnection.xpcConnection", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___KCSharingGroupNotificationProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v12);
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v12);
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", v11);
    -[NSXPCConnection activate](self->_connection, "activate");

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    v4 = self->_connection;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (id)sharedInstance
{
  if (qword_100341510 != -1)
    dispatch_once(&qword_100341510, &stru_1002EAE80);
  return (id)qword_100341518;
}

@end
