@implementation PushTokenServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC11SessionCore15PushTokenServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C132B054(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore15PushTokenServer)init
{
  _TtC11SessionCore15PushTokenServer *result;

  result = (_TtC11SessionCore15PushTokenServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore15PushTokenServer_pushServer);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore15PushTokenServer_processManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore15PushTokenServer_activityStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore15PushTokenServer_authorizationManager);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
