@implementation CHWorkoutRouteMapGenerator

- (HKLocationReadings)locationReadings
{
  return (HKLocationReadings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CHWorkoutRouteMapGenerator_locationReadings));
}

- (void)setLocationReadings:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_locationReadings);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_locationReadings) = (Class)a3;
  v3 = a3;

}

- (MKMapSnapshotter)mapSnapshotter
{
  return (MKMapSnapshotter *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSnapshotter));
}

- (void)setMapSnapshotter:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSnapshotter);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSnapshotter) = (Class)a3;
  v3 = a3;

}

- (CHWorkoutRouteMapGenerator)initWithPathRendererClass:(Class)a3
{
  objc_class *ObjCClassMetadata;
  char *v5;
  objc_super v7;

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata(a3);
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_isForDive) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_pinWidth) = (Class)0x402E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_locationReadings) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSnapshotter) = 0;
  v5 = (char *)self + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSize;
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_pathRendererClass) = ObjCClassMetadata;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WorkoutRouteMapGenerator();
  return -[CHWorkoutRouteMapGenerator init](&v7, "init");
}

- (void)setMapSize:(CGSize)a3
{
  CGSize *v3;

  v3 = (CGSize *)((char *)self + OBJC_IVAR___CHWorkoutRouteMapGenerator_mapSize);
  *v3 = a3;
  LOBYTE(v3[1].width) = 0;
}

- (void)configureForDive
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CHWorkoutRouteMapGenerator_isForDive) = 1;
}

- (void)snapshotWithSize:(CGSize)a3 lineWidth:(double)a4 traitCollection:(id)a5 insets:(UIEdgeInsets)a6 completion:(id)a7
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  void *v16;
  id v17;
  CHWorkoutRouteMapGenerator *v18;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  height = a3.height;
  width = a3.width;
  v16 = _Block_copy(a7);
  _Block_copy(v16);
  v17 = a5;
  v18 = self;
  sub_10053BBD0((uint64_t)v17, (uint64_t)v18, (void (**)(_QWORD, _QWORD))v16, width, height, a4, top, left, bottom, right);
  _Block_release(v16);
  _Block_release(v16);

}

- (CHWorkoutRouteMapGenerator)init
{
  CHWorkoutRouteMapGenerator *result;

  result = (CHWorkoutRouteMapGenerator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutRouteMapGenerator", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
