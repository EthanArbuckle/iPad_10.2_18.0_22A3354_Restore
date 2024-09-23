@implementation MapsElevationChartStyle

- (double)gapWidth
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gapWidth);
}

- (double)barWidth
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_barWidth);
}

- (UIColor)barColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_barColor));
}

- (UIColor)dotStrokeColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_dotStrokeColor));
}

- (UIColor)barHighlightColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_barHighlightColor));
}

- (UIColor)barElapsedColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_barElapsedColor));
}

- (NSArray)gradientColors
{
  uint64_t v2;
  NSArray v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gradientColors);
  if (v2)
  {
    sub_10009DE50();
    swift_bridgeObjectRetain(v2);
    v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSArray *)v3.super.isa;
}

- (UIColor)labelColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_labelColor));
}

- (UIFont)xAxisFont
{
  return (UIFont *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_xAxisFont));
}

- (UIColor)gridColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gridColor));
}

- (UIColor)gridHighlightColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gridHighlightColor));
}

- (double)gridLineWidth
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gridLineWidth);
}

- (BOOL)usesCurrentPosition
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_usesCurrentPosition);
}

+ (double)miniLineChartWidth
{
  return 37.0;
}

+ (_TtC4Maps23MapsElevationChartStyle)navigationLineStyle
{
  return (_TtC4Maps23MapsElevationChartStyle *)sub_1001A44BC((uint64_t)a1, (uint64_t)a2, &qword_101491080, (id *)&qword_1014D4F20, (uint64_t)sub_1001A3B9C);
}

+ (_TtC4Maps23MapsElevationChartStyle)routePlanningMiniLineStyle
{
  return (_TtC4Maps23MapsElevationChartStyle *)sub_1001A44BC((uint64_t)a1, (uint64_t)a2, &qword_101491088, (id *)&qword_1014D4F28, (uint64_t)sub_1001A3E58);
}

+ (_TtC4Maps23MapsElevationChartStyle)routePlanningOverviewStyle
{
  return (_TtC4Maps23MapsElevationChartStyle *)sub_1001A44BC((uint64_t)a1, (uint64_t)a2, &qword_101491090, (id *)&qword_1014D4F30, (uint64_t)sub_1001A4040);
}

+ (_TtC4Maps23MapsElevationChartStyle)routePlanningDetailStyle
{
  return (_TtC4Maps23MapsElevationChartStyle *)sub_1001A44BC((uint64_t)a1, (uint64_t)a2, &qword_101491098, (id *)&qword_1014D4F38, (uint64_t)sub_1001A4150);
}

+ (_TtC4Maps23MapsElevationChartStyle)navigationDetailStyle
{
  return (_TtC4Maps23MapsElevationChartStyle *)sub_1001A44BC((uint64_t)a1, (uint64_t)a2, &qword_1014910A0, (id *)&qword_1014D4F40, (uint64_t)sub_1001A42B4);
}

- (double)bucketWidth
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gapWidth)
       + *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_barWidth);
}

- (_TtC4Maps23MapsElevationChartStyle)init
{
  _TtC4Maps23MapsElevationChartStyle *result;

  result = (_TtC4Maps23MapsElevationChartStyle *)_swift_stdlib_reportUnimplementedInitializer("Maps.MapsElevationChartStyle", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_gradientColors));
  sub_1001A4B10((uint64_t)self + OBJC_IVAR____TtC4Maps23MapsElevationChartStyle_blendMode);

}

@end
