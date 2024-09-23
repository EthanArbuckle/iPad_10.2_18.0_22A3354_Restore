@implementation SearchHomeUserGuidesDataProvider

- (NSArray)objects
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_objects);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_objects, v6, 0, 0);
  v3 = *v2;
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setObjects:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7[24];

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_objects);
  swift_beginAccess(v5, v7, 1, 0);
  v6 = *v5;
  *v5 = v4;
  swift_bridgeObjectRelease(v6);
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_type);
}

- (void)setType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_type) = (Class)a3;
}

- (NSString)identifier
{
  return (NSString *)sub_10001B1D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_identifier);
}

- (void)setIdentifier:(id)a3
{
  sub_10001B228((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_identifier);
}

- (NSString)title
{
  return (NSString *)sub_10001B1D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_title);
}

- (void)setTitle:(id)a3
{
  sub_10001B228((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_title);
}

- (_TtC4Maps32SearchHomeUserGuidesDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  objc_super v19;

  v10 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_objects) = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_type) = (Class)a4;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_identifier);
  *v15 = v11;
  v15[1] = v13;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_title);
  *v16 = v14;
  v16[1] = v17;
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for SearchHomeUserGuidesDataProvider();
  return -[SearchHomeUserGuidesDataProvider init](&v19, "init");
}

- (id)headerAccessibilityIdentifier
{
  return String._bridgeToObjectiveC()();
}

- (_TtC4Maps32SearchHomeUserGuidesDataProvider)init
{
  _TtC4Maps32SearchHomeUserGuidesDataProvider *result;

  result = (_TtC4Maps32SearchHomeUserGuidesDataProvider *)_swift_stdlib_reportUnimplementedInitializer("Maps.SearchHomeUserGuidesDataProvider", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_objects));
  swift_bridgeObjectRelease(*(_QWORD *)&self->objects[OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_identifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->objects[OBJC_IVAR____TtC4Maps32SearchHomeUserGuidesDataProvider_title]);
}

- (void)deleteEntryAtIndex:(unint64_t)a3
{
  _TtC4Maps32SearchHomeUserGuidesDataProvider *v4;

  v4 = self;
  sub_10001B41C(a3);

}

@end
