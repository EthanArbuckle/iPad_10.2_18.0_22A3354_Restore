@implementation AgentXPCConnection

- (_TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCConnection)init
{
  sub_249766DE0();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCConnection_connection));
  v3 = (char *)self + OBJC_IVAR____TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCConnection_logger;
  v4 = sub_249836B14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCConnection_adminProxy));
  sub_24976CC9C((uint64_t)self + OBJC_IVAR____TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCConnection_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16UniversalControlP33_22B26D9AC92D4CC25624F8FC3B914ED518AgentXPCConnection_error));
}

- (void)xpcGetEdgesWithCompletion:(id)a3
{
  sub_24976912C((int)self, (int)a2, a3);
}

- (void)xpcAdminInterfaceWithCompletion:(id)a3
{
  sub_24976912C((int)self, (int)a2, a3);
}

@end
