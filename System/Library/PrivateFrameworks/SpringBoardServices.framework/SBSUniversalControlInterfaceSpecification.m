@implementation SBSUniversalControlInterfaceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.universal-control");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInteractive");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_21 != -1)
    dispatch_once(&interface_onceToken_21, &__block_literal_global_44);
  return (BSServiceInterface *)(id)interface___interface_20;
}

void __54__SBSUniversalControlInterfaceSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE14A4E0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE145088);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface___interface_20;
  interface___interface_20 = v1;

}

@end
