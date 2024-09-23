@implementation RemoteOasisRreader

- (void)provisionCardWithParameters:(id)a3 delegate:(id)a4 reply:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(id, id, void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t);
  id v13;
  _TtC14softposreaderd18RemoteOasisRreader *v14;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_100196540, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 16];
  v11 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance), v10);
  v12 = *(void (**)(id, id, void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v11 + 8);
  v13 = a3;
  swift_unknownObjectRetain(a4);
  v14 = self;
  v12(v13, a4, sub_100006564, v9, v10, v11);

  swift_unknownObjectRelease(a4);
  swift_release(v9);
}

- (void)cancelProvisionWithReply:(id)a3
{
  void (**v4)(void *, _QWORD);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _TtC14softposreaderd18RemoteOasisRreader *v8;

  v4 = (void (**)(void *, _QWORD))_Block_copy(a3);
  v5 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 16];
  v6 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance), v5);
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  v8 = self;
  v7(v5, v6);
  v4[2](v4, 0);
  _Block_release(v4);

}

- (void)checkStatusWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t);
  _TtC14softposreaderd18RemoteOasisRreader *v9;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100196518, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 16];
  v7 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance), v6);
  v8 = *(void (**)(void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v7 + 24);
  v9 = self;
  v8(sub_10000657C, v5, v6, v7);

  swift_release(v5);
}

- (_TtC14softposreaderd18RemoteOasisRreader)init
{
  _TtC14softposreaderd18RemoteOasisRreader *result;

  result = (_TtC14softposreaderd18RemoteOasisRreader *)_swift_stdlib_reportUnimplementedInitializer("softposreaderd.RemoteOasisRreader", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd18RemoteOasisRreader_instance));
}

@end
