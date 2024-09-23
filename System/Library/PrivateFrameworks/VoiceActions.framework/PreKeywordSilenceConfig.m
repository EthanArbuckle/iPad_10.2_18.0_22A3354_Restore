@implementation PreKeywordSilenceConfig

- (int64_t)lookbackFrames
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_lookbackFrames);
  swift_beginAccess();
  return *v2;
}

- (void)setLookbackFrames:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_lookbackFrames);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)minSilenceInLookbackFrames
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_minSilenceInLookbackFrames);
  swift_beginAccess();
  return *v2;
}

- (void)setMinSilenceInLookbackFrames:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_minSilenceInLookbackFrames);
  swift_beginAccess();
  *v4 = a3;
}

- (float)silenceProbability
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  return *v2;
}

- (void)setSilenceProbability:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR___PreKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  *v4 = a3;
}

- (PreKeywordSilenceConfig)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PreKeywordSilenceConfig_lookbackFrames) = (Class)20;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PreKeywordSilenceConfig_minSilenceInLookbackFrames) = (Class)10;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___PreKeywordSilenceConfig_silenceProbability) = 1060320051;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PreKeywordSilence();
  return -[PreKeywordSilenceConfig init](&v3, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_24A19E9F0(self, (uint64_t)a2, (void (*)(void))type metadata accessor for PreKeywordSilence, &qword_25790DB18, (uint64_t)&protocol conformance descriptor for PreKeywordSilence);
}

@end
