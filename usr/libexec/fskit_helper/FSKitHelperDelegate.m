@implementation FSKitHelperDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  FSKitHelper *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.allow-external-storage")));
  v6 = v5;
  if (v5 && objc_msgSend(v5, "BOOLValue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___FSKitHelperProtocol));
    objc_msgSend(v4, "setExportedInterface:", v7);

    v8 = objc_opt_new(FSKitHelper);
    objc_msgSend(v4, "setExportedObject:", v8);
    v9 = fskit_std_log(objc_msgSend(v4, "resume"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10000270C(v10, v11, v12, v13, v14, v15, v16, v17);

    v18 = 1;
  }
  else
  {
    v19 = ((uint64_t (*)(void))fskit_std_log)();
    v8 = (FSKitHelper *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEBUG))
      sub_1000026D8(&v8->super, v20, v21, v22, v23, v24, v25, v26);
    v18 = 0;
  }

  return v18;
}

@end
