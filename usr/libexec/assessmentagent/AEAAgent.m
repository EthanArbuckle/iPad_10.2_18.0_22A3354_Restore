@implementation AEAAgent

- (void)dealloc
{
  void *v2;
  _TtC15assessmentagent8AEAAgent *v3;
  uint64_t v4;
  objc_super v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15assessmentagent8AEAAgent_sourceRegisteringXPCListener);
  v3 = self;
  objc_msgSend(v2, "invalidate");
  v4 = *(uint64_t *)((char *)&v3->super.isa + OBJC_IVAR____TtC15assessmentagent8AEAAgent_sigtermSourceSignal);
  swift_getObjectType(v4);
  swift_unknownObjectRetain(v4);
  OS_dispatch_source.cancel()();
  swift_unknownObjectRelease(v4);
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for AEAAgent();
  -[AEAAgent dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  sub_10001B9A8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15assessmentagent8AEAAgent_args));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC15assessmentagent8AEAAgent_sigtermSourceSignal));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15assessmentagent8AEAAgent_taskQueue));
  sub_10001B9D4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15assessmentagent8AEAAgent_taskSource));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC15assessmentagent8AEAAgent_languagePreferencesChangedObservation));
}

- (_TtC15assessmentagent8AEAAgent)init
{
  _TtC15assessmentagent8AEAAgent *result;

  result = (_TtC15assessmentagent8AEAAgent *)_swift_stdlib_reportUnimplementedInitializer("assessmentagent.AEAAgent", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC15assessmentagent8AEAAgent *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10001B7A4(v7);

  return v9 & 1;
}

- (void)registerPublisherWithLifetimeEndpoint:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC15assessmentagent8AEAAgent *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1000835C0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_100019C20(v8, (uint64_t)sub_10001AC7C, v7);

  swift_release(v7);
}

@end
