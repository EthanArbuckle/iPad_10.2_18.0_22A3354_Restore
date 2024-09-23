@implementation PGLibraryAveragePersonCountFeatureExtractor

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5;
  PGLibraryAveragePersonCountFeatureExtractor *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = self;
  sub_1CA3103D8(v5);
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
  void *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED872760);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1CA8D4E40;
  *(_QWORD *)(v2 + 32) = sub_1CA85B534();
  *(_QWORD *)(v2 + 40) = v3;
  v4 = (void *)sub_1CA85B798();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (int64_t)featureLength
{
  return 1;
}

- (PGLibraryAveragePersonCountFeatureExtractor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGLibraryAveragePersonCountFeatureExtractor init](&v3, sel_init);
}

@end
