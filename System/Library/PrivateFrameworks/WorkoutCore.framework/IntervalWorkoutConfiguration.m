@implementation IntervalWorkoutConfiguration

- (int64_t)hash
{
  _TtC11WorkoutCore28IntervalWorkoutConfiguration *v2;
  int64_t v3;

  v2 = self;
  v3 = IntervalWorkoutConfiguration.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC11WorkoutCore28IntervalWorkoutConfiguration *v4;
  _TtC11WorkoutCore28IntervalWorkoutConfiguration *v5;
  unsigned __int8 v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22874CC7C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = IntervalWorkoutConfiguration.isEqual(_:)((uint64_t)v8);

  sub_22858F94C((uint64_t)v8, (uint64_t *)&unk_255994E20);
  return v6 & 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore28IntervalWorkoutConfiguration__intervalWorkout;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255995130);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11WorkoutCore28IntervalWorkoutConfiguration__forceUpdatePublisher;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25598F2E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
