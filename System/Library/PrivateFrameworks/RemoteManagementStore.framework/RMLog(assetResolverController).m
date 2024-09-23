@implementation RMLog(assetResolverController)

+ (id)assetResolverController
{
  if (assetResolverController_onceToken != -1)
    dispatch_once(&assetResolverController_onceToken, &__block_literal_global);
  return (id)assetResolverController_result;
}

@end
