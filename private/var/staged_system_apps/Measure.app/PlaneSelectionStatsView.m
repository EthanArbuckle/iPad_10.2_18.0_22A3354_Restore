@implementation PlaneSelectionStatsView

- (_TtC7Measure23PlaneSelectionStatsView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure23PlaneSelectionStatsView *)sub_1001C2690(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure23PlaneSelectionStatsView)initWithCoder:(id)a3
{
  id v4;
  _TtC7Measure23PlaneSelectionStatsView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_maxWidth) = 0;
  v4 = a3;

  result = (_TtC7Measure23PlaneSelectionStatsView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/PlaneSelectionStatsView.swift", 37, 2, 54, 0);
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  _TtC7Measure23PlaneSelectionStatsView *v2;

  v2 = self;
  sub_1001C2DDC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_totalCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_arkitCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_adCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_localCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_patchCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_fallbackCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_inferredCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_prevCountLabel));
}

@end
