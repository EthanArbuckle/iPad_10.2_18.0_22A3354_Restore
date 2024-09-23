@implementation ShelfContentTypeSet

- (int64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  _TtC8ShelfKit19ShelfContentTypeSet *v5;
  int64_t v6;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit19ShelfContentTypeSet_contents);
  v4 = sub_1FE0C4();
  v5 = self;
  v6 = Set.hashValue.getter(v3, &type metadata for ShelfContentType, v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8ShelfKit19ShelfContentTypeSet *v5;
  _TtC8ShelfKit19ShelfContentTypeSet *v6;
  char v7;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = sub_1F9888((uint64_t)v9);

  sub_1459C((uint64_t)v9, (uint64_t *)&unk_3BC540);
  return v7 & 1;
}

- (NSString)debugDescription
{
  return (NSString *)sub_1F9BC0((char *)self, (uint64_t)a2, (void (*)(uint64_t, ValueMetadata *, unint64_t))&Set.debugDescription.getter);
}

- (NSString)description
{
  return (NSString *)sub_1F9BC0((char *)self, (uint64_t)a2, (void (*)(uint64_t, ValueMetadata *, unint64_t))&Set.description.getter);
}

- (_TtC8ShelfKit19ShelfContentTypeSet)init
{
  _TtC8ShelfKit19ShelfContentTypeSet *result;

  result = (_TtC8ShelfKit19ShelfContentTypeSet *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.ShelfContentTypeSet", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit19ShelfContentTypeSet_contents));
}

@end
