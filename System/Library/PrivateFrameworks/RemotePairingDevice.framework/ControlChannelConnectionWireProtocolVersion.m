@implementation ControlChannelConnectionWireProtocolVersion

- (NSString)description
{
  _TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion *v2;
  void *v3;

  v2 = self;
  sub_1CF68CBE4();

  v3 = (void *)sub_1CF73EEB0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion)current
{
  return (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion *)static ControlChannelConnectionWireProtocolVersion.current.getter();
}

+ (void)setCurrent:(id)a3
{
  static ControlChannelConnectionWireProtocolVersion.current.setter(a3);
}

- (int64_t)rawValue
{
  return ControlChannelConnectionWireProtocolVersion.rawValue.getter();
}

- (_TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion)init
{
  ControlChannelConnectionWireProtocolVersion.init()();
}

@end
