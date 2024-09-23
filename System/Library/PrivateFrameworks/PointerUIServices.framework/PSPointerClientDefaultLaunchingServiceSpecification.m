@implementation PSPointerClientDefaultLaunchingServiceSpecification

+ (NSString)domainName
{
  return (NSString *)CFSTR("com.apple.PointerUI.pointeruid-launching");
}

+ (NSString)machName
{
  return (NSString *)CFSTR("com.apple.PointerUI.pointeruid.service-launching");
}

+ (NSString)serviceName
{
  return (NSString *)CFSTR("com.apple.PointerUI.pointeruid.default-service-launching");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInteractive");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1)
    dispatch_once(&interface_onceToken_0, &__block_literal_global_3);
  return (BSServiceInterface *)(id)interface___interface_0;
}

void __64__PSPointerClientDefaultLaunchingServiceSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE136A40);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE1354B8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface___interface_0;
  interface___interface_0 = v1;

}

@end
