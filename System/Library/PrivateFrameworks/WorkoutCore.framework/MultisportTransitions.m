@implementation MultisportTransitions

- (int64_t)hash
{
  _TtC11WorkoutCore21MultisportTransitions *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_228662BE0();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC11WorkoutCore21MultisportTransitions *v4;
  _TtC11WorkoutCore21MultisportTransitions *v5;
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
  v6 = sub_228662CDC((uint64_t)v8);

  sub_22859C828((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  _TtC11WorkoutCore21MultisportTransitions *v2;
  void *v3;

  v2 = self;
  sub_228662F64();

  v3 = (void *)sub_22874C7C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11WorkoutCore21MultisportTransitions)init
{
  _TtC11WorkoutCore21MultisportTransitions *result;

  result = (_TtC11WorkoutCore21MultisportTransitions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore21MultisportTransitions__shouldTrackTransitions;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25598F2E8);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11WorkoutCore21MultisportTransitions__automaticallySwitchLegs, v4);
}

@end
