@implementation WorkoutExtendedModePathRenderer

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  CGContext *v11;
  _TtC10FitnessApp31WorkoutExtendedModePathRenderer *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _TtC10FitnessApp31WorkoutExtendedModePathRenderer *v19;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  v11 = a5;
  v12 = self;
  v13 = -[WorkoutExtendedModePathRenderer overlay](v12, "overlay");
  objc_msgSend(v13, "boundingMapRect");
  v15 = v14;
  v17 = v16;
  swift_unknownObjectRelease(v13);
  v18 = MKRoadWidthAtZoomScale(a4) * 0.75;
  -[WorkoutExtendedModePathRenderer applyStrokePropertiesToContext:atZoomScale:](v12, "applyStrokePropertiesToContext:atZoomScale:", v11, a4);
  v19 = v12;
  sub_1002F4334(v11, (uint64_t)v19, v9, v8, var0, var1, v18, v15, v17);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31WorkoutExtendedModePathRenderer_standardColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31WorkoutExtendedModePathRenderer_dashedColor));
}

@end
