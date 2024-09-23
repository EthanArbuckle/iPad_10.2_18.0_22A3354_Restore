@implementation ServicePresenter

- (void)relayRegisterServicePresenter:(id)a3
{
  void *v4;
  _TtC12SidecarRelay16ServicePresenter *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1000493DC((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);

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
  uint64_t v26;
  uint64_t v27;
  _TtC12SidecarRelay16ServicePresenter *v28;
  void (*v29)(char *, uint64_t);
  _TtC12SidecarRelay16ServicePresenter *v30;
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
  sub_100049610((uint64_t)v22, (uint64_t)v15, v25, v27, (uint64_t)v20, v31, (uint64_t)v28, (void (**)(_QWORD, _QWORD))v23);
  _Block_release(v23);

  swift_bridgeObjectRelease(v27);
  v29 = *(void (**)(char *, uint64_t))(v17 + 8);
  v29(v20, v16);
  sub_10004A058((uint64_t)v15);
  v29(v22, v16);
}

- (void)relayPresenterStartServiceExtension:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _TtC12SidecarRelay16ServicePresenter *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_1000876A8, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  sub_100049A2C(v7, v9, (uint64_t)sub_1000123C8, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)relayPresenterServiceExtensionReady:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12SidecarRelay16ServicePresenter *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100049D20((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)relayServicePresenterReady:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC12SidecarRelay16ServicePresenter *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100087770, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_10004D9AC((void (*)(char *, uint64_t))a3);

  swift_release(v7);
}

@end
