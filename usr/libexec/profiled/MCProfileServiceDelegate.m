@implementation MCProfileServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  MCProfileServicer *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectionTracker"));
  objc_msgSend(v6, "trackConnectionFromPID:", objc_msgSend(v4, "processIdentifier"));

  v7 = objc_opt_new(MCProfileServicer);
  -[MCProfileServicer setXpcConnection:](v7, "setXpcConnection:", v4);
  v8 = MCXPCProtocolInterface(objc_msgSend(v4, "setExportedObject:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v4, "setExportedInterface:", v9);

  v10 = MCProfileConnectionXPCProtocolInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v4, "setRemoteObjectInterface:", v11);

  objc_msgSend(v4, "resume");
  return 1;
}

@end
