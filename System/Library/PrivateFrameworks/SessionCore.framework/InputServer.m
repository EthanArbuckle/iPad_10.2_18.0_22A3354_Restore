@implementation InputServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC11SessionCore11InputServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C132D68C(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore11InputServer)init
{
  _TtC11SessionCore11InputServer *result;

  result = (_TtC11SessionCore11InputServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1339040((uint64_t)self + OBJC_IVAR____TtC11SessionCore11InputServer_delegate);

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore11InputServer_activityAuthorizer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore11InputServer_backoffPolicy);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore11InputServer_knownClientStore);
}

@end
