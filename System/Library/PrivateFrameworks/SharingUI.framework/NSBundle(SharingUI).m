@implementation NSBundle(SharingUI)

+ (id)sfui_bundle
{
  if (sfui_bundle_onceToken != -1)
    dispatch_once(&sfui_bundle_onceToken, &__block_literal_global_8);
  return (id)sfui_bundle_frameworkBundle;
}

@end
