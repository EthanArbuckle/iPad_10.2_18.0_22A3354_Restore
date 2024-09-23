@implementation SummaryBurnBarView

- (_TtC9SeymourUI18SummaryBurnBarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B4E3D94();
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC9SeymourUI18SummaryBurnBarView *v3;
  CGFloat MaxX;
  CGFloat MaxY;
  double v6;
  double v7;
  CGSize result;
  CGRect v9;
  CGRect v10;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI18SummaryBurnBarView_burnBarSummary);
  v3 = self;
  objc_msgSend(v2, sel_frame);
  MaxX = CGRectGetMaxX(v9);
  objc_msgSend(v2, sel_frame);
  MaxY = CGRectGetMaxY(v10);

  v6 = MaxX;
  v7 = MaxY;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI18SummaryBurnBarView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI18SummaryBurnBarView *result;

  result = (_TtC9SeymourUI18SummaryBurnBarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SummaryBurnBarView_headerLabelStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SummaryBurnBarView_burnBarSummary));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
