@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  const void *v11;
  NSObject *v12;
  __objc2_prot **v13;
  const void *v14;
  void *v15;
  supd *v16;
  BOOL v17;
  const void *v18;
  int v20;
  unsigned int v21;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.securityuploadd")));
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.trustd.FileHelp")));
  v9 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    if (!v7)
      goto LABEL_15;
LABEL_11:
    v14 = sub_100010B28("xpc");
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v20 = 67109120;
      v21 = objc_msgSend(v4, "processIdentifier");
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Client (pid: %d) properly entitled for supd interface, let's go", (uint8_t *)&v20, 8u);
    }
    v13 = &protocolRef_supdProtocol;
    goto LABEL_14;
  }
  v10 = objc_msgSend(v8, "BOOLValue");
  if ((v7 & 1) != 0)
    goto LABEL_11;
  if (v10)
  {
    v11 = sub_100010B28("xpc");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v20 = 67109120;
      v21 = objc_msgSend(v4, "processIdentifier");
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Client (pid: %d) properly entitled for trustd file helper interface, let's go", (uint8_t *)&v20, 8u);
    }
    v13 = &protocolRef_TrustdFileHelper_protocol;
LABEL_14:

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", *v13));
    objc_msgSend(v4, "setExportedInterface:", v15);

    v16 = -[supd initWithConnection:]([supd alloc], "initWithConnection:", v4);
    objc_msgSend(v4, "setExportedObject:", v16);
    objc_msgSend(v4, "resume");
    v17 = 1;
    goto LABEL_18;
  }
LABEL_15:
  v18 = sub_100010B28("SecError");
  v16 = (supd *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 67109120;
    v21 = objc_msgSend(v4, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_DEFAULT, "xpc: Client (pid: %d) doesn't have entitlement", (uint8_t *)&v20, 8u);
  }
  v17 = 0;
LABEL_18:

  return v17;
}

@end
