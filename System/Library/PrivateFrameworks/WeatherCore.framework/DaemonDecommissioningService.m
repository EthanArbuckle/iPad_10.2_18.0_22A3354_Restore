@implementation DaemonDecommissioningService

- (_TtC11WeatherCore28DaemonDecommissioningService)init
{
  DaemonDecommissioningService.init()();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC11WeatherCore28DaemonDecommissioningService *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = DaemonDecommissioningService.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v8, (NSXPCConnection)v7);

  return v9;
}

- (void)decommissionWith:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC11WeatherCore28DaemonDecommissioningService *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  DaemonDecommissioningService.decommission(with:)((uint64_t)sub_1B0156FA4, v5);

  swift_release();
}

@end
