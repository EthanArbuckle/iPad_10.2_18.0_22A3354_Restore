@implementation StateCaptureServiceServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC11SessionCore25StateCaptureServiceServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C1389AD8(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore25StateCaptureServiceServer)init
{
  _TtC11SessionCore25StateCaptureServiceServer *result;

  result = (_TtC11SessionCore25StateCaptureServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCore25StateCaptureServiceServer_requestProcessingQueue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore25StateCaptureServiceServer_stateCaptureManager);

}

- (id)stateForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _TtC11SessionCore25StateCaptureServiceServer *v8;
  void *v9;

  if (a3)
  {
    v5 = sub_1C1426A88();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = self;
  sub_1C1389450(v5, v7);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_1C1426A1C();
  swift_bridgeObjectRelease();
  return v9;
}

@end
