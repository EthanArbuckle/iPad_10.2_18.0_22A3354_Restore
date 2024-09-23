@implementation SiriTTSSpeakableStringExtractor

- (SiriTTSSpeakableStringExtractor)init
{
  SpeakableStringExtractor.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_76();
  sub_19AD58B78(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriTTSSpeakableStringExtractor_data), *(_QWORD *)&self->language[OBJC_IVAR___SiriTTSSpeakableStringExtractor_data]);
}

@end
