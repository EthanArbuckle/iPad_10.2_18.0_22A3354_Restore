@implementation TTSAssetTechnology

+ (TTSAssetTechnology)vocalizer
{
  return (TTSAssetTechnology *)static TTSAssetTechnology.vocalizer.getter();
}

+ (TTSAssetTechnology)custom
{
  return (TTSAssetTechnology *)static TTSAssetTechnology.custom.getter();
}

+ (TTSAssetTechnology)macintalk
{
  return (TTSAssetTechnology *)static TTSAssetTechnology.macintalk.getter();
}

+ (TTSAssetTechnology)gryphon
{
  return (TTSAssetTechnology *)static TTSAssetTechnology.gryphon.getter();
}

+ (TTSAssetTechnology)neural
{
  return (TTSAssetTechnology *)static TTSAssetTechnology.neural.getter();
}

+ (TTSAssetTechnology)neuralAX
{
  return (TTSAssetTechnology *)static TTSAssetTechnology.neuralAX.getter();
}

+ (TTSAssetTechnology)natural
{
  return (TTSAssetTechnology *)static TTSAssetTechnology.natural.getter();
}

@end
