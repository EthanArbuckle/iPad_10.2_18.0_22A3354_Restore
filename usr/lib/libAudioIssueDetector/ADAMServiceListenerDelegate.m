@implementation ADAMServiceListenerDelegate

- (ADAMServiceListenerDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ADAMServiceListenerDelegate;
  return -[ADAMServiceListenerDelegate init](&v3, sel_init);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  ADAMServerDelegate *v15;
  id v16;
  id v17;
  NSObject *v18;
  int v19;
  const char *v20;
  _BYTE v22[34];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = (void *)MEMORY[0x219A01060]();
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.audio.adam.xpc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    v8 = 0;
    goto LABEL_12;
  }
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  v8 = 560295540;
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v9 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v9)
      goto LABEL_12;
  }
  else
  {
    v9 = (id)MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v22 = 136315650;
    *(_QWORD *)&v22[4] = "ADAMServiceListenerDelegate.mm";
    *(_WORD *)&v22[12] = 1024;
    *(_DWORD *)&v22[14] = 39;
    *(_WORD *)&v22[18] = 2112;
    *(_QWORD *)&v22[20] = v12;
    _os_log_impl(&dword_216CFB000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Entitlement missing when connecting to ADAM: %@", v22, 0x1Cu);

  }
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4F9A8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v13);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E51A60);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v14);

  v15 = -[ADAMServerDelegate initWithConnection:andErrorCode:]([ADAMServerDelegate alloc], "initWithConnection:andErrorCode:", v4, v8);
  objc_msgSend(v4, "setExportedObject:", v15);
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v16 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v16)
      goto LABEL_23;
  }
  else
  {
    v16 = (id)MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  v18 = v16;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(v4, "processIdentifier");
    v20 = "Failed";
    *(_DWORD *)v22 = 136315906;
    *(_QWORD *)&v22[4] = "ADAMServiceListenerDelegate.mm";
    *(_WORD *)&v22[12] = 1024;
    *(_DWORD *)&v22[14] = 51;
    if (v7)
      v20 = "Success";
    *(_WORD *)&v22[18] = 1024;
    *(_DWORD *)&v22[20] = v19;
    *(_WORD *)&v22[24] = 2080;
    *(_QWORD *)&v22[26] = v20;
    _os_log_impl(&dword_216CFB000, v18, OS_LOG_TYPE_INFO, "%25s:%-5d New XPC Connection to ADAM from pid: %d [%s]", v22, 0x22u);
  }

LABEL_23:
  objc_msgSend(v4, "resume", *(_OWORD *)v22, *(_QWORD *)&v22[16]);

  objc_autoreleasePoolPop(v5);
  return 1;
}

@end
