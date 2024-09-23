@implementation IntervalWorkout

- (int64_t)hash
{
  _TtC11WorkoutCore15IntervalWorkout *v2;
  int64_t v3;

  v2 = self;
  v3 = IntervalWorkout.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC11WorkoutCore15IntervalWorkout *v4;
  _TtC11WorkoutCore15IntervalWorkout *v5;
  char v6;
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
  v6 = IntervalWorkout.isEqual(_:)((uint64_t)v8);

  sub_22859C828((uint64_t)v8);
  return v6 & 1;
}

- (_TtC11WorkoutCore15IntervalWorkout)init
{
  _TtC11WorkoutCore15IntervalWorkout *result;

  result = (_TtC11WorkoutCore15IntervalWorkout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  char *v10;
  uint64_t v11;

  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore15IntervalWorkout__name;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25598E248);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11WorkoutCore15IntervalWorkout_uuid;
  v6 = sub_22874BD1C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11WorkoutCore15IntervalWorkout__warmupBlock;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25598E260);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC11WorkoutCore15IntervalWorkout__cooldownBlock, v8);
  v10 = (char *)self + OBJC_IVAR____TtC11WorkoutCore15IntervalWorkout__stepBlocks;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25598E280);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

@end
