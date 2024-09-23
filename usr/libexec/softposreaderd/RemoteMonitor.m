@implementation RemoteMonitor

- (void)signalWithEvent:(unsigned __int16)a3 component:(unsigned __int8)a4 origin:(unsigned __int8)a5 details:(id)a6 reply:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  _TtC14softposreaderd13RemoteMonitor *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = _Block_copy(a7);
  if (a6)
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a6, &type metadata for String, &type metadata for String, &protocol witness table for String);
  _Block_copy(v12);
  v13 = self;
  sub_100008268(v10, v9, v8, (unint64_t)a6, (uint64_t)v13, (uint64_t)v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_bridgeObjectRelease(a6);
}

- (_TtC14softposreaderd13RemoteMonitor)init
{
  _TtC14softposreaderd13RemoteMonitor *result;

  result = (_TtC14softposreaderd13RemoteMonitor *)_swift_stdlib_reportUnimplementedInitializer("softposreaderd.RemoteMonitor", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd13RemoteMonitor_instance));
}

@end
