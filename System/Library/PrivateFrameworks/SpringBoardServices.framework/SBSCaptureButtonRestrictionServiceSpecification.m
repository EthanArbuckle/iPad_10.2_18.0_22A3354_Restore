@implementation SBSCaptureButtonRestrictionServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.springboard.capture-button-restriction-service");
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
  block[2] = __60__SBSCaptureButtonRestrictionServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_18 != -1)
    dispatch_once(&interface_onceToken_18, block);
  return (BSServiceInterface *)(id)interface___interface_17;
}

void __60__SBSCaptureButtonRestrictionServiceSpecification_interface__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE14A300);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE14A360);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D03430];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interfaceWithIdentifier:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)interface___interface_17;
  interface___interface_17 = v5;

  objc_msgSend((id)interface___interface_17, "setServer:", v7);
  objc_msgSend((id)interface___interface_17, "setClient:", v2);

}

@end
