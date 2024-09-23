@implementation SystemHealthManager

- (SystemHealthManager)init
{
  SystemHealthManager *v2;
  void *v3;
  uint64_t v4;
  NSXPCConnection *connectionToService;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SystemHealthManager;
  v2 = -[SystemHealthManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    v2->deviceClass = objc_msgSend(v3, "intValue");

    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.mobilerepaird"), 0);
    connectionToService = v2->_connectionToService;
    v2->_connectionToService = (NSXPCConnection *)v4;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A19938);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connectionToService, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](v2->_connectionToService, "resume");
  }
  return v2;
}

- (BOOL)shouldFilterComponent:(unint64_t)a3
{
  int deviceClass;
  BOOL v4;

  deviceClass = self->deviceClass;
  v4 = deviceClass != 1 || a3 == 12;
  return deviceClass != 3 && v4;
}

- (BOOL)isSupportedIPad
{
  void *v2;
  BOOL v3;

  v2 = (void *)MGCopyAnswer();
  v3 = objc_msgSend(v2, "intValue") == 3 && AMFDRSealingMapGetEntry() != 0;

  return v3;
}

- (void)postComponentStatusEventFor:(unint64_t)a3 status:(unint64_t)a4 withReply:(id)a5
{
  void (**v8)(id, uint64_t, void *);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t, void *))a5;
  if (-[SystemHealthManager shouldFilterComponent:](self, "shouldFilterComponent:", a3))
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0FC8];
    v20[0] = CFSTR("not supported in this mode or device");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), 5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }
  else
  {
    if (self->deviceClass == 3 && !-[SystemHealthManager isSupportedIPad](self, "isSupportedIPad"))
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BDD0FC8];
      v18 = CFSTR("not supported in this mode or device");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corerepair"), 5, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
    }
    else
    {
      v11 = 0;
      v12 = 1;
    }
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connectionToService, "remoteObjectProxyWithErrorHandler:", &unk_24C93CB78);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_20E3983F0;
    v16[3] = &unk_24C93CBA0;
    v16[4] = self;
    objc_msgSend(v15, "postComponentStatusEventFor:status:withReply:", a3, a4, v16);

  }
  v8[2](v8, v12, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

@end
