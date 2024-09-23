@implementation SSWalletResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.Passbook");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

@end
