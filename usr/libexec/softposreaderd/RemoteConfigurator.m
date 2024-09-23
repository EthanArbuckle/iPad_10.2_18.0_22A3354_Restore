@implementation RemoteConfigurator

- (void)prepareAndWarnWithToken:(id)a3 force:(BOOL)a4 enableStoreAndForward:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v10;
  uint64_t v11;
  void *v12;
  _TtC14softposreaderd18RemoteConfigurator *v13;

  v6 = a5;
  v7 = a4;
  v10 = _Block_copy(a6);
  if (a3)
  {
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v12;
  }
  else
  {
    v11 = 0;
  }
  _Block_copy(v10);
  v13 = self;
  sub_100007F54(v11, (uint64_t)a3, v7, v6, (uint64_t)v13, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease(a3);
}

- (void)installWithToken:(id)a3 force:(BOOL)a4 delegate:(id)a5 reply:(id)a6
{
  _BOOL8 v7;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, _BOOL8, id, void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t);
  _TtC14softposreaderd18RemoteConfigurator *v18;

  v7 = a4;
  v10 = _Block_copy(a6);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  v14 = swift_allocObject(&unk_100196578, 24, 7);
  *(_QWORD *)(v14 + 16) = v10;
  v15 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance + 16];
  v16 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance), v15);
  v17 = *(void (**)(uint64_t, uint64_t, _BOOL8, id, void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v16 + 16);
  swift_unknownObjectRetain(a5);
  v18 = self;
  v17(v11, v13, v7, a5, sub_100007F4C, v14, v15, v16);
  swift_unknownObjectRelease(a5);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
}

- (void)statusWithToken:(id)a3 options:(int64_t)a4 reply:(id)a5
{
  void (**v8)(void *, Class, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, int64_t, uint64_t, uint64_t);
  uint64_t v15;
  Class isa;
  _TtC14softposreaderd18RemoteConfigurator *v17;

  v8 = (void (**)(void *, Class, _QWORD))_Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance + 16];
  v13 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance), v12);
  v14 = *(uint64_t (**)(uint64_t, uint64_t, int64_t, uint64_t, uint64_t))(v13 + 24);
  v17 = self;
  v15 = v14(v9, v11, a4, v12, v13);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v8[2](v8, isa, 0);
  swift_bridgeObjectRelease(v15);

  _Block_release(v8);
  swift_bridgeObjectRelease(v11);

}

- (_TtC14softposreaderd18RemoteConfigurator)init
{
  _TtC14softposreaderd18RemoteConfigurator *result;

  result = (_TtC14softposreaderd18RemoteConfigurator *)_swift_stdlib_reportUnimplementedInitializer("softposreaderd.RemoteConfigurator", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteConfigurator_instance));
}

@end
