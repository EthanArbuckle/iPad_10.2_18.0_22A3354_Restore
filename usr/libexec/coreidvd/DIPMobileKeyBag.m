@implementation DIPMobileKeyBag

+ (int64_t)deviceLockState
{
  return (int)MKBGetDeviceLockState(0, a2);
}

@end
