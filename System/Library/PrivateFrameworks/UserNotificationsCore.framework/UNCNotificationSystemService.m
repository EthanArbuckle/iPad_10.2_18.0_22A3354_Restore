@implementation UNCNotificationSystemService

+ (id)domain
{
  return CFSTR("com.apple.usernotifications.systemservice");
}

+ (id)machServiceName
{
  return CFSTR("com.apple.usernotifications.systemservice");
}

+ (id)serviceInterface
{
  if (serviceInterface_onceToken != -1)
    dispatch_once(&serviceInterface_onceToken, &__block_literal_global_9);
  return (id)serviceInterface_serviceInterface;
}

void __48__UNCNotificationSystemService_serviceInterface__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE0F9F8], "interfaceWithIdentifier:", CFSTR("com.apple.usernotifications.systemservice"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2578C8720);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2578D5788);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)serviceInterface_serviceInterface;
  serviceInterface_serviceInterface = v2;

}

@end
