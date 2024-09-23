@implementation NCPlatformEligibility

+ (BOOL)areGenerativeModelsAvailable
{
  return MEMORY[0x1D17DBF2C](a1, a2) & 1;
}

- (NCPlatformEligibility)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCPlatformEligibility;
  return -[NCPlatformEligibility init](&v3, sel_init);
}

@end
