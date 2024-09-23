@implementation TTSAssetSource

+ (TTSAssetSource)macosLegacy
{
  return (TTSAssetSource *)static TTSAssetSource.macosLegacy.getter();
}

+ (TTSAssetSource)mobileAsset
{
  return (TTSAssetSource *)static TTSAssetSource.mobileAsset.getter();
}

+ (TTSAssetSource)turiTrial
{
  return (TTSAssetSource *)static TTSAssetSource.turiTrial.getter();
}

+ (TTSAssetSource)adhoc
{
  return (TTSAssetSource *)static TTSAssetSource.adhoc.getter();
}

+ (TTSAssetSource)preinstalled
{
  return (TTSAssetSource *)static TTSAssetSource.preinstalled.getter();
}

+ (TTSAssetSource)factory
{
  return (TTSAssetSource *)static TTSAssetSource.factory.getter();
}

@end
