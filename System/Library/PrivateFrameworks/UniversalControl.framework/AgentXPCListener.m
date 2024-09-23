@implementation AgentXPCListener

- (_TtC16UniversalControl16AgentXPCListener)init
{
  return (_TtC16UniversalControl16AgentXPCListener *)AgentXPCListener.init()();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC16UniversalControl16AgentXPCListener *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  AgentXPCListener.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v8, (NSXPCConnection)v7);

  return 1;
}

- (void).cxx_destruct
{
  uint64_t v3;

  sub_24976CC9C((uint64_t)self + OBJC_IVAR____TtC16UniversalControl16AgentXPCListener_delegate);

  v3 = OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_60_0(v3);
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_53();
  swift_bridgeObjectRelease();
}

@end
