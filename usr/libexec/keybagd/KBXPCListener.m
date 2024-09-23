@implementation KBXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___KBXPCProtocol));
  objc_msgSend(v4, "setExportedInterface:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[KBXPCService sharedService](KBXPCService, "sharedService"));
  objc_msgSend(v4, "setExportedObject:", v6);

  objc_msgSend(v4, "resume");
  return 1;
}

@end
