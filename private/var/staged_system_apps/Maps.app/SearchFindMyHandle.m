@implementation SearchFindMyHandle

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (id)title
{
  _TtC4Maps18SearchFindMyHandle *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = self;
  v3 = Handle.prettyName.getter();
  if (!v4)
    Handle.identifier.getter(v3);
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

- (id)handleIdentifier
{
  _TtC4Maps18SearchFindMyHandle *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  Handle.identifier.getter(v2);
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1001EE580(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC4Maps18SearchFindMyHandle_handle, (uint64_t (*)(char *, uint64_t))&static Handle.== infix(_:_:));
}

- (int64_t)hash
{
  _TtC4Maps18SearchFindMyHandle *v2;
  int64_t v3;

  v2 = self;
  v3 = Handle.hashValue.getter();

  return v3;
}

- (NSString)description
{
  return (NSString *)sub_1001EE654(self, (uint64_t)a2, (void (*)(void))sub_1001EE294);
}

- (_TtC4Maps18SearchFindMyHandle)init
{
  _TtC4Maps18SearchFindMyHandle *result;

  result = (_TtC4Maps18SearchFindMyHandle *)_swift_stdlib_reportUnimplementedInitializer("Maps.SearchFindMyHandle", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1001EE838((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps18SearchFindMyHandle_handle, (uint64_t (*)(_QWORD))&type metadata accessor for Handle, &OBJC_IVAR____TtC4Maps18SearchFindMyHandle_id);
}

@end
