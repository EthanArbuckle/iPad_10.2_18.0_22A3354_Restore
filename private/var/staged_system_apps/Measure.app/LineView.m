@implementation LineView

- (_TtC7Measure8LineView)init
{
  _TtC7Measure8LineView *result;

  result = (_TtC7Measure8LineView *)_swift_stdlib_reportUnimplementedInitializer("Measure.LineView", 16, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure8LineView__currentFrame));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure8LineView_worldPoints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Measure8LineView_worldLines));
  swift_bridgeObjectRelease(*(_QWORD *)&self->_currentFrame[OBJC_IVAR____TtC7Measure8LineView_firstPointInSessionId]);
}

@end
