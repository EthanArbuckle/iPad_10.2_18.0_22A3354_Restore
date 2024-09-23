@implementation BeaconKeyBackendServiceTrampoline

- (_TtC12searchpartyd33BeaconKeyBackendServiceTrampoline)init
{
  _TtC12searchpartyd33BeaconKeyBackendServiceTrampoline *result;

  result = (_TtC12searchpartyd33BeaconKeyBackendServiceTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.BeaconKeyBackendServiceTrampoline", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd33BeaconKeyBackendServiceTrampoline_implementation));
}

- (void)setWithUserIdentifier:(id)a3 beaconsData:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  id v17;
  _TtC12searchpartyd33BeaconKeyBackendServiceTrampoline *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  void (**v27)(uint64_t);
  _TtC12searchpartyd33BeaconKeyBackendServiceTrampoline *v28;
  uint64_t v29;
  char *v30;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v29 - v14;
  v16 = _Block_copy(a5);
  v30 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = a4;
  v18 = self;
  v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v21 = v20;

  v22 = swift_allocObject(&unk_1010BBE60, 24, 7);
  *(_QWORD *)(v22 + 16) = v16;
  v29 = type metadata accessor for Transaction(0);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v23 = *(unsigned __int8 *)(v10 + 80);
  v24 = (v23 + 40) & ~v23;
  v25 = (v11 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = (char *)swift_allocObject(&unk_1010BBE88, v25 + 16, v23 | 7);
  *((_QWORD *)v26 + 2) = v19;
  *((_QWORD *)v26 + 3) = v21;
  *((_QWORD *)v26 + 4) = v18;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v26[v24], v13, v9);
  v27 = (void (**)(uint64_t))&v26[v25];
  *v27 = sub_10001D1F0;
  v27[1] = (void (*)(uint64_t))v22;
  v28 = v18;
  sub_10001BBBC(v19, v21);
  swift_retain();
  static Transaction.asyncTask(name:block:)("set(beaconsData:completion:)", 28, 2, &unk_10111CEE0, v26);
  swift_release();
  swift_release();
  sub_10001BC14(v19, v21);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v30, v9);
}

- (void)beaconInfoWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC12searchpartyd33BeaconKeyBackendServiceTrampoline *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010BBE10, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  type metadata accessor for Transaction(0);
  v6 = (_QWORD *)swift_allocObject(&unk_1010BBE38, 40, 7);
  v6[2] = self;
  v6[3] = sub_100CA2D80;
  v6[4] = v5;
  v7 = self;
  swift_retain(v5);
  static Transaction.asyncTask(name:block:)("beaconInfo()", 12, 2, &unk_10111CED0, v6);

  swift_release(v5);
  swift_release(v6);
}

- (void)beaconInfoWithBeaconIdentifierData:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd33BeaconKeyBackendServiceTrampoline *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd33BeaconKeyBackendServiceTrampoline *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = swift_allocObject(&unk_1010BBDC0, 24, 7);
  *(_QWORD *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0);
  v13 = (_QWORD *)swift_allocObject(&unk_1010BBDE8, 56, 7);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100B97EE0;
  v13[6] = v12;
  v14 = v8;
  sub_10001BBBC(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("beaconInfo(beaconIdentifier:)", 29, 2, &unk_10111CEB8, v13);
  swift_release();
  swift_release();
  sub_10001BC14(v9, v11);

}

@end
