@implementation SurfaceSideMeasurementStack

- (_TtC7Measure16InteractiveLabel)sideTitle
{
  return (_TtC7Measure16InteractiveLabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_sideTitle, a2);
}

- (void)setSideTitle:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_sideTitle, a3);
}

- (_TtC7Measure16InteractiveLabel)mainUnit
{
  return (_TtC7Measure16InteractiveLabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_mainUnit, a2);
}

- (void)setMainUnit:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_mainUnit, a3);
}

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_contentView));
}

- (void)setContentView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_contentView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_contentView) = (Class)a3;
  v3 = a3;

}

- (_TtC7Measure19SecondaryLabelStack)secondaryLabelStack
{
  return (_TtC7Measure19SecondaryLabelStack *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_secondaryLabelStack, a2);
}

- (void)setSecondaryLabelStack:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_secondaryLabelStack, a3);
}

- (_TtC7Measure27SurfaceSideMeasurementStack)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC7Measure27SurfaceSideMeasurementStack *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_sideTitle, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_mainUnit, 0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_contentView) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_secondaryLabelStack, 0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[SurfaceSideMeasurementStack initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_1000D9838();

  return v9;
}

- (_TtC7Measure27SurfaceSideMeasurementStack)initWithCoder:(id)a3
{
  return (_TtC7Measure27SurfaceSideMeasurementStack *)sub_1000D9BB8(a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 103.6;
  v3 = 143.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_sideTitle, a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_mainUnit, v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_contentView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure27SurfaceSideMeasurementStack_secondaryLabelStack, v4);
}

@end
