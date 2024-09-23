@implementation SBSSmartCoverServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.smart-cover");
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
  block[2] = __46__SBSSmartCoverServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_23 != -1)
    dispatch_once(&interface_onceToken_23, block);
  return (BSServiceInterface *)(id)interface___interface_22;
}

void __46__SBSSmartCoverServiceSpecification_interface__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = (void *)MEMORY[0x1E0D03430];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "interfaceWithIdentifier:", v2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE14A540);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v3);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE14A5A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClient:", v4);

  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)interface___interface_22;
  interface___interface_22 = v5;

}

@end
