@implementation SharedFlowPluginXPCServer.Listener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtCC14SiriKitRuntime25SharedFlowPluginXPCServer8Listener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized SharedFlowPluginXPCServer.Listener.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

- (_TtCC14SiriKitRuntime25SharedFlowPluginXPCServer8Listener)init
{
  _TtCC14SiriKitRuntime25SharedFlowPluginXPCServer8Listener *result;

  result = (_TtCC14SiriKitRuntime25SharedFlowPluginXPCServer8Listener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC14SiriKitRuntime25SharedFlowPluginXPCServer8Listener_listener));
}

@end
