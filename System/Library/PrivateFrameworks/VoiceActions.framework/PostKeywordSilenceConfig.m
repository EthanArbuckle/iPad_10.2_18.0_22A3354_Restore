@implementation PostKeywordSilenceConfig

- (int64_t)lookForwardFrames
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_lookForwardFrames);
  swift_beginAccess();
  return *v2;
}

- (void)setLookForwardFrames:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_lookForwardFrames);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)minSilenceFramesExpected
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFramesExpected);
  swift_beginAccess();
  return *v2;
}

- (void)setMinSilenceFramesExpected:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFramesExpected);
  swift_beginAccess();
  *v4 = a3;
}

- (float)silenceProbability
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  return *v2;
}

- (void)setSilenceProbability:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_silenceProbability);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)minSilenceFrameCountAtEndOfKeyword
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFrameCountAtEndOfKeyword);
  swift_beginAccess();
  return *v2;
}

- (void)setMinSilenceFrameCountAtEndOfKeyword:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFrameCountAtEndOfKeyword);
  swift_beginAccess();
  *v4 = a3;
}

- (PostKeywordSilenceConfig)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PostKeywordSilenceConfig_lookForwardFrames) = (Class)8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFramesExpected) = (Class)2;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___PostKeywordSilenceConfig_silenceProbability) = 1060320051;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PostKeywordSilenceConfig_minSilenceFrameCountAtEndOfKeyword) = (Class)2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PostKeywordSilence();
  return -[PostKeywordSilenceConfig init](&v3, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_24A19E9F0(self, (uint64_t)a2, (void (*)(void))type metadata accessor for PostKeywordSilence, &qword_25790DB78, (uint64_t)&protocol conformance descriptor for PostKeywordSilence);
}

@end
