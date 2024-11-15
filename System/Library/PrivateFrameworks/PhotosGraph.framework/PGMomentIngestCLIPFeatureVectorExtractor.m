@implementation PGMomentIngestCLIPFeatureVectorExtractor

- (PGMomentIngestCLIPFeatureVectorExtractor)initWithIngestMomentContainer:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGMomentIngestCLIPFeatureVectorExtractor_ingestMomentContainer) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MomentIngestCLIPFeatureVectorExtractor();
  v4 = a3;
  return -[PGMomentIngestCLIPFeatureVectorExtractor init](&v6, sel_init);
}

- (id)extractCLIPFeatureVectorWithError:(id *)a3
{
  PGMomentIngestCLIPFeatureVectorExtractor *v3;
  id v4;

  v3 = self;
  v4 = sub_1CA4E8038();

  return v4;
}

+ (id)encodeCLIPFeatureVector:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  _s11PhotosGraph38MomentIngestCLIPFeatureVectorExtractorC6encodeySSSo07MAFloatF0CFZ_0(v3);

  v4 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)decodeEncodedCLIPFeatureVector:(id)a3 withError:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = sub_1CA85B534();
  v6 = sub_1CA4E8D78(v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

- (PGMomentIngestCLIPFeatureVectorExtractor)init
{
  PGMomentIngestCLIPFeatureVectorExtractor *result;

  result = (PGMomentIngestCLIPFeatureVectorExtractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PGMomentIngestCLIPFeatureVectorExtractor_ingestMomentContainer));
}

@end
