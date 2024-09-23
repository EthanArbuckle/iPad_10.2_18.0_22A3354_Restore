@implementation PGFeatureExtractorAssetAverage

- (PGFeatureExtractorAssetAverage)initWithFeatureExtractor:(id)a3 skipAssetsWithErrors:(BOOL)a4
{
  objc_class *ObjectType;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PGFeatureExtractorAssetAverage_featureExtractor) = (Class)a3;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___PGFeatureExtractorAssetAverage_skipAssetsWithErrors) = a4;
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = a3;
  return -[PGFeatureExtractorAssetAverage init](&v10, sel_init);
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  SEL *v5;
  PGFeatureExtractorAssetAverage *v6;
  SEL *v7;

  v5 = (SEL *)a3;
  v6 = self;
  v7 = FeatureExtractorAssetAverage.floatVector(withEntity:)(v5);

  return v7;
}

- (int64_t)featureLength
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PGFeatureExtractorAssetAverage_featureExtractor), sel_featureLength);
}

- (NSArray)featureNames
{
  PGFeatureExtractorAssetAverage *v2;
  void *v3;

  v2 = self;
  FeatureExtractorAssetAverage.featureNames.getter();

  v3 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSString)name
{
  void *v2;
  PGFeatureExtractorAssetAverage *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PGFeatureExtractorAssetAverage_featureExtractor);
  v3 = self;
  v4 = objc_msgSend(v2, sel_name);
  sub_1CA85B534();

  sub_1CA85B534();
  sub_1CA85B624();
  sub_1CA85B624();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (PGFeatureExtractorAssetAverage)init
{
  PGFeatureExtractorAssetAverage *result;

  result = (PGFeatureExtractorAssetAverage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
