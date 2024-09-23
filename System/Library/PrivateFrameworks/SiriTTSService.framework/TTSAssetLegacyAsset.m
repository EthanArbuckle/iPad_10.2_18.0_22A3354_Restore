@implementation TTSAssetLegacyAsset

- (TTSAssetType)assetType
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19AE070E0();

  return (TTSAssetType *)v3;
}

- (TTSAssetSource)assetSource
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19AE072E8();

  return (TTSAssetSource *)v3;
}

- (TTSAssetTechnology)technology
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19AE07358((uint64_t)v2);

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19AE0773C((uint64_t)v2);

  return (TTSAssetQuality *)v3;
}

- (NSString)name
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19AE07AE4);
}

- (NSString)identifier
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19AE07BB0);
}

- (int64_t)versionNumber
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_19AE07E0C();

  return v3;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19AD62DD8(self, (uint64_t)a2, (void (*)(void))sub_19AE08084);
}

- (NSArray)supportedLanguages
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  void *v3;

  v2 = self;
  sub_19AE082C0();

  v3 = (void *)sub_19AE55664();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)gender
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19AE083FC();
  v4 = v3;

  return v4;
}

- (NSNumber)age
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AE084AC();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSNumber)diskSize
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AE08560();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSDictionary)attributes
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  void *v3;

  v2 = self;
  sub_19AE089E0();

  v3 = (void *)sub_19AE5537C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (NSBundle)bundle
{
  id v2;

  sub_19AE08D44();
  return (NSBundle *)v2;
}

- (BOOL)purgeable
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_19AE08D9C();

  return v3;
}

- (void)purge
{
  _TtC14SiriTTSService19TTSAssetLegacyAsset *v2;

  v2 = self;
  sub_19AE08E4C();

}

- (_TtC14SiriTTSService19TTSAssetLegacyAsset)init
{
  TTSAssetLegacyAsset.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
