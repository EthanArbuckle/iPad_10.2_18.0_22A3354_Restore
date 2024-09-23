@implementation NSBundle(PhotosUICore)

+ (id)px_bundle
{
  if (px_bundle_onceToken != -1)
    dispatch_once(&px_bundle_onceToken, &__block_literal_global_284883);
  return (id)px_bundle_frameworkBundle;
}

@end
