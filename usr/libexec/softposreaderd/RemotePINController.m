@implementation RemotePINController

- (void)capturePINWithParameters:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;
  _TtC14softposreaderd19RemotePINController *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1000089E0((uint64_t)v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)addDigitWithCipher:(id)a3 reply:(id)a4
{
  void (**v6)(void *, _QWORD);
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC14softposreaderd19RemotePINController *v13;

  v6 = (void (**)(void *, _QWORD))_Block_copy(a4);
  v7 = a3;
  v13 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  v11 = *(_QWORD *)&v13->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 16];
  v12 = *(_QWORD *)&v13->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 24];
  sub_100005EF8((Class *)((char *)&v13->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance), v11);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v12 + 16))(v8, v10, v11, v12);
  v6[2](v6, 0);
  _Block_release(v6);
  sub_100005DE0(v8, v10);

}

- (void)removeLastDigitWithReply:(id)a3
{
  void (**v4)(void *, _QWORD);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _TtC14softposreaderd19RemotePINController *v8;

  v4 = (void (**)(void *, _QWORD))_Block_copy(a3);
  v5 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 16];
  v6 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance), v5);
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 24);
  v8 = self;
  v7(v5, v6);
  v4[2](v4, 0);
  _Block_release(v4);

}

- (void)generatePINBlockWithReply:(id)a3
{
  void *v4;
  _TtC14softposreaderd19RemotePINController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100008BA0((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)updateParameters:(id)a3 reply:(id)a4
{
  void (**v6)(void *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(id, uint64_t, uint64_t);
  _TtC14softposreaderd19RemotePINController *v10;
  id v11;

  v6 = (void (**)(void *, _QWORD))_Block_copy(a4);
  v7 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 16];
  v8 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance), v7);
  v9 = *(void (**)(id, uint64_t, uint64_t))(v8 + 48);
  v11 = a3;
  v10 = self;
  v9(v11, v7, v8);
  v6[2](v6, 0);
  _Block_release(v6);

}

- (void)cancelPINCaptureWithReply:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  _TtC14softposreaderd19RemotePINController *v9;

  v4 = (void (**)(_QWORD))_Block_copy(a3);
  v5 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 16];
  v6 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance), v5);
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 40);
  v9 = self;
  v7(v5, v6);
  v8 = *(uint64_t *)((char *)&v9->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_captureInProgress);
  *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_captureInProgress) = 0;
  swift_unknownObjectRelease(v8);
  v4[2](v4);
  _Block_release(v4);

}

- (void)verifyWithPINToken:(id)a3 reply:(id)a4
{
  void (**v6)(void *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  _TtC14softposreaderd19RemotePINController *v13;

  v6 = (void (**)(void *, _QWORD))_Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 16];
  v11 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance), v10);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v13 = self;
  v12(v7, v9, v10, v11);
  v6[2](v6, 0);
  _Block_release(v6);
  swift_bridgeObjectRelease(v9);

}

- (_TtC14softposreaderd19RemotePINController)init
{
  _TtC14softposreaderd19RemotePINController *result;

  result = (_TtC14softposreaderd19RemotePINController *)_swift_stdlib_reportUnimplementedInitializer("softposreaderd.RemotePINController", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd19RemotePINController_instance));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC14softposreaderd19RemotePINController_captureInProgress));
}

@end
