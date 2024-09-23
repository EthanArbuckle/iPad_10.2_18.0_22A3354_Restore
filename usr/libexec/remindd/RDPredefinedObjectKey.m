@implementation RDPredefinedObjectKey

- (BOOL)isEqual:(id)a3
{
  _TtC7remindd21RDPredefinedObjectKey *v5;
  uint64_t v6;
  _TtC7remindd21RDPredefinedObjectKey *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1005B860C((uint64_t)v10);

  sub_1000F4294((uint64_t)v10);
  return v8 & 1;
}

- (int64_t)hash
{
  _TtC7remindd21RDPredefinedObjectKey *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  v3 = NSObject.hashValue.getter();
  v4 = NSObject.hashValue.getter();

  return v4 ^ v3;
}

- (NSString)description
{
  _TtC7remindd21RDPredefinedObjectKey *v2;
  NSString v3;

  v2 = self;
  sub_1005B8844();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC7remindd21RDPredefinedObjectKey)init
{
  _TtC7remindd21RDPredefinedObjectKey *result;

  result = (_TtC7remindd21RDPredefinedObjectKey *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDPredefinedObjectKey", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
