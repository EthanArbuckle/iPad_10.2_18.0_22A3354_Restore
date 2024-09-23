@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  XPCUbiquityDisableService *v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___XPCUbiquityDisableServiceProtocol));
  objc_msgSend(v4, "setExportedInterface:", v5);

  v6 = objc_opt_new(XPCUbiquityDisableService);
  objc_msgSend(v4, "setExportedObject:", v6);
  objc_msgSend(v4, "resume");

  return 1;
}

@end
