@implementation PGFeatureExtractorStoredCLIP

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5;
  PGFeatureExtractorStoredCLIP *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1CA421854(v5);

  return v7;
}

- (int64_t)featureLength
{
  return 768;
}

- (NSArray)featureNames
{
  void *v2;

  _s11PhotosGraph26FeatureExtractorStoredCLIPC12featureNamesSaySSGvg_0();
  v2 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSString)name
{
  void *v2;

  sub_1CA85B534();
  v2 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (PGFeatureExtractorStoredCLIP)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGFeatureExtractorStoredCLIP init](&v3, sel_init);
}

@end
