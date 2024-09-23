@implementation AccuracyDebugView

- (_TtC7Measure17AccuracyDebugView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure17AccuracyDebugView *)sub_10004AE30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure17AccuracyDebugView)initWithCoder:(id)a3
{
  id v4;
  _TtC7Measure17AccuracyDebugView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure17AccuracyDebugView_maxWidth) = 0;
  v4 = a3;

  result = (_TtC7Measure17AccuracyDebugView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/AccuracyDebugView.swift", 31, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  _TtC7Measure17AccuracyDebugView *v2;

  v2 = self;
  sub_10004B284();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17AccuracyDebugView_currentLineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17AccuracyDebugView_currentEstimatedErrorLabel));

}

@end
