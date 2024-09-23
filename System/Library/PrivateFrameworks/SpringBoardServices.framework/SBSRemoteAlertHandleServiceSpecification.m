@implementation SBSRemoteAlertHandleServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.remote-alert-service");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
}

+ (BSServiceInterface)interface
{
  if (interface_sOnceToken != -1)
    dispatch_once(&interface_sOnceToken, &__block_literal_global_8);
  return (BSServiceInterface *)(id)interface_sInterface;
}

void __53__SBSRemoteAlertHandleServiceSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE149C40);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE144BA8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface_sInterface;
  interface_sInterface = v1;

}

@end
