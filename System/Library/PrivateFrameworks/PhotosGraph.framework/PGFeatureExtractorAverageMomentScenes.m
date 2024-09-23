@implementation PGFeatureExtractorAverageMomentScenes

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5;
  PGFeatureExtractorAverageMomentScenes *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)FeatureExtractorAverageMomentScenes.floatVector(withEntity:)(v5);

  return v7;
}

- (NSString)name
{
  void *v2;

  sub_1CA85B534();
  v2 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)featureNames
{
  PGFeatureExtractorAverageMomentScenes *v2;
  void *v3;

  v2 = self;
  FeatureExtractorAverageMomentScenes.featureNames.getter();

  v3 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)featureLength
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PGFeatureExtractorAverageMomentScenes_featureIndexByLowercasedScene))[2];
}

- (PGFeatureExtractorAverageMomentScenes)init
{
  PGFeatureExtractorAverageMomentScenes *result;

  result = (PGFeatureExtractorAverageMomentScenes *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PGFeatureExtractorAverageMomentScenes_sceneNodes));
  swift_bridgeObjectRelease();
}

@end
