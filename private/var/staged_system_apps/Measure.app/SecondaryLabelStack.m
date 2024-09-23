@implementation SecondaryLabelStack

- (_TtC7Measure16InteractiveLabel)topLabel
{
  return (_TtC7Measure16InteractiveLabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure19SecondaryLabelStack_topLabel, a2);
}

- (void)setTopLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_topLabel, a3);
}

- (_TtC7Measure16InteractiveLabel)bottomLabel
{
  return (_TtC7Measure16InteractiveLabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure19SecondaryLabelStack_bottomLabel, a2);
}

- (void)setBottomLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_bottomLabel, a3);
}

- (UIView)topView
{
  return (UIView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure19SecondaryLabelStack_topView, a2);
}

- (void)setTopView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_topView, a3);
}

- (UIView)bottomView
{
  return (UIView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure19SecondaryLabelStack_bottomView, a2);
}

- (void)setBottomView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_bottomView, a3);
}

- (UIStackView)stackView
{
  return (UIStackView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure19SecondaryLabelStack_stackView, a2);
}

- (void)setStackView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_stackView, a3);
}

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_contentView));
}

- (void)setContentView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_contentView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_contentView) = (Class)a3;
  v3 = a3;

}

- (_TtC7Measure19SecondaryLabelStack)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure19SecondaryLabelStack *)sub_1001355A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure19SecondaryLabelStack)initWithCoder:(id)a3
{
  return (_TtC7Measure19SecondaryLabelStack *)sub_10013587C(a3);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_topLabel, a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_bottomLabel, v3);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_topView, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_bottomView, v5);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_stackView, v6);

}

@end
