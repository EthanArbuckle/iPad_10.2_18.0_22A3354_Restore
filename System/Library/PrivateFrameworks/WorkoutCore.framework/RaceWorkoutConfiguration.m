@implementation RaceWorkoutConfiguration

- (int64_t)hash
{
  _TtC11WorkoutCore24RaceWorkoutConfiguration *v2;
  int64_t v3;

  v2 = self;
  v3 = RaceWorkoutConfiguration.hash.getter();

  return v3;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  char *v9;
  uint64_t v10;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_clusterUUID;
  v4 = sub_22874BD1C();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_lastWorkoutUUID, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_lastWorkoutDate;
  v7 = sub_22874BCB0();
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_bestWorkoutUUID, v4);
  v8((char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_bestWorkoutDate, v7);
  sub_228598BD0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_routeSnapshotData), *(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration_routeSnapshotData]);
  v9 = (char *)self + OBJC_IVAR____TtC11WorkoutCore24RaceWorkoutConfiguration__raceFilter;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25598E718);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

@end
