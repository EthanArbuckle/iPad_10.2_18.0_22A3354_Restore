@implementation UNCNotificationCoreService

+ (id)domain
{
  return CFSTR("com.apple.usernotifications.coreservice");
}

+ (id)machServiceName
{
  return CFSTR("com.apple.usernotifications.coreservice");
}

+ (id)serviceName
{
  return CFSTR("com.apple.usernotifications.coreservice");
}

+ (id)serviceInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__UNCNotificationCoreService_serviceInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serviceInterface_onceToken_0 != -1)
    dispatch_once(&serviceInterface_onceToken_0, block);
  return (id)serviceInterface_serviceInterface_0;
}

void __46__UNCNotificationCoreService_serviceInterface__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = (void *)MEMORY[0x24BE0F9F8];
  objc_msgSend(*(id *)(a1 + 32), "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "interfaceWithIdentifier:", v2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2578D5630);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v3);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2578D45F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClient:", v4);

  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)serviceInterface_serviceInterface_0;
  serviceInterface_serviceInterface_0 = v5;

}

@end
