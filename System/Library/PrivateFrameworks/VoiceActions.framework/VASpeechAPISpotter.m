@implementation VASpeechAPISpotter

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_24A13DAA8((uint64_t)self + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_inputStream, &qword_25790BCB8);
  sub_24A13DAA8((uint64_t)self + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_inputStreamBuilder, &qword_25790BCC0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_analysisContext));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_timingInfo));
  swift_unknownObjectRelease();
  sub_24A13DAA8((uint64_t)self + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_speechDetectorOutputStream, &qword_25790A858);
  sub_24A176794(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_runtimeParameters));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_audioDuringSpeech));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12VoiceActions18VASpeechAPISpotter_downloadError));
  swift_release();
}

@end
