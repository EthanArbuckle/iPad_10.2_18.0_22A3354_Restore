@implementation GamePolicyToolCoordinator

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC11gamepolicyd25GamePolicyToolCoordinator *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10000C71C(v7);

  return v9 & 1;
}

- (_TtC11gamepolicyd25GamePolicyToolCoordinator)init
{
  _TtC11gamepolicyd25GamePolicyToolCoordinator *result;

  result = (_TtC11gamepolicyd25GamePolicyToolCoordinator *)_swift_stdlib_reportUnimplementedInitializer("gamepolicyd.GamePolicyToolCoordinator", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_toolProxies));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11gamepolicyd25GamePolicyToolCoordinator_privilegedToolProxies));
}

@end
