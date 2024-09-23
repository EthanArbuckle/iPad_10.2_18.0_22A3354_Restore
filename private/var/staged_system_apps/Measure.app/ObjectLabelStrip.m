@implementation ObjectLabelStrip

- (_TtC7Measure27SurfaceSideMeasurementStack)lengthLabels
{
  return (_TtC7Measure27SurfaceSideMeasurementStack *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure16ObjectLabelStrip_lengthLabels, a2);
}

- (void)setLengthLabels:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_lengthLabels, a3);
}

- (_TtC7Measure27SurfaceSideMeasurementStack)widthLabels
{
  return (_TtC7Measure27SurfaceSideMeasurementStack *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure16ObjectLabelStrip_widthLabels, a2);
}

- (void)setWidthLabels:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_widthLabels, a3);
}

- (_TtC7Measure27SurfaceSideMeasurementStack)heightLabels
{
  return (_TtC7Measure27SurfaceSideMeasurementStack *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure16ObjectLabelStrip_heightLabels, a2);
}

- (void)setHeightLabels:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_heightLabels, a3);
}

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_contentView));
}

- (void)setContentView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_contentView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_contentView) = (Class)a3;
  v3 = a3;

}

- (_TtC7Measure16ObjectLabelStrip)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC7Measure16ObjectLabelStrip *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_lengthLabels, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_widthLabels, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_heightLabels, 0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_contentView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[ObjectLabelStrip initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_10009CFE0();

  return v9;
}

- (_TtC7Measure16ObjectLabelStrip)initWithCoder:(id)a3
{
  return (_TtC7Measure16ObjectLabelStrip *)sub_10009D1A4(a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 375.0;
  v3 = 143.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_lengthLabels, a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_widthLabels, v3);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure16ObjectLabelStrip_heightLabels, v4);

}

@end
