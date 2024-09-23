@implementation PGKeywordBasedFeatureExtractor

- (PGKeywordBasedFeatureExtractor)initWithWeightByKeyword:(id)a3
{
  objc_class *ObjectType;
  objc_class *v5;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = (objc_class *)sub_1CA85B414();
  v6 = (char *)self + OBJC_IVAR___PGKeywordBasedFeatureExtractor____lazy_storage___consistentHash;
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGKeywordBasedFeatureExtractor_weightByKeyword) = v5;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[PGKeywordBasedFeatureExtractor init](&v8, sel_init);
}

- (id)musicCurationFeaturesWithContext:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  PGKeywordBasedFeatureExtractor *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = (void *)KeywordBasedFeatureExtractor.musicCurationFeatures(context:progressReporter:)((uint64_t)v7);

  return v10;
}

- (PGKeywordBasedFeatureExtractor)init
{
  PGKeywordBasedFeatureExtractor *result;

  result = (PGKeywordBasedFeatureExtractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
