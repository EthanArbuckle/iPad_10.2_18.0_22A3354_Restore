@implementation NLWorkoutConfigurationImageGenerator

+ (id)createBlastDoorDataSourceFromData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  v3 = a3;
  v4 = sub_24A7786C8();
  v6 = v5;

  v7 = _s9WorkoutUI0A27ConfigurationImageGeneratorC25createBlastDoorDataSource4fromSo09WKUIBlasthiJ0CSg10Foundation0I0V_tFZ_0();
  sub_24A6706DC(v4, v6);
  return v7;
}

+ (id)createImageFromData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v3 = a3;
  v4 = sub_24A7786C8();
  v6 = v5;

  v7 = _s9WorkoutUI0A27ConfigurationImageGeneratorC06createD04from10Foundation4DataVSgAH_tFZ_0();
  v9 = v8;
  sub_24A6706DC(v4, v6);
  if (v9 >> 60 == 15)
  {
    v10 = 0;
  }
  else
  {
    v10 = (void *)sub_24A7786BC();
    sub_24A6706C8((uint64_t)v7, v9);
  }
  return v10;
}

+ (id)createImageFromBlastDoorDataSource:(id)a3 scale:(double)a4
{
  id v4;
  UIImage *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  v5 = _s9WorkoutUI0A27ConfigurationImageGeneratorC06createD04from5scale10Foundation4DataVSgSo013WKUIBlastDoorJ6SourceC_12CoreGraphics7CGFloatVtFZ_0(v4);
  v7 = v6;

  if (v7 >> 60 == 15)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)sub_24A7786BC();
    sub_24A6706C8((uint64_t)v5, v7);
  }
  return v8;
}

- (NLWorkoutConfigurationImageGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WorkoutConfigurationImageGenerator();
  return -[NLWorkoutConfigurationImageGenerator init](&v3, sel_init);
}

@end
