@implementation ClassKitContextBuilder

- (_TtC8Podcasts22ClassKitContextBuilder)init
{
  id v3;
  id v4;
  _TtC8Podcasts22ClassKitContextBuilder *v5;
  uint64_t v6;
  uint64_t ObjectType;

  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MediaRequestController(0)), "init");
  v4 = objc_allocWithZone((Class)type metadata accessor for ClassKitContextBuilder());
  v5 = (_TtC8Podcasts22ClassKitContextBuilder *)sub_10032522C(v3);

  ObjectType = swift_getObjectType(self, v6);
  swift_deallocPartialClassInstance(self, ObjectType, 24, 7);
  return v5;
}

- (id)createContextForIdentifier:(id)a3 parentContext:(id)a4 parentIdentifierPath:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  id v12;
  _TtC8Podcasts22ClassKitContextBuilder *v13;
  void *v14;
  void *v15;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  v12 = a4;
  v13 = self;
  sub_1003253E8(v8, v10, v11);
  v15 = v14;

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v11);
  return v15;
}

- (void).cxx_destruct
{

}

@end
