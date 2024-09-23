@implementation MultiSportWorkoutConfiguration

- (int64_t)hash
{
  _TtC11WorkoutCore30MultiSportWorkoutConfiguration *v2;
  int64_t v3;

  v2 = self;
  v3 = MultiSportWorkoutConfiguration.hash.getter();

  return v3;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore30MultiSportWorkoutConfiguration__subConfigs;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25598FB88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11WorkoutCore30MultiSportWorkoutConfiguration__title;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25598E248);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (NSString)analyticsSubActivities
{
  _TtC11WorkoutCore30MultiSportWorkoutConfiguration *v2;
  void *v3;

  v2 = self;
  MultiSportWorkoutConfiguration.analyticsSubActivities.getter();

  v3 = (void *)sub_22874C7C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
