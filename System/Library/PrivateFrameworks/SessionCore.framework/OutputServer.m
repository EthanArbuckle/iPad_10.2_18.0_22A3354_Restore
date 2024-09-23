@implementation OutputServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC11SessionCore12OutputServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C132EC10(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore12OutputServer)init
{
  _TtC11SessionCore12OutputServer *result;

  result = (_TtC11SessionCore12OutputServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore12OutputServer_processManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore12OutputServer_knownClientStore);

}

@end
