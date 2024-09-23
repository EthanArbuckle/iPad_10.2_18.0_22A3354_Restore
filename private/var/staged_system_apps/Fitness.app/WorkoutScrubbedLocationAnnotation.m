@implementation WorkoutScrubbedLocationAnnotation

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp33WorkoutScrubbedLocationAnnotation_coordinate);
  v3 = *(double *)&self->coordinate[OBJC_IVAR____TtC10FitnessApp33WorkoutScrubbedLocationAnnotation_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa
                            + OBJC_IVAR____TtC10FitnessApp33WorkoutScrubbedLocationAnnotation_coordinate) = a3;
}

- (_TtC10FitnessApp33WorkoutScrubbedLocationAnnotation)init
{
  _TtC10FitnessApp33WorkoutScrubbedLocationAnnotation *result;

  result = (_TtC10FitnessApp33WorkoutScrubbedLocationAnnotation *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutScrubbedLocationAnnotation", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
