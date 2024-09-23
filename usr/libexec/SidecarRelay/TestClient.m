@implementation TestClient

- (void)relayDevicesForServiceIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _TtC12SidecarRelay10TestClient *v10;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_100052818(v7, v9, v10, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_1000536BC((uint64_t)self, OBJC_IVAR____TtC12SidecarRelay10TestClient_testDevice);
}

@end
