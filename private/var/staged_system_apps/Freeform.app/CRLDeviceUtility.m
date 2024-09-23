@implementation CRLDeviceUtility

+ (BOOL)isDeviceCapableForUpdate
{
  return sub_100B02EA0() & 1;
}

@end
