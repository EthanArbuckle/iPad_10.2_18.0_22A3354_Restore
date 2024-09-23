@implementation LyonExternal

+ (_TtC10seserviced12LyonExternal)shared
{
  if (qword_100344748 != -1)
    swift_once(&qword_100344748, sub_1001E052C);
  return (_TtC10seserviced12LyonExternal *)(id)qword_100354E50;
}

- (id)getAllEndpoints
{
  uint64_t v2;
  Class isa;

  v2 = sub_1001E0A34((uint64_t)self, (uint64_t)a2);
  sub_1000EB1A0();
  sub_10007EFD8();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (BOOL)blockRangingForReaderIdentifierWithReaderIdentifier:(id)a3 timeout:(double)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC10seserviced12LyonExternal *v10;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = self;
  sub_1001E0AEC(v7, v9, a4);
  swift_bridgeObjectRelease(v9);

  return 1;
}

- (BOOL)unblockRangingForReaderIdentifierWithReaderIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC10seserviced12LyonExternal *v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  sub_1001E0C34(v5, v7);
  swift_bridgeObjectRelease(v7);

  return 1;
}

- (id)getSupportedLyonVersions
{
  unint64_t v2;
  Class isa;

  v2 = sub_1001E0D6C();
  sub_100063D3C(&qword_10034A288);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (BOOL)updatePreArmState:(BOOL)a3 for:(id)a4 error:(id *)a5
{
  id v7;
  _TtC10seserviced12LyonExternal *v8;

  v7 = a4;
  v8 = self;
  sub_1001E0F64(a3, (uint64_t)v7);

  return 1;
}

- (void)updatePassSelectionState:(BOOL)a3
{
  sub_1001E10A4(a3);
}

- (_TtC10seserviced12LyonExternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[LyonExternal init](&v3, "init");
}

@end
