@implementation DMDLockUtilities

+ (void)lockDevice
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort(a1, a2);
  SBLockDevice(v2, 1);
}

@end
