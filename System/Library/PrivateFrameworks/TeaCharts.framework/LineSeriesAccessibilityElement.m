@implementation LineSeriesAccessibilityElement

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1B8206434(self, (uint64_t)a2, sub_1B8206484);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (AXChartDescriptor)accessibilityChartDescriptor
{
  _TtC9TeaCharts30LineSeriesAccessibilityElement *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B82066BC();

  return (AXChartDescriptor *)v3;
}

- (void)setAccessibilityChartDescriptor:(id)a3
{
  id v5;
  _TtC9TeaCharts30LineSeriesAccessibilityElement *v6;

  v5 = a3;
  v6 = self;

}

- (id)tc_accessibilityDataSeriesValueDescriptionForPosition:(double)a3 axis:(int64_t)a4
{
  _TtC9TeaCharts30LineSeriesAccessibilityElement *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = self;
  sub_1B8206B74(a4, a3);
  v8 = v7;

  if (v8)
  {
    v9 = (void *)sub_1B820E864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (_TtC9TeaCharts30LineSeriesAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1B820EA80();
  swift_unknownObjectRelease();
  LineSeriesAccessibilityElement.init(accessibilityContainer:)();
}

- (_TtC9TeaCharts30LineSeriesAccessibilityElement)init
{
  LineSeriesAccessibilityElement.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_4();
  sub_1B8207F6C((uint64_t)self + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_chartModel);
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_xAxisDateFormatter));
}

@end
