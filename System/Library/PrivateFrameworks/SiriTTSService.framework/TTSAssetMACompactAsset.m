@implementation TTSAssetMACompactAsset

- (TTSAssetQuality)quality
{
  _TtC14SiriTTSService22TTSAssetMACompactAsset *v2;
  id v3;

  v2 = self;
  v3 = sub_19AD4932C(&qword_1ED05AE68, (id *)&qword_1ED05ADB0);

  return (TTSAssetQuality *)v3;
}

- (NSBundle)bundle
{
  _TtC14SiriTTSService22TTSAssetMACompactAsset *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19ADB99C0();

  return (NSBundle *)v3;
}

- (BOOL)purgeable
{
  return 0;
}

@end
