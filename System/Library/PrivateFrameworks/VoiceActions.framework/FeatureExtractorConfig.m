@implementation FeatureExtractorConfig

- (int64_t)cmvnSlidingWindowLength
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_cmvnSlidingWindowLength);
  swift_beginAccess();
  return *v2;
}

- (void)setCmvnSlidingWindowLength:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_cmvnSlidingWindowLength);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)cmvnMinWindowLength
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_cmvnMinWindowLength);
  swift_beginAccess();
  return *v2;
}

- (void)setCmvnMinWindowLength:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_cmvnMinWindowLength);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)spliceLeftContext
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_spliceLeftContext);
  swift_beginAccess();
  return *v2;
}

- (void)setSpliceLeftContext:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_spliceLeftContext);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)spliceRightContext
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_spliceRightContext);
  swift_beginAccess();
  return *v2;
}

- (void)setSpliceRightContext:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_spliceRightContext);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)downSampleStride
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_downSampleStride);
  swift_beginAccess();
  return *v2;
}

- (void)setDownSampleStride:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_downSampleStride);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)nnetIntakeFeatureLength
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_nnetIntakeFeatureLength);
  swift_beginAccess();
  return *v2;
}

- (void)setNnetIntakeFeatureLength:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_nnetIntakeFeatureLength);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)nnetVectorSize
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_nnetVectorSize);
  swift_beginAccess();
  return *v2;
}

- (void)setNnetVectorSize:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___FeatureExtractorConfig_nnetVectorSize);
  swift_beginAccess();
  *v4 = a3;
}

- (FeatureExtractorConfig)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_cmvnSlidingWindowLength) = (Class)600;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_cmvnMinWindowLength) = (Class)24;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_spliceLeftContext) = (Class)3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_spliceRightContext) = (Class)3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_downSampleStride) = (Class)3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_nnetIntakeFeatureLength) = (Class)8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractorConfig_nnetVectorSize) = (Class)280;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FeatureExtractorConfig();
  return -[FeatureExtractorConfig init](&v3, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_24A19E9F0(self, (uint64_t)a2, (void (*)(void))type metadata accessor for FeatureExtractorConfig, &qword_25790DC80, (uint64_t)&protocol conformance descriptor for FeatureExtractorConfig);
}

@end
