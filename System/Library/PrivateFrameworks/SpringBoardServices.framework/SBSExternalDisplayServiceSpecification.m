@implementation SBSExternalDisplayServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.external-display-service");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
}

+ (BSServiceInterface)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SBSExternalDisplayServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_14 != -1)
    dispatch_once(&interface_onceToken_14, block);
  return (BSServiceInterface *)(id)interface___interface_13;
}

void __51__SBSExternalDisplayServiceSpecification_interface__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE14A0C0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE142DD8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D03430];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interfaceWithIdentifier:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)interface___interface_13;
  interface___interface_13 = v5;

  objc_msgSend((id)interface___interface_13, "setServer:", v7);
  objc_msgSend((id)interface___interface_13, "setClient:", v2);

}

@end
