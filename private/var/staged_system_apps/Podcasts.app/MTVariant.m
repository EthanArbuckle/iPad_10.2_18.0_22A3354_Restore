@implementation MTVariant

+ (BOOL)isInternalUIBuild
{
  return os_variant_has_internal_ui("com.apple.podcasts", a2);
}

@end
