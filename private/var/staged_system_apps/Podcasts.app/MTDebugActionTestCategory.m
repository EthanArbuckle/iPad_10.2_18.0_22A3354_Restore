@implementation MTDebugActionTestCategory

- (_TtC8Podcasts25MTDebugActionTestCategory)initWithName:(id)a3 title:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  objc_super v14;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Podcasts25MTDebugActionTestCategory_name);
  *v10 = v6;
  v10[1] = v8;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Podcasts25MTDebugActionTestCategory_title);
  *v11 = v9;
  v11[1] = v12;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for MTDebugActionTestCategory();
  return -[MTDebugActionTestCategory init](&v14, "init");
}

- (_TtC8Podcasts25MTDebugActionTestCategory)init
{
  _TtC8Podcasts25MTDebugActionTestCategory *result;

  result = (_TtC8Podcasts25MTDebugActionTestCategory *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.MTDebugActionTestCategory", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC8Podcasts25MTDebugActionTestCategory_name]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC8Podcasts25MTDebugActionTestCategory_title]);
}

@end
