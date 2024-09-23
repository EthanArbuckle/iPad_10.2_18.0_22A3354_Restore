@implementation SecuritydXPCServerListener

- (SecuritydXPCServerListener)init
{
  SecuritydXPCServerListener *v2;
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SecuritydXPCServerListener;
  v2 = -[SecuritydXPCServerListener init](&v7, "init");
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.securityd.general"));
    -[SecuritydXPCServerListener setListener:](v2, "setListener:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecuritydXPCServerListener listener](v2, "listener"));
    objc_msgSend(v4, "setDelegate:", v2);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecuritydXPCServerListener listener](v2, "listener"));
    objc_msgSend(v5, "resume");

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SecuritydXPCServer *v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.keychain.deny")));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SecuritydXPCProtocol));
    objc_msgSend(v4, "setExportedInterface:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exportedInterface"));
    +[SecuritydXPCClient configureSecuritydXPCProtocol:](SecuritydXPCClient, "configureSecuritydXPCProtocol:", v7);

    v8 = -[SecuritydXPCServer initWithConnection:]([SecuritydXPCServer alloc], "initWithConnection:", v4);
    objc_msgSend(v4, "setExportedObject:", v8);

    objc_msgSend(v4, "resume");
  }

  return v5 == 0;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
