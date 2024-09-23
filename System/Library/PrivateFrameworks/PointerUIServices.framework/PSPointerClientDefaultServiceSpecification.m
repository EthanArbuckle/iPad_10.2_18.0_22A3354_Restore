@implementation PSPointerClientDefaultServiceSpecification

+ (NSString)domainName
{
  return (NSString *)CFSTR("com.apple.PointerUI.pointeruid");
}

+ (NSString)machName
{
  return (NSString *)CFSTR("com.apple.PointerUI.pointeruid.service");
}

+ (NSString)serviceName
{
  return (NSString *)CFSTR("com.apple.PointerUI.pointeruid.default-service");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInteractive");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, &__block_literal_global_2);
  return (BSServiceInterface *)(id)interface___interface;
}

void __55__PSPointerClientDefaultServiceSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE1369E0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE135458);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface___interface;
  interface___interface = v1;

}

@end
