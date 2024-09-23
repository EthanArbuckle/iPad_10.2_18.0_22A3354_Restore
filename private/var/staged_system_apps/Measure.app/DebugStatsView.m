@implementation DebugStatsView

- (_TtC7Measure14DebugStatsView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure14DebugStatsView *)sub_10004E928(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure14DebugStatsView)initWithCoder:(id)a3
{
  id v4;
  _TtC7Measure14DebugStatsView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure14DebugStatsView_maxWidth) = 0;
  v4 = a3;

  result = (_TtC7Measure14DebugStatsView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/DebugStatsView.swift", 28, 2, 84, 0);
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  _TtC7Measure14DebugStatsView *v2;

  v2 = self;
  sub_10004E3A4();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure14DebugStatsView_renderGlobalTimeLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure14DebugStatsView_arGlobalMaxFrameCountLabel));

}

@end
