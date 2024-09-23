@implementation WorkoutLocationAnnotationView

- (_TtC10FitnessApp29WorkoutLocationAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a4)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = swift_unknownObjectRetain(a3);
  return (_TtC10FitnessApp29WorkoutLocationAnnotationView *)sub_10014F9A4(v8, v5, v7);
}

- (_TtC10FitnessApp29WorkoutLocationAnnotationView)initWithCoder:(id)a3
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutLocationAnnotationView();
  swift_deallocPartialClassInstance(self, v4, 8, 7);
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC10FitnessApp29WorkoutLocationAnnotationView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_10014FC1C(x, y, width, height);

}

@end
