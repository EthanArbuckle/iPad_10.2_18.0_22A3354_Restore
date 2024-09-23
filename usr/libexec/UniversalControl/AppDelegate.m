@implementation AppDelegate

- (_TtC20UniversalControl_iOS11AppDelegate)init
{
  return (_TtC20UniversalControl_iOS11AppDelegate *)sub_100007BE8();
}

- (void)applicationDidFinishLaunching:(id)a3
{
  id v4;
  _TtC20UniversalControl_iOS11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  j___s13EnsembleAgent0B0C6sharedACvau();

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  _TtC20UniversalControl_iOS11AppDelegate *v11;

  if (a4)
  {
    type metadata accessor for LaunchOptionsKey();
    v8 = v7;
    v9 = sub_100008834();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  sub_100007DD8();

  swift_bridgeObjectRelease();
  return 1;
}

- (void)application:(id)a3 didFinishLaunchingSuspendedWithOptions:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  _TtC20UniversalControl_iOS11AppDelegate *v11;

  if (a4)
  {
    type metadata accessor for LaunchOptionsKey();
    v8 = v7;
    v9 = sub_100008834();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  j___s13EnsembleAgent0B0C6sharedACvau();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20UniversalControl_iOS11AppDelegate_eventConnection));
}

@end
