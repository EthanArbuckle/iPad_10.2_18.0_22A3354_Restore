@implementation RemoteProvider

- (void)configuratorProxyWithReply:(id)a3
{
  sub_100008EAC(self, (int)a2, a3, (void (*)(void))sub_1000096DC);
}

- (void)monitorProxyWithReply:(id)a3
{
  sub_100008EAC(self, (int)a2, a3, (void (*)(void))sub_1000098A0);
}

- (void)readerProxyWithReply:(id)a3
{
  sub_100008EAC(self, (int)a2, a3, (void (*)(void))sub_100009A64);
}

- (void)pinControllerProxyWithReply:(id)a3
{
  sub_100008EAC(self, (int)a2, a3, (void (*)(void))sub_100009C28);
}

- (void)oasisReaderProxyWithReply:(id)a3
{
  sub_100008EAC(self, (int)a2, a3, (void (*)(void))sub_100009DFC);
}

- (_TtC14softposreaderd14RemoteProvider)init
{
  _TtC14softposreaderd14RemoteProvider *result;

  result = (_TtC14softposreaderd14RemoteProvider *)_swift_stdlib_reportUnimplementedInitializer("softposreaderd.RemoteProvider", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd14RemoteProvider_instance));
}

@end
