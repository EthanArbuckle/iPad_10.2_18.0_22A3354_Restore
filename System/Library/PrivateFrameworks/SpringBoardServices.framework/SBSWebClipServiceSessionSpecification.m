@implementation SBSWebClipServiceSessionSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.web-clip-service");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_19 != -1)
    dispatch_once(&interface_onceToken_19, &__block_literal_global_41);
  return (BSServiceInterface *)(id)interface___interface_18;
}

void __50__SBSWebClipServiceSessionSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE14A3C0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE14A420);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface___interface_18;
  interface___interface_18 = v1;

}

@end
