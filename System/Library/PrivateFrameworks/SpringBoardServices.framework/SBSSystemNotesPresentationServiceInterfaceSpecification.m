@implementation SBSSystemNotesPresentationServiceInterfaceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.system-notes-presentation-service");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_3 != -1)
    dispatch_once(&interface_onceToken_3, &__block_literal_global_12);
  return (BSServiceInterface *)(id)interface___interface_3;
}

void __68__SBSSystemNotesPresentationServiceInterfaceSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE13A8A0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE144FA8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03470], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface___interface_3;
  interface___interface_3 = v1;

}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
}

@end
