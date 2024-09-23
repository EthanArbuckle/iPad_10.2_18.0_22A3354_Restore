@implementation SidecarRelayIntermediateDelegate

- (void)dealloc
{
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v2;

  v2 = self;
  sub_10001D538();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12SidecarRelay32SidecarRelayIntermediateDelegate_companionLinkDeviceDetector));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12SidecarRelay32SidecarRelayIntermediateDelegate_loadedRelayDelegate));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12SidecarRelay32SidecarRelayIntermediateDelegate_companionLinkDeviceDiscoveryProxy));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12SidecarRelay32SidecarRelayIntermediateDelegate_remoteDisplaySendingDevicesManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12SidecarRelay32SidecarRelayIntermediateDelegate_relayProxy));
}

- (_TtC12SidecarRelay32SidecarRelayIntermediateDelegate)init
{
  sub_10001D61C();
}

- (void)setRelayProxy:(id)a3
{
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10001D674(a3);
  swift_unknownObjectRelease(a3);

}

- (void)relayInitialized
{
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v2;

  v2 = self;
  sub_10001DA10();

}

- (void)ignoreDetectionForAnchorIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10001DB48((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)setDevicesAreNearby:(BOOL)a3
{
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v4;

  v4 = self;
  sub_10001E028(a3);

}

- (void)setRemoteDisplaySessionExists:(BOOL)a3
{
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v4;

  v4 = self;
  sub_10001E080(a3);

}

- (BOOL)handleRapportEvent:(id)a3
{
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v5;
  char v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = sub_10001E0D8(a3);
  swift_unknownObjectRelease(a3);

  return v6 & 1;
}

- (void)fetchRemoteDisplaySendingDeviceStatesWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100086A30, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10001E500((void (*)(uint64_t, id))sub_1000125C8);

  swift_release(v5);
}

- (void)issueRemoteDisplayConnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  sub_10001E6CC(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_100086A08, (void (*)(void))sub_100012CAC, (void (*)(uint64_t, void (*)(void), uint64_t))sub_10001AB78);
}

- (void)issueRemoteDisplayDisconnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  sub_10001E6CC(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_1000869E0, (void (*)(void))sub_1000123C8, (void (*)(uint64_t, void (*)(void), uint64_t))sub_10001BC64);
}

- (void)ignoreDetectionOfAnchorWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_10001E7A8((uint64_t)v10, (uint64_t)v12, (void (**)(_QWORD, _QWORD))v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)sendDataRequest:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v12;

  v6 = _Block_copy(a4);
  v7 = a3;
  v12 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  v11 = swift_allocObject(&unk_100086990, 24, 7);
  *(_QWORD *)(v11 + 16) = v6;
  sub_10001E8FC(v8, v10, (uint64_t)sub_1000125C0, v11);
  swift_release(v11);
  sub_100006C30(v8, v10);

}

- (id)overridePresenterLaunchOptions:(id)a3
{
  uint64_t v4;
  _TtC12SidecarRelay32SidecarRelayIntermediateDelegate *v5;
  uint64_t v6;
  Class isa;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v5 = self;
  v6 = sub_10001EA9C(v4);

  swift_bridgeObjectRelease(v4);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

@end
