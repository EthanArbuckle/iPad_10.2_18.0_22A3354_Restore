@implementation SBUIContinuitySessionServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.continuity-session-service");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
}

+ (BSServiceInterface)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SBUIContinuitySessionServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, block);
  return (BSServiceInterface *)(id)interface___interface;
}

void __54__SBUIContinuitySessionServiceSpecification_interface__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE7D2708);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE7B3440);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D22FE8];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interfaceWithIdentifier:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)interface___interface;
  interface___interface = v5;

  objc_msgSend((id)interface___interface, "setServer:", v7);
  objc_msgSend((id)interface___interface, "setClient:", v2);

}

@end
