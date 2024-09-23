@implementation SessionRingsView

- (UIVisualEffectView)ringsPlatter
{
  return (UIVisualEffectView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringsPlatter));
}

- (void)didMoveToSuperview
{
  _TtC9SeymourUI16SessionRingsView *v2;

  v2 = self;
  sub_22B311784();

}

- (void)layoutSubviews
{
  _TtC9SeymourUI16SessionRingsView *v2;

  v2 = self;
  sub_22B312548();

}

- (_TtC9SeymourUI16SessionRingsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B315EB0();
}

- (_TtC9SeymourUI16SessionRingsView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI16SessionRingsView *result;

  result = (_TtC9SeymourUI16SessionRingsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_metricsContainer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringClosureLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringClosureLabelPlatter));
  swift_unknownObjectRelease();
  sub_22B315B3C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_stringBuilder);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringsContainerTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringsContainerRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringsContainerWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_ringsContainerHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_celebrationLoadingQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16SessionRingsView_contentLayoutGuide));
}

- (void)displayHighlightWithDuration:(double)a3
{
  double v4;
  double v5;
  double v6;
  _TtC9SeymourUI16SessionRingsView *v7;

  v7 = self;
  sub_22B313E34(a3, v4, v5, v6);

}

- (void)safeAreaInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SessionRingsView();
  v2 = v3.receiver;
  -[SessionRingsView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  sub_22B3149C8();
  sub_22B312A18();

}

@end
