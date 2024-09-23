@implementation EscrowRequestXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  const void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  const void *v14;
  NSObject *v15;
  int v17;
  unsigned int v18;
  __int16 v19;
  const __CFString *v20;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.escrow-update")));
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0 && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v7 = sub_10000EF14("escrowrequest");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 67109376;
      v18 = objc_msgSend(v4, "processIdentifier");
      v19 = 1024;
      LODWORD(v20) = objc_msgSend(v4, "effectiveUserIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "received connection from client pid %d (euid %u)", (uint8_t *)&v17, 0xEu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___EscrowRequestXPCProtocol));
    v10 = SecEscrowRequestSetupControlProtocol();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v4, "setExportedInterface:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[EscrowRequestServer server](EscrowRequestServer, "server"));
    objc_msgSend(v4, "setExportedObject:", v12);

    objc_msgSend(v4, "resume");
    v13 = 1;
  }
  else
  {
    v14 = sub_10000EF14("SecError");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 67109378;
      v18 = objc_msgSend(v4, "processIdentifier");
      v19 = 2112;
      v20 = CFSTR("com.apple.private.escrow-update");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "escrow-update: Client pid: %d doesn't have entitlement: %@", (uint8_t *)&v17, 0x12u);
    }

    v13 = 0;
  }

  return v13;
}

@end
