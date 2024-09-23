@implementation PacerWorkoutConfiguration

- (int64_t)hash
{
  _TtC11WorkoutCore25PacerWorkoutConfiguration *v2;
  int64_t v3;

  v2 = self;
  v3 = PacerWorkoutConfiguration.hash.getter();

  return v3;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore25PacerWorkoutConfiguration__distanceGoal;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559910D0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11WorkoutCore25PacerWorkoutConfiguration__timeGoal, v4);
}

@end
