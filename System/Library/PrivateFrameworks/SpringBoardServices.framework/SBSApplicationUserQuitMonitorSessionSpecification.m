@implementation SBSApplicationUserQuitMonitorSessionSpecification

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInteractive");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_5 != -1)
    dispatch_once(&interface_onceToken_5, &__block_literal_global_18);
  return (BSServiceInterface *)(id)interface___interface_5;
}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.application-user-quit-monitor-service");
}

void __62__SBSApplicationUserQuitMonitorSessionSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE149DC0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE1451B8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface___interface_5;
  interface___interface_5 = v1;

}

@end
