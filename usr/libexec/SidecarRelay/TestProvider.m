@implementation TestProvider

- (void)relayRegisterServiceProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12SidecarRelay12TestProvider *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100087B80, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100052CD0((uint64_t)sub_100012CAC, v5);

  swift_release(v5);
}

- (void)relaySessionOpen:(id)a3 reconnect:(id)a4 serviceIdentifier:(id)a5 destination:(id)a6 transport:(int64_t)a7 completion:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _TtC12SidecarRelay12TestProvider *v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;

  v32 = a7;
  v14 = sub_100010F40(&qword_1000918F8);
  __chkstk_darwin(v14);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for UUID(0);
  v31 = *(_QWORD *)(v17 - 8);
  v18 = __chkstk_darwin(v17);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v31 - v21;
  v23 = _Block_copy(a8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  sub_1000124AC((uint64_t)v16, v24, 1, v17);
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v27 = v26;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v28 = swift_allocObject(&unk_100087B58, 24, 7);
  *(_QWORD *)(v28 + 16) = v23;
  v29 = self;
  sub_100052E04((uint64_t)v22, (uint64_t)v16, v25, v27, (uint64_t)v20, v32, (uint64_t)sub_1000123C8, v28);

  swift_bridgeObjectRelease();
  swift_release(v28);
  v30 = *(void (**)(char *, uint64_t))(v31 + 8);
  v30(v20, v17);
  sub_10004A058((uint64_t)v16);
  v30(v22, v17);
}

- (void).cxx_destruct
{
  sub_1000536BC((uint64_t)self, OBJC_IVAR____TtC12SidecarRelay12TestProvider_testDevice);
}

@end
