@implementation TTSAssetTrialVoiceAsset

- (TTSAssetType)assetType
{
  _TtC14SiriTTSService23TTSAssetTrialVoiceAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AD93C20();
  v4 = v3;

  return (TTSAssetType *)v4;
}

- (TTSAssetTechnology)technology
{
  _TtC14SiriTTSService23TTSAssetTrialVoiceAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AD9409C();
  v4 = v3;

  return (TTSAssetTechnology *)v4;
}

- (TTSAssetQuality)quality
{
  _TtC14SiriTTSService23TTSAssetTrialVoiceAsset *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_19AD94554();
  v4 = v3;

  return (TTSAssetQuality *)v4;
}

- (NSString)name
{
  return (NSString *)sub_19AD94B28(self, (uint64_t)a2, (void (*)(void))sub_19AD948EC);
}

- (NSString)identifier
{
  return (NSString *)sub_19AD94B28(self, (uint64_t)a2, (void (*)(void))sub_19AD94B74);
}

- (int64_t)gender
{
  _TtC14SiriTTSService23TTSAssetTrialVoiceAsset *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_19AD95234();
  v4 = v3;

  return v4;
}

- (NSNumber)age
{
  _TtC14SiriTTSService23TTSAssetTrialVoiceAsset *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19AD95418();

  return (NSNumber *)v3;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)sub_19AD95824(self, (uint64_t)a2, sub_19AD954BC);
}

@end
