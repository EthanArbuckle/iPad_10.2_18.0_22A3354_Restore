@implementation GoalWorkoutConfiguration

- (NSString)analyticsKey
{
  _TtC11WorkoutCore24GoalWorkoutConfiguration *v2;
  void *v3;

  v2 = self;
  GoalWorkoutConfiguration.analyticsKey.getter();

  v3 = (void *)sub_22874C7C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)hash
{
  _TtC11WorkoutCore24GoalWorkoutConfiguration *v2;
  int64_t v3;

  v2 = self;
  v3 = GoalWorkoutConfiguration.hash.getter();

  return v3;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11WorkoutCore24GoalWorkoutConfiguration__goal;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559910D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
