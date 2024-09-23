@implementation TTSAssetFactoryTrialAsset

- (TTSAssetSource)assetSource
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19AD61828();

  return (TTSAssetSource *)v3;
}

- (TTSAssetType)assetType
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AD61898();
  v4 = v3;

  return (TTSAssetType *)v4;
}

- (NSArray)supportedLanguages
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  void *v3;

  v2 = self;
  sub_19AD61BB4();

  v3 = (void *)sub_19AE55664();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSString)name
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19AD61D00);
}

- (TTSAssetTechnology)technology
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AD61DA8();
  v4 = v3;

  return (TTSAssetTechnology *)v4;
}

- (TTSAssetQuality)quality
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AD621F0();
  v4 = v3;

  return (TTSAssetQuality *)v4;
}

- (int64_t)gender
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19AD624BC();
  v4 = v3;

  return v4;
}

- (NSBundle)bundle
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19AD626A8();

  return (NSBundle *)v3;
}

- (NSNumber)diskSize
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AD62884();
  v4 = v3;

  return (NSNumber *)v4;
}

- (int64_t)versionNumber
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19AD62B4C();
  v4 = v3;

  return v4;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19AD62E2C);
}

- (BOOL)downloading
{
  return 0;
}

- (BOOL)purgeable
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_19AD62EF8();

  return v3 & 1;
}

- (BOOL)locallyAvailable
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_19AD62F50();

  return v3 & 1;
}

- (void)purge
{
  _TtC14SiriTTSService25TTSAssetFactoryTrialAsset *v2;

  v2 = self;
  sub_19AD62F78();

}

- (_TtC14SiriTTSService25TTSAssetFactoryTrialAsset)init
{
  sub_19AD63004();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
