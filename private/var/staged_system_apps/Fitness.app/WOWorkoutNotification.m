@implementation WOWorkoutNotification

- (_TtC11WorkoutCore19WorkoutNotification)bridgedNotification
{
  return (_TtC11WorkoutCore19WorkoutNotification *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                           + OBJC_IVAR___WOWorkoutNotification_bridgedNotification));
}

- (WOWorkoutNotification)initWithNotification:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOWorkoutNotification_bridgedNotification) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for WorkoutNotificationBridge();
  v4 = a3;
  return -[WOWorkoutNotification init](&v6, "init");
}

- (WOWorkoutNotification)init
{
  WOWorkoutNotification *result;

  result = (WOWorkoutNotification *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutNotificationBridge", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
