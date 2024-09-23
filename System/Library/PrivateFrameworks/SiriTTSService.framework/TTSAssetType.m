@implementation TTSAssetType

+ (TTSAssetType)vocalizerVoice
{
  return (TTSAssetType *)static TTSAssetType.vocalizerVoice.getter();
}

+ (TTSAssetType)macintalkVoice
{
  return (TTSAssetType *)static TTSAssetType.macintalkVoice.getter();
}

+ (TTSAssetType)combinedVoice
{
  return (TTSAssetType *)static TTSAssetType.combinedVoice.getter();
}

+ (TTSAssetType)customVoice
{
  return (TTSAssetType *)static TTSAssetType.customVoice.getter();
}

+ (TTSAssetType)gryphonVoice
{
  return (TTSAssetType *)static TTSAssetType.gryphonVoice.getter();
}

+ (TTSAssetType)voiceResources
{
  return (TTSAssetType *)static TTSAssetType.voiceResources.getter();
}

- (id)pathComponent
{
  TTSAssetType *v2;
  void *v3;

  v2 = self;
  TTSAssetType.pathComponent()();

  v3 = (void *)sub_19AE55424();
  swift_bridgeObjectRelease();
  return v3;
}

@end
