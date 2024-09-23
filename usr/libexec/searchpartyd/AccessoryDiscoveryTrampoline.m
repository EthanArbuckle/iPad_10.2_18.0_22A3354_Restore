@implementation AccessoryDiscoveryTrampoline

- (void)startAccessoryDiscoveryWithCompletion:(id)a3
{
  sub_1004DBAC0((char *)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_100A381EC);
}

- (void)stopAccessoryDiscoveryWithCompletion:(id)a3
{
  sub_1004DBAC0((char *)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_100A386A0);
}

- (void)initiatePairingWith:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC12searchpartyd28AccessoryDiscoveryTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10107A0E8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_100A33FD8(v8, (uint64_t)sub_10001D1F0, v7);

  swift_release();
}

- (void)startLocalFindableAccessoryDiscoveryWithCompletion:(id)a3
{
  sub_1004DBAC0((char *)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_100A38848);
}

- (void)stopLocalFindableAccessoryDiscoveryWithCompletion:(id)a3
{
  sub_1004DBAC0((char *)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_100A38B94);
}

- (void)initiatePairingAndLocateAccessoryWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (**v20)(uint64_t, uint64_t);
  _TtC12searchpartyd28AccessoryDiscoveryTrampoline *v21;
  uint64_t v22;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v22 - v12;
  v14 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = swift_allocObject(&unk_10107A098, 24, 7);
  *(_QWORD *)(v15 + 16) = v14;
  type metadata accessor for Transaction(0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v16 = *(unsigned __int8 *)(v8 + 80);
  v17 = (v16 + 16) & ~v16;
  v18 = (v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject(&unk_10107A0C0, v18 + 16, v16 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v19 + v17, v11, v7);
  v20 = (void (**)(uint64_t, uint64_t))(v19 + v18);
  *v20 = sub_1004DC164;
  v20[1] = (void (*)(uint64_t, uint64_t))v15;
  v21 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)("initiatePairingAndLocateAccessory", 33, 2, &unk_1010FD468, v19);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)pairingStatusWithRequest:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC12searchpartyd28AccessoryDiscoveryTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10107A070, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1004DBD24(v8, (uint64_t)sub_10015A53C, v7);

  swift_release();
}

- (void)finalizePairingWith:(id)a3 configuration:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC12searchpartyd28AccessoryDiscoveryTrampoline *v12;

  v8 = _Block_copy(a5);
  v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12searchpartyd28AccessoryDiscoveryTrampoline_implementation);
  _Block_copy(v8);
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_100A38E8C(v10, v11, v9, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)invalidatePairingWith:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC12searchpartyd28AccessoryDiscoveryTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12searchpartyd28AccessoryDiscoveryTrampoline_implementation);
  _Block_copy(v6);
  v8 = a3;
  v9 = self;
  sub_100A39030(v8, v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC12searchpartyd28AccessoryDiscoveryTrampoline)init
{
  _TtC12searchpartyd28AccessoryDiscoveryTrampoline *result;

  result = (_TtC12searchpartyd28AccessoryDiscoveryTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.AccessoryDiscoveryTrampoline", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd28AccessoryDiscoveryTrampoline_implementation));
}

@end
