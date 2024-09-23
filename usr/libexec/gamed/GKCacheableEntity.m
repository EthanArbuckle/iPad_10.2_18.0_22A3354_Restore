@implementation GKCacheableEntity

- (NSString)debugDescription
{
  return (NSString *)sub_10018E29C(self, (uint64_t)a2, sub_10018E2E4);
}

+ (id)createWithEntityID:(id)a3 entity:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  swift_getObjCClassMetadata(a1);
  swift_unknownObjectRetain();
  v9 = (void *)sub_10018E494(v6, v8, a4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease(v8, v10);
  return v9;
}

+ (id)createWithBagKey:(id)a3 entityID:(id)a4 entity:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  swift_getObjCClassMetadata(a1);
  swift_unknownObjectRetain();
  v14 = (void *)sub_10018E55C(v8, v10, v11, v13, a5);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease(v10, v15);
  swift_bridgeObjectRelease(v13, v16);
  return v14;
}

- (_TtC14GameDaemonCore17GKCacheableEntity)init
{
  sub_10018E670();
}

- (void).cxx_destruct
{
  uint64_t v3;

  sub_100194B68((uint64_t)a2, (uint64_t)self + OBJC_IVAR____TtC14GameDaemonCore17GKCacheableEntity_id);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease(*(_QWORD *)&self->id[OBJC_IVAR____TtC14GameDaemonCore17GKCacheableEntity_bagKeyOverride], v3);
}

@end
