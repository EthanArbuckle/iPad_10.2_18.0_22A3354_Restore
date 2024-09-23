@implementation SBSSysdiagnoseInterface

- (SBSSysdiagnoseInterface)init
{
  return -[SBSSysdiagnoseInterface initWithTarget:](self, "initWithTarget:", CFSTR("localhost"));
}

- (SBSSysdiagnoseInterface)initWithTarget:(id)a3
{
  id v4;
  SBSSysdiagnoseInterface *v5;
  uint64_t v6;
  NSXPCConnection *sbConnection;
  void *v8;
  uint64_t v9;
  SBSImplementer *sbProxy;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSSysdiagnoseInterface;
  v5 = -[SBSSysdiagnoseInterface init](&v13, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("localhost")))
    {
      +[SBSUtils connectionWithExportedObject:](SBSUtils, "connectionWithExportedObject:", 0);
      v6 = objc_claimAutoreleasedReturnValue();
      sbConnection = v5->_sbConnection;
      v5->_sbConnection = (NSXPCConnection *)v6;

      -[SBSSysdiagnoseInterface sbConnection](v5, "sbConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteObjectProxy");
      v9 = objc_claimAutoreleasedReturnValue();
      sbProxy = v5->_sbProxy;
      v5->_sbProxy = (SBSImplementer *)v9;

    }
    else
    {
      +[SBSUtils createProxyConnectionForRapportTarget:](SBSUtils, "createProxyConnectionForRapportTarget:", v4);
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = v5->_sbProxy;
      v5->_sbProxy = (SBSImplementer *)v11;
    }

  }
  return v5;
}

- (void)sysdiagnoseHasStarted:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  v3 = a3;
  -[SBSSysdiagnoseInterface sbConnection](self, "sbConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__SBSSysdiagnoseInterface_sysdiagnoseHasStarted___block_invoke;
  v6[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  v7 = v3;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sysdiagnoseHasStarted:", v3);

}

- (void)createSysdiagnose:(id)a3
{
  id v4;
  SBSImplementer *sbProxy;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sbProxy = self->_sbProxy;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SBSSysdiagnoseInterface_createSysdiagnose___block_invoke;
  v7[3] = &unk_24EB7DBB8;
  v8 = v4;
  v6 = v4;
  -[SBSImplementer createSysdiagnose:](sbProxy, "createSysdiagnose:", v7);

}

- (void)cancelSysdiagnose:(id)a3
{
  id v4;
  SBSImplementer *sbProxy;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sbProxy = self->_sbProxy;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SBSSysdiagnoseInterface_cancelSysdiagnose___block_invoke;
  v7[3] = &unk_24EB7E3B0;
  v8 = v4;
  v6 = v4;
  -[SBSImplementer cancelCurrentSysdiagnose:](sbProxy, "cancelCurrentSysdiagnose:", v7);

}

- (void)airDropSysdiagnose:(id)a3 airDropID:(id)a4 completionHandler:(id)a5
{
  id v8;
  SBSImplementer *sbProxy;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  sbProxy = self->_sbProxy;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__SBSSysdiagnoseInterface_airDropSysdiagnose_airDropID_completionHandler___block_invoke;
  v11[3] = &unk_24EB7DBE0;
  v12 = v8;
  v10 = v8;
  -[SBSImplementer airDropSysdiagnose:airDropID:completionHandler:](sbProxy, "airDropSysdiagnose:airDropID:completionHandler:", a3, a4, v11);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_sbConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSSysdiagnoseInterface;
  -[SBSSysdiagnoseInterface dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)sbConnection
{
  return self->_sbConnection;
}

- (SBSImplementer)sbProxy
{
  return self->_sbProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

uint64_t __74__SBSSysdiagnoseInterface_airDropSysdiagnose_airDropID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__SBSSysdiagnoseInterface_cancelSysdiagnose___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__SBSSysdiagnoseInterface_createSysdiagnose___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__SBSSysdiagnoseInterface_sysdiagnoseHasStarted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _SBSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(unsigned __int8 *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v5;
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_222D7A000, v4, OS_LOG_TYPE_ERROR, "Failed to set sysdiagnose started to %d, %@", (uint8_t *)v6, 0x12u);
  }

}

@end
