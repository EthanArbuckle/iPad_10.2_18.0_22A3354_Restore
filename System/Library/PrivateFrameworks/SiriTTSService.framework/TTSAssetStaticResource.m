@implementation TTSAssetStaticResource

- (TTSAssetType)assetType
{
  _TtC14SiriTTSService22TTSAssetStaticResource *v2;
  id v3;

  v2 = self;
  v3 = sub_19AD4932C(&qword_1ED05B268, (id *)&qword_1ED05B260);

  return (TTSAssetType *)v3;
}

- (TTSAssetSource)assetSource
{
  sub_19ADCD844();
}

- (TTSAssetTechnology)technology
{
  _TtC14SiriTTSService22TTSAssetStaticResource *v2;
  id v3;

  v2 = self;
  v3 = sub_19AD4932C(&qword_1ED05AD40, (id *)&qword_1ED05AE88);

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  _TtC14SiriTTSService22TTSAssetStaticResource *v2;
  id v3;

  v2 = self;
  v3 = sub_19AD4932C(&qword_1ED055580, (id *)&qword_1ED055668);

  return (TTSAssetQuality *)v3;
}

- (NSString)name
{
  void *v2;

  v2 = (void *)sub_19AE55424();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)identifier
{
  return (NSString *)sub_19ADCDDCC(self);
}

- (int64_t)versionNumber
{
  _TtC14SiriTTSService22TTSAssetStaticResource *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19ADCDD3C();
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

- (NSDictionary)attributes
{
  return (NSDictionary *)sub_19ADCE03C(self);
}

- (NSNumber)diskSize
{
  _TtC14SiriTTSService22TTSAssetStaticResource *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19ADCE0C4();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSBundle)bundle
{
  id v2;

  sub_19ADCE358();
  return (NSBundle *)v2;
}

- (BOOL)purgeable
{
  _TtC14SiriTTSService22TTSAssetStaticResource *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_19ADCE3B0();

  return v3 & 1;
}

- (_TtC14SiriTTSService22TTSAssetStaticResource)init
{
  sub_19ADCE454();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
