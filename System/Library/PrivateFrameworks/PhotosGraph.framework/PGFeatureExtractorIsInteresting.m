@implementation PGFeatureExtractorIsInteresting

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5;
  PGFeatureExtractorIsInteresting *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = FeatureExtractorIsInteresting.floatVector(withEntity:)(v5);

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
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED872760);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1CA8D51C0;
  *(_QWORD *)(v2 + 32) = sub_1CA85B534();
  *(_QWORD *)(v2 + 40) = v3;
  *(_QWORD *)(v2 + 48) = sub_1CA85B534();
  *(_QWORD *)(v2 + 56) = v4;
  v5 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

- (int64_t)featureLength
{
  return 2;
}

- (PGFeatureExtractorIsInteresting)init
{
  PGFeatureExtractorIsInteresting *result;

  result = (PGFeatureExtractorIsInteresting *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PGFeatureExtractorIsInteresting_interestingMomentNodes));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PGFeatureExtractorIsInteresting_smartInterestingMomentNodes));
}

@end
