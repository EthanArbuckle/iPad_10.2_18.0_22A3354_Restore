@implementation DivingLocationAnnotationView

- (_TtC10FitnessApp28DivingLocationAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp28DivingLocationAnnotationView *)sub_1002783EC(v8, v5, v7);
}

- (_TtC10FitnessApp28DivingLocationAnnotationView)initWithCoder:(id)a3
{
  uint64_t v4;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp28DivingLocationAnnotationView_pinSize) = (Class)0x402E000000000000;
  v4 = type metadata accessor for DivingLocationAnnotationView();
  swift_deallocPartialClassInstance(self, v4, 16, 7);
  return 0;
}

@end
