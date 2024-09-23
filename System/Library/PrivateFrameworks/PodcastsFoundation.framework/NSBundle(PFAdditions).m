@implementation NSBundle(PFAdditions)

+ (id)podcastsFoundationBundle
{
  if (podcastsFoundationBundle_onceToken[0] != -1)
    dispatch_once(podcastsFoundationBundle_onceToken, &__block_literal_global_18);
  return (id)podcastsFoundationBundle_bundle;
}

@end
