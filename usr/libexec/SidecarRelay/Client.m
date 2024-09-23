@implementation Client

- (_TtC12SidecarRelay6Client)init
{
  sub_100009E90();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SidecarRelay6Client_sessionIdentities));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SidecarRelay6Client_streams));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12SidecarRelay6Client_streamListeners));
}

- (void)relaySession:(id)a3 openedByDevice:(id)a4 dataLink:(int64_t)a5 service:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC12SidecarRelay6Client *v17;
  uint64_t v18;

  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v15 = v14;
  v16 = a4;
  v17 = self;
  sub_10000A018();

  swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)relaySession:(int64_t)a3 closedWithError:(id)a4
{
  _TtC12SidecarRelay6Client *v5;
  id v6;

  v5 = self;
  v6 = a4;
  sub_10000A17C();

}

- (void)relaySession:(int64_t)a3 receivedOPACKData:(id)a4 dataLink:(int64_t)a5
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC12SidecarRelay6Client *v11;

  v7 = a4;
  v11 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;

  sub_10000A428();
  sub_100006C30(v8, v10);

}

- (void)relaySession:(int64_t)a3 stream:(id)a4 status:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC12SidecarRelay6Client *v11;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = self;
  sub_10000A73C(a3, v8, v10, a5);

  swift_bridgeObjectRelease(v10);
}

- (void)relayPresenterStartServiceExtension:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12SidecarRelay6Client *v10;

  v6 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = swift_allocObject(&unk_100085F10, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v10 = self;
  sub_10000A824();

  swift_bridgeObjectRelease(v8);
  swift_release(v9);
}

- (void)relayPresenterServiceExtensionReady:(id)a3
{
  sub_10000BA04(self, (uint64_t)a2, (uint64_t)a3);
}

- (void)relayTerminateService
{
  _TtC12SidecarRelay6Client *v2;

  v2 = self;
  sub_10000AA68();

}

- (void)relayIgnoreDetectionForAnchorIdentifier:(id)a3 completion:(id)a4
{
  sub_10000AE00();
}

- (void)relayFetchRemoteDisplaySendingDeviceStatesWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12SidecarRelay6Client *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100085E70, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10000ABF0();

  swift_release(v5);
}

- (void)relayIssueRemoteDisplayConnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  sub_10000AE00();
}

- (void)relayIssueRemoteDisplayDisconnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  sub_10000AE00();
}

- (void)relayFetchDeviceReadinessStatusWithIDSIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC12SidecarRelay6Client *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_100085D80, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  sub_10000B0A8(v7, v9, (uint64_t)sub_100012CAC, v10, (SEL *)&selRef_fetchDeviceReadinessStatusWithIDSIdentifier_completion_, (uint64_t (*)(uint64_t, uint64_t))&String._bridgeToObjectiveC());

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)relayDelegateSendDataRequest:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC12SidecarRelay6Client *v12;

  v6 = _Block_copy(a4);
  v7 = a3;
  v12 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  v11 = swift_allocObject(&unk_100085D30, 24, 7);
  *(_QWORD *)(v11 + 16) = v6;
  sub_10000B0A8(v8, v10, (uint64_t)sub_1000125C0, v11, (SEL *)&selRef_sendDataRequest_completion_, (uint64_t (*)(uint64_t, uint64_t))&Data._bridgeToObjectiveC());
  swift_release(v11);
  sub_100006C30(v8, v10);

}

- (void)relayRegisterServiceProvider:(id)a3
{
  sub_1000103B4(self, (int)a2, a3, (void (*)(void))sub_10000B290);
}

- (void)relayRegisterServicePresenter:(id)a3
{
  sub_1000103B4(self, (int)a2, a3, (void (*)(void))sub_10000B40C);
}

- (void)relayServicePresenterReady:(int64_t)a3 completion:(id)a4
{
  sub_10000FFF4(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_10000B610);
}

- (void)relayServiceProviderReady:(id)a3
{
  sub_10000BA04(self, (uint64_t)a2, (uint64_t)a3);
}

- (void)relayOptOutOfReconnect:(id)a3
{
  sub_1000103B4(self, (int)a2, a3, (void (*)(void))sub_10000BA8C);
}

- (void)relayDevicesForServiceIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _TtC12SidecarRelay6Client *v10;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_10000BAC8(v7, v9, v10, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (void)relaySessionOpen:(id)a3 reconnect:(id)a4 serviceIdentifier:(id)a5 destination:(id)a6 transport:(int64_t)a7 completion:(id)a8
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  void (*v27)(char *, uint64_t);
  _TtC12SidecarRelay6Client *v28;
  void (*v29)(char *, uint64_t);
  _TtC12SidecarRelay6Client *v30;
  uint64_t v31;

  v30 = self;
  v31 = a7;
  v13 = sub_100010F40(&qword_1000918F8);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for UUID(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v30 - v21;
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
  sub_1000124AC((uint64_t)v15, v24, 1, v16);
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v27 = v26;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a6);
  _Block_copy(v23);
  v28 = v30;
  sub_10000BF9C((uint64_t)v22, (uint64_t)v15, v25, v27, (uint64_t)v20, v31, v28, (void (**)(_QWORD, _QWORD))v23);
  _Block_release(v23);

  swift_bridgeObjectRelease(v27);
  v29 = *(void (**)(char *, uint64_t))(v17 + 8);
  v29(v20, v16);
  sub_1000126F4((uint64_t)v15, &qword_1000918F8);
  v29(v22, v16);
}

- (void)relaySessionClose:(int64_t)a3 error:(id)a4 completion:(id)a5
{
  void *v8;
  _TtC12SidecarRelay6Client *v9;
  id v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = self;
  v10 = a4;
  sub_10000D354(a3, (uint64_t)a4, v9, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);

}

- (void)relaySessionDealloc:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC12SidecarRelay6Client *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_10000D80C((uint64_t)v10, v12, (void (**)(_QWORD, _QWORD))v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)relaySession:(int64_t)a3 sendOPACKData:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC12SidecarRelay6Client *v13;

  v8 = _Block_copy(a5);
  v9 = a4;
  v13 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;

  _Block_copy(v8);
  sub_10000DD7C(a3, v10, v12, v13, v8);
  _Block_release(v8);
  sub_100006C30(v10, v12);

}

- (void)relaySession:(int64_t)a3 connectStreamType:(int64_t)a4 flags:(int64_t)a5 identifier:(id)a6 processUniqueID:(unint64_t)a7 completion:(id)a8
{
  sub_10000F57C((uint64_t)self, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, a7, (uint64_t)a8, (void (*)(uint64_t))sub_10000E29C);
}

- (void)relaySession:(int64_t)a3 listenStreamType:(int64_t)a4 flags:(int64_t)a5 identifier:(id)a6 processUniqueID:(unint64_t)a7 completion:(id)a8
{
  sub_10000F57C((uint64_t)self, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, a7, (uint64_t)a8, (void (*)(uint64_t))sub_10000ED88);
}

- (void)relaySession:(int64_t)a3 closeStream:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  _TtC12SidecarRelay6Client *v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v6 = v5;
  v7 = self;
  sub_10000F624();

  swift_bridgeObjectRelease(v6);
}

- (void)relaySession:(int64_t)a3 timeSyncWithCompletion:(id)a4
{
  sub_10000FFF4(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_10000F894);
}

- (void)relayDiagnose:(id)a3
{
  sub_1000103B4(self, (int)a2, a3, (void (*)(void))sub_10001004C);
}

@end
