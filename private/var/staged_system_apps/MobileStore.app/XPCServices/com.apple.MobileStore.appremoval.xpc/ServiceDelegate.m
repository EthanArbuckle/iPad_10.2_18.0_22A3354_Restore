@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  MSXPCAppRemovalService *v7;

  v4 = a4;
  v5 = _LSAppRemovalServiceXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "setExportedInterface:", v6);

  v7 = objc_opt_new(MSXPCAppRemovalService);
  objc_msgSend(v4, "setExportedObject:", v7);
  objc_msgSend(v4, "resume");

  return 1;
}

@end
