@implementation CardContainerView

- (_TtC7Measure17CardContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10016B0B0();
}

- (_TtC7Measure17CardContainerView)initWithFrame:(CGRect)a3
{
  _TtC7Measure17CardContainerView *result;

  result = (_TtC7Measure17CardContainerView *)_swift_stdlib_reportUnimplementedInitializer("Measure.CardContainerView", 25, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_copyCustomButton));
  swift_release();
  swift_unknownObjectUnownedDestroy((char *)self + OBJC_IVAR____TtC7Measure17CardContainerView_scrollView);
  sub_10001ADF4((uint64_t)self + OBJC_IVAR____TtC7Measure17CardContainerView_internalSpatialPlatter);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_magicPocketTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_bottomStackTopSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_scrollViewFooterView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_contentScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_actualContentView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_internalDraggableView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17CardContainerView_scrollViewFooterViewHeightConstraint));

}

@end
