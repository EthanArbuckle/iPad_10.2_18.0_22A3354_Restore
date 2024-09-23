@implementation SidecarRelayNullDelegate

- (_TtC12SidecarRelay24SidecarRelayNullDelegate)init
{
  sub_100006388();
}

- (void)setDevicesAreNearby:(BOOL)a3
{
  _TtC12SidecarRelay24SidecarRelayNullDelegate *v3;

  v3 = self;
  sub_100006414();

}

- (void)setRemoteDisplaySessionExists:(BOOL)a3
{
  _TtC12SidecarRelay24SidecarRelayNullDelegate *v3;

  v3 = self;
  sub_100006474();

}

- (void)setRelayProxy:(id)a3
{
  _TtC12SidecarRelay24SidecarRelayNullDelegate *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1000064D4();
  swift_unknownObjectRelease(a3);

}

- (void)relayInitialized
{
  _TtC12SidecarRelay24SidecarRelayNullDelegate *v2;

  v2 = self;
  sub_100006544();

}

- (void)ignoreDetectionForAnchorIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12SidecarRelay24SidecarRelayNullDelegate *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10000659C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)handleRapportEvent:(id)a3
{
  _TtC12SidecarRelay24SidecarRelayNullDelegate *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100006658();
  swift_unknownObjectRelease(a3);

  return 0;
}

- (void)fetchRemoteDisplaySendingDeviceStatesWithCompletion:(id)a3
{
  void *v4;
  _TtC12SidecarRelay24SidecarRelayNullDelegate *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1000066C8((uint64_t)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (void)issueRemoteDisplayConnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  sub_1000067F8(self, (uint64_t)a2, (uint64_t)a3, a4, 0xD00000000000004ELL, (void *)0x800000010006E2F0);
}

- (void)issueRemoteDisplayDisconnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  sub_1000067F8(self, (uint64_t)a2, (uint64_t)a3, a4, 0xD000000000000051, (void *)0x800000010006E290);
}

- (void)ignoreDetectionOfAnchorWithIdentifier:(id)a3 completion:(id)a4
{
  sub_1000067F8(self, (uint64_t)a2, (uint64_t)a3, a4, 0xD000000000000033, (void *)0x800000010006E250);
}

- (void)fetchDeviceReadinessStatusWithIDSIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12SidecarRelay24SidecarRelayNullDelegate *v10;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_100006950(v7, v9, (uint64_t)v10, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (void)sendDataRequest:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC12SidecarRelay24SidecarRelayNullDelegate *v11;

  v6 = _Block_copy(a4);
  v7 = a3;
  v11 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  _Block_copy(v6);
  sub_100006A38(v8, v10, (uint64_t)v11, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  sub_100006C30(v8, v10);

}

- (id)overridePresenterLaunchOptions:(id)a3
{
  uint64_t v4;
  _TtC12SidecarRelay24SidecarRelayNullDelegate *v5;
  Class isa;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v5 = self;
  sub_100006B58(v4);

  swift_bridgeObjectRelease(v4);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

@end
