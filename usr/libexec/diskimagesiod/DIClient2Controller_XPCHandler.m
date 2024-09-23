@implementation DIClient2Controller_XPCHandler

- (id)serviceName
{
  return CFSTR("com.apple.diskimagescontroller");
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DIControllerProtocol);
}

- (BOOL)connectWithError:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DIClient2Controller_XPCHandler;
  v5 = -[DIBaseXPCHandler connectWithError:](&v7, "connectWithError:");
  if (v5)
  {
    if (sub_1000BF0BC())
      LOBYTE(v5) = -[DIBaseXPCHandler dupStderrWithError:](self, "dupStderrWithError:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)newAttachWithParams:(id)a3 error:(id *)a4
{
  id v6;
  DIController2ClientDelegate *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_alloc_init(DIController2ClientDelegate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DIController2ClientProtocol));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  objc_msgSend(v9, "setExportedInterface:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  objc_msgSend(v10, "setExportedObject:", v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_100082E28;
  v17 = &unk_1001741D8;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v11, "attachWithParams:reply:", v6, &v14);

  if (-[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a4, v14, v15, v16, v17))
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2ClientDelegate deviceHandle](v7, "deviceHandle"));
  else
    v12 = 0;
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v12;
}

- (BOOL)keychainUnlockWithEncryptionUnlocker:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100082F84;
  v10[3] = &unk_10017EA68;
  objc_copyWeak(&v12, &location);
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "keychainUnlockWithEncryptionUnlocker:reply:", v8, v10);

  LOBYTE(a4) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a4);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return (char)a4;
}

- (BOOL)GUIAskForPassphraseWithEncryptionFrontend:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100083120;
  v10[3] = &unk_10017EA90;
  objc_copyWeak(&v12, &location);
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "GUIAskForPassphraseWithEncryptionFrontend:reply:", v8, v10);

  LOBYTE(a4) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a4);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return (char)a4;
}

- (BOOL)createAndStoreInSystemKeychainWithCreator:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteProxy](self, "remoteProxy"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000832D0;
  v13[3] = &unk_10017EAB8;
  objc_copyWeak(&v15, &location);
  v11 = v8;
  v14 = v11;
  objc_msgSend(v10, "createAndStoreInSystemKeychainWithCreator:account:reply:", v11, v9, v13);

  LOBYTE(a5) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a5);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return (char)a5;
}

@end
