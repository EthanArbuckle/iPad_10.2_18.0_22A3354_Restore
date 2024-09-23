@implementation BTFindingTrampoline

- (void)start:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC12searchpartyd19BTFindingTrampoline *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1010B0BB0, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  v13 = self;
  sub_100BADA5C((uint64_t)v10, (uint64_t)sub_10001D1EC, v12);
  swift_release();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)startFastAdvertisingForBeacon:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC12searchpartyd19BTFindingTrampoline *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1010B0AC0, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  v13 = self;
  sub_100BAF194((uint64_t)v10, (uint64_t)sub_10001D1EC, v12);
  swift_release();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)stopFastAdvertisingForBeacon:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC12searchpartyd19BTFindingTrampoline *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1010B0A70, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  v13 = self;
  sub_100BAF5BC((uint64_t)v10, (uint64_t)sub_10001D1EC, v12);
  swift_release();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)stop:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC12searchpartyd19BTFindingTrampoline *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1010B09F8, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  v13 = self;
  sub_100BAFA3C((uint64_t)v10, (uint64_t)sub_10001D1EC, v12);
  swift_release();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)updateConfig:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC12searchpartyd19BTFindingTrampoline *v8;
  id v9;

  v6 = _Block_copy(a4);
  v7 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation + 16]);
  _Block_copy(v6);
  v9 = a3;
  v8 = self;
  sub_100BB0E40(v9, v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC12searchpartyd19BTFindingTrampoline)init
{
  _TtC12searchpartyd19BTFindingTrampoline *result;

  result = (_TtC12searchpartyd19BTFindingTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.BTFindingTrampoline", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd19BTFindingTrampoline_implementation));
}

@end
