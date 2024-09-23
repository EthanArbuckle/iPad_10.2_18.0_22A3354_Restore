@implementation STScreenTimeAgentPrivateConnection

+ (id)newConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.private"), 4096);
  v4 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (id)newInterface
{
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC90678);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newContactsServiceConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent.Contacts"), 4096);
  v4 = (void *)objc_msgSend(a1, "newContactsServiceInterface");
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (id)newContactsServiceInterface
{
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC8B978);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
