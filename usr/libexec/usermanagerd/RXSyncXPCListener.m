@implementation RXSyncXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_xpcConnection"));
  __xpc_connection_set_logging(v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedXPCInterface](RDServer, "sharedXPCInterface"));
  objc_msgSend(v4, "setExportedInterface:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedServer](RDServer, "sharedServer"));
  objc_msgSend(v4, "setExportedObject:", v7);

  objc_msgSend(v4, "resume");
  return 1;
}

@end
