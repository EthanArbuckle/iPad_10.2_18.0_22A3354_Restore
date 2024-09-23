@implementation TTSAssetTrialResourceAsset

- (TTSAssetType)assetType
{
  _TtC14SiriTTSService26TTSAssetTrialResourceAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19AD4932C(&qword_1ED05B268, (id *)&qword_1ED05B260);

  return (TTSAssetType *)v3;
}

- (TTSAssetTechnology)technology
{
  _TtC14SiriTTSService26TTSAssetTrialResourceAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19AD4932C(&qword_1ED05AD40, (id *)&qword_1ED05AE88);

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  _TtC14SiriTTSService26TTSAssetTrialResourceAsset *v2;
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
  void *v2;

  sub_19AD957E0();
  v2 = (void *)sub_19AE55424();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)gender
{
  return 0;
}

- (NSNumber)age
{
  return (NSNumber *)0;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)sub_19AD95824(self, (uint64_t)a2, (void (*)(void))sub_19AD95884);
}

@end
