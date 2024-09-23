@implementation PGMomentHasBirthdayFeatureExtractor

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5;
  PGMomentHasBirthdayFeatureExtractor *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = self;
  MomentHasBirthdayFeatureExtractor.floatVector(withEntity:)(v5);
  v8 = v7;

  return v8;
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
  uint64_t v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED872760);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1CA8D6090;
  *(_QWORD *)(v2 + 32) = sub_1CA85B534();
  *(_QWORD *)(v2 + 40) = v3;
  *(_QWORD *)(v2 + 48) = sub_1CA85B534();
  *(_QWORD *)(v2 + 56) = v4;
  *(_QWORD *)(v2 + 64) = sub_1CA85B534();
  *(_QWORD *)(v2 + 72) = v5;
  v6 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (int64_t)featureLength
{
  return 3;
}

- (PGMomentHasBirthdayFeatureExtractor)init
{
  PGMomentHasBirthdayFeatureExtractor *result;

  result = (PGMomentHasBirthdayFeatureExtractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___PGMomentHasBirthdayFeatureExtractor_personNodesByMomentNode);
  swift_unknownObjectRelease();

}

@end
