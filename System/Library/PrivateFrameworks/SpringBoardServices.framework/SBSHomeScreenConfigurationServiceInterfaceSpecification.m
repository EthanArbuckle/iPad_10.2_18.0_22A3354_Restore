@implementation SBSHomeScreenConfigurationServiceInterfaceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.home-screen-configuration-service");
}

+ (NSString)domain
{
  return (NSString *)CFSTR("com.apple.frontboard");
}

+ (BSServiceInterface)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SBSHomeScreenConfigurationServiceInterfaceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_11 != -1)
    dispatch_once(&interface_onceToken_11, block);
  return (BSServiceInterface *)(id)interface_interface;
}

void __68__SBSHomeScreenConfigurationServiceInterfaceSpecification_interface__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = (void *)MEMORY[0x1E0D03430];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "interfaceWithIdentifier:", v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE144310);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServer:", v3);

  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)interface_interface;
  interface_interface = v4;

}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInteractive");
}

@end
