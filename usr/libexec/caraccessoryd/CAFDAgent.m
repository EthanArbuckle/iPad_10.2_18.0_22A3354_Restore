@implementation CAFDAgent

- (_TtC13caraccessoryd9CAFDAgent)init
{
  _TtC13caraccessoryd9CAFDAgent *result;

  result = (_TtC13caraccessoryd9CAFDAgent *)_swift_stdlib_reportUnimplementedInitializer("caraccessoryd.CAFDAgent", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of CAFDAgent.Configuration((uint64_t)self + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_connections));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  _TtC13caraccessoryd9CAFDAgent *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  specialized CAFDAgent.listener(_:didReceive:withContext:)(v9);

  swift_unknownObjectRelease(a5);
}

- (NSString)domain
{
  char *v2;
  uint64_t v3;
  NSString v4;

  v2 = (char *)self + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration;
  v3 = *(_QWORD *)&v2[*(int *)(type metadata accessor for CAFDAgent.Configuration(0) + 36) + 8];
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

@end
