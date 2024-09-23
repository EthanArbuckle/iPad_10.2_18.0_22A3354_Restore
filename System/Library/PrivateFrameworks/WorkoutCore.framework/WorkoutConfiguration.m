@implementation WorkoutConfiguration

- (int64_t)hash
{
  _TtC11WorkoutCore20WorkoutConfiguration *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_2285E7E80();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC11WorkoutCore20WorkoutConfiguration *v4;
  _TtC11WorkoutCore20WorkoutConfiguration *v5;
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
  v6 = sub_2285E9AD8((uint64_t)v8);

  sub_22858F94C((uint64_t)v8, (uint64_t *)&unk_255994E20);
  return v6 & 1;
}

- (_TtC11WorkoutCore20WorkoutConfiguration)init
{
  _TtC11WorkoutCore20WorkoutConfiguration *result;

  result = (_TtC11WorkoutCore20WorkoutConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_uuid;
  v4 = sub_22874BD1C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  sub_22858F94C((uint64_t)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_scheduledDate, &qword_25598E500);
  sub_22858F94C((uint64_t)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_lastCompletedDate, &qword_25598E500);
  sub_22858F94C((uint64_t)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_route, &qword_25598F898);
  sub_22858F94C((uint64_t)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_originalConfigurationReferenceUUID, &qword_25598E350);
}

+ (id)deserializeFromPersistence:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void (*v13[3])(char *, uint64_t);
  uint64_t v14;

  v3 = qword_25598D130;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  v5 = qword_2559926E8;
  swift_retain();
  static WorkoutConfiguration.deserialize(from:requiringOccurrence:validator:)(v4, 0, v5, v13);

  swift_release();
  v6 = v14;
  if (v14)
  {
    v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
    v8 = *(_QWORD *)(v6 - 8);
    MEMORY[0x24BDAC7A8](v7);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)sub_22874CFF4();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)serialize
{
  _TtC11WorkoutCore20WorkoutConfiguration *v2;
  id v3;

  v2 = self;
  v3 = WorkoutConfiguration.serialize()();

  return v3;
}

- (NSString)analyticsKey
{
  char *v2;
  NSString *result;

  v2 = (char *)self + OBJC_IVAR____TtC11WorkoutCore20WorkoutConfiguration_type;
  swift_beginAccess();
  __asm { BR              X10 }
  return result;
}

- (NSString)analyticsSubActivities
{
  return (NSString *)(id)sub_22874C7C0();
}

@end
