@implementation UISUIAirDropSecurityScopedResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)readonlySandboxExtensionClassString
{
  return CFSTR("com.apple.sharing.airdrop.readonly");
}

@end
