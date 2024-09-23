@implementation SCSharingReminderXPCClient

- (SCSharingReminderXPCClient)initWithConnection:(id)a3
{
  id v5;
  SCSharingReminderXPCClient *v6;
  SCSharingReminderXPCClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCSharingReminderXPCClient;
  v6 = -[SCSharingReminderXPCClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v7->_pid = objc_msgSend(v5, "processIdentifier");
  }

  return v7;
}

- (BOOL)hasAccess
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SCSharingReminderXPCClient xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.private.safetycheckd.scsharingreminders"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "BOOLValue") & 1) != 0
    || -[SCSharingReminderXPCClient hasFeatureAccess](self, "hasFeatureAccess");

  return v5;
}

- (BOOL)hasFeatureAccess
{
  void *v2;
  void *v3;
  char v4;

  -[SCSharingReminderXPCClient xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.private.safetycheckd.scsharingreminders.internal"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)name
{
  void *v3;
  NSString *v4;
  int *p_pid;
  NSString *name;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE buffer[32];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_name)
    return self->_name;
  -[SCSharingReminderXPCClient clientBundle](self, "clientBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSBundle bundleIdentifier](self->_clientBundle, "bundleIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    name = self->_name;
    self->_name = v4;

    return self->_name;
  }
  p_pid = &self->_pid;
  if (proc_name(self->_pid, buffer, 0x20u) >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buffer);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  SCLogger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SCSharingReminderXPCClient name].cold.1((uint64_t)p_pid, v8, v9, v10, v11, v12, v13, v14);

  return (NSString *)0;
}

- (id)clientBundle
{
  NSBundle *clientBundle;
  int *p_pid;
  void *v5;
  void *v6;
  void *v7;
  NSBundle *v8;
  NSBundle *v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE buffer[4096];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  clientBundle = self->_clientBundle;
  if (clientBundle)
    return clientBundle;
  p_pid = &self->_pid;
  if (proc_pidpath(self->_pid, buffer, 0x1000u) >= 1)
  {
    v5 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buffer);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleWithPath:", v7);
    v8 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    v9 = self->_clientBundle;
    self->_clientBundle = v8;

    clientBundle = self->_clientBundle;
    return clientBundle;
  }
  SCLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SCSharingReminderXPCClient clientBundle].cold.1((uint64_t)p_pid, v11, v12, v13, v14, v15, v16, v17);

  return 0;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_clientBundle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)name
{
  OUTLINED_FUNCTION_0_2(&dword_2454C0000, a2, a3, "\"proc_name failed for process identifier: %d\", a5, a6, a7, a8, 0);
}

- (void)clientBundle
{
  OUTLINED_FUNCTION_0_2(&dword_2454C0000, a2, a3, "\"Could not resolve path for process identifier: %d\", a5, a6, a7, a8, 0);
}

@end
