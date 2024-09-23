@implementation SessionRecorder

- (_TtC7Measure15SessionRecorder)init
{
  _TtC7Measure15SessionRecorder *result;

  result = (_TtC7Measure15SessionRecorder *)_swift_stdlib_reportUnimplementedInitializer("Measure.SessionRecorder", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1000AA080(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure15SessionRecorder_state), *(_QWORD *)&self->target[OBJC_IVAR____TtC7Measure15SessionRecorder_state]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Measure15SessionRecorder____lazy_storage___eventRecorder));

  sub_1000217BC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure15SessionRecorder_stopCompletion), *(_QWORD *)&self->target[OBJC_IVAR____TtC7Measure15SessionRecorder_stopCompletion]);
  sub_1000217BC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure15SessionRecorder_onStopped), *(_QWORD *)&self->target[OBJC_IVAR____TtC7Measure15SessionRecorder_onStopped]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->target[OBJC_IVAR____TtC7Measure15SessionRecorder_recordFilePath]);
}

@end
