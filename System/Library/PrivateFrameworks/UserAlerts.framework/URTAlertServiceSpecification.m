@implementation URTAlertServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.UserAlerts.alert-presentation");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x24BE0FA38], "userInteractive");
}

+ (BSServiceInterface)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__URTAlertServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, block);
  return (BSServiceInterface *)(id)interface___interface;
}

void __41__URTAlertServiceSpecification_interface__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = (void *)MEMORY[0x24BE0F9F8];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "interfaceWithIdentifier:", v2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2550D0E88);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v3);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2550D16C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClient:", v4);

  objc_msgSend(v7, "setClientMessagingExpectation:", 1);
  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)interface___interface;
  interface___interface = v5;

}

+ (NSString)entitlementName
{
  return (NSString *)CFSTR("com.apple.UserAlerts.destinations");
}

@end
