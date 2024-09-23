@implementation PGFeatureExtractorCircularDatetime

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5;
  PGFeatureExtractorCircularDatetime *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = self;
  sub_1CA2678B4(v5);
  v8 = v7;

  return v8;
}

- (int64_t)featureLength
{
  return 10;
}

- (NSArray)featureNames
{
  void *v2;

  _s11PhotosGraph32FeatureExtractorCircularDatetimeC12featureNamesSaySSGvg_0();
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

- (PGFeatureExtractorCircularDatetime)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGFeatureExtractorCircularDatetime init](&v3, sel_init);
}

@end
