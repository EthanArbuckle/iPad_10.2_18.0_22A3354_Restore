@implementation SBSMultitaskingApplicationShortcutServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.multitasking-shortcut-service");
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
  block[2] = __67__SBSMultitaskingApplicationShortcutServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_25 != -1)
    dispatch_once(&interface_onceToken_25, block);
  return (BSServiceInterface *)(id)interface___interface_23;
}

void __67__SBSMultitaskingApplicationShortcutServiceSpecification_interface__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE14A660);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE143110);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D03430];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interfaceWithIdentifier:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)interface___interface_23;
  interface___interface_23 = v5;

  objc_msgSend((id)interface___interface_23, "setServer:", v7);
  objc_msgSend((id)interface___interface_23, "setClient:", v2);

}

@end
