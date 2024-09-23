@implementation Occurrence

- (int64_t)hash
{
  _TtC11WorkoutCore10Occurrence *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_2285A49D0();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC11WorkoutCore10Occurrence *v4;
  _TtC11WorkoutCore10Occurrence *v5;
  char v6;
  void *v8;
  _BYTE v9[24];
  uint64_t v10;
  _OWORD v11[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22874CC7C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_2285A5498((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_22859C828((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for Occurrence();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  v6 = sub_2285A54E0((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_22859C828((uint64_t)v11);
  return v6 & 1;
}

- (NSString)description
{
  _TtC11WorkoutCore10Occurrence *v2;
  void *v3;

  v2 = self;
  sub_2285A4CEC();

  v3 = (void *)sub_22874C7C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11WorkoutCore10Occurrence)init
{
  _TtC11WorkoutCore10Occurrence *result;

  result = (_TtC11WorkoutCore10Occurrence *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC11WorkoutCore10Occurrence_countModificationDate;
  v4 = sub_22874BCB0();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11WorkoutCore10Occurrence_creationDate, v4);
  v5((char *)self + OBJC_IVAR____TtC11WorkoutCore10Occurrence_modificationDate, v4);
}

@end
