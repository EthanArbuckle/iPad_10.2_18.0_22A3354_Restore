@implementation THApplePubAssetPluginProvider

+ (id)sharedPlugin
{
  return +[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin");
}

@end
