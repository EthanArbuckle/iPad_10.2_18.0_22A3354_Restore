@implementation EdgeDetectorDebugView

- (_TtC7Measure21EdgeDetectorDebugView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure21EdgeDetectorDebugView *)sub_10007A9E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure21EdgeDetectorDebugView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10007BB6C();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC7Measure21EdgeDetectorDebugView__frameState));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure21EdgeDetectorDebugView_smoothLineView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure21EdgeDetectorDebugView_unprojectedPointView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Measure21EdgeDetectorDebugView_cornerViews));
}

@end
