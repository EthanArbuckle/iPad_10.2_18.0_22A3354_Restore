@implementation UnknownDiscoveryTrampoline

- (void)startUnknownDiscoveryWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd26UnknownDiscoveryTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_101091760, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1002E27B4((uint64_t)sub_10001D1EC, v5);

  swift_release();
}

- (void)startDiscoveryWithScanRate:(int64_t)a3 timeout:(double)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  _TtC12searchpartyd26UnknownDiscoveryTrampoline *v8;

  v6 = _Block_copy(a5);
  v7 = swift_allocObject(&unk_101091738, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_1002E27B4((uint64_t)sub_10001D1EC, v7);

  swift_release();
}

- (void)stopUnknownDiscoveryWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd26UnknownDiscoveryTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_101091710, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1002E2E64((uint64_t)sub_10001D1F0, v5);

  swift_release();
}

- (void)fetchEncryptedPayloadForUnknownBeacon:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC12searchpartyd26UnknownDiscoveryTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1010916E8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1002E3518(v8, (uint64_t)sub_10059A098, v7);

  swift_release();
}

- (_TtC12searchpartyd26UnknownDiscoveryTrampoline)init
{
  _TtC12searchpartyd26UnknownDiscoveryTrampoline *result;

  result = (_TtC12searchpartyd26UnknownDiscoveryTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.UnknownDiscoveryTrampoline", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd26UnknownDiscoveryTrampoline_implementation));
}

@end
