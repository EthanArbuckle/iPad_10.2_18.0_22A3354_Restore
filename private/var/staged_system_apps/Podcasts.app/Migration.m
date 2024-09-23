@implementation Migration

- (NSDate)date
{
  return (NSDate *)Date._bridgeToObjectiveC()().super.isa;
}

- (NSArray)uuids
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts9Migration_uuids);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (_TtC8Podcasts9Migration)init
{
  _TtC8Podcasts9Migration *result;

  result = (_TtC8Podcasts9Migration *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.Migration", 18, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts9Migration_date;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts9Migration_uuids));
}

@end
