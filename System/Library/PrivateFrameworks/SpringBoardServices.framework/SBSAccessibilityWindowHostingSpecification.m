@implementation SBSAccessibilityWindowHostingSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.accessibility-window-hosting");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_1 != -1)
    dispatch_once(&interface_onceToken_1, &__block_literal_global_11);
  return (BSServiceInterface *)(id)interface___interface_1;
}

void __55__SBSAccessibilityWindowHostingSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE149CA0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE140C68);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface___interface_1;
  interface___interface_1 = v1;

}

@end
