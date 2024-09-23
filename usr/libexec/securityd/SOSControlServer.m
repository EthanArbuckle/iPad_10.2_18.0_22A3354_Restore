@implementation SOSControlServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  const void *v14;
  const void *v15;
  NSObject *v16;
  int v18;
  unsigned int v19;
  __int16 v20;
  const __CFString *v21;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("keychain-cloud-circle")));
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0 || (objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    v14 = sub_10000EF14("SecError");
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 67109378;
      v19 = objc_msgSend(v4, "processIdentifier");
      v20 = 2112;
      v21 = CFSTR("keychain-cloud-circle");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sos: Client pid: %d doesn't have entitlement: %@", (uint8_t *)&v18, 0x12u);
    }
    goto LABEL_10;
  }
  v7 = sub_1002025E0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    v15 = sub_10000EF14("SecError");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 67109120;
      v19 = objc_msgSend(v4, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "sos: SOS have not launched yet, come later, pid: %d", (uint8_t *)&v18, 8u);
    }

    v9 = 0;
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v9 = v8;
  v10 = -[SOSClientRemote initSOSConnectionWithConnection:account:]([SOSClientRemote alloc], "initSOSConnectionWithConnection:account:", v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SOSControlProtocol));
  objc_msgSend(v4, "setExportedInterface:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exportedInterface"));
  _SOSControlSetupInterface();

  objc_msgSend(v4, "setExportedObject:", v10);
  objc_msgSend(v4, "resume");

  v13 = 1;
LABEL_11:

  return v13;
}

- (id)internalSOSClient
{
  return -[SOSClient initSOSClientWithAccount:]([SOSClient alloc], "initSOSClientWithAccount:", sub_1002025E0());
}

@end
