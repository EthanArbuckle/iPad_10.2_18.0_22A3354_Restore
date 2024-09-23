@implementation WorkoutChartedDistancePathRenderer

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  CGContext *v11;
  _TtC10FitnessApp34WorkoutChartedDistancePathRenderer *v12;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  v11 = a5;
  v12 = self;
  sub_100220568(v11, v9, v8, var0, var1, a4);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp34WorkoutChartedDistancePathRenderer_highlightInterval;
  v4 = type metadata accessor for DateInterval(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp34WorkoutChartedDistancePathRenderer_downhillRunDateIntervals));
}

@end
