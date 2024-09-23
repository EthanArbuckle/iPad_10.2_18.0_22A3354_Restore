@implementation SBSHomeScreenServiceSpecification

+ (BSServiceInterface)interface
{
  if (interface_onceToken_8 != -1)
    dispatch_once(&interface_onceToken_8, &__block_literal_global_20);
  return (BSServiceInterface *)(id)interface___interface_8;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.homescreen");
}

void __46__SBSHomeScreenServiceSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE149E80);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE13FB28);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface___interface_8;
  interface___interface_8 = v1;

}

@end
