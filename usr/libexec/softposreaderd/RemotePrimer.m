@implementation RemotePrimer

- (void)dealloc
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  _TtC14softposreaderd12RemotePrimer *v8;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemotePrimer_instance);
  v4 = v3[3];
  v5 = v3[4];
  sub_100005EF8(v3, v4);
  v6 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemotePrimer_isPOS);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
  v8 = self;
  v7(v6, v4, v5);
  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for RemotePrimer();
  -[RemotePrimer dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemotePrimer_instance));
}

- (void)copyConfigurationWithReply:(id)a3
{
  sub_100008EAC(self, (int)a2, a3, (void (*)(void))sub_100008F5C);
}

- (void)providerProxyWithReply:(id)a3
{
  void (**v4)(void *, _TtC14softposreaderd12RemotePrimer *);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(_QWORD *__return_ptr, uint64_t, uint64_t);
  _TtC14softposreaderd12RemotePrimer *v8;
  objc_class *v9;
  id v10;
  _TtC14softposreaderd12RemotePrimer *v11;
  objc_super v12;
  _QWORD v13[5];

  v4 = (void (**)(void *, _TtC14softposreaderd12RemotePrimer *))_Block_copy(a3);
  v5 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemotePrimer_instance + 16];
  v6 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemotePrimer_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemotePrimer_instance), v5);
  v7 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v6 + 40);
  v8 = self;
  v7(v13, v5, v6);
  v9 = (objc_class *)type metadata accessor for RemoteProvider();
  v10 = objc_allocWithZone(v9);
  sub_100008390((uint64_t)v13, (uint64_t)v10 + OBJC_IVAR____TtC14softposreaderd14RemoteProvider_instance);
  v12.receiver = v10;
  v12.super_class = v9;
  v11 = -[RemotePrimer init](&v12, "init");
  sub_100005D3C(v13);
  v4[2](v4, v11);

  _Block_release(v4);
}

- (void)secureChannelProxyWithReply:(id)a3
{
  sub_100008EAC(self, (int)a2, a3, (void (*)(void))sub_1000092B4);
}

- (_TtC14softposreaderd12RemotePrimer)init
{
  _TtC14softposreaderd12RemotePrimer *result;

  result = (_TtC14softposreaderd12RemotePrimer *)_swift_stdlib_reportUnimplementedInitializer("softposreaderd.RemotePrimer", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
