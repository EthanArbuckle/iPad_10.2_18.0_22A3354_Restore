@implementation SMCOSVariant

+ (BOOL)isInternal:(const char *)a3
{
  return os_variant_has_internal_ui();
}

@end
