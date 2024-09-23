@implementation TTSAssetQuality

+ (TTSAssetQuality)compact
{
  return (TTSAssetQuality *)static TTSAssetQuality.compact.getter();
}

+ (TTSAssetQuality)premium
{
  return (TTSAssetQuality *)static TTSAssetQuality.premium.getter();
}

+ (TTSAssetQuality)premiumhigh
{
  return (TTSAssetQuality *)static TTSAssetQuality.premiumhigh.getter();
}

+ (TTSAssetQuality)beta
{
  return (TTSAssetQuality *)static TTSAssetQuality.beta.getter();
}

@end
