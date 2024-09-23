@implementation DuringKeywordSilenceConfig

- (float)minPercentageOfNonSilenceFrames
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR___DuringKeywordSilenceConfig_minPercentageOfNonSilenceFrames);
  swift_beginAccess();
  return *v2;
}

- (void)setMinPercentageOfNonSilenceFrames:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR___DuringKeywordSilenceConfig_minPercentageOfNonSilenceFrames);
  swift_beginAccess();
  *v4 = a3;
}

- (float)silenceProbability
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR___DuringKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  return *v2;
}

- (void)setSilenceProbability:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR___DuringKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  *v4 = a3;
}

- (DuringKeywordSilenceConfig)init
{
  objc_super v3;

  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___DuringKeywordSilenceConfig_minPercentageOfNonSilenceFrames) = 1056964608;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___DuringKeywordSilenceConfig_silenceProbability) = 1056964608;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DuringKeywordSilence();
  return -[DuringKeywordSilenceConfig init](&v3, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_24A19E9F0(self, (uint64_t)a2, (void (*)(void))type metadata accessor for DuringKeywordSilence, &qword_25790DB40, (uint64_t)&protocol conformance descriptor for DuringKeywordSilence);
}

@end
