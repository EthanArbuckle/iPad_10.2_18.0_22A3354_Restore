@implementation MotionValidator

- (_TtC14dockaccessoryd15MotionValidator)init
{
  _TtC14dockaccessoryd15MotionValidator *result;

  result = (_TtC14dockaccessoryd15MotionValidator *)_swift_stdlib_reportUnimplementedInitializer("dockaccessoryd.MotionValidator", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd15MotionValidator_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__angleBuffer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__angleStampedBufferImu));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__calibrationBuffer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__pitchRateBuffer));

  swift_bridgeObjectRelease(*(_QWORD *)&self->_pitchRateBuffer[OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__startupConstants
                                                             + 7]);
  sub_1000B1410(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__calibrationCallback), *(_QWORD *)&self->type[OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__calibrationCallback]);
  sub_1000B1410(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__timedOutCallback), *(_QWORD *)&self->type[OBJC_IVAR____TtC14dockaccessoryd15MotionValidator__timedOutCallback]);
}

@end
