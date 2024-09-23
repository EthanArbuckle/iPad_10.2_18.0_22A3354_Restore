@implementation ISODeviceInfo

+ (BOOL)isInternalBuild
{
  return os_variant_has_internal_diagnostics();
}

@end
