@implementation SDAccessibilityServer

- (void)activate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDAccessibilityServer;
  -[SDXPCDaemon _activate](&v2, "_activate");
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDAccessibilityServer;
  -[SDXPCDaemon _invalidate](&v2, "_invalidate");
}

- (id)machServiceName
{
  return SFAccessibilityServiceName;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t isKindOfClass;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  int v13;
  unsigned int v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.accessibility.api")));
  v6 = objc_opt_class(NSNumber, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  if ((isKindOfClass & 1) != 0 && (isKindOfClass = (uint64_t)objc_msgSend(v4, "BOOLValue"), (isKindOfClass & 1) != 0))
  {
    v8 = daemon_log(isKindOfClass);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 67109120;
      v14 = objc_msgSend(v3, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Allowing connection from pid %d to sharingd accessibility server", (uint8_t *)&v13, 8u);
    }
    v10 = 1;
  }
  else
  {
    v11 = daemon_log(isKindOfClass);
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 67109120;
      v14 = objc_msgSend(v3, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "process %d tried to connect to the sharingd accessibility server, but it was not entitled!", (uint8_t *)&v13, 8u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFAccessibilityInterface);
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFAccessibilityInterface);
}

- (void)requestLabelForActivityWithSlotID:(unsigned int)a3 completionHandler:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v5 = *(_QWORD *)&a3;
    v6 = a4;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessibilityStringForSlotID:", v5));
    (*((void (**)(id, void *))a4 + 2))(v6, v7);

  }
}

@end
