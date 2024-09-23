@implementation LDLoginUIXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LDLoginUIXPCConnection sharedConnection](LDLoginUIXPCConnection, "sharedConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connection"));

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", LKLoginDaemonLoginUIEntitlement));
    if (v8
      && (v9 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      && objc_msgSend(v8, "BOOLValue"))
    {
      objc_msgSend(v5, "setConnection:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LKLoginUICheckInProtocol));
      objc_msgSend(v4, "setExportedInterface:", v10);

      objc_msgSend(v4, "setExportedObject:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LKLoginUIProtocol));
      objc_msgSend(v4, "setRemoteObjectInterface:", v11);

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100002B34;
      v14[3] = &unk_1000083F8;
      v15 = v5;
      objc_msgSend(v4, "setInvalidationHandler:", v14);
      objc_msgSend(v4, "resume");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &stru_100008438));
      objc_msgSend(v12, "checkedInWithLoginD");

      v7 = 1;
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

@end
