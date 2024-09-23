@implementation TranscriptViewConfigurationMediator

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4
{
  _TtC10VoiceMemos35TranscriptViewConfigurationMediator *v6;

  swift_unknownObjectRetain(a3);
  v6 = self;
  sub_1000BEDEC();
  swift_unknownObjectRelease(a3);

}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5
{
  _TtC10VoiceMemos35TranscriptViewConfigurationMediator *v7;

  swift_unknownObjectRetain(a3);
  v7 = self;
  sub_1000BEDEC();
  swift_unknownObjectRelease(a3);

}

- (_TtC10VoiceMemos35TranscriptViewConfigurationMediator)init
{
  _TtC10VoiceMemos35TranscriptViewConfigurationMediator *result;

  result = (_TtC10VoiceMemos35TranscriptViewConfigurationMediator *)_swift_stdlib_reportUnimplementedInitializer("VoiceMemos.TranscriptViewConfigurationMediator", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001B498((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC10VoiceMemos35TranscriptViewConfigurationMediator_configurationManager));
  sub_10001B498((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC10VoiceMemos35TranscriptViewConfigurationMediator_contextProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10VoiceMemos35TranscriptViewConfigurationMediator_contextChangedCancellable));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos35TranscriptViewConfigurationMediator_autoScrollTimer));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10VoiceMemos35TranscriptViewConfigurationMediator_timeController));
}

@end
