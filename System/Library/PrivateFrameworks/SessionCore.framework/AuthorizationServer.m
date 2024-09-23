@implementation AuthorizationServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC11SessionCore19AuthorizationServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C1422AA8(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore19AuthorizationServer)init
{
  _TtC11SessionCore19AuthorizationServer *result;

  result = (_TtC11SessionCore19AuthorizationServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore19AuthorizationServer_requestProcessingQueue));

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
