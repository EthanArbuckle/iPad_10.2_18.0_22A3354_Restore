@implementation CKKSControlServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v15;
  NSObject *v16;
  int v17;
  unsigned int v18;
  __int16 v19;
  const __CFString *v20;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.ckks")));
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0 || (objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    v12 = sub_10000BDF4(CFSTR("ckks"), 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 67109378;
      v18 = objc_msgSend(v4, "processIdentifier");
      v19 = 2112;
      v20 = CFSTR("com.apple.private.ckks");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Client pid: %d doesn't have entitlement: %@", (uint8_t *)&v17, 0x12u);
    }

    goto LABEL_8;
  }
  if ((sub_10000BD64() & 1) == 0)
  {
    v15 = sub_10000BDF4(CFSTR("ckks"), 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 67109120;
      v18 = objc_msgSend(v4, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Client pid: %d attempted to use CKKS, but CKKS is not enabled.", (uint8_t *)&v17, 8u);
    }

LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CKKSControlProtocol));
  v8 = CKKSSetupControlProtocol();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v4, "setExportedInterface:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](CKKSViewManager, "manager"));
  objc_msgSend(v4, "setExportedObject:", v10);

  objc_msgSend(v4, "resume");
  v11 = 1;
LABEL_9:

  return v11;
}

@end
