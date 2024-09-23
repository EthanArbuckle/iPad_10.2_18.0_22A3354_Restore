@implementation SurfaceLabelStrip

- (_TtC7Measure27SurfaceSideMeasurementStack)lengthLabels
{
  return (_TtC7Measure27SurfaceSideMeasurementStack *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_lengthLabels, a2);
}

- (void)setLengthLabels:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_lengthLabels, a3);
}

- (_TtC7Measure27SurfaceSideMeasurementStack)widthLabels
{
  return (_TtC7Measure27SurfaceSideMeasurementStack *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_widthLabels, a2);
}

- (void)setWidthLabels:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_widthLabels, a3);
}

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_contentView));
}

- (void)setContentView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_contentView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_contentView) = (Class)a3;
  v3 = a3;

}

- (_TtC7Measure17SurfaceLabelStrip)initWithFrame:(CGRect)a3
{
  _TtC7Measure17SurfaceLabelStrip *result;

  sub_100025A68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC7Measure17SurfaceLabelStrip)initWithCoder:(id)a3
{
  _TtC7Measure17SurfaceLabelStrip *result;

  sub_100025C38(a3);
  return result;
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

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_lengthLabels, a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Measure17SurfaceLabelStrip_widthLabels, v3);

}

@end
