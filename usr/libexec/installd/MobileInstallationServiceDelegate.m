@implementation MobileInstallationServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  id v5;
  void *v6;
  MIClientConnection *v7;
  id v8;
  void *v9;

  v4 = a4;
  v5 = sub_100008140();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "setExportedInterface:", v6);

  v7 = objc_opt_new(MIClientConnection);
  objc_msgSend(v4, "setExportedObject:", v7);
  v8 = sub_1000080CC();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v4, "setRemoteObjectInterface:", v9);

  -[MIClientConnection setXpcConnection:](v7, "setXpcConnection:", v4);
  objc_msgSend(v4, "setInterruptionHandler:", &stru_1000850F0);
  objc_msgSend(v4, "setInvalidationHandler:", &stru_100085110);
  objc_msgSend(v4, "resume");

  return 1;
}

@end
