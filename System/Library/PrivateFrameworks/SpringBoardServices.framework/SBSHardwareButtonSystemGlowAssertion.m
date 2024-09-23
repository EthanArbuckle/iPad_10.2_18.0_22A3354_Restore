@implementation SBSHardwareButtonSystemGlowAssertion

- (void)setSystemGlowStyle:(int64_t)a3
{
  SBSHardwareButtonService *v4;

  if (-[SBSAssertion isValid](self, "isValid"))
  {
    v4 = objc_alloc_init(SBSHardwareButtonService);
    -[SBSHardwareButtonService updateSystemGlowStyle:](v4, "updateSystemGlowStyle:", a3);

  }
}

@end
