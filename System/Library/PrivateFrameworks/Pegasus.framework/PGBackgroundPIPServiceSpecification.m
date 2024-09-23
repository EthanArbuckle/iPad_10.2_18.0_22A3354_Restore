@implementation PGBackgroundPIPServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.pegasus.background-pip-service");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, &__block_literal_global_10);
  return (BSServiceInterface *)(id)interface___interface;
}

void __48__PGBackgroundPIPServiceSpecification_interface__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EEEE7E90);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EEEE6A20);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23038], "interfaceWithServer:client:", v3, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)interface___interface;
  interface___interface = v1;

}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
}

@end
