@implementation RMXPCProxy

+ (id)newConnectionWithScope:(int64_t)a3
{
  if (a3 == 1)
    return +[RMXPCProxy newDaemonConnection](RMXPCProxy, "newDaemonConnection");
  else
    return +[RMXPCProxy newAgentConnection](RMXPCProxy, "newAgentConnection");
}

+ (id)newAgentConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.RemoteManagementAgent"), 0);
  v4 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (id)newDaemonConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.remotemanagementd"), 4096);
  v4 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (id)newConnectionWithListenerEndpoint:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1988];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithListenerEndpoint:", v5);

  v7 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  return v6;
}

+ (id)newInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550091A8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_fetchConfigurationsWithTypes_completionHandler_, 0, 1);

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_queryForStatusAndErrorsWithKeyPaths_fromManagementSourceWithIdentifier_completionHandler_, 1, 1);

  return v2;
}

@end
