@implementation TTSAssetStaticVoice

- (TTSAssetType)assetType
{
  _TtC14SiriTTSService19TTSAssetStaticVoice *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19ADCADE0();

  return (TTSAssetType *)v3;
}

- (TTSAssetSource)assetSource
{
  sub_19ADCAFEC();
}

- (TTSAssetTechnology)technology
{
  _TtC14SiriTTSService19TTSAssetStaticVoice *v2;
  id v3;

  v2 = self;
  v3 = sub_19ADCB068();

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  _TtC14SiriTTSService19TTSAssetStaticVoice *v2;
  id v3;

  v2 = self;
  v3 = sub_19ADCB5B4();

  return (TTSAssetQuality *)v3;
}

- (NSString)name
{
  return (NSString *)sub_19ADCDDCC(self);
}

- (NSString)identifier
{
  return (NSString *)sub_19ADCDDCC(self);
}

- (int64_t)versionNumber
{
  _TtC14SiriTTSService19TTSAssetStaticVoice *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19ADCC770();
  v4 = v3;

  return v4;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19ADCDDCC(self);
}

- (NSArray)supportedLanguages
{
  return (NSArray *)sub_19ADCDEF8(self);
}

- (int64_t)gender
{
  _TtC14SiriTTSService19TTSAssetStaticVoice *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19ADCCD20();
  v4 = v3;

  return v4;
}

- (NSNumber)age
{
  _TtC14SiriTTSService19TTSAssetStaticVoice *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19ADCCEB0();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)sub_19ADCE03C(self);
}

- (NSNumber)diskSize
{
  _TtC14SiriTTSService19TTSAssetStaticVoice *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19ADCCF80();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSBundle)bundle
{
  id v2;

  sub_19ADCCFE4();
  return (NSBundle *)v2;
}

- (_TtC14SiriTTSService19TTSAssetStaticVoice)init
{
  sub_19ADCD00C();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();
}

@end
