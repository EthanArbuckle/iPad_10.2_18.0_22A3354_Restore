@implementation SBSUIWallpaperServiceInterfaceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.paperboard.wallpaper-service");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1)
    dispatch_once(&interface_onceToken_0, &__block_literal_global_18);
  return (BSServiceInterface *)(id)interface___interface_0;
}

void __56__SBSUIWallpaperServiceInterfaceSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE7D2948);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE7D29A8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23038], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface___interface_0;
  interface___interface_0 = v1;

}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
}

@end
