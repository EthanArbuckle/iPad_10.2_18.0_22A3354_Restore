@implementation DecoderConfig

- (BOOL)useChecker
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___DecoderConfig_useChecker;
  swift_beginAccess();
  return *v2;
}

- (void)setUseChecker:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___DecoderConfig_useChecker;
  swift_beginAccess();
  *v4 = a3;
}

- (PreKeywordSilenceConfig)preKeywordSilence
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DecoderConfig_preKeywordSilence);
  swift_beginAccess();
  return (PreKeywordSilenceConfig *)*v2;
}

- (void)setPreKeywordSilence:(id)a3
{
  sub_24A19F198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DecoderConfig_preKeywordSilence);
}

- (DuringKeywordSilenceConfig)duringKeywordSilence
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DecoderConfig_duringKeywordSilence);
  swift_beginAccess();
  return (DuringKeywordSilenceConfig *)*v2;
}

- (void)setDuringKeywordSilence:(id)a3
{
  sub_24A19F198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DecoderConfig_duringKeywordSilence);
}

- (PostKeywordSilenceConfig)postKeywordSilence
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DecoderConfig_postKeywordSilence);
  swift_beginAccess();
  return (PostKeywordSilenceConfig *)*v2;
}

- (void)setPostKeywordSilence:(id)a3
{
  sub_24A19F198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DecoderConfig_postKeywordSilence);
}

- (AudioCaptureConfig)audioCapture
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DecoderConfig_audioCapture);
  swift_beginAccess();
  return (AudioCaptureConfig *)*v2;
}

- (void)setAudioCapture:(id)a3
{
  sub_24A19F198((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DecoderConfig_audioCapture);
}

- (DecoderConfig)init
{
  return (DecoderConfig *)sub_24A19A724();
}

- (NSString)description
{
  return (NSString *)sub_24A19E9F0(self, (uint64_t)a2, (void (*)(void))type metadata accessor for DecoderConfig, &qword_25790DC00, (uint64_t)&protocol conformance descriptor for DecoderConfig);
}

- (void).cxx_destruct
{

}

@end
